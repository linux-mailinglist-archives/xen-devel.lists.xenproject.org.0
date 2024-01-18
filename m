Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349FF831557
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 10:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668644.1040983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOGv-0003V9-Pm; Thu, 18 Jan 2024 09:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668644.1040983; Thu, 18 Jan 2024 09:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOGv-0003Sd-Me; Thu, 18 Jan 2024 09:01:13 +0000
Received: by outflank-mailman (input) for mailman id 668644;
 Thu, 18 Jan 2024 09:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQOGu-0003SX-Me
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 09:01:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d796d60-b5e0-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 10:01:06 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3376d424a79so9700678f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 01:01:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfe601000000b00337bf461385sm3515093wrm.26.2024.01.18.01.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 01:01:05 -0800 (PST)
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
X-Inumbo-ID: 1d796d60-b5e0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705568466; x=1706173266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9s+boU+UZs5oxFTNgdFyx+4K66mSOkw+r4d4h929r00=;
        b=Kr1NZlzD8aQJd7w5lAzMZoh7wrDmgQmuv1VyxyBIwIagGMlbpCNJfC2vaq8ddBpfw8
         27cUzkEYuFrixh5JOHRolw3367kND8deRnTiJEuahbxI+qjNBMf93UWAN0sCfflmAvv4
         DxBoTrYXV/DGW2njw9WgM3xl+orQCFeDo/OUMTzgufiO+MH9al8NA7RGArOJuOgBlOK9
         wAZTSMLJQDy2nme1ruQhSHM/zbO6AdPXbNIHVEIemZQQQlDphOqxSZS82Vnz6zmsFFer
         cJrfrt/K3ZbEgVufZYeFcQ+VaJr8w/ZwJvR4iqIiF/mifxyG0dSknrjzmzB/W++IHXUg
         OfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705568466; x=1706173266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s+boU+UZs5oxFTNgdFyx+4K66mSOkw+r4d4h929r00=;
        b=rtKEd7Ud/D1WeX8f33T6QE9XYY0QNu8k4G211X2F16R12K4Rq+4K8nt1Mv2jNAo+zI
         dugpU7E/OEAEMIdRo5QUN9QB9Nl1HblXdtJJqpjDTFaVoSxAI7Hb53ul04gm3uUvLmOx
         xw0DIbRUVWoyeu+a0AGOuj3ZSlIXjuxZe20uHVh31dG2xkCd9/igDic/ccwUTeX7YZVW
         i6SXp/QaNqiwdwPRwJ9ReHaceqP0+B7aZ6RG/+yzymFmsBUhxzqAzZNYuHKBb/sqvgy1
         2dzvo/ZGNcisCsfD/MZGPYAjPFvjAha+oYQLHhv7cTLw/20h72OHXG68DZDiXlgvJfyM
         3pFg==
X-Gm-Message-State: AOJu0Yx9egibkn8xRfYtnlw24YLJ9eBmzBRfKkxKLqfLYfD+GbCb7sFy
	7CRvPeC6P2YptZXwKPMzIdWY6poxSIBGWGZ4d52k4MBmcUqf7+Xxt3YxJh+RJw==
X-Google-Smtp-Source: AGHT+IGEzTq8x1ivCqzOEzjd+oXcV2FZURSBIOtZLouypfI+FLCuKDCPCCya3Gb7r/LC8B6KGfE7xQ==
X-Received: by 2002:adf:fa8a:0:b0:337:c80f:6e19 with SMTP id h10-20020adffa8a000000b00337c80f6e19mr249259wrr.69.1705568466221;
        Thu, 18 Jan 2024 01:01:06 -0800 (PST)
Message-ID: <69bd7fa5-4237-4b11-b56f-2f2176972e62@suse.com>
Date: Thu, 18 Jan 2024 10:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
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
In-Reply-To: <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.01.2024 07:23, Patrick Plenefisch wrote:
> On Wed, Jan 17, 2024 at 3:46 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 17.01.2024 07:12, Patrick Plenefisch wrote:
>>> I'm currently talking to the vendor's support team and testing a beta
>> BIOS
>>> for unrelated reasons, is there something specific I should forward to
>>> them, either as a question or as a request for a fix?
>>
>> Well, first it would need figuring whether the "interesting" regions
>> are being put in place by firmware of the boot loader. If it's firmware
>> (pretty likely at least for the region you're having trouble with), you
>> may want to ask them to re-do where they place that specific data.
> 
> This section changes boot-to-boot and grub vs EFI direct load, but my
> untrained eyes don't see an obvoius pattern. I've attached several logs.
> Name format:
> 
> xen-XENVERSION_LOADER_KERNELNAME_TYPE.log
> 
> where XENVERSION is 4.17 (packaged in debian 12) or 4.18 (I built from
> source) or 4.18p (I applied the patch you mention below and built from
> source)
> 
> where LOADER is grub for grub2 (from debian 12) or UEFI (direct boot via
> efibootmgr-configured UEFI entry)
> 
> where KERNELNAME is either empty (PVH failure), or linuxpatch (linux with
> the patch requested above), or linuxoffset (with PHYSICAL_START=2MiB), or
> linux6 (debian 12 kernel)
> 
> where TYPE is either pvh or pv
> 
> For the two logs that actually boooted (linuxoffset), I truncated them
> during pcie initialization, but they did go all the way to give me a login
> screen

The LOADER=UEFI logs confirm it's firmware (in the widest sense, as it could
also be a UEFI driver) which puts in place these unhelpful regions.

Jan

