Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABCA4FA49
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902099.1310050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplBq-0007gM-7j; Wed, 05 Mar 2025 09:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902099.1310050; Wed, 05 Mar 2025 09:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplBq-0007cq-4m; Wed, 05 Mar 2025 09:37:22 +0000
Received: by outflank-mailman (input) for mailman id 902099;
 Wed, 05 Mar 2025 09:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tplBo-0007MI-ID
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:37:20 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee67f54-f9a5-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:37:19 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390df0138beso3426695f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:37:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7cf2sm20818413f8f.59.2025.03.05.01.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:37:19 -0800 (PST)
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
X-Inumbo-ID: 6ee67f54-f9a5-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741167439; x=1741772239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QJA+5fpHjinsjWQQKWUS7YW4inJ4fNIQc4sTTDAivkk=;
        b=N4Wl6z6fGLqGwuyUrPORUyqXkQ7yeUsIZd3no081OeWZ16X01/gjFw3CZC62pDp3Gs
         jTTgkGN+Mkl9FcszythILxPyd2VLY4kxAaqo1CP6uuEOkeWLin1vJWaWFQFMZXfJZyWx
         QfLNtvUD4r29jawoKzGWfS0AJYZb+WU+PjzdKxI7avxDpmgHrE8ErRkr5gJQntgkV5zg
         F+Y5+sOsLOSPhuu532+kqDetPumLJAVK2gMndjrZIUeWnkS96+XPpT3hmHbWumgNNtZR
         NnUsRftZFURyQqijmQt2xbJNjHX879SoxNQslfK1ycIUbqAdRlJ9tTPA2xhmpwqHA1xV
         WBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167439; x=1741772239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJA+5fpHjinsjWQQKWUS7YW4inJ4fNIQc4sTTDAivkk=;
        b=UfvbyFhDUciHeiXm/iOgb5eY4BGhPsBZTZKWRhK1HBSnT3rU4niE+hQaPtM+ln7SSa
         K/9Azz4pQss83DDQ0XiDEHN2R1OO2iEXb+trNRJdXj2l1AuRp9MB87RHuqVt59zvl8Vj
         ZWKjJpHAus+4TzXS5A7+cZwZntPSMn14eK57SoM2UajHYZwEavPnu4y0lcXBsf1/UUYs
         hQGuMMbsNDB0VC+vKQprCtodvS8DpBpRVpQpfd0Jlul1ydIlho9nvWx8KnpKFNZPJEOV
         3afeqTkjR59aW+uEvlSzsbCA9H4oapyPfMmreRbd7yTGc14FIScosGn81V5ZjwawmtIZ
         n2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXYH4vas9X2uNJBzzSqnwXLcl2/0ystomEN0uxiR2ojzQFG9TU1FiO3ocLpaamSfuSGmLqoJ9SV2p8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYDJIT4FPVf4zjagCCm4h9NhkmTQWq7yZy+HyRbym+pjamO+2O
	L3L6iyCAtShRTBBh/AzYahUdCb+Z831wHJpAN3WydU6+aZw4YTMY39A6bspNwQ==
X-Gm-Gg: ASbGncthPjXNV0DmE7IaLIIg47wtfxE86LjTXAT52lkW6RK+FFdWdtLnsZrisCDhZlg
	bC80WwH/h+4WOctVnGSmMlC/KGcFq9KBGHGBPoLMuUOYgndCqMnD5KxnKBi4iIYHvanlqEJBAHO
	RHOv2F3OQUKLAmkEgIpp5q5fwVbAgQG0hYn1rFrnhywqXAjcHipg/CLP36tsv1pA6wQnu2V1grm
	t0q/d0IZKDeNF+TyfgmmuBiPLoGjAA2z3eVMom+5K9w5/7lSJUXzixnKK6qrxfX0hAtu4EhqklN
	1Fp3oKEx3MspKLVV1hvZfbE6zcb1U/fVgPQLM5EuVL0OZLaM6uB3TETxUPrYtYvo84m0BkWA2ux
	boHTzuwNle+c5PRk+D/bN1SeTL8dSOA==
X-Google-Smtp-Source: AGHT+IFHIzxE2xWaT6mhjaBo6WQvHBsCCk+pL1cyZgdiAXtsQyIGHqWIw7rHhLp6T1JziVeL2+PTdA==
X-Received: by 2002:a05:6000:2cd:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-3911f76f519mr2080160f8f.31.1741167439342;
        Wed, 05 Mar 2025 01:37:19 -0800 (PST)
Message-ID: <ed8a4143-4d5d-4ef9-857b-d86b24f72f34@suse.com>
Date: Wed, 5 Mar 2025 10:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Verbosity during boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <a90f1bb3-90a8-4c3e-818f-498319815475@citrix.com>
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
In-Reply-To: <a90f1bb3-90a8-4c3e-818f-498319815475@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.02.2025 21:38, Andrew Cooper wrote:
> I've raised this during review before, but:
> 
>> (XEN) [    1.209230] AMD-Vi: IOMMU Extended Features:
>> (XEN) [    1.213998] - Peripheral Page Service Request
>> (XEN) [    1.218849] - x2APIC
>> (XEN) [    1.221536] - NX bit
>> (XEN) [    1.224221] - Invalidate All Command
>> (XEN) [    1.228297] - Guest APIC
>> (XEN) [    1.236062] - Performance Counters
>> (XEN) [    1.244692] - Host Address Translation Size: 0x2
>> (XEN) [    1.254547] - Guest Address Translation Size: 0
>> (XEN) [    1.264313] - Guest CR3 Root Table Level: 0x1
>> (XEN) [    1.273925] - Maximum PASID: 0xf
>> (XEN) [    1.282338] - SMI Filter Register: 0x1
>> (XEN) [    1.291241] - SMI Filter Register Count: 0x2
>> (XEN) [    1.300607] - Guest Virtual APIC Modes: 0
>> (XEN) [    1.309655] - Dual PPR Log: 0x2
>> (XEN) [    1.317801] - Dual Event Log: 0x2
>> (XEN) [    1.326078] - Secure ATS
>> (XEN) [    1.333490] - User / Supervisor Page Protection
>> (XEN) [    1.342892] - Device Table Segmentation: 0x3
>> (XEN) [    1.351981] - PPR Log Overflow Early Warning
>> (XEN) [    1.361040] - PPR Automatic Response
>> (XEN) [    1.369341] - Memory Access Routing and Control: 0x1
>> (XEN) [    1.379012] - Block StopMark Message
>> (XEN) [    1.387273] - Performance Optimization
>> (XEN) [    1.395637] - MSI Capability MMIO Access
>> (XEN) [    1.404138] - Guest I/O Protection
>> (XEN) [    1.412042] - Host Access
>> (XEN) [    1.419105] - Enhanced PPR Handling
>> (XEN) [    1.427008] - Attribute Forward
>> (XEN) [    1.434494] - Host Dirty
>> (XEN) [    1.441308] - Virtualized IOMMU
>> (XEN) [    1.448699] - VMGuard I/O Support
>> (XEN) [    1.456345] - VM Table Size: 0x2
>> (XEN) [    1.491312] AMD-Vi: IOMMU 0 Enabled.
>> (XEN) [    1.499087] AMD-Vi: IOMMU 1 Enabled.
>> (XEN) [    1.506835] AMD-Vi: IOMMU 2 Enabled.
>> (XEN) [    1.514554] AMD-Vi: IOMMU 3 Enabled.
>> (XEN) [    1.522452] I/O virtualisation enabled
> 
> Lots of that information is not actually useful, not even for
> developers.

"Lots" != "all" (or maybe you meant all without saying so). Then what we'd
need are criteria by which to judge what to log and and what to omit from
logging.

>  What's worse is that this is a release build of Xen and it
> still takes 0.3s to print the feature list alone.

With a serial console, I expect? Or with us still wrongly using UC accesses
to VGA memory?

Jan

