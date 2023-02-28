Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121B6A53EE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503062.775206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWunI-0005zJ-Hj; Tue, 28 Feb 2023 07:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503062.775206; Tue, 28 Feb 2023 07:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWunI-0005wi-Er; Tue, 28 Feb 2023 07:53:04 +0000
Received: by outflank-mailman (input) for mailman id 503062;
 Tue, 28 Feb 2023 07:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWunG-0005wc-T7
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:53:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea01a4ad-b73c-11ed-9692-2f268f93b82a;
 Tue, 28 Feb 2023 08:53:01 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-aF2V_V0GOjqs99Dc86b5Tw-1; Tue, 28 Feb 2023 02:52:53 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so3957838wmr.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 23:52:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b003eb369abd92sm10529537wms.2.2023.02.27.23.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:52:50 -0800 (PST)
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
X-Inumbo-ID: ea01a4ad-b73c-11ed-9692-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677570776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
	b=RqqToOBbZyxU/AuQ+lyNqrIMl1Dh/X/bAjRiK42UX3RI+9C+hFgozpFZh7293r3G3hOVrU
	1vkMWc2mt0yjRVnePDqF29Vxb6kWVofign4zA0mmoQfR2mLDQmPrul4yKpcJddz4p189xE
	OvVrH/eFcXkcLJtJ2AjRabNq96owx0g=
X-MC-Unique: aF2V_V0GOjqs99Dc86b5Tw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
        b=CkuuBd7LuNZTbP8n4Ltl8fH+05rgDxCZyEZX4Udn+fxcqddwS52A+T7UbLvnXSrqYA
         DZHFepKHzSxEm1wEGADhq1vju1E61S1Q9hMZ7dMT88ePksGEfGJH6M6MKZa/Q1lPnlpG
         WQpnDranM0YPT0RGPE+M6D/n31fDLWDkLWxIRAk3JO5/xQJ1eGJ76m1Ve1e/iboRqjGk
         AtE6ZM0lergCQz/j53Vx+8EIVuskgp9RsfvmPpnPzCiLOVnG3Z3zGUjKWMPvQxOl1Lmy
         4HZBjK7q8IoJ4a4jYHPutllMNLECf01n6TMQQ0PjLlg3OIQKcwXYKRN5CwQCDgdDu6pi
         QQFg==
X-Gm-Message-State: AO0yUKXkyLwjkj1rjNZ6n9NzkQgest/nN6GRXlA5ZQ+hdnr+zWLQTtOg
	KUjeAPUu8w4YO0IKRApvMpZGLlF0epoGFN9878WegGgVQfvFfuYpxe5IZbS9fEMbENaEkljOSBN
	gY+z41WnOPXyCZszq9psHhvd78rA=
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id m5-20020a05600c4f4500b003e224a0ba26mr1281587wmq.16.1677570771142;
        Mon, 27 Feb 2023 23:52:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+ci1F5345rugsjKD5i5qcI5nYxBh17WE97j1xttoOVVrF5Kg3psWnYfbVkr8cqSXw8dyl8Yg==
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id m5-20020a05600c4f4500b003e224a0ba26mr1281570wmq.16.1677570770820;
        Mon, 27 Feb 2023 23:52:50 -0800 (PST)
Message-ID: <697e536d-eb65-32d9-279f-b2e6ab5e718a@redhat.com>
Date: Tue, 28 Feb 2023 08:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/02/2023 21.25, Richard Henderson wrote:
> On 2/27/23 01:50, Daniel P. Berrangé wrote:
>> On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
>>> Hardly anybody still uses 32-bit x86 hosts today, so we should
>>> start deprecating them to finally have less test efforts.
>>> With regards to 32-bit KVM support in the x86 Linux kernel,
>>> the developers confirmed that they do not need a recent
>>> qemu-system-i386 binary here:
>>>
>>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 15084f7bea..98517f5187 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the 
>>> deprecation process
>>>   completes. The little endian variants of MIPS (both 32 and 64 bit) are
>>>   still a supported host architecture.
>>> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
>>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +Testing 32-bit x86 host OS support takes a lot of precious time during the
>>> +QEMU contiguous integration tests, and considering that most OS vendors
>>> +stopped shipping 32-bit variants of their x86 OS distributions and most
>>> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
>>> +32-bit support alive is an inadequate burden for the QEMU project. Thus
>>> +QEMU will soon drop the support for 32-bit x86 host systems and the
>>> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
>>> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.
>>
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact.
> 
> Agreed.

OK, fair, I'll rework my patch according to your suggestion, Daniel.

>> 32-bit x86 hosts
>> ''''''''''''''''
>>
>> Support for 32-bit x86 host deployments is increasingly uncommon in
>> mainstream Linux distributions given the widespread availability of
>> 64-bit x86 hardware. The QEMU project no longer considers 32-bit
>> x86 support to be an effective use of its limited resources, and
>> thus intends to discontinue it.
>>
>> Current users of QEMU on 32-bit x86 hosts should either continue
>> using existing releases of QEMU, with the caveat that they will
>> no longer get security fixes, or migrate to a 64-bit platform
>> which remains capable of running 32-bit guests if needed.
> Ack.
> 
>>
>> ``qemu-system-i386`` binary removal
>> '''''''''''''''''''''''''''''''''''
>>
>> The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
>> by selecting a 32-bit CPU model, including KVM support on x86_64
>> hosts. Once support for the 32-bit x86 host platform is discontinued,
>> the ``qemu-system-i386`` binary will be redundant.
> 
> Missing "kvm" in this last sentence?  It is otherwise untrue for tcg.

I assume that Daniel only thought of 32-bit x86 hosts here, but indeed, it's 
untrue for non-x86 32-bit hosts. So this really should refer to KVM on 
32-bit x86 hosts instead. I'll rephrase it in v2.

  Thomas


