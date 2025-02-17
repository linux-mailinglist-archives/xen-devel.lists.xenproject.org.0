Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E68A38524
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 14:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890463.1299578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1Xj-0003B8-M3; Mon, 17 Feb 2025 13:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890463.1299578; Mon, 17 Feb 2025 13:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1Xj-000383-It; Mon, 17 Feb 2025 13:52:15 +0000
Received: by outflank-mailman (input) for mailman id 890463;
 Mon, 17 Feb 2025 13:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk1Xh-00037x-VJ
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 13:52:14 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60db927b-ed36-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 14:52:08 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso3277367f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 05:52:08 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7998sm12137146f8f.82.2025.02.17.05.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 05:52:07 -0800 (PST)
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
X-Inumbo-ID: 60db927b-ed36-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739800328; x=1740405128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zNCnSWfrK5gc4Vqa6c7Hh48agLbjcdskizJnPXr8rIw=;
        b=GxxHT1MOicK3QILlYkDFzMriH66129EbVNQPC3t0sKmJgRCjpecQvmwbCo3EBZFP9i
         H1BjHipCR4yYwe/BuSA4p5ZDHMx8R/fa/BGh3dskoZk961QYkMU2mGhlI2HBnNww15op
         8RQF4lIY6AJDCiNXoSLxJtmCkTHtvDWQTjxIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739800328; x=1740405128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNCnSWfrK5gc4Vqa6c7Hh48agLbjcdskizJnPXr8rIw=;
        b=QeNhiQrFq/25pDgUcWZkzWFQKbU4L51DP8BK5xj5gnHbwf0lK8QcryTILQzPJ4bzd0
         wCSqKozAwUr63QpxBNKHAmBJMvOSOJUcUnehjZcLcKwgi/269sEEB02XDDRvDLEprFYY
         eK4NaW+PEmX6DwlFc7kkrDzMW1allUfoWtkACNoW+PxOLY5FzIWWldUzJ2R102l2FGQY
         ilQldeha+4XwjbdrfyFH8hsjgDAghcrj+9ITlK1N1Xqveb6eLxB1WJiar8oecUWwCd9c
         p1HnrV7Ti6S/PalBmZnKu2MC4BBHM5rx9MY5UlZyi7Byx8jVsCX/z2hzhbc9l1qhaMJ+
         t/xg==
X-Forwarded-Encrypted: i=1; AJvYcCWqfKf464J+l3hsdY2loaDp0nJS6KpCF+Pi1Jm3bLwp1mp5q+/SCDMquGfgpV2HY3c34NlfKYENHPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfLBXPm/5YmjXHo6MGUDoblionyB4SqQFQxlfUZezQxTZ6j/HZ
	OvTFeI8imnpmMDlhaQHbms37JD0c5JXZ1Z3vCmIiBeO8X9CYLbU4LjucQ6py8cY=
X-Gm-Gg: ASbGncsNms6CP3C3c6o15VIyY5d906Ok0NaS03CjCrBK72VvHLgAZyZmn3dfdAZdOma
	zoLLEO/C0apnLy5/N66JkunxgtQtySZhVEkT/JXKu8XN7sMTHXubRD8P2DkDZGurUXqRTuJqGzF
	yWvpUvQMTJSKdfUgxgUJ6M07hnWHJY+QodCF9JYcz7wyvu2DEQyTTNbUZqYmHdTLe7wXbmB/ckE
	CMuzAu3sE0NjotNZmjqWZ7BZijL8mv1xrUYRWtsd8K31DrEegrijX7nJVXBeIzCISazLX9cNvlz
	sy1kJu4w/Rk31Hf+naLCuoiJSDqR0v5zlVTOJ4qd7rDcbMYS1Ok+rGo=
X-Google-Smtp-Source: AGHT+IHHDRnSTZsF7wBnRjshrly/evJU5s/wRx2Hee7WKEsGBCLaD/lys4rEvzgvAbDnAEactc/rnQ==
X-Received: by 2002:a5d:5888:0:b0:38d:c6b8:9fe1 with SMTP id ffacd0b85a97d-38f33c28898mr9290878f8f.24.1739800327748;
        Mon, 17 Feb 2025 05:52:07 -0800 (PST)
Message-ID: <f3c0d480-e0cc-469d-8d7f-5e2402e48f8d@citrix.com>
Date: Mon, 17 Feb 2025 13:52:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/memory: Make resource_max_frames() to return 0 on
 unknown type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250217102741.4122367-1-olekstysh@gmail.com>
 <24e6c348-a5c3-415e-a5b9-69d948eb15c2@citrix.com>
 <ab9ac9b5-2d2f-469a-83dc-304c880cbf55@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ab9ac9b5-2d2f-469a-83dc-304c880cbf55@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 1:11 pm, Oleksandr Tyshchenko wrote:
>
>
> On 17.02.25 13:09, Andrew Cooper wrote:
>
>
> Hello Andrew
>
>
>> On 17/02/2025 10:27 am, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This is actually what the caller acquire_resource() expects on any kind
>>> of error (the comment on top of resource_max_frames() also suggests
>>> that).
>>
>> :(
>>
>> So it broke somewhere between v3 and v8 of the original patch series,
>> but I can't seem to find the intervening series on lore.
>>
>> Given the comment, I suspect I got inadvertently-reviewed into this bug.
>>
>>> Otherwise, the caller will treat -errno as a valid value and
>>> propagate incorrect
>>> nr_frames to the VM. As a possible consequence, a VM trying to query
>>> a resource
>>> size of an unknown type will get the success result from the
>>> hypercall and obtain
>>> nr_frames 4294967201.
>>
>> This is one of the few interfaces we have low level testing for.
>>
>> tools/tests/resource/test-resource.c
>
> yes
>
>>
>> Please could you add a step looking for an invalid resource id and check
>> you get 0 back?
>
>
>
> Sure. I was thinking where to add this step and propose the following
> change. I will send a formal patch once I find a way how to easily
> test this change.
>

https://lore.kernel.org/xen-devel/cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com


wires these tests up in Gitlab CI.

>
>
> From 872565da55b7e87e1664714bb1b3ee84245db4a5 Mon Sep 17 00:00:00 2001
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Date: Mon, 17 Feb 2025 14:16:50 +0200
> Subject: [PATCH] tests/resource: Verify that Xen can deal with invalid
>  resource type
>
> The sign of the presence of a corresponding bugfix is an error
> returned on querying the size of an unknown for Xen resource type.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/tests/resource/test-resource.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/tools/tests/resource/test-resource.c
> b/tools/tests/resource/test-resource.c
> index 1b10be16a6..197477c3f3 100644
> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -123,6 +123,22 @@ static void test_gnttab(uint32_t domid, unsigned
> int nr_frames,
>          fail("    Fail: Managed to map gnttab v2 status frames in v1
> mode\n");
>          xenforeignmemory_unmap_resource(fh, res);
>      }
> +
> +    /*
> +     * While at it, verify that an attempt to query the size of an
> unknown
> +     * for Xen resource type fails. Use the highest possible value
> for variable

s/for //, I think?

> +     * of uint16_t type.
> +     */
> +    rc = xenforeignmemory_resource_size(
> +        fh, domid, 65535,
> +        XENMEM_resource_grant_table_id_shared, &size);

XENMEM_resource_grant_table_id_shared should probably be 0 here.

But, I'd suggest choosing 3 (literal 3, not some kind of constant from
the headers) for the major resource number.  That has the side effect of
forcing people to extend this test case when they add a new resource type.

> +
> +    /*
> +     * Success here indicates that Xen is missing the bugfix to make
> size
> +     * requests return an error on an invalid resource type.
> +     */
> +    if ( !rc )
> +        fail("    Fail: Expected error on an invalid resource type,
> got success\n");

I'd phrase this differently.  "Check that Xen rejected the resource type."

"avoid this bug we already fixed" won't be useful to people reading this
code in the future.  It's in the commit message.

~Andrew

