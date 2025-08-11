Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CACB20082
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076981.1438078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulN8E-0007Bu-BV; Mon, 11 Aug 2025 07:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076981.1438078; Mon, 11 Aug 2025 07:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulN8E-00079i-7w; Mon, 11 Aug 2025 07:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1076981;
 Mon, 11 Aug 2025 07:39:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulN8D-00079c-9C
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:39:45 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56e38018-7686-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 09:39:40 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6182ea5a6c0so957604a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 00:39:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm1972985166b.59.2025.08.11.00.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 00:39:39 -0700 (PDT)
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
X-Inumbo-ID: 56e38018-7686-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754897980; x=1755502780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XBE0vuhks1Zq36ADLjy2EsNSbL4gLinB8BhT8KF5Rfs=;
        b=PVjODw8ah4bhtjqExClC/sAAAd3crrQboeXXgAswL90dLR/xYL+7dpXTeRANYmiS4k
         wickQhf8LY5mE+YP5Fzz69JnvFvHVAdw2VfRIALljayyBhg1+RvaaQhJj8VvBILlXnG2
         wkUolY78mOR6DsnFLsKttSPBmjVwO/6b9uh5dMUF2AoxC4x4YWRJLnU9YKyCqVGEcNkG
         ++z1sOLdtBmZWX1YRARc8sl2U8SvmGVVpd1XvC5sqNVB1HtBprGq0Ec1r6qSCJsf3wfK
         FyLwBXbL3JoUYLB3iVbSRdXXDn9deqOTadZgkGeMwDnTdva7fmH25+iS2r6Y++kNM6oo
         5wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897980; x=1755502780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBE0vuhks1Zq36ADLjy2EsNSbL4gLinB8BhT8KF5Rfs=;
        b=OhCLKgc3fq91dM8eUSamQbMEe1+Ft3MlPk0CusDONXuaV3p+vpb6hxBw9aL5aDA6EB
         cQzYKTo44gbIm4L8NdCbTJ80nOGlji6oRzsWMRmWM6gRGXrlxtl3wyYvs6g/6DLs76hF
         n6FWzXsj4S1v0afpAVdXV+IuZqNIHmyFrMsPqH490Qa6cqvX4gIYN7nQOv0i34tPJm2n
         LKCG7yu8SybXZiZcudQZFi9LMixA1LZyeJJJYagNy32HHhdrdPEkqJ2blmkKy+BrHuFj
         b5hxzOLM+fa08ynGw+6PrOdUlOGocOI6IKICqPTMhJ8ritNqMlGYRyv45FqlMQolKB/m
         sNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtLyijXdDJ/HR6gMRiU8ue0l295ZpfuXTnHzwsxOjsO+7+PEzq+lu+cgw6+ZyKxbw+k99vOq2CBs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIPgnlZL29JSD4j/bnO1OCP7FleZ8ngf094ym1iVtDBCYQpTd1
	z4OS3nDm/h1RRjv2X+NxKWpnUekQgLsSiSnQZUSA9FcLpkhYK6H7SWRzpLZHd6i6uwVsFYI1sEx
	1+KI=
X-Gm-Gg: ASbGncvxa00HJQv+v+QVEABomr0219iJ6ivrGmNyFhWRHt9l0fv6lKc5poFuRbNanaW
	LEHhPD0drOWzMU9WXeJy0ThNxcZlNpyejWiKTXI+O28czxFnwNSxbfcrOTKeFNRuzojexmt0XrS
	Bap/w5Wk0BTnjcSIwFw24UgiteXpqOUT7IxSm4m4g/MEYfcvFVqC3PNQmMp0o9RymBKvzXVhM+q
	feiNOuGTOtuhdsLAm2epCzja7rq4yjXB2/RG4IFt2qszvBWYy+qV2jwW9hV+29hzqA8acuGOirD
	p9RMKmzfImllDi5YZqbW3eZO5q+kZX3Zmer+hmn5MweeQllPCUwcR00CM1YU0mPk6gT/riOSE4n
	wYl4NWbrhobSTvQHxSxAId53hEywYs8rjdSTQfKmBGV+SBPFowSoq21ug2YtjC1RFVuMZln4dOk
	Q0ft3xP5c=
X-Google-Smtp-Source: AGHT+IFxlUMKfQyJuHL7TDiSrf3KGn01gbZM8y4VbuAf0oY/zugkKxhZ+dgDGSONzhathf3hY33W8Q==
X-Received: by 2002:a17:907:d14:b0:af8:fad5:aeed with SMTP id a640c23a62f3a-af9c64d4032mr1055291566b.29.1754897979890;
        Mon, 11 Aug 2025 00:39:39 -0700 (PDT)
Message-ID: <32cd30fb-190c-44f0-824f-1c4583635250@suse.com>
Date: Mon, 11 Aug 2025 09:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible
 UART emulator (x86)
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-6-dmukhin@ford.com>
 <5c0589a2-91fe-484d-bded-5a68a1626355@suse.com> <aJeVTIG2nU3bqGwO@starscream>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aJeVTIG2nU3bqGwO@starscream>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2025 20:37, dmkhn@proton.me wrote:
> On Mon, Aug 04, 2025 at 12:53:36PM +0200, Jan Beulich wrote:
>> On 31.07.2025 21:22, dmkhn@proton.me wrote:
>>> --- a/xen/common/emul/vuart/Makefile
>>> +++ b/xen/common/emul/vuart/Makefile
>>> @@ -1 +1,2 @@
>>>  obj-$(CONFIG_HAS_VUART) += vuart.o
>>> +obj-$(CONFIG_VUART_NS16550) += vuart-ns16550.o
>>
>> I don't think files in this directory need a vuart- name prefix.
> 
> Ack.
> 
> Hmm, there's already ns16550.c which is UART driver, so it may be confusing to
> have two ns16550s (although in different directories).
> 
> I do not have a strong preference on the naming here.

We have several examples of files with the same name in distinct directories.
As an aside - is it really only 16550-s that you emulate? Otherwise the name
may want to be e.g. ns16x50.c or ns8250.c.

Jan

