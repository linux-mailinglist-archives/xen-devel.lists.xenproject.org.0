Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18CB176B5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066355.1431568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZ5j-0004zq-44; Thu, 31 Jul 2025 19:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066355.1431568; Thu, 31 Jul 2025 19:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZ5j-0004xe-07; Thu, 31 Jul 2025 19:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1066355;
 Thu, 31 Jul 2025 19:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhZ5g-0004xY-OC
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:37:24 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5928b17-6e45-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 21:37:19 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4589b3e3820so13418035e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 12:37:19 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953f8e0dsm74969265e9.31.2025.07.31.12.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 12:37:18 -0700 (PDT)
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
X-Inumbo-ID: c5928b17-6e45-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753990639; x=1754595439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y2vEeS2lPC1ShbJEaLgCMuRHrSgQfyWvHG3SGN6hnMQ=;
        b=UoMwirXpWbwHTXbIiEkbVAUp+Tdm02am9VOzqR1Qj7FaqHzKBzbiHkGu1WX4AsHLzL
         jYyITsU3yQfa4MsXJs1kUYy/Ic0eX5vFzwlphok4ILwzo3m7/9U6hhNgcmH/hibD/2Bn
         20QGIsi4UMM1x5GsE8ISxKELPDIudd6r84O6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753990639; x=1754595439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2vEeS2lPC1ShbJEaLgCMuRHrSgQfyWvHG3SGN6hnMQ=;
        b=RxOvSESs8aRWoJx08SjKiilfy25ed4FzfHYWq9duQV2lljM7A1EU5g+2sWWMS/9g8x
         FHxK62F0Pf5N9Qc1YAZLdZ92PFFhnm7B/MuPVXxjP+z6XXFUPXEICqLmIAfpYt6wrrYY
         aAgE0TUAZJBIn/SfGxCa2CTan4WG++dpGu9zu+I7IiQm8GrEV7vkfgUIohxOCK0QI3Pv
         AybZoWsy2/dzbizQ0nr29kDf8N+Kqgo7mlnK3+fITfalL8a/eZ6BnhacANQm2w/6I79Y
         52TQ+DqVfou+vdS78F/E4AuYoaotK8l85Ns6PNhwaRAPhbv1QDGlPStrT5FBe5R0nhku
         X7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXWr5vZqncN7lI9HOG0f8vXa5GCwSQw2aayR3NDaKzBncj9hfJWexsI61qO3TpEkuFuG3YONWBV304=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIwyV2Mry+5micRyo/gYbk6wbdJdSStry+AHuWHMxb3OfMYzIF
	qkn5uZJ2el78aX6PnlMJhxGmpyQznq6hoEGnFAD5vcT22wDDDEM7CwQzu/BNzCugC1RwzCT3npZ
	OKw+mVg7WQw==
X-Gm-Gg: ASbGncu438pIg0wR8RRYyzdaRGRBzYrQVhecYsw2ygT4XuX4V9S1wAd6QSibo8Tz4jp
	qWo+SMh0HXsd9qzIUY2T3UuYK/8yI+7rlDFGTHRM1Re1p3L30Vc+Neji66rulXj6Panzt7gOCZ1
	frzb9NdEzh/klOLTpc7bTwDSwdIPsT59xKvPCYlerHPzxaouP1kF44VFhl0CJxHgNVVRJKskwYn
	T2NX9Ehrn5Kx3m/FWoL9+aWeNq4wVFfAvgwTn5KZYya67QWy2ZfcgKwu8vlGwln67of7cokohTi
	RhynZTyeJ/IETbpeh4B169/WSzw4w66Zyndvqks7Gs8JQ53ixtO4Qn5wTFAmFqMYoNBfj6UEL78
	61sq3cS3SpgcBhm2Dj+eB8VzKEPphTWzXZegFgG/CbA0/gnorJ1rnkA3u6LPSyos7jKcE
X-Google-Smtp-Source: AGHT+IGxb5v57EH5OHZlsOPFymlfBNP7lv0/mdFsbwOcWm0BXR6LY1SBG72IzGawEusrWaafV/R8ng==
X-Received: by 2002:a05:600c:518d:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-45892bc6f5bmr85247125e9.18.1753990639018;
        Thu, 31 Jul 2025 12:37:19 -0700 (PDT)
Message-ID: <0edde693-c2bd-44c1-8228-7bebf033221a@citrix.com>
Date: Thu, 31 Jul 2025 20:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Last posting date for Xen 4.21 is Fri Aug 08, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
References: <7372cb8d-82d8-43f4-9a34-4b60526cae76@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7372cb8d-82d8-43f4-9a34-4b60526cae76@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2025 5:05 pm, Oleksii Kurochko wrote:
> Hi all,
>
> The last posting date for Xen 4.21 is Fri Aug 08, 2025. If you want your
> features to be included for the release, please make sure they are posted
> for the first time before Fri Aug 08, 2025.
>
> Full schedule can be found here:
>   https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes
>
> Best regards,
>  Oleksii

Just so you're aware, I'm still intending to get FRED into an
experimental form for 4.21.  Several large prep series have been posted
already and mostly committed, but they don't say FRED obviously in their
subject.

I've agreed a vague plan with the other x86 maintainers, given the
vendor timelines on hardware being released.

I will do my best to get the main series posted next week.

~Andrew

