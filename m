Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B99ACAF25
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003320.1382847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LQ-0000CH-CZ; Mon, 02 Jun 2025 13:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003320.1382847; Mon, 02 Jun 2025 13:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LQ-0000A4-8c; Mon, 02 Jun 2025 13:36:52 +0000
Received: by outflank-mailman (input) for mailman id 1003320;
 Mon, 02 Jun 2025 13:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5LO-00009x-Vx
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:36:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a24a17a9-3fb6-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 15:36:48 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-604e2a2f200so8506176a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:36:48 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm801962166b.39.2025.06.02.06.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:36:47 -0700 (PDT)
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
X-Inumbo-ID: a24a17a9-3fb6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871408; x=1749476208; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCihro/AP9pN/FWCTSPFf8bcTbZs+EZ03FJTcWvuD/4=;
        b=OtFfnsmcW1m4WDTknDBC0qg/zn5SlpoB0BAxd0RTjF1u/TXyCAZYuUsCVeg3Ufkgry
         xLJVs+L+2XAwe6Nkp0S+SB4trsxPsNjjd2yfbxA+/XJMJJz8M7WsuhEKqHOI116cLuSs
         qVJY0czgyhhP2MKaHx+T65v1ugO06LhUwPlFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871408; x=1749476208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCihro/AP9pN/FWCTSPFf8bcTbZs+EZ03FJTcWvuD/4=;
        b=GLu2BhPA9m9HdytqUKXvdn7vjFm+VOIj1WJ5WsDAA/CB+tafaMQ1taUaaN3VAXXxq1
         AdtaYql53bJgEIJFIyJTQNIyIwiasR7viULYKTk8Tcoa1JqYDCF+ObAn8yS4iFNXYPS6
         ZXpnbdZMV8ZpGro4Uz5tWDpbOxhST60V16TqGgoNmGrlm7vlOkpAtN1ES7/trruxOgtg
         EVEfsYjaf7R7BqroquhELy1eqC9miB4E3tZCjjWJ3nVMR23E0gI8KEJlkqynFowYNrk1
         zvWGEaa9az2jBDZQnW1HFmSRxuhwX5APH94xqV5iqY8rhMF5ITG+wcJL3Nb9tsILRld0
         /Dbw==
X-Gm-Message-State: AOJu0YzV3BjRGNSJ62YqtvZHXK/1fMwhaZzz9Gta3YsD5y7RdRROUTrp
	sFv/CP1LBDFDgHCPfGsnnZJQQAC8JVPc0pYVmzCVY24xtKzsq6X0fyox1WrThTkzDLPfCYVol3F
	s2LY=
X-Gm-Gg: ASbGncu1df5nHXwu0ooCpsERJArbiKjoP1YnXyDo0TNRC5pizBYWmuzgFuztDrWhaYi
	mrKBVM+PnGdfW8Ygi2CyjNmfyoQSOvGc7eUVmt19zT76ahpwPaf+h/Dza89t5jMk8fbS1oGiQ10
	zq51/glCtxfcZHjne2VYe36GrY/hgxyOzCpjoPpmjitjb3FBxcLUoDOroOWbSoEmp4HCvNt9b/a
	tLFgISPIoKKQtbHJS+q0K9izULvhUBeBPcMXYy4yebaBz6V1Iy/AF/pCArJlH3xJ5DD0m2PtYhb
	f3zkZmj90E43H4I2UBu1Id/v5rZSm7Ve9SMggEkbl0fKigyhinlDTBjnOae3EfXn2iWKS1vrKz7
	G33gxVvnX3Q==
X-Google-Smtp-Source: AGHT+IGVgPnsadP3szTnZtAQeJxjgRkT8ybKYWCQN5JNzzSzY2mYQPNgmqzXA9vfQk9H+u9mGRrQVg==
X-Received: by 2002:a17:907:9611:b0:ad8:7fd2:7754 with SMTP id a640c23a62f3a-adb49560382mr770807066b.47.1748871407899;
        Mon, 02 Jun 2025 06:36:47 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/5] docs: Introduce live patch signing
Date: Mon,  2 Jun 2025 14:36:33 +0100
Message-ID: <20250602133639.2871212-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a never-implemented description of live patch signing from the
TODO section and document signing as implemented by the following
patches.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

No change in v3.

 docs/misc/livepatch.pandoc | 106 +++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 52 deletions(-)

diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index 04dd5ed7b271..f36de449e992 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -917,6 +917,60 @@ The normal sequence of events is to:
  3. *XEN_SYSCTL_LIVEPATCH_ACTION* with *LIVEPATCH_ACTION_APPLY* to apply the patch.
  4. *XEN_SYSCTL_LIVEPATCH_GET* to check the `->rc`. If in *-XEN_EAGAIN* spin. If zero exit with success.
 
+## Signature Checking
+
+While loading live patches would generally be restricted to a privileged
+process in dom0, in certain cases signature checking in Xen may be required.
+For example, when Secure Boot is enabled live patches need to be verified
+before being loaded.
+
+Xen live patches are ELF binaries but there is no standardized mechanism for
+signing ELF binaries. One approach used by Linux is to append a signature to
+the end of the binary, outside of the ELF container. While this works, it tends
+to be fragile since tools that handle ELF binaries do not correctly handle the
+signature. Instead, the approach taken here is to use an ELF note for the
+signature.
+
+The ELF note section name shall be `.note.Xen.signature` with note name `Xen`.
+The note type shall encode the signature version, algorithm, and hash:
+
+* version - uint16_t, bits 0-15
+* algorithm - uint8_t, bits 16-23
+* hash - uint8_t, bits 24-31
+
+All other bits of the note type shall be zero.
+
+The known values for the above fields are:
+
+    #define LIVEPATCH_SIGNATURE_VERSION 1
+    #define SIGNATURE_ALGORITHM_RSA 0
+    #define SIGNATURE_HASH_SHA256 0
+
+The note descriptor length defines the length of the signature.
+
+To sign a live patch:
+
+1) Add a new note section with a populated payload signature and zeroed out
+   signature.
+2) Generate a detached signature over the entire binary.
+3) Fill in the signature in the note section.
+
+During live patch load, Xen shall verify the signature using the following
+steps:
+
+1) Copy the signature out of the note section.
+2) Zero the signature.
+3) Generate a detached signature over the entire binary.
+4) Compare against the signature from (1).
+
+Initially, to avoid including DER / X.509 parsing of certificates, handling
+chains, etc. Xen shall verify signatures against a compiled in RSA key in
+exponent/modulus form. However, it may be extended in future to support other
+types of signatures and key types.
+
+Support of signatures in Xen and in live patches is optional. However, certain
+features such as Secure Boot may require live patches to be signed.
+
 
 ## Addendum
 
@@ -1178,58 +1232,6 @@ the function itself.
 Similar considerations are true to a lesser extent for \__FILE__, but it
 could be argued that file renaming should be done outside of hotpatches.
 
-## Signature checking requirements.
-
-The signature checking requires that the layout of the data in memory
-**MUST** be same for signature to be verified. This means that the payload
-data layout in ELF format **MUST** match what the hypervisor would be
-expecting such that it can properly do signature verification.
-
-The signature is based on the all of the payloads continuously laid out
-in memory. The signature is to be appended at the end of the ELF payload
-prefixed with the string '`~Module signature appended~\n`', followed by
-an signature header then followed by the signature, key identifier, and signers
-name.
-
-Specifically the signature header would be:
-
-    #define PKEY_ALGO_DSA       0
-    #define PKEY_ALGO_RSA       1
-
-    #define PKEY_ID_PGP         0 /* OpenPGP generated key ID */
-    #define PKEY_ID_X509        1 /* X.509 arbitrary subjectKeyIdentifier */
-
-    #define HASH_ALGO_MD4          0
-    #define HASH_ALGO_MD5          1
-    #define HASH_ALGO_SHA1         2
-    #define HASH_ALGO_RIPE_MD_160  3
-    #define HASH_ALGO_SHA256       4
-    #define HASH_ALGO_SHA384       5
-    #define HASH_ALGO_SHA512       6
-    #define HASH_ALGO_SHA224       7
-    #define HASH_ALGO_RIPE_MD_128  8
-    #define HASH_ALGO_RIPE_MD_256  9
-    #define HASH_ALGO_RIPE_MD_320 10
-    #define HASH_ALGO_WP_256      11
-    #define HASH_ALGO_WP_384      12
-    #define HASH_ALGO_WP_512      13
-    #define HASH_ALGO_TGR_128     14
-    #define HASH_ALGO_TGR_160     15
-    #define HASH_ALGO_TGR_192     16
-
-    struct elf_payload_signature {
-	    u8	algo;		/* Public-key crypto algorithm PKEY_ALGO_*. */
-	    u8	hash;		/* Digest algorithm: HASH_ALGO_*. */
-	    u8	id_type;	/* Key identifier type PKEY_ID*. */
-	    u8	signer_len;	/* Length of signer's name */
-	    u8	key_id_len;	/* Length of key identifier */
-	    u8	__pad[3];
-	    __be32	sig_len;	/* Length of signature data */
-    };
-
-(Note that this has been borrowed from Linux module signature code.).
-
-
 ### .bss and .data sections.
 
 In place patching writable data is not suitable as it is unclear what should be done
-- 
2.49.0


