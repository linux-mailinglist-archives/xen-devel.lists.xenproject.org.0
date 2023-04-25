Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59756EE718
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526271.817928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMlt-0004UA-Od; Tue, 25 Apr 2023 17:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526271.817928; Tue, 25 Apr 2023 17:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMlt-0004Qx-Jb; Tue, 25 Apr 2023 17:48:09 +0000
Received: by outflank-mailman (input) for mailman id 526271;
 Tue, 25 Apr 2023 17:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnGU=AQ=citrix.com=prvs=4724fc120=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1prMlr-0004QK-VA
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:48:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 543c0e36-e391-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 19:48:05 +0200 (CEST)
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
X-Inumbo-ID: 543c0e36-e391-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682444885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rK45VTECOGah3EhG6bjJLWH2dLGpXmW9WnoGplFDXNk=;
  b=CdQR5MUiRfPypL7vhYZqu5vsZVycnFqMehsx0wBvJX4h+wCh/sfBwVo5
   f+mQTlo6M0uELLSI1gLPnIFZL2n+aqT9sKl6MnJJMd6SzCVGJMFECMbgH
   +Ouz1hFuUYktKjjYQ/+0VSiZAOuk6o/t7S/aELdnNkamRT+lE/ObQldE3
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107228329
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cYzJeqozhWyZk8Eeeo/1uhoCcKxeBmIRZRIvgKrLsJaIsI4StFCzt
 garIBnVM/aKMWb0ed5wPoiy/ENVucDRyIBrSAtrqisyEi4RpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzSRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABcsZQqb2r3v+ZuYF8tp3+QfDuriJ5xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVapVSTpKQ6+S7TwRZ73aLxGNHUZsaLVYNemUPwS
 mfupjymWEtKb4bOodaD2l71r7H0tADAYZgtOqKh0MR6sAWXzXNGXXX6UnPk+KLk2yZSQel3K
 UES/CsgoLJ09EGxRNTnQzWzoWKerlgXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBBzZirbmUQnK17aqPoHW5Pi19EIMZTXZaF01fuYCl+dxtyEuVFb6PDZJZkPXSODrq2
 23V9REXpOgxiJcr64eY9EvY1mfESofycuIl2unGdjv7vlkiNdP9OtzABUvztqgZctvAJrWVl
 D1dwpXFsrhTZX2YvHbVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMwkVkLjHOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8+PxXOhjq9wRZwwMnT3
 Kt3lu79ZUv29Iw9lGbmLwvj+eRDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/Lb/fc1E2SDFwUpc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AOl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:Hy8yRKm+1ZEhHe0r8Ay/Aaf40w7pDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-Talos-CUID: 9a23:PzOizWHl2d/cAFSSqmJA1UUOAp16K0T07yryJhaYNURKQaaKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AI6RDYQyIkFag6TFbXj/5BJf1VpaaqIj3IR42uLY?=
 =?us-ascii?q?9gtO7GzNpHQ2NvGyzSZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,226,1677560400"; 
   d="scan'208";a="107228329"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jennifer.herbert@citrx.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jennifer Herbert <jennifer.herbert@citrix.com>
Subject: [PATCH v3 0/2] acpi: Make TPM version configurable.
Date: Tue, 25 Apr 2023 17:47:31 +0000
Message-ID: <20230425174733.795961-1-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch makes the TPM version, for which the ACPI library probes,
configurable.
Find following version 3 of this patche series.  Appoliges for it
taking so long, and my previous version missing some changes I intended to
share.

Have renamed the TPM_CRB constants to better match the TPM
specification.  (They where previously trying to stay consistent with the
TIS code)
Have moved some ACPI register locations to acpi2_0.h to such that both
TPM register offsets are defined together, so that their relation can be
better understood.  Have  also added additional comments to explain these
constants.

Changed the defaults, such that it will act exactly as is current,
(which is to attempt to probe for TPM 1.2) unless explicitly set to no
TPM or TPM 2, so not to regress anything.
Addressed veriouse style issues.
Moved tpm_version field up in acpi_config for better alignment.

Add a new xenstore key 'tpm_version', which xenopsd is setting to 2.  If
not set, it defaults to '1' probing for tpm 1.2 as before.

A note on the use of CRB:  QEMU implements both TIS and CRB interfaces
for TPM2. We use this CRB interface as defined by the TCG PTP
specification,
as it is thought to be the more modern interface and preferred for the
TPM2.0 only world.
TIS is PC specific, implemented with an ISA bus device in QEMU, whereas
I think CRB is more generic and would be suitable for
use on other platforms like ARM.  While I read here is some confusion
about the Mobile CRB specification regrading locality, I don't 
think this is a problem for our use case.  However, should someone
decide they need to use TIS with TPM2, I don't believe this patch series
would exclude the option for this to be added later, since struct
acpi_config does allow a TIS to be supplied instead of CRB for version
2.

Jennifer Herbert (2):
  acpi: Make TPM version configurable.
  acpi: Add TPM2 interface definition.

 docs/misc/xenstore-paths.pandoc |  10 +++
 tools/firmware/hvmloader/util.c |  28 +++++++--
 tools/libacpi/Makefile          |   3 +-
 tools/libacpi/acpi2_0.h         |  32 ++++++++++
 tools/libacpi/build.c           | 106 +++++++++++++++++++++++---------
 tools/libacpi/libacpi.h         |   4 +-
 tools/libacpi/ssdt_tpm2.asl     |  36 +++++++++++
 7 files changed, 183 insertions(+), 36 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2.asl

-- 
2.39.1


