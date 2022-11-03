Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B0617BEC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436386.690472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlq-000194-6s; Thu, 03 Nov 2022 11:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436386.690472; Thu, 03 Nov 2022 11:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlq-00016h-3m; Thu, 03 Nov 2022 11:52:30 +0000
Received: by outflank-mailman (input) for mailman id 436386;
 Thu, 03 Nov 2022 11:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYlo-00016T-9K
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:52:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8e58b7-5b6d-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 12:52:26 +0100 (CET)
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
X-Inumbo-ID: fb8e58b7-5b6d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667476346;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bm7CEDt1IIOJfCFtzY4UsPBKwmFDLn8BiNg0GohoZf4=;
  b=Ux1H7ITp4iaH9yGOR5g+eGJYQpQ1qnvvoR7UHuMynJO6M4wlhLo7/l6i
   3NvDZRZ5riYIyE5GiytCFRiWhLAziHxZKY9nUqMD4PZbp1mMQdewTKDHB
   UkVElPUt1tYNZjVjGNYO23vPYNJdmhVr8hCL/3P27ccrXzmfr+xsfHAKv
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83173624
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VA7aKKzluh1u3KyECpJ6t+c0wSrEfRIJ4+MujC+fZmUNrF6WrkUOy
 2NMDWyBb6yNY2ahKt4jPtmy8E0BvcOEm4djSlNvpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVnPasT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU9i7
 9g5dzkQVzSk38u34e60aPhtj9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZ4MwR3G/
 D6uE2LRKD0qE+6Dk2a/4Gu9vbHQsz7BXLAjG+jtnhJtqALKnTFCYPEMbnO5vP24h0iWS99Zb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c/pdFfcrrj6EzKX86hycQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq1/beOrCiuPjAVIHVEemkPSQIf4PHspYgyilTESdMLOLa8k9ndCTz2h
 TeQo0AWmLE7ncMNkaKh8jjvvTWooZTYSx8v0S/eVGml8wBRaZasYsqj7l2zxfRPNoGCVXGao
 WMJ3cOZ6YgmHZyL0SCAXugJNLWo/Oqedi3Rh0Z1GJss/Cjr/GSsFahM6TR3P291McIJfzD4b
 UuVsgRUjLdZMWG2d6Zxb8S0At4z0Kn7Pd3/U7bfad8mSoBpdRWM9SVnb1O41WHxnEUinKczN
 I3desGpZV4TCL9uzT6/b+0czbMmyC04yW7JA5v8ynyaPaG2PSDPD+1faR3XM75/vPjsTBjpH
 8h3GeeQ7zQAWfDHRg6P2I8ycV8oPHkyGsWjwyBITdKrLg1jEWAnLvbex7I9ZoBo95hoevf0E
 mKVAREBlgem7ZHTAUDTMy04NuuzNXpqhShjVRHAK2pEzJTKjWyHyK4EP6U6crA8nACI5a4lF
 qJVEyls7xkmd9gmx9j/RcOgxGCBXE7x7e5rA8ZCSGFmF6OMvySTprfZkvLHrUHi9Bafu8oku
 KGH3QjGW5cFTAkKJJ+INq3zlg/o5iVHxr0as670zj57IRuEzWSXA3ap0q9fzz8kdH0vOQd2J
 y7JWExF9IEhUqc+8cXThLDskmtaO7IWI6auJEGCtO7eCMUv1jD8qWO2eLrXIGu1uaKd0PnKW
 Ni5ONmmYKVbwg4R7dYje1uppIpnj+bSS3Zh5lwMNB32g56DU9uM/lHuMRFzi5Bw
IronPort-HdrOrdr: A9a23:3f5ia6GQ+97UJPnHpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 STdZUgpHnJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qE/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="83173624"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Tamas K Lengyel <tamas@tklengyel.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Paul Durrant
	<paul@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public headers
Date: Thu, 3 Nov 2022 11:51:58 +0000
Message-ID: <20221103115204.49610-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.licences-fix-public-headers-v2

Hi,

Andrew pointed out some licences issue:

https://lore.kernel.org/xen-devel/b58f5340-d4fa-df9d-89de-6137005add77@citrix.com/T/#u
tracked here: https://gitlab.com/xen-project/xen/-/issues/35

So I attempt to fix them with this series.

For 4.17:
    This mostly change "documentation" so little risk for those patch, except
    "xen-foreign: Capture licences from the input headers" which changes
    "mkheader.py" which could generate broken headers.

Anthony PERARD (6):
  xen: Add licence information to public/errno.h
  xen: Used SPDX identifier in some public headers
  tools/include/xen-foreign: Add SPDX identifier to generated headers
  xen: Add licence header to device_tree_defs.h
  Rework COPYING installed in /usr/include/xen/, due to several licences
  xen: Used SPDX identifier in public headers

 tools/include/Makefile                       |  1 -
 xen/include/public/arch-arm.h                | 19 +-------------
 xen/include/public/arch-arm/hvm/save.h       | 19 +-------------
 xen/include/public/arch-arm/smccc.h          | 19 +-------------
 xen/include/public/arch-x86/cpufeatureset.h  | 19 +-------------
 xen/include/public/arch-x86/cpuid.h          | 19 +-------------
 xen/include/public/arch-x86/guest-acpi.h     | 19 +-------------
 xen/include/public/arch-x86/hvm/save.h       | 19 +-------------
 xen/include/public/arch-x86/hvm/start_info.h | 19 +-------------
 xen/include/public/arch-x86/pmu.h            | 19 +-------------
 xen/include/public/arch-x86/xen-mca.h        | 19 +-------------
 xen/include/public/arch-x86/xen-x86_32.h     | 19 +-------------
 xen/include/public/arch-x86/xen-x86_64.h     | 19 +-------------
 xen/include/public/arch-x86/xen.h            | 19 +-------------
 xen/include/public/arch-x86_32.h             | 19 +-------------
 xen/include/public/arch-x86_64.h             | 19 +-------------
 xen/include/public/argo.h                    | 19 +-------------
 xen/include/public/callback.h                | 19 +-------------
 xen/include/public/device_tree_defs.h        |  6 +++++
 xen/include/public/dom0_ops.h                | 19 +-------------
 xen/include/public/domctl.h                  | 19 +-------------
 xen/include/public/elfnote.h                 | 19 +-------------
 xen/include/public/errno.h                   |  2 ++
 xen/include/public/event_channel.h           | 19 +-------------
 xen/include/public/features.h                | 19 +-------------
 xen/include/public/grant_table.h             | 19 +-------------
 xen/include/public/hvm/dm_op.h               | 19 +-------------
 xen/include/public/hvm/e820.h                | 19 +-------------
 xen/include/public/hvm/hvm_info_table.h      | 19 +-------------
 xen/include/public/hvm/hvm_op.h              | 19 +-------------
 xen/include/public/hvm/hvm_vcpu.h            | 19 +-------------
 xen/include/public/hvm/hvm_xs_strings.h      | 19 +-------------
 xen/include/public/hvm/ioreq.h               | 19 +-------------
 xen/include/public/hvm/params.h              | 19 +-------------
 xen/include/public/hvm/pvdrivers.h           | 19 +-------------
 xen/include/public/hvm/save.h                | 19 +-------------
 xen/include/public/hypfs.h                   | 19 +-------------
 xen/include/public/io/9pfs.h                 | 19 +-------------
 xen/include/public/io/blkif.h                | 19 +-------------
 xen/include/public/io/cameraif.h             | 19 +-------------
 xen/include/public/io/console.h              | 19 +-------------
 xen/include/public/io/displif.h              | 19 +-------------
 xen/include/public/io/fbif.h                 | 19 +-------------
 xen/include/public/io/fsif.h                 | 19 +-------------
 xen/include/public/io/kbdif.h                | 19 +-------------
 xen/include/public/io/libxenvchan.h          | 19 +-------------
 xen/include/public/io/netif.h                | 19 +-------------
 xen/include/public/io/pciif.h                | 19 +-------------
 xen/include/public/io/protocols.h            | 19 +-------------
 xen/include/public/io/pvcalls.h              | 19 +-------------
 xen/include/public/io/ring.h                 | 19 +-------------
 xen/include/public/io/sndif.h                | 19 +-------------
 xen/include/public/io/tpmif.h                | 19 +-------------
 xen/include/public/io/usbif.h                | 19 +-------------
 xen/include/public/io/vscsiif.h              | 19 +-------------
 xen/include/public/io/xenbus.h               | 19 +-------------
 xen/include/public/io/xs_wire.h              | 19 +-------------
 xen/include/public/kexec.h                   | 19 +-------------
 xen/include/public/memory.h                  | 19 +-------------
 xen/include/public/nmi.h                     | 19 +-------------
 xen/include/public/physdev.h                 | 19 +-------------
 xen/include/public/platform.h                | 19 +-------------
 xen/include/public/pmu.h                     | 19 +-------------
 xen/include/public/sched.h                   | 19 +-------------
 xen/include/public/sysctl.h                  | 19 +-------------
 xen/include/public/tmem.h                    | 19 +-------------
 xen/include/public/trace.h                   | 19 +-------------
 xen/include/public/vcpu.h                    | 19 +-------------
 xen/include/public/version.h                 | 19 +-------------
 xen/include/public/vm_event.h                | 19 +-------------
 xen/include/public/xen-compat.h              | 19 +-------------
 xen/include/public/xen.h                     | 19 +-------------
 xen/include/public/xencomm.h                 | 19 +-------------
 xen/include/public/xenoprof.h                | 19 +-------------
 xen/include/public/xsm/flask_op.h            | 19 +-------------
 tools/include/xen-foreign/mkheader.py        | 23 ++++++++++++++---
 tools/include/xen/COPYING                    | 26 ++++++++++++++++++++
 77 files changed, 125 insertions(+), 1301 deletions(-)
 create mode 100644 tools/include/xen/COPYING

-- 
Anthony PERARD


