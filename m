Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC62AE3ECD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 14:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022279.1398066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTfpg-0003Lk-Ec; Mon, 23 Jun 2025 11:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022279.1398066; Mon, 23 Jun 2025 11:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTfpg-0003K5-BW; Mon, 23 Jun 2025 11:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1022279;
 Mon, 23 Jun 2025 11:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=63EW=ZG=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uTfpf-0003Jz-Ar
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 11:59:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8201ace6-5029-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 13:59:25 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2217862f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 04:59:25 -0700 (PDT)
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d128cf7asm9177773f8f.100.2025.06.23.04.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 04:59:24 -0700 (PDT)
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
X-Inumbo-ID: 8201ace6-5029-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679965; x=1751284765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNl0GNUoL+pUzh6aZuBV7rBwC2JelgKVfHJY1PQe040=;
        b=gA95ZJ8vDdAHuoHobuijCq8C36W5UJft03I22kMwyhf7hUWf7UWON/zY1iKXXXV8Ml
         sriNKruOaKlrj4n8qiiDOjlp4YRBxeSK4nxtZ5eQBAvKTTFbMeMrFue9kbkChYdWVeCB
         Uzo5F67Ztlclo8Z60qCi81bZHb2phyGIYs/CB5w672inB5IjvF6LoUJMX2adg6EKAfFR
         /1NUIGcVX8J5zJz7vblDwwezNp+xyUmgPhXw9BD4J3rxCmTgNLayh7qEIH2zwHggMNdq
         x3eNjCmFpqfBmEhorD3GVHfyMWCvAc+TYhGpd31wMoEBwJBWipsmLPed2Ft444SThxNe
         aZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679965; x=1751284765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNl0GNUoL+pUzh6aZuBV7rBwC2JelgKVfHJY1PQe040=;
        b=ZEuRUhkjmSbO9gys1x32EkhI9hBanAIsrnb/fE2RkwCKkYLobqdmNR9E83xkiCmIMF
         Zzd9zRm7nal+JalbVhtvbcmw79H8+Yb0XOMJr4YolRC1O4ldNDXs21WLJP5mXDhw0/JR
         dMhGjsVxXOHKLVVHRvwccUIIi8+vw49MqpeVWrytIfMnsjBrOj6MKN7QwAMKMP/hHDVL
         vQbayAxOyW1vtc5BYIKcMdzqG/Vkzz/apMuEfnWq7yaKUXR5LlOhzI03pkr39lO4ss2l
         NQ7Jyd5469Oh5KzYv0WqqggeG63Nr6LEfsbpSRYfp/FT/4y30+Z7ElQkNKmS3t1tckOA
         B4Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXo3bUScpo5ANwh+LNZmNKq2jiUOkuNVNIbqM2qDHIzZnIRyeLqUMvMuFcIeWAaGzi9sVKEkuogURc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwymbXKvQ6UTj8Pk/D9TZg1A3xxWu5jBdNsIuM3HzHknHwjFFlO
	/PkMDiC1FqYLUz7zL/SBdet0xTLeEZbBgRrN+yPfxElzAHDb33334lkjh9A4JasxPxY=
X-Gm-Gg: ASbGncubpSjv4IKZjLJyi5Zu1tjngL0P2A4YOYlGODCMDwea7l1dtG8hRCxIAycL3rc
	y5b+m4Ew0YqEHbodt3h7MQ80/YoBRJ6Ne80kqzApW5FErMhlxnzYJdFgsm52QfQ8AJzi2/QazCe
	CwoSaIniKUD6wdVGtBrsgdOUtQy0AL4os8hDEnQofwthQ80xTfOq1An5Q1YocldV6/hhWasHTD4
	RFwSU8N9nWhA3DyUfcOJ2+1m503AjkE8AKog3wpOdH4EtFtMHEk+rgLvlnBVGZ71fnDLMGNxTDc
	AdYFQp5Y/RtrHRoLYwkllSjVuDMXTfj/DJH/mW6jkZUKyh1niJ5DE5VnvRb3+mCuT11CPUiarrn
	mCZ0aPA3Dlodx1k4ptBXt6Xj1apBkxxIs74kZHDQT
X-Google-Smtp-Source: AGHT+IHOxtkdXSM3EMBB+rtXAYT6HLDRhKe1XTMmCY2e3R+6NO7I2w8zqwom52rHbrwAtgyuUqWVsQ==
X-Received: by 2002:a05:6000:2010:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6d2799df4mr8969438f8f.9.1750679964791;
        Mon, 23 Jun 2025 04:59:24 -0700 (PDT)
Message-ID: <be71c7cc-a5ba-4ba5-b697-60814b712eea@linaro.org>
Date: Mon, 23 Jun 2025 13:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] tests/functional: Restrict nexted Aarch64 Xen
 test to TCG
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-24-philmd@linaro.org>
 <497fc7b1-dfd2-49ad-938c-47fca1153590@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <497fc7b1-dfd2-49ad-938c-47fca1153590@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/6/25 10:11, Thomas Huth wrote:
> On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
>> On macOS this test fails:
>>
>>    qemu-system-aarch64: mach-virt: HVF does not support providing 
>> Virtualization extensions to the guest CPU
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/test_aarch64_xen.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/ 
>> test_aarch64_xen.py
>> index 339904221b0..261d796540d 100755
>> --- a/tests/functional/test_aarch64_xen.py
>> +++ b/tests/functional/test_aarch64_xen.py
>> @@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
>>           """
>>           Launch Xen with a dom0 guest kernel
>>           """
>> +        self.require_accelerator("tcg") # virtualization=on
> 
> What about kvm (or xen) as accelerator? Would that work?

IIUC this tests boots a nested Xen guest running at Aarch64 EL2,
and at this point we can only run EL2/EL3 on TCG. HVF and KVM
can not for now (we are working on it).

I don't know if Xen can accelerate EL2, it would need support for
such hardware (like the Apple Silicon M4). Cc'ing Xen folks to
figure it out.

