Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85558C5906
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721663.1125274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uMB-0003YH-0V; Tue, 14 May 2024 15:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721663.1125274; Tue, 14 May 2024 15:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uMA-0003VK-To; Tue, 14 May 2024 15:46:22 +0000
Received: by outflank-mailman (input) for mailman id 721663;
 Tue, 14 May 2024 15:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gsOr=MR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s6uM9-0003TG-Nv
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:46:21 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ba3ac1b-1209-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:46:20 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-572e8028e0cso324142a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:46:20 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b014besm733507666b.161.2024.05.14.08.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 08:46:19 -0700 (PDT)
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
X-Inumbo-ID: 1ba3ac1b-1209-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715701579; x=1716306379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNs0PEvIyVMnqw5/1MDhjLmg7EgRSbvMronrwsuzX7g=;
        b=K7VbsCQu0j5Rhv81xGhBvfb0T1woMhftNmjtYTxn5v+iLKNJoqLSqClCzeQ2SHZh7J
         Y4iomtnLoxa5A5cfAa8Io5HDduXN+VmNmibT4+iB//Di30uGchaB2AZEMZRxO7yOmlhF
         KGoqCKf2C+BbG6w2lWGElwzW0uM/ZgZazXt5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701579; x=1716306379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNs0PEvIyVMnqw5/1MDhjLmg7EgRSbvMronrwsuzX7g=;
        b=N7lELOhLdgmG5xUY6oce+2MW3twGN5zijmv3KfzV9Hqq8SbapYqzAjcJ4brVW3F1XZ
         t6eFZ4Qw/6HDKSK3JfMH9HLHFVNHgJxgontcsDE22aywaRPR2LDKccnGc21j0emNhmaB
         tqKao3fJJFX4+TGsCADY85AqFbjYaqFds+lu3ksoptm4u0EHIyaatUZ2iZssoPVMsFon
         AO4PJvIypm/pzvWEXTIzYcrLgfapkM91L42SCCgppI7aIGzYN/NUH05ESAN7vGJ7kA8D
         LywE5iYWct6+op/CVS/Z4dhOAz6DrGz+8iInuJpZ0TUhSlI5Gygjbr38iEYZ40NYltzg
         jAZQ==
X-Gm-Message-State: AOJu0Yw8Ah/UPF6BbeoeNc+xaaEJywu6cmQmOWNLMe+h7jTXVWterDuY
	Kiv9kJ9y3Vp0DetFtYKOjmCKOrMWyZAsOqhm4sb9lPspL/Lq1Ofbht0lF2wYA3I=
X-Google-Smtp-Source: AGHT+IEBQ335cMZkyzoGqgaTiQq3j4uraHfDi/mnZSdqw33iKaFbSh2GRgTsy0OTrTHlHrK9OMZm/w==
X-Received: by 2002:a17:906:a203:b0:a59:a8a4:a59f with SMTP id a640c23a62f3a-a5a2d5d55e8mr666386266b.45.1715701579533;
        Tue, 14 May 2024 08:46:19 -0700 (PDT)
Message-ID: <ebdf9834-20f4-4779-8c33-4fb27d5f6d7f@cloud.com>
Date: Tue, 14 May 2024 16:46:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 01/19] x86: Create per-domain mapping of guest_root_pt
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
 <20240513111117.68828-2-eliasely@amazon.com> <ZkIxdtiDc_pnPWdx@macbook>
 <7998ecee-659d-4180-8b14-110c2907021f@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <7998ecee-659d-4180-8b14-110c2907021f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 09:03, Jan Beulich wrote:
> On 13.05.2024 17:27, Roger Pau Monné wrote:
>> On Mon, May 13, 2024 at 11:10:59AM +0000, Elias El Yandouzi wrote:
>>> @@ -317,6 +317,14 @@ extern unsigned long xen_phys_start;
>>>  #define ARG_XLAT_START(v)        \
>>>      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
>>>  
>>> +/* pv_root_pt mapping area. The fourth per-domain-mapping sub-area */
>>> +#define PV_ROOT_PT_MAPPING_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
>>> +#define PV_ROOT_PT_MAPPING_ENTRIES      MAX_VIRT_CPUS
>>> +
>>> +/* The address of a particular VCPU's PV_ROOT_PT */
>>> +#define PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v) \
>>> +    (PV_ROOT_PT_MAPPING_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
>>
>> I know we are not there yet, but I wonder if we need to start having
>> some non-shared per-cpu mapping area in the page-tables.  Right now
>> this is shared between all the vCPUs, as it's per-domain space
>> (instead of per-vCPU).
> 
> In turn requiring per-vCPU page tables, posing a problem when a guest
> uses the same page tables for multiple vCPU-s.
> 
> Jan
> 

True. Having separate page tables per CPU is an unavoidable end goal for
a hypervisor claiming to hold no secrets, however. Otherwise any CPU can
still speculatively read the stacks of other CPUs and take well-timed
glances over mappings set transiently by any other CPU.

Cheers,
Alejandro

