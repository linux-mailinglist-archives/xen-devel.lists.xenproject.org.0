Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDC8B037D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711229.1111034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXRk-0004NY-0a; Wed, 24 Apr 2024 07:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711229.1111034; Wed, 24 Apr 2024 07:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXRj-0004KS-Tb; Wed, 24 Apr 2024 07:53:39 +0000
Received: by outflank-mailman (input) for mailman id 711229;
 Wed, 24 Apr 2024 07:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzXRh-0004K3-Ur
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:53:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0bcb795-020f-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:53:35 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso8108335e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:53:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b00417ee784fcasm22846273wmq.45.2024.04.24.00.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:53:34 -0700 (PDT)
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
X-Inumbo-ID: c0bcb795-020f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713945215; x=1714550015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4pZNrDOmqyJEj/rtM0FGQo9uvk3VxesTqZpVH4RjWA=;
        b=GICsC53+P6wYok1QlaoKUxaw9rsdL3HlpYIjS4CqW10Odkjau+Rmik5M9N+uW6PLbH
         WazBo7zD/pTsQeHX54+uoooZI9qMyP6kQz5sZZIiuhL/d/D9JQgs9KF9HLclbxEC5Kym
         ODfGSC2mNuIcTVbm4JAZ/Ic+Swd2PDzLR+31YVHmIPGGARGSlC3ApwrS8HsXUahYlrKT
         V5tcPkNM8Gh/P8/3Yyh6kh8+W0SLrP+L7QJfWuEBh5EUR2oQRfXea4npF7geql9KY367
         JJB4ypUblpPehNSSFK8Alu3R5vQg7DcdOaCdwvCzsf0mA4fMSeBo4kbxc5rclgRxBAUD
         aqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713945215; x=1714550015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4pZNrDOmqyJEj/rtM0FGQo9uvk3VxesTqZpVH4RjWA=;
        b=jeuPVk1CrbP5hNwXE70fgt58zEcODDqdIruyYVbcy1PpNNyPha8SBWf8vxbjiDaOps
         8MmwEnLTXlrUhsC+UGPqi63UKyJvsHD5zgvmnYOIyVjsvP4QeaoqK7RLy+/nTFMByIh5
         wbcx2kk/zVRdSvpjj7LomPxja5FarJdnSIPO1zx8p2m2zdbuLjzqR+yjfQ4drm2lGExY
         kJaANjsRTXFzOmupr3zif4+gw+ASxyOz18o1rbx9cETKc3L4G/94vT9GuJmB9pvSk7kD
         UCk5K6dNH7lRVETb41M0XDir+C7/5AueEyNvbc00QEpq9iTS3Mc3fWi5AcKsU82dMq7T
         QsAg==
X-Forwarded-Encrypted: i=1; AJvYcCUIE3RvrWBCMzdHFyMbihSWWpmVjHXXiGOv+MtSpTT/LB49+zY5Pk6q6o0bW3NMvNYptf4hfwl+uTsqmfgstHNnR0UTeXuj+2Z57gy9/wo=
X-Gm-Message-State: AOJu0YyrMlHf5E6esSlTdcN0dC3jTqXaVIdg7oe8m+EumqC2EvM3pE5r
	/uIh5F7zqM4Vj/EiKY4t92d/+/y34AxTkqpSLwYVsd4m9zBgXryMJ6q174RMhA==
X-Google-Smtp-Source: AGHT+IEZIY4x3Gnt4gEa45W6mFE+QdVv8NUYDgJa6FzejoLIt42aMnbPtJJoAE0odXlCTifAleC/Rw==
X-Received: by 2002:a05:600c:4688:b0:418:f5a9:b91c with SMTP id p8-20020a05600c468800b00418f5a9b91cmr1035439wmo.33.1713945215019;
        Wed, 24 Apr 2024 00:53:35 -0700 (PDT)
Message-ID: <60cc625c-a6db-465c-acba-b56c799a7502@suse.com>
Date: Wed, 24 Apr 2024 09:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4981c3fb0992898a121881333485004f3609eaf7.1713866519.git.federico.serafini@bugseng.com>
 <17c022d9-245b-449f-96c5-7a29ba782880@suse.com>
 <11b8bbbd-1e22-4eb9-b571-cdd5d2661dfc@bugseng.com>
 <1ea60e22-12d9-432d-9ba9-7dd7b2b7d22b@suse.com>
 <816589b3-5c19-4f1f-80b1-b084a0ac5aec@bugseng.com>
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
In-Reply-To: <816589b3-5c19-4f1f-80b1-b084a0ac5aec@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 09:37, Federico Serafini wrote:
> On 23/04/24 18:06, Jan Beulich wrote:
>> On 23.04.2024 17:52, Federico Serafini wrote:
>>> On 23/04/24 12:26, Jan Beulich wrote:
>>>> On 23.04.2024 12:02, Federico Serafini wrote:
>>>>> +
>>>>> +   * - R16.4
>>>>> +     - A switch statement with a single switch clause and no default label may
>>>>> +       be used in place of an equivalent if statement if it is considered to
>>>>> +       improve readability."
>>
>> No, I don't think there should be examples in those documents. But those
>> documents should also not (blindly) rely on terminology in the Misra
>> spec, as not everyone has access to that (licensed copies had to be
>> obtained for quite a few of us).
> 
> In deviations.rst there is an identical deviation for Rule 16.6
> ("Every switch statement shall have at least two switch-clauses").
> I think we should remain consistent.

Sure, I'm all for consistency. Yet given the term "switch clause" doesn't
appear in the C standard (afaics), it wants defining somewhere.

Jan

