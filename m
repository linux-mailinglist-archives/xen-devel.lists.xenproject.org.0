Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505537DE659
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 20:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626621.977034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGmC-0005Oe-DF; Wed, 01 Nov 2023 19:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626621.977034; Wed, 01 Nov 2023 19:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGmC-0005M9-AI; Wed, 01 Nov 2023 19:21:16 +0000
Received: by outflank-mailman (input) for mailman id 626621;
 Wed, 01 Nov 2023 19:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHih=GO=citrix.com=prvs=662d42e6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qyGmB-0005LP-0U
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 19:21:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0919900-78eb-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 20:21:13 +0100 (CET)
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
X-Inumbo-ID: d0919900-78eb-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698866473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lKvIKTnsdQD5eDC393E+y1U+oFFJhAocN+H+DFLWIu8=;
  b=XfUij1utnJPYFUQaivf9pAy1tD59AQ5T16p+DhYRnCpvWxLZqh5pJC7r
   wRVfEKnru7J2DqMqqsK1AhFvyuYXHIEPO2b9YkFxPtdvYSsQmWjY8MGSU
   pOvD7by77SR3RsBrIFiibNjv8K2MGPXWdnuJeuFrTUr86cWgkeyV5bBcP
   Q=;
X-CSE-ConnectionGUID: Gul5WXPuT/mnsoAh0qSvvQ==
X-CSE-MsgGUID: j0/BEMSTQEq9tpI9hxcP6Q==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 130083861
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:3lm5565GIWjLWlqhC7Zu9gxRtMjHchMFZxGqfqrLsTDasY5as4F+v
 mQYUT2AbP3YMTTxL9klPY3gpEgA7ZPQn9c2SAZs/C83Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKkT5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 uEcdQ89Vg2/wOew27WSSrF1vdo9FZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxR7A9
 jmWoT2R7hcyNoTY4xegyU6Vq/aegTvaCYICH4Xmz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 neLgtWvAzVsub+UTHu197GIoDf0Mi8QRUcBaDEFS00Z4tDliIA1kh/LCN1kFcadktTwECrY3
 zOOoS4xlrgXy8UM0s2T/EvHgjO2jpePQwU+oBiSQmWm/wQ/bYXjZZTAwUPb7PBJBIuSRR+c+
 WQDmNmZqukFS5OV/BFhW81UQuvvvazcdmSB0BgwR/HN6ghB5VaMYIQN3wFGOXsuN8AffhbpO
 Fbopx1osco70GSRUUNnX26gI510nPiwTIy9DKC8gslmOMYrKFHdlM16TQvAhzqzzRJEfbQXY
 M/DKa6R4WAm5bOLJdZcb8way7Yvjhsm32LVSouTI/+PiuHGOyf9pVvoKjKzggEFAECs+l69H
 y53bZfi9vmmeLSWjtPr2YASN0sWCnMwGIr7rcdaHsbafFs2SD96VaGPkepxE2CAo0iyvr6Wl
 kxRp2cBlQGh7ZE5AV7iho9fhEPHAs8k8CNT0d0ENle0wXkzCbuSAFMkX8JvJ9EPrbUzpcOYu
 tFZI61s9NwTEGWYk9ncBLGhxLFfmOOD31LQYHH4PGljI/aNhWXho7fZQ+cmzwFWZgLfiCf0i
 +TIOt/zKXbbezlfMQ==
IronPort-HdrOrdr: A9a23:sLusGaElKKjX/LQTpLqE3seALOsnbusQ8zAXPo5KOHtom6uj5r
 iTdZUgpGbJYVMqM03I9urtBEDtexzhHP1OkOos1NWZPTUO0VHAROsO0WKF+UyDJ8SUzIBgPM
 lbAsxDIey1IV9mjdvrpCmUeuxQpuVviJrJuQ4G9QYJcT1X
X-Talos-CUID: 9a23:ZDl/9W4FbPI6cQCDLdss21MQR/8VSmDhi3LWOEiRCT5wc6OLcArF
X-Talos-MUID: 9a23:elACNgjWMjIY4XelIEidsMMpNp8vyYmLM3w0vIxXp9GlZCxgMA/DtWHi
X-IronPort-AV: E=Sophos;i="6.03,269,1694750400"; 
   d="scan'208";a="130083861"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>, "Takahiro
 Shinagawa" <shina@ecc.u-tokyo.ac.jp>
Subject: [PATCH 0/2] x86/vmx: Multiple fixes
Date: Wed, 1 Nov 2023 19:20:56 +0000
Message-ID: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes for two bugs initially reported to the Xen Security Team, but determined
not have an impact in security-supported configurations.

The Xen Security Team would like to thank Ishiisan for engaging in responsible
disclsoure.

As a reminder to the rest of the Xen community, please do ask you're not sure.

Andrew Cooper (2):
  x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
  x86/vmx: Disallow the use of inactivity states

 xen/arch/x86/hvm/vmx/vmx.c              | 12 ++++++------
 xen/arch/x86/hvm/vmx/vvmx.c             |  9 +++++++--
 xen/arch/x86/include/asm/hvm/hvm.h      |  5 ++++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  1 +
 4 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.30.2


