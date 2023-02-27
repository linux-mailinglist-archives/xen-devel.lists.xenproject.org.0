Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C816A4E14
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 23:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502969.775045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWm2b-0001wE-RK; Mon, 27 Feb 2023 22:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502969.775045; Mon, 27 Feb 2023 22:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWm2b-0001th-OT; Mon, 27 Feb 2023 22:32:17 +0000
Received: by outflank-mailman (input) for mailman id 502969;
 Mon, 27 Feb 2023 22:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cxA0=6X=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pWm2a-0001mc-5B
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 22:32:16 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960448b1-b6ee-11ed-9685-2f268f93b82a;
 Mon, 27 Feb 2023 23:32:15 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so4761806wmq.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 14:32:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b003dc47d458cdsm10091307wmk.15.2023.02.27.14.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:32:14 -0800 (PST)
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
X-Inumbo-ID: 960448b1-b6ee-11ed-9685-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
        b=mvOH5L0O5VrDuqOkJOneTHF0kZjSFhkuqYqGYY1b3iDRgoS25+AjZMG/Sbr5+PT3cH
         eNVT811nI0dgMwuHj2PnFqPQdJQf+ZmaRS9u7MpvRQUD6goztJc7aYuRh2AbH2JjJueE
         YEHRp5Ng1EZrCF67kMuU7nZ1JRLnL8vZFP6rBDITyO2KP9iAuQL5zr3+VLXmlXT4ubra
         weEsjWLbVI4YP5Jhmbdi6U8LLRgCrqoMGjf12zrPfHW98Ncuslo0F4Nd1oa8iss3ReSS
         t184TWHoXYgOHbSQ3Mv2nTRA1ZLys135PxQwHvrQytH8vuhsRspz5Ik8LZQAAzjn1wdi
         l1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
        b=mUoapPjYlFg7aqXdCg7zDzMwkBcykQMkYUX8X5plvOWSaCMZBt+WMLr+TFtPZZpiXF
         /dUROCDtZ85DTZ+IwImiySuq65LoyUwaqrRDJHRSHG5VWUipI+6ARS40DWPjDgoLfaKw
         +V3EaoyzHiUlr4p9WA+77S+32mqG/T07hIcvg+yUQGzZ0oR+EwDeBD2zKEAWXXU/7hSQ
         hb7l8/lQJQzi1c7bL77V0xHfQdYjVN55KBFEFMs+H9J3yo9lz+ZcbaUICRtcuIO1Zglg
         gz1n9l8qFJxJZ3mb6LPgSQDMzC3jVo8b2pL+nD1gCKXOV8lsCzSt5QtqNPLJpN62hRLm
         dI7g==
X-Gm-Message-State: AO0yUKXjryqCNY1t7jbw5PInNMq6+hlCYSADG2SnYJKD0fYT4fmSGAto
	T5Gq7SwED8ukv+EDb5CW4u/Ziw==
X-Google-Smtp-Source: AK7set9s3SslHAqqicd2niVRMhwWH/QJ3T9n5pd3LtY4pHcbw8/iWqLGlwcnuR5R+JDLd9iTy2Ht0w==
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id m5-20020a05600c4f4500b003e224a0ba26mr482035wmq.16.1677537134886;
        Mon, 27 Feb 2023 14:32:14 -0800 (PST)
Message-ID: <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
Date: Mon, 27 Feb 2023 23:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/2/23 21:12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.

Doesn't qemu-system-i386 start the CPU in a different mode that
qemu-system-x86_64? Last time we discussed it, we mention adding
-32 and -64 CLI flags to maintain compat, and IIRC this flag would
add boot code to switch the CPU in 32-b. But then maybe I misunderstood.
Thomas said, "CPUs must start in the same mode they start in HW".

> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.
> 
> In fact, keeping this support around forces correct use of
> posix APIs such as e.g. PRIx64 which makes the code base
> more future-proof.
> 


