Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC0ACFC87
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007873.1387043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQVR-0000OV-2k; Fri, 06 Jun 2025 06:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007873.1387043; Fri, 06 Jun 2025 06:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQVQ-0000LQ-Vo; Fri, 06 Jun 2025 06:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1007873;
 Fri, 06 Jun 2025 06:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNQVP-0000LK-9X
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:24:43 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb25a77b-429e-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 08:24:38 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so834450f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 23:24:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f17bd2sm682193a91.5.2025.06.05.23.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:24:35 -0700 (PDT)
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
X-Inumbo-ID: eb25a77b-429e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749191076; x=1749795876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c6ZmDoNRz4N6sQ+bbBK0fVk623wioHylixoxsvSDo64=;
        b=eSLY8RpS+QgnWLqharuI5XMIuXsB0kGRfwbJJzCExt5qNyu2wZbAgfkRMQcxvAYo1a
         2uZEC+3dmpu836r26JJh4a40kMwo/Lu4my4smOg0Jkg1NQbfKqRdbJfrjqc+wVZY9BWo
         D67f1Fzr0KVXeAMy91Cihbq7+bw2Nj4+4SBKzp41lh3y7AYDm4Wt2N3bveuuFl5ncF3x
         WPLdXs5fMvBMT7+MpPhRKougS9Fzh1NvMfNOklqO+R/rC6j4ASHMo4/pz3xNmwF5zrOa
         UB07yC2G4Qo7Zh3S1hai9cK6/jVmHN6DUv0oeYlNXiXKswabIs/bNfQCRVrpdZWaTy70
         Vo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191076; x=1749795876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6ZmDoNRz4N6sQ+bbBK0fVk623wioHylixoxsvSDo64=;
        b=CVXmgPBE0QVeoLw+k3h5mCwUXPsyyLtc92hHUb7ckaiVQ7qYZJNyxp2p8Z9K4UVt/W
         SboUO1KNVQ9jJvS5AYz1DPrgY22XP/EvoKXrGQcJ103qf0yrNPFHPXX9exltGCjXTQGG
         CfZncMqXE81faTHHeFm3/Bc/D/BMhylaopS3WZPpoHKnh+/POwYu4C2m13ME/EDj70sY
         XoFi/a1m9hO9nVC9Iku3VZEcQ6ewxg/91a9Um1Cu/rKBfWR5FyukP5BvT9NmD8yceCDS
         ZwEzTRdu7FePerAV7NSdO4PjKhiuShfcN/kN/YfbH/tl3ZcZiNyGzc5jnWWlOQIFrkSw
         fc7g==
X-Forwarded-Encrypted: i=1; AJvYcCUASIjFr4lUM3KGjGUc4sIEZyFObV3R/X6CA3PY1iqVyD5XFxPOIIIQQOkm0CV72hRGKNec1zvP52k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yznz1QhRN/efgk3jb3nJY72cmWPPqLC6QCpUcau8W9UxYEdTJge
	jlPNWTNDjKEKM368pvvfNU+CKB9Y7U2pD7gMI1nHAI5IjZMByiNW0apRH7UtVCImnw==
X-Gm-Gg: ASbGncufizqYaDuh9VaQTW03xtvI6HlXUeGtqH0TfIywxrIdRSV+PzIPPOX5t+5wOxs
	v69ddjElQ6sTM7hPQXRLz2I6oONgJE/3UvLXFD/cQ/xmGTZwJPLon95YBVZaaQl3gqZu5iCq+Rz
	KbZzrmYroCEwVm4lyb4DrFKnjHU1GZHQ5WHuGxaHBG0VsA+ejjY2IAQrvfAEJet+AfIr8HFS7Au
	sMh33cKdrBVvaLhquRCB2F4Uk2xouNjVR8KlcFzrrNK54JdfC9psAsC8F6heAAaUd5gu9jTJsQD
	7eALFlGU7zN+ayviT7aQHbgsxo6P/n3t1e+pHNCG4xdiHGU9owVZUWDFuwm69PEgDsPkgwhVrOE
	8s/+DMnuCJQCKkOT7SWnJKywAnEC0VsKUC5Apy/9nTc/CBnet0dkeHHKv/Q==
X-Google-Smtp-Source: AGHT+IFWlqB67XrpaM7QjiSiwfMBJ9W7/iEIAezUwB2uCvQHvPDbqJO4g8zEEUul9usGkeSiPLIyLw==
X-Received: by 2002:a05:6000:4013:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3a531cc1aaemr1789843f8f.57.1749191076029;
        Thu, 05 Jun 2025 23:24:36 -0700 (PDT)
Message-ID: <34dc92c0-9046-482b-b1e2-fab62972da8e@suse.com>
Date: Fri, 6 Jun 2025 08:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
 <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
 <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
 <daa4bf8b-3082-47c0-abab-74a103c1b6b2@suse.com>
 <DAENVFUK1OBR.BKRNCOBGBQ9Q@amd.com>
 <8768b970-6c62-4fc4-8ef5-b74f1aa650e6@suse.com>
 <DAER4E9ML3N6.3IR8V47ATEDZL@amd.com>
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
In-Reply-To: <DAER4E9ML3N6.3IR8V47ATEDZL@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 18:48, Alejandro Vallejo wrote:
> On Thu Jun 5, 2025 at 4:20 PM CEST, Jan Beulich wrote:
>> On 05.06.2025 16:15, Alejandro Vallejo wrote:
>>> On Mon Jun 2, 2025 at 4:24 PM CEST, Jan Beulich wrote:
>>>> On 02.06.2025 16:19, Alejandro Vallejo wrote:
>>>>> On Mon Jun 2, 2025 at 9:51 AM CEST, Jan Beulich wrote:
>>>>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>>>>>>> --- a/xen/include/asm-generic/device.h
>>>>>>> +++ b/xen/include/asm-generic/device.h
>>>>>>> @@ -6,9 +6,7 @@
>>>>>>>  
>>>>>>>  enum device_type
>>>>>>>  {
>>>>>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>>>      DEV_DT,
>>>>>>> -#endif
>>>>>>
>>>>>> Why would this enumerator need exposing on a non-DT arch? In fact I would have
>>>>>> hoped for ...
>>>>>
>>>>> A non-DT arch would not include this. x86 doesn't.
>>>>
>>>> Both here and ...
>>>>
>>>>>>>      DEV_PCI
>>>>>>
>>>>>> ... this to be hidden for arch-es not supporting PCI.
>>>>>>
>>>>>> Similar concerns elsewhere in this change.
>>>>>
>>>>> This file is exclusively used by arches supporting DT to abstract away where
>>>>> the device came from. x86 does not use it at all, and while it wouldn't be
>>>>> impossible to compile-out DEV_PCI, it would needlessly pollute the codebase with
>>>>> no measurable gain, because the abstractions still need to stay.
>>>>
>>>> ... here: In "xen/include/asm-generic/device.h" there's nothing at all saying
>>>> that this file is a DT-only one. Instead there is something in there saying
>>>> that it's suitable to use in the entirely "generic" case.
>>>>
>>>> Jan
>>>
>>> Try to use it from x86 and observe the build system catch fire. It could be made
>>> to not go on fire, but it implies heavy refactoring in x86 (particularly IOMMU
>>> code) for no good reason because there's no devices in a DTB to disambiguate.
>>>
>>> How about adding this to the top of the header?
>>>
>>> ```
>>>  /*
>>>   * This header helps DTB-based architectures abstract away where a particular
>>>   * device comes from; be it the DTB itself or enumerated on a PCI bus. 
>>>   */
>>>
>>>   [snip]
>>>
>>>  #ifndef CONFIG_HAS_DEVICE_TREE
>>>  #error "Header meant to be used exclusively by DTB-base architectures."
>>>  #endif
>>> ```
>>
>> Might be fine, together with giving the file a name somewhat referring to DT.
> 
> That would bring it out of sync with x86's asm/device.h. Both of them define
> device_t and doing so in differently named headers would just be confusing for
> everyone.

Okay, then the name can't change. In which case the #ifdef-ary needs to remain,
imo, to keep the header being "generic".

Jan

