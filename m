Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86348AB82F5
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985050.1370987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV37-0005nY-KJ; Thu, 15 May 2025 09:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985050.1370987; Thu, 15 May 2025 09:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV37-0005la-HD; Thu, 15 May 2025 09:38:45 +0000
Received: by outflank-mailman (input) for mailman id 985050;
 Thu, 15 May 2025 09:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjGQ=X7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uFV36-0005Wo-Am
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:38:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a9bdcd-3170-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:38:42 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so155071666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:38:42 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23ad2b386sm895152066b.104.2025.05.15.02.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 02:38:41 -0700 (PDT)
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
X-Inumbo-ID: 63a9bdcd-3170-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747301922; x=1747906722; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2YHsd33az4IEQZXfpbWWt/V02BA69yDMw7arHlEWzs=;
        b=krVBeBxOPYRGFb+F9301t/XpI9Rd2+8mbAjzmdIauqOmk+PvABoJs3vsU2ufYldPKt
         1S3AiZjkEinvH0qLZeEKiVSosNtJlnqSN68+hSUPdOxpNEbWFKm7/LmMheBjzZjbRuNq
         3dANTAIWGB+cPJqS+wqrXNNgInDlUP1oQbVXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301922; x=1747906722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2YHsd33az4IEQZXfpbWWt/V02BA69yDMw7arHlEWzs=;
        b=C3mO4+60HfCDpnyTRvoU9YJkYonCvKIK/dxTKho0YRlC1yIwLAVO0Pr+DggSloFfcy
         LJ4zTFgJjwNqYUn1gQdlqLvlg/SNWOYW/P64mqJTU9s7ftzohK658nFUB0fWidr9w0fb
         ILU9bZF0f3zHENT+QRR4Lwc0rXAZ1RzfKchZskVIu7FqLsxXzvgGrmJOYubEVW31w+II
         NeOHiONvSmrQKXppwLTe+YOnUp31tVKSU/KAv7g2lu5iZv1J8Apq7yYycIHaVFDzFqdz
         9bbQtlxdDUWQ3pWrLpfr0FluPOFDPChg3+bD95VBuGoOlw6ARDHq8ak6cdQCIx1gQtSn
         qRig==
X-Gm-Message-State: AOJu0YxhT1feX3vmdFJQXz7RnYW7wvjG8VZHg0iyuKdU+F7PKeTX1Avi
	v72kpI0pZgcvPvup97+NzVP9U2JCmYdBvnSt7rmsp2wFhjgnS19YVPMwweVwwD5TIiG07xt6zwk
	=
X-Gm-Gg: ASbGncvxO9NSsP7RlNkEqJkhHA8xUTVt1T1Z7TRCcGK+pnhgjo0A1cZirMqDYM4ZcFF
	oi20jzztu/fvurYRKQ2fzqP4wMwnPp+G9kLh2+vJWGZOu6pwDVE47JuA8kGK44HStLDU0VJngBz
	8tJXtW6BNPdQ8z6uoR6cb/XTXPxASvUGDzMswID3DAUVjkNe02jEmZcn2aW9mS1pfPSCdJn4H4x
	0OV3cFCHVn5Cb0QyYWBFjZGGK2N0fSB1XJ7shbzgRIRgeRkjciFEXIXpqg+oeWc4R5v8KM0K/Bb
	kLNBHy6U3FQV6XA8SOUZTkdHuOrbJ+eKxXPXLa06NwpUNab4gWg02H3zPzK3xZNXvg3opwp6dk4
	=
X-Google-Smtp-Source: AGHT+IF+f/RtLS/hvRlt47H9AFouG2ljmzVe92Nty3OLMq+adiQ7hLsqzwfllbyPq84XBTD5fLGNbg==
X-Received: by 2002:a17:907:c00f:b0:ad5:112:490b with SMTP id a640c23a62f3a-ad50f59115cmr249485466b.9.1747301921819;
        Thu, 15 May 2025 02:38:41 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/5] docs: Introduce live patch signing
Date: Thu, 15 May 2025 10:38:16 +0100
Message-ID: <20250515093822.659916-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515093822.659916-1-ross.lagerwall@citrix.com>
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a never-implemented description of live patch signing from the
TODO section and document signing as implemented by the following
patches.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:

* Use ELF note type and descriptor length rather than a custom header.
* Rename SIGNATURE_SUPPORTED_VERION

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


