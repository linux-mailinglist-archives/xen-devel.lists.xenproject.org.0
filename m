Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30596702B8E
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 13:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534711.832009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWQc-0000QM-Nl; Mon, 15 May 2023 11:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534711.832009; Mon, 15 May 2023 11:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWQc-0000N3-Ku; Mon, 15 May 2023 11:31:46 +0000
Received: by outflank-mailman (input) for mailman id 534711;
 Mon, 15 May 2023 11:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ig+9=BE=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pyWQb-0000Ms-Vt
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 11:31:46 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10b400dc-f314-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 13:31:42 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f41d087bd3so63356265e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 May 2023 04:31:42 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c22c200b003f42328b5d9sm24857485wmg.39.2023.05.15.04.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:31:40 -0700 (PDT)
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
X-Inumbo-ID: 10b400dc-f314-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1684150301; x=1686742301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcS0sFy1j+iBirD4dRuPYJrHtHgaoJyuoMIW8QbN+lY=;
        b=EvSyOXYOhoECtJSlqGBVgwanO9Uxg8r9uzRPIB5gUBORfCsOUdF4bkq5T4R8FVj/PD
         v577vCRVd8RVg4/VR1WRb6l1jj9IW1/xG846OqHybl9AT+xntr/cygtKJqHSe79a2aqQ
         AtypoBa3MunRWY/VDbCVZ52zM7mMgvE8nHJCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150301; x=1686742301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcS0sFy1j+iBirD4dRuPYJrHtHgaoJyuoMIW8QbN+lY=;
        b=hTnv1za3mCaIBqd8TWLWeeF5bcTaW2wVEzAqugvcaKzvX/8AjFL+9Q+9Bzbe3Krdtg
         G/IJG5NwakljxAkXOnKINALCeAGohALgeUsdk0Nm3GWASZp3/Q9NDwpY2qujOR5qKDqZ
         PyYXjU6m1qDwRIs2OkxgFO5gcYqVMVzBbs5pL2i5o7x96p2DwXxxb2XOim015aaDTT//
         2LqHDm9snc4o8VuAufOeUEpAURNgyuwmbC1qA80lwTz4/L8vUVVtNswr8DuqCXjLLmWq
         o8aVwROuviOjQD5mUwH7Y2h5oF/P4tVwTiC8YReGIWno4OoaJJlLx5kVuv2PXVpwPE/D
         Gv3w==
X-Gm-Message-State: AC+VfDxuW0FHqNRFU3NyynL3q0UZpQ7cahla/ynjs2wI92XDY7LN8cAm
	AY0PmgDE/bFuYEnbTIIldy9WTrbrVgpJJgweJYY=
X-Google-Smtp-Source: ACHHUZ6RscVihJNZLvIthvOqYC3JgRqd5SMFPqjj7Q2jWvfWgRJj8KHE2E2T0xTekQpoZiKAgQU7dw==
X-Received: by 2002:a1c:6a0d:0:b0:3f4:23d4:e48 with SMTP id f13-20020a1c6a0d000000b003f423d40e48mr18847738wmc.23.1684150301172;
        Mon, 15 May 2023 04:31:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] Add CpuidUserDis support
Date: Mon, 15 May 2023 12:31:34 +0100
Message-Id: <20230515113136.2465-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3:
 * Move LCAP setters from patch 2 to patch 1
 * Comment on rationale for checking CPUID faulting before CpuidUserDis on AMD

Nowadays AMD supports trapping the CPUID instruction from ring>0 to ring0,
(CpuidUserDis) akin to Intel's "CPUID faulting". There is a difference in
that the toggle bit is in a different MSR and the support bit is in CPUID
itself rather than yet another MSR. This patch enables AMD hosts to use it
when supported in order to provide correct CPUID contents to PV guests.

Patch 1 moves vendor-specific code on probe_cpuid_faulting() to amd.c/intel.c

Patch 2 adds support for CpuidUserDis, hooking it in the probing path and
the context switching path.

Alejandro Vallejo (2):
  x86: Refactor conditional guard in probe_cpuid_faulting()
  x86: Add support for CpuidUserDis

 xen/arch/x86/cpu/amd.c         | 32 ++++++++++++++++++++-
 xen/arch/x86/cpu/common.c      | 51 ++++++++++++++++++----------------
 xen/arch/x86/cpu/intel.c       | 12 +++++++-
 xen/arch/x86/include/asm/amd.h |  1 +
 4 files changed, 70 insertions(+), 26 deletions(-)

-- 
2.34.1


