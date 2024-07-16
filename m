Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80D932B8E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 17:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759695.1169387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTkNY-0000w2-24; Tue, 16 Jul 2024 15:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759695.1169387; Tue, 16 Jul 2024 15:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTkNX-0000ss-VU; Tue, 16 Jul 2024 15:46:11 +0000
Received: by outflank-mailman (input) for mailman id 759695;
 Tue, 16 Jul 2024 15:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTkNW-0000si-RS
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 15:46:10 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84f4783b-438a-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 17:46:08 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eeef45d865so24791211fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 08:46:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc496efsm59790065ad.262.2024.07.16.08.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 08:46:06 -0700 (PDT)
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
X-Inumbo-ID: 84f4783b-438a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721144768; x=1721749568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n7sbKVnoZ+z4a/v0PzkyzzgY3sSsdLM1gofd9ZzTtSs=;
        b=VvN1RKHORGRavIVjUYxf1K5ilQ2/dY2kP63RVMbMs0+ul9fGswEBYJ7hAckqSMDpCR
         3n3pMiUXiP+LXamxcq3MRlak3wD0KDp6Tt+dxTzVr7Hu1T+kQHrb95wL0hXZBkxOLuvc
         MAED6sgEjsfJIzRV/vYExc6BmeESzZpCw+g9gZv1R+FjDa+Wx21kSN54xERWIJt70nPW
         UrqPYqks2ZDbpzN35/CSNOT+Ny5BYXnfdgumJYppgeDKb4QuxWDO9E8zP/bbiXKrZRN9
         QVQl0F8SVFKCaawlnTpR7whJoRkHmwew5//OyOSu407Umhc4v+ibTP9h4HHLe2jOoN3D
         RAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144768; x=1721749568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7sbKVnoZ+z4a/v0PzkyzzgY3sSsdLM1gofd9ZzTtSs=;
        b=P5uiqlaKoBgXTMVXN5/Xsp43iE7O/1qJoEhe9ouugipxRhipNrUIDF0xA4WNTJLpA7
         Seyh+aGMAs/Ela2zWR17zzsVFmyTjgX9lweaI2o+xvs+lY6/OoLvnV9qPT9vK/AlK6BR
         X+o2Qh1sVxbKNU3iSjut3rWjoLaXdXrQqOtfhxYADh8GqCQCv3b6zyS+kx2vnyXHZd1a
         /ao9KomAQ3t2NCv6UGVnUvr7CgMBAZDRI/MIFdnFP9XmCVZuYQGpMXBUbMiWv6QXpGVx
         L3xhioJ4KItP1OVJL/cONx2xlD4p3vR0sgcdtiA8FBYRz5iDv7cQS9BPYLSUjYx7qbzh
         Yezw==
X-Gm-Message-State: AOJu0YzC1gXuWsZngcBAyjdGxeU26rYOJeZPiex0nLcbGfUEFAYm3aHi
	qxXKEwKVGf4E27cHTtEuZYemPzTsJNPHnNGvXzIcpayFBwYMAJRi6Hr9uIK1Ng==
X-Google-Smtp-Source: AGHT+IF9MSefF8lz8cMhMtLCQSEK4nQHiw+SEqcxY4x1AerQ3NrgcMw5LHU0PNTRJgMIMNHdhY7LZQ==
X-Received: by 2002:a2e:9bc9:0:b0:2ec:4b00:a746 with SMTP id 38308e7fff4ca-2eef4156da3mr21555951fa.9.1721144768189;
        Tue, 16 Jul 2024 08:46:08 -0700 (PDT)
Message-ID: <6f5ab0c6-5c94-439f-b1b8-9839a6d8c267@suse.com>
Date: Tue, 16 Jul 2024 17:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
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
In-Reply-To: <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2024 12:56, Jürgen Groß wrote:
> On 09.07.24 09:01, Jan Beulich wrote:
>> On 09.07.2024 08:36, Jürgen Groß wrote:
>>> On 09.07.24 08:24, Jan Beulich wrote:
>>>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>>>    From the backtrace, it looks like the immediate case is just trying to
>>>>> read a 4-byte version:
>>>>>
>>>>>    >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>>    >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>>    >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>>    >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>>
>>>>> int ucsi_register(struct ucsi *ucsi)
>>>>> {
>>>>>            int ret;
>>>>>
>>>>>            ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>>>>>                                  sizeof(ucsi->version));
>>>>>
>>>>> ->read being ucsi_acpi_read()
>>>>>
>>>>> However, the driver also appears write to adjacent addresses.
>>>>
>>>> There are also corresponding write functions in the driver, yes, but
>>>> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
>>>> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
>>>> ACPI object evaluation, which isn't obvious without seeing the
>>>> involved AML whether it might write said memory region.
>>>
>>> I guess an ACPI dump would help here?
>>
>> Perhaps, yes.
> 
> It is available in the bug report:
> 
> https://bugzilla.opensuse.org/show_bug.cgi?id=1227301

With

        OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
        Field (SUSC, ByteAcc, Lock, Preserve)
        {
            SCMD,   8, 
            ...

and

            Method (SECM, 1, Serialized)
            {
                Local0 = 0x64
                While (((\_SB.SCMD != 0x00) && (Local0 != 0x00)))
                {
                    Sleep (0x01)
                    Local0--
                }

                \_SB.SCMD = Arg0
                ...

it is clear that granting read access isn't going to be enough.

From /proc/iomem I also can't see that Linux would have marked as reserved
that region in any way. I'm really uncertain as to whether what Lenovo are
doing here is actually legitimate. If it was, I currently have no good
idea what to do about it.

Jan

