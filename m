Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC5ABBEAA
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989780.1373733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0G5-0000sB-Rs; Mon, 19 May 2025 13:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989780.1373733; Mon, 19 May 2025 13:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0G5-0000qf-P8; Mon, 19 May 2025 13:10:21 +0000
Received: by outflank-mailman (input) for mailman id 989780;
 Mon, 19 May 2025 13:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH0G4-0000qS-82
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:10:20 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d2e1fc3-34b2-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:10:19 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so121997266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:10:19 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04b04esm594557066b.15.2025.05.19.06.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:10:18 -0700 (PDT)
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
X-Inumbo-ID: 9d2e1fc3-34b2-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747660219; x=1748265019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ayqhd5jrPNv5RaTlTv6beSfG1Rz34BfzHh4Hy5uDJoQ=;
        b=BY1IInk1Itfn9L42e1DSy+Ghf4xn/1VyFOVva4Xz57xdoReE6lE8G1mmLP5iP8JQrl
         pKKUeXKQchndVHAoxVW9RwEF4kfXZrhMDGZjLTIWOdRuj6MERHLmV2Y6+pF+2DaDRH7m
         X0H01R0XsE3uEbPQTTrk2Xb1Kk95eB4W2YLeNzbqtmntuItmdhDriwzZkK0Ib/4Cvt3O
         ytX3mFgwJsP6KaQHjaKcptBvVTg3SFjt27UNSF8Z4SOiaHdeSSxLJQcpYe4TqTaqUVbR
         zbmvKV2ibhk24asWeh/FVGmTgfAJmKm8sU+A9KqsO8chV/e8UtL58p5bRUWyO27pDugG
         8D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660219; x=1748265019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayqhd5jrPNv5RaTlTv6beSfG1Rz34BfzHh4Hy5uDJoQ=;
        b=hNONtaLsgAE72L9JSRMz2KmzfrqT1YryZDQ7dWSJbbIrsgd086h3zHmQFdfMDiQKsK
         HUBehoMaw7EO04Zjpj4hj6DNbc961Xpg2oj3tiMxqb0FHbvTT4HzZ/jM1qpPg+gV3bD3
         LLL6d1mBVXJd1W1Ut1wuJxJ5hstJZgqkPdr2bo4FVOb/COVp1flf/2WuOK5gU6itEQkG
         tRswgblsSlydsfK+m7fbZJVccxCCgjUTM5GtTz7qvS8TAGGaegMK82suLDJG4RPkH3Rf
         eNdgN1/9bdR3BWzs30a9Cj8NqjZJteNV0b72wHQWmqum9ItYNeztCqQl8ejL1YJAnAGy
         JRng==
X-Forwarded-Encrypted: i=1; AJvYcCW/HEQgICS+9NvdLHcylWjqHinDjNNCRJZ5NW6OYKpug7qPXuVolr9rQ4ZSOG8tYd21JuGJ0+Ec6lI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgAZo4S7o97Ob9ays39j+4NQ27nZZXLyemLByWtkUEIM1PSYCm
	SO3qNR/x5q5+sYgiwvPCY7kG5HfksxBprTeqLdrWdt+m7OcU1qeAbuCBUwCa9VeKGw==
X-Gm-Gg: ASbGncuW+QoMGd/5O+oOSePklK3PpOa63AdIbN/q/5VgWK4ZFHvIkfTrPvQ9wynbBH0
	gL+Gzux7+pfwN1fS5ef7HXAmxQ7yodwiHzGtUYvBEjtmNxXs2LbOE/5N5BsJIJUnhpFWOVTsR8x
	Y8pxBYKRffVnykrOCX49PGeBH60xNc18i2/HKQKPUj00IKsWYeQYxGYImo2IcNw2M9XUGn325vy
	owrlQ02tBP6geUwmlC/w+zWRcLC5hOxbK6aP/jK408ih9cxwY9cziikU7EWxp/vpa8Yfub15aJO
	HUC4K8sH/tO1IRxj1W2Iwi9yTuOjoHdSXF6raVnX4eihnSlimQQ/ryi1QhyE4A==
X-Google-Smtp-Source: AGHT+IF0DDEuj/HXFM9+FtsbTn6+JQ0ivqtmxeEOSkE8rykqCrPwSXZX4rofrkzZaNLSHUfpNSTO1Q==
X-Received: by 2002:a17:907:7f13:b0:ace:8003:6a6 with SMTP id a640c23a62f3a-ad52d441ff2mr1206454066b.6.1747660219003;
        Mon, 19 May 2025 06:10:19 -0700 (PDT)
Message-ID: <20d48f86-d7fe-47c8-89ab-61d816e1d6e9@suse.com>
Date: Mon, 19 May 2025 15:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
 <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 09:13, Chen, Jiqian wrote:
> On 2025/5/19 14:56, Jan Beulich wrote:
>> On 19.05.2025 08:43, Chen, Jiqian wrote:
>>> On 2025/5/18 22:20, Jan Beulich wrote:
>>>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>>>> @@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>>>                                                   PCI_STATUS_RSVDZ_MASK);
>>>>>  }
>>>>>  
>>>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>>>>> +{
>>>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
>>>>
>>>> The ttl value exists (in the function you took it from) to make sure
>>>> the loop below eventually ends. That is, to be able to kind of
>>>> gracefully deal with loops in the linked list. Such loops, however,
>>>> would ...
>>>>
>>>>> +    if ( !is_hardware_domain(pdev->domain) )
>>>>> +        /* Extended capabilities read as zero, write ignore for guest */
>>>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>>>> +                                 pos, 4, (void *)0);
>>>>> +
>>>>> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
>>>>> +    {
>>>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>>>>> +        int rc;
>>>>> +
>>>>> +        if ( !header )
>>>>> +            return 0;
>>>>> +
>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
>>>>> +                               pos, 4, (void *)(uintptr_t)header);
>>>>
>>>> ... mean we may invoke this twice for the same capability. Such
>>>> a secondary invocation would fail with -EEXIST, causing device init
>>>> to fail altogether. Which is kind of against our aim of exposing
>>>> (in a controlled manner) as much of the PCI hardware as possible.
>>> May I know what situation that can make this twice for one capability when initialization?
>>> Does hardware capability list have a cycle?
>>
>> Any of this is to work around flawed hardware, I suppose.
>>
>>>> Imo we ought to be using a bitmap to detect the situation earlier
>>>> and hence to be able to avoid redundant register addition. Thoughts?
>>> Can we just let it go forward and continue to add register for next capability when rc == -EXIST, instead of returning error ?
>>
>> Possible, but feels wrong.
> How about when EXIST, setting the next bits of previous extended capability to be zero and return 0? Then we break the cycle.

Hmm. Again an option, yet again I'm not certain. But that's perhaps just
me, and Roger may be fine with it. IOW we might as well start out this way,
and adjust if (ever) an issue with a real device is found.

Jan

