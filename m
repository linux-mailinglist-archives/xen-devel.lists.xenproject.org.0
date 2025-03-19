Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EBA68EBD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920756.1324829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuDz-00074x-1I; Wed, 19 Mar 2025 14:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920756.1324829; Wed, 19 Mar 2025 14:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuDy-00073V-UB; Wed, 19 Mar 2025 14:16:50 +0000
Received: by outflank-mailman (input) for mailman id 920756;
 Wed, 19 Mar 2025 14:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiIg=WG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuuDx-00073P-CP
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:16:49 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0b4957-04cc-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 15:16:47 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso6011913f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:16:47 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c82c23ffsm20710718f8f.22.2025.03.19.07.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:16:45 -0700 (PDT)
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
X-Inumbo-ID: cb0b4957-04cc-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742393807; x=1742998607; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syUcGlh1+48HodplrOQn4hV7HLvSUJfciWptysj8SAo=;
        b=aa4mYfQutEiX7u0Oui7kjdrgJV2pscalpYAUoSF23+dwcwa8gXgEP4rFpceTyzmBpL
         tgL8J68d7nG7W/ezxJe6qUUdvqtnfFtUPanCqs4yjEBssnBbWS0J1OKs46dAisIprnFK
         E9q0czoJ1THpDgZ3xm7SqYFUhEE9SD+EbjNE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393807; x=1742998607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syUcGlh1+48HodplrOQn4hV7HLvSUJfciWptysj8SAo=;
        b=YtSekTEqZgC1i9p5h9wWROky0gn5cU1rBnGLvOUw8XRqQL4yn7pQqJ4TWDEEcPbt8V
         wuqjYEaGttovGqT5NmaZmtK4suc5YteEe/q6c+AteyTeMn8TeEm4L3pQGsGy3EHlUNW1
         ZfD4K2yT0XPwGGpBw5gf5SkVsIM/7zDubD2wXGQfbE6JDKMTM1mRvEsoLIcoMF4jUSWR
         04t+FX5w3u88734pC1Lwxr5ztFNJc4hEPC4v5Mro+5+ied0p0Y4UrWD8sezcSy4Tgspf
         6PLUUo1GIGaMX5rM6dGjF2WI48Bwy2pjQORl6RnvRaiwSQsLZwcNZ2Bi9e4/i69lr4/1
         9S+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT725AsB+AswOUvFsySiMryxOc79oenvTUqNneJueshOuZuvIkbZg1BW1bTCOPYFN6ROeveIbVGWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySf+Qrvs33+UuhAQO6rHqOcXqYXgWGTbtOB7a+4h3nNNQ7doGE
	n+jcuenZAbeyWBuwpbhNQL2e21gTFHHGFs9PStNWQT36Me7GsxLepWSJWRN3dVc=
X-Gm-Gg: ASbGncvZkccgpaidRXFO2zarArbtbIfJZKN8YaRGoHW069qtB0X210IUTFuLzh3ok6H
	cMMIcxBKVcJ9u9yUopuA0WWwcNFw+ARvT2XZo7+GtopPAIW9bJFLMKke7W/B5lpS2z5HOvIRkS3
	B4qenMIvrVBvYbcxFxRDvI7Up51ONyrYJftMXLwkullziLb0hUcHFdQzYRETTJY7PCmMPAIEnTN
	Ioyll3fMt9DuJmqaun5OOt2wIY5mmu5b/ak0XHSInJGamNpXbaeMgryXRNfFMTJvr1r/RNlx/9R
	s1W3VYvCyKtQioySEMof0B3xu+i1Z+NH4L/XC0ItO0AQXNlqOicfarw=
X-Google-Smtp-Source: AGHT+IG1yMM0PUXizVzizKFTtc1vXOY7qJAWgLeTGtbLOc1AOB+kKXNzbZo0kmrI8wsgfp726MZBhA==
X-Received: by 2002:a5d:64c5:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-399739b4353mr2210927f8f.3.1742393806332;
        Wed, 19 Mar 2025 07:16:46 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:16:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] x86/mkelf32: account for offset when detecting note
 segment placement
Message-ID: <Z9rRzRQnHLtUOpQs@macbook.local>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-3-roger.pau@citrix.com>
 <1dce6993-09d7-4f04-8ccc-908a0a4cc10f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1dce6993-09d7-4f04-8ccc-908a0a4cc10f@suse.com>

On Wed, Mar 19, 2025 at 11:07:33AM +0100, Jan Beulich wrote:
> On 18.03.2025 18:35, Roger Pau Monne wrote:
> > mkelf32 attempt to check that the program header defined NOTE segment falls
> > inside of the LOAD segment, as the build-id should be loaded for Xen at
> > runtime to check.
> > 
> > However the current code doesn't take into account the LOAD program header
> > segment offset when calculating overlap with the NOTE segment.  This
> > results in incorrect detection, and the following build error:
> > 
> > arch/x86/boot/mkelf32 --notes xen-syms ./.xen.elf32 0x200000 \
> >                `nm xen-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$/0x\1/p'`
> > Expected .note section within .text section!
> > Offset 4244776 not within 2910364!
> 
> Not your fault, but: Such printing of decimal numbers is of course very
> unhelpful when ...
> 
> > When xen-syms has the following program headers:
> > 
> > Program Header:
> >     LOAD off    0x0000000000200000 vaddr 0xffff82d040200000 paddr 0x0000000000200000 align 2**21
> >          filesz 0x00000000002c689c memsz 0x00000000003f7e20 flags rwx
> >     NOTE off    0x000000000040c528 vaddr 0xffff82d04040c528 paddr 0x000000000040c528 align 2**2
> >          filesz 0x0000000000000024 memsz 0x0000000000000024 flags r--
> 
> ... any half-way sane tool prints such values in hex.
> 
> > --- a/xen/arch/x86/boot/mkelf32.c
> > +++ b/xen/arch/x86/boot/mkelf32.c
> > @@ -358,7 +358,8 @@ int main(int argc, char **argv)
> >          note_sz = in64_phdr.p_memsz;
> >          note_base = in64_phdr.p_vaddr - note_base;
> >  
> > -        if ( in64_phdr.p_offset > dat_siz || offset > in64_phdr.p_offset )
> > +        if ( in64_phdr.p_offset > (offset + dat_siz) ||
> > +             offset > in64_phdr.p_offset )
> 
> This is an improvement, so fine to go in with Andrew's ack, but it still
> doesn't match what the error message suggests is wanted: This checks only
> whether .note starts after .text or ends before .text. A partial overlap,
> which isn't okay either aiui, would go through fine.
> 
> Oh, and - even in your change there's an off-by-1: You mean >= in the lhs
> of the ||.

Hm, I see, it would be better as:

diff --git a/xen/arch/x86/boot/mkelf32.c b/xen/arch/x86/boot/mkelf32.c
index 5f9e7e440e84..f0f406687cea 100644
--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -358,11 +358,13 @@ int main(int argc, char **argv)
         note_sz = in64_phdr.p_memsz;
         note_base = in64_phdr.p_vaddr - note_base;
 
-        if ( in64_phdr.p_offset > dat_siz || offset > in64_phdr.p_offset )
+        if ( in64_phdr.p_offset < offset ||
+             in64_phdr.p_offset + in64_phdr.p_filesz > offset + dat_siz )
         {
             fprintf(stderr, "Expected .note section within .text section!\n" \
-                    "Offset %"PRId64" not within %d!\n",
-                    in64_phdr.p_offset, dat_siz);
+                    ".note: [%"PRIx64", %"PRIx64") .text: [%x, %x)\n",
+                    in64_phdr.p_offset, in64_phdr.p_offset + in64_phdr.p_filesz,
+                    offset, offset + dat_siz);
             return 1;
         }
         /* Gets us the absolute offset within the .text section. */


