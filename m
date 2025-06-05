Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD62ACEA65
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006273.1385470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4LL-0002rY-Vm; Thu, 05 Jun 2025 06:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006273.1385470; Thu, 05 Jun 2025 06:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4LL-0002oj-Sn; Thu, 05 Jun 2025 06:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1006273;
 Thu, 05 Jun 2025 06:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN4LK-0002od-Qe
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:44:50 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8edb1c6d-41d8-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 08:44:41 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so3288565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:44:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf53b5sm113541535ad.176.2025.06.04.23.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:44:40 -0700 (PDT)
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
X-Inumbo-ID: 8edb1c6d-41d8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749105881; x=1749710681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GgyywJP5ynHnrlaMEb819bvlv5C2nMuRfpi1tLHSqTk=;
        b=cocRUGr3FR88RRNegtMTsNWVO8o/fwjodgGCiP5luub9U3j0wQHNP45JJG1RPs68Uq
         WCbNZn90kTZjEnLnleqnIC7GloSnhtd0GGoO/U4xPC2ITER3oGG+SLOS3o6blI5ZIiVd
         AnmH0clf/o0TdgRZgCwLoXC3eZ2B9vtG/pp3sxuaOwq+OIK9C9sEVzMqxft6dgk2hzmA
         5f9HoMHwd12Cot5XLfII1YE101hkYcBWDnNaOUESzOzQ3KHLYy4nnFdOD4qPa3KT0Q4b
         ZarrUPnVQeRrz22AW4faQODRYXmrIz3DVplg9JV4Qz5nQdeBPmh1NA8015AxDx6vHEyK
         54Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105881; x=1749710681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgyywJP5ynHnrlaMEb819bvlv5C2nMuRfpi1tLHSqTk=;
        b=YGGuXgO3Tk7dais62b+Ot7dG8OcvcdtZrpxyhuGhhdFsOMsahOginHiOVyjxxmzklb
         UDrWRc/BDIbR/tNDJsFD0P3l6oJ2nrI87UNSLI50CvQoNQs+maBmoXRGYsNr92COa60a
         hHbhJXQC54KaKG6qa3042RoBxZtkM6Vj9/xEqOesgWr8VEMf/YhzZSyu28n5RRFaLaNQ
         r87PoKGH4gFgM6TvlJyq158/NX44i8opfo4yJ6CAFvXuKAH38GqrjXZGPfuCF+V4Rv4F
         qPgez0Wr6f0xOhsAevneZVgXItILCL2Ez3YPfrMwr2je7p/RYDAfPAcjUGLMpSRZuG8Q
         AVAw==
X-Forwarded-Encrypted: i=1; AJvYcCV8J8sImKFbtjFvw0x3Qp1NVWOjJ8VA6gA68Uln29SXpK29N733s/ItgSQnLZKLjvkQLGGQfJdh+lE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzvcf8KYxhUqRnMO0dLb3oHR8LTQAvpOvi+ovOp7AbaLQ7VWBUl
	jfSSJyP95apaNsltg3ZjQHQuvwv1b0sEBZd9bpkUfduAWd1LH1ghzGSXukVfqmzJ8A==
X-Gm-Gg: ASbGncvooyPN+grbrua8vUOGVU81+Px8kxPn0MU7GQiWSXHvA/S8zw2SAq3kurWZorA
	BtLLrTn4yAdmZ+9sCvIx8YtRoyQsLbRz5pMe1LL29t33bPr37esbqNCm44ZLw6wdTWrarmP2pMI
	hW7jaWPqVDpk8fHEDxDhToxvdtFttHBw7BMjOSCreJ9hRqnjkh+2hvUOmG8RWlhLIir7ymZlTtv
	mcJsl8m0Rslm4bXt0kvgXD0Zm7ql+huNzn3BVYk6fFmQrOvwpjCl8w35GrYVTmpde5t+qqr4d4a
	btyZ1Saaw1wEnWFY0kP3VFTLJI3GEkDq1N/csgnhmzlqmGcpm4M1wbXc7375umFtOMOAjE+jdOW
	4d61gxsadfIF6MXbw+JSpfksX6hyt/fI9VhT5d1FONiETSHE=
X-Google-Smtp-Source: AGHT+IFNlMLietISVppGKM7b/wqlSV9AFZvPb98DDuP/ACCpLp+OxMIHriLeZPSQtiK9MCXljGMSXA==
X-Received: by 2002:a5d:5885:0:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3a51d973a3fmr4391344f8f.39.1749105880932;
        Wed, 04 Jun 2025 23:44:40 -0700 (PDT)
Message-ID: <8412c795-610b-416e-8d22-4149d2492517@suse.com>
Date: Thu, 5 Jun 2025 08:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/domain: introduce common hardware emulation
 flags
To: dmkhn@proton.me, sstabellini@kernel.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, teddy.astie@vates.tech,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250602191717.148361-1-dmukhin@ford.com>
 <20250602191717.148361-2-dmukhin@ford.com>
 <093dc85d-ebf3-4982-8888-db4e7cfd0e45@suse.com> <aEDwMrVu+3PVSh+Y@kraken>
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
In-Reply-To: <aEDwMrVu+3PVSh+Y@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 03:17, dmkhn@proton.me wrote:
> On Wed, Jun 04, 2025 at 12:36:17PM +0200, Jan Beulich wrote:
>> On 02.06.2025 21:17, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Add common emulation_flags for configuring domain emulation features.
>>>
>>> Print d->emulation_flags from 'q' keyhandler for better traceability while
>>> debugging.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> It's not becoming clear why this would want doing, nor in how far some of
>> the bits there may gain "common" meaning, too. Imo this kind of change is
>> meaningful only in a series where later the common-ness is also used.
> 
> I have a set of upcoming changes here:
>   https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-framework?ref_type=heads
> 
> Specifically,
>  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/17f44d23c1904374963c4ec839bc8219041b5d26
> 
> enables the use of emulation_flags on Arm.
> 
> I can move this patch to the upcoming series, if needed, but looks like it is
> OK to have it for Arm even now.

Prior to that series making it to a ready-to-be-committed state, it'll be
(effectively) dead code on Arm. Which strictly speaking Misra objects to.
I wonder if you, Stefano, considered that when giving your R-b.

Further - what about PPC and RISC-V?

Jan

