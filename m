Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8118D3D09
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 18:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732253.1138173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMO8-0000eZ-Qj; Wed, 29 May 2024 16:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732253.1138173; Wed, 29 May 2024 16:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMO8-0000cD-Nr; Wed, 29 May 2024 16:42:56 +0000
Received: by outflank-mailman (input) for mailman id 732253;
 Wed, 29 May 2024 16:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCMO7-0000c7-28
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 16:42:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ecea0d3-1dda-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 18:42:54 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45cso2634434a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 09:42:54 -0700 (PDT)
Received: from [10.80.5.21] ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda8bb3sm732696066b.223.2024.05.29.09.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 09:42:52 -0700 (PDT)
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
X-Inumbo-ID: 7ecea0d3-1dda-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717000973; x=1717605773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6EOVyZktDMpdICGYNJ8jso8s2pDMedSOIV5YlgQ6wo=;
        b=diglAESMqX6hjjPE72ag6ZtmK+ETDGFL870EaxLnS3vkTtXss0t/T5GuxmbU/frEjm
         RKNytV1nC/83krnYXGDNPZjgd2iAYR1ubL07nWMfKpwFWIYUIb0cFY4jd7/qITVfuvZb
         NWokXvJs+0ciJxcF/kRsi1H0A7NmEyaDInIYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000973; x=1717605773;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6EOVyZktDMpdICGYNJ8jso8s2pDMedSOIV5YlgQ6wo=;
        b=IR4SexDsjIFPYMUUx7sK3ccaUewNYXgpNKv9cN6MdoRqosLyPW2PzMLNmrJkl9px3T
         amN0xotEZmJnT0Aam9nkpD6PK+kK3AuG7saR9WZnK5ThyzmJdBtCcbRIFSAHXJnwOBAj
         OIGbablSP++h2M5yfmbReIHsth8W9XOPMKeFWxRERJbN9/K6+lmVWgU4CpoO5ilXGzqM
         EJgFcryc7CL8wkoMktoV9ku2hE1JXZIcnkvJkmf5acam3hjagWDp6SmaWS5VK7VU1dPG
         wSOA9bmQ6cNImaYA8CX3KZoUr0qE8lcbJ8FwYpYaTDnwxyeG9579yUXB1c25fBuDjrvP
         HgSQ==
X-Gm-Message-State: AOJu0YxHglS//AwtOIGEq40tV8veaLmP2s6rB9Dvi8AhpnEH8cr8e+Fw
	urTVDg7C/HNNOBOssErz9m2RraH71/Kk+kW9IxaUtD39mjlT78n6U2XfpB+uWpybdekDQmYJpgt
	fbvE=
X-Google-Smtp-Source: AGHT+IGoopiv/+wn4+20sMzy2oHAxCrF8jnOmo/8eJfLfajmg8UQILBgV4jERa9VaSSjayqzyy1QuQ==
X-Received: by 2002:a17:906:5a83:b0:a5a:1579:9033 with SMTP id a640c23a62f3a-a62641aa499mr950499966b.1.1717000973201;
        Wed, 29 May 2024 09:42:53 -0700 (PDT)
Message-ID: <f2eab8cc-e434-4a51-aee3-9e8344ffd4f8@cloud.com>
Date: Wed, 29 May 2024 17:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony@xenproject.org>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <eb7438639cc4755d3c959029d809451ee000ccbc.1716976271.git.alejandro.vallejo@cloud.com>
 <e554d88d-2164-4dde-9083-8e8db5a2712f@cloud.com>
Content-Language: en-GB
In-Reply-To: <e554d88d-2164-4dde-9083-8e8db5a2712f@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2024 17:16, Alejandro Vallejo wrote:
> On 29/05/2024 15:32, Alejandro Vallejo wrote:
>> +static uint32_t read_apic_id(void)
>> +{
>> +    uint32_t apic_id;
>> +
>> +    if ( has_x2apic )
>> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
>> +    else
>> +    {
>> +        cpuid(1, NULL, &apic_id, NULL, NULL);
>> +        apic_id >>= 24;
>> +    }
>> +
>> +    /* Never called by cpu0, so should never return 0 */
>> +    ASSERT(!apic_id);
> 
> Bah! Typo. That's meant to be ASSERT(apic_id).
> 
> Cheers,
> Alejandro

And something else is broke, because I can't boot HVM guests anymore.
Thought we had HVM tests in gitlab, but apparently we don't.

https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1309033234

Closest I see is booting alpine, but that's a 1-vCPU PV case, which
wouldn't expose this.

I'll resend the series after weeding out the bugs.

Cheers,
Alejandro

