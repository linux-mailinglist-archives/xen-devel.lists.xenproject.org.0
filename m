Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734AA8A0B4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 16:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954023.1348378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h17-00043t-5U; Tue, 15 Apr 2025 14:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954023.1348378; Tue, 15 Apr 2025 14:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h17-000415-2k; Tue, 15 Apr 2025 14:12:01 +0000
Received: by outflank-mailman (input) for mailman id 954023;
 Tue, 15 Apr 2025 14:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4h15-00040z-5g
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 14:11:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 976aa4da-1a03-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 16:11:57 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso38211835e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 07:11:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2c53sm208380595e9.14.2025.04.15.07.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:11:56 -0700 (PDT)
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
X-Inumbo-ID: 976aa4da-1a03-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744726317; x=1745331117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K3B6SJYg1403AeLUVUtygRmyvNyLFkdNjo0+W9JheYs=;
        b=TQdZ4POmd5sZbDpdukj2gJbXoFZ9QTaZtZAOpKwwop+Rgyz+qIL+XqgpaR5zK3Ke6P
         Jf7JRki03TktG+W2wzqemlz/BTqCaaP2Xo9LluASq1SDBOcMxGmOWx28yo2mfy0TTR4y
         +VA+gxeW85IzunIjFmYcKuP1pTZd/vKQ4RQBk5hm/47swwi7S0W0fHsAzemcumiIASXt
         13Ks9HQanJQYFLFQktCeC02K65+JAd5pSWWnEJGJNO9eS4LpAmt1rjjX8XlTT59uybsK
         nZvOMF3ynHXMu0iq1m9CFqp3l+nAe8ZI2yYDVIKlHb8n5FFSf4PiiSZllfG7DutEUnUx
         HWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726317; x=1745331117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3B6SJYg1403AeLUVUtygRmyvNyLFkdNjo0+W9JheYs=;
        b=SpmLTaUEivdqqMCfTwgNLJGS/rcRNw3o0SY9g5B/9iNVWNNTEMsYXhD0LwWEHKh5ik
         kOqZsqa70xlQxOZBhTpnSC3Wfs6ANXqdYiGI3BPW+jTMIhpFthe5DzE6jwx3S3Tx2tag
         18cfsyTshRh8OrOsR4+fEQoZeiLrD9nrx4Wt35BVhRWMmtZA3NU877dD31iU/1/voBdE
         IvWQZFQR1jgmV2P8ZvA4KMCxXQCfYEGXUPtIRhlxW66roOInH541tUzxy0wc9cXH3Ncs
         t7Hq9C99brLos+IdUarhzGwzX1dbVVtUL4IdYkj0GEGZIyoZNb1ARPadJRJt3QaUM6/2
         5YcA==
X-Forwarded-Encrypted: i=1; AJvYcCVpNGEWnGcmEyGA7qjZISXmu2MzkyYRZ3ImvAHnc+ZrbP7P/VJCYrotcROah2wOXLnpYpiB9+pu01U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0Mfs7/JzwmRa+AxhBSuMOE3UQgchxxBCw2ldXSEHPaxcmhyrh
	kF+BVR5iPNZAnqb6XIuncVjrSz0OKDm5X+aYP/Gy4nE0VJe2Oj/9Zmd0CaZPPA==
X-Gm-Gg: ASbGnctO9nJg1M3ZimMAs8k/fcIJUW2zUnNbEnUntzEPh2jlm5js7fg6NgKZ0iCtKjg
	DqsjjA3PFbO1eWwk+hbf8vZyYbWAUmdOVXQzFtq7SA1TIQkITd/ImErGSWqTPG2+wFvT6y54O2h
	S9PPDnWA1m+pRWqV1zvbXQbapMCUxW2L2qf2muGMI6/IqLZNrQF/Ad76djOerAEj2g/QDjbqUig
	2jlN3+lCXoHrrao91CCbYODE0iT/kNgYgKH46uGB6ooYAju9LBSCPtAXC4/D2UOH9qiRLVdOuTt
	CcU2lGyXrPZojEep04sCxfj7uYZOs5R9bbZ8r2uTMpxdQeR9mz7QvkDuMd6zL0ERRtKda9AjmJS
	acH2OGGpCy8qy7fT1W1ozaonUxA==
X-Google-Smtp-Source: AGHT+IGO1EDJbdLV9K8ynYfBx4EvBXO7+J5OiOR85AoDuSINV21Hci5zSQGs3S/QjsXOgTknF6KLSQ==
X-Received: by 2002:a05:600c:6b4e:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f998aa9d6mr26660675e9.7.1744726317229;
        Tue, 15 Apr 2025 07:11:57 -0700 (PDT)
Message-ID: <e7800c4c-36c8-4e05-a984-18cac7b7089b@suse.com>
Date: Tue, 15 Apr 2025 16:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
 <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com> <D96JE0Q8U026.2FWWHTWUUMTPE@amd.com>
 <60363eb4-cb35-4077-b964-0c321c495a19@suse.com>
 <D9771CIVB3IR.TAKEYOHRCY30@amd.com>
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
In-Reply-To: <D9771CIVB3IR.TAKEYOHRCY30@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 13:59, Alejandro Vallejo wrote:
> On Tue Apr 15, 2025 at 7:17 AM BST, Jan Beulich wrote:
>> On 14.04.2025 19:27, Alejandro Vallejo wrote:
>>> So... how frontally opposed would you be to restoring the ramdisk
>>> nomenclature? Also, for ease of rebasing future patches it'd be far
>>> nicer to go back to ramdisk rather than reinventing some new name.
>>
>> Well, I fear I wouldn't ack such a patch. If everyone else agrees
>> that "ramdisk" is the best of all names (or at least getting close),
>> I'd perhaps mumble over, but let it go in.
> 
> Ok... When I send v4 I'll do so keeping the "module" rename. Meanwhile,
> I'll try to think of some options. Calling Xen's modules and the booted
> kernel modules the same way is just way too confusing.
> 
> I take it you have the same dislike for initrd as you do for ramdisk?

Indeed.

Jan

