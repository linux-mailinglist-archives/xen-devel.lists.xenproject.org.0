Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D8F37554A
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123552.233087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYO-0000Sd-KL; Thu, 06 May 2021 14:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123552.233087; Thu, 06 May 2021 14:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYO-0000Oh-E3; Thu, 06 May 2021 14:00:36 +0000
Received: by outflank-mailman (input) for mailman id 123552;
 Thu, 06 May 2021 14:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYN-0003iB-OC
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:35 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c37acdc0-f19d-4581-89c9-16376abafabc;
 Thu, 06 May 2021 14:00:04 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id l129so4940985qke.8
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:04 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:03 -0700 (PDT)
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
X-Inumbo-ID: c37acdc0-f19d-4581-89c9-16376abafabc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xs1qSTBmNZ6MyDxAQr1ybF/sqzOXtnBmJm894lxdIZ8=;
        b=tHfz+NTyXpk78wHnIcVo4zHaklFwprxZ+8yfagEEfzwYJA1ki77Li6jrJ9g4/Izhjr
         8RDshlJK9cScWT3MN7e9ew7fjc0Aq0kZ77I8nWtUnWhde3PNEsHbA4s/AGO/pcDNS7kW
         hNSUWw1CLHbhg5MlASYImhKgySpag9kgCHvnWRV1mDCgfSdc4h2cQSPcPnD5TQRR5RGT
         ZpyQsVBohskhLxCh0ZFvXclm/wes9b28NrZeDD3oRtpz1wyiu6TJaOYG86xIX3ycD8h3
         gE2gomoM0DDwoheWf5AulpKBJJMISGRQsW2sM0MJEtVQDOkHOwqbHh0Mbz9uVCgk0XV+
         kLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xs1qSTBmNZ6MyDxAQr1ybF/sqzOXtnBmJm894lxdIZ8=;
        b=MBe6Q3npVLesLz7/eAB/W+nfThB3DtR3Kir5jkEk9xkJz/38Tja/DS9LBemsQvo5hX
         jZ2yswzSCF7m1bViw2SVsPfjEmW/lucVIlsinMH7CUljyATSylAu80amyMlrrFq+BSdx
         sTm1g8e/NOWbcJ8LwkLdSU0FWBEtMlwogBv9RtnJV66lAFgvk4Py7PQHbnsbR+sUzTOL
         t6LdwPv9E65dCZtpcLpd3oBWxavxa79tN67oj9/SB+FzqG43Iw5mz+B/QSDKgee4kOMT
         nBnT9y5SGNbBgxe1T7g2/0EWMBTEZ+io6MknKNDC2YbBFb0AjmZgue4BbkNvz40nuM4+
         +01w==
X-Gm-Message-State: AOAM5307iIyPenfmU0LHn7a17IQi0pH3IJMDsssg9C7R3+z57cFehxik
	sFRooB9KRuJ9tVda80OOZOTzGSH09qA=
X-Google-Smtp-Source: ABdhPJw9AC8SqgTmEg5gThVactbzhJlZGRBSwxSqIJewZU3bb/+e3+8m84on7iyL531mU6tp0UWEgA==
X-Received: by 2002:a05:620a:8d0:: with SMTP id z16mr711055qkz.394.1620309603611;
        Thu, 06 May 2021 07:00:03 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 09/13] vtpmmgr: Support GetRandom passthrough on TPM 2.0
Date: Thu,  6 May 2021 09:59:19 -0400
Message-Id: <20210506135923.161427-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
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
v2:
Add bounds and size checks
Whitespace fixup
---
 stubdom/vtpmmgr/marshal.h          | 15 ++++++++
 stubdom/vtpmmgr/vtpm_cmd_handler.c | 61 +++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/stubdom/vtpmmgr/marshal.h b/stubdom/vtpmmgr/marshal.h
index dce19c6439..f1037a7976 100644
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
@@ -920,8 +929,14 @@ inline int unpack3_TPM_RQU_HEADER(BYTE* ptr, UINT32* pos, UINT32 max,
 		unpack3_UINT32(ptr, pos, max, ord);
 }
 
+static
+inline int sizeof_TPM_RQU_GetRandom(BYTE* ptr) {
+	return sizeof_TPM_RQU_HEADER(ptr) + sizeof_UINT32(ptr);
+}
+
 #define pack_TPM_RSP_HEADER(p, t, s, r) pack_TPM_RQU_HEADER(p, t, s, r)
 #define unpack_TPM_RSP_HEADER(p, t, s, r) unpack_TPM_RQU_HEADER(p, t, s, r)
 #define unpack3_TPM_RSP_HEADER(p, l, m, t, s, r) unpack3_TPM_RQU_HEADER(p, l, m, t, s, r)
+#define sizeof_TPM_RSP_HEADER(p) sizeof_TPM_RQU_HEADER(p)
 
 #endif
diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
index 2ac14fae77..c879b24c13 100644
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
@@ -772,6 +773,64 @@ static int vtpmmgr_permcheck(struct tpm_opaque *opq)
 	return 1;
 }
 
+TPM_RESULT vtpmmgr_handle_getrandom(struct tpm_opaque *opaque,
+				    tpmcmd_t* tpmcmd)
+{
+	TPM_RESULT status = TPM_SUCCESS;
+	TPM_TAG tag;
+	UINT32 size;
+	const int max_rand_size = TCPA_MAX_BUFFER_LENGTH -
+				  sizeof_TPM_RQU_GetRandom(tpmcmd->req);
+	UINT32 rand_offset;
+	UINT32 rand_size;
+	TPM_COMMAND_CODE ord;
+	BYTE *p;
+
+	if (tpmcmd->req_len != sizeof_TPM_RQU_GetRandom(tpmcmd->req)) {
+		status = TPM_BAD_PARAMETER;
+		tag = TPM_TAG_RQU_COMMAND;
+		goto abort_egress;
+	}
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
+	/* Returning fewer bytes is acceptable per the spec. */
+	if (rand_size > max_rand_size)
+		rand_size = max_rand_size;
+
+	/* Call TPM2_GetRandom but return a TPM_GetRandom response. */
+	/* TPM_GetRandom resp: <header><uint32 num bytes><num random bytes> */
+	rand_offset = sizeof_TPM_RSP_HEADER(tpmcmd->resp) +
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
@@ -842,7 +901,7 @@ TPM_RESULT vtpmmgr_handle_cmd(
 		switch(ord) {
 		case TPM_ORD_GetRandom:
 			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_GetRandom\n");
-			break;
+			return vtpmmgr_handle_getrandom(opaque, tpmcmd);
 		case TPM_ORD_PcrRead:
 			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_PcrRead\n");
 			// Quotes also need to be restricted to hide PCR values
-- 
2.30.2


