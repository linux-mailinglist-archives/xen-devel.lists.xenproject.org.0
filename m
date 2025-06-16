Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB4ADA856
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016502.1393385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Sc-0006QZ-3Z; Mon, 16 Jun 2025 06:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016502.1393385; Mon, 16 Jun 2025 06:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Sc-0006Oe-0i; Mon, 16 Jun 2025 06:36:50 +0000
Received: by outflank-mailman (input) for mailman id 1016502;
 Mon, 16 Jun 2025 06:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3Sa-0006OY-ML
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:36:48 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46614b1d-4a7c-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:36:46 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad8826c05f2so797813666b.3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:36:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adfeaed2d10sm25248166b.105.2025.06.15.23.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:36:45 -0700 (PDT)
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
X-Inumbo-ID: 46614b1d-4a7c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750055806; x=1750660606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pFQeijgzx5FakN/hAjl4IqtirWujbmrpF9iZqvEVeP4=;
        b=Vm3S4GK9pVtpqvk61XwSBQDRlI4E66WZGrRD3MMVMVgPIyqSnZkqA5/AFnH2n5zdB0
         Rv27wp0DOlziBsUnoXwsyCLs1pGM/4i0P8/ORshI/h3X3EwYlx7avOQV2GQ0ttApbTzF
         wLIFZ1OA7aC4Z+IO30yKkJOrsIMEPzKzFq8WrwFxFzeQMKBEw+2DJuwQnCK38uZY+txs
         gIzIA+od6ZMVXovFMb7WaHf6pcch6bytRZ53YdSSjXpQ0N0OIpq9W9jpNtss3aV8aCBd
         csEyG6Ff1U/cp4wBGu2Td6utOzwNc0Ser0zxouIz2q0gU772VhGi4AcrtSZZ3O78QRCt
         bKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750055806; x=1750660606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFQeijgzx5FakN/hAjl4IqtirWujbmrpF9iZqvEVeP4=;
        b=C+aMSL3w0vTgDSP365quFa+8M3Qnbb6C2BN0+ahldGBDq6demBOqa1oQvh6hEgN9hF
         iUR9UfP9suk6qWJJc41LIkV4pPr49slbmfAkwl2ElS6aK8cRg9EVD+IJsMUGDEbyIaBV
         aG53685zgv16+9ptGP63ILoqTIyx3oKuyOTc4Sypronnn2NqvhrRpKMunA0iVVJUsAHy
         LksMuD34nyuJlSKfEjp2Km9fIIDQliReoaR4x7B1eh7iUh9dss/WxmXA1QUZL9xmVfiT
         N4uTtY25NE3hC/mP+ycUBn/iWRA+p+xv5cxtsrO9YK74R68TiOQRSHBSy9XvQBosgaRd
         loXw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z7kOgEZgkAoHD+OU7NNBQRSB9g7LTjoeal6Gg9+4rPBG/ktmG5mY5iTLe4hV2T5AwhLdiQBjl54=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2Cr3FIxW4Zjyj1lUqsXxE7LBysq1ksJa08RbEMRxm2REny1Ds
	rlvYb7glVapNSZW9R0P3RS8MFdtp+LUz6u5cOzDkZPep+uc2ThAuipmZsFO2YNmKTw==
X-Gm-Gg: ASbGncvXsOXOmD/vO91s2DX7zYNzWvfAgUaS0VFfINBLnlieYzU66b5eMRw/WxjzGrS
	YMB32MiNOJND3vP0P58e/u417JYFD5jb63Hy2ZtMyh7GXmt4ylcBsjDmHzGPE9B80ACqkMfpWSp
	60sbpQ0JxzJDVDxscD99+WXn/G4dom+LPTscLt+m9R4E+yWyzGKX8/e1GeL4sUIE3S9lV2xX+BH
	2bpl6LWoKh2ACDUJMj534vVBcNsOTaXb1lQH5LVABLpl3pOalPvdedJ6kaTVE7RvIQScUeKOoI8
	Xynslb0Q+FexwrWG2UXRK2wB4ymVumvrp9/HhLp1u+cMQFDHEYH0XVv2qIc1JDuLkAiNBC3zz+D
	t2qzyHuOubvVJGRtTbpJ7MWISnvHMJl4lOtrLz3sK5lSQVa8=
X-Google-Smtp-Source: AGHT+IG47KLzpWhyrpGOiBAR0XfZMApSuMe8JIE4bSttiX2eX9eWC1SLRUVKnjyqX1woQ3x8nIxKXA==
X-Received: by 2002:a17:907:7216:b0:ade:4295:a814 with SMTP id a640c23a62f3a-adfad53f2e2mr766245166b.53.1750055806061;
        Sun, 15 Jun 2025 23:36:46 -0700 (PDT)
Message-ID: <bf6fd680-c608-4d64-ad8f-38eac102991e@suse.com>
Date: Mon, 16 Jun 2025 08:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-5-jason.andryuk@amd.com>
 <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com>
 <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com>
 <alpine.DEB.2.22.394.2506131547320.8480@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506131547320.8480@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2025 00:51, Stefano Stabellini wrote:
> On Wed, 11 Jun 2025, Jason Andryuk wrote:
>> On 2025-06-11 09:27, Jan Beulich wrote:
>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>> Allow the hwdom to access the console, and to access physical
>>>> information about the system.
>>>>
>>>> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
>>>> permission would be required.
>>>
>>> Why would xenconsoled run in the hardware domain? It's purely a software
>>> construct, isn't it? As a daemon, putting it in the control domain may
>>> make sense. Otherwise it probably ought to go in a service domain.
>>
>> My approach has been to transform dom0 into the hardware domain and add a new
>> control domain.  xenconsoled was left running in the hardware domain.
> 
> I think we should keep xenconsoled in the hardware domain because the
> control domain should be just optional. (However, one could say that with
> Denis' recent changes xenconsoled is also optional because one can use
> console hypercalls or emulators (PL011, NS16550) for all DomUs.)
> 
> 
> 
>> I suppose it could move.  Maybe that would be fine?  I haven't tried. The
>> Hyperlaunch code populates the console grants to point at the hardware domain,
>> and I just followed that.
>>
>> One aspect of why I left most things running in the Hardware domain was to not
>> run things in the Control domain.  If Control is the highest privileged
>> entity, we'd rather run software in lower privileged places. Especially
>> something like xenconsoled which is receiving data from the domUs.
> 
> Yes, I agree with Jason. It is a bad idea to run xenconsoled in the
> Control Domain because the Control Domain is meant to be safe from
> interference. We want to keep the number of potential vehicles for
> interference down to a minimum and shared memory between Control Domain
> and DomUs is certainly a vehicle for interference.

As much as it is when xenconsoled runs in the hardware domain? Especially
if the hardware domain is also running e.g. PV backends or qemu instances?

Jan

