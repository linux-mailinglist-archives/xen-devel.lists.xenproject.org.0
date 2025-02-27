Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52DA476F3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897897.1306522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYmB-0008VR-QT; Thu, 27 Feb 2025 07:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897897.1306522; Thu, 27 Feb 2025 07:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYmB-0008T9-Nr; Thu, 27 Feb 2025 07:57:47 +0000
Received: by outflank-mailman (input) for mailman id 897897;
 Thu, 27 Feb 2025 07:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYmA-0008T3-Bf
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:57:46 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8759b353-f4e0-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 08:57:45 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so6613215e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:57:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5710c2sm45023215e9.32.2025.02.26.23.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:57:44 -0800 (PST)
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
X-Inumbo-ID: 8759b353-f4e0-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740643065; x=1741247865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lxCEhA8gBt3F4C0rluBzk0frlNELaO4pI4dgMuwIyfQ=;
        b=RbvjhKwiS+dMmDp83gvlI+QF6wLpgteAZw0XcoO60ldUUm5xWvXz62iNwtzDCl8Odr
         lij2bMT7gW3KFo9ldm9CRDMux+9aGA8i5yju0G0dWfa5MIlKUosAt1GbTC/3gQ8xaEKV
         HYPgENMcBwz6RWBvnoPzoi5ouuyUijfUX67p97agzOmH9rumfsyhXrrDWCjz+qPdSKfA
         6H1mFTdwyoWnaVv4waErdb77JsdjCNmj2JQ/imHD/zdEVdvd+8aCRmGzjOh+pw7QzTrm
         wf7G+QqHzwe6LdHpzWc5fIDFuMA/L6JizRxqq7jv+Fzpgiks0GYkxJh3/KlNYmW7JRDp
         wJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643065; x=1741247865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxCEhA8gBt3F4C0rluBzk0frlNELaO4pI4dgMuwIyfQ=;
        b=ILdLheKkInSB2OfXofgi/jibuw4DGX5zS6o+tEwLQRNkD/9adOCiXYIhM0rjeBO3v/
         3wZY907ShSpYboy0RtICE+8Mm8BDKpawRt3A9iv8d41c7Fl0mQYGIWWTS+0rHNwSh1it
         WU3EwEIpf0KrcYFo8ZJ78DIKuSWHQK0DzbBbmMNxjrDXqXPd+tG4AZBbJlwbXzxGz4UN
         zx58ryRtosg47D09ekT8EFxzY6H5LCNPFynFzRma6JiL+pKwIUaAUmLdauJDpnSLUYF3
         awaL376kH77Y7bmdjjjjAx33YUwpfivAWZgJuzxl9lLz6foD0WXeAQMhphBsIsv47a2n
         2O/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGmf7QMZfpBPidMa/ME3p+C+mL/56B2eENLPB076YyKLVdEUyEU5dd5017FQddPZNIQ+SeBjyAw2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyfs/5fvErts+tJuXmB8u8pUAXsxJdxswpHqiUA7qKfmoJXLLF0
	cQISC0+9t07NvES38LM0Yi4G1EzlnLiw+yI2uLjQmarn1RN9lRqsN/6rpCo1pg==
X-Gm-Gg: ASbGncuGWVNBe+f9cjEenhOxTJRpgeBXJ8mMrpCmmkLZQPZLTHiCgCz+FRtU8UjRqiW
	wqrhrW2h9/aNsvqFekNrdTB/jL31+fxXag8PWBMqS7tknOSsuInUu3nG/2M0yu9Udp2x+7lb06R
	RAl3abDhPRnjPfLbtS2oqYs5b2w3UYkHYHH7DpNU4JHI7N+afaQhp1MXU4xuNf6KDeS2GeU4+8C
	1hpjLtfvJyrmMvqk2qkuT6BVmSHoqhHbWZQcFL2aesleRt9K44XCLgnfVILQjGTxjy6vS/fLaoP
	VQ4yogYtP6BdGhHbpYUwS0ChY163bOmShMpO4vb/RxD9GUgquKWQYR5Tl6Q+sqKlNIgIkYP4w5T
	DanizU7SzEzQ=
X-Google-Smtp-Source: AGHT+IEeIBa7HQ9pHvsRhjljQXoQZPlIOdPsggBBQQEYavMsFrba0t4NCc1Aj0r0E+mj1pQNPnnNNw==
X-Received: by 2002:a05:600c:3114:b0:439:9b80:ca6f with SMTP id 5b1f17b1804b1-43ab0f255a3mr119065725e9.5.1740643064782;
        Wed, 26 Feb 2025 23:57:44 -0800 (PST)
Message-ID: <1620573b-7304-4921-abad-1170191918c0@suse.com>
Date: Thu, 27 Feb 2025 08:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/IDT: Rename X86_NR_VECTORS to X86_IDT_VECTORS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-4-andrew.cooper3@citrix.com>
 <56aa1fbe-ebbf-4e03-b164-51710a75bde3@suse.com>
 <3a3d67c5-c89b-4108-864c-8c46b79b0246@citrix.com>
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
In-Reply-To: <3a3d67c5-c89b-4108-864c-8c46b79b0246@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 18:27, Andrew Cooper wrote:
> On 25/02/2025 8:31 am, Jan Beulich wrote:
>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>> Observant readers may have noticed that the FRED spec has another 8 bits of
>>> space reserved immediately following the vector field.
>>>
>>> Make the existing constant more precise.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I don't mind this, so
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>> I can't help the impression though that the majority of places will need
>> touching again if vector space was enlarged, to use the alternative larger
>> constant then.
> 
> A number of uses don't survive to the end of the series.  For the
> others, they'll need to become conditional on some new control being
> active, so won't be a straight swap for another constant.

Right, that's to be expected. My point though was that the rename (on its own)
is perhaps not overly useful in that light. When all the places will need
touching again (one way or another) the rename could as well be done when said
conditionals are added. But anyway - you have my ack.

Jan

