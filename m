Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F78B0DAEE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 15:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052641.1421384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDA3-00082M-JE; Tue, 22 Jul 2025 13:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052641.1421384; Tue, 22 Jul 2025 13:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDA3-0007zo-GH; Tue, 22 Jul 2025 13:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1052641;
 Tue, 22 Jul 2025 13:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueDA1-0007zi-Nf
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 13:36:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd2c7820-6700-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 15:35:59 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2934047f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 06:35:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4b20sm76597375ad.121.2025.07.22.06.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 06:35:57 -0700 (PDT)
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
X-Inumbo-ID: cd2c7820-6700-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753191358; x=1753796158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jihBMsIObHhLUGIFfxSMpu1TphKUy2OO816jG4rEnus=;
        b=CLneuVQqqTKfu5VS/kWKX2Yvd6oEJi2XayNH1fMe0cbIS/kNvgUr0oP9XAvuuHB2nz
         lKdSKf3+8jEE3k8Zjf9J8GBJeiKCH6Q0BKosdlx5Y51ePJDyACrdbJmO55M0BgwtxbKy
         uN7EpO70Wb8Y7GDCUBwj8Ri1WYgMTjhsIRPXSMYqjA3PSTxvzKJQGI3leZYOJphrgqft
         AgmAqCUTk8JqL1yAfTK3Px2tAXcwkco5HpRkLCShnxXaM1ExT96yOpMgvY3tlCTkRx75
         dBBy0+xupn6fp6Bn/dVNjF2tWab5y1r5WjH9kXhax4FW7u7X+y0jCICLlbqQyNOlSIoP
         UOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753191358; x=1753796158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jihBMsIObHhLUGIFfxSMpu1TphKUy2OO816jG4rEnus=;
        b=dDRaKSdRWEPI31Ykh7t8fq8Y2aqfIyCE1/Gra0P1OMCucL6S47bnTkObKVXZsoy0FR
         RJQkEB+NW3PShgAkLyOG629XILiehv1vIQRFiSFq96RSPmokN5YJUnDnP0dWngGQwFF6
         7+Pt3coJaOcLKd+lQIQ4wF4MxA6DBPDeo0MASfPggoqkyaiEylu/rruHkKGyu7BV5m0I
         sTjdoAr8Dif/kmTvpPN5nJ9cUEtbXOCre1fzhYyMVoHBvRpEm3wFDQ3xApiY245Vex1B
         TrWXLl7RDg4dvS3Elo+FH+biC0twXMt1BPgzlm8BxvCvzd9wTfZEu6cD/radlXehyvl6
         p9JA==
X-Forwarded-Encrypted: i=1; AJvYcCVr1tzz1RZ6gpmGQgXC7UlX7Yoskj3Dv33WlP6mos5gABCLOucRNDrZHHY91LJMIrG5v+rFAsXYWIY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdhLy1EweZBmsZkur0Rnofzn/EWXF0nMOumVjcw+96L/3y357X
	SUD5F1caxA80RyQ195PYt6JZ2mS6ZvCbUwmXMuamvTG9FcAWEovz1zJhCZIv+oFwQA==
X-Gm-Gg: ASbGnctL2tXyTlrica/iUpneDM8ixedFsv1ICoIJCnbAkRcNh9g28NAjr4wMfXyaGEb
	aubMcRTJtfzLNfuza7A82fni+MGCynPE1QeFGBl8Kn/dOSiYSvAGZ2N8/je9qZTq+F9LYqd9c7b
	R5Ni8Z+pNKI4dJnyNMKsNe7umZzUQs2FL++Uemrir8RdgOXu4BosLJd+IxWnNREFjL9bNxoCNZ8
	P1jwvbRZNa9JYi6mFKk56XfDXrRT+TPcA8/lNl+4AFCtV8b5JH/yWUMYByQ8+ysJdILSpbuNSLa
	ijtn3Wv1OPwgd1e8qcuj/H4IONLu3GAREIjAG0qVW9dDPmeppJyz7MDENRZMiRJxDTeW6Kc/gfb
	q5nbrIpJfEFU14qLppn6qcYkVsd0W+v6HKzYTaVbPw3Ir8zgUKnDEUe6M7LIWpuuSN3igXkd22L
	j3VoJgsz0=
X-Google-Smtp-Source: AGHT+IGVWR2wTVEyQQtcSkmNxYCsN4it4jFUyBMvD2AaHyQL0Fz7f9o0MN9OgsbwZBh0tJePi4eeXA==
X-Received: by 2002:a05:6000:2c12:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b60e523f5dmr19824569f8f.32.1753191358235;
        Tue, 22 Jul 2025 06:35:58 -0700 (PDT)
Message-ID: <39cc57c3-cf46-472d-9b66-4ecf9641c5e5@suse.com>
Date: Tue, 22 Jul 2025 15:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dom0less: Reinitialise all variables on each loop
 iteration
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
 <e18e45f6-cffd-4bd9-9091-d2e5e979ffb1@suse.com>
 <DBIL7TSOVEXY.2SBQ063EVQ7GK@amd.com>
 <f88a499a-86c2-4247-b788-a37115c17067@suse.com>
 <DBIMDD208BKM.29K5RWGMS48QS@amd.com>
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
In-Reply-To: <DBIMDD208BKM.29K5RWGMS48QS@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 15:31, Alejandro Vallejo wrote:
> On Tue Jul 22, 2025 at 2:57 PM CEST, Jan Beulich wrote:
>> On 22.07.2025 14:37, Alejandro Vallejo wrote:
>>> On Tue Jul 22, 2025 at 2:18 PM CEST, Jan Beulich wrote:
>>>> On 22.07.2025 13:59, Alejandro Vallejo wrote:
>>>>> Reduce the scope of every variable so they are reinitialised. "iommu",
>>>>> for instance, isn't being cleared, so the wrong flags may make it to
>>>>> domains that should not have them.
>>>>
>>>> Yet "for instance" isn't quite right, is it? "iommu" is the only one where
>>>> the (re)init was misplaced. The other two ...
>>>
>>> We do strive for minimal scope where possible. But you're right "for instance"
>>> might be misleading in suggesting there's more bugs than one.
>>>
>>> I'm happy to have "for instance" removed, leaving the rest as-is, if that works
>>> for you.
>>
>> Except that "every" isn't quite right either. Nor is "they".
> 
> Ok, take 3:
> 
> 	Reduce the scope of dom0less_iommu, iommu and cpupool_node. iommu, in
> 	particular, wasn't being cleared, so the wrong flags may make it to
> 	domains that should not have them.

Fine with me, thanks.

Jan

