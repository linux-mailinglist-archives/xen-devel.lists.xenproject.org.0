Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF69B2DF9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 12:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826395.1240627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NYk-0004HV-3D; Mon, 28 Oct 2024 11:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826395.1240627; Mon, 28 Oct 2024 11:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NYk-0004Fn-0O; Mon, 28 Oct 2024 11:05:18 +0000
Received: by outflank-mailman (input) for mailman id 826395;
 Mon, 28 Oct 2024 11:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5NYi-0004Fh-Gf
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 11:05:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8211d2b0-951c-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 12:05:14 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9362c26d8so9231520a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 04:05:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dec7d16sm363645966b.21.2024.10.28.04.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 04:05:13 -0700 (PDT)
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
X-Inumbo-ID: 8211d2b0-951c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730113514; x=1730718314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=06UglZcYj/tNi3yetEg36gQPxzYF1Rvk9OXvCK1uw9c=;
        b=SjS8c7XUs2G6tvr9+p7GqDWvqksh3499RqkeovPC8pmBzqddFYB0QQ72x5ZxTuSMNb
         HbXGfdTbqmgKyyVFSJHvk0TWfY7OVzeVjJLOOtsHDm6vnfms8r3t1HdidWD7vGWQ9yzl
         uemoZA26G6BhxUw7bDTG5r+KXtJGbK767vX1+zSMNEmvj7mdjPC5+LBxNy/SO+DSKr91
         oRhyM7aEcMTxm+NOYfq/WOG6cjLoTRDfyGm9rZpQ1YiEXFaPPjKDfnCCJr8oEh7LEjdu
         +Xe6sj1lbqU9M1vT2/2lOT6Vm/58ojASBskA7KRtDsdUH20Ne4/IZzPloyeTcL7BJkqa
         rqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113514; x=1730718314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06UglZcYj/tNi3yetEg36gQPxzYF1Rvk9OXvCK1uw9c=;
        b=d6mQXgaCoq3UDBWnESUlsSZay3eerxxCAH+to9nUZ236j+Zjy9J4yus0F5VlyL2An9
         XmAE2kxbuAaGtLwhp3RvjRBc33WkhdZ+9ybwyH2PewHxxGNf9VuGy77zRK4uwsfrlGmZ
         1rIArXj+7T77erK6dwc/q0tWHSe+92HnzgRo9VTV3BWzZuZheQf4qAEsQ3uGjdLflZJ+
         oWeNLctLspzT0L4R9sAGslu5kcogyXuJEz/tHkaMoPViJKRB3Qg0S2HMYNhIZHSzSOVl
         ea+jbRUldmPArzGRiuiDLe8rWvXPsBvMRXq59ps3Qwekkpi2+Ieq8Phh1U+r/eB0+V/t
         IlDA==
X-Forwarded-Encrypted: i=1; AJvYcCUadXlJqLFJ6Gd0S7RhPYA5+65nYWeC7kiu4Ej8y+EnOU6gqb35b3iOPYD4EznLbhpE0V+Bjc5cVEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVUlI5l7UvM3u1flTPYvBfqGpExybbwI/aDeUsZbtGZsKD+H/g
	yeVoE22oM6eCwTPMx3lYC7S4BAf32bJFxu7fQNT3cZQ4xsrPuGtvd9xK58+D/A==
X-Google-Smtp-Source: AGHT+IHcJw72yYV3eZtN6Svlvt+TYVnBkDfgoDG30tDAGTSAHtEPT2HrD2bk5j0vQ0WCEoZzr3vD6w==
X-Received: by 2002:a17:907:1c92:b0:a99:f9fa:5c01 with SMTP id a640c23a62f3a-a9de391b292mr705852366b.32.1730113514137;
        Mon, 28 Oct 2024 04:05:14 -0700 (PDT)
Message-ID: <8f3dfb01-504d-4652-837b-f0a045d28ef9@suse.com>
Date: Mon, 28 Oct 2024 12:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Willi Junga <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
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
In-Reply-To: <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2024 13:10, Andrew Cooper wrote:
> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>> repurposed to contain part of the offset into the remapping table.  Previous to
>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>> table would match the vector.  Such logic was mandatory for end of interrupt to
>> work, since the vector field (even when not containing a vector) is used by the
>> IO-APIC to find for which pin the EOI must be performed.
>>
>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>> that the IO-APIC driver can translate pins into EOI handlers without having to
>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>> unconditionally when interrupt remapping is enabled, even if strictly it would
>> only be required for AMD-Vi.
>>
>> Reported-by: Willi Junga <xenproject@ymy.be>
>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Yet more fallout from the multi-MSI work.  That really has been a giant
> source of bugs.

If there's a connection to the multi-MSI work (which I don't see), the Fixes:
tag would likely need adjusting.

Jan

