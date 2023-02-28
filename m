Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78A6A601F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 21:06:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503738.776051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX6E4-0006qK-UC; Tue, 28 Feb 2023 20:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503738.776051; Tue, 28 Feb 2023 20:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX6E4-0006o6-Qs; Tue, 28 Feb 2023 20:05:28 +0000
Received: by outflank-mailman (input) for mailman id 503738;
 Tue, 28 Feb 2023 20:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pX6E3-0006o0-4a
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 20:05:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7def7e-b7a3-11ed-9698-2f268f93b82a;
 Tue, 28 Feb 2023 21:05:25 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-L1Tq-5ugMsSVHB7n2BProg-1; Tue, 28 Feb 2023 15:05:20 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso7360745wms.6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 12:05:20 -0800 (PST)
Received: from [192.168.8.100] (tmo-112-221.customers.d1-online.com.
 [80.187.112.221]) by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b003e214803343sm16622509wmr.46.2023.02.28.12.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:05:18 -0800 (PST)
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
X-Inumbo-ID: 3c7def7e-b7a3-11ed-9698-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677614723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
	b=iujQtoOg/vphkJxwewKlF6Iu4LmW82xRr4skgeoBWVvqibnVw2LxCEcsyJqym3cbUYDMl4
	u8SimHyaGZMAoJgevG8TW5QZZhdzJ90kAfQVpIasgt56o6HeYFF0ndRCGGkxhXdJt0QOAc
	KB0spX596PlgiCpQ1Lj0wYs3hQw/4n0=
X-MC-Unique: L1Tq-5ugMsSVHB7n2BProg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
        b=40pPAIQo/tA8Hmp3OAgwrbH1kA5lK9C2gajPDwFbX5Quc59ZDKLzi/tvYp482+lHys
         0wcqv9I5tNHC9LiP2D7r4udRvUscMOHq+gNZ3kBElx8xghbataw6b9nZmS14X/fj3Ov4
         6f3YJ0cit9StUhzk1jxw2eYsEKg/NkYui8etsIy0mBS/rtZpWVOhC5GNYHEmBQRMuQR/
         bNnbW+o0g41CCedHMp7cIjeR85tVPSPet/y18y2++//jbJi7FXFDxc93+1lD/DBHYwVv
         4xeo/2ECam54OmXHN5aOa6d2e9VQsV4CmGNrM/RMy4nqld5pDchxVESk7iTmU+vA5AR2
         ISjg==
X-Gm-Message-State: AO0yUKWuwYXY7kc8rAV1W5XZZQuk5c2YNvZXCqVzxOirWMPfv/ZocAnZ
	BuyCU3QEIXKDla6jge5Stpg2SzEZ4AThEouhMhyTlvRWdyi3IWjmTHLQd1GqGfzOnnX9+aSmZE2
	OccRJorVlNxGcLhiXHmtE8n4sZiQ=
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id m5-20020adfe945000000b002c717a0c6b5mr2892275wrn.34.1677614719637;
        Tue, 28 Feb 2023 12:05:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9MmF9eZGPOsdEoWMFU4L/R5a85Aqi1pG3SMRTtHFB4tUvsUD1H2dNf0t4BROa+7hwk1Y3Vhg==
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id m5-20020adfe945000000b002c717a0c6b5mr2892258wrn.34.1677614719335;
        Tue, 28 Feb 2023 12:05:19 -0800 (PST)
Message-ID: <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
Date: Tue, 28 Feb 2023 21:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <Y/3C+jC3Lk5MJxfu@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2023 10.01, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 08:39:49AM +0100, Thomas Huth wrote:
>> On 27/02/2023 19.38, Daniel P. Berrangé wrote:
>>> On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
>>>> We're struggling quite badly with our CI minutes on the shared
>>>> gitlab runners, so we urgently need to think of ways to cut down
>>>> our supported build and target environments. qemu-system-i386 and
>>>> qemu-system-arm are not really required anymore, since nobody uses
>>>> KVM on the corresponding systems for production anymore, and the
>>>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>>>> So it's time to deprecate them and the corresponding 32-bit host
>>>> environments now.
>>>>
>>>> This is a follow-up patch series from the previous discussion here:
>>>>
>>>>    https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>>>
>>>> where people still mentioned that there is still interest in certain
>>>> support for 32-bit host hardware. But as far as I could see, there is
>>>> no real need for 32-bit host support for system emulation on x86 and
>>>> arm anymore, so it should be fine if we drop these host environments
>>>> now (these are also the two architectures that contribute the most to
>>>> the long test times in our CI, so we would benefit a lot by dropping
>>>> those).
>>>
>>> Your description here is a little ambiguous about what's being
>>> proposed. When you say dropping 32-bit host support do you mean
>>> just for the system emulator binaries, or for QEMU entirely ?
>>
>> Just for system emulation. Some people said that user emulation still might
>> be useful for some 32-bit environments.
>>
>>> And when the deprecation period is passed, are you proposing
>>> to actively prevent 32-bit builds, or merely stopping CI testing
>>> and leave 32-bit builds still working if people want them ?
>>
>> CI is the main pain point, so that's the most important thing. So whether we
>> throw a warning or a hard error while configuring the build, I don't care
>> too much.
> 
> If we're merely wanting to drop CI support, we can do that any time and
> deprecation is not required/expected.  We should only be using deprecation
> where we're explicitly intending that the code will cease to work.

Well, without CI, I assume that the code will bitrot quite fast (considering 
that there are continuous improvements to TCG, for example). And who's then 
still volunteering to fix bugs that have crept in months ago, for a host 
architecture that nobody really uses anymore?
Clearly, 32-bit x86 host is pretty much dead nowadays, especially for 
programs like QEMU that need beefy host hardware. Why do we still waste our 
time with this?

  Thomas


