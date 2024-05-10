Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83668C2350
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 13:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719805.1122679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5OPf-0005Ty-6i; Fri, 10 May 2024 11:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719805.1122679; Fri, 10 May 2024 11:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5OPf-0005Rf-3r; Fri, 10 May 2024 11:27:43 +0000
Received: by outflank-mailman (input) for mailman id 719805;
 Fri, 10 May 2024 11:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5OPd-0005QZ-6c
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 11:27:41 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e966a06-0ec0-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 13:27:38 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so425129366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 04:27:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea651asm1706341a12.11.2024.05.10.04.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 04:27:38 -0700 (PDT)
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
X-Inumbo-ID: 4e966a06-0ec0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715340458; x=1715945258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNXwSOWeBMueOtABnUo69wqjco2rwqNtJ/nGjlKDC3g=;
        b=LYsY7xMpdOo5RJNnFRf67hMbFY8du/3v+bJKMGXsNT4OxZBRDdH1M14g5mDLizG6+3
         39bcWn4NUsoTBmUxBEy21XiZLiYownv6fh0SlL16+sbpJwWG97mtrZBTaI53nvlwxwMn
         m6oyuanbxq3q9K8D6NxrSviKF/k1JpP3sUa2Wy2SzvHbyNyR2H7Vcg0enofpxBneSejw
         paVeCU1rINFaJ+9RkNTRLBcRKjiS6cpXbKIhGvGaSkEI2O3K7PGnNO/2Ih1Wkm0UNzDg
         cQOhsn8A+K8dyVwn0tyn6ZpdgMVlc7xzRHfMym94/5EaN2XpIQuOLuiljo8ydmvLl/CR
         VPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715340458; x=1715945258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNXwSOWeBMueOtABnUo69wqjco2rwqNtJ/nGjlKDC3g=;
        b=nO1gpvTxEZXErCZroIAhcMMQgKt+SWJgfROpMXekP4hW5b9EHK0paa2vveMvka36LD
         SlMH8QIB+V6z1WAvllLSGkOE8sWIukFhPNDJvw9yMGSQJl7ZuQy2Vy2HlMRu6zXl3GfV
         G8lIrXqwnXTh6n40jsSNFouvmY1UgxgnraoSmOwKeEb4BV7APX9WH5fut+D6JrfoClh5
         +UA5cm1A0zomuhUjLt9iCh+nI750kxkxMAQeSvLaiPoos/vNrHy5oecKu+Uia8zYHzpm
         nx1dII+Me0954KvOzR11wp2YshJKRzX81SIY/y9YEfWLquIoUB0WK+D3Tz1RzH2mdLX2
         0LeA==
X-Forwarded-Encrypted: i=1; AJvYcCUMXGYvbHsC1zXLL3QCCGIDu+3nYmcaH3RI6u9oVxLDaMoF0ekAyDYGczHDkw5MoNcdad3nRgN8An8cBQ1Yr03mZElseJzWBZ1sTdOwLEQ=
X-Gm-Message-State: AOJu0YzgUEGMHZbUQUdkGasw7KnkE1OX27lCCNsVKJ1BB2QODkegec+j
	VtWSSEL/GmwdNV/JtxjtIoy07m2VAXJtEyRFhTBiCBKaCo5qJuSqEtmjsVDvnZ8=
X-Google-Smtp-Source: AGHT+IGWH9NtKldOHxG5Jn85QZLrAtp/ZGMY4ac6yPg5kx3Hs4lPh9R3ZW28bnofErwGNFhMNfHAYA==
X-Received: by 2002:a50:d583:0:b0:572:637b:c7e1 with SMTP id 4fb4d7f45d1cf-5734d5f48b1mr2421443a12.21.1715340458312;
        Fri, 10 May 2024 04:27:38 -0700 (PDT)
Message-ID: <0aac68ac-cf40-4c3d-ac02-95b9a37aaa11@suse.com>
Date: Fri, 10 May 2024 13:27:37 +0200
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
 <d0b5e7d5-3503-49be-9fa3-4b79c62059ca@suse.com>
 <BL1PR12MB5849F1DE8B4A3538C79CE5D3E7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <BL1PR12MB5849F1DE8B4A3538C79CE5D3E7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.05.24 12:32, Chen, Jiqian wrote:
> On 2024/5/10 18:21, Jürgen Groß wrote:
>> On 10.05.24 12:13, Chen, Jiqian wrote:
>>> On 2024/5/10 17:53, Jürgen Groß wrote:
>>>> On 10.05.24 11:06, Chen, Jiqian wrote:
>>>>> Hi,
>>>>>
>>>>> On 2024/5/10 14:46, Jürgen Groß wrote:
>>>>>> On 19.04.24 05:36, Jiqian Chen wrote:
>>>>>>> +
>>>>>>> +    info->type = IRQT_PIRQ;
>>>>> I am considering whether I need to use a new type(like IRQT_GSI) here to distinguish with IRQT_PIRQ, because function restore_pirqs will process all IRQT_PIRQ.
>>>>
>>>> restore_pirqs() already considers gsi == 0 to be not GSI related. Isn't this
>>>> enough?
>>> No, it is not enough.
>>> xen_pvh_add_gsi_irq_map adds the mapping of gsi and irq, but the value of gsi is not 0,
>>> once restore_pirqs is called, it will do PHYSDEVOP_map_pirq for that gsi, but in pvh dom0, we shouldn't do PHYSDEVOP_map_pirq.
>>
>> Okay, then add a new flag to info->u.pirq.flags for that purpose?
> I feel like adding "new flag to info->u.pirq.flags" is not as good as adding " new type to info->type".
> Because in restore_pirqs, it considers " info->type != IRQT_PIRQ", if adding " new flag to info->u.pirq.flags", we need to add a new condition in restore_pirqs.
> And actually this mapping(gsi and irq of pvh) doesn't have pirq, so it is not suitable to add to u.pirq.flags.

Does this mean there is no other IRQT_PIRQ related activity relevant for those
GSIs/IRQs? In that case I agree to add IRQT_GSI.


Juergen

