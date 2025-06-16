Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951EEADB60B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 18:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017464.1394455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCHr-0001d8-O9; Mon, 16 Jun 2025 16:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017464.1394455; Mon, 16 Jun 2025 16:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCHr-0001az-LV; Mon, 16 Jun 2025 16:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1017464;
 Mon, 16 Jun 2025 16:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRCHq-0001at-TO
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 16:02:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413499a5-4acb-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 18:02:08 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so40794165e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 09:02:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900d2e25sm7240959b3a.171.2025.06.16.09.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:02:15 -0700 (PDT)
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
X-Inumbo-ID: 413499a5-4acb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750089736; x=1750694536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1mLcw5w2P2QBxctahPP8wowYUSjN7hMNQywLrCe2FYE=;
        b=OMQubVDNxNYcJGqJBfMKd3oW7EQrjddPb383f/ec6HwEtNbRTvSZoWWvYYutoGMg8z
         AOyh9e7YNkaZ30VDesquCHeyNsSGf2v+kOcq6ver+7GsqA79XqzffKznU/X9MXo0GgkN
         9nNx3A3RnhARfThhi+HaW0b9mwYpbLnrh/sh+/A49amuRzE6Zw2+TQRo61e/ZjEpF3vj
         OMpNHgnIJBYJr63wvmdPR2XQRKYkWbL1jNYV4ttNOkCG+UJtYcEXmP3/bvDrSE3XoKK6
         kNfgR+VW8t+uKSZwa91dSVj1xjncbO0o884ohqRQQ7WNr3Io0pL8yWbvODaRSxWWQQ0e
         o+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089736; x=1750694536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mLcw5w2P2QBxctahPP8wowYUSjN7hMNQywLrCe2FYE=;
        b=qqGal0rjnb5g7ubmM9O+4ZaM6lnnDxvp455LgerxLLT4w8E+1Lcfu/5RJUTbn6GefD
         TYMndrPOzvrBRUa7aPzTE9T9eDYYpTEnXSeKrGI/JBlcf6LyC6bbXs7gpGwTnU7RMRs8
         nIhkcwGJoXFH7KqGEo53ssgmzbT2con9gLjR6Q6QsvwmCsidI8AnRHA4WaClwt9PuSCd
         8GrqQu4SL23DlLSxmYL3vb/Sj99h9knSjX11nXnuNu3UOxKvml2ch2XYvG5tibah+thL
         DZuaL/2jf3UyxL67tU+bf/dqPt2CBn8Tz4iBBcq84s8wH01qHfDrtJ9sTlCeGsZQjSVK
         N5Pw==
X-Gm-Message-State: AOJu0YwiORjtqJE58uB0t8O8NZvZHfTFhuYrS3QJJFx+61eVSnMPSgHq
	5CXAvXgG46xjIeNl4aYczD5shprL14gidIL8TNiDtpS5BZ+lZ5YesCMFs5GxdMS1pQ==
X-Gm-Gg: ASbGncvYzlzHFcqpFOvCL/bCA2GeUe2Ve06ob+CALIif3MhAEhl/zcR1D+Ycn6BpEUa
	3jixiHsI5RYedMMS04G+UoA9Wifvp9bRNvySdhv4FvMzkucTZc2ZB+LIamgCZOoLFcyn/8zBoKU
	gHoE07v0oS5WptIFcz7doxh5NmzJ7yx3zrTJMUH0xAr++eBIrzIjPWHQKxVrj3Dtm3xrxIkzQ5M
	awzo9xqn6MbyLWFwjZpLIqWMhPGRaWWzeXxHo718E83YaiYUPaZSXUNO/scYgdzcssR5+kvjnrw
	ZrEXrZ1HFlaXaFxSxkI8lDVEPu77Uad7I5mVWeHdVdmb5WZjgdBBayopBOqqGWNhMXR2vRUzEmf
	p/YWxo3Nf6RlVQBTOcCDSf6ANH3gM53b3ZLCkPaxSDBZvVCg=
X-Google-Smtp-Source: AGHT+IHyUw5sjRrR+IVm7BHEjz0Vvi0WBl82oFGl3BRjdsAgSCMNooOhcsF2U8Mr3fhWQDP3LQx7Pw==
X-Received: by 2002:a05:6000:40df:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a572e563a8mr6702740f8f.51.1750089735760;
        Mon, 16 Jun 2025 09:02:15 -0700 (PDT)
Message-ID: <a56574c0-6744-4249-9410-60858f49d04c@suse.com>
Date: Mon, 16 Jun 2025 18:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
 <aFAuRXSryHKj3jVa@macbook.local>
 <2969b5d8-5879-4674-8332-046898e17257@suse.com>
 <aFA7OiV8AX-ua-W_@macbook.local>
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
In-Reply-To: <aFA7OiV8AX-ua-W_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.06.2025 17:41, Roger Pau Monné wrote:
> On Mon, Jun 16, 2025 at 05:20:45PM +0200, Jan Beulich wrote:
>> On 16.06.2025 16:46, Roger Pau Monné wrote:
>>> One question I have though, on systems with a low amount of memory
>>> (let's say 8GB), does this lead to an increase in domain construction
>>> time due to having to fallback to order 0 allocations when running out
>>> of non-DMA memory?
>>
>> It'll likely be slower, yes, but I can't guesstimate by how much.
> 
> Should there be some way to control this behavior then?  I'm mostly
> thinking about client systems like Qubes where memory is likely
> limited, and the extra slowness to create VMs could become
> noticeable?

What kind of control would you be thinking of here? Yet another command
line option?

Jan

