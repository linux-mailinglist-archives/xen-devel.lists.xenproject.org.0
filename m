Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDAB6A9469
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505678.778563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY21c-000586-NB; Fri, 03 Mar 2023 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505678.778563; Fri, 03 Mar 2023 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY21c-00055T-K7; Fri, 03 Mar 2023 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 505678;
 Fri, 03 Mar 2023 09:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M2mb=63=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pY21a-00055N-FZ
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:48:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e9cc3d-b9a8-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 10:48:24 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-UEEl3mGjNQyMGcPDlJZU-A-1; Fri, 03 Mar 2023 04:48:19 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso2583417wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 01:48:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm6271925wms.32.2023.03.03.01.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:48:18 -0800 (PST)
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
X-Inumbo-ID: 89e9cc3d-b9a8-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677836903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
	b=eED1hoF/3olgzzxoaEejjbh8ALdk9NluETauQc5QwPf18gD5zNGkBZEikyjxhk/WVk31Ar
	ElZfcIjCuW9ydkelgGj28ftmm7O8y23sOcnuGIFEWQBC2UOKkm0+ulYWLCV8tBbN1L1rjb
	1RLfOEVxpsNe/y1gmPydK5eDUHtnYfo=
X-MC-Unique: UEEl3mGjNQyMGcPDlJZU-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
        b=RYUCxSsM9cLpCX8cWluXtaP88ZcJGJ9OQvZWli708niSvMsRpR3Sc9sN3WmdskhVjl
         XUqotDME5RYaiWlPhr+z8/TUMocpMsUNTEX+3jx6IZHJKkqqEaXgs44I5foR+aEZezrv
         Yx5j1lQD0L16f3diEg63B/mAH33d9woFJWNDTyk/OKn+erf2in6RU9FmnizVAiSCNgHJ
         4zWxm+GfQFuz4BDPG1/xI57Ur7X0g9NzH4o1H1aJlzPge8IFHBkBwJUfYJmeaCLCCtws
         a81EQQ2eo1mGOE6q3rylJEo31Ki6X4k1M1uYvvOfHqRHXH1YkH6MCTViZcu+6oqddKdh
         wX6w==
X-Gm-Message-State: AO0yUKW7huHY/bBJuqUVnwmhDxfP3hxnPQWszeatFUM8u+olEWf+7uaZ
	XlBuuB6t6mZ38uEKM/DstFqldgsE6Wo5tiA50oVhSWhNYim9ageV8hiGCqdGCnv7Sm6Luc73w2w
	7Jl9+W47rcURoIvias0c/l+wdz3c=
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id t9-20020a05600c450900b003eb29fe7343mr904165wmo.33.1677836898781;
        Fri, 03 Mar 2023 01:48:18 -0800 (PST)
X-Google-Smtp-Source: AK7set90kOf+t50U+lkBEG3QcglfuhduO561ikJbIwTI1cvMR/JJzdn3/vk/aPcFI5eUoUJ7JyGBaQ==
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id t9-20020a05600c450900b003eb29fe7343mr904148wmo.33.1677836898529;
        Fri, 03 Mar 2023 01:48:18 -0800 (PST)
Message-ID: <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
Date: Fri, 3 Mar 2023 10:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/03/2023 23.07, Philippe Mathieu-Daudé wrote:
> On 2/3/23 17:31, Thomas Huth wrote:
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
>>   
>> https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>
>> where people still mentioned that there is still interest in certain
>> support for 32-bit host hardware. But as far as I could see, there is
>> no real need for 32-bit x86 host support and for system emulation on
>> 32-bit arm hosts anymore, so it should be fine if we drop these host
>> environments soon (these are also the two architectures that contribute
>> the most to the long test times in our CI, so we would benefit a lot by
>> dropping those).
> 
> It is not clear from your cover that the deprecation only concern system
> emulation on these hosts, not user emulation.

x86 ==> deprecate both, user and system emulation support on
         32-bit hosts
arm ==> deprecate only system emulation on 32-bit hosts.

I tried to say it with the sentence "there is no real need for 32-bit x86 
host support and for system emulation on 32-bit arm hosts anymore, so it 
should be fine if we drop these host  environments soon" ... not sure why 
it's unclear, but if you have some better sentences, I'm open for suggestions.

> I wonder about tools. Apparently they depend on sysemu now. I was
> building a 'configure --enable-tools --disable-system' but now it
> is empty.

I just did a try in a fresh build directory, and for me it was working: it 
builds qemu-img, qemu-io, qemu-edid etc. just fine.

What was missing in your case?

  Thomas


