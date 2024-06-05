Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4198C8FC8D7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 12:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735684.1141796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnkn-00011i-Eq; Wed, 05 Jun 2024 10:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735684.1141796; Wed, 05 Jun 2024 10:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnkn-0000yr-Bd; Wed, 05 Jun 2024 10:20:25 +0000
Received: by outflank-mailman (input) for mailman id 735684;
 Wed, 05 Jun 2024 10:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEna9-0004Rp-3i
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 10:09:25 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae947686-2323-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 12:09:23 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e73359b900so22039741fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 03:09:23 -0700 (PDT)
Received: from [172.20.145.98] ([62.28.225.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158135ea8sm15159045e9.37.2024.06.05.03.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 03:09:22 -0700 (PDT)
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
X-Inumbo-ID: ae947686-2323-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717582163; x=1718186963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5UPimmpxwpsZkIT4ao8qllIcnVD0IaMRYQnvqfZOS8=;
        b=U3ickssd4pQ++aGdG3s+47I26cfA/bxC3RPhuUqpCKsWGO4GFZhWg8SAU+WDGgvBYG
         km1hYsp5i1EJn8chZeNvJpoOU0PRghkQc3x8f19SaXRs8ssUU+5AMkglg1PoYE4x1c6d
         cKeMeXfZ0dTBpa8uanFcsWZ5m+kysdyqdYPH263MnAnvvdAhqV/QI+hMZt6/kX+SgT2H
         K9rgM5zUxqjH/X34+t9RxxWku15XEyaIjUsqXPrL0JIiFh66ouE1GsNnaCVx7B1C6ozW
         8zLZAatRaOOVohD59jpPc//Z5JOGNkeOxziQctJO6z+9QxIgQfT8g40PX4WsmXGNcnK6
         3Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717582163; x=1718186963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5UPimmpxwpsZkIT4ao8qllIcnVD0IaMRYQnvqfZOS8=;
        b=oTXzyosRzoA+wWwlnUQg6MHGWhF9uqv7+bF2PqVjx6T5MaNhEH65oqMtT0wxXue4g3
         gelTmXkC63lkZkk70u7JZge5HTCw2KoKV0/84RpciLKigSexTo4VyfIYN79/0XIvjtaD
         JqsGJ6F04c77fJqF0ZI7GwSt6rDNDw0An9Vrki1s8M9WYZcydOq6oFuE1+l0AEzsl/9q
         mMG7zf8gV00Y6O61YXu46jwclnw0Rm8A4k+omHiKDi1ZOIlZ6sM2k5VjlIRhqndeW/Kr
         187NiExfH4QvxwG9bpvb+7CmFNmI5oI10PVYFUslTiYkqqdHsIcYMZSUxvZnrQd9fti5
         TGXg==
X-Forwarded-Encrypted: i=1; AJvYcCWOHWJet82EF3n/d0M7jK6PSATFqrgUs3B8ZuBQHORtTvfsOTz2HJQsTvD/u8mLam4BSnbVtJ5iI9tZtwljcgeQiWE+EDbl6o1ak/qlKfY=
X-Gm-Message-State: AOJu0Yxn2SzmnLmOs66bAkT/9gPxDdqJ+rGCyvbAqojo0GifZoV0OOz7
	0S57o2rK+rbO1L9G5HK3O2zSWfhlt+uobGbY7b5FPGB+tzRC5wYKzqKNyMxmHw==
X-Google-Smtp-Source: AGHT+IF2I24LdiAwrUT/tnr0839W27jnocjwEL5t/u0Vhvhc5Ve1GcUrrcNKmx90wJpwC/NsZ1Q4vg==
X-Received: by 2002:a2e:2c06:0:b0:2ea:bc8d:3a43 with SMTP id 38308e7fff4ca-2eac7aace3bmr10438941fa.43.1717582162641;
        Wed, 05 Jun 2024 03:09:22 -0700 (PDT)
Message-ID: <6d2e49bf-7be2-48f1-8075-dc0626015c17@suse.com>
Date: Wed, 5 Jun 2024 12:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
 <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <46b884e2-cbec-46f0-9070-7013307a310f@suse.com>
 <BL1PR12MB5849C1D40FCF9861BFE7B208E7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB5849C1D40FCF9861BFE7B208E7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2024 09:04, Chen, Jiqian wrote:
> On 2024/6/5 01:17, Jan Beulich wrote:
>> On 04.06.2024 10:18, Chen, Jiqian wrote:
>>> I tried to get more debug information from my environment. And I attach them here, maybe you can find some problems.
>>> acpi_parse_madt_ioapic_entries
>>> 	acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE, acpi_parse_int_src_ovr, MAX_IRQ_SOURCES);
>>> 		acpi_parse_int_src_ovr
>>> 			mp_override_legacy_irq
>>> 				only process two entries, irq 0 gsi 2 and irq 9 gsi 9
>>> There are only two entries whose type is ACPI_MADT_TYPE_INTERRUPT_OVERRIDE in MADT table. Is it normal?
>>
>> Yes, that's what you'd typically see (or just one such entry).
> Ok, let me conclude that acpi_parse_int_src_ovr get two entries from MADT table and add them into mp_irqs. They are [irq, gsi][0, 2] and [irq, gsi][9, 9].
> Then in the following function mp_config_acpi_legacy_irqs initializes the 1:1 mapping of irq and gsi [0~15 except 2 and 9], and add them into mp_irqs.
> But for high GSIs(>= 16), no mapping processing.
> Right?

On that specific system of yours - yes. In the general case high GSIs
may have entries, too.

> Is it that the Xen hypervisor lacks some handling of high GSIs?

I don't think so. Unless you can point out something?

> For now, if hypervisor gets a high GSIs, it can't be transformed to irq, because there is no mapping between them.

No, in the absence of a source override (note the word "override") the
default identity mapping applies.

Jan

