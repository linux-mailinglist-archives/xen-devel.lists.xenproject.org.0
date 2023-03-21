Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8B6C30BA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512362.792362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaT9-0001L2-Ub; Tue, 21 Mar 2023 11:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512362.792362; Tue, 21 Mar 2023 11:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaT9-0001Fk-QC; Tue, 21 Mar 2023 11:47:59 +0000
Received: by outflank-mailman (input) for mailman id 512362;
 Tue, 21 Mar 2023 11:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9ZV=7N=citrix.com=prvs=437435c1e=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1peaT8-0001DD-HP
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:47:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ed4f05-c7de-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:47:54 +0100 (CET)
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
X-Inumbo-ID: 34ed4f05-c7de-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679399275;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rAIZjgG2rZhi1dnmrxQUcW0cV4W0rLAdPQfcshNxphA=;
  b=fCMxaM8Ubi/wDKg6cftGfBSHsyl8ikjHhU3RNK0M1AXD8blO93tiQuK8
   /RcljHY8ZPd/hXSjUbKKk6H0zUBHxVSuB5CbcxwJ8kULQwQanKO1qI14N
   kM8skblN7236E0rbiVT/G2j37YRiGoduuPI3ICbE/VB0N6IkRRgANa8gM
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101601995
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:N8rruaKvguahVR2pFE+R5ZUlxSXFcZb7ZxGr2PjKsXjdYENS0zRVz
 2pJWmrQOfaKM2TxeNhzO4jn8B9Xv8eHm4NqQQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5cXTpny
 v0lcgk0LSCZm9mM8YmDTMJV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWh+qyiXTuNTFJoUmRpII84nTJzRw327/oWDbQUoXSHJsNxxfJ+
 woq+UzmCBIza+O/7AC6zWCh3fHgzST+Bac7QejQGvlC3wTImz175ActfVm0u/6ikWalRslSb
 UcT/0IGr7U29UGtZsnwWVu/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZslnOL64iJvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCYeul7+YWOYtDpAJ76/e7eS2GPj6915edPxoka6g
 JQUpySPxLlQUsDWynHdGb5l8KKBvKjcbmCF6bJ7N9x4rmn2pSb+FWxFyGsmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjatSsIrHON/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlCgORwmXhgnjuDH/gXKihLN5LEPBaopUotagPSPojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zLP/2WsidCBhbbiv8pQ/XrfacmJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4AOi2CadclnaNBiOqtrHBP5CkJ7yBgR0VX7A5pTpSdzHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:a6l1kqiduUyw9BiB1SwzKeJljXBQXwh13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+OrwXpVoJEmxyXcb2/h0AV7PZniFhILKFvAA0WKB+UyYJ8SWzIc0us
 kBT0EXMqyJMbEQt7ec3ODXKadE/DCyytHSuQ6S9QYfcShaL4VbqytpAAeSFUN7ACFAGJoCDZ
 KZou5KvSCpd3g7ZtmyQiBtZZm3m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM1yb5+qKgmfemzQK07R6g071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH4aPuTgkydvflmrDxL
 P3wisIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsKuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Zs5Vma/pSVFZtl/1XwKoVKuZ3IMvC0vFRLA
 C6NrCV2B5UGWnqEEwx8FMfjOBEZU5DYitucnJyx/B97AIm5kyR73FotfD3zU1whK7VDaM0k9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101601995"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v3 0/3] xen-ucode: print information about currently loaded ucode
Date: Tue, 21 Mar 2023 11:47:42 +0000
Message-ID: <20230321114745.11044-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

For v3 I've removed the usage of xenhypfs and gone back to adding
a new platform op.

Sergey Dyasli (3):
  tools/xenctrl: add xc_get_cpu_version()
  x86/platform: introduce XENPF_get_ucode_version
  tools/xen-ucode: print information about currently loaded ucode

 tools/include/xenctrl.h                  |  3 ++
 tools/libs/ctrl/xc_misc.c                | 41 +++++++++++++++
 tools/misc/xen-ucode.c                   | 66 ++++++++++++++++++++++++
 xen/arch/x86/platform_hypercall.c        | 30 +++++++++++
 xen/arch/x86/x86_64/platform_hypercall.c |  4 ++
 xen/include/public/platform.h            | 12 +++++
 xen/include/xlat.lst                     |  1 +
 7 files changed, 157 insertions(+)

-- 
2.17.1


