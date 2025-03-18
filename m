Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E4A67686
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 15:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919213.1323717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuY3n-0001r7-VJ; Tue, 18 Mar 2025 14:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919213.1323717; Tue, 18 Mar 2025 14:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuY3n-0001pf-Rx; Tue, 18 Mar 2025 14:36:51 +0000
Received: by outflank-mailman (input) for mailman id 919213;
 Tue, 18 Mar 2025 14:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuY3m-0001pZ-Hj
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 14:36:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ba4b228-0406-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 15:36:47 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4394a823036so32099615e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 07:36:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe6a567sm137998835e9.40.2025.03.18.07.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 07:36:46 -0700 (PDT)
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
X-Inumbo-ID: 6ba4b228-0406-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742308607; x=1742913407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Br9rLwKELT1xjtZZD5MgEqN0eZiLv7lzGSAKZ3snQXw=;
        b=RwAxy31UMHn6CylNhSouLFXGjfu6hs4+FE79hIkFpgFn5Kyrv1gTvc9leL4stVuj1t
         +8cCzZ6W5h28AcmouhajkzIE5RAfefMx1510orRJ888xyHD2VRsD3A3qz8gqUNEQDAfE
         hz9eL1kvHpJZK2PFh/FPgN8VYiWTqAtdZv6N3fl3yOt2WEq4C/7PdidX/zUIu2tNrpLk
         izuYW1EMSBEoaduXgUC/mjoVOOZAEl9yQTu2ErE6zBimtujWa9CG6i7+OSixd7Cjfk7/
         1PTVBTlFrpUcYel+sg8clgquk5lfwUU6W1SWIIfRanWtR+VRib8cmrZNOPKYQD7kUU3T
         setQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308607; x=1742913407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br9rLwKELT1xjtZZD5MgEqN0eZiLv7lzGSAKZ3snQXw=;
        b=ncGIT6kJVaXrL2QPJ0twG2A9RKfxhemMph9ULMuYwq+CS095cnGH1X6zsNva8V1sc/
         eWmxuubcv3akWAsWebQQO2KFT5RLdOhvx4sogUPWZT/f6o/lZUMEvxjQXxIoeh8bNIbU
         sM06CJqXCTfUJ7y9UuSgSBTJZxWHGMQj7VP7pZm8hZjmztPEWRjETySJI0hDD5mI4OXN
         4IX2DUVhRSPK1H1PVXiLGeOIGkWRrF7l6dzmJTSRF/QNWDZPxYDxCN00MDNfe3Q0VHUZ
         De15pGm8NleEGk0RbaqKEYMj3Hdz9+AYePPuFZtmN0mp/ERxwcJJY/nfWbhVlvD4f8IN
         vnPg==
X-Forwarded-Encrypted: i=1; AJvYcCXSwowPaERCHjl5Tm6qeQOfMfRcq8PLhaThS3KESPhA1JwwNqHmn2V8En3LtPGDvwj9FcnAN+FGMhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+fcPwVJpVbSxchNK9Wb8DmAmlC7yH2gtTxMhQx+ANxMVqMn/2
	304hSIyZ+2buXGcKcs74ej6fJ2//1CxYvAmCpFCl9Yhlq+KMxk3PYAr2CGNATA==
X-Gm-Gg: ASbGncs2w5XNnlwfHD4EDGxv3VinakrvOGOH6p81cz470iXlmK4oSk+E3CHzpn/ywyz
	XZ6sBzN+MRugfvwMrMf3neqbEzjNyDmN5OMKy3QOEWtEF8rY384HHfLfaPgap87w/asflquuCt7
	xDHdeaExXEFhdv+n3piDb0rXSlYLJzXPvitrb8YcC5/wHBMMQaUJP54WjaI3L53HWwAOdD94kQW
	SHQdUXqrRR7KvhygcEbZFh3uSt8aPJMsPtvW1q+sg1tU/JWzfKSQcQlSw5HJPuQWkuvZ2ZSv6a/
	7VxLaz+RKoJYDEyQA3+UCf9MxAgaZTcl33hh1x7G5Qt+YNj0pYZDX43lSgbn9ORVNGLjM5SmmXZ
	XTgjGKrBjUzgR+MJ8QPvYEurKdN6XOQ==
X-Google-Smtp-Source: AGHT+IFLQPzHNGLhyga5/bgAbxVRrDEl7KPANhKUeZ0CMteXuZCUrkG/d3a+2wP/ct1SOJQej92Aiw==
X-Received: by 2002:a05:600c:4f52:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43d3b980b4cmr30125635e9.7.1742308606612;
        Tue, 18 Mar 2025 07:36:46 -0700 (PDT)
Message-ID: <a8f43182-a101-4e5a-ad25-97e3a41853fd@suse.com>
Date: Tue, 18 Mar 2025 15:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/shadow: fix UB pointer arithmetic in
 sh_mfn_is_a_page_table()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-5-roger.pau@citrix.com>
 <1871a0ff-5766-4707-8791-c20279c12fd9@citrix.com>
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
In-Reply-To: <1871a0ff-5766-4707-8791-c20279c12fd9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 13:53, Andrew Cooper wrote:
> On 18/03/2025 9:19 am, Roger Pau Monne wrote:
>> UBSAN complains with:
>>
>> UBSAN: Undefined behaviour in arch/x86/mm/shadow/private.h:515:30
>> pointer operation overflowed ffff82e000000000 to ffff82dfffffffe0
>> [...]
>> Xen call trace:
>>    [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
>>    [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
>>    [<ffff82d040471c5d>] F arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x1e350
>>    [<ffff82d0403b216b>] F lib/xxhash64.c#svm_vmexit_handler+0xdf3/0x2450
>>    [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15
> 
> Something is definitely wonky in this backtrace.
> 
>>
>> Fix by moving the call to mfn_to_page() after the check of whether the
>> passed gmfn is valid.  This avoid the call to mfn_to_page() with an
>> INVALID_MFN parameter.
>>
>> While there make the page local variable const, it's not modified by the
>> function.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Whatever is wonky in the backtrace isn't related to this patch, so
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but the backtrace
> does want fixing.

Right, but the fix may need to be in the tool chain. I'd be curious what
the symbol table looks like that this was created from. Roger, was this
linked with GNU ld or LLVM? Are the filename anomalies also visible in
the corresponding xen-syms.map?

Jan

