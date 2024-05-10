Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5117C8C21F9
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719671.1122521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NNu-0006Y5-1r; Fri, 10 May 2024 10:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719671.1122521; Fri, 10 May 2024 10:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NNt-0006WY-VR; Fri, 10 May 2024 10:21:49 +0000
Received: by outflank-mailman (input) for mailman id 719671;
 Fri, 10 May 2024 10:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5NNs-0006WS-BA
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:21:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b03186c-0eb7-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 12:21:47 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso521845466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:21:47 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d342sm168537766b.6.2024.05.10.03.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 03:21:45 -0700 (PDT)
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
X-Inumbo-ID: 1b03186c-0eb7-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715336506; x=1715941306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gB3+mueVJC6rTSgQyDulrWqT4OQyPBK4CkJ9nqNOnDg=;
        b=ZqV+DatO0NVL4iTgcFtyb8OHCm8NseP1ZdFl+xC5+S1ZsCZsfe9n2s3K5hDVCLY2dN
         w0/BEoILo1Cxv3I4ErqCAp8bWwV5CU3jPxSX5BXzt0ZaRQPTQMdOEdaRDXVYNuMLnEby
         KyofvvNUgcBldppshgk+hXaNmGIzJp2a3BYm7YjyqWppwapqy0Z1KVX2SPDw0ypbiItv
         wCQMWm0zOHIk+M2RbM1a694FdbpWyqCy6cnLpS1FQLOtRpjKQkzLlBr7JAvkFuhbOX9V
         cPCMZFld8Yzpu4g3G6nw+LHhXEGPgCO6jjyp/A84qe7jJBTfsCgJRs2jCYp455YGhuC5
         egSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715336506; x=1715941306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gB3+mueVJC6rTSgQyDulrWqT4OQyPBK4CkJ9nqNOnDg=;
        b=pvbBw4Iz7AZ1RPMc5sLgZT5GefSp0uqJ/wBpDA3C0AnI+GX9mUD5V6dyx2b6trMabR
         C5IA9rERsU0n1Ym82HWqkdy8skjK1B/dQr+bKAAJxX9vKUjStvWpYQVJcv7zI2r3rh69
         codce9oka077nDycfGThG8KOYZrJvlBGT7OtJRAQUP30t5c+HjRBN8+FTJP4A5VE0b/1
         GKhiGC90SPKzlBLMElEDMYWSJ0aE8J78TarucqjEM1ujVOKt4dKihg4JmbXbuPmZ/i+w
         BNzhj2wmMMejDAN8LdPWznOPzYZBR0+lATdriqPR9hi/ZdYcyiVU4UDg2zNTODnPbzQB
         ZDgg==
X-Forwarded-Encrypted: i=1; AJvYcCUkqeazVFndQTf0QY2CnVDJiUh15anydoh5YF30E5n3dMGlkKfUd6fo55WgkgS0KUgIoBPGz6/N2XQ4caBEZo1CO/U3YvmsRmUoYz4R/hc=
X-Gm-Message-State: AOJu0YzCwwi4gNcS02NhbSVa81I01IdShtbosZXgpZBah+5jMwDv8CAr
	1eu/VbOdT+TE0ZGy1dk1NTt95Xmn05rkeG3PKwcdVGlryBVDIt4McSbGIKJr6xU=
X-Google-Smtp-Source: AGHT+IGm0ShzWqxUTz6WdBSaEzgp1Qnpb/3O6/pweXuPBaR9LwjAUlSsib161KD3DVm9rCH0vGd4qA==
X-Received: by 2002:a17:906:cc84:b0:a59:c28a:d350 with SMTP id a640c23a62f3a-a5a2d55ab1fmr161431566b.24.1715336506363;
        Fri, 10 May 2024 03:21:46 -0700 (PDT)
Message-ID: <d0b5e7d5-3503-49be-9fa3-4b79c62059ca@suse.com>
Date: Fri, 10 May 2024 12:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v6 3/3] xen/privcmd: Add new syscall to get gsi
 from irq
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20240419033616.607889-1-Jiqian.Chen@amd.com>
 <20240419033616.607889-4-Jiqian.Chen@amd.com>
 <79666084-fc2f-4637-8f0b-3846285601b8@suse.com>
 <BL1PR12MB58493D17E23751A06FC931DDE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c30ebad2-1ad3-4b58-afaf-e6dc32c091fc@suse.com>
 <BL1PR12MB58491D2210091DF9607A354AE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <BL1PR12MB58491D2210091DF9607A354AE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.05.24 12:13, Chen, Jiqian wrote:
> On 2024/5/10 17:53, Jürgen Groß wrote:
>> On 10.05.24 11:06, Chen, Jiqian wrote:
>>> Hi,
>>>
>>> On 2024/5/10 14:46, Jürgen Groß wrote:
>>>> On 19.04.24 05:36, Jiqian Chen wrote:
>>>>> +
>>>>> +    info->type = IRQT_PIRQ;
>>> I am considering whether I need to use a new type(like IRQT_GSI) here to distinguish with IRQT_PIRQ, because function restore_pirqs will process all IRQT_PIRQ.
>>
>> restore_pirqs() already considers gsi == 0 to be not GSI related. Isn't this
>> enough?
> No, it is not enough.
> xen_pvh_add_gsi_irq_map adds the mapping of gsi and irq, but the value of gsi is not 0,
> once restore_pirqs is called, it will do PHYSDEVOP_map_pirq for that gsi, but in pvh dom0, we shouldn't do PHYSDEVOP_map_pirq.

Okay, then add a new flag to info->u.pirq.flags for that purpose?


Juergen


