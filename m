Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E532CA3392F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 08:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887161.1296701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiTwo-0004h6-28; Thu, 13 Feb 2025 07:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887161.1296701; Thu, 13 Feb 2025 07:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiTwn-0004e4-V7; Thu, 13 Feb 2025 07:47:45 +0000
Received: by outflank-mailman (input) for mailman id 887161;
 Thu, 13 Feb 2025 07:47:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiTwl-0004dy-OD
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 07:47:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce495e21-e9de-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 08:47:42 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so102717166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 23:47:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339cb9esm75353366b.132.2025.02.12.23.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 23:47:41 -0800 (PST)
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
X-Inumbo-ID: ce495e21-e9de-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739432862; x=1740037662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D2/taIdlKej5DeysU79s6HefFvD5Ow4cQngAGVVTGDg=;
        b=XQqH6QasV1qMnbXZ6fFvm3BVPWI3WbYvlM99zw3gIuzfLwGprDKu590yVhhoVaq1Cq
         NjbVTSypNdPcCTwTY2lZqsnwjEkDaSx9Rq0IsxRA/k3I+VUzs0KbFKxhAH1Oy56VBinh
         qPctQ4SYK+M8WwXdRCpYrfnU+ldLoKmFaLpbXaYzuieP44PRzsPVd9+7MfVZezC5N37r
         rpHtW9+O8MWoxdEjVC/Hptedlp9o51MlOCCSWV8ccUnpiukZmUvqn/OOMHUtn9IwfH4T
         8A2vcH7oXf+WKu9/tt//G0Nv9VLD2GR9MFk3bE9GpyTY4eW9e/sKkdq6MMvkhbgZV65g
         rP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739432862; x=1740037662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2/taIdlKej5DeysU79s6HefFvD5Ow4cQngAGVVTGDg=;
        b=I5m2ZiRoRcpFCJDx7HAceHmn6ZzOfsLLpvkk/GaklERPTvyE5qyXSFdg+zEDR+565T
         BThNw2XFQpHux1PKX7ap+TDvMhaEaga8CmvbUl6G3IHsRlNfcsiTkEpnW8uvZuGi2hPr
         2Ce9m+oxCxV2aQjaCmo/WzQAe+JQKGBmeqkt5BhJokj9595Auo4eIrXuCnJbt9+Rw/2R
         fESw8LzgpEn1LOpXfrXaUbxgy5xPRUmS/5lOAUNd95wXj4/Stx6vB0iOeo4Ge9M+eEy1
         JZghcCTQEsziS82EXgSToHJyRkgf3ouEd7Dd51mz0ytMGMQQdYekEL6F9eUEyfmYUtaK
         TGZA==
X-Forwarded-Encrypted: i=1; AJvYcCWwKBgcp8u8ea3YQaki9BOvh/sLOyM995WQFzewbhDWr22jcdiHdNLlnJJkx5UG49LdwEQZhjEBhII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFr4dCBXGuhf/HDt9TklpD6uddb3aUOZ8QGAnyPBEQPvvS7nfA
	n5BBsbemwxsDthHEV1o0aWYTjEbXQzoMQtxP4tyyOkyEV8tBH+0DeSzYjMg+yQ==
X-Gm-Gg: ASbGnctZ7UeQmnFxIlT4ij4TxSCEW8YNlCKquHMafs+4al2lwp1PeiBvdHDzhyTc2C0
	OmEM02aoSA+7aUdGwLJsoQfYnxBIiP5+4SYs2us3foBtnTcfazYITOQYK/3OvjMKXX2bRAzgVBS
	mNt2upzmKL68i5WorsSA+MfQI6Qs0fbNvcx9mRdbAUHI8shVEOQv2Jjdk5j3ZjUHBpmXfMRJ24g
	QKd8MKEzXulEnjZ84ywdgeW/M/LHlqL/7J35G/2gucmm8wGIxeyxOQYQgKNxTS1xT903ftcFT46
	3gP0ENOxZxP68klVWyyvc/gaeFeOS6VPcy8rGrnE4gZpp/RjfkmpOFRt2G0MLvBy18ZIiomuXQ+
	L
X-Google-Smtp-Source: AGHT+IGN09pvtwLAFA76qcJqeVLI6TlRHeB0TN5HVyAWZG8IO/ysI5sJjXh6lwXqd32+9lrBmemsAg==
X-Received: by 2002:a17:907:da5:b0:ab7:e73a:f2cc with SMTP id a640c23a62f3a-ab7f33c7622mr647719166b.27.1739432862001;
        Wed, 12 Feb 2025 23:47:42 -0800 (PST)
Message-ID: <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
Date: Thu, 13 Feb 2025 08:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 03:00, Stefano Stabellini wrote:
> On Wed, 12 Feb 2025, Stefano Stabellini wrote:
>> On Thu, 13 Feb 2025, Andrew Cooper wrote:
>>> On 13/02/2025 1:25 am, Stefano Stabellini wrote:
>>>> Hi all,
>>>>
>>>> I am looking through the few remaining MISRA violations that we have
>>>> left.  One of them is R11.2:
>>>>
>>>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
>>>>
>>>> Specifically, mctelem_cookie_t is a pointer to incomplete type and
>>>> therefore COOKIE2MCTE triggers a "conversion between a pointer to an
>>>> incomplete type and any other type".
>>>>
>>>> mctelem_cookie_t is defined as:
>>>>
>>>> typedef struct mctelem_cookie *mctelem_cookie_t;
>>>>
>>>> I am looking through the code and I genuinely cannot find the definition
>>>> of struct mctelem_cookie.
>>>>
>>>> If mctelem_cookie_t is only used as a pointer, wouldn't it make more
>>>> sense to do:
>>>>
>>>> typedef struct mctelem_ent *mctelem_cookie_t;
>>>>
>>>> ?
>>>>
>>>> What am I missing?
>>>
>>> Nothing.  Or perhaps the twisted thinking of the original author.
>>>
>>> It is genuinely a pointer type (== known size) which you can't deference
>>> (because there is no definition), and can only operate on by casting to
>>> an integer.  Except the code also requires it to be a uint64_t which is
>>> why there's some fun disabling of relevant hypercalls for compat guests.
>>>
>>> If someone could find the time to file it in /dev/null and replace it
>>> with literally anything else, I'd be very thankful.
>>
>> Are you OK with typedefing mctelem_cookie_t to uint64_t instead?
> 
> I confirm that the following resolves the MISRA violations
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
> index f4c5ff848d..2ccd490e5d 100644
> --- a/xen/arch/x86/cpu/mcheck/mctelem.h
> +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
> @@ -52,7 +52,7 @@
>   * the element from the processing list.
>   */
>  
> -typedef struct mctelem_cookie *mctelem_cookie_t;
> +typedef uint64_t *mctelem_cookie_t;

Yet that makes it possible to de-reference the pointer. Which, as Andrew
explained, is intended to be impossible. If this could be properly
replaced (not exactly what Andrew indicated by "file it in /dev/null"),
fine. Truly purging the code (i.e. as Andrew suggests) may still be an
option, with appropriate justification. But simply adjusting the type
and then moving on is too little, imo. Even if you used void * (to make
de-referencing impossible) I'd view it as largely papering over an issue;
then converting to other pointers (without explicit cast, and hence
without making apparent the badness of doing so) would become possible.

Jan

