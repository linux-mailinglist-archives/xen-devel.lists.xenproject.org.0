Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A086ABCF4A
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 08:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990465.1374418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHGSq-0006lb-83; Tue, 20 May 2025 06:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990465.1374418; Tue, 20 May 2025 06:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHGSq-0006j9-4g; Tue, 20 May 2025 06:28:36 +0000
Received: by outflank-mailman (input) for mailman id 990465;
 Tue, 20 May 2025 06:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHGSo-0006j2-Q2
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 06:28:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f07be1-3543-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 08:28:33 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad5566ac13cso359108166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 23:28:32 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca654sm675914866b.158.2025.05.19.23.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 23:28:32 -0700 (PDT)
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
X-Inumbo-ID: a6f07be1-3543-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747722512; x=1748327312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruF28dazTFaSTHvRX7eaxSPU77uh3cIwlnjMA0Ts/qY=;
        b=a5b5cTqrTnMEUGi034OzH3tTPd5p6gx7JAqdgE3dOkl+EKg/SqwNpCJLpe+Us5VjTH
         m7VcFTtKAwwdQzqWWrLhDOSfITllCCnCasrw1cttxDqz+v+hG+DXt4aOGaYGWnH7slQC
         ao/WOnKyeJ1yS17ZI5O7j8uqXTmcZD3Pj2gIKQV1kM9+Rj29Es/VN+htiQFYWaqFvbdm
         1MKASfI1vw4V59pUSUYyh3e5Fuf7rpanRrjqMuHgdB345G/9i155Rw8yuVlsmvkBanIc
         +l0l3Xy4U0v7P6qU4h+byv+uo8eaFEecXkMIPMwiX70ReKOGOIyFwSzY7WRyv1aTxqeD
         arlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722512; x=1748327312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruF28dazTFaSTHvRX7eaxSPU77uh3cIwlnjMA0Ts/qY=;
        b=YIYDLSHBG4zm+LUJvGsVhgq4mcWOXWDkDYFrgrBOA+kRXUaVmZ1puurWYdS2duyclO
         36nrWl/2UuKgMqXkwVCV2OJQIq1PloBJcZS7z95fFKelRHvuQXiH3X84tLDb/+wpz3Q9
         CJublvm41N+Vs5x7UUkCcObfRQK3rtAvslDc/ryOv9uBScULB5T6XJEUOUZydDxgMlep
         QYOp8CIYEBi21fjm/b+uk4S9k6cvfb1Z4Y+2jUiOsfGVPsSbIhC3yd4rovSjc/9NhM/A
         +0ZyAXhNUFFJl7to0etsgKxtvZAB1Dj29k4Tb4Pc87hBPD+jwtoM9OmlzQrCDN5vIhOi
         Rkog==
X-Forwarded-Encrypted: i=1; AJvYcCVn22qJ8ZEgEGzrYeYcvSnZZP235qNiBE8/uyROjsT+reTMI7Iath/nu2QMPKDhUvzUs7bbDxYf/DU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwknB5fZek6eT1d5WM8SEIGwk3b5eD9v7cCyDP+sZJtI2mPF//
	kOIJPlmgQR0GTmvtVRwBJRTM6p7cy9qfaZwvkadpIfhe7xtGZ6raG21GQ+oy83L4aA==
X-Gm-Gg: ASbGnctblBVa6ZpiQpcrQ1qTJFE2r6KwjItsea+8onDngBTqCZWcqUuWadASBa9BXLC
	225WVPnbOaaVA7pABTdsXsbdwIjZmNjFpS+LSx84qP0xfxoVpQV1tU851f/qbFjuIeCXCyxijOW
	oFmFJaUJiQoJO+F8JqoeccJwCgF/XeFRGEo2DNJYUQ2LXcnqQ7dJFiwDrzOPZj6dL8K3iwfyDwK
	LiMCN331mqrY7l4AP53E/TRHk79y3zT5XLUI/9VzVw7C91325u5OIDobq6IDQm0THWBsYxUUzXK
	6ZRmBvmTEG7tIf0fcIwUQJYNlG+y4WccDFe1eQck0RclXQos9ZRAreW6SiNS4w==
X-Google-Smtp-Source: AGHT+IFMv8bu0m27u2LS9xl92WVoIQiq1lJomkTVzxr/fkT/yA+qAqn9LrlPkQuXJO/lTMmkxi5V9w==
X-Received: by 2002:a17:907:e98a:b0:ad2:4da7:7e2 with SMTP id a640c23a62f3a-ad536f38a4cmr1464187266b.54.1747722512328;
        Mon, 19 May 2025 23:28:32 -0700 (PDT)
Message-ID: <f69ddc8d-2f2b-487d-93e1-be652cd7ef09@suse.com>
Date: Tue, 20 May 2025 08:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] xen/console: remove max_init_domid dependency
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250519201211.1366244-1-dmukhin@ford.com>
 <20250519201211.1366244-5-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519201211.1366244-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 22:12, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> The physical console input rotation depends on max_init_domid symbol, which is
> managed differently across architectures.
> 
> Instead of trying to manage max_init_domid in the arch-common code the console
> input rotation code can be reworked by removing dependency on max_init_domid
> entirely.

... at the expense of doing (worst case) 32k iterations just to find nothing
(else). Iirc it was to avoid this why max_init_domid was introduced.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2460,6 +2460,35 @@ void domid_free(domid_t domid)
>      spin_unlock(&domid_lock);
>  }
>  
> +/*
> + * Find the ID of the next possible console owner domain.
> + *
> + * @return Domain ID: DOMID_XEN or non-system domain IDs within
> + * the range of [0..CONFIG_MAX_DOMID-1].
> + */
> +domid_t domid_find_with_input_allowed(domid_t hint)
> +{
> +    struct domain *d;

const?

> +    domid_t domid = DOMID_XEN;
> +
> +    spin_lock(&domlist_update_lock);

Why this heavy lock? Other functions iterating the list just use the RCU
read lock.

Jan

