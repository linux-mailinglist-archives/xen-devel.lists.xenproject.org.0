Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86CB44FEA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111426.1460149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQxM-00023q-ES; Fri, 05 Sep 2025 07:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111426.1460149; Fri, 05 Sep 2025 07:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQxM-00022E-Bp; Fri, 05 Sep 2025 07:34:00 +0000
Received: by outflank-mailman (input) for mailman id 1111426;
 Fri, 05 Sep 2025 07:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuQxK-000228-BP
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:33:58 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf612b3-8a2a-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 09:33:56 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b042ec947e4so250199566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 00:33:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0681aefdsm1750775766b.8.2025.09.05.00.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:33:55 -0700 (PDT)
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
X-Inumbo-ID: adf612b3-8a2a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757057635; x=1757662435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+IamgSgOSDZJJTJne4X2KDi6QWTao6/yjSD4czr+mSQ=;
        b=WXwCIVKOtw1pS6452CU3y+BnBm54L0SLqRJI/EeeMc1Aj2jqzyaR0tfz0YyJ92Qu3z
         nQkX/5s2FkIWUG8NskmOmd8pRTATBYdRU/VJ93EkEMiPhh7CsTG4dbNY52xk1nb/gIDy
         jb3tHiE4Jcb8OBgbpkbbilW/D06ruNG9so3kMkq4lJDx9miH7sJ0iS70zJo6cj7vRiYp
         pYaiXnsbnx+0AgVotfFVCHMk/kYUYK/IfUXuduhV6VmVLA1zjW1KcGxQZhf34YFU4fVC
         zWGOxkwEFK3LlgJAibKOa9TnC8YTsNeyWoJHhiYES+uRSM+Wo8VM8oBQeeVJh8BoXEqp
         Er8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757057635; x=1757662435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IamgSgOSDZJJTJne4X2KDi6QWTao6/yjSD4czr+mSQ=;
        b=sVQDMHAvYfviAO1ChdUYamdpaWHd5n4HJ/OIUzoZya51lEJQ5/qakVTc+95oeTPufk
         UXmynS2f/AvBXPZYFazYmwXVVTH64LGI9u53A73Bxy+YZXlZ4M6lRnaSpZglPYiyn5a3
         Zr8gOKY+/x+I0yuHYyXlBmzsMQuMax5M33/v4ltmm2iIH9Qo3UiS92o4Mmu0njpKtAZ6
         p3yHWbjz5putblxbz/oUxRBBv8eABe+skjKSotPfKbPhx12H5EP3UkM0DbvQswskHubT
         XXnjRMAenaG2moHuIhHTod1UnJeZG71V2gZNV1pvRBVe/J0i9KwazUa/6KMX8i/tLSQ+
         ZWJg==
X-Gm-Message-State: AOJu0Yz+W0j+TGsn0siNJMXE75VITbjM/uZ/PgQszJfdYDeDa8m3EzRx
	v2bxVm0vkgccLGfkRw6wVdUw23OWrgpv6Kukg5xDTXFMhqp5lR2jVb9/WsifIf0XHA==
X-Gm-Gg: ASbGncvqj+nce4CCQ9N431JZJF5BwhqF/Kzhouy0pFa+pVRajTzKuaUab/dxH6QOsn9
	WaifvW4cOBGd8rjE9FONEc56e4wskHm7hfeFL5sfBZKON+KT8w7EYLL4ow6ptQrhRjxUshaEd23
	kJIunIPM0akFQVE+yE4KVF/QHTB249UV+YeFPCuer+hUMSpKc9QZ6LlTXI9tNcm6BDBIex0PMqQ
	G9rqPZdZ5EQPUNUcF8I/kQ1Y7vS0K0dpN017rs0+KNZhqRr1QXPHF9QG1oQC/2BEN1NPjkyrQ2W
	1+/ckvN1G9d+LmrgC+rklZDy3eB/hFL78U9V5jXvE7lfMHBB1sscoWS1Mh9TwAtIAX1iw2gyidp
	HQ/iexTHImk5bBheN2o1oOKCR3ptfGyK/qpzr+CwnxzsYMENhDWW5BITCLKZA11Tb095fr3LzN9
	CIhO7qMOY=
X-Google-Smtp-Source: AGHT+IFQdGlfdHAGjaBWeOBAVnpWXeV4l9niFxW8pqDzeDT/mynZFscW0Csf8HiKcTicLzvKXuXgxA==
X-Received: by 2002:a17:907:fdc1:b0:afe:b878:a175 with SMTP id a640c23a62f3a-b01d97a0c24mr2390793266b.46.1757057635482;
        Fri, 05 Sep 2025 00:33:55 -0700 (PDT)
Message-ID: <1161dc03-2ebe-479a-bf48-80efc3b9be03@suse.com>
Date: Fri, 5 Sep 2025 09:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Differentiating "For experts only" and "Not security supported"
 in Kconfig
To: Demi Marie Obenour <demiobenour@gmail.com>
References: <88efc685-507b-433f-a6d7-9c96987a0567@gmail.com>
Content-Language: en-US
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
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
In-Reply-To: <88efc685-507b-433f-a6d7-9c96987a0567@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2025 05:47, Demi Marie Obenour wrote:
> Right now, both EXPERT and UNSUPPORTED options are
> not security supported.  However, this seems to be
> causing problems for safety-certified use-cases.
> 
> Specifically, disabling AMD or Intel support is certainly
> something that should fall under EXPERT IMO, as it is a
> great way to produce a Xen binary that will not boot on
> a large fraction of hardware.  However, I see no fundamental
> reason it should not be security supported.  Not security
> supporting it means that those producing safety-certified
> builds of Xen (which, presumably, are some of the most
> security-critical there are!) are having to use
> security-unsupported configurations.
> 
> This definitely does not seem right to me.  Safety
> certification and security support should go hand in hand,
> not conflict with each other!  Is there a plan to address this?

Something that isn't security supported upstream still can be security
supported by a downstream. For upstream, we simply need to somehow
limit scope. Any extension of scope will need to come with respective
justification. Yet if done so, I wouldn't see a reason why we shouldn't
at least properly consider such a proposal.

Jan

