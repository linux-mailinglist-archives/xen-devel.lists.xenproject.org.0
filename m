Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E56A1D7E3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 15:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877940.1288118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPsv-0006AW-HU; Mon, 27 Jan 2025 14:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877940.1288118; Mon, 27 Jan 2025 14:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPsv-00068z-Eq; Mon, 27 Jan 2025 14:14:41 +0000
Received: by outflank-mailman (input) for mailman id 877940;
 Mon, 27 Jan 2025 14:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcPsu-00068I-5B
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 14:14:40 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b48b548-dcb9-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 15:14:38 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so6684443a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 06:14:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab69dfd3a05sm255167966b.98.2025.01.27.06.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 06:14:37 -0800 (PST)
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
X-Inumbo-ID: 0b48b548-dcb9-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737987278; x=1738592078; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQp1zjBXGJs8VmJ98XAy83soKlzh5DVrn3YRAYj99I4=;
        b=k7DgcUpxjxm7rltM8U5lQfMJJ2nqX3v/VqtepyV58Q9gxxXqAEdLxl5omvR+dlTiZ9
         k9w/Z0GbPfzHXby1CPv6iZ7Vgl1VaOr/pbaJ3ZpFi3w2KnegMrI8gKIQHKZ8YwxUDWhr
         slq8TIw+Nk7SVGuNLYgp5NRBXrI340Np1vd1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737987278; x=1738592078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQp1zjBXGJs8VmJ98XAy83soKlzh5DVrn3YRAYj99I4=;
        b=BDasa480P+sNAk0YeUpYgYYShfPWMpmTm7VrAof/Qib9LxO0BMWUeNK1sY6WBv2X9/
         lkNYhe9V10Ricw1Abw6iTdtH8pwq2zHvtT7oPY8ezIASu4JVeOpk63p/ofQLTZNFOgvp
         da8cCByS3pJUBAht1fMfqunx/m1Yqh9r+CinvfK1ZYM24q7RBBiWLEFr+d2Lq9wRrqJt
         UI5w/0H2/F0OfLiLzwmMOXIowDGwU1E92c5fboihAquTkBIm9i62o/Kc+PwcXl+XFwL/
         5zQ1CEu9vie7TWYFfPREuasE+IcluB28E6oP8lOKR+r+kLJPlCT+mD3wTNaSylFwGTRB
         sUzg==
X-Gm-Message-State: AOJu0YzR2dMdZx/0ALLJfZeQ7oW+uLS3f4LDzgbWf0NRz49CMOWLQgye
	H1TthfTOTu+u/bXS3sJZF54n9inqev35z47egFbAc3y1sa0CSJUr+MrcO7+m/wVlJM3HZpjSXRE
	a
X-Gm-Gg: ASbGncszcoyvvZO7tZq5VkJMf6/VMwxHXt4uG/d/LmCxx/SPcJCeXbKNg5iYDi35qEW
	YvCk+S5QUaBJbXhAQXmyfn0CKkQIXmoGVDVzLnpUgAZnflBwwlqfTLCc7ekc31LSaGMfrbHEE6t
	ckKxXS6AzM48b9ABtTfYifXFgUKtx7JLPwoz2kXh/BTbSeCU+JSoZa/L0HNF/J2+YQn59OBSLnT
	iR3kOYj+UMri3gAAUXyVnVd8hEjinhW6ISrEJWa9CMCCYo2OA6pPvtxMYdgVu4PO6sYSSx5/mCY
	aKQ5tTfqPw==
X-Google-Smtp-Source: AGHT+IE/nfkLJkmNWE0T/Gx5mOv2OzTVJbkcP0C8OwRqxQrPmwaLvOrFOviQrMt81qFzK0VB8F0dcQ==
X-Received: by 2002:a17:907:728c:b0:ab2:d96d:6362 with SMTP id a640c23a62f3a-ab38b0b7f16mr4278119266b.1.1737987278214;
        Mon, 27 Jan 2025 06:14:38 -0800 (PST)
Date: Mon, 27 Jan 2025 15:14:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] x86/PV: further harden guest memory accesses
 against speculative abuse
Message-ID: <Z5eUzOmK_ljLSJsu@macbook.local>
References: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>
 <Z5dupzj0JnC--YQ7@macbook.local>
 <39a582e7-272e-478f-8613-166e51f90f72@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39a582e7-272e-478f-8613-166e51f90f72@suse.com>

On Mon, Jan 27, 2025 at 01:06:51PM +0100, Jan Beulich wrote:
> On 27.01.2025 12:31, Roger Pau Monné wrote:
> > On Mon, Jan 27, 2025 at 11:15:22AM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/include/asm/asm-defns.h
> >> +++ b/xen/arch/x86/include/asm/asm-defns.h
> >> @@ -1,3 +1,5 @@
> >> +#include <asm/page-bits.h>
> >> +
> >>  #ifndef HAVE_AS_CLAC_STAC
> >>  .macro clac
> >>      .byte 0x0f, 0x01, 0xca
> >> @@ -65,17 +67,36 @@
> >>  .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
> >>  #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
> >>      /*
> >> -     * Here we want
> >> -     *
> >> -     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
> >> -     *
> >> +     * Here we want to adjust \ptr such that
> >> +     * - if it's within Xen range, it becomes non-canonical,
> >> +     * - otherwise if it's (non-)canonical on input, it retains that property,
> >> +     * - if the result is non-canonical, bit 47 is clear (to avoid
> >> +     *   potentially populating the cache with Xen data),
> > 
> > It's my understanding from the commit message that this toggling of
> > bit 47 is only done due to AMD behavior, as speculative execution
> > there ignores any higher than 47, and hence non-canonical inputs are
> > no detected when speculatively executing?
> > 
> > It might be worth explicitly mentioning this in the comment.
> 
> Hmm, to be honest I'd rather not (and keep mentioning AMD to the
> description). First and foremost because if I mention it here, I
> strictly also ought to mention Hygon, I think. In the description I
> feel a little easier about not specifically saying so. (But yes, if
> you strongly think I should mention vendors here, I'd be okay-ish to
> add "on AMD-like hardware" before the closing paren on the 2nd
> bullet point.)
> 
> Further, with such a consideration, would we perhaps also want to
> consider simplifying the transformation when AMD=n in .config? (I
> could see us doing so, but not as late in a release cycle as we're
> now at. Plus I say so without having thought about whether a
> simplification is actually possible.)
> 
> >>       * but guaranteed without any conditional branches (hence in assembly).
> >> +     *
> >> +     * To achieve this we determine which bit to forcibly clear: Either bit 47
> >> +     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
> >> +     * we determine whether for forcably set bit 63: In case we first cleared
> >> +     * it, we'll merely restore the original address.  In case we ended up
> >> +     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
> >> +     * range), setting the bit will yield a guaranteed non-canonical address.
> >> +     * If we didn't clear a bit, we also won't set one: The address was in the
> >> +     * low half of address space in that case with bit 47 already clear.  The
> >> +     * address can thus be left unchanged, whether canonical or not.
> > 
> > Since for AMD we have to do the bit 47 clearing, won't it be enough to
> > do something like:
> > 
> > ptr &= (ptr < HYPERVISOR_VIRT_END) ? ~(1ULL <<  (VADDR_BITS - 1) : ~0ULL;
> > 
> > So only care to clear bit 47 when ptr is below HYPERVISOR_VIRT_END?
> > As that would already diverge accesses into the Xen address space
> > without having to toggle bit 63?
> 
> No, this may transform a non-canonical input into a canonical address
> (accesses through which then won't #GP as expected), just for a different
> address range than where we had the same mistake before.

Indeed, you are right.  With the expanded comment:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

