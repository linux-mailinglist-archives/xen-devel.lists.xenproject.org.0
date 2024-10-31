Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500DD9B8107
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 18:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828855.1243884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Yo9-0006uk-UW; Thu, 31 Oct 2024 17:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828855.1243884; Thu, 31 Oct 2024 17:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Yo9-0006sd-Ru; Thu, 31 Oct 2024 17:18:05 +0000
Received: by outflank-mailman (input) for mailman id 828855;
 Thu, 31 Oct 2024 17:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6Yo8-0006sX-9m
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 17:18:04 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131ccc76-97ac-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 18:17:58 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so1595266a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 10:17:58 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac76ff0fsm759765a12.27.2024.10.31.10.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 10:17:57 -0700 (PDT)
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
X-Inumbo-ID: 131ccc76-97ac-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEzMWNjYzc2LTk3YWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzk1MDc4LjQ3NTY5NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730395078; x=1730999878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uzRJu1sXEDeQJEF7/mCzuJgulFnuSBdDoLCl+bYEHuY=;
        b=fzVbixAViIRk82cyWeM45EjEVZJXJ78pf4VT3nE7RgaBTf2dKVllfUixuJJi8FJTWH
         A4TUVJs2MZQjcH1sL5lI1pdSmctvhE/GDEf8OLCwkoxGylDbaqBi5iRbWOjCL8WtWd10
         0p08hFQA/oV8wq6N7WJVvPNDgUIj1V4u09AWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395078; x=1730999878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzRJu1sXEDeQJEF7/mCzuJgulFnuSBdDoLCl+bYEHuY=;
        b=j5Hm1LK8NfF8BrEE1uUDgpw2C7ee1olOrGXZnc53huaeqHdjGhL3OkQ6bnIiKAyxWX
         bck2dY+Nrub7crRK4JrALwr8z0BdqpzMH2swNLPK8qp7WzU1++2a5OtgwTr3Q+lBYIjh
         p+LxMlLnjh+RQM6xjxe+tfmdCnvGTTIKNArIEcS9+KrCuLJxBv/3Z34rK9826udj0mS2
         nLKZK/wuYe1i3wyX1XmWicALoieR7E5eNDDSJKOhbWKSGBr/nTpYrDeZs7gfk94W5REO
         XEtw0fotYPjG3nMtmWCzUnd9zNXMagVcLUzM9ojChx/lSNPGw7kAxAE3/2sjn/g7mgZP
         eTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRQoePIsCz1tffVK3VhGZ8vsx8z5OoLyA9MT+X+2D6+WTKywZRlJazxueQYj7EjDxAVc1kQs5Wgtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4TrxD9lNn9WwgZxPgEKsF7ugxXMzC2KgHK/QZTpX6qXzVMHPP
	4AD4/bynezyeCTjudIi37BlO8VYLSxqJWPXk8uiskOi7oQjJMVEl6bEfojqPflLKUG44kJ/DbZJ
	J
X-Google-Smtp-Source: AGHT+IHZX06NFgcBX6G648tacbpfWhzBgix2ljoVffnzG5deVBE5CD7J8Rc6Xk1lMh5AJMl1R4LjcQ==
X-Received: by 2002:a05:6402:348c:b0:5c9:5c8a:99e5 with SMTP id 4fb4d7f45d1cf-5ceb936a3d1mr364885a12.30.1730395077724;
        Thu, 31 Oct 2024 10:17:57 -0700 (PDT)
Message-ID: <6877d26c-144f-4b4e-968c-28b535cb3db1@citrix.com>
Date: Thu, 31 Oct 2024 17:17:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: ensure L2 is always freed if empty
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241030114852.55530-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241030114852.55530-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2024 11:48 am, Roger Pau Monne wrote:
> The current logic in modify_xen_mappings() allows for fully empty L2 tables to
> not be freed and unhooked from the parent L3 if the last L2 slot is not
> populated.
>
> Ensure that even when an L2 slot is empty the logic to check whether the whole
> L2 can be removed is not skipped.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I've attempted to find a Fixes tag for this one, but I'm afraid there have been
> many changes in the function, and it's possibly the code that introduced the L2
> freeing (4376c05c31132) the one that failed to originally adjust this case.
> ---
>  xen/arch/x86/mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index d537a799bced..0f53dcebad95 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5717,7 +5717,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>  
>              v += 1UL << L2_PAGETABLE_SHIFT;
>              v &= ~((1UL << L2_PAGETABLE_SHIFT) - 1);
> -            continue;
> +            goto check_l3;
>          }
>  
>          if ( l2e_get_flags(*pl2e) & _PAGE_PSE )

https://gitlab.com/xen-project/hardware/xen/-/jobs/8240163332

That's hitting the BUG_ON(!nr_bootmem_regions); in alloc_boot_pages().

  [<ffff82d04060407a>] R alloc_boot_pages+0x46/0xbc
  [<ffff82d04033a76f>] S alloc_xen_pagetable+0x5e/0x60
  [<ffff82d04033a7af>] F alloc_mapped_pagetable+0xd/0x3e
  [<ffff82d04033a948>] F arch/x86/mm.c#virt_to_xen_l2e+0x78/0xec
  [<ffff82d04033ba71>] F map_pages_to_xen+0xefb/0x1079
  [<ffff82d04063d55c>] F arch/x86/setup#bootstrap_map_addr+0x95/0xff

I think what's happened is you've "freed" l2_bootmap[], causing
bootstrap_map_addr() to now need to allocate memory.

I've reverted for now, per Roger's request on Matrix.

~Andrew

