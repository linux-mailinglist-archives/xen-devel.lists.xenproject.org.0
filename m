Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86502A657E5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917438.1322358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDFL-0007gw-UX; Mon, 17 Mar 2025 16:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917438.1322358; Mon, 17 Mar 2025 16:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDFL-0007eR-S0; Mon, 17 Mar 2025 16:23:23 +0000
Received: by outflank-mailman (input) for mailman id 917438;
 Mon, 17 Mar 2025 16:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuDFK-0007dy-Pq
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:23:22 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24329adf-034c-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:23:21 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso16904545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:23:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3419sm15140686f8f.9.2025.03.17.09.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:23:20 -0700 (PDT)
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
X-Inumbo-ID: 24329adf-034c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742228600; x=1742833400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oTESaiX/3HYjzWTSwoTM8UI6VbuimraHuVTPQgqBGlU=;
        b=FtYeMGYMzgH7nKB61fxJlILKBOkfXjXbTrmd8JmT7DVmIEZekLQ0eUyv241ksiibcy
         tgobKcXug//gvhmAMr/554v1YIFeSreOJr1zbIcfZ1JKM44ySu7RQ513OmpTcf050bma
         eTsDC3fyT6XLTRfQbCHVPwh+9o3eZgvKM4uyMAmfDB6cWNif2QyaKeiS4D9pyGssaMZw
         c5ALpnTPFByLBn40aS+JzfOoCuA/i2m0ar643U1FjuoHgXa9kU4mFEtC26vbjfgThujM
         RwUy8EgZjoC7rZJT4KT66ED1JcKbdOdnSKetsa+B8CG4KsHn30DWkSlxDgH7iNvGnJiw
         RZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228600; x=1742833400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTESaiX/3HYjzWTSwoTM8UI6VbuimraHuVTPQgqBGlU=;
        b=IthF29MXfz0l1gazij1yQVleEyDWWIMeF5Z6fp+a0jZSTFbGgg8abE66/YOEFYjw/7
         gQFP8Qv8DTa9pHJK6C8K0UGp2w0YCtfeXchdYZwymaxodjKOsnzWIS/ObMkj79Nyd6Ag
         Pn24YfJcZRIwYqlr/ZUPWHRqCZLUzt+pW1L7ZzL5z75lNa/dyQLsh1ZE0P72d1Fe3Sv/
         yIzVSz6G0CwbqQ/R8kwKzUGwJ5COV1/D4Q4owWRNwcpcPHdoGFdOEMBK0rX/U9dWDXAb
         ClD1yUgFXh88r5smeNmv6Hw6AievvdKsIJXkFDISFqnuvQDW1kjznPTxv+TQbstT/Nfa
         UdKg==
X-Forwarded-Encrypted: i=1; AJvYcCURyuuUJHKNfiUJ+SluR5q86hrev89O1r55b3KmJXrZPoLXWLliAbWePLyu3UIlEQvULTchFrJSzqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/+VuxfNZEY8NwVkmc/P5W1kT+qbtK8MkBImXluefIgvV6HP8a
	35NF+OuDRupoxqZo07AXZ9zI75GlTSrTBwbvK4U9tgT4virCrjBKa0uss8kexvePZVBIbEYKLKw
	=
X-Gm-Gg: ASbGnctc2qYCcPHXoNiACTssidehX2zVOvVAA/eqaMMgcmSRecuUM0k81nyviaZJytW
	amAR9vpBhzD25VcYDNokSmUqfgCwpYpOqbPZM9Y0PQ1qpXS9xg3GrAMwrCDzNNNBI1lRqR+pibd
	CIJEtX5at8HIFf3ZzrYV/K7xoRgg61rqjmGVpAvZFdtOgmKpbVW4E0Azx7WcdeTRu7eZn+cgxOu
	Ss0iDrfJuoVdSeou0jm97dtDHDosmfbS7CrNt8FSoGMIAlIGvxVNFpqk8j8JMu/oMsp28ngZs2E
	ao4w4esGZDiWsFyRqFUWAsgapJrOq4ulxtsMNm5VLHYAt+goRJupdSAwXLTUx7XVsvNc4gW0uOy
	CMh0AoY0VK2oh4unLnK50AEo8wG+Pdw==
X-Google-Smtp-Source: AGHT+IEU+oy5qIpSUUDVuV10M9E4mNE/NwHjETRTpYj2d8YTvTCfcPMHjOuzxhuxFMJLQv0pCgs9Uw==
X-Received: by 2002:a05:600c:3b97:b0:43b:c878:144c with SMTP id 5b1f17b1804b1-43d1ec784dbmr134239465e9.12.1742228600270;
        Mon, 17 Mar 2025 09:23:20 -0700 (PDT)
Message-ID: <94a6e5d4-4491-4fb9-b3b0-067164acb973@suse.com>
Date: Mon, 17 Mar 2025 17:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] xsm/dummy: Allow hwdom more - except targeting
 control
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-18-jason.andryuk@amd.com>
 <66291536-a164-48a6-ab3e-304dc6035ed6@suse.com>
 <a89753a3-c8e4-49fa-bb4d-744ba16581d6@amd.com>
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
In-Reply-To: <a89753a3-c8e4-49fa-bb4d-744ba16581d6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 17:17, Jason Andryuk wrote:
> On 2025-03-17 10:28, Jan Beulich wrote:
>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>> Allow hwdom all perms, except XSM_PRIV, and except commands where the
>>> target is the control domain.  This protects the control domain from
>>> hwdom while allowing the hardware domain to serve as the backend and
>>> device model for other domUs.
>>
>> I can see why backends may need to live there. But device models don't
>> belong in the hardware domain, do they?
> 
> One of my tests was on x86 with hardware domain running QEMU providing 
> virtio-gpu to a domU.  QEMU needs to access the GPU for virtio-gpu. 
> Also HVM/QEMU PCI passthrough would need to run from hardware domain. 
> for the config space access.
> 
> I viewed the hardware domain as the place to run the device model - sort 
> of like a stubdom moving out of dom0.

Hmm, yes, when dealing with hardware made accessible to a guest, the DM
would need to live in hwdom (in the absence of stubdom-s). For non-pass-
through guests that's less clear though.

Jan

