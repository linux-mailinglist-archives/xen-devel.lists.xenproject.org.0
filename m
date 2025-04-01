Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371EA77BB9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934110.1335919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMQ-0000SN-Eu; Tue, 01 Apr 2025 13:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934110.1335919; Tue, 01 Apr 2025 13:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMQ-0000QC-BU; Tue, 01 Apr 2025 13:08:58 +0000
Received: by outflank-mailman (input) for mailman id 934110;
 Tue, 01 Apr 2025 13:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMP-0000Od-8u
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:08:57 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76ee7198-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:08:55 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so10105035a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac719278d40sm758430666b.43.2025.04.01.06.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:47 -0700 (PDT)
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
X-Inumbo-ID: 76ee7198-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512934; x=1744117734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsEpEdsMppdQXfKAAy8KJLkcIZ3dN80EvB2RdrH7vDo=;
        b=TvDoznc4sPuIsNPC+8tzsVYHSzRFgVmjwpFGZMTiRg2vleHRbsvNuKel5vgbh+pTwj
         8RKxRZj1C90M75lrlYxnfDyoMY8boKCWhHWegcwHq18xxN3XWPx3qfb1YNYshENmR4RW
         az5w8NAcBOlUlyvIdk4RunMQp2WEopyeTNOg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512934; x=1744117734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsEpEdsMppdQXfKAAy8KJLkcIZ3dN80EvB2RdrH7vDo=;
        b=N5Byvf8iw3Ii90N6h6ZPFTKZh5HxiYnehH1QmtG4f35OCIE/fayRbqnWByRqGIvmrx
         QpgPug7CL6tu+ygUqa+RToXCR178XAmunHlfoqloJtx+qE5j6deE56D7hJ4yjsHJp8IU
         npl8dLsldp5rVg7gHgGqTJxhPzVFqcnWuNEiED59rU39ZsmpkleTahlzYp9iPosUiqK5
         DVVcZZhwlafLg/6xPBrq6Mhn5cE6MxNsp3S9caWaYtlnpDCBXPDVV5dULGWsQnj4gXzm
         aAWcv8G122BM//DDv8O37sapFkpy3jdYQ+R/Ivf2eC6U1yWPIV/tsRVuqo8Sv5I/X3al
         1L3A==
X-Gm-Message-State: AOJu0YySjyILldvr9ItkD/aF0KvW/q38K/J4YGzcwgpkLsfNjlKiEigT
	3nhP019VA8LAKdi+xBi8g/rg0whpgiESJQR6JBcQkOK/G2KJVV69Mr2ZyGjcwT6/VrDtfGHUarp
	c
X-Gm-Gg: ASbGnct/WyIoYzuwqza8cVoaHzLkjXhlqVqVuToQyJEndshQJTiSCLn1wXNaducuECB
	jcQSAbu00h8+bk+yQiUoVDU2F/mJiADLZxlxYMrVaHk8OCgkwCP6KElLaMXMKj3HrT7DG7bOKea
	/smZlmz+9dGb4R7kp1/+uTYmYRdgj/hEk3dje2DNR+guwKGZLWnJjFHuh03Sffw38/8vHqUk2yv
	tLRioINJfBn4E9nLdVI2dIBQSaRTnd6w/aSxZU6qE96TQbSs8Pn3EddqjJNJTsvrl+hx2EwK7lu
	JBJoDEPFUnGlIRYTOMd0/PReNzLi/EEwUwEXu21ZzDj0STDGAA==
X-Google-Smtp-Source: AGHT+IEjNM0hl1ZuDEUz8kinw6uldqxQXFDuinCrTlRAbXXd1L6CBSNezmpIgEeTcYwhFpI/avEATA==
X-Received: by 2002:a17:907:3e1d:b0:ac3:3f11:2955 with SMTP id a640c23a62f3a-ac738bae5ffmr1213282666b.39.1743512928140;
        Tue, 01 Apr 2025 06:08:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
Date: Tue,  1 Apr 2025 15:08:31 +0200
Message-ID: <20250401130840.72119-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The base address is in the pe32_opt_hdr, not after it.

Previous to commit f7f42accbbbb the base was read standalone (as the first
field of pe32_opt_hdr).  However with the addition of reading the full
contents of pe32_opt_hdr, such read will also fetch the base.  The current
attempt to read the base after pe32_opt_hdr is bogus, and could only work
if the file cursor is repositioned using lseek(), but there's no need for
that as the data is already fetched in pe32_opt_hdr.

Fixes: f7f42accbbbb ('x86/efi: Use generic PE/COFF structures')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/efi/mkreloc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
index 375cb79d6959..1a6cfc845cba 100644
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -35,7 +35,6 @@ static unsigned int load(const char *name, int *handle,
     struct mz_hdr mz_hdr;
     struct pe_hdr pe_hdr;
     struct pe32_opt_hdr pe32_opt_hdr;
-    uint32_t base;
 
     if ( in < 0 ||
          read(in, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
@@ -55,7 +54,6 @@ static unsigned int load(const char *name, int *handle,
     if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
          read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
          read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
-         read(in, &base, sizeof(base)) != sizeof(base) ||
          /*
           * Luckily the image size field lives at the
           * same offset for both formats.
@@ -73,11 +71,12 @@ static unsigned int load(const char *name, int *handle,
     {
     case PE_OPT_MAGIC_PE32:
         *width = 32;
-        *image_base = base;
+        *image_base = pe32_opt_hdr.image_base;
         break;
     case PE_OPT_MAGIC_PE32PLUS:
         *width = 64;
-        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
+        *image_base = ((uint64_t)pe32_opt_hdr.image_base << 32) |
+                      pe32_opt_hdr.data_base;
         break;
     default:
         fprintf(stderr, "%s: Wrong PE file format\n", name);
-- 
2.48.1


