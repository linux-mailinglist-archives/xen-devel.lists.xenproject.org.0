Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4154A8A0BE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 16:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954033.1348388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h32-0004aY-GP; Tue, 15 Apr 2025 14:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954033.1348388; Tue, 15 Apr 2025 14:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h32-0004Ys-DC; Tue, 15 Apr 2025 14:14:00 +0000
Received: by outflank-mailman (input) for mailman id 954033;
 Tue, 15 Apr 2025 14:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4h31-0004Yk-Cb
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 14:13:59 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf062e5-1a03-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 16:13:54 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so4815386f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 07:13:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf4458a8sm14855414f8f.99.2025.04.15.07.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:13:53 -0700 (PDT)
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
X-Inumbo-ID: dcf062e5-1a03-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744726434; x=1745331234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hm4W118zBeGzTyKnujUkc9j9Lg9Ss/sI645SNDDBUZc=;
        b=IY4f10uQqQS4MZlTJNMuQTIN6Cuv8lPYKldGgOl9SNGHYiXWuW/z7bkKkMrmailimj
         SeaBcWz9KKmqt72GoV4QXxCe2QLuTWSmnXhnlLqYFkSFN/Vd8vHNZAfxVcFPly35zGc4
         xR2OKJFf6B1qTbRFhqojAvgbZXJpcmlnrGs95F3re2st9qHfilZE0s/A111uFTbDPZW5
         PTQovGiVA65lIgGGdJECBAYx8gB87Q5Mme3fwLFxHtOqgl28qsDoK/YCDNGNlg8pMe9B
         R8NA7tvDkD0NgahTLxZJ3wC06A7vyfZ9dzikM9PW21qrf2XYUwrEfPuLHGEqPfl6Xk1N
         jwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726434; x=1745331234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm4W118zBeGzTyKnujUkc9j9Lg9Ss/sI645SNDDBUZc=;
        b=qATNoMaHJUAMeub054u1nmoHmXQi6MVREgtstuJscvsY58OYE8jNvCrVR84CaEaO58
         Uq2GjSNCiHb3tNVNUCavfV2GduAGhuoYVymzbHwREK8w0UU6P3lwoFUGzk+ffywDA3Yg
         9l9i83CKEctLqzrMl0/ZzGkTPx4O26n/QMFdduxDayC/z+LKni1PXIPJqdgFmjVbasOt
         4iX2pz1yl7l5HIedHneg7vH1Wyf0AzKYS/G7mY9OOxZR+2l16pjOeVSqUtNghsI4rnM9
         8IWdGg01rIeRuab3DjPffE5hkyyHo8rl+Ne/DMqWd+HGuMTs5ljFEIV1GLbyPNzx1OKF
         1d9A==
X-Gm-Message-State: AOJu0YzXbgKwaCqrhaJLvTP2kmW0N0NsSA9WcHwUfc82wur1JGnM3YvH
	gXL6OCMnrwK9RqpHoOb8R+mHS2jC6LOppYkj68ZAa3f+SzIuIYsnKQA4mtmTVg==
X-Gm-Gg: ASbGncvxRXXsadhm0SzWOASirGhsqQ2X6GXbTlgetSxBqnNRDEs2GuK0XDL8wmDrLkf
	mZEGc30guqZ2f7v47pgzMrGnbl8EwZ/ejuuOS1ZNe4FbNWHBgfVIkvwmiQbuWxwjYzICwx3MSt9
	AzCfNKjVFGns4KRZvmpNIKpwD6kgzz1Fa4gCrIwFIe6ft75auAUixWN4ewFw8Ovw0GbXAo8Vdui
	68jQjDVrQaV9hDG/H9KYuKfQgyPDORoAK28IRk48ZNznk0/x6ZZW8iWfo4G7diPRWM7z6NWRRw8
	8FzDzGTBwZd3O3ueovZzCwomJyXmmjNB3cZLER+MCK4BdDQNTypHzcr18JU1hYY5OG6uMXLryK2
	N0IaWj/yCJkAGNWROvJB1uLsjQrgnL2kVsced
X-Google-Smtp-Source: AGHT+IEFIxyWCs6/Pc/gG3TEVoFIvTkT1Auv4gi/DePlR9+opNV9161yH/GgAtO2TUFK68C1uwkE9g==
X-Received: by 2002:a05:6000:1a8f:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39eaaecb033mr13723715f8f.54.1744726433830;
        Tue, 15 Apr 2025 07:13:53 -0700 (PDT)
Message-ID: <d503177b-de52-4068-90b5-5284ebc14854@suse.com>
Date: Tue, 15 Apr 2025 16:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain
 config
To: Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Denis Mukhin <dmkhn@proton.me>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me>
 <D96K8KED132J.3C79EPWZM813D@amd.com>
 <1e86b0e1-fa1d-49b3-8718-db43099772c2@suse.com>
 <D976L0UZ7GJJ.2IKE0CKO5Z7EC@amd.com>
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
In-Reply-To: <D976L0UZ7GJJ.2IKE0CKO5Z7EC@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 13:37, Alejandro Vallejo wrote:
> On Tue Apr 15, 2025 at 7:21 AM BST, Jan Beulich wrote:
>> On 14.04.2025 20:07, Alejandro Vallejo wrote:
>>> On Wed Apr 9, 2025 at 11:15 PM BST, Denis Mukhin wrote:
>>>> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com> wrote:
>>>>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>>>> return -ENODATA;
>>>>> }
>>>>>
>>>>> + if ( bd->domid == DOMID_INVALID )
>>>>>
>>>>> + bd->domid = get_initial_domain_id();
>>>>>
>>>>> + else if ( bd->domid != get_initial_domain_id() )
>>>>>
>>>>> + printk(XENLOG_WARNING
>>>>> + "WARN: Booting without initial domid not supported.\n");
>>>>
>>>> Drop WARN since the log message is XENLOG_WARNING level already?
>>>
>>> As mentioned elsewhere, the point of those prefixes are to be readable.
>>
>> This, however, imo is a matter of consistency across the codebase, not just
>> within hyperlaunch.
> 
> I agree. There is precedent though for certain printks to have a
> collective pattern for ease of reading (e.g: spec_ctrl.c when printing
> mitigations). With I'm merely justifying the 2 spaces followed by
> lowercase.
> 
> I did try to remove them and it was strictly harder to know what they
> referred to.
> 
>> Plus (again imo) if anything, prefixes that are part of
>> the log output should contain proper words ("Warning:" or "Error:"), and
>> they shouldn't needlessly "shout" (i.e. "FATAL:" is okay-ish to be all caps,
>> but the others aren't).
> 
> Right. I'm happy to rewrite them as "Warning: ..." and "Error: ..."

FTAOD - in the common case I'd prefer such prefixes to be omitted. Which
still means that there may be special cases where having them is warranted.

Jan

