Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51864AD94D3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 20:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014843.1392927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ9WY-0007kn-CH; Fri, 13 Jun 2025 18:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014843.1392927; Fri, 13 Jun 2025 18:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ9WY-0007k7-8Z; Fri, 13 Jun 2025 18:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1014843;
 Fri, 13 Jun 2025 18:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R50U=Y4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uQ9WW-0007k1-O4
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 18:53:08 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a51d0b09-4887-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 20:53:07 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so20749355e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 11:53:07 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e244392sm60202635e9.22.2025.06.13.11.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 11:53:06 -0700 (PDT)
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
X-Inumbo-ID: a51d0b09-4887-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749840787; x=1750445587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r4pqSywwy5E6XetqBTJ/AuYfB1FShu9uVvjKe48qvTA=;
        b=DS+dQfvyCmmcWp6vym/hJTWqWCge5AnTdC2L6lH6zYDsIO9PSwqtalPY0aGBKr1P+I
         lxwO7sQU5QGYBuDYuH/11JEsj50qft8hScuJJzESzw6UbrBs7xBxGVToiUU9JWOkD/qp
         RGlgUbd7piZ0SCI8sP2I5LOoB4nlxKaJwPESA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840787; x=1750445587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4pqSywwy5E6XetqBTJ/AuYfB1FShu9uVvjKe48qvTA=;
        b=hv/4Tgyrugzr4/nur5dn4mKypYI2MsMKP9LOm32jxwWzzg0F2aOa3A33CsJ5Bvc4rU
         QCz0mjfzj1E5jz40ljX1r/IpV0UGivl2d61g7RZMCKcXnKSubQ5sG+M46rzzZZUn+jtX
         tqaT8dI53L9zLejXNdh1NFxvJjMddhho7SQ4G+Iy8LQB9qug0V7jy29UWffhivLznoLi
         Q65POfIXygxapymJxy8vNQGvYHtwwB8uKYo8WKbJ38CHZDAEAb2arlMlgLlRyjWm6crj
         DHWKMP6vMoOTqpFEGWtciVUIZDrc1q0ULiEEn2fHzk2t+gvQCBFXDskDZkedVjf5diDu
         6oJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhDCZdJ9vCaTaGjULuVvGCYVXLXXB15rXtHd1JamW2nboCheZMqPnZf3tkb63aQno0Rpe5hUbRYGI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6tJdRX4xH/cMBhVlfc8szx45CvdUvg+gvHhC5A39gDD8fAgrN
	Y7/Y+9Iwf5j/squrL+WopQ8R2/x8GJ8ERueuY7I1o7ZDsTf+pggz3/Gpn3/q2xeip3o=
X-Gm-Gg: ASbGnct83mvIVe213wMGfDZUnK5CYQLHwfT/lB6SDcub8p1PLQ/B67IE2TxlYnVznXG
	+LBdWQckwQVX3vObPt/Fw4bm4keIbvK9xWL9Qv1+4nLfNAlJhziiQ+0zZz1po43TaIsRi+89QYY
	xvIxWMiG0y9rYMNPFVMVrRA/xl+hMOQd9JyEFJg5wcQAlz2NM5igB2fnR9I3GlJJfd/Un6t4qsZ
	6efNv4j5c5EmsyE6q5gAT1aZ3wDXQJYBiX+3zociwxMPciaaxeE9exyJtEBZiY7W7mKcPDqd9W1
	OzOPxU+4mzYnDeNHoeuAL5/zc1Cye4iddTK43J1ZPZn2titaNJGK3HnTJKOXlr5+ds8f4vtB/no
	=
X-Google-Smtp-Source: AGHT+IHBhbZTFDOZwMMA6u6HG/I4FtGbRTvrwiaEm+ZErQcOzCKsTajytCT9w4lt+oid8IV3Fkg1UQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a5718b448bmr1033400f8f.0.1749840786967;
        Fri, 13 Jun 2025 11:53:06 -0700 (PDT)
Message-ID: <7ef86c5b-80ad-4bcf-8028-ef98616a8924@citrix.com>
Date: Fri, 13 Jun 2025 19:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/domain: introduce generic weak function for
 domain struct allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <cover.1749829230.git.oleksii.kurochko@gmail.com>
 <c08595dd7940b44a1392e16d4a2035b95b5c580b.1749829230.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c08595dd7940b44a1392e16d4a2035b95b5c580b.1749829230.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/06/2025 4:56 pm, Oleksii Kurochko wrote:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e566a18747..c134868e95 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -785,6 +785,20 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return arch_sanitise_domain_config(config);
>  }
>  
> +struct domain *__weak alloc_domain_struct(void)
> +{
> +    struct domain *d = alloc_xenheap_pages(0, 0);

I know you're just moving what ARM has, but this is spelt
alloc_xenheap_page();

> +
> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
> +
> +    if ( !d )
> +        return NULL;
> +
> +    clear_page(d);
> +
> +    return d;
> +}
> +

This looks fine, but you must do the same with free_domain_struct() at
the same time to keep the pair symmetric.  That in turn gets you an even
bigger negative diffstat, and x86 doesn't even need to override the
common version.

vCPU really wants doing at the same time, although you're going to run
into problems on ARM there with the BUILD_BUG_ON().

However, I suspect we want to be building with -ffunction-sections
generally active, or IIRC we'll still have the weak copy present in the
final image.

~Andrew

