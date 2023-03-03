Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B06A95F7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505886.778874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3UV-0001Lw-7R; Fri, 03 Mar 2023 11:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505886.778874; Fri, 03 Mar 2023 11:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3UV-0001Io-4P; Fri, 03 Mar 2023 11:22:23 +0000
Received: by outflank-mailman (input) for mailman id 505886;
 Fri, 03 Mar 2023 11:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M2mb=63=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pY3UT-0001Ii-JH
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:22:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b53733-b9b5-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 12:22:18 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-gwpbPDUgM2uMocScvgvGmA-1; Fri, 03 Mar 2023 06:22:15 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so824591wmj.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 03:22:15 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm6595277wmq.29.2023.03.03.03.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:22:14 -0800 (PST)
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
X-Inumbo-ID: a7b53733-b9b5-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677842537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
	b=PGlJaPIatvpNhf92u5E6liWNKrP37gv3ks9gSASncAw7Th6/kLgnIFXXvNu1ut9QAzlxh3
	jW4VU1PWoc5JvFjb8TrY5Qde3XHTW8dLTNS4XFkHqFbrJVQT2YOIbF2LLv6NWHOxYdL6tm
	Hu545tHgflF3nVow7FvD4tQBBZtSLF4=
X-MC-Unique: gwpbPDUgM2uMocScvgvGmA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
        b=tHiJjcsGwx/sN26PVGCX0xIzrKPFd+ngfg9Nj3v1q3t/4CPfTjKQP3LJP7Q6mgNVpi
         BeetYzHxUjq6ikHPRqcTyevYAiyYBis2R7pqzUPELys6ej08OFoNIDEsULxkCiQmbso8
         Cb5IDc/VpDlZVuPFrXHO/AgjjRR6j8DWFuN6n/JP13wy0UafI1Nw67SF/mRjkHIUkhN+
         P3rGYMdck0d1ao18ML6TrPk7POtKIGoKi95ii/hVK3tEOegaUNcpI9f5UASyl9TbOP7/
         ybzLQjRszHO9kWkCz6y5jNrkM7t6K7YrmEN5biMLMmhXq5XPlGwYRNWKRCk9w/T79IMh
         c0Xg==
X-Gm-Message-State: AO0yUKUqyi0b4eUcYLc4+Px+EhZEEzA7+C7qQoE2auNdxWyR30MnGfb5
	No0FIrSyIghngKuaU+PuQDdpKjgxVbLjeBI8ss6xXMJViuNjGpvHy3kGNfSXAmuMZ9RvaHyG0UV
	/Flc8A5iIhgh0DOTHI6+MMOAbDZs=
X-Received: by 2002:a05:600c:3b07:b0:3ea:ea3e:2d36 with SMTP id m7-20020a05600c3b0700b003eaea3e2d36mr1407152wms.24.1677842534869;
        Fri, 03 Mar 2023 03:22:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+p9TRknJ6t4P9vbYDLGtFgS5SVfo80ej4ymN+unp2O1GWX68jl53tV7gROH1puWQh03kA6fA==
X-Received: by 2002:a05:600c:3b07:b0:3ea:ea3e:2d36 with SMTP id m7-20020a05600c3b0700b003eaea3e2d36mr1407120wms.24.1677842534612;
        Fri, 03 Mar 2023 03:22:14 -0800 (PST)
Message-ID: <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
Date: Fri, 3 Mar 2023 12:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
 <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2023 12.09, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
>> x86 ==> deprecate both, user and system emulation support on
>>           32-bit hosts
>> arm ==> deprecate only system emulation on 32-bit hosts.
> 
> I would recommend against dropping support for 32-bit hosts for qemu-user
> as there are some cases where the emulation of 32-bit user code on 64-bit
> hosts does not work properly [1].
> 
> Adrian
> 
>> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=23960

The ticket is very long and hard to read, but ... oh my, does that mean you 
need to compile qemu-user in 32-bit mode on a 64-bit x86 host to properly 
run 32-bit binaries from other architectures? ... uh, that's ugly ... and 
sounds like bug in QEMU's user mode emulation ... and what if you're running 
a distro (or different 64-bit host architecutre) that does not support 
32-bit userspace libraries anymore? Then you're lost?

  Thomas


