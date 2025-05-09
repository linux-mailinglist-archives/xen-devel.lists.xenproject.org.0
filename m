Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50ABAB1A3B
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980225.1366694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQR7-0006JL-AQ; Fri, 09 May 2025 16:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980225.1366694; Fri, 09 May 2025 16:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQR7-0006Gj-7S; Fri, 09 May 2025 16:18:57 +0000
Received: by outflank-mailman (input) for mailman id 980225;
 Fri, 09 May 2025 16:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bi0W=XZ=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uDQR6-0006Gd-66
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:18:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dafddab-2cf1-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 18:18:55 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so461367766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:18:55 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197463edsm171155266b.105.2025.05.09.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:18:53 -0700 (PDT)
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
X-Inumbo-ID: 4dafddab-2cf1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746807534; x=1747412334; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQp/dECIkzIFiolzpT72X9wuTH17rT3cBg1gE2cfj5s=;
        b=WOP3JfvUpJDube1XTndd2ZVol1A8ZpFpErYBN6i2lCJthl4Vlfqg7LXg+KWCwyQj2w
         a5m3Q3TRVl9HRIgfTPf6DjpKTbThfgCbMe9lXbhJtg4DOM4IpOC1SfchYydzV5wXZGlH
         jOYmfI9OP9wFnHpK7Y1HKXJolgEk1nvE6riZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807534; x=1747412334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQp/dECIkzIFiolzpT72X9wuTH17rT3cBg1gE2cfj5s=;
        b=S4DNPTxzSRbpDHrvTAvRzwyan7h2s8izQTjER/eZtd2gyMfgT4qD0bkRJrkgQS0axW
         cu0SEbPwf1UTM0VX97/y5D64x+2/f7OvH2zV2vRJm+R7gVsc6hNRLIvF0YY1HJs+yIX0
         u+M7w/qgsv7KZYb3ZGbpQRMOA2qhs0s1bViDgkOR3GX5czM0wndUi23Dgv7Xz97q8eft
         YWnG+4AJdIw4GOEcuzxATwoLrAcUDjMRmsD9qps1fm2t73WrwqNyBuHHsE7YCRkQxG+d
         kYBfnYBfBRXoPEantXH99KK9wZiPDQlKHiopDN1K+eaejO4/X3ocnppuZ9VUqQqNhXse
         xUJg==
X-Gm-Message-State: AOJu0YzeAAhIHghL5L+a82EIaxn2iWgLkKFgo9pUJrPGYG+jCxhpMmRF
	msWywJgjrNuP0jmUeqoXpo+itTesPBpPnnpvlVZczmBbHDaqaO+Sc8HcOA8N7l5scAbC10mSPOw
	=
X-Gm-Gg: ASbGncubtcFberrXoQd2EiJQzGpgjhVSkJ8D4ISlq3tdSfFGriMazOOJFkqvWMaQcsi
	jRSDHIX5RcOI6nOH6rXuEZm61yUvTX0g36ri6XYLUUUxQahxJwKyc4aEK0nFM0PcuNMq99nxndD
	G3dB3zz5XUeSy/gd29yV61TDPCJm+MgLbHV3b7NRa3WWv3nBqN6Hu59/41QSyYIOYRTfFWjkvZq
	PzCs6vI6vLW04H030WZGlGv6k33Gl9cpgMszwrjEuGoSuL3DdDhaxVlFgvRmMBf0/V9sLBWzxcp
	gv3FFXRQztFmkkLeh+1bkCkY9xMkfO3QsJcDhWuUru+AfgOfDZMiDMtWvD0D2nDGz18tRUC0Qds
	=
X-Google-Smtp-Source: AGHT+IFeFh0zbvzD87+1cpjr/b8zShG/gnOAdP5Syn5KzgmAtHV2xFsIb3qXc7NRFrsESHnTs2oHEw==
X-Received: by 2002:a17:906:6b91:b0:ad2:1f65:8562 with SMTP id a640c23a62f3a-ad21f658724mr219650466b.14.1746807534186;
        Fri, 09 May 2025 09:18:54 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] docs: Introduce live patch signing
Date: Fri,  9 May 2025 17:18:46 +0100
Message-ID: <20250509161846.45851-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a never-implemented description of live patch signing from the
TODO section and document signing as implemented by the following
patches.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 docs/misc/livepatch.pandoc | 104 ++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index 04dd5ed7b271..66141586b605 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -917,6 +917,58 @@ The normal sequence of events is to:
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
+The ELF note section name shall be `.note.Xen.signature` with note name `Xen`
+and type `0`.
+
+The note data shall contain a header followed by the signature data:
+
+    #define SIGNATURE_SUPPORTED_VERION 1
+    #define SIGNATURE_ALGORITHM_RSA 0
+    #define SIGNATURE_HASH_SHA256 0
+    struct payload_signature {
+        uint16_t version;
+        uint8_t algo;        /* Public-key crypto algorithm */
+        uint8_t hash;        /* Digest algorithm */
+        uint32_t sig_len;    /* Length of signature data */
+    };
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
 
@@ -1178,58 +1230,6 @@ the function itself.
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


