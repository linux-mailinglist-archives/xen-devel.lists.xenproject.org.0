Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688869442F9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 08:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769309.1180189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZOrq-0006Iq-Ne; Thu, 01 Aug 2024 06:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769309.1180189; Thu, 01 Aug 2024 06:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZOrq-0006G0-KG; Thu, 01 Aug 2024 06:00:50 +0000
Received: by outflank-mailman (input) for mailman id 769309;
 Thu, 01 Aug 2024 06:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZOro-0006Dt-LN
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 06:00:48 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64a2343f-4fcb-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 08:00:46 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so7271767a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 23:00:45 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac60918cb4sm9636299a12.0.2024.07.31.23.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 23:00:44 -0700 (PDT)
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
X-Inumbo-ID: 64a2343f-4fcb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722492045; x=1723096845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vvTX8VhEq4feevTSvTB8g//YBud7BwtG5v2vu7g40Io=;
        b=GtIAbDJQKdhh0sahz9ub5ad5KX+SIfBW9G4Kpy5DMlgVyYzfMPqNZqnOpwUVdlqzQ/
         NeE6namTKLnwo6CH2Q/5XjHoc5tbDo88YrrOU8zGqVWjR5L5GazCuYeIvSMRUdiksVLV
         cXgVPktNbNXZAHBaTbl3CmuigYjthfnUfi4rcLw9RfsZI51MFiVuUpBcj9Xuifo4Kyn9
         p3SeR9q5hQgMv04bK/ql+ORnCf3YfVYI4cakXQFZklYiUTOs23PuZj3TEoLotaIEj/zg
         YsWBB1VgoMpanRVB9xnOOT+vM9jp4jOqYVYsKuHwnsgZ19NvvX/7LZkk0NnP39fZvP+f
         iiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722492045; x=1723096845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvTX8VhEq4feevTSvTB8g//YBud7BwtG5v2vu7g40Io=;
        b=vVzAy95fRZJ6iTD3EwkEVQ27PgbJAfmuaZd3M+6mUn0QlYbxsTA+KAUB5sv0kTaHBd
         zEdhsNBUS6C8m0uFyN7lhmDMUNwR8dt2lG8mcW7vXtOqmfNsSt7Q80EfOzAHo1RmpWM6
         Cxjz+HRDqDIyhoYFF1HuKfeuOok+rlBGCvBc10Hpm2ssn7TNbwIWK3i9yf9YlqYV57JJ
         JqkPlM0JZLVNldmKP21Rflwwa4gNsv7/tDqRjfNq+vutpHUNKo+ltmEudBF65jWjux1s
         NJzhBy9EYBjsMvUFdGkgiCpvBEb4CMACP5cwtpQW+BiEVAzlWVt171T0pgtId3uIoDIy
         YIFw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6A2b1IlJBhe/6ne1kev8YkssLPk99CS7RbPazfNn3wTUhlwkMZbzfqP3UUfRxYsHaXAq0QbtvN/SNuBuKd5ukv9WYCVrmyIptqVNw3Q=
X-Gm-Message-State: AOJu0Yw25JdL2YeLTyt4cUC/DdBp9M4nH7jHcAPTXdsGYmBttzLObGAr
	aokrBk3M/wndB+9YYvnva4SPJso+dchwENCA6JaHeoVTK7hRd/PISAe5GRjsTR464sZBf4LO13+
	3
X-Google-Smtp-Source: AGHT+IFBvByQIrctF48vEyZvzdM+5pDXUsKXcjTd/gZ9ux65PZ4OHAQjLcEoqN6TJswW0q+lJe47hg==
X-Received: by 2002:a05:6402:5147:b0:59e:6b89:fdad with SMTP id 4fb4d7f45d1cf-5b6fe72135amr726306a12.3.1722492045054;
        Wed, 31 Jul 2024 23:00:45 -0700 (PDT)
Message-ID: <3f353d9d-2306-4a62-9a6f-8aa787bf33aa@suse.com>
Date: Thu, 1 Aug 2024 08:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mini-os: mm: convert set_readonly() to use walk_pt()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-4-jgross@suse.com>
 <20240731213753.hduimhyf56bf7yr4@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240731213753.hduimhyf56bf7yr4@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.24 23:37, Samuel Thibault wrote:
> Juergen Gross, le mer. 31 juil. 2024 15:00:26 +0200, a ecrit:
>> +static int set_readonly_func(unsigned long va, unsigned int lvl, bool is_leaf,
>> +                             pgentry_t *pte, void *par)
>> +{
>> +    struct set_readonly_par *ro = par;
>>   
>> +    mmu_updates[ro->count].ptr = virt_to_mach(pte);
>> +    mmu_updates[ro->count].val = *pte & ~_PAGE_RW;
>> +    ro->count++;
>> +
>> +    if ( (ro->count == L1_PAGETABLE_ENTRIES ||
>> +          va + 2 * PAGE_SIZE > ro->etext) &&
>> +         HYPERVISOR_mmu_update(mmu_updates, ro->count, NULL, DOMID_SELF) < 0 )
>> +    {
>> +        printk("ERROR: set_readonly(): PTE could not be updated\n");
>> +        do_exit();
>> +    }
> 
> Don't we also want to set ro->count to 0?

Oh, indeed. Thanks for catching this.

> And assert that it is 0 after calling walk_pt in set_readonly, to make
> sure the va + 2 * PAGE_SIZE > ro->etext test did work properly
> (personally I would have rather made set_readonly call a last
> HYPERVISOR_mmu_update in case ro->count is not 0, which looks more
> robust that a quite magic-looking va + 2 * PAGE_SIZE > ro->etext test)

I think you are right. I'll do that.


Juergen

