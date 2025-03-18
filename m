Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F2A670EA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 11:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918878.1323495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTyT-0004kL-4c; Tue, 18 Mar 2025 10:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918878.1323495; Tue, 18 Mar 2025 10:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTyT-0004it-0X; Tue, 18 Mar 2025 10:15:05 +0000
Received: by outflank-mailman (input) for mailman id 918878;
 Tue, 18 Mar 2025 10:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuTyQ-0004il-QA
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 10:15:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da425506-03e1-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 11:15:01 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso20166235e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 03:15:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcef5sm129356725e9.9.2025.03.18.03.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 03:15:00 -0700 (PDT)
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
X-Inumbo-ID: da425506-03e1-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742292901; x=1742897701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rDPtN+/APbpbgXEpkHBonpP8S3zV5aoSZmvit1g2QH4=;
        b=aY8oEYGD8LW7v5yGxd5DJ+8V52pSkqGLLZrYfHYqJivVG7eaGdk0bUjp8TlT1I6FRC
         zRqzkqJ3BFVh3EMKpArHP+OqzH0VSjnDy/saUzX2meLhYnhTdwUJgfG0ggpbtvNC+8SD
         Y1Kv2dy8ppreorZWELjQJrn+O5+Ld6wSXXQysB/eW+5X86kPdhXuPtF8K3RI48LmelUx
         PcVgV6drE02jp2fdpF5FvbgJcoT47CTbcCtQihDYswvDkHn0mm5TRrDG4iKloM6lr/V+
         uSCXWTijfE2sn8ZmMm6m3nuwJrhAZyleD7ewHxT+X7UMGhicH4lRMU1PJz7AX51IZ5LH
         vCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292901; x=1742897701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDPtN+/APbpbgXEpkHBonpP8S3zV5aoSZmvit1g2QH4=;
        b=BMZN1v1ov4OIh4rUIJirkPSVby4mjBEafuaI/QDStmXmtQytuy1A0j2KAguLKAkOQG
         nyuxGGrHh7RtsnuUbX+BT/4LdzYR7gkRGFX3OVE3JEeNeuLZdZFSajztSeE+BV7nSd5j
         Ls/dVn0mcWGC13oyTlvRLkW0TmwtFsZ52RCbI6CWf0SlKu/qlRh9+AFZS0NDQ4oqcK3L
         yIkzVC5P8k8i7CZAW4auRTtRaoKKC9JLvXiCpzRKrc+5WHDsGuJz0JLNI6QELzro179A
         xn7NwPb+SoN1iFfNluiOPb/zJad/fHluFZsZ6IaHcwlg0ui2hP7fvThiLGM2f5HHiQ5t
         SgcA==
X-Forwarded-Encrypted: i=1; AJvYcCVvLVFs+sLcCIcarlXMFceLirQE/Ju8yQn21JzKPq0K+DyLqYT9cWuEFyhXZdsnvM41iJSRxDPJFEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu+PUm4B8REGLSznO9cFnTByaP67g1agPd6dvazurupjYG1QZE
	lO7SMPOwlbVEEAd2BBToH7F8x2+t/zsuleLHWsi6i/+4PFsFDlDlY9RuonnOGA4oz10ItBqmoNc
	=
X-Gm-Gg: ASbGncuabTXhlb83+fRu3qXnlp8iEXBcUAIe0dHHL2P9kh+ZYSCCqggIyezNj2sy465
	Dw3eNL2o1VZ+eBDnjbZnwSdvHsLf45i2L4NieCeAGs0r8QdIsEZ4RfXfCl6mjvxGQrZ9MooSSzY
	+RY8fiJqleUwSfjikVrG0JMFw1ysG3VUlJrqrwX1nDfpcikiRGHhQXoAVNFfhLg2XG7aNfyw+kB
	ngau7s1GT8p2rmS1IJFvYMfZ0uucW3+v8Y4+L6gYo7nkKaNcSKpEcy2klZFwrZc9HCmzL/yfdar
	dUb/LZ4Y5oMYcqlR9x1GhMS8QG767hMteBYKOFL5qZayRyQxPhjnf2flavWTIBKFBP1ryzxXmH4
	NoyuVhPCPP1CAI6SRS6B/OKY+5b1yuaTLBkViuwQZ
X-Google-Smtp-Source: AGHT+IGY70/O+YyYrMbSQSbELgrGy8ejoKiWVRIQe6mZkkmMp9v6Z1QXvFgOKwDbC2HapZxClbc8rQ==
X-Received: by 2002:a05:600c:4e06:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-43d3bc59b98mr12550485e9.8.1742292901021;
        Tue, 18 Mar 2025 03:15:01 -0700 (PDT)
Message-ID: <2eabb7bc-0dca-4426-a6ee-49a6ef8968db@suse.com>
Date: Tue, 18 Mar 2025 11:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250318082945.52019-1-roger.pau@citrix.com>
 <38076c0d-8e1a-4d16-b22c-b1db9460ed1c@suse.com>
 <Z9k0tL30_yLuj5kM@macbook.local>
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
In-Reply-To: <Z9k0tL30_yLuj5kM@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 09:54, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 09:36:37AM +0100, Jan Beulich wrote:
>> On 18.03.2025 09:29, Roger Pau Monne wrote:
>>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>>> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>>>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>>>                                              &msi_desc->remap_index,
>>>                                              msg, &data);
>>> -    if ( rc > 0 )
>>> +    if ( rc >= 0 )
>>>      {
>>>          for ( i = 1; i < nr; ++i )
>>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>>
>> I understand that Marek's testing has made clear that this change is needed,
>> yet I don't understand it. If we didn't allocate a new index, why would we
>> need to update in-memory state, when memory is preserved across S3?
> 
> Is this always the case for device memory? (iow: contents of the BARs
> and possibly the PCI config space?)

Of course not. But msi_desc[] is in RAM.

>> (This
>> lack of understanding on my part is why I didn't associate the last
>> paragraph of the description with this extra change, when you first sent it
>> in this shape on the original thread.)
> 
> At least for the AMD IOMMU driver it seems to be expected.  See how
> amd_iommu_resume() performs a pair of disable_iommu() and
> enable_iommu() calls, and in the enable_iommu() function there's a
> call to set_{msi,x2apic}_affinity() that's expected to (re)set the
> interrupts.  Or at least that would be my understanding.
> 
> This change reverts the behavior to what it used to be prior to
> 8e60d47cf011 for the suspend and resume paths.  I'm afraid I don't
> have a sensible way to test changes in that area, so I cannot
> investigate much.

So how did you end up considering this may have been the reason for the
failure Marek was still seeing with the earlier form of the patch? I'm
simply hesitant to ack something that I don't understand at all.

Jan

