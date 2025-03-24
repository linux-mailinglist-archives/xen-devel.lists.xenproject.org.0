Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0CAA6D739
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925183.1328056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twe4O-0006It-5M; Mon, 24 Mar 2025 09:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925183.1328056; Mon, 24 Mar 2025 09:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twe4O-0006H7-2i; Mon, 24 Mar 2025 09:26:08 +0000
Received: by outflank-mailman (input) for mailman id 925183;
 Mon, 24 Mar 2025 09:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twe4M-00062w-OD
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:26:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0203892d-0892-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 10:26:04 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so43899655e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 02:26:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3b4bsm10281733f8f.25.2025.03.24.02.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 02:26:03 -0700 (PDT)
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
X-Inumbo-ID: 0203892d-0892-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742808363; x=1743413163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BbCfx943c5jgMGsrK1iMAwYyLhhr+8Syt3nZlvHD8pM=;
        b=Jc8aR2dTXqKYCQ+9z7/vEpGXgiSke0pqLhi2R05z+gC+89Zr2owi3P8C+GU/PCbaDN
         xX7CLr+M2Bkpiw+kGRtaarrRKei5D7aupSQfkxlkRYJ5jgssqw4c+B8dcGd3TcrPF4HE
         tmrm01vi68vl+xCdLq5ObGi2cdUpJOU2/UAfjBWiqRelSidr2hhAOOpl5RidFyRXx/zl
         cb1tQoGILvDXgM7PYwUJkRBbk+rRpw1rTELr4Dy/AjdRUSon5j5JKSJim13IJMTdnScj
         s/dhpl/DjyQB5vh5uQUaRbThyhBAOLY3BeYrqKlm8a7ZaatO1ffFkYA8p//wvH/665FO
         lDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808363; x=1743413163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbCfx943c5jgMGsrK1iMAwYyLhhr+8Syt3nZlvHD8pM=;
        b=SnUAh0H2vvm03h9th6o3XBangMDrzEtRmyJ6TrWzsMtIuuBvR7Uj/M8KbcDBc6dgn4
         ASN/sPu9hkOdybqv9GHnVxFNlyL4PMthh9h3xSv6KxjCdpxyOGAVnt0XDWVk+g0fpTnf
         aKLTV0u73z/TIobnJTvqaWKOlufa+22FgEAkYzQHCUtzLJrlNPFjaLNFqSal4h4y1klm
         /ke7HyQczIi7c8Ga3F+jH3u1/7uUU7P6J51iQ54Btsw8kjojdxPmLECiNIKSAJ1kypuI
         v/Kn4peE3ybyA57fWY6E8HOWBfcFmoNPaTXAsGHcJvva+CD+izTrmeDD1xAmSnRuTQcr
         h3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUOAj1F2dms3YADHtuchFu9ghE4Xi52Jr57ay0xYBI7jpuNmNEuu/r/Mnjtk2Oft9R7URfJB4heHy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQsdH07kWiShuih3W3CleKo5dZOXIYHNkdP7Jm+jY/M+2n2qHT
	u87W8WsH90NCnloBJBRQQLSXP/GDWDEMnzIkmHMmiErNjJCwCPyvYtmgFQu37Q==
X-Gm-Gg: ASbGncviYpQu8wMxBG0linC14+rQ1jFzdnZMlH8Boe85cA19ynqXtQ7ARTjpWf2m+kR
	rWBucC8+JB3OKJQ6/FrG8Xm7n3vwqf+NV4UoUlCW18uHX5btJiPx29FvFd1VcAqaoAwVYb6L9ao
	WCJx3WOIUgsW0E2QhhuIHZzOT48/r2BUUmdFpIrcAqUT2/G7s8+Aul5Tc8zud0KKQ2i2sZZrDdL
	6s9H1QHPD4Yz5pCny8oUEJ/g8iBeHxmcVWEN+EvgK2GqE060mcMOluvOFUIX/o1RLIn5Xoh9pXk
	jzZt5mN5MFCh22mBEHHxblFmB2L0Z9hMyofdWGuv2TcXPtvHRNnCTc6Sh5IV1eV4xqiZPO/1TGF
	nBKA+xPxNJDrmI6FpTKgNCGyZ+1ld/g==
X-Google-Smtp-Source: AGHT+IHsGt0Q8kUJdi1P1asmnKQ/wjeTjXptc3LjbCMfem6YSnfPMOqPBqjiNlKEDUWD1wGSOu4/Eg==
X-Received: by 2002:a05:600c:4e4a:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43d509e0d14mr123763205e9.3.1742808363481;
        Mon, 24 Mar 2025 02:26:03 -0700 (PDT)
Message-ID: <21c4087e-22ab-497e-b570-4c6521415b91@suse.com>
Date: Mon, 24 Mar 2025 10:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add kconfig for event_fifo
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2503181637100.2000798@ubuntu-linux-20-04-desktop>
 <646ad800-c01d-4971-ad89-842745a21f2f@suse.com>
 <alpine.DEB.2.22.394.2503211425250.2325679@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503211425250.2325679@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 22:30, Stefano Stabellini wrote:
> On Thu, 20 Mar 2025, Jan Beulich wrote:
>> On 19.03.2025 00:40, Stefano Stabellini wrote:
>>> Evtchn fifos are not needed on smaller systems; the older interface is
>>> lightweight and sufficient. Make it possible to disable evtchn fifo.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Let me ask a more general question, before considering whether to ack:
>> When kconfig was introduced into Xen, the expectation was (iirc) that
>> we wouldn't grow its use to the fine grained granularity that it has
>> been having in Linux. The more build-time controls we have, the harder
>> it is to know whether a certain piece of code was actually included in
>> a build someone, say, reports a problem with. Are we knowingly moving
>> away from that earlier position? evtchn_fifo.c isn't actually that
>> much code to exclude, after all ...
> 
> 
> I think we need to be more flexible with build-time controls. The extent
> to which we should be flexible is an interesting discussion to have.
> 
> However, this patch is not for code size. This code causes unnecessary
> runtime anonymous memory allocations, which are highly undesirable. In
> fact, it is the primary source of such allocations. Additionally, it
> exposes an extra interface to the guest, which is also undesirable
> unless necessary.
> 
> In other words, the issue is not the size of the code, but its impact.

This may help if it was said in the description.

Jan

