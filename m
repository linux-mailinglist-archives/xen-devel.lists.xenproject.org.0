Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A88B0874
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 13:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711341.1111235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzb0E-0000zI-PQ; Wed, 24 Apr 2024 11:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711341.1111235; Wed, 24 Apr 2024 11:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzb0E-0000w8-MU; Wed, 24 Apr 2024 11:41:30 +0000
Received: by outflank-mailman (input) for mailman id 711341;
 Wed, 24 Apr 2024 11:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzb0C-0000w2-UM
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 11:41:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9575c6da-022f-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 13:41:26 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so4611975e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 04:41:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0041a0f3d92c7sm13881885wmq.2.2024.04.24.04.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 04:41:26 -0700 (PDT)
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
X-Inumbo-ID: 9575c6da-022f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713958886; x=1714563686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cF3eY5/WF6uT7gyBukzgqAMdJzbK2KNdBprWZkkybyk=;
        b=aLFtwEsUghRK06B65cwZ8vy9r69cw1fGjHfUaD/Edpmsx8SoNLJ29EOZnXJIpgGmnK
         OgsccsjHLPTriiGGlE5tqPSjFmVkkzo4FOIBmvADT7mjPqytei9cDAQKTNgJrAEpg3aK
         1HIIF2MASvQ0AVBcpf9NMn9orccmtL9/I3GZQPoGrik2faOmyS21ujgKw53gXoBmAJs3
         eGHmFEFaBm7VmIfQhJBiB+gdEu9uVNQ7pbxhrKjHhmZvK+sxLOf12HHCljKhh5uOc1a3
         UM1MFVZpOuw0FyunFagYFMgxLtFhUtE58XAd+w8AZAgE3tKRD3Psh6bzxCbHP88IG2j6
         zu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958886; x=1714563686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cF3eY5/WF6uT7gyBukzgqAMdJzbK2KNdBprWZkkybyk=;
        b=rodzQCHm96LDPwnv7dV1sJmLzZ+oD7wwfMYhy9WcYpvhJyL3AKUlDU+wO1G97xztc3
         KGBj6Hpe1UYBXm8P51KK6VaEH2lNzxohtprr9SgNiiFGpVUCJ2I4EUcuyRSe4dsRUoo+
         7wumyzzCOoo9NTnzLHCf+Fx33DhHBBJ1sgudsaTpqvXIkh5oz5EGyRd78Rb0mhqmLni0
         5t8YZOtDZkSnrvIKnAcMPSvECwgLhd4TGddPkJ7a0hzB3gxTV+j92GYcMYi3noprUg6r
         vENqfkauyWn//kXuZvL0yo1tfpitSBABEmhVmALduqOVnAArncUghhfi6LSs3gAHHxJo
         cjtA==
X-Gm-Message-State: AOJu0YwJmdHhVJRoR+mYOAATa5D4Tc1Drk+nOokNcfoKIhU8yVCu25KH
	ujbruzuQ3g+yBBwgPGMhaWoMQoIgxg084s2N2FXsG6m84FB+hz2vfiyZ3+ZCmHPpEbv703aPhzE
	=
X-Google-Smtp-Source: AGHT+IF8V/XwuY82KtBB0nqOAQWL/RsTMhVCyl5FkSF/n1UbX1vub6AwPP66J/2yd2GceaCE/H+qIw==
X-Received: by 2002:a5d:68c8:0:b0:34b:7074:6848 with SMTP id p8-20020a5d68c8000000b0034b70746848mr3485638wrw.20.1713958886298;
        Wed, 24 Apr 2024 04:41:26 -0700 (PDT)
Message-ID: <ea6c1806-e8c3-4c0a-b3ad-a7550b66ba59@suse.com>
Date: Wed, 24 Apr 2024 13:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/paging: vCPU host mode is always set
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <67805c1f-7187-446c-a5c4-14be8f170f11@suse.com> <ZijSFzOAeo1SfSrb@macbook>
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
In-Reply-To: <ZijSFzOAeo1SfSrb@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 11:34, Roger Pau Monné wrote:
> On Tue, Apr 23, 2024 at 04:32:32PM +0200, Jan Beulich wrote:
>> ... thanks to paging_vcpu_init() being part of vCPU creation. Further
>> if paging is enabled on a domain, it's also guaranteed to be either HAP
>> or shadow. Drop respective unnecessary (parts of) conditionals.
> 
> Is there some commit that changed when arch.paging.mode gets set, so
> that this is actually safe to do now, but not when the code in
> paging_dump_vcpu_info() was introduced?
> 
> I get the feeling we want to reference some change here in order to
> explain why is now always guaranteed to be set.

I was indeed meaning to, but when I found the same even in 3.2, I stopped
searching further.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

