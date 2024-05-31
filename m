Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B18D5CAB
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733441.1139692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxau-0003LM-5K; Fri, 31 May 2024 08:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733441.1139692; Fri, 31 May 2024 08:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxau-0003IV-20; Fri, 31 May 2024 08:26:36 +0000
Received: by outflank-mailman (input) for mailman id 733441;
 Fri, 31 May 2024 08:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcd8=NC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCxar-0003IP-SQ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:26:33 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba7a1cb-1f27-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 10:26:31 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-dfa7ab78ef2so214450276.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 01:26:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794f317073fsm42967785a.112.2024.05.31.01.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 01:26:30 -0700 (PDT)
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
X-Inumbo-ID: 7ba7a1cb-1f27-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717143990; x=1717748790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1a1ryheQen9WxY4LMMuEhi4hk6Cgc8e7s9lJfWj8R7w=;
        b=pXIXmEswpStYk95hwrp27gvsB+h75t2TdW86+8WqLuFiq6qCMRMygcX46qjjvlFAFW
         JtKeZRO1XCTzqWRs1FHeoJ5ujrMPEK8LOX1TBGn9G++zhq887JMK9+4pjTMeUhe1h17H
         XbdIKB4g3iuyRHhWctXGhfIkUepmkpa8Bz+Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717143990; x=1717748790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a1ryheQen9WxY4LMMuEhi4hk6Cgc8e7s9lJfWj8R7w=;
        b=BrpLdx+DMxGDSU/u4wM+H5g2/n8BoZSlx7hPStQ3cVMiyzjJK6xHgAtCdFYIu0cNhR
         Nf6hwF598DDSxktrwRjei7Us9XNWj9/0PeoXciT8jzMj0xvTe1+E8a6LSG0RFcH9hmLS
         ZUQ36OKpzxMOHfI0K9/46YvSi3gXq8so1+AhmnEARoQGlYSLVJePdP+NxY51A35s8dvp
         6Mj0kRWOUFCnrLdaOwORydxEV6OkoA6LOqE3QalNe6WOpYEMaxcPetXJkoEm18fen9nQ
         KcMBrhM2o9fL6KirOSOIN2RiRC4l6XhVhAjRhcr9VkIWULfcgjMkmQNGHOCviySvSKVc
         TN5w==
X-Forwarded-Encrypted: i=1; AJvYcCXatPyHk1ASxbDvWng6kEGzdCNL1jlLOhclxM6gHRS/Szu1D05SZNd2T7DzM03J3cRWRgwVpa1D4gU6sTe2HGBvQYsxYn8xmWWaCQHvXM4=
X-Gm-Message-State: AOJu0Yw2U28XfMJevj5zary8WN+dcI/MRX9cIEf+POhPgY/3itf6FOcS
	G1S10zi7pITAahrd6vXJnXquTwKRqrhXmPRUshvT+yvWeGFMuLpQEq2URLZ6u3U=
X-Google-Smtp-Source: AGHT+IGpZvp+kzq6US03HRa3BV/hi+1y6p2t+X4cxz9RWf29hfY2+yaYgUWi+NLHAbBgTSDp+h9KOg==
X-Received: by 2002:a25:874e:0:b0:dcd:d94:3db5 with SMTP id 3f1490d57ef6-dfa73dbaf9fmr1212168276.52.1717143990510;
        Fri, 31 May 2024 01:26:30 -0700 (PDT)
Message-ID: <732f5239-c45e-4439-b28a-265e43d46faa@citrix.com>
Date: Fri, 31 May 2024 09:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arch/irq: Make irq_ack_none() mandatory
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
 <20240530184027.44609-2-andrew.cooper3@citrix.com>
 <e5741eb1-1708-463f-8b3a-2d34d6fd4fbc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e5741eb1-1708-463f-8b3a-2d34d6fd4fbc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 7:42 am, Jan Beulich wrote:
> On 30.05.2024 20:40, Andrew Cooper wrote:
>> Any non-stub implementation of these is going to have to do something here.
> For whatever definition of "something", seeing ...
>
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -31,12 +31,12 @@ struct irq_guest
>>      unsigned int virq;
>>  };
>>  
>> -static void ack_none(struct irq_desc *irq)
>> +void irq_ack_none(struct irq_desc *irq)
>>  {
>>      printk("unexpected IRQ trap at irq %02x\n", irq->irq);
>>  }
> ... this, which - perhaps apart from the word "trap" - is entirely Arm-
> independent, and could hence quite well live in a common code fallback
> implementation.

Not really.

On ARM, ack()+end() are both mandatory and it's end() which is taking
the useful action.

On x86, ack() has the effect and end() is optional (and has a different
prototype even!)


>  Nevertheless with patch 2 clearly being an improvement,
> both patches:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

