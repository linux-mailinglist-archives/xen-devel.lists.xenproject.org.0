Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D178B92B400
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756021.1164574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7Hc-0001jl-S9; Tue, 09 Jul 2024 09:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756021.1164574; Tue, 09 Jul 2024 09:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7Hc-0001i3-PX; Tue, 09 Jul 2024 09:37:12 +0000
Received: by outflank-mailman (input) for mailman id 756021;
 Tue, 09 Jul 2024 09:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TZB=OJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sR7Hb-0001gl-GL
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:37:11 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cff29d7e-3dd6-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 11:37:09 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77c9c5d68bso461054966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 02:37:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a856214sm62769266b.178.2024.07.09.02.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:37:08 -0700 (PDT)
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
X-Inumbo-ID: cff29d7e-3dd6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720517829; x=1721122629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9jVKtxYal/pEfgfae25sYtZwucxvOrzUJXxQY0LCeY=;
        b=dD6Evt+yWrg5Iy9qXFf2yHWBG9VlkrVatw1jWPKcztPXy7vkOLjh1ml17hChcl7YYh
         V2+k1oc3bmE/L0J0DVYnhCZYAGVjeXKAUBjfAAy6wA6KFog+o1ZFDgPxgY22EYZXMY2D
         THDMwqxSQR4q5qWpeq8S5KyVBcWtioc1TVpkeqHimhZIIkoZb3swA6HuAtP8r4/yGIZ0
         +ex499wcGDBor1F/l803T4MmPxv1EaLdgnqTDPgDi7THl5xqqNM7vYKXVh+j3BHp/mRV
         Zn1j+uQCVPPvU7cwyYHOQsrx5oMKh3X9HQD6WQNu8VFbMmiRvo0g+6bvY8KVLDgIkT75
         GSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720517829; x=1721122629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9jVKtxYal/pEfgfae25sYtZwucxvOrzUJXxQY0LCeY=;
        b=MAWAYZPIa4DFE/ToYYkEk2JvtNzh6Zzeul2LbXirrB78nP7pwzCCajxKZtzxP1rBFI
         Np6IRawbJQh9sGupSyT306BMe79LLRN2YR6aj5Zxu5COrK4XYca8SfwsObK4wIvGsxYo
         T0e192/Vx6UKpSt7nfqoqNPPiCf00zMj4QOCE7wLZS9Feci5x25Ktb6F6MGb8C3obmdJ
         ed/rrdi0PZH82Ukm9R4qQgzf3P6VBdlF+vhTQSRD4fdIkJ5BuOEcfNu1NlMWePSVO3YV
         JOrZtk3y+jyyyMTcxH8Im8yCENjPE/+zd7LMZE/8IHuptsJJevEFn5i94HhozlwBnWmc
         JdUw==
X-Forwarded-Encrypted: i=1; AJvYcCWBaly2GcTXOpQiyPaVHhIhpswMpP1hyrBhuXsbmyz4+40TB2GbvcT14afajJseY9U/15tviaZYdmHoxsLsCKjBvDR7YwHiuxm2nBMj3gU=
X-Gm-Message-State: AOJu0Yzc9nDnCKJtH9JHOdtxmIlyidc/Z3OMtj2nnMax9HQCOE7nORKg
	mfNriQUl9Pzf2tRtPf630abKAKsKP8+elsXmL/g6/6MfsN4cdsjqnbme/2zGqdk=
X-Google-Smtp-Source: AGHT+IG7KL+Jdzf18uMETDY/HtJzPsIQ6hH8eMakDFIVjeCorWRU3SEuPoKc+yRTey7pie2uEX80+g==
X-Received: by 2002:a17:906:c154:b0:a6f:dc17:500a with SMTP id a640c23a62f3a-a780b6b3a86mr171507366b.23.1720517828785;
        Tue, 09 Jul 2024 02:37:08 -0700 (PDT)
Message-ID: <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
Date: Tue, 9 Jul 2024 11:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD EPYC virtual network performances
To: Andrei Semenov <andrei.semenov@vates.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.07.24 10:36, Andrei Semenov wrote:
> Hello,
> 
> As been reported by David Morel (mail 4 Jan 2024), our customers experience a
> very poor virtual network performances in HVM guests on AMD EPYC platforms.
> 
> After some investigations we notices a huge performances drop (perfs divided by
> factor of 5) starting from 5.10.88 Linux kernel version on the AMD EPYC
> platforms. The patch introduced in this kernel version that allows to pinpoint
> the buggy behavior is :
> 
>   “xen/netfront: harden netfront against event channel storms”
> d31b3379179d64724d3bbfa87bd4ada94e3237de
> 
> The patch basically binds the network frontend to the `xen_lateeoi_chip`
> irq_chip (insead of `xen_dynamic_chip`) which allows to its clients to inform
> the chip if spurious interrupts are detected and so the delay in interrupt
> treatment is introduced by the chip.
> 
> We tried to measure how much spurious interrupts (no work to do by the driver)
> are raised. We used `iperf2` to bench the network bandwidth on the AMD EPYC 7262
> 8-core).
> 
> Dom0 > iperf -s
> 
> DomU> iperf -c $DOM0_IP_ADDRESS
> 
> It appears from our observations that we have approximatively 1 spurious
> interrupt for 1 “useful” interrupt (frontend TX interrupts) for HVM guests.
> 
> We run the same bench on the same platform with PV and PVH and the interrupts
> spurious/useful ratio was quite lower: 1 to 20 (so the network performances are
> much better).
> 
> We also run this bench on the Intel platform (Intel Xeon Bronze 3106 CPU). The
> interrupts spurious/useful ratio was about 1 to 30 for HVM guests.
> 
> So this make us think that this buggy behavior is related to abnormal amount of
> spurious interrupts. This spurious/useful interrupts ratio is particularly
> elevated in HVM guests on AMD platforms, so virtual network bandwidth is heavily
> penalized – in our particular bench we have 1,5Gbps bandwidth instead of 7 Gbps
> (when slowdown isn’t introduced by the irq_chip).
> 
> Does anybody notice this behavior on his side?  Can we do something about it?

In the guest you could raise the spurious event threshold via writing a
higher number to /sys/devices/vif-0/xenbus/spurious_threshold (default
is 1).

There is a similar file on the backend side, which might be interesting to
raise the value.

In both directories you can see the number of spurious events by looking
into the spurious_events file.

In the end the question is why so many spurious events are happening. Finding
the reason might be hard, though.


Juergen


