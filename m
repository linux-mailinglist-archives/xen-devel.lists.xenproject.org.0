Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABEA6D81B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925252.1328125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twenF-0003Rd-0E; Mon, 24 Mar 2025 10:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925252.1328125; Mon, 24 Mar 2025 10:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twenE-0003Pz-Tk; Mon, 24 Mar 2025 10:12:28 +0000
Received: by outflank-mailman (input) for mailman id 925252;
 Mon, 24 Mar 2025 10:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twenD-0003Ps-Gc
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:12:27 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c780035-0898-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:12:26 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2364547f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:12:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6676sm10591040f8f.62.2025.03.24.03.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 03:12:25 -0700 (PDT)
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
X-Inumbo-ID: 7c780035-0898-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742811146; x=1743415946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oRi8XtcCk7V32tPWkDURtWWw9TfjKFl48YcScfmaC7Q=;
        b=dk+cSuFOVxIL45FS6IGEgaH5TNs9GIozQfbufLwQK/1Twq/0l+7DSW0NFqPCbYiO/d
         hUd5+9ZkW6y6OfyXBOBH+yok2tm7bl220iz4PMqDP3tAqdJbQk3AQLgdFbQg+g0bSoFB
         zghAB/HBAu5uDLA8dcWSpC7uSLAPskWg/AXJXZN4fhkdQ+h4tDdkp7vQGYNofROl+qn/
         wgceeSzg+uiXiw8dxKgpHgltUHd07Rii5ipuum/k58LXDVbolh3qeJaZxJgK6RlXIckc
         iHVu/MehFXW+RbLJWefgoc0bfbQE/FNDlcDvS1z7YiNO0IBaclgxkU/814Uvl1W4sKox
         l3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742811146; x=1743415946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRi8XtcCk7V32tPWkDURtWWw9TfjKFl48YcScfmaC7Q=;
        b=aPN3/t5TBbVfWeYOphmPOgY4vYirn4F36G8gthA01I2ZqSH7ypN5R35K4W+mR0WqCs
         IQrzBUktX0PzUpsa1tJlE4wupoqbZrPeSh1sxEfbezZwbjCNeoLpYNCKuAin1GlLPmrV
         0J/WIF9MhQgVoKnpVLSGACA91PBYJC7J9T0CYPXgErCdXOOIegITnN8UEt4S65x615oI
         sY6/A97RyJv9WimRNP0VvnGbvauJYYvkHZ7L4BqGbOfWhAG0qiFTlIHIJm3Sy65p965T
         M3WOxKCwQNbbMjzTPbJ5zcLL84jcQJLmjB6fupE8sR7V8xNKeZ28eQGwFHy3dGB8yOVz
         ygSA==
X-Forwarded-Encrypted: i=1; AJvYcCWPP0cAZgldAr0pyLoRqvoUcth5f9hXZvkwY7/36rB2rX8dZ+MA9Qi/hwIi0KgC3XPkZ6j7g8CFOtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvQWtEB4gWgI5vgsXVp4umHJaVJ7fzlJXsGFFHqam3/UyOCifz
	qCn1/YSb1ZltTxNadYud2J4iJovDdBnUgKytkbcKokKGQ0lrSwlFR6Xo+RUrSw==
X-Gm-Gg: ASbGncugFuzO7up2Das00NCKTHGTdbWzK8DFl3KlHzp/bMcyAhFtoCbQqXUc5i729MU
	ScRVSmT2IIH44hPEqirTDNl1BGCyBckIgvhJCtMcps5lIH5zO3Uzx3bgsonSRRHx3V8+6MO/2F7
	wmSDF+IgYKM0debMlBaiqiR/xvCCeW3ps2Zmg5M3TuDoxWa+0uV4ww8S+1XmBwm4DnyHL6O4u8E
	uRA9UCI8zDkImAN0JMfmf7d8lFrpdGp+Q0Bwk6TuRG/Hr+pxfAziAvujf7fG/vpyp84QJ8u69D3
	Z8hcwrqn+Q1f8Z0Fodg4hcioCjJZhd/rS3ZlNwAZuLTVOUeJE6DXoSA+k6SChfRUvYYQ7bCXlpX
	AdQ1NKHb2yNq8S3I8GA2O/HoWuP6CIw==
X-Google-Smtp-Source: AGHT+IG8kPhbW2nPdImu3vzw/K5dO6Yq1GMSBXKGICs3mI66yZuI4UPYYGCiu+GQwg3xCaIQARFlCQ==
X-Received: by 2002:a5d:5f85:0:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-3997f93c41fmr10078491f8f.50.1742811145999;
        Mon, 24 Mar 2025 03:12:25 -0700 (PDT)
Message-ID: <bba6a148-dcf5-49f5-9c8f-3564e5d5a15b@suse.com>
Date: Mon, 24 Mar 2025 11:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/19] xen/sysctl: wrap around sysctl hypercall
To: "Penny, Zheng" <penny.zheng@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-20-Penny.Zheng@amd.com>
 <b8e760b1-df5a-414e-862a-34fd66f957c3@suse.com>
 <DM4PR12MB84511A7BDC5CA67B4C5CB7D1E1A42@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84511A7BDC5CA67B4C5CB7D1E1A42@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.03.2025 07:11, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, March 14, 2025 5:27 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stabellini, Stefano
>> <stefano.stabellini@amd.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau Monné
>> <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; Sergiy Kibrik
>> <Sergiy_Kibrik@epam.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 19/19] xen/sysctl: wrap around sysctl hypercall
>>
>> On 12.03.2025 05:06, Penny Zheng wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -69,7 +69,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix
>> compat/,domain.o
>>> memory.o multicall.o xlat.o  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>>> obj-y += domctl.o  obj-y += monitor.o -obj-y += sysctl.o
>>> +obj-$(CONFIG_SYSCTL) += sysctl.o
>>
>> This wants to move back up then, into the main (alphabetically sorted) list of
>> objects.
>>
>>> --- a/xen/include/hypercall-defs.c
>>> +++ b/xen/include/hypercall-defs.c
>>> @@ -195,7 +195,9 @@ kexec_op(unsigned long op, void *uarg)
>>> dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>>> #endif  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>>> +#ifdef CONFIG_SYSCTL
>>>  sysctl(xen_sysctl_t *u_sysctl)
>>> +#endif
>>>  domctl(xen_domctl_t *u_domctl)
>>>  paging_domctl_cont(xen_domctl_t *u_domctl)
>>> platform_op(xen_platform_op_t *u_xenpf_op)
>>> @@ -274,7 +276,9 @@ physdev_op                         compat   do       hvm      hvm
>> do_arm
>>>  hvm_op                             do       do       do       do       do
>>>  #endif
>>>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>>> +#ifdef CONFIG_SYSCTL
>>>  sysctl                             do       do       do       do       do
>>> +#endif
>>>  domctl                             do       do       do       do       do
>>>  #endif
>>>  #ifdef CONFIG_KEXEC
>>
>> As indicated earlier on, PV_SHIM_EXCLUSIVE likely wants / needs sorting as a
>> prereq anyway. Otherwise I think the new #ifdef-s better wouldn't end up inside the
>> PV_SHIM_EXCLUSIVE ones.
> 
> May I ask, if we dropped the earlier commit, not replacing all the !PV_SHIM_EXCLUSIVE with UNRESTRICTED,
> whathat is the next plan for it ?

Didn't I mention this in enough detail in [1]? Stefano said he'd have someone
in mind to carry out that work. Stefano - any more concrete indications?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-03/msg00783.html

