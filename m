Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7C2D9633
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52084.91129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kokvP-0001nv-2W; Mon, 14 Dec 2020 10:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52084.91129; Mon, 14 Dec 2020 10:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kokvO-0001nW-VN; Mon, 14 Dec 2020 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 52084;
 Mon, 14 Dec 2020 10:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cKns=FS=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kokvN-0001nR-Ks
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:17:49 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5ddc1232-acaf-481a-844d-23643d0c3141;
 Mon, 14 Dec 2020 10:17:45 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-2-QNSaV0Nc2_MadRlkiCng-1; Mon, 14 Dec 2020 05:17:43 -0500
Received: by mail-wr1-f70.google.com with SMTP id w5so4137335wrl.9
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 02:17:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q73sm31034403wme.44.2020.12.14.02.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 02:17:40 -0800 (PST)
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
X-Inumbo-ID: 5ddc1232-acaf-481a-844d-23643d0c3141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607941064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
	b=XPe4bUF6Q5AJiRxV8MTWUVP47TJYRyg/NXwZ8eGI78uAS3rF+XZey7PfulNYZEvtxMeMWf
	rhfpbee+KA6spAF6e78XOINq2gpZ2KB5lJL4FLNhmT/xzwRysJeaTuaai4WM6TvgM1mUL2
	WESljk80cCgLyk5TtTHeOfLSNMCiJn8=
X-MC-Unique: 2-QNSaV0Nc2_MadRlkiCng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
        b=Zrd1KqSWKl7pcIuMq+/kMZKDNFB0Wbh7CjapqhkwAPIxaCZcnPw1g1eP8OnC5R2GPO
         urEf1hpMe2clNlVnT4on4Fn7/uJegKMSHArAUbFnVSMtTQDZEWFJBd/zFLwmPmZxt/VD
         9bAWK4miy4yOZEc5VxtsjvExsapb4OdETnstbkJVvKHDZQFMlgQmcbgu8yl+R/9uiCyv
         OSM1cQbIKHOKc1qBfmHWgfc55rLfJsW9FcRQ5VZyc5G9RSiyFUR1n9ZQpQ68sjaYuh00
         2oidyuI5Y5pbVQ42LQ9ULhWNL7QW3extDinJ2QKofB2CMYoSoLqwo1PIO1YkcUzdN5Jd
         zSvA==
X-Gm-Message-State: AOAM532dH1j/3tJCTad8WKD/G6JcyO86P7ncl59YsBsOiVlh0LWzVDeI
	GtyAOX09MoD6GCL4dXuylC/WSvDsFPvb/jSrYS3I8AjME4FPFh6EouGVgrf62+a8hcPlubAg6ZQ
	m9p+8ILkIJkzET2rx1oY6OOryZHbLBAkNREOL7FGdpLT8Qa1ImmzTHKWUL5PFA352BaDB1wAf0F
	SxlAI=
X-Received: by 2002:a05:6000:124e:: with SMTP id j14mr22150164wrx.310.1607941061891;
        Mon, 14 Dec 2020 02:17:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqJL+ArEmh2h1Fbd/p0DwTxOhnlMBoZKGQ8PSaiO0CapA4/tcA4p4VfRG8DdYnnBgO/YwSfw==
X-Received: by 2002:a05:6000:124e:: with SMTP id j14mr22150132wrx.310.1607941061678;
        Mon, 14 Dec 2020 02:17:41 -0800 (PST)
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
 <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e70d683d-7eb6-5717-eea4-02115935d232@redhat.com>
Date: Mon, 14 Dec 2020 11:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/12/20 15:32, Philippe Mathieu-Daudé wrote:
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Since commit efc6c07 ("configure: Add a test for the minimum compiler
>> version"), QEMU explicitely depends on GCC >= 4.8.
>>
>> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
>> __builtin_expect too)
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   include/qemu/compiler.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index c76281f354..226ead6c90 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -44,10 +44,6 @@
>>   #endif
>>   
>>   #ifndef likely
>> -#if __GNUC__ < 3
>> -#define __builtin_expect(x, n) (x)
>> -#endif
>> -
>>   #define likely(x)   __builtin_expect(!!(x), 1)
>>   #define unlikely(x)   __builtin_expect(!!(x), 0)
>>   #endif
>>
> 
> Trying with GCC 10:
> warning: implicit declaration of function ‘likely’
> [-Wimplicit-function-declaration]
> 
> Clang 10:
> warning: implicit declaration of function 'likely' is invalid in C99
> [-Wimplicit-function-declaration]
> 
> Shouldn't it becleaner to test in the configure script or Meson that
> likely() and unlikely() are not defined, and define them here
> unconditionally?

I think the point of the "#ifndef likely" is that some header file 
(maybe something from Linux?) might be defining them unexpectedly.  So 
it's difficult to do the test at configure/meson time.  I would also 
tend towards removing the #ifndef and seeing if something breaks, but 
not as part of this series.

Paolo


