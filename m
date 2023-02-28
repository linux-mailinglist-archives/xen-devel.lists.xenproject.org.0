Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77036A5554
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503167.775357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWw4k-0000Tn-L7; Tue, 28 Feb 2023 09:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503167.775357; Tue, 28 Feb 2023 09:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWw4k-0000Rz-IK; Tue, 28 Feb 2023 09:15:10 +0000
Received: by outflank-mailman (input) for mailman id 503167;
 Tue, 28 Feb 2023 09:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWw4i-0000Rt-Tw
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:15:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 642124ac-b748-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 10:15:07 +0100 (CET)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-Xbme9yDUMYa30xqJX0RqNg-1; Tue, 28 Feb 2023 04:15:02 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 m1-20020a05621402a100b004bb706b3a27so4836053qvv.20
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 01:15:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 y24-20020ac87058000000b003b0766cd169sm6367904qtm.2.2023.02.28.01.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 01:15:01 -0800 (PST)
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
X-Inumbo-ID: 642124ac-b748-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677575705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
	b=httV4BllPPKMInj7e88Q3xDUPDixQQWajVa4Zer9QoRAhUI4JTtLoSPHWiJX0j8ywVkPXr
	VMARaMe9FNjgPVzpiNNralqupwWgpRfTwzoj+5h2X51T2vSpdh1w3HROWZmYqOZhb0CbiU
	V3hNxcv1g7I4relENUmxtOHT21KE15U=
X-MC-Unique: Xbme9yDUMYa30xqJX0RqNg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
        b=ULlAqoontjzyRSdv2k4s2UTzw1Q8i2eMnbabbr7HyloKVQ3pTJzME4U7ktvwVa4b+7
         qmUaF79OSLpTyBfYNiCcqBEod8jHdfa1kRbQfR//NG5W1QbvApkQcMsLHVw+8zQbFdES
         Hv5uPczZFrqU8W8HLTrgZ0VxMUn0lacOWZAT8l/rm2EXVs89ty6ZcK8E9ZB5kEX7VLgv
         ikgvuwBllOVvpq7E1mFEzGc2OkrMnO0W0P903MBpdDJmW92fn9UD3c8Ks6nEtgbK1imD
         ZlLiS2IAmIe5GAkdecHOPG1HCEg3dkHwMp7CW+D8QmI+exJYPc4eVY0QJclR0mlQsmTJ
         qJrg==
X-Gm-Message-State: AO0yUKU5/rjWynq5fZJBuQZCDHSUPfclo39r5XAxFlBUcYrCFrhe5+dc
	b9fvQI094FmkiR1eiUZ9LVGmIML+xSXClY6GKHPjU3FWnKtIhZkg0KD5Ah64F3g9pFmsgvDgQDx
	tGlcAoPUqnoWEa9CcOaXL8k6LabY=
X-Received: by 2002:a05:622a:1aa0:b0:3bf:e4da:2367 with SMTP id s32-20020a05622a1aa000b003bfe4da2367mr4024644qtc.3.1677575701899;
        Tue, 28 Feb 2023 01:15:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+tlULtl5hsjg8wm7tkSWgo9aPXWHB0qpTqsH249PIqNMrW49odQ2jTi+8oJFuSxDyLBqorgg==
X-Received: by 2002:a05:622a:1aa0:b0:3bf:e4da:2367 with SMTP id s32-20020a05622a1aa000b003bfe4da2367mr4024622qtc.3.1677575701703;
        Tue, 28 Feb 2023 01:15:01 -0800 (PST)
Message-ID: <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
Date: Tue, 28 Feb 2023 10:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org> <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228040115-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
>> On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
>>> On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
>>>> On 27/02/2023 21.12, Michael S. Tsirkin wrote:
>>>>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>>>>> I feel like we should have separate deprecation entries for the
>>>>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>>>>> although they're related they are independant features with
>>>>>> differing impact. eg removing qemu-system-i386 affects all
>>>>>> host architectures, not merely 32-bit x86 host, so I think we
>>>>>> can explain the impact more clearly if we separate them.
>>>>>
>>>>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>>>>> a superset.
>>>>>
>>>>> Removing support for building on 32 bit systems seems like a pity - it's
>>>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>>>> and the maintainance overhead is quite small.
>>>>
>>>> Note: We're talking about 32-bit *x86* hosts here. Do you really think that
>>>> someone is still using QEMU usermode emulation
>>>> to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
>>>
>>> I don't know - why x86 specifically? One can build a 32 bit binary on any host.
>>> I think 32 bit x86 environments are just more common in the cloud.
>>
>> Can you point to anything that backs up that assertion. Clouds I've
>> seen always give you a 64-bit environment, and many OS no longer
>> even ship 32-bit installable media.
> 
> Sorry about being unclear. I meant that it seems easier to run CI in the
> cloud in a 32 bit x64 environment than get a 32 bit ARM environment.

It's still doable ... but for how much longer? We're currently depending on 
Fedora, but they also slowly drop more and more support for this 
environment, see e.g.:

  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/

  Thomas


