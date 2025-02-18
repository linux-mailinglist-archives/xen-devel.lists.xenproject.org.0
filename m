Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691CEA39A8D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891259.1300320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLeH-00016f-KS; Tue, 18 Feb 2025 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891259.1300320; Tue, 18 Feb 2025 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLeH-00015E-HI; Tue, 18 Feb 2025 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 891259;
 Tue, 18 Feb 2025 11:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkLeG-000158-A8
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:20:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 503bd260-edea-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:20:09 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso37978225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:20:10 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913f5asm14935008f8f.52.2025.02.18.03.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 03:20:08 -0800 (PST)
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
X-Inumbo-ID: 503bd260-edea-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739877609; x=1740482409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9/3DjAFxI/v4Ul4XBqPwJ9mqca8bUx0Fi7qKIYKz4c=;
        b=Hue3QPCvHRknLmB+t3Jfww0C0ak0TGRqM6HHDJ4IpSnLz2YNHNfHpaurTnhbkqnvbd
         vn0EcuDbQ9hyaCj6El0FxEVU/+BmriLyRLFMdu7TsASNMOj5bdHHKRniY3Gw+Bcwsq42
         5SaW+fVLxciVRPby7QFyGLZg1I1bdjXP8cZSYmYHiycSyYG71JvO7R8do2pZhQ+QW7Mg
         PLqMwbXZ1yBQL3DQ3VFIh4J8/Yij0bbz7fafbrn/j03Aoj+iG0B40EQm8chNa/dyUhfn
         V7GLUYnrWl8WKMBgWjsTq2GazcgmTToOYCMfl+p+KSB/2WsA6s4wN419wQchnRA3Zgg4
         ueZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877609; x=1740482409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9/3DjAFxI/v4Ul4XBqPwJ9mqca8bUx0Fi7qKIYKz4c=;
        b=jaOQBJMDu+qHaiHMqCZ5lsDxYj1TEWFsVwfxdpinzJFC/C57A6wE9+8uTpQjUk4DbR
         mjmPEuuLR6kYo24sSFR961ieHucejgYnBc+ehE9eW1O6pOpxSS/1YXrljYle25ld8gR5
         hQGaEwVjGY2ZQf7XKZwC90ALoH7ptIAblvTmLsp3nMDy3Yc+KBWe+fW3s2Y2ko/uho40
         7jrKhO9MPHQDUI308h4L8P6iEjsvuERVTTmhNTRE1ULBvCZgLyprPkpNRiPjaVJs0y5v
         meIFJVO5/esfOE+avM3G2mYov2Zb0GZkcNS0ZQZ9JcEPaDggBEMosFQ+YT0Hjmka86Q4
         5nkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUgF2JYQgrb7yB6K4vSbyhOKjizAW4niFwPRdpzm7Cx2VY2Zyob8hYOqwKD0+w7JyX6HCF/ZKuCYk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAh5Lee4OhHLx30b9bZx7pN5+RibKZEK7o2CWHjX5O7yY847Pq
	Iutq0jDZ7WQTPkCelqsmnvbS9eaV4UITiMasqqCNeFKrGw5oEcsB7aivKvUehwU=
X-Gm-Gg: ASbGncvVHPiPM4cDKRvB55vIy+tqH5DW4NxtXWAr2B7MNAs1ibLn9pT2oGPeBiGIF+w
	6VNbc7P9SizKDYQuonllI35lfEW+tEiJElQF3xjXtdScgAva/XG8uEWVpOkVXa8cOzDFC8FlYg7
	5oTC32OIxJp5Tf5WjTrFXtEkQ+f4JUs55csTJ6gaP36j/J5Z/4hT1oIKdwxOq15b3hZdBq/g6lh
	j5njko/OEjBQ9WB/MlsZSXvQCGyDEmjyEFy1yhaG3QlIXrmw1hR7oirUs0pqBD8PzYMJAv0vjl7
	Ishxhpiauq0n22/4jHGrVp8+bY1xk5bCmDWs6PtHfWuNg90cgwclOCerz8Y=
X-Google-Smtp-Source: AGHT+IGQ2Y/CQJvytuSzQ8bn6E1HTuNsvy6h2hib1hr/tIxCj4phhTrfkdFlTDkp4pKM2tI2/ftZfA==
X-Received: by 2002:a05:600c:1c24:b0:439:6304:e28a with SMTP id 5b1f17b1804b1-4396e5b56e7mr147751645e9.0.1739877609433;
        Tue, 18 Feb 2025 03:20:09 -0800 (PST)
Message-ID: <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Date: Tue, 18 Feb 2025 12:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
To: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250208205725.568631-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Adding Xen community.

On 8/2/25 21:57, Richard Henderson wrote:
> Require a 64-bit host binary to spawn a 64-bit guest.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 1af8aeb194..911955cfa8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -304,9 +304,14 @@ else
>   endif
>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>   
> -if cpu in ['x86', 'x86_64']
> +if cpu == 'x86'
> +  xen_targets = ['i386-softmmu']
> +elif cpu == 'x86_64'
>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
> -elif cpu in ['arm', 'aarch64']
> +elif cpu == 'arm'
> +  # i386 emulator provides xenpv machine type for multiple architectures
> +  xen_targets = ['i386-softmmu']

Is actually someone *testing* this config? I'm having hard time building
it, so am very suspicious about how it runs, and start to wonder if I'm
not just wasting my time (as could be our CI).

> +elif cpu == 'aarch64'
>     # i386 emulator provides xenpv machine type for multiple architectures
>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>   else

Regards,

Phil.


