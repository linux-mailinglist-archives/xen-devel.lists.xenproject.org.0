Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A271253F
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540058.841514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIJ-0006w6-8C; Fri, 26 May 2023 11:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540058.841514; Fri, 26 May 2023 11:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIJ-0006sg-4c; Fri, 26 May 2023 11:07:39 +0000
Received: by outflank-mailman (input) for mailman id 540058;
 Fri, 26 May 2023 11:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VIH-0006de-6X
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:07:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84906ae6-fbb5-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 13:07:35 +0200 (CEST)
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
X-Inumbo-ID: 84906ae6-fbb5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j+U/re5HOnLv+lutE3nsZHY4bWNR15bqPcginliGyR4=;
  b=RlwHTCK0HksvNFBJDce4kObAFGvWZzSfxwcdjZuEcPQbkIxaArH/dKFq
   jbdc29yjI8Nk4kkN8GRA3Q3cgivWspW6vs/zQXeNs21dMsexlHrOoTTle
   zNFJ1PVW1l4qi7XRAvOm/BXMHH9z4S08bg/0LZN9FjtmMuSOM1MOY8lKQ
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007426
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+y1uo6/tDosUUvzhYApgDrUDkH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GEeCGDTbvmPMTP9fYwkPonk9BhU6p/VzNU3HQE/+Co8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkS5
 M4oMWs2ayvS3c6sxou7WM1Vq8k8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxx3A/
 j2apTqR7hcyKey/+z+p1CmQo7HuhSn2CKcONofjz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqOT42fRJe2NzY8dsflBT2TsRHKYO4kYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoIiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHXoXk1NBLMhj68yiDAdJ3T3
 7/BLa5A6l5DU8xaIMeeHb9BgdfHOAhirY8seXwL50v+iufPDJJkYbwELEGPfogE0U9wmy2Mq
 4w3H5LTm31ivBjWPnG/HXg7cQpbchDWxPne96RqSwJ0ClA7QDp9U6SIkOpJlk4Mt/09q9okN
 0qVAidwoGcTT1WbcW1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:n1Cee6C37ont8aDlHelc55DYdb4zR+YMi2TDt3oddfU1SL39qy
 nKpp4mPHDP5wr5NEtPpTniAtjkfZq/z+8X3WB5B97LMDUO3lHIEGgL1+DfKlbbak/DH4BmtZ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3AY5WKo2m3R9Oe+iJa1rq9jAyh33rXOSHM/kfJeHS?=
 =?us-ascii?q?9MjczZKeTcF+C3JpJntU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUotOmw2gayxu/XvVVnnq1bdTpzUj/pSOOkUht84?=
 =?us-ascii?q?6npelLSZ9axKBrg7se9py?=
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="113007426"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/4] x86: RSBA and RRSBA handling
Date: Fri, 26 May 2023 12:06:51 +0100
Message-ID: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This series deals with the hanlding of the RSBA and RRSBA bits across all
parts and all mistakes encountered in various microcode versions.

With it in place, here are some examples from various generations of Intel
hardware:

  BDX Raw
  BDX Host
  BDX HVM Max   rsba

  KBL Raw       rsba misc-pkg-ctrl energy-ctrl
  KBL Host      rsba misc-pkg-ctrl energy-ctrl
  KBL HVM Max   rsba

  SKX Raw       rsba misc-pkg-ctrl energy-ctrl
  SKX Host      rsba misc-pkg-ctrl energy-ctrl
  SKX HVM Max   rsba

  CFL Raw       rdcl-no eibrs skip-l1dfl mds-no tsx-ctrl misc-pkg-ctrl energy-ctrl fb-clear
  CFL Host      rdcl-no eibrs rsba skip-l1dfl mds-no tsx-ctrl misc-pkg-ctrl energy-ctrl fb-clear rrsba
  CFL HVM Max   rdcl-no eibrs rsba mds-no fb-clear rrsba

  CLX Raw       rdcl-no eibrs skip-l1dfl mds-no tsx-ctrl misc-pkg-ctrl energy-ctrl sbdr-ssdp-no psdp-no fb-clear rrsba
  CLX Host      rdcl-no eibrs rsba skip-l1dfl mds-no tsx-ctrl misc-pkg-ctrl energy-ctrl sbdr-ssdp-no psdp-no fb-clear rrsba
  CLX HVM Max   rdcl-no eibrs rsba mds-no sbdr-ssdp-no psdp-no fb-clear rrsba

  SPR Raw       rdcl-no eibrs skip-l1dfl mds-no if-pschange-mc-no tsx-ctrl taa-no misc-pkg-ctrl energy-ctrl
  SPR Host      rdcl-no eibrs rsba skip-l1dfl mds-no if-pschange-mc-no tsx-ctrl taa-no misc-pkg-ctrl energy-ctrl rrsba
  SPR HVM Max   rdcl-no eibrs rsba mds-no if-pschange-mc-no taa-no rrsba


Of note:
 * The SPR CPU is pre-release and didn't get the MMIO ucode in the end
   (sbdr-ssdp-no psdp-no fb-clear).
 * SKX/KBL enumerate RSBA following the energy filtering microcode.  Prior to
   that, they don't enumerate MSR_ARCH_CAPS at all.
 * CFL and SPR fails to enumerate both RSBA and RRSBA.  CLX fails to enumerate
   RSBA.  These should be addressed in due course.


Andrew Cooper (4):
  x86/spec-ctrl: Rename retpoline_safe() to retpoline_calculations()
  x86/spec-ctrl: Synthesize missing RSBA/RRSBA bits
  x86/cpu-policy: Rearrange guest_common_default_feature_adjustments()
  x86/cpu-policy: Derive {,R}RSBA for guest policies

 xen/arch/x86/cpu-policy.c             | 59 ++++++++++++++------
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/spec_ctrl.c              | 78 +++++++++++++++++++++------
 xen/tools/gen-cpuid.py                |  5 +-
 4 files changed, 111 insertions(+), 32 deletions(-)

-- 
2.30.2


