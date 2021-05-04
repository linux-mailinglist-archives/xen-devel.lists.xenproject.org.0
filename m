Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1736372A5B
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122300.230686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUs-0006SJ-Nv; Tue, 04 May 2021 12:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122300.230686; Tue, 04 May 2021 12:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUs-0006RQ-K6; Tue, 04 May 2021 12:49:54 +0000
Received: by outflank-mailman (input) for mailman id 122300;
 Tue, 04 May 2021 12:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUq-0005hX-S5
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:52 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ac7165f-96f8-4fbd-9072-2d634d77c41a;
 Tue, 04 May 2021 12:49:20 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 197so8021191qkl.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:20 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:19 -0700 (PDT)
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
X-Inumbo-ID: 9ac7165f-96f8-4fbd-9072-2d634d77c41a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5P9pw08EZqXqNEkdmsF7ZDqPU01GGuwd0g313RI0CAY=;
        b=rPD2BYjdtrTPILExTmxr8PkQw+BPrfyypfxVEThxmTXarRi8DWP1Oz7eN7dYciLKqk
         zTVeVXKDd9JR5A5EiAA2AuMkPi2if0f5SjQIiQMwT/ht6S73gyS9LtsDOdCJe67Ec4Nf
         Pep50LlBoi6lc/lCvP5fxaglzepfoqv5WnHmKYXqrS8ZFkHwV5DbXPdQQm36wmrLscgv
         uUoo6ctdKY6C4rkqrieI8acygzu3xaLILQzqJVlCatB+eW2kO1v38ic6owVD80e5UJL6
         TACTV9wgxXwz8qqr1IDCvZN1nYzh80eYobn7yUCp2fpclsZXS8fnPW5kCiKIxecSGuyO
         AxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5P9pw08EZqXqNEkdmsF7ZDqPU01GGuwd0g313RI0CAY=;
        b=R5WL5Di/lkWxym6SDUqvSBR/BIsUW07TL0ob/AEoin+yJ87B6jKjksa8qNidS/heVE
         PHsBTckQU24gH8s6D0jH7BVAKfuEdgpjqUcmAJIn7g5/M/4dew6+k9E4R4aZIQ5hyGGp
         qJm7/jjnxTKx/CvNENEv+SDl1x+1fR1VnsKbIsTPCxkWOrUsicw8aZgBxBEtPgBlvbnR
         0oE8qS6CjOsG80v5HqyHjkkVAg61dJECh9Qx69w875ZccpjZEamWbOa2aOsqN0e8blul
         bZNMQyX+v9u7oq8qufWB6ongltPfO1lRh/18bVLVbmwq0Shxl1RVsviXv2yCEMuX22or
         ARDw==
X-Gm-Message-State: AOAM531VNsQ2gm51umrz7T5K3Gh8bMZTsk5e4Nx1MqA5uxh4/airEhwc
	HdSgENk71q9zqyrK4xehq16uRukNqzI=
X-Google-Smtp-Source: ABdhPJyTEspJiSpERqd+zFpQhhwsfGAiBJpSYZUHyVrbKmTHn9E1iL/VVWvjSNNVZmi7/qjezf9V0g==
X-Received: by 2002:a37:a24b:: with SMTP id l72mr15678342qke.189.1620132560052;
        Tue, 04 May 2021 05:49:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 9/9] vtpmmgr: Support GetRandom passthrough on TPM 2.0
Date: Tue,  4 May 2021 08:48:42 -0400
Message-Id: <20210504124842.220445-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GetRandom passthrough currently fails when using vtpmmgr with a hardware
TPM 2.0.
vtpmmgr (8): INFO[VTPM]: Passthrough: TPM_GetRandom
vtpm (12): vtpm_cmd.c:120: Error: TPM_GetRandom() failed with error code (30)

When running on TPM 2.0 hardware, vtpmmgr needs to convert the TPM 1.2
TPM_ORD_GetRandom into a TPM2 TPM_CC_GetRandom command.  Besides the
differing ordinal, the TPM 1.2 uses 32bit sizes for the request and
response (vs. 16bit for TPM2).

Place the random output directly into the tpmcmd->resp and build the
packet around it.  This avoids bouncing through an extra buffer, but the
header has to be written after grabbing the random bytes so we have the
number of bytes to include in the size.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/marshal.h          | 10 +++++++
 stubdom/vtpmmgr/vtpm_cmd_handler.c | 48 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/stubdom/vtpmmgr/marshal.h b/stubdom/vtpmmgr/marshal.h
index dce19c6439..20da22af09 100644
--- a/stubdom/vtpmmgr/marshal.h
+++ b/stubdom/vtpmmgr/marshal.h
@@ -890,6 +890,15 @@ inline int sizeof_TPM_AUTH_SESSION(const TPM_AUTH_SESSION* auth) {
 	return rv;
 }
 
+static
+inline int sizeof_TPM_RQU_HEADER(BYTE* ptr) {
+	int rv = 0;
+	rv += sizeof_UINT16(ptr);
+	rv += sizeof_UINT32(ptr);
+	rv += sizeof_UINT32(ptr);
+	return rv;
+}
+
 static
 inline BYTE* pack_TPM_RQU_HEADER(BYTE* ptr,
 		TPM_TAG tag,
@@ -923,5 +932,6 @@ inline int unpack3_TPM_RQU_HEADER(BYTE* ptr, UINT32* pos, UINT32 max,
 #define pack_TPM_RSP_HEADER(p, t, s, r) pack_TPM_RQU_HEADER(p, t, s, r)
 #define unpack_TPM_RSP_HEADER(p, t, s, r) unpack_TPM_RQU_HEADER(p, t, s, r)
 #define unpack3_TPM_RSP_HEADER(p, l, m, t, s, r) unpack3_TPM_RQU_HEADER(p, l, m, t, s, r)
+#define sizeof_TPM_RSP_HEADER(p) sizeof_TPM_RQU_HEADER(p)
 
 #endif
diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
index 2ac14fae77..7ca1d9df94 100644
--- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
+++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
@@ -47,6 +47,7 @@
 #include "vtpm_disk.h"
 #include "vtpmmgr.h"
 #include "tpm.h"
+#include "tpm2.h"
 #include "tpmrsa.h"
 #include "tcg.h"
 #include "mgmt_authority.h"
@@ -772,6 +773,52 @@ static int vtpmmgr_permcheck(struct tpm_opaque *opq)
 	return 1;
 }
 
+TPM_RESULT vtpmmgr_handle_getrandom(struct tpm_opaque *opaque,
+				    tpmcmd_t* tpmcmd)
+{
+	TPM_RESULT status = TPM_SUCCESS;
+	TPM_TAG tag;
+	UINT32 size;
+	UINT32 rand_offset;
+	UINT32 rand_size;
+	TPM_COMMAND_CODE ord;
+	BYTE *p;
+
+	p = unpack_TPM_RQU_HEADER(tpmcmd->req, &tag, &size, &ord);
+
+	if (!hw_is_tpm2()) {
+		size = TCPA_MAX_BUFFER_LENGTH;
+		TPMTRYRETURN(TPM_TransmitData(tpmcmd->req, tpmcmd->req_len,
+					      tpmcmd->resp, &size));
+		tpmcmd->resp_len = size;
+
+		return TPM_SUCCESS;
+	}
+
+	/* TPM_GetRandom req: <header><uint32 num bytes> */
+	unpack_UINT32(p, &rand_size);
+
+	/* Call TPM2_GetRandom but return a TPM_GetRandom response. */
+	/* TPM_GetRandom resp: <header><uint32 num bytes><num random bytes> */
+        rand_offset = sizeof_TPM_RSP_HEADER(tpmcmd->resp) +
+		      sizeof_UINT32(tpmcmd->resp);
+
+	TPMTRYRETURN(TPM2_GetRandom(&rand_size, tpmcmd->resp + rand_offset));
+
+	p = pack_TPM_RSP_HEADER(tpmcmd->resp, TPM_TAG_RSP_COMMAND,
+				rand_offset + rand_size, status);
+	p = pack_UINT32(p, rand_size);
+	tpmcmd->resp_len = rand_offset + rand_size;
+
+	return status;
+
+abort_egress:
+	tpmcmd->resp_len = VTPM_COMMAND_HEADER_SIZE;
+	pack_TPM_RSP_HEADER(tpmcmd->resp, tag + 3, tpmcmd->resp_len, status);
+
+	return status;
+}
+
 TPM_RESULT vtpmmgr_handle_cmd(
 		struct tpm_opaque *opaque,
 		tpmcmd_t* tpmcmd)
@@ -842,6 +889,7 @@ TPM_RESULT vtpmmgr_handle_cmd(
 		switch(ord) {
 		case TPM_ORD_GetRandom:
 			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_GetRandom\n");
+			return vtpmmgr_handle_getrandom(opaque, tpmcmd);
 			break;
 		case TPM_ORD_PcrRead:
 			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_PcrRead\n");
-- 
2.30.2


