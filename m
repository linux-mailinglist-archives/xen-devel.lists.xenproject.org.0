Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE664C5AC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461874.720036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5NsB-0008Ei-Rz; Wed, 14 Dec 2022 09:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461874.720036; Wed, 14 Dec 2022 09:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5NsB-0008Br-PI; Wed, 14 Dec 2022 09:16:19 +0000
Received: by outflank-mailman (input) for mailman id 461874;
 Wed, 14 Dec 2022 09:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2C/v=4M=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p5NsA-0008Bj-ET
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 09:16:18 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f71cb7a4-7b8f-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:16:17 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id p36so9361296lfa.12
 for <xen-devel@lists.xen.org>; Wed, 14 Dec 2022 01:16:17 -0800 (PST)
Received: from [192.168.0.105] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651234cc00b00485caa0f5dfsm738143lfr.44.2022.12.14.01.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 01:16:16 -0800 (PST)
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
X-Inumbo-ID: f71cb7a4-7b8f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzU5mIHt6Ft3TWRUfStw39S24fSHuwdJdE133R1GM68=;
        b=e12FYImr1oCGv7fIVKX9pCQNI1y2Ea5QE7ck48IIP143sIp7HHX1xIA6lc7A9E5+E+
         9uLgVYo+DxljV/tOtMOVz9nlzgW3nF+zubSySjKLSrpBYKhXObEgp3sh9aHV5WYtRfqr
         zavNuuex94W8mah2GM2T/AFfVs2SfZGGJh57Q4TxC4P1kg8GUMroE+ir7eUtWQg1+Hb1
         MjPEJf6uvFeL46WUL+6YUjIlQMVs8PVMHHNEuf867LbMslY95B9xIf/fzCREE45nwQGx
         K5lurrEyyfYx7H7l3MuCkFGhfVhyjMMkANOUn9DYcYMm8NRVSVinCYR5yllfIGB4lJE2
         kW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzU5mIHt6Ft3TWRUfStw39S24fSHuwdJdE133R1GM68=;
        b=KdtTywEWScYaykGHSzcUZwzJiK/UlGQmH4ESAjgkR3Z1IjZFd5NpSDZRum19TvRsNh
         JabaeXU4dm/EkMm9PQ08hlIuMo45kZ7AsXSrmcUKdTh4cbu4jx9e/8R27g66wYqWruLS
         bcTimwQwUAo5PfdS/eDCPTTAtkbsf0SRNYaCu5c1vUxK393BV44si6g0i6Udpp5lz7K/
         z0QCjeQSLEFw4wiHCUdNy8kzOr/M9DKPyBBZfldvVTiNuGtJnW3GAYGc9i1LtlLo38+f
         xP96eyWW1AsOCGj8J0cl4010cpGvtUSB7W+g9VhuOGIU5BeXdONm7MfsgaXhS9GfHx97
         DT1w==
X-Gm-Message-State: ANoB5pkzeWqIeMIU655/eNqiXUxCn6vtP9c9y+Vls6SRamwz4GnDEDCN
	s3O+cI0AwTDfiR1uSg3WS7k=
X-Google-Smtp-Source: AA0mqf4OfM1W812ib6P6DFh5Q6RwEjpq696IZF2/2A1Hf+xKtFw0WVqKgapNkds3Vt7uhCJCLg9yBQ==
X-Received: by 2002:a19:ad06:0:b0:4b5:b8a9:b42c with SMTP id t6-20020a19ad06000000b004b5b8a9b42cmr3711348lfc.17.1671009376880;
        Wed, 14 Dec 2022 01:16:16 -0800 (PST)
Message-ID: <9867da27-b67f-e6ad-3d5c-0fdfa65e979e@gmail.com>
Date: Wed, 14 Dec 2022 11:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V10 0/3] toolstack support for generic virtio devices on
 Arm
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
 <47096c1c-4b03-2e3d-c28b-c8920b7d31f9@suse.com>
 <20221214083456.4w6raz7wop3ajtve@vireshk-i7>
 <f7f24676-b251-a7d0-b169-8229704c9f8c@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <f7f24676-b251-a7d0-b169-8229704c9f8c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 14.12.22 11:09, Jan Beulich wrote:

Hello all

> On 14.12.2022 09:34, Viresh Kumar wrote:
>> On 14-12-22, 09:21, Jan Beulich wrote:
>>> On 14.12.2022 06:19, Viresh Kumar wrote:
>>>> This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
>>>> This is inspired from the work done by Oleksandr for the Disk device.
>>>>
>>>> This is developed as part of Linaro's Project Stratos, where we are working
>>>> towards Hypervisor agnostic Rust based backends [1].
>>>>
>>>> This is based of Xen's master branch.
>>>>
>>>> V9->V10:
>>>> - Swap I2C/GPIO compatible strings, they were wrongly added earlier.
>>>> - Arrange tags in timely order and add new ones.
>>> The affected patch surely needed all tags to be dropped which weren't
>>> explicitly indicated to remain valid across the bug fix.
>> Hmm, since it was a very small change (only fixed the compatible
>> strings) I thought it would be okay to carry the tags and rather harsh
>> to the reviewers to drop them, since they invested a lot of time
>> reviewing these. Though I do get what you are suggesting here.
>>
>> Should I ask Oleksandr / Anthony to provide their tags for patch 1/3
>> again ?
> Let's simply wait for them to confirm their tags.


Viresh, I confirm that my R-b for #1/3 is still valid (thanks for making 
a change). I probably should have mentioned that explicitly when making 
a comment.



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


