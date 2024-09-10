Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50E974226
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 20:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795981.1205503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so5b0-0000wM-IK; Tue, 10 Sep 2024 18:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795981.1205503; Tue, 10 Sep 2024 18:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so5b0-0000tN-FH; Tue, 10 Sep 2024 18:28:10 +0000
Received: by outflank-mailman (input) for mailman id 795981;
 Tue, 10 Sep 2024 18:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWlv=QI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1so5az-0000tH-6N
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 18:28:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c91dddc-6fa2-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 20:28:07 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c3cdbe4728so6018962a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 11:28:07 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41d3bsm4548232a12.8.2024.09.10.11.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 11:28:05 -0700 (PDT)
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
X-Inumbo-ID: 6c91dddc-6fa2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725992886; x=1726597686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lpVNfYXUB4jZTiYmtuJ+Bak1ids2z7lwzCEY6WW4kpY=;
        b=tuM02PaYrHIAk1UcKEkUHSFgVPZJC3Hf1lbVoPP5xWPZS0zNtCIlka5M7YNAoS2lkV
         5wB63GzwCqtoB0e5a9ObvgDxJW2Y/Hk7qJzIkJpfEAxa/chfC5vcPsLmbKdz0y99Papd
         fANJWCPB8dBB/YzApNiMr+3FpuDRcFEvbzuU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725992886; x=1726597686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpVNfYXUB4jZTiYmtuJ+Bak1ids2z7lwzCEY6WW4kpY=;
        b=q/EjRRtgZ8X3DnP0tU9Is5OGR6+Ark7TlPqvl+Hrjj7GGpXjVuIc2VfOBjMfWEsta/
         73Rfxcljz6B1I760qQlnIPYKCbUbspiisEDcB7oQDUw0MQhv1emI8Pqb+ixEYQg1KsuQ
         s9g4lSCjW2y+61n9S0qcugmwKS/zmAj6QGA3qweb5k/W94bdtrd87YUGBxj/YnPV+QUc
         UvWhIH127W4WKeydhgbTITXdTMyUQxSewGfwSjTNkviiVfS+58wYXcvmaPQWm4tsGFph
         repyqKXBqwOQMyqhxihfp8Dp7U2/vj8l+E/CkHtrs2cdCw89xxvIHK85VbgHZjOgh43R
         QlwA==
X-Forwarded-Encrypted: i=1; AJvYcCVcw6EUCi4oosPW1h9YUAwDti8zq1Thnukojhwlq9P8owleunE0RrSc+KjHbIH1hfZltg6t2pugpIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1DHPA60y+maYCsc5FOx8Wv1Ws9DfYawBplwSK9OTNFNf8gotN
	yNAE02FVZSnIg+Q/20To4yFSoWWFoCjuiWK10O6EV3gJw5bs+BVPu7bcT8jtfrOn8bHkDDvOOSG
	x
X-Google-Smtp-Source: AGHT+IFyLtm+laEeWp/Wkysk/C2RJBG6ITmVnuIvQILtpL3zWxsRlKHyPZ2iGeJpTERQXVPLflwTiw==
X-Received: by 2002:a05:6402:13d5:b0:5c3:c388:2e36 with SMTP id 4fb4d7f45d1cf-5c3eabff49emr9620923a12.3.1725992886150;
        Tue, 10 Sep 2024 11:28:06 -0700 (PDT)
Message-ID: <6feab1d8-54fe-4dfb-8e4d-7e5b22099482@citrix.com>
Date: Tue, 10 Sep 2024 19:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] x86/HVM: drop stdvga's "vram_page[]" struct member
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
 <abbd917c-d13d-4572-ae9e-1c413c7d4cf2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <abbd917c-d13d-4572-ae9e-1c413c7d4cf2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2024 3:41 pm, Jan Beulich wrote:
> No uses are left, hence its setup, teardown, and the field itself can
> also go away. stdvga_deinit() is then empty and can be dropped as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although I think
there's more to do.

> ---
> I have no idea whether in the tool stack some memory calculations would
> want adjusting, to account for the 256k less that a HVM domain now
> needs.

I honestly don't know.  We need dalloc() and friends, simply to figure
out whether it's a significant number or not.

> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -111,12 +111,10 @@ struct vpci_arch_msix_entry {
>  };
>  
>  struct hvm_hw_stdvga {
> -    struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
>      spinlock_t lock;
>  };

I'm pretty sure you can drop the lock too.  It's taken in accept(), and
dropped in complete(), but there's no state at all to be protected.

stdvga_mem_accept()'s return value is a simple expression of p.


With that dropped, the complete() handler disappears, and it's the only
hvm_io_ops->complete() handler in Xen so the whole field can go.

So I'm pretty sure there are 2 more patches that ought to be part of
this series, which go in a further negative direction.

~Andrew

