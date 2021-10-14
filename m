Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA042DE00
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 17:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209483.365959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb2Yj-0003TU-I7; Thu, 14 Oct 2021 15:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209483.365959; Thu, 14 Oct 2021 15:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb2Yj-0003Rg-F1; Thu, 14 Oct 2021 15:22:17 +0000
Received: by outflank-mailman (input) for mailman id 209483;
 Thu, 14 Oct 2021 15:22:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gDO=PC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mb2Yh-0003Ra-PJ
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 15:22:15 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e34b9c89-5d90-4fd7-b942-0a4a7aee5e5a;
 Thu, 14 Oct 2021 15:22:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m22so20827026wrb.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 08:22:14 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d7sm2646811wrh.13.2021.10.14.08.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:22:10 -0700 (PDT)
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
X-Inumbo-ID: e34b9c89-5d90-4fd7-b942-0a4a7aee5e5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dqSLLvhZp69OmPrYjuRR+7D7GYlMIQw17eSTDghAnwk=;
        b=YkNSUxp8xL25cgNTnx5vejPh0E1sdnbKBMVXbx7bnaHvp3v1LKTASWkgrOCNlZPzaD
         ypOIvgfzBwKsANd8Iy4vlEHNdW/d+IvOq0AzSnEfGEMgDVXfoDfY1h+J+lq/mWlBAfs/
         HHeOTiGW83cKFX8H9MmEvYzzFoh7LjLjCKibN/peZ12GoNJdVBGRk8BcSF0KnzP5P2iT
         8MmMRVWsBmh7sjKm15cQOW376XTazH7cA7SE9r4PPKFQ/hjv6WasAQzkwdbIx+0y1D6Q
         Czf+K5oiggvNocNy5B3FJO1lrNinUzYv+qVcEHQJW8Jv4qZl3KOOf2dl8eBC3eFXJBxe
         Dq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dqSLLvhZp69OmPrYjuRR+7D7GYlMIQw17eSTDghAnwk=;
        b=b+qJzjQ7dNFTtra1KPS013bTJZzRgVnDivaIL4yWyVV08LC2FWZuzAzZpnvTOSJDZD
         W+0ktcmhjBwrsCxpnZ5j0RYqwJK+ytSmv0yluC6YoJWukSKzQQnCdkBZ4buDbiRdcrGK
         Sw+vPd7HD4ldsYHi9DSUB5JPxLlN3oiZzE+vDBgO5fYNy3Azqxqq8uVTR61/Rnll/+5x
         bmOOqSuvi1w3WzsF91pMxvk6oZ/pMoEdcDx16/kmppmIcd+KIdPlYCbzzqMAqV2COlF/
         s81qfsUD6k0O+WP2+fiKAi0uPpYxHJNoz29bBXmR9qb5svr82CuEUnYIqzM0TwWjpYsX
         G0bA==
X-Gm-Message-State: AOAM530xrnlvosvcetoD5GxMAil0eFR9I79/v7KmIRftal2fJs9vjdfz
	yM+uLRwyf1X9XVGiBg3fPrk=
X-Google-Smtp-Source: ABdhPJw2GLJxV5kNbGV97rp2/ylreu5S4VmJXyD8Gu3UUjsulONiOD5c2rMdqhVkuZzQmmG82C6Rxw==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr7263004wra.357.1634224933654;
        Thu, 14 Oct 2021 08:22:13 -0700 (PDT)
Subject: Re: [PATCH V7 0/2] Add handling of extended regions (safe ranges) on
 Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
 <24936.15991.111241.918070@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f533253f-1b8d-a0ba-bd4d-e1f85cb2968c@gmail.com>
Date: Thu, 14 Oct 2021 18:22:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24936.15991.111241.918070@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.10.21 17:28, Ian Jackson wrote:

Hi Ian

> Oleksandr Tyshchenko writes ("[PATCH V7 0/2] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")"):
>> You can find an initial discussion at [1]-[7].
>>
>> The extended region (safe range) is a region of guest physical address space
>> which is unused and could be safely used to create grant/foreign mappings instead
>> of wasting real RAM pages from the domain memory for establishing these mappings.
> Thanks.
>
> This patch has all the required acks, but I was aware of an
> outstanding concern from Andrew, as set out in his most
> recent mail on the subject:
>    Subject: Re: [RFC PATCH 1/3] xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
>    Date: Tue, 7 Sep 2021 18:35:47 +0100
>    Message-ID: <973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com>
>
> I think it would be within the process to just commit the patch now,
> but I thought it best to check as best I could that we weren't missing
> anything.  The process is supposed to support our continuing
> development and also our quality, so I aim to do those things.
>
> I reviewed that mail and had a conversation with Julien about it on
> irc.  My understanding is that Julien and Oleksandr's intent is that
> Andrew's concerns have been addressed, although we don't have a
> confirmation of that from Andrew.
>
> In particular, I wanted to convince myself that if in fact there was
> still a problem, we hadn't made a problem for ourselves with the API
> here.
>
> The new hypercalls are in unstable interfaces, so if we need to change
> them in a future version (eg to make ARM migration work) that's OK.
> Julien tells me that he doesn't believe there to be any impact on the
> (x86) migration stream right now.
>
> There is a new libxl stable interface.  But I think it is
> inoffensive.  In particular, basically any mechanism to do this would
> have that API.  And that doesn't seem to touch on the implementation
> issues described by Andrew.
>
> Therefore, I think (i) we have tried to address the issues (ii) any
> reminaing problems can be dealt with as followups, without trouble.

Completely agree with both statements.


>
> So I have just pushed these two.

Thanks!


> Thanks,
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


