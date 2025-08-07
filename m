Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D8B1D626
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 12:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072790.1435762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujyGc-0007t5-Dv; Thu, 07 Aug 2025 10:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072790.1435762; Thu, 07 Aug 2025 10:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujyGc-0007r8-B0; Thu, 07 Aug 2025 10:54:38 +0000
Received: by outflank-mailman (input) for mailman id 1072790;
 Thu, 07 Aug 2025 10:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujyGa-0007r0-Vf
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 10:54:36 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e78dbadb-737c-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 12:54:34 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-615622ed70fso1436150a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 03:54:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615c57f9fd0sm10421573a12.11.2025.08.07.03.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 03:54:33 -0700 (PDT)
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
X-Inumbo-ID: e78dbadb-737c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754564074; x=1755168874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sgh8uw14dhS6OxSmU27FzXN9u+PF0GBjGWoaWjapuM8=;
        b=gc77pOzYVYf78uWRLJSh/xgvXez5VIFMAzJS3woEDvZymOXC99eUdCPEu3nEq1jdYl
         1zp9GLUROcvuaoAqWtZA7v1B6NZNYoMUoaT6k+6LEZo8tuA/g4F0Zy4cwYNS/7Kan3hw
         LNBvT3GVapPoyggY3S3TG7+eyw0Ab8OYOuns+lpd4ZJw3puud+KjspVk4+Fa4oHk81P7
         NjeL9y0CL7neb1jrrdZOhECm/6xaw8QhUxtp3SN9P9Wn2/PgB8pHJJB0ip6QJ3XOKocv
         IxvqrxC9UDtLLWWly4N82Ws6zWbTK9IJuufNRrBdImNmWANX5CBXPQpR6Iu9A5G6zG6x
         Ywag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564074; x=1755168874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgh8uw14dhS6OxSmU27FzXN9u+PF0GBjGWoaWjapuM8=;
        b=sMHdfWsUrNuzxE2vNb6Gdt8DWFnPLGirAmk2OOoKgMzR85OLVbIJnFwVg8XW46qi0L
         Z8lIEP6HGp29EHni6oZhhfAFnBZa9Bm5LXCJw8qOQj4bLtqtb0wtbv9/pOSMz+hbZF34
         m0hRBgjWghnvVMaOyTYOAF2xxkdU/q1VlNAHs3Ep7IWbGL6SodFACv/2C/wXqIORJwUU
         y9tTU3+kk3g0C5tGtQ/W5j26cQZEq/IHdV4j70Z3ShS8nKVlskknNSWYMZCztvUypm++
         vL3vW6MlRtmMW0l12/uLyaPCisP1ir31fC+nO595cgowCF3AlRjQiJh69Q7Y7JmzDS4P
         biow==
X-Forwarded-Encrypted: i=1; AJvYcCWLrrHBgSlqlsLUWJjmF33T/x3RXx6j+rbVlQcMd3Cspr/X379r7cUEI1jjkWbLosM/+FklmE8ZU1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEuHF7oBHsgeYzYawECgGFJr3yJEFNZFfvqjHkbA9LYLwlUmZI
	/Xo2JJRAKXAIIdkL5KiBrop98C38WQyM2dNgTxuA9oG3SgIhKqDSrMvQ+C7HmbB5jg==
X-Gm-Gg: ASbGncsvqlJvUg7SiVZ+u2QNt9gav5EuD36lP2F7zepYzAKTmTQF2BbpaZNZY5xswnC
	7EVjKkBSQCqBQcxqIFnlbIEmRswtOGsdyDhJsRJCZd6oZjNl6CfwYpm5BX/t2X3xDYRMWM6b2cg
	enzdBR/dETxxhcqhp0+9SQmEY6B5AFbKUKySnXSznDYl2NSMA0+kbMwRGMWl3MK1ehT2iggAe7p
	ZeGgCC7R8J5X7FXSjvah779AR7t645zd3YnHTxahuNUxr6U7uS1tqrUZlSZiGNjV54hvcUgwc7Y
	ZkBEanIO6cBHL3t5pv59LlB0udS9DlipX+aTbJRcTz4H/Py5sSVTMwFNI/nHMENFJJ5Al55J7bz
	FSu/IQoO0ZmEKi5tC1YfY/bF3xqILyGQrHD4/Xm/iPJp2CbzGMH2CNtGCfadnXMRE/5z6w/Ww5c
	WobyeoTFw=
X-Google-Smtp-Source: AGHT+IFN/6xLMjm3YS3cEe0yif3oDO8GqYtH9gf5i+RS/mkqpwJSNNxfRy0ZtukxbdL7VmbzzGw8Dg==
X-Received: by 2002:aa7:d64b:0:b0:608:6501:6a1f with SMTP id 4fb4d7f45d1cf-617960b2169mr4064625a12.1.1754564073984;
        Thu, 07 Aug 2025 03:54:33 -0700 (PDT)
Message-ID: <a89ac08c-4124-4c5d-80b0-51975f27e60f@suse.com>
Date: Thu, 7 Aug 2025 12:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Reject XEN_DOMCTL_hypercall_init against
 oneself
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250806165543.169140-1-andrew.cooper3@citrix.com>
 <a4a0d4ab-1fb5-4949-891f-318e3dfa22ac@suse.com>
 <848c5da3-5aa8-4f0e-a9ed-cd41a5fac0b0@citrix.com>
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
In-Reply-To: <848c5da3-5aa8-4f0e-a9ed-cd41a5fac0b0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.08.2025 12:17, Andrew Cooper wrote:
> On 07/08/2025 10:30 am, Jan Beulich wrote:
>> On 06.08.2025 18:55, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/domctl.c
>>> +++ b/xen/arch/x86/domctl.c
>>> @@ -372,6 +372,14 @@ long arch_do_domctl(
>>>          struct page_info *page;
>>>          void *hypercall_page;
>>>  
>>> +        /*
>>> +         * Kernels should use the MSR method to get a hypercall page.  The
>>> +         * toolstack should not be using the DOMCTL on itself.
>>> +         */
>>> +        ret = -EINVAL;
>>> +        if ( d == currd )
>>> +            break;
>> Isn't what the comment says more generally true? To act on themselves, most
>> domctl-s are inappropriate to use, I think. There are a few exceptions, where
>> alternatives simply don't exist (and where, if a kernel wanted to use a domctl
>> [or sysctl], it would need to go through hoops to deal with the interface
>> versioning). Yet there's still the question of whether we shouldn't apply this
>> restriction in a broader fashion.
> 
> I'd go so far as to say that domctls ought to be restricted against
> oneself, but it's not quite that easy.  The majority of them already are
> restricted because of domain/vcpu_pause(), but this is all ad-hoc.
> 
> In principle, the control domain ought to be able to issue some of the
> getter's on itself, but even that's inconsistent.  get_dominfo is
> permitted, but paging ops are not.

Hmm, right. And as said, there are a few which simply can't be done a non-
domctl way. For the patch here:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> This is still a TBD for the stable tools interfaces.  One option I am
> considering was to split the opcode space by whether it was logically a
> getter or setter, but I expect this does not work nicely if we also want
> to retain backwards compatibility.

I didn't expect we'd strive for (binary) backwards compatibility there.
Source compatibility (i.e. merely requiring a re-compile) may be a goal,
yet even there I wouldn't be certain.

Jan

