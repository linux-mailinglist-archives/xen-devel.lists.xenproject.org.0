Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9119642C4BE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208644.364852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mag7n-0003FQ-Ls; Wed, 13 Oct 2021 15:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208644.364852; Wed, 13 Oct 2021 15:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mag7n-0003D0-Ij; Wed, 13 Oct 2021 15:24:59 +0000
Received: by outflank-mailman (input) for mailman id 208644;
 Wed, 13 Oct 2021 15:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mag7m-0003Cu-Cw
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:24:58 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61194f6b-4583-4129-87cd-3d5509812401;
 Wed, 13 Oct 2021 15:24:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e3so9505151wrc.11
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 08:24:57 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v18sm12518142wrm.63.2021.10.13.08.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 08:24:56 -0700 (PDT)
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
X-Inumbo-ID: 61194f6b-4583-4129-87cd-3d5509812401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=J5aUVxO0eIAhj+4p9MTABA7TYyilub1rlXaps2e4Fa4=;
        b=pKmVrKRAtp75xo4U18sWDNGaKTB7uQbNOAVrySNQU/o+D6TeVBtlapzct9fVrQ750V
         z7RYVi3xwYWi/v0yayiq/c7vTZzi05Hr8z28Dzo+81yfSSVWmEfwuFVHl+5x2u/RLt8b
         USX51BdjboipQsvAoWN339RPcpdtlCReVd0zOOkVlFhjBsLk107+RL8gD1xfFvPpsj3C
         wyEE2v2HfP3Sp+6A7fQju0EZTUBoiCYmD9Xz5zDzEp4zGReW5QEKdJG/jqpkQnftlC0h
         TrExqk8OT2RppdAMvSikue03T2B5fjZvKSkpb0gUHuVQ054hQEazeZBBgEMuPfgqx3KB
         ERuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=J5aUVxO0eIAhj+4p9MTABA7TYyilub1rlXaps2e4Fa4=;
        b=Ka4bggXtpdZjDay5Cg7MqAEav/8547jlgc57ut5pfw1Zg+tbXUY8b/WBJOU31AoBgT
         l/DKAKYKnU/6sTeAZ2fU6kg8+k2av6gG+yVnZ2GxT9wDmWqQDMResK1VRByjzSXF2O5/
         q805UpihKRz9TSjAA7juN/OfepKZxGXiwISygoHVZJyBK4oGOGfa83EjKmYcg5sD2lGj
         /cHhMICHSUfdXq7r4TaVy91Mz67j2Bykrvex2M9X9R4s7Jxn+pkNXuShXAzBGYrphnPH
         siDDmUQCPB/NqSaVm7T93GH9dGDWNgSFwKZOOcjW7eKEmEaxdJSvVbFxa6CkbIedoNND
         9ODg==
X-Gm-Message-State: AOAM530KqI4t8u+rvvclf3ppI7JQChLgsYAUENLdzDS4BbLA+32O576P
	4Jo6HJ1AQ6WHcHVD/wfKFS0=
X-Google-Smtp-Source: ABdhPJzJn1QO0tsrqxVS3nYjGTO3wPhIEa+F98Imkgm7XKYQe7F9SLRqLzoLiRsE1vEZLK/u8IQ9KQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr13490996wmp.165.1634138696271;
        Wed, 13 Oct 2021 08:24:56 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <9e6e1378-7ee3-b692-b57d-29b597160661@gmail.com>
 <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
 <f9b8b55b-cfe4-2bfa-44db-e898800def72@suse.com>
 <f51ec1a9-f265-cd18-792b-017224b8667c@gmail.com>
 <e614a4a4-ec65-1bbc-4e25-c838b9ebeeb8@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f3d19160-af62-cbe3-7bc3-28dab7bcf4a5@gmail.com>
Date: Wed, 13 Oct 2021 18:24:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e614a4a4-ec65-1bbc-4e25-c838b9ebeeb8@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 13.10.21 18:17, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 13/10/2021 16:05, Oleksandr wrote:
>> On 13.10.21 16:56, Jan Beulich wrote:
>>> While this has meanwhile moved quite far from the original proposal,
>>> I still wonder in how far Andrew may have remaining concerns. Did
>>> you check with him, perhaps on irc?
>>> But of course catching his
>>> attention may be difficult, so no (further) feedback by him should
>>> probably not keep this from getting committed (if no other open
>>> issues remain).
>>
>> If I remember correctly, I made several attempts to clarify in the 
>> initial thread. But, I have to admit, not via IRC (I am expecting 
>> some troubles with my IRC client last time and I haven't figured out 
>> yet why). Of course, it would be correct to get a feedback to make 
>> sure that there would be no remaining concerns (as the main concern 
>> to use domctl was addressed) or otherwise.
>
> I have pinged Andrew on IRC for you.

Thank you for the help.


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


