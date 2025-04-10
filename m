Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197EA83AD3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 09:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944937.1343236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mDA-0003Eb-T5; Thu, 10 Apr 2025 07:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944937.1343236; Thu, 10 Apr 2025 07:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mDA-0003CU-QX; Thu, 10 Apr 2025 07:20:32 +0000
Received: by outflank-mailman (input) for mailman id 944937;
 Thu, 10 Apr 2025 07:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSg0=W4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2mD9-0003CO-9i
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 07:20:31 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47bc0bd9-15dc-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 09:20:29 +0200 (CEST)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-af908bb32fdso435947a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 00:20:29 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-306df082327sm2747941a91.15.2025.04.10.00.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 00:20:27 -0700 (PDT)
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
X-Inumbo-ID: 47bc0bd9-15dc-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744269628; x=1744874428; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDCqJtAPc6HHrC0t+DZCAA6aySNFallXOlf5pYlO0lA=;
        b=jy4sYv6njxN7aoFbI9HQ34psfG7RWmYEvmSleL25onVZjhtYAEN82hA1QP5BNzDS/W
         tJ1RtlpkZNDrZOL3iCDFljzDHk0I/F4N+Ri7A9I7Zo3NuwjdoIq0f56BRUVkmrIHCKOV
         Lcp2Ad5r1cCegS9LISZWuUNGWPkf8OjmIDrec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269628; x=1744874428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDCqJtAPc6HHrC0t+DZCAA6aySNFallXOlf5pYlO0lA=;
        b=TCTEztfOvtWi/cVLPOAnhe476X34QYzwssz5YsFlRLzm9hLrHwhdZkNdrb7tiFbm6R
         IYVCl6/TBx/1RuiRRlRa4+pAIRAuXZ4ZJy/Jq+edfPDH0v0JP0Y/WoTmVwTjd3eYl8WT
         jW8lS+PC37NLE5foMJKcHUdeEGen/tnRHXUpjNM9vUPJUjnqEgNl2UdQ8HIsiEW8xOF7
         8xhVzB2Kwv493X+xcbWp3voaNhYbQt5e014xmx4KUG84KgfPPsyFF1OCqFUoSiAX2Pt+
         MucdV9HQSj/YWGsLXxetzGCNavZCNuS56+kI2jXkwVEmU0nymGdafCkSKoCanZ3ndn3Y
         zSig==
X-Forwarded-Encrypted: i=1; AJvYcCVGr8uiryJJ6o/Q+apowNm8Bjfde6B4a393x9bbZUJ4VcXPbe1Qz0BDMT7+da5VXpJFOu0ua7CZcSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz103D28qGjid1ZtsMioRagGDg/IWNqT/r6V8u9TpGX1c0p9yF1
	MtobH6+YqL/Hjtx5uNqBBKLUEdmuEp/FnAKHZbm/0+yQzMobVxHhXJebofoo13M=
X-Gm-Gg: ASbGnct09yyitELCR6hwNojF6dPzznQYbCoB8WLytZY/Bmg5OqaLJTuTm7PGB+8WCMH
	4hnLefwmb+0ttMtDADB4LkUChzAiG8e5iQMhWiVS6CX69usKmAjFKs9oWw6coQUdBv8hbLwHsPo
	kcKyTHWCGZIRashFzXd4BP/KaXcCvA6yeWRtjNVFQyzBHrAbCnhk4bohjylB8JfNnT/7V7lVrE0
	xHC/T73yLPTLj0aSZV4EVcrO+i67Gw9P0hu5b4SWkjvY2t7OyPhZ0PEHz34pCi5ePoVfPNBJcOy
	MyxSDAumDkLi321S0gXKyYkeX34rq+rNCrUBHm5cAsGZqQ==
X-Google-Smtp-Source: AGHT+IFvjBsEY9oy67/6GwJV3SWUtqOBNcur6SiammS+rKDWPEF+uzJOMO6vM77Mlh7PAFXCcn4G+g==
X-Received: by 2002:a17:90b:368b:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30784d83870mr2191019a91.0.1744269627848;
        Thu, 10 Apr 2025 00:20:27 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:20:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
Message-ID: <Z_dxNnfBOP88tAKi@macbook.lan>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
 <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
 <a14a7a42-cf7e-463b-a87d-e302ce32371b@suse.com>
 <Z_UGr0A8LetHDJvB@macbook.lan>
 <3364268c-41c9-47ed-a6d1-b8ee04118a46@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3364268c-41c9-47ed-a6d1-b8ee04118a46@suse.com>

On Tue, Apr 08, 2025 at 02:34:48PM +0200, Jan Beulich wrote:
> On 08.04.2025 13:21, Roger Pau Monné wrote:
> > On Wed, Apr 02, 2025 at 09:46:53AM +0200, Jan Beulich wrote:
> >> x86/EFI: correct mkreloc header (field) reading
> >>
> >> With us now reading the full combined optional and NT headers, the
> >> subsequent reading of (and seeking to) NT header fields is wrong. Since
> >> PE32 and PE32+ NT headers are different anyway (beyond the image base
> >> oddity extending across both headers), switch to using a union. This
> >> allows to fetch the image base more directly then.
> >>
> >> Additionally add checking to map_section(), which would have caught at
> >> least the wrong (zero) image size that we previously used.
> >>
> >> Fixes: f7f42accbbbb ("x86/efi: Use generic PE/COFF structures")
> >> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Of the two checks added to map_section(), the 1st ends up being largely
> >> redundant with the 2nd one. Should we use just the latter?
> >>
> >> Also sanity checking the image base would be possible, but more
> >> cumbersome if we wanted to check moret than just "is in high half of
> >> address space). Therefore I've left out doing so.
> > 
> > We could likely check that image_base >= XEN_VIRT_START?  However I'm
> > not sure how easy it is to make XEN_VIRT_START available to mkreloc.
> 
> This is precisely why I said "more cumbersome".
> 
> >> @@ -54,31 +56,40 @@ static unsigned int load(const char *nam
> >>  
> >>      if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
> >>           read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
> >> -         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
> >> -         read(in, &base, sizeof(base)) != sizeof(base) ||
> >> -         /*
> >> -          * Luckily the image size field lives at the
> >> -          * same offset for both formats.
> >> -          */
> >> -         lseek(in, 24, SEEK_CUR) < 0 ||
> >> -         read(in, image_size, sizeof(*image_size)) != sizeof(*image_size) )
> >> +         (read(in, &pe32_opt_hdr.pe, sizeof(pe32_opt_hdr.pe)) !=
> >> +          sizeof(pe32_opt_hdr.pe)) )
> >>      {
> >>          perror(name);
> >>          exit(3);
> >>      }
> >>  
> >>      switch ( (pe_hdr.magic == PE_MAGIC &&
> >> -              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
> >> -              pe32_opt_hdr.magic )
> >> +              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pe)) *
> >> +              pe32_opt_hdr.pe.magic )
> >>      {
> >>      case PE_OPT_MAGIC_PE32:
> >>          *width = 32;
> >> -        *image_base = base;
> >> +        *image_base = pe32_opt_hdr.pe.image_base;
> >> +        *image_size = pe32_opt_hdr.pe.image_size;
> >>          break;
> >>      case PE_OPT_MAGIC_PE32PLUS:
> >> -        *width = 64;
> >> -        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
> >> -        break;
> >> +        if ( pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pep) )
> >> +        {
> >> +            if ( read(in,
> >> +                      &pe32_opt_hdr.pe + 1,
> >> +                      sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe)) !=
> >> +                 sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe) )
> >> +            {
> >> +                perror(name);
> >> +                exit(3);
> >> +            }
> >> +
> >> +            *width = 64;
> >> +            *image_base = pe32_opt_hdr.pep.image_base;
> >> +            *image_size = pe32_opt_hdr.pep.image_size;
> >> +            break;
> >> +        }
> > 
> > Since you are already refactoring much of this code, won't it be
> > clearer to fetch the header inside of the switch cases.  So that
> > there's a single read call for each header type?
> 
> Except that the switch() itself uses not only pe_hdr, but also
> pe32_opt_hdr. That could be re-arranged, but I'm a little reluctant to
> do so.

Hm, I see, the magic field checked here is in the extended header, so
we would need to fetch it ahead of the switch in any case.  How
unhelpful.

One thing that I find weird about this code is the obfuscation of the
switch condition, won't it be easier to read as:

if ( pe_hdr.magic != PE_MAGIC ||
     pe_hdr.opt_hdr_size < sizeof(pe32_opt_hdr) )
    fprintf(stderr,
            "%s: Wrong PE magic or missing optional header\n", name);
    exit(3);
}

switch ( pe32_opt_hdr.magic )
{
...

I would assume the current arrangement is done as to reuse the
`default` error label, but IMO that switch condition is too hard to
parse.

> >> @@ -108,11 +119,28 @@ static unsigned int load(const char *nam
> >>  static long page_size;
> >>  
> >>  static const void *map_section(const struct section_header *sec, int in,
> >> -                               const char *name)
> >> +                               const char *name, uint_fast32_t image_size)
> >>  {
> >>      const char *ptr;
> >>      unsigned long offs;
> >>  
> >> +    if ( sec->rva > image_size )
> > 
> > Strictly, should this be >=, as rva is a position, and image_size is a
> > size, so the last allowed bit would be image_size - 1?
> 
> Yes and no. No in so far as this would be wrong for zero-size sections.
> Yet see also the first of the two post-commit-message remarks.

Hm, yes, don't have a strong opinion really, just leave it like that
I guess.

Thanks, Roger.

