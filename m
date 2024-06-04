Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF18FAAEF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735181.1141360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENmY-00066O-Fb; Tue, 04 Jun 2024 06:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735181.1141360; Tue, 04 Jun 2024 06:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENmY-00064U-Br; Tue, 04 Jun 2024 06:36:30 +0000
Received: by outflank-mailman (input) for mailman id 735181;
 Tue, 04 Jun 2024 06:36:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENmX-00063C-20
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:36:29 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c52dba97-223c-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 08:36:27 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b7c82e39eso5124102e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:36:27 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42127062f0dsm170538585e9.17.2024.06.03.23.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:36:26 -0700 (PDT)
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
X-Inumbo-ID: c52dba97-223c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717482987; x=1718087787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X18d/0Y4e+ykx5+NEnjOpDtIFp4gRnNSoUya/BnES+8=;
        b=RNC+1beu9JRgZipHszXRySHQ+Fxa2YvPCfZ2XD/xGSHE2SKI/JujgW4aqmavyPEUzh
         pS4YL5Y+FdwsDzi97sNO5LUZ/jH01J7FB+fegTKGWNIlOYzHp3eFBTheYJ9Q+srSC8Gt
         zLNM3/+ZzTTDFNrHChzmzgYd4BLRT/zWCYnKVFh16nW7UTbpLTqiIzQP9jmgwsH6gjwq
         kyTd1EkqcmUUF4Ihvp4A3evQXqj/MZzbX7SFPLlnXK+5BnvZIY6313K2BANIyGPNXmhy
         zOJfKQX3wYMbjIsf7HFZvWNT0rX2lA/g73CGPTPrEqvJzsXmk8chNW0tFXVJiGAb3DiV
         adtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717482987; x=1718087787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X18d/0Y4e+ykx5+NEnjOpDtIFp4gRnNSoUya/BnES+8=;
        b=michPdeHeYV3OP2wx/oO5WTYzwCzwFPsYbxze32B9yWlxdtKTtbd607MEONJs0fEKM
         4fVtkFs0t/M1p7TSv53BwEOXjuMh9rRzPgQcTGyUFzE4+kMHEC64UExRdSctOYzpsjGG
         V4r08QcrArlP7hiexuEwvEAZqNIzCwlB+sXt83AvFvq9u6ucP1TnCv+dvu2cXe910poU
         Lc1RS7jwcP8Y/LghjIvpRs/+66UZWnUNALstDgyuhnWU7czBTKgPdNKEAf5sEuSSTL4Q
         npJwtucxNt6fP/WlhSwVkZNvvWHH5uSYhMG7zvqFoS5a6tum608Y8E8UCLbD3GaCjXPf
         4RHg==
X-Forwarded-Encrypted: i=1; AJvYcCXaRqEhuH3sgSo2OFd6lOJitKBWyd24iOSgo2aZb4Fj/kooGFhQCCX5e8mUDYhVAdZtAbr9Lvs67NUP7oRspAx54QDhhmYkd0MXIrWDorM=
X-Gm-Message-State: AOJu0YyFcr54ftkfNoVLuooQCa/EY+dR8tNl0WavlBr5C+AlCPSJ5RZZ
	Urt6OI2Zt6nDCkO2c7HwU+y7YVryTcg17jB87adYoqR0xg6ishsU+s/HJT7L+w==
X-Google-Smtp-Source: AGHT+IFc5u5GrKWll3QirFv1CrGhm9LcyqDhgI75tnBhTlJzXE9KYLmJwsO1i6fCyfLRLC/PEkkufQ==
X-Received: by 2002:a05:6512:3995:b0:52b:9a99:9201 with SMTP id 2adb3069b0e04-52b9a99925cmr4943578e87.58.1717482986804;
        Mon, 03 Jun 2024 23:36:26 -0700 (PDT)
Message-ID: <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
Date: Tue, 4 Jun 2024 08:36:24 +0200
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
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 08:33, Chen, Jiqian wrote:
> On 2024/6/4 14:12, Jan Beulich wrote:
>> On 04.06.2024 08:01, Chen, Jiqian wrote:
>>> On 2024/6/4 13:55, Jan Beulich wrote:
>>>> On 04.06.2024 05:04, Chen, Jiqian wrote:
>>>>> On 2024/5/30 23:51, Jan Beulich wrote:
>>>>>> On 30.05.2024 13:19, Chen, Jiqian wrote:
>>>>>>> It seems only Legacy irq and gsi[0:15] has a mapping in mp_irqs.
>>>>>>> Other gsi can be considered 1:1 mapping with irq? Or are there other places reflect the mapping between irq and gsi?
>>>>>>
>>>>>> It may be uncommon to have overrides for higher GSIs, but I don't think ACPI
>>>>>> disallows that.
>>>>> Do you suggest me to add overrides for higher GSIs into array mp_irqs?
>>>>
>>>> Why "add"? That's what mp_override_legacy_irq() already does, isn't it?
>>> No. mp_override_legacy_irq only overrides for gsi < 16, but not for gsi >= 16(I dump all mappings from array mp_irqs).
>>
>> I assume you mean you observe so ...
> No, after starting xen pvh dom0, I dump all entries from mp_irqs.

IOW really your answer is "yes" ...

>>> In my environment, gsi of my dGPU is 24.
>>
>> ... on one specific system?

... to this question I raised. Whatever you dump on any number of
systems, there's always the chance that there's another system
where things are different.

>> The function is invoked from
>> acpi_parse_int_src_ovr(), and I can't spot any restriction to
>> IRQs less than 16 there.
> I didn't see any restriction too, but from the dump results, there are only 16 entries, see previous email. 

Hence why I tried to point out that going from observations on a
particular system isn't enough.

Jan

