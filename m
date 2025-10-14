Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945ABDA4CE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 17:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142892.1476795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8goQ-0000T2-GE; Tue, 14 Oct 2025 15:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142892.1476795; Tue, 14 Oct 2025 15:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8goQ-0000R1-D7; Tue, 14 Oct 2025 15:19:42 +0000
Received: by outflank-mailman (input) for mailman id 1142892;
 Tue, 14 Oct 2025 15:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfYo=4X=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v8goO-0000Qv-SQ
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 15:19:40 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3058e348-a911-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 17:19:34 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so31794765e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 08:19:34 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e833dsm24167850f8f.53.2025.10.14.08.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:19:32 -0700 (PDT)
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
X-Inumbo-ID: 3058e348-a911-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760455173; x=1761059973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlHFOQXWxzzjDjPOVpHQOqqqqeQmwHzOFbxMqWe9zH8=;
        b=DH9upZYn12gxll4XVs+NZNJc6+jkSG8iGhVTITKpBlKabkpJPrw67nHL8SU7CgGQ6+
         5QekU41BxxZvJVUHY3lKf5DY/ctCPVOiZOdHvPeNqVkG2OQnlaePZyXXGyxp+ikgsIyS
         gH/S1Ak9RCkPITiM7p73GIN9+34ExhVdaZYN5NBGq18JppiqdtW4BpCsPp16aRP/866S
         Mah/CdpUP/XC4LRKuPAtSOrWy6u0lo3bbal/Q4zr9TIi6m08/ozJe+G8p0vs1VfYWLTP
         p6hxHlzfa0iMvONwt9mFDrj0lyAXQ2xohIGKE8t5tMQKoHotq+pDQJRpTKqIsjkvheUn
         rXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455173; x=1761059973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlHFOQXWxzzjDjPOVpHQOqqqqeQmwHzOFbxMqWe9zH8=;
        b=oQD/MVlsZ5Nk0JxqQ80y8S2sZkJltEBmnxwf/3SPO/aE+98E/zp4PFNfbnTMeF00wV
         n0kKnK6xEgE4yFlcON/cjK4pW48dvEgedzoO+Kh6AjAbhXPHfH/BP2U2Q3T8alTwc5mG
         V2oQwrktBiu1XqU13tSBT5Sh1k3sqS7pS/03B1CjRP/Doc8v1ZosAhLglj6GU9b5rZ06
         h8GjL3E8n+tAXvxDRabXOUqEfeFqGvbKeGE0T8WFim3DS81kdghXyB+0+8fWluVXuhg6
         17vX3JpXZbov05tleNIHhX2+ufT27m5gxD+mQEDH5P1DKipAQxrb8t52uCjPrCSFxANj
         u99Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3Wcr0lh2QLyzM4TyFefzWIgYJ3qOxvKgZtO4+q+dHVNs8kSieFEyaUXL4FIyMYWepZu8AKCCIXH4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqnARSF4I68eSLnWmhZiiDRNwVrYUnEG5dvutOenqCrPNtiyXf
	g2yPNbwP9REpCXvoyBPacCIikVJ8wtBW1TDoIr3sywqHNTMeuepybR1CldOIYsOw86c=
X-Gm-Gg: ASbGncsl1OX3JFBX99yITfq93eFnf1ZU2/IZkS+zJClFWJFSTErH/Q3nESbSBe3dysV
	k/R3AoWXD37LGQ8nigL7CGSrHNrlFy3mHU1zdziIcfZssz4JhwSgWGeP3ByCWfXS6oJhmZIGMOl
	Z/bDXV/ZU2Pwrm2h0GIKHAwQQMFGXsLDIrXBbWsu9C8fimhmAWlLR9CHG7LovmUt3G+FtXFC1Le
	Mio/wiRIFkZERy4F2xImilgBEyIxOfp0ddF2XRSmJei3g8L/m8N7tVvaMWhWHkhLJhbox5M9aHP
	POZ/uwwDETnUke6b4a4DD51uaWiwFIKM1OLk4eh9MWsooUkFXOj9KV27lUxAvubvOoA+wUBkPhB
	dPB/rMTAkcUpjL0JSlh2ILXnpVU6VOP3GGVapQLvtytQXilraN5FjD+VBRVjO+TbAhfD12c7Z1U
	qqNpj9+lGBCiEA
X-Google-Smtp-Source: AGHT+IEZPI24EUKrC4LPcFULvad8y2pBqW6url1+99+3ODje+BCbQxk5FqxB1JsN34Villm1JYw9vg==
X-Received: by 2002:a05:6000:4283:b0:3ee:1368:a921 with SMTP id ffacd0b85a97d-4266e7cfb85mr20417961f8f.28.1760455173374;
        Tue, 14 Oct 2025 08:19:33 -0700 (PDT)
Message-ID: <2cad2907-5a93-4630-856f-7237063eb3ce@linaro.org>
Date: Tue, 14 Oct 2025 17:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org,
 paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
 <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
 <CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/25 14:59, Peter Maydell wrote:
> On Tue, 14 Oct 2025 at 09:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> xenfb_mouse_event() has a switch statement whose controlling
>>> expression move->axis is an enum InputAxis.  The enum values are
>>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>>> case for both axes.  In addition, it has an unreachable default label.
>>> This convinces Coverity that move->axis can be greater than 1.  It
>>> duly reports a buffer overrun when it is used to subscript an array
>>> with two elements.
>>
>> I think also that Coverity gets confused by QAPI's convention
>> in generated code of defining enumerations like this:
>>
>> typedef enum InputAxis {
>>      INPUT_AXIS_X,
>>      INPUT_AXIS_Y,
>>      INPUT_AXIS__MAX,
>> } InputAxis;
>>
>> Coverity thinks that INPUT_AXIS__MAX might be a valid
>> value it can see in move->axis, because we defined the
>> enum that way.
>>
>> In theory I suppose that since the __MAX value is only
>> there to be an array or enumeration bound that we could
>> emit code that #defines it rather than making it part
>> of the enum.
> 
> Also, there's an argument that this function should
> ignore unknown input-axis enum values. If we ever in future
> extend this to support a Z-axis, it would be better to
> ignore the events we can't send, the same way we already
> do for unknown INPUT_EVENT_KIND_BTN button types, rather
> than aborting. But it's not very important, so the
> g_assert_not_reached() will do.
> 
> (In some other languages, we'd get a compile failure for
> adding a new value to the enum that we didn't handle.
> But not in C :-))

See this thread where it was discussed (until I gave up...):
https://lore.kernel.org/qemu-devel/873564spze.fsf@pond.sub.org/

