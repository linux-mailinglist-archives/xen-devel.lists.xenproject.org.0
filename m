Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD16A53C8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503040.775168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuaf-0001bP-K5; Tue, 28 Feb 2023 07:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503040.775168; Tue, 28 Feb 2023 07:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuaf-0001YF-Gg; Tue, 28 Feb 2023 07:40:01 +0000
Received: by outflank-mailman (input) for mailman id 503040;
 Tue, 28 Feb 2023 07:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWuae-0001Y9-8U
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:40:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190285f5-b73b-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 08:39:57 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-3X0mIeh5O9mz_oSP3tGy3g-1; Tue, 28 Feb 2023 02:39:53 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 y16-20020a1c4b10000000b003dd1b5d2a36so217219wma.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 23:39:53 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 q8-20020a1cf308000000b003e11ad0750csm11789964wmq.47.2023.02.27.23.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:39:51 -0800 (PST)
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
X-Inumbo-ID: 190285f5-b73b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677569996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
	b=JeW3zSARbpL/LOXECSSRX8Um90vKTbfJsLmll6SRYVKljCRuou2qKxmxLBKY5y0Wy5zkUp
	FLccIpynoePuh6LkQFXs3Q1OrF+d4NXjFoEgKw2WKCBGevX9vkDW37JAtH3gMi9eeyLbXr
	WWDZfPC32XuUHN9y3f+SxG0NI9sDcOQ=
X-MC-Unique: 3X0mIeh5O9mz_oSP3tGy3g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
        b=OJoG915b5OIL6ihpn2i8EbyBhvjGpyjckqoYttTlc37x/6QcbOl0tp2YNzHsnKKW5Q
         MQUctr3heJESD8ZTvnSVlD6DQ3zCDRH8f/c+fqZDrd9sup1aBZO/0nXQ+ys+io2nJ6kq
         QVb1w76TsjmutCXjQQYxDQqWCLFNESayLr/IsqTPV+g/0YSu8iI7MEi5Z/Z/K1shNKPJ
         CdZmrm0+n4ExPje+a46XtBuEfQAiToTSPWz7eYynxqc4i/B8ODrB7bqu3RbdoohB4jTX
         Axdknffm+uxHqj/PraMUw3ODU4O1k0o9q4DlijtM0V/UpGNsvnUbVdsFB848oSEjRp76
         xZrg==
X-Gm-Message-State: AO0yUKUXOMlmmOJLlaNOEabeIRtam1G3FdoB+IwDjfSYEvjkXT2ripYE
	dBmzupEVRopmvR58BwSofoLmDoVsrGq6TCTPVGTXluqptBjbNTu2z0zzJDrcVwmij2+XEFCm0K0
	iqiz0oHpu9wP3HTgzrVBSb0krbfc=
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id f29-20020a05600c491d00b003dc0d5c76d9mr1710995wmp.0.1677569992209;
        Mon, 27 Feb 2023 23:39:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/njPCmiXr23K7e76Er7M0HjsF+J1fmqdaUA9M/AOTPF1jtLXZ21lNSyv2Efwi4f6fqXtK/Ag==
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id f29-20020a05600c491d00b003dc0d5c76d9mr1710980wmp.0.1677569991934;
        Mon, 27 Feb 2023 23:39:51 -0800 (PST)
Message-ID: <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
Date: Tue, 28 Feb 2023 08:39:49 +0100
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
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <Y/z4rwv09Ckhbtfp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/02/2023 19.38, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
>> We're struggling quite badly with our CI minutes on the shared
>> gitlab runners, so we urgently need to think of ways to cut down
>> our supported build and target environments. qemu-system-i386 and
>> qemu-system-arm are not really required anymore, since nobody uses
>> KVM on the corresponding systems for production anymore, and the
>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>> So it's time to deprecate them and the corresponding 32-bit host
>> environments now.
>>
>> This is a follow-up patch series from the previous discussion here:
>>
>>   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>
>> where people still mentioned that there is still interest in certain
>> support for 32-bit host hardware. But as far as I could see, there is
>> no real need for 32-bit host support for system emulation on x86 and
>> arm anymore, so it should be fine if we drop these host environments
>> now (these are also the two architectures that contribute the most to
>> the long test times in our CI, so we would benefit a lot by dropping
>> those).
> 
> Your description here is a little ambiguous about what's being
> proposed. When you say dropping 32-bit host support do you mean
> just for the system emulator binaries, or for QEMU entirely ?

Just for system emulation. Some people said that user emulation still might 
be useful for some 32-bit environments.

> And when the deprecation period is passed, are you proposing
> to actively prevent 32-bit builds, or merely stopping CI testing
> and leave 32-bit builds still working if people want them ?

CI is the main pain point, so that's the most important thing. So whether we 
throw a warning or a hard error while configuring the build, I don't care 
too much.

  Thomas


