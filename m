Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B8CA9800A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 09:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964013.1354890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7UAf-0001hw-Io; Wed, 23 Apr 2025 07:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964013.1354890; Wed, 23 Apr 2025 07:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7UAf-0001eo-G0; Wed, 23 Apr 2025 07:05:25 +0000
Received: by outflank-mailman (input) for mailman id 964013;
 Wed, 23 Apr 2025 07:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7UAd-0001eg-Ot
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 07:05:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52c623c3-2011-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 09:05:22 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4460712f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 00:05:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4e9esm18059459f8f.96.2025.04.23.00.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 00:05:21 -0700 (PDT)
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
X-Inumbo-ID: 52c623c3-2011-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745391922; x=1745996722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a0+1s3tUkFfoO4ehvXceXcGnOTliJSXrbWTpkFynidk=;
        b=Za82BahwFu/NE91b01PSeia7K0HjHioVUwnAJTe611teKZyPrLUCJyI/DlUs2nVfXS
         bWRc0yYvr0uzsTnXPkGLI8bPj0zNQFpbbhN80mFlGsCLVDvrCoiJjKTiSrEJNgSIrBlK
         Kkbih6qHV4fqNYYpDG4fxtfKGcXilYVb/BHRjEKwVrJYRvCAQ3iHlrchogWwFJ39LEFI
         oQP20vCgTFpeWkXIJq7ZUHYXEUPHFHXrAeUQ97MagYSyt6F/k0LB9k+eW88adN6tqoQ5
         ZYBg6NQ/PpiZC9bvUcPOv2iYp2X+E3ffLR0DM1AsgLNfAfoOHZ8TVfO6nPDblNIXeSkX
         YWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745391922; x=1745996722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0+1s3tUkFfoO4ehvXceXcGnOTliJSXrbWTpkFynidk=;
        b=QfMSY/9S6kZyb0RxGBah3CiguE7NBC2JvwwYbqiG45LHivZkrCTHg9XtFeonH48wV4
         yTYFBqo+hjWiJVmYrFFihIHboGb/qxkBtqkRSnFMg9MkA9ox3ETUvynkXrWGlBGnK3oJ
         HM6e8xu6cbcbMOt8z2yXPOwsJebKr1CrrR+llDHOC8bTuFlbSNgUPGJ/w8JZsLUwSSAS
         4SNu1Fybm22B9MBE3Vo21pLUcbl3m+FSkIWH1AZ/slWXIyuwvqmKT5sB+EXJK5ErK6DI
         TKYaut6WoNGlNaHBKRYJlR95YNHdJbVdWqPHsi/whmEBJQ60iIbxlXKaRu1VcmWFyhpQ
         ETrg==
X-Gm-Message-State: AOJu0YzHvF44qVdPpUAHrSZpdPLr5nGBVJoRbhkE/B4STeuD2YfwGprN
	tnz21RJFDyL+8IWzW+CE6MSUoO4T5RMURQyFEcZZFZ1WjtxK5qx7td8fIb+ecA==
X-Gm-Gg: ASbGncvU4zeYCEAdLd51a0crq2Ozur834oYpPY87w3i72uK0cSEQcHL8AcLmQhUOnJ2
	rxUfIrITLqxi79wUmOSchKCqNvFwecljvDeUcfXKu5hulBWzjRlfOvKaZD7Cdtuc+bsRKOasbAo
	W1LjoRD271fxG9YAw4R9PQaW+Tc/GoPpNOrmRhPBl1Pd60gPPQ5jaLaE0mYKB59ueuzOLy5md+/
	ZWL4AnWRMc/rrBC2OPn/zJ60BECeqQzz1iD79N2hldA4JJNgoY5xXpIUy5oQUnpTJS1BQ7TmQJW
	WRQ5LqvY92Uoxcmw8oBrazsbJ7ukUMxs5JBKcj9mIVbMAvitaBwcR2y8WsMQKX+6gCVkW6d4srp
	49UK+eEvVXRAFxlPsHOl5o0yq7A==
X-Google-Smtp-Source: AGHT+IF5JDifOZtFvUielCXEIdieM3OfuTlUcnfoOIR/xacdmH59s3dpYoxZmGlVbRwuLtT++K4mcw==
X-Received: by 2002:a05:6000:40ce:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-39efbaf201amr13368014f8f.56.1745391921783;
        Wed, 23 Apr 2025 00:05:21 -0700 (PDT)
Message-ID: <900ffacc-3eb1-4634-92a9-d08d9f89fe83@suse.com>
Date: Wed, 23 Apr 2025 09:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] x86/domain: add helpers to simplify emulation
 flags management
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250401005224.461325-1-dmukhin@ford.com>
 <20250401005224.461325-3-dmukhin@ford.com>
 <d21969b3-a48c-4d80-a8a9-5d04b67ed90f@suse.com> <aAgc9H6mxOvnZXk9@starscream>
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
In-Reply-To: <aAgc9H6mxOvnZXk9@starscream>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 00:49, dmkhn@proton.me wrote:
> On Tue, Apr 08, 2025 at 05:23:17PM +0200, Jan Beulich wrote:
>> On 01.04.2025 02:52, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Introduce XEN_X86_EMU_BASELINE and XEN_X86_EMU_OPTIONAL to simplify
>>> d->arch.emulation_flags management in the code.
>>
>> If the simplification is limited to ...
>>
>>> --- a/tools/python/xen/lowlevel/xc/xc.c
>>> +++ b/tools/python/xen/lowlevel/xc/xc.c
>>> @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
>>>
>>>  #if defined (__i386) || defined(__x86_64__)
>>>      if ( config.flags & XEN_DOMCTL_CDF_hvm )
>>> -        config.arch.emulation_flags = XEN_X86_EMU_ALL &
>>> -                                      ~(XEN_X86_EMU_VPCI |
>>> -                                        XEN_X86_EMU_USE_PIRQ);
>>> +        config.arch.emulation_flags = XEN_X86_EMU_BASELINE;
>>>  #elif defined (__arm__) || defined(__aarch64__)
>>>      config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>  #else
>>
>> ... just this, I'm not convinced that's worth introducing yet two more items
>> into the namespace.
> 
> Sorry, it took me a while to get back to the series.
> 
> The X86_EMU_BASELINE mask is used in two places: in the toolstack (xc.c) and
> in domain.c, emulation_flags_ok(), so adding a new flag may require updates
> in two places.

Which may be even desirable in this case, so effects can be properly considered
at both sites. I wouldn't take it for given that the two will forever need to
stay in full sync.

Jan

