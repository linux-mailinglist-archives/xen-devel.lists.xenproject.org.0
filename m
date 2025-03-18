Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FB5A67B0C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919604.1324009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarQ-00063c-3k; Tue, 18 Mar 2025 17:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919604.1324009; Tue, 18 Mar 2025 17:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarQ-00060w-0T; Tue, 18 Mar 2025 17:36:16 +0000
Received: by outflank-mailman (input) for mailman id 919604;
 Tue, 18 Mar 2025 17:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarO-00060R-LD
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:14 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c5a6872-041f-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:36:13 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2241053582dso17555595ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:13 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73711559fbdsm10188371b3a.59.2025.03.18.10.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:11 -0700 (PDT)
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
X-Inumbo-ID: 7c5a6872-041f-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319371; x=1742924171; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUEaJN3qk40R1uwMWELSbGR36i1jo84C4OMy7cnNyV8=;
        b=hG1fMqZze26zORus0LgCQMTROFWgcJROkpR3hPnC92xyeCsCYPu6b9R8aKnkDIoh0B
         nX0sjqwEC7BvwMy7qCrA7F40gwXfVUbAqodfbMwsIDEEzZ9wsvheVzq7Ex9mu2t7g0uf
         vaE+7Esk3aKyA1i4l7sU/VmjAxpvKd2dXOEBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319371; x=1742924171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUEaJN3qk40R1uwMWELSbGR36i1jo84C4OMy7cnNyV8=;
        b=A4scnvx3G8qsAd7bikcK667hCPCV4EQzkaSl4oer/v2gCO9g3GMXWK6qprjmFl7Rql
         zUG0CSUgN0cnBVausNAD4FXGSVCYPlt0OxoybN26dKHMzYiXY+X2Od8swCLT65Ho/2b/
         DfQbs01RWsI/G9dkFpdAixHOzaNYnIYEdBZGMyjkjKFlKayk5GqUS91tbYoyqkeG0zM6
         RNt8SNPbNQf44PNhr2EDMgVP1p0HWUy0sbRUDDqTqlW4ZUMpAuQ+iN2wNy6mDgtK25si
         rsKgCOoo9cLQYYp+SD+FpSRjE10b5fKyj4hX9N7B4vvvfU3PFHbdhifU3cstZ/4vxM3v
         O2xw==
X-Gm-Message-State: AOJu0Yx6NB5gSWCaj+KJFwihHnlZuUSvjaphh0+rjTwUsbb6R09VATCt
	m9walrolgnfNZEVhvUTchPqEsKp/Us9E8dyc+b6zHYGGSMa7Ca0jdXrHekT2J55u7i5lqu7TCNx
	X
X-Gm-Gg: ASbGncvTCo+OTiuvSrMHIEkULD7jGKq0MSjTuWslX7kcSf6JZrdiuWDVnebgUZDm9XU
	lzoFQLMpeI8wrL2D1YUlAP5QwqedmOWqnGfR11sd15H3h2/roiivrRnLwUtWUaX+17ECwVm2IA0
	F/2NDNVMZfL42wFAAxgde3yIbft3x85MaD5Jz3LqL023tbA2bR+cvXytogIG9cMil+RNdptp+pB
	ZzUsTHocD/OQaSaule/CG6s2+TN2OdKyTCpYQfHGLgFe6VRlecTd3fdWdabpDwOevG+Uy9pqLiU
	s4QRLJWAYpWxP2+qEJTuInEVqjzqQSrfoY1QryGF8iPYCCNanqts36rHXFhk
X-Google-Smtp-Source: AGHT+IH2R6siyXGAz8aZjbViKwajC/tho9oLL/4Wb2zYe1yWYtyAyqk9V90VPcsDu6vuIALGOLdFcw==
X-Received: by 2002:a05:6a21:682:b0:1ee:ef0b:7bf7 with SMTP id adf61e73a8af0-1f5c118e79cmr23419070637.19.1742319371488;
        Tue, 18 Mar 2025 10:36:11 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/7] x86/mkelf32: account for offset when detecting note segment placement
Date: Tue, 18 Mar 2025 18:35:42 +0100
Message-ID: <20250318173547.59475-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mkelf32 attempt to check that the program header defined NOTE segment falls
inside of the LOAD segment, as the build-id should be loaded for Xen at
runtime to check.

However the current code doesn't take into account the LOAD program header
segment offset when calculating overlap with the NOTE segment.  This
results in incorrect detection, and the following build error:

arch/x86/boot/mkelf32 --notes xen-syms ./.xen.elf32 0x200000 \
               `nm xen-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$/0x\1/p'`
Expected .note section within .text section!
Offset 4244776 not within 2910364!

When xen-syms has the following program headers:

Program Header:
    LOAD off    0x0000000000200000 vaddr 0xffff82d040200000 paddr 0x0000000000200000 align 2**21
         filesz 0x00000000002c689c memsz 0x00000000003f7e20 flags rwx
    NOTE off    0x000000000040c528 vaddr 0xffff82d04040c528 paddr 0x000000000040c528 align 2**2
         filesz 0x0000000000000024 memsz 0x0000000000000024 flags r--

Account for the program header offset of the LOAD segment when checking
whether the NOTE segments is contained within.

Fixes: a353cab905af ('build_id: Provide ld-embedded build-ids')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/mkelf32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/mkelf32.c b/xen/arch/x86/boot/mkelf32.c
index 5f9e7e440e84..91742162bbb1 100644
--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -358,7 +358,8 @@ int main(int argc, char **argv)
         note_sz = in64_phdr.p_memsz;
         note_base = in64_phdr.p_vaddr - note_base;
 
-        if ( in64_phdr.p_offset > dat_siz || offset > in64_phdr.p_offset )
+        if ( in64_phdr.p_offset > (offset + dat_siz) ||
+             offset > in64_phdr.p_offset )
         {
             fprintf(stderr, "Expected .note section within .text section!\n" \
                     "Offset %"PRId64" not within %d!\n",
-- 
2.48.1


