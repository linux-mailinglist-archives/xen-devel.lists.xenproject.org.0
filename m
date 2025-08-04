Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9354B1A3F3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069434.1433291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivgu-0007ng-06; Mon, 04 Aug 2025 13:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069434.1433291; Mon, 04 Aug 2025 13:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivgt-0007mE-TL; Mon, 04 Aug 2025 13:57:27 +0000
Received: by outflank-mailman (input) for mailman id 1069434;
 Mon, 04 Aug 2025 13:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uivgt-0007m8-6R
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:57:27 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3d937f7-713a-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 15:57:26 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af95525bac4so359601366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 06:57:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0f4sm726279766b.106.2025.08.04.06.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 06:57:25 -0700 (PDT)
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
X-Inumbo-ID: f3d937f7-713a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754315846; x=1754920646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eFAalWm0d5rltBK28JG41YzeiUOfA922D0o2OrM0abY=;
        b=K/18JBzuE93fgSmbxf7VDCgmUFmDlqBNv70p4Z7DN26Pv4G9nJV01yOilZAX25Y4fG
         JNGuYglKrm1D1kR9+uk6n7hivsZXpLLuO5vgIUAx0uDq4IALyP2lGVTsH7B1F80Vz+xA
         RkJ5hJ2XI+kfD9hlnrwIDYIom+Y2jcqAcSK+sTGMl/DM5ySsPUu/EzDxXEFtKf4UtFFw
         H89BUOH4oohWcc8UKnNngm/fs09tph5+lInJIuJjLo0eZ6yOqOe1e2r2IiKgWdS83OJa
         r8Ws4b6mxhLshe7EPQ1T/OgFEq7+VVKZRyCpyk83eC6dkTQdxnMI7bH4FG3awxXb8Uh/
         ZGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315846; x=1754920646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFAalWm0d5rltBK28JG41YzeiUOfA922D0o2OrM0abY=;
        b=qesdlmGPcMTjvBUcIpxChy5Ts5skcE2+23VzRX+XeiM53efmVpNMVX3ntHcICPSgcG
         r9x3WypHpybvPjZIy85zHHQc3uIIqnEG+WHHgmKH/ZGcmArQ9Hv11cs3g/MIai28d64c
         pz95OLCf3H7B3ECmeDwvw1dkSXGYvMa/f74ob8rQHlRdKo1cOl2KoASEFo7sardQXUa6
         lDP+Ezm3vc+BnYy3oReMuYcFpR6tCejy/U1mb/kuT10O/+kagfWD5VPI+Nk2WCbI+NlJ
         pyy3LSIDMYNWHG9VXg3DuBGRSE0O+My9zMtEYclJWVrhQRxZDzmXrGl2JYTe4lapfKhz
         pHRQ==
X-Gm-Message-State: AOJu0Yy5A5tV1BxtHPOrdTaBpnUN6J4x5x0N75jnXItM5IVX5QAnrc8G
	nwEcR//rCbp4cOaPeRf0D/bUj9CBd9iOV7JfWq5J2Rkfy6SOUmcRcozq6s9xxDfL7g==
X-Gm-Gg: ASbGncsBqyAGlNqYwbJSJSBk4YJolu3LrT3irfBbrY55Top3uM33lsE33D+w9+eUXNv
	L6tr6kNuCOgn4GXBpddx3iKWtNUiwQeTVWlVUU1gwhDrYzNzOLecvCYYnkmW3HKJWrW9E/mCNd9
	t2KQZ5q5OR1SpNybAJNFbe8y0Ii/VAK3PipMOV6Hpo6YsZSH/vbphOL63//B/Eq8gaAFUp48MZZ
	BlU4fZtMq1XidCd+6Qenheb0Lx7pw1Pw5b/N2aC3Z0MoL+KvFaoSCieXR3fPuhJCf1cxF0Ed5Kl
	8MSZxBtfxh1yLGJQtONmliiMomAekDJPjo0Or+KqEb0yxhhx2sZsma4rf/qe+RyMLSBw/0xu63z
	eeBCOEvkXJXFvCjt9RsDC/Ehcbmn/+ac8mWUmzNzVXK0IAiII6Ce10D17ghnNrXiL37EQXpQfQy
	GqDrW/ivRvJ+ckCLLnsw==
X-Google-Smtp-Source: AGHT+IH4YSADhxenBh8IsSxANv4E/55ihsyJBmDW82MrPRLZ5mYge7Kk43KvgZKYq9hFRdiTK7ID5w==
X-Received: by 2002:a17:907:c13:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-af9401ee918mr1021818466b.30.1754315845529;
        Mon, 04 Aug 2025 06:57:25 -0700 (PDT)
Message-ID: <6b8a8631-14c5-4e57-91f9-22acdf7efa07@suse.com>
Date: Mon, 4 Aug 2025 15:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com>
 <aIJi8E2BC-dzAIz8@macbook.local> <aIM5IR-d4_u19JVe@macbook.local>
 <6d5545a2-bbf0-4cf9-9820-5eaf6d8530f8@amd.com>
 <aJC76twnBXNQnA3d@macbook.local>
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
In-Reply-To: <aJC76twnBXNQnA3d@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2025 15:55, Roger Pau Monné wrote:
> On Fri, Aug 01, 2025 at 05:06:32PM -0400, Stewart Hildebrand wrote:
>> On 7/25/25 03:58, Roger Pau Monné wrote:
>>> On Thu, Jul 24, 2025 at 06:44:32PM +0200, Roger Pau Monné wrote:
>>>> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
>>>>> @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>>>>      return rc;
>>>>>  }
>>>>>  
>>>>> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
>>>>> +                                            uint16_t cmd, bool rom_only)
>>>>> +{
>>>>> +    struct vpci_map_task *task = xzalloc(struct vpci_map_task);
>>>>
>>>> xvzalloc() preferably.
>>>>
>>>> This however introduces run-time allocations as a result of guest
>>>> actions, which is not ideal IMO.  It would be preferable to do those
>>>> allocations as part of the header initialization, and re-use them.
>>>
>>> I've been thinking over this, as I've realized that while commenting
>>> on it, I didn't provide any alternatives.
>>>
>>> The usage of rangesets to figure out the regions to map is already not
>>> optimal, as adding/removing from a rangeset can lead to memory
>>> allocations.  It would be good if we could create rangesets with a
>>> pre-allocated number of ranges (iow: a pool of struct ranges), but
>>> that's for another patchset.  I think Jan already commented on this
>>> aspect long time ago.
>>
>> +1
>>
>>> I'm considering whether to allocate the deferred mapping structures
>>> per-vCPU instead of per-device.  That would for example mean moving
>>> the current vpci_bar->mem rangeset so it's allocated in vpci_vcpu
>>> struct instead.  The point would be to not have the rangesets per
>>> device (because there can be a lot of devices, specially for the
>>> hardware domain), but instead have those per-vCPU.  This should work
>>> because a vCPU can only queue a single vPCI operation, from a single
>>> device.
>>>
>>> It should then be possible to allocate the deferred mapping structures
>>> at vCPU creation.  I also ponder if we really need a linked list to
>>> queue them; AFAIK there can only ever be an unmapping and a mapping
>>> operation pending (so 2 operations at most).  Hence we could use a
>>> more "fixed" structure like an array.  For example in struct vpci_vcpu
>>> you could introduce a struct vpci_map_task task[2] field?
>>>
>>> Sorry, I know this is not a minor change to request.  It shouldn't
>>> change the overall logic much, but it would inevitably affect the
>>> code.  Let me know what you think.
>>
>> Thanks for the feedback and suggestion. Yeah, I'll give this a try.
>> Here's roughly what I'm thinking so far. I'll keep playing with it.
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 5241a1629eeb..942c9fe7d364 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -387,6 +387,16 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>>   */
>>  static int vcpu_teardown(struct vcpu *v)
>>  {
>> +#ifdef CONFIG_HAS_VPCI
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
>> +    {
>> +        struct vpci_map_task *task = &v->vpci.task[i];
>> +
>> +        for ( unsigned int j = 0; j < ARRAY_SIZE(task->bars); j++ )
>> +            rangeset_destroy(task->bars[j].mem);
> 
> You might want to additionally do:
> 
> task->bars[j].mem = NULL;

Should we perhaps introduce RANGESET_DESTROY() along the lines of XFREE() et al?

Jan

