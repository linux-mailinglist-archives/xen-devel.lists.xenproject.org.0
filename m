Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727A7A21A9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603205.940126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJO-0004Xr-4j; Fri, 15 Sep 2023 15:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603205.940126; Fri, 15 Sep 2023 15:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJO-0004Un-0T; Fri, 15 Sep 2023 15:00:50 +0000
Received: by outflank-mailman (input) for mailman id 603205;
 Fri, 15 Sep 2023 15:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJM-0004UV-A2
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:00:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a47306e3-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:00:45 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a47306e3-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790045;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xCdonSEcxaU4vwlQq38DDIMhFTLSIUdrwIj+TgYH0mY=;
  b=J+gUtUO1Abd0hiHosLLr/FeGhBT39vYZRXG4fufJ9XKSSmuJTBuDHmWb
   zoELZZg3M2GfYpaqxM+1tM+CuG8jVoHduzeyKNXjknoEQKbUcM4Kifc5x
   srf7wzHwPZ9HLJdUokeju3D7mnzpRDwlb2wjVQWKCSi3zrUhx5GfN1Ukq
   w=;
X-CSE-ConnectionGUID: X/kd13lbTuuvW1qLdo0dGQ==
X-CSE-MsgGUID: qYqSKn0vRF+3Dh3Y+UsXew==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 123201208
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+2eaAqLujdG83sdyFE+RG5UlxSXFcZb7ZxGr2PjKsXjdYENSgzMPz
 WNKDWCCb//ZN2H9LY8jPtmy8h5XuJHVnYM3TFdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wVjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HRmJCr
 KccIgwQcw683vuSzLXjRsZV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH54Pxh/C/
 jKuE2LRGyADD/+ZkSS/3DH3qu+UrGDGQ7IfC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQv3
 0WMlsnkBhRutqOUUnOX8rqIrTK0NjMRJGVEbigBJSMH6t/vupAujTrAS99iFOi+ididJN3r6
 2nU9m5k3exV1JNVkfzhpjgrng5AuLD5CQ05v17TVF648x1GPZeBa4vw5XfiuKMowJmicnGNu
 30Nms675e8IDI2QmCHlfNjhDI1F9N7ebmSC3AcH840Jsm30piX9Jdw4DCRWfh8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZLl/vEMJGPxT4M4XRfK8EyPtXB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTPOCHMF+xeYQTXPojVCZ9oRi2Pq
 76z0OPQkH1ivBDWOHGLoeb/03hURZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxsxoehPz1
 ijlACdwkQOv7UAr3C3WMhiPnpuzB8cgxZ/6VARwVWuVN48LOtr3tv1GJsFmLdHKNoVLlJZJc
 hXMQO3Yatwnd9gN0211gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:U6LJRaHe1nY8ivoQpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:NKOnB2xbek+JuNT5Eg/BBgUkXcMpKybZxkvNPlGHUH9NRLrNRXCprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AsLimug4mqFX8qBCnJEKIsQ0txoxx0r2VK0ZVj68?=
 =?us-ascii?q?o+JKoNXdBeAqGvDmoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="123201208"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 0/9] x86/spec-ctrl: AMD DIV fix, and VERW prerequisite bugfixes
Date: Fri, 15 Sep 2023 16:00:29 +0100
Message-ID: <20230915150038.602577-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 9 is the XSA-439 fix for the AMD DIV issue, disclosed insufficiently
ahead of August 8th for us to prepare a fix for the embargo.

Patches 1 thru 8 are prerequisites, identified while trying to write patch 9.

All 9 patches are for all security trees.

Andrew Cooper (9):
  x86/spec-ctrl: Fix confusion between SPEC_CTRL_EXIT_TO_XEN{,_IST}
  x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into it's single user
  x86/spec-ctrl: Turn the remaining SPEC_CTRL_{ENTRY,EXIT}_* into asm
    macros
  x86/spec-ctrl: Improve all SPEC_CTRL_{ENTER,EXIT}_* comments
  x86/entry: Adjust restore_all_xen to hold stack_end in %r14
  x86/entry: Track the IST-ness of an entry for the exit paths
  x86/spec-ctrl: Issue VERW during IST exit to Xen
  x86/amd: Introduce is_zen{1,2}_uarch() predicates
  x86/spec-ctrl: Mitigate the Zen1 DIV leakge

 docs/misc/xen-command-line.pandoc        |   6 +-
 xen/arch/x86/cpu/amd.c                   |  18 +--
 xen/arch/x86/hvm/svm/entry.S             |   1 +
 xen/arch/x86/include/asm/amd.h           |  11 ++
 xen/arch/x86/include/asm/cpufeatures.h   |   2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 152 ++++++++++++++++-------
 xen/arch/x86/spec_ctrl.c                 |  49 +++++++-
 xen/arch/x86/traps.c                     |  13 ++
 xen/arch/x86/x86_64/compat/entry.S       |   9 +-
 xen/arch/x86/x86_64/entry.S              |  30 ++++-
 10 files changed, 220 insertions(+), 71 deletions(-)

-- 
2.30.2


