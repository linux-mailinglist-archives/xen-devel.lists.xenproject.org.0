Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39EA7A266
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 14:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936737.1337913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0JII-0006nl-16; Thu, 03 Apr 2025 12:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936737.1337913; Thu, 03 Apr 2025 12:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0JIH-0006lH-UR; Thu, 03 Apr 2025 12:03:37 +0000
Received: by outflank-mailman (input) for mailman id 936737;
 Thu, 03 Apr 2025 12:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0JIG-0006Gl-P1
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 12:03:36 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abd57c05-1083-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 14:03:36 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so5048805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 05:03:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660eb3sm20179915e9.11.2025.04.03.05.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 05:03:35 -0700 (PDT)
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
X-Inumbo-ID: abd57c05-1083-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743681815; x=1744286615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sgg1/ugnyIOc1WIKoA/Z0SxgW5B3RMyuYwm4J7+mjxc=;
        b=NK+Ryc+Cufgo4p/tdLIf3FyAfyiTAJeGPQp9Qw2Tpes4yJS2RiNpZZb+7ZpwztI+WC
         xbAcJ2yuglrdclMJBw39YEW79d7anizqTU9vd4cSNN1dtA526y/sCwJxdXDysWc2MRUZ
         NP9sgF9a34mtQjl2Wjf8S/JEBQB8AJZS5DYEjNHctGqqW+BdZdGikjiVbMFTjd2M6Fqy
         /Cf5wLi+Umbs364XxZr4ARbqsFN5LuUqtINRrZUgGCRPAFW+KMcoy50vw78/nuMTix+C
         gSX2cLj57+BsQLc0Tb5KKrtPv5fDkNPQF7OqZl+vfl5mFsBn2VIdfdUD3GxBMejUxiOm
         xVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681815; x=1744286615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sgg1/ugnyIOc1WIKoA/Z0SxgW5B3RMyuYwm4J7+mjxc=;
        b=f6U8oHiu2DRIxSc1MysAWZlsV9CAiJWsJyVeBbn7UyQuorwwlIlxJLrnBQ5OFykmpc
         2fbuxwwas8JWIg2sbGDU36afWq1bLMcr4LL81mLsz+5etcID4uRL+Jm+Wzs781fPDYtC
         8QMA7Ue4DXgxO0K/QrRSAnRF3ngUq7LMgoHJJWd3jGHwE8jzzYDd8qQ4kwSVX+5c8cWw
         56KD3Unj9VFgoU1MXQxMQCaek9h3ti71mXAUzVlT90B5pIIY+m0NnuYLFYTx032X2Q1W
         u57zzYyquDNT1zFsP61PLLNxsBl5k85w7U45Xfk1X4TdXbmcZkgnzp3G2bb1OYPF0no7
         avhg==
X-Forwarded-Encrypted: i=1; AJvYcCWe3MueXbQ5MZzIx9z03EyrM1QH5donUc/XBY1GRJuGp9+M4Ow/ZyG64jZUnZJ8PnZ8j1fN7UNsxZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxLNlWgYagBjV1gFifcEmUjLrCOPjZZphTchMhTeyzMAGqxCUg
	tz3QsKaChXdTDck0DW6Me8LC1pPsz9Twm8VTz6IoHk4jHszDCz3dkzLoKxqrP+m0ho7yd/T8nzs
	=
X-Gm-Gg: ASbGncuO/H9WLjNLUri+m+ZI+WPKIPvay1pajck/ModECXpg7EBNE4nKC5QZxFulTGF
	90vvu2XVXtZYntzhEhwUXixjpXxFPFYnD+2gfL/ws0/rBZ0cFi3xfRK8PXXc8QK14H2BP9TJBCI
	6eSKXf2klxPUllD2FZopVPJzsjmW03yTRf5+shNG+9mMu+RVQ1vAv2eKKPbgVHWnfSRKZ5zH3ag
	dfI5Cjn7Bf183+H6fM5YdidcAq8YFFxJT7cTEAEP4Do4s70eTz2ge1IVd64dn+okSiQt7AvjisO
	5YEnt5rNmLNipzvy9cwybDYJwSFJRxS39H0Pl7O6g8IM31bt2wlIIL1kxvHoaoRoUap/FWM2+w+
	z44wgVoc+Cb5W+NZYTu7d05rpQdrYgA==
X-Google-Smtp-Source: AGHT+IHVwKBg9QjNQFncCiQkszkDM9a1epLnklZTwdUssNj1L9LvAOGT5P0auVL6emjxxl3Kqf4aVA==
X-Received: by 2002:a05:600c:190b:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43eb5c188b3mr64118545e9.13.1743681815329;
        Thu, 03 Apr 2025 05:03:35 -0700 (PDT)
Message-ID: <fd08e366-7da6-45d2-b3c6-a63d732c5cc3@suse.com>
Date: Thu, 3 Apr 2025 14:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
 <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>
 <d832f7c5-5a59-46c5-b5c6-109dd13a77e3@citrix.com>
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
In-Reply-To: <d832f7c5-5a59-46c5-b5c6-109dd13a77e3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2025 13:39, Andrew Cooper wrote:
> On 03/04/2025 12:29 pm, Jan Beulich wrote:
>> On 03.04.2025 13:04, Marek Marczykowski-Górecki wrote:
>>> It fails on larger initramfs (~250MB one) and sometimes even smaller
>>> depending on memory size/memory map, let Linux do it.
>> Iirc grub only unpacks gzip-ed modules, so wouldn't a yet better approach
>> be to use a better compressing algorithm, which simply as a side effect
>> would keep grub from decompressing it, while at the same time moving
>> farther away from any critical boundaries?
> 
> Yes and no.
> 
> This is going to change anyway when I (or a delgee) moves initrd
> generation from the test step itself into the test artefacts repo.
> 
> Switching to a slower algorithm will impact every test step right now.
> 
> Real systems doesn't see this in general, because it there's an
> uncompressed microcode container at the front, and it's not identified
> as being compressed at all.
> 
> I'd prefer to stick with Marek's patch in the short term.

Fair enough.

Jan

