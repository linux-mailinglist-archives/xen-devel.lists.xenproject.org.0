Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B69B15B8A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063606.1429326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh37d-0008Sb-CJ; Wed, 30 Jul 2025 09:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063606.1429326; Wed, 30 Jul 2025 09:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh37d-0008Pn-8x; Wed, 30 Jul 2025 09:29:17 +0000
Received: by outflank-mailman (input) for mailman id 1063606;
 Wed, 30 Jul 2025 09:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BoeR=2L=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uh37b-0008Nq-Lc
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:29:15 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a42f3cd5-6d27-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 11:29:07 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b78294a233so2863118f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:29:07 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b778ebaca7sm15483144f8f.30.2025.07.30.02.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:29:06 -0700 (PDT)
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
X-Inumbo-ID: a42f3cd5-6d27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753867747; x=1754472547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7U0NyE+k3OZWe7rDxbYPWtugfq7sj3e9FN1bmIg50oc=;
        b=m42lBua1dXGNn2983bPWbefgt1z5G2wH20j8lDre1C2YaVGUPbz3VDGu6RSDjB3EdQ
         FUueeRJm2cC0255lWucZsmW6iozNmXJldnTv+d27inRO4rfHCjpXBT614unJljvO8RW5
         5BWwr+oBA6pNflRr7JN1Bes2cvW7Lh5GEvQ6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867747; x=1754472547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U0NyE+k3OZWe7rDxbYPWtugfq7sj3e9FN1bmIg50oc=;
        b=b4dtNCTovqs8SEOj4zSVMg0oEbZOp1fRkTcxyNXxmvVfHqPiyGNFi6QdScD0Ri7mks
         QvxrlpDq0Z7IXoQlriRrAGzwvp3xzKlsMdzK4lYW8px/e4tEIZpOgIV0nY5cjkFV94bA
         uyh5Xn9vfFCEvEt5834yoEvYr4gj/GXN/XWXgzI001QcD1x89GeHADjkm/knzyicWXEB
         x09XcwgVumhDYke5QfT37Pg0PYfh2jPCs5T+DPa+dMUH6B6FtH4CV/BUtc/4KlZWotLl
         CMNXEl83rL1hw4ppulrfwX9BbufqtRB9Smw8/O9xrgxQyJS6snoKC9eCIK7xWnwFao79
         /hHA==
X-Forwarded-Encrypted: i=1; AJvYcCUT3xaXPKtZU8acN2Ybra99nYLjO4KxrQumgP6pIc2CQ2mu8coIcrBH3KdfDgIfzw7qtBpj56cxMqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7LSPgEieJ4b+zzRlFerY19kF3MdAZESivpKwbmv8qt7qSAD9F
	cxCBlyCUnPBmVbYxVD+0/CnYjrcDLwFWlt9P4svQGOV+cVfGzrQ1vjdQRIm5lBWymFw=
X-Gm-Gg: ASbGnct1y6bGFNxeHve3pN3YBTYu0GNoHzu308mh/8vvS2e/OBQVM2bwSrfG+gNUNXi
	Kip08LPug/IPe0VD5Hemg9o2mFW2UL/1dJxGg+u/Fh6Lx2+szUSSvzDW+IbA8eIXjglrEXpAtDf
	yw/7NOFlLuNBm1JoiY0JltSiVt8CVMEcjxPWEED4G8c0+GgF8k/oxVZxIvMucYJaQoZZjIVPix1
	uDryrZ4Wit7La94jEadg8GnXXK9uCcnGe6NtC0jozFHb1QDwDu4XM89hrWshXcGKM8NHNuVqU7B
	2vq2ndq786NpA2GjVvlZUZXk11ZYohKIk4iUSiYVVJyEFY3J4F2M0XKE76pVHYkbg+YK1fix8I6
	J6q4smvDz4RshxwSsjcqnWe5yLWR246r20k2dR3dthI72/chFF2miFqA4QgY2J40R76sI
X-Google-Smtp-Source: AGHT+IEmXgv0xMpwSwBukvkMYNiF5Eg/3WkkNZxVjX+maFE3K9k4vlz6m61HwF5O7HhrFKnwqrgsCw==
X-Received: by 2002:a05:6000:2890:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b794fedc05mr2023406f8f.17.1753867746991;
        Wed, 30 Jul 2025 02:29:06 -0700 (PDT)
Message-ID: <1586378c-1b48-4174-b9b2-3c3736c88921@citrix.com>
Date: Wed, 30 Jul 2025 10:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: drop size parameter from sort()'s swap callback
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
 <94ca0714-ee52-4d6c-ba4d-717594e83179@citrix.com>
 <d59dc52b-257c-4b41-a6e8-4f56955d6ed2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d59dc52b-257c-4b41-a6e8-4f56955d6ed2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2025 3:44 pm, Jan Beulich wrote:
> On 29.07.2025 16:29, Andrew Cooper wrote:
>> On 29/07/2025 3:26 pm, Jan Beulich wrote:
>>> This was needed only for generic_swap(), which disappeared in
>>> 8cb0341a61fa ("xen/sort: Switch to an extern inline implementation").
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Oh, nice.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks.
>
>> I'd expect there to be no change in generated code here, as everything
>> gets inlined.
> Not really, no. With the change in place, both gcc7 and gcc14 consider the
> inlining of swap_ex() (in x86'es extable.c) as less beneficial, and hence
> (like cmp_ex()) an out-of-line function appears, while overall code size
> reduces. I expect that's because inlining decisions are taken based on
> some intermediate internal representation rather than based on the code
> that would ultimately be generated. And that intermediate internal
> representation now changes, resulting in less of a win by doing the
> inlining.

Hmm.  We might consider __always_inline, although it seems like gcc12
does decide to inline them with this patch as-is.

Either way, that's something for later.

~Andrew

