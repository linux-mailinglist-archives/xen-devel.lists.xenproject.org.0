Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E230BDC9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 13:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80525.147322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uV7-0006vD-09; Tue, 02 Feb 2021 12:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80525.147322; Tue, 02 Feb 2021 12:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uV6-0006uo-TG; Tue, 02 Feb 2021 12:09:44 +0000
Received: by outflank-mailman (input) for mailman id 80525;
 Tue, 02 Feb 2021 12:09:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jjjr=HE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l6uV5-0006uj-JX
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:09:43 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46e7f4ef-2ac6-4f2b-86ee-ef4a8a69c451;
 Tue, 02 Feb 2021 12:09:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a25so23681782ljn.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 04:09:42 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d28sm3273106lfn.15.2021.02.02.04.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 04:09:40 -0800 (PST)
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
X-Inumbo-ID: 46e7f4ef-2ac6-4f2b-86ee-ef4a8a69c451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cklQJu8+KYVHEIxLg9m2wh/uxfhxTC5GXImJ4sfcMrY=;
        b=mFoyQkcX+lb3A/7GziV07+mOAfWQlbGDWi7Uy8dZ6p0R3ETVY8uHKLKPRxcvfHTUqM
         J8DBZt4UCZW4ESP36WlspXX5v3Qn9nK87F17bnzkGzmotkku/LLmFGH+tYh2vCUsBFvN
         bPNKtzzavKhPEhJI7thTde2ylmBjtnvnzE/9klZ/usZ6DpwMpaG2fnj3+HhJKKw5IBgi
         OA8bCrjbVy80Y4jdFrYDnYEgImsmPnFTuRNL5McSOBL5tg06qJJ+qXYGG8htI5qs1P0R
         neDo0AuFAyD1o/M6oXIhKso0drcKyBd2cr8bPCBNkSTZDRoaVbdQfew7u5nMdfKEbzWH
         ZqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cklQJu8+KYVHEIxLg9m2wh/uxfhxTC5GXImJ4sfcMrY=;
        b=TCPQrngb00V9D0LDY/ORm9Mjq/nhZJ/ADNEIp+g7BQpQoL8yYxCUX4xTnLMb9Wy5fM
         LDQ3U4nyhV6nsTMs3kk0ffy7qFJhcnmqX/09E7Vb+2vYfHFMpuZ1+T05JAoz+TFw2p5N
         gFzFjdf8IYAyntXKCaSTLmNnMzi8YNp1Xkj9I3nvW2+5dNmcTuNZacoufMuM2wG9v/WM
         0st2KfBn6CxQmM6H42Vrw4uIkX7ItwMSe2tlhztG2QyA+a2bxKo4dLFY6oAq9NfgouY0
         mVIQmCIhN9sZTq60xVscqzlDUfnac+s/TgBf6QzEsZUSezxEyf127KvDcpV8rWz0y6VL
         AwZA==
X-Gm-Message-State: AOAM5312ebPJr92UkdYkJ4sTCALjX7C9xPz/Bh1SSKUfWO3dJF5i5VAa
	fRbn/za6myEXAZv4EWR/j4M=
X-Google-Smtp-Source: ABdhPJwtplTISQ/VughfoBDpUhlOEQ/8PjQR5p7Yn+2tVifUH2Xr9P0CTs34CRH2P1rorjr8VMuglA==
X-Received: by 2002:a05:651c:1029:: with SMTP id w9mr13366979ljm.142.1612267781378;
        Tue, 02 Feb 2021 04:09:41 -0800 (PST)
Subject: Re: [PATCH v8 00/16] acquire_resource size and external IPT
 monitoring
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <911270bf-0077-b70e-c224-712dfa535afa@gmail.com>
 <fceef592-e637-e985-8217-11546e088027@citrix.com>
 <d5cc17a4-267c-3022-11e5-eb043de121a9@gmail.com>
 <7384c55e-f996-be08-f8ee-b6d09c9e2eef@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7350812f-a222-8f82-c2dc-06c939e64249@gmail.com>
Date: Tue, 2 Feb 2021 14:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7384c55e-f996-be08-f8ee-b6d09c9e2eef@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 01.02.21 16:00, Andrew Cooper wrote:

Hi Andrew

> On 01/02/2021 13:47, Oleksandr wrote:
>> On 01.02.21 15:07, Andrew Cooper wrote:
>>
>> Hi Andrew
>>
>>> On 01/02/2021 12:34, Oleksandr wrote:
>>>> On 30.01.21 04:58, Andrew Cooper wrote:
>>> One query I did leave on IRC, and hasn't had an answer.
>>>
>>> What is the maximum number of vcpus in an ARM guest?
>> public/arch-arm.h says that current supported guest VCPUs max number
>> is 128.
>>
>>
>>> You moved an
>>> x86-ism "max 128 vcpus" into common code.
>> Ooh, I am not sure I understand where exactly. Could you please
>> clarify in which patch?
> ioreq_server_get_frame() hardcodes "there is exactly one non-bufioreq
> frame", which in practice means there is 128 vcpu's work of struct
> ioreqs contained within the mapping.
>
> I've coded ioreq_server_max_frames() to perform the calculation
> correctly, but ioreq_server_get_frame() will need fixing by whomever
> supports more than 128 vcpus with ioreq servers first.

Thank you for the explanation. Now it is clear what you meant.

-- 
Regards,

Oleksandr Tyshchenko


