Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194952F892F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 00:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68830.123349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YFQ-0005y3-GT; Fri, 15 Jan 2021 23:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68830.123349; Fri, 15 Jan 2021 23:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YFQ-0005xW-99; Fri, 15 Jan 2021 23:11:16 +0000
Received: by outflank-mailman (input) for mailman id 68830;
 Fri, 15 Jan 2021 23:11:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0YFP-0005x6-0S
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 23:11:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b796228-0870-4944-b016-6691a0a6e58d;
 Fri, 15 Jan 2021 23:11:12 +0000 (UTC)
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
X-Inumbo-ID: 2b796228-0870-4944-b016-6691a0a6e58d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610752272;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j/WHVvAHkv12PbMXTjq4geUHeGv8Iw1BPAF0B2znkEY=;
  b=Ue4iv2tbp25B7K++Fh5uYrjSO2o8aIUL4IqOpTrvYWtRiVBl3aSs288e
   hBRWSM4xINlIFjFb38FoFoLC3+HnnNzaFKKFNI76ESOHoi0DVPzfI8D+x
   8wk+R7Wmhef4nZQqzAmdqb0c6ivpIHUFxq5j6vx8lyagUY0ApO5fJAo21
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kWw/S1F1iXVzovzmhBYHuxX6MoSiIf7KKxRMsmf5uZHzG/d9kUdgphrYdYniXZkUsRhKypqQI6
 2KbETQnNj5vrz+Ubf0ssfNLLduxLh+3O0tz67Vr80xphsstidPidkDtZ+XtV4HbUPXJxP9IBBs
 9w+QGYrJ3L/ZaG3quNblWD6fUI4/LzoOicuCb1U1Bce/SXGjhedm+LPdl3GSVml+QHQKteA/76
 b3dvB8Hp9FKP7RBE/oFOS91HGsQVVIKnQi6HHo+rQgV5htYWpqolURfgijO6A9u1j9Ebr9EIEm
 dNg=
X-SBRS: 5.1
X-MesageID: 35218330
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35218330"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, =?UTF-8?q?Norbert=20Kami=C5=84ski?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 0/3] x86: Initial Trenchboot/SKINIT support
Date: Fri, 15 Jan 2021 23:10:43 +0000
Message-ID: <20210115231046.31785-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The Trenchboot project[0][1] project aims to develop and upstream support for
TCG DRTM support into various open source projects in the ecosystem, to
improve boot security.  Trenchboot has been discussed at previous
XenSummits[2], and the work across the ecosystem is extensively blogged
about[3].

This series forms the start of the work within Xen, and for now simply covers
the ability to boot in the AMD SKINIT/Secure Startup environment.

Full details are available in AMD APM Vol2 15.27 "Secure Startup with SKINIT"

Future work will cover related support for Intel TXT in a non-tboot system,
and the common logic to interact with the TPM and extend the hardware measured
chain of trust into dom0.

[0] https://trenchboot.org/
[1] https://github.com/TrenchBoot/documentation
[2] https://www.youtube.com/watch?v=SwByVrw7-08&list=PLYyw7IQjL-zFYmEoZEYswoVuXrHvXAWxj&index=13
[3] https://blog.3mdeb.com/tags/trenchboot/

Andrew Cooper (2):
  x86/smpboot: Re-position the call to tboot_wake_ap()
  x86/smpboot: Allow making an INIT IPI conditional

Norbert Kamiński (1):
  x86: Support booting under Secure Startup via SKINIT

 xen/arch/x86/cpu/common.c        | 32 +++++++++++++
 xen/arch/x86/smpboot.c           | 98 ++++++++++++++++++++++++----------------
 xen/include/asm-x86/cpufeature.h |  1 +
 xen/include/asm-x86/msr-index.h  |  1 +
 xen/include/asm-x86/processor.h  |  6 +++
 5 files changed, 99 insertions(+), 39 deletions(-)

-- 
2.11.0


