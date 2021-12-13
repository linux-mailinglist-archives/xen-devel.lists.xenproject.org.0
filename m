Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D3472BA5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 12:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245991.424325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjfC-0006Uc-Ke; Mon, 13 Dec 2021 11:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245991.424325; Mon, 13 Dec 2021 11:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjfC-0006Sq-HY; Mon, 13 Dec 2021 11:38:38 +0000
Received: by outflank-mailman (input) for mailman id 245991;
 Mon, 13 Dec 2021 11:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EN0M=Q6=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mwjfA-0006Dq-T2
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 11:38:36 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c19d5f-5c09-11ec-b1ef-a74572bcbcad;
 Mon, 13 Dec 2021 12:38:35 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id k23so23292459lje.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Dec 2021 03:38:33 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f23sm1475635ljg.90.2021.12.13.03.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 03:38:32 -0800 (PST)
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
X-Inumbo-ID: 33c19d5f-5c09-11ec-b1ef-a74572bcbcad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sXvHapjS93NaUhHhbE5XKq63oc/+VGXWe8vklnnWKOw=;
        b=ma0UjKKQZNxqT0R1RFKcxJmF7lzJwRJ2/pJMWBUdbs5yTKFTMiQX0WXiDpDTCqyP79
         MO8gShyIYtdiBa0xSxddJg8JbvBd9vsbMt6ZowpOtfIafF5ysCWjPeNNhywZOKCCQwi4
         gYJVN3tGSQEdQ6FS+IgjkB2lEZev9iIAjVXB65XshDD1QBoPitYXkb6Hx94iB9X7klaR
         c3VcSMEvtplsFrJ5LUKhyCN+OqwVeSXhsxD0S+m/PjKMukcEKpw7lEuejtohl++PGlt6
         wUEiL2Ojy4dAC3XY8rPYxTpCKVEpk9H0jKJTpo/2ZrTzBvzBJLOW2O391lo/2eMhBaln
         ebgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sXvHapjS93NaUhHhbE5XKq63oc/+VGXWe8vklnnWKOw=;
        b=qFcQr0iJ1Z0eTIeoazWPElX9rP8fjp3DrTGbvc2lEB/KXlcmHWlussTwf5ptX1uagb
         oL1L+wo6991/Lt8Ap+/JoO7WH3azhrZoUrLC/WOCALgLAR8bSlMblepbjW7/zIq9RNzd
         HGpY02m5ILVDnZc9QPlQWujxyrJkghT38ErGD+ywyk2kCQiKOlV7SknxmSyYDrnqIByc
         Muxecrn0C7kuSbYU/2kpPOm4pXKMsrXaYnfHNFF9pB6mYuCpJqDLn+Dk+9P+1zapsPSy
         Ao9OVJLPMTOJCq536uXbeRVw1IOeBd8dSTXnafuqGi+eRx/iBKwnTfIGYVeYi2cEAHZp
         lNpA==
X-Gm-Message-State: AOAM530SA545ELIaSaJ33GSM2KC7jRCzs8nzEwj9tJ7uJPUEsux8sryW
	cj6uYEu6JtqG5LQ++oXvhQ4=
X-Google-Smtp-Source: ABdhPJz/Oyo75Ua15PdhYlpInpjGBIMPv9h0sawBBeyuqvqsMSZ/MpPh4L4AXLbaoyHdbBsKQ8MgyA==
X-Received: by 2002:a2e:b8cc:: with SMTP id s12mr28317095ljp.489.1639395513097;
        Mon, 13 Dec 2021 03:38:33 -0800 (PST)
Subject: Re: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <3c3c8641-05f5-56b6-b7b1-6942d6bb5a3d@gmail.com>
 <0024265c-e485-8354-361b-9faa36c50a3d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4377a72c-8e6f-9412-59ee-a46bd6648a73@gmail.com>
Date: Mon, 13 Dec 2021 13:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0024265c-e485-8354-361b-9faa36c50a3d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 13.12.21 12:11, Julien Grall wrote:
> Hi,


Hi Julien


>
> On 13/12/2021 10:05, Oleksandr wrote:
>>
>> On 27.11.21 19:51, Oleksandr Tyshchenko wrote:
>>
>>
>> Hello all.
>>
>> Gentle reminder.
>
> This is in my queue of 50+ patches to review. EPAM is the main 
> contributor for the IPMMU patches, so can one of your colleagues help 
> to review it?

I think, yes, it is possible.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


