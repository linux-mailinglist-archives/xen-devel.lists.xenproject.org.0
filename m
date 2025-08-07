Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B264B1D3C4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 09:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072611.1435622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvTq-0001Ap-Vd; Thu, 07 Aug 2025 07:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072611.1435622; Thu, 07 Aug 2025 07:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvTq-00017i-Su; Thu, 07 Aug 2025 07:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1072611;
 Thu, 07 Aug 2025 07:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujvTp-00017c-BZ
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 07:56:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f402f71a-7363-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 09:55:58 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso3981635e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 00:55:58 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc7e1ddesm156656235e9.27.2025.08.07.00.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 00:55:57 -0700 (PDT)
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
X-Inumbo-ID: f402f71a-7363-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754553358; x=1755158158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nEMcmnpHrFAOesTiTDli2fYT6swwWQr5YYAZmRyFD9o=;
        b=T8x3DYD/Blt+h/udVJ9Y3MwqXx1USoWlhn8cgvA5uCdyJOsfdsxuwxqrT7ywkZzi3/
         WdUhZ9FRV8perRdZaip0ZjnMvPQ0qEFl0wjYmOqX/UxQRC3WR5QEpJof9lhXfKykFagD
         DYgk5RhUCU5TzjXEkLAYnPl2uhB86uADVmiQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754553358; x=1755158158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEMcmnpHrFAOesTiTDli2fYT6swwWQr5YYAZmRyFD9o=;
        b=A2qQWdphVm/o9ebiJ/WOl3Z143SUlyBkDQh06xPaFD2h58duwATsWmvoKw7Apezjsz
         POkP5ori//4p84MqCnQFKFbtJ691DfcAHe5zBegVVAA6ujOt+eWUcFrlvoAo5+vMAGwR
         QLPXSVkqvPKw/odhy28zUJHKZGTVGGnLrdzdfx3Gj/QnUhL2RlL0RxYMHgwGkEVNoMUq
         2W658Pqq3i5/w6X+g8VSYUmtxD4XpjcT3nkIwYH/RC+EKvts4MRb/sWlJvfIeJo+u5Pf
         8QOdahJR4JZ/AjbpOCZtDfJol5AqqnU/2QSQFW3+b11yJ5dPsA8pUYvhNc/CVlgdaGHD
         VUXA==
X-Forwarded-Encrypted: i=1; AJvYcCVR6hF5Jic+rNh8sA+pm/4t6a+y7h//VF0AliAjfDqhhvd8mPQ2kBm8g+DmazGHucFnlRVca4BqUXM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoU2A52QufMNWsIECS0DVJP0RtvYkHHHiIGIYxNah8vmZySHAk
	wTptrT7r/yKMH1gwymoGF9SqhtaaTfPw6nAHTLlIaGe3Sxzad2780ZNvwOUalWf7BLc=
X-Gm-Gg: ASbGncuFKTUyRw1kfUoGMHQcsqzwlSxRFcMl52vtaGEy3ssHgEs3Vadk8PxqFczTe+a
	d/kpqBe9a+6GH1R1moQNO8kJ+Pjv82C/TrInqBOvXi5joz0gUeMv0i98b8JVO9C6qifBL+S4C7v
	4xUPeANqlTrER1svdPuiOZiTwyxh5z302uTM8ec12CAR69avkCTQa8a7/E743UXUQ7KuraCT6UA
	9JdeuVwqQmjvVfq0dKNb1ydU80mXLfnEWZDrkIwhHoB10DsMW29aDaJpzpBt8NjXbd+fsLFPYiZ
	TQnkFgyVu3dtK9rIrqRWhloZvVsHzSePPip2affjNYt9M8YlHOaaFNfERQarjtz9xEdKm6OTz3U
	JtSIaO6Y1MLlCS6bXWd7z5XHf/4+7x8BmPyJ4oX7Lqvl9sUM1KGWKRDdqZxXD0CCj9G8d
X-Google-Smtp-Source: AGHT+IH5rIaExvGkg3p7reLEuIRzx2faKnmmL/I1kd8IbrVMTTyRYvXbEucR+loO3+IC+qNP90cQNA==
X-Received: by 2002:a05:600c:5494:b0:458:bb0e:4181 with SMTP id 5b1f17b1804b1-459e7090fefmr58141465e9.10.1754553357712;
        Thu, 07 Aug 2025 00:55:57 -0700 (PDT)
Message-ID: <461423ec-9c34-4df6-a073-d1e4c78badad@citrix.com>
Date: Thu, 7 Aug 2025 08:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts] Add debian rootfs artifact
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250807000318.2284283-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250807000318.2284283-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/08/2025 1:03 am, Marek Marczykowski-Górecki wrote:
> Will be used as dom0/domU in some tests.
>
> Install OpenRC and setup it to start /etc/local.d/ scripts so tests
> don't need different cases for Alpine and Debian.

(Yeah, I got this via CC.)

I was just thinking that we needed some non-Alpine testing too, but for
a different reason.

We have systemd configuration in Xen, and changes to it, yet no CI of
what is the most common init system in Linux these days.

What would need to be different in tests to avoid OpenRC?  If it's only
the script to start the test running, can't we just declare a name, and
arrange for both init systems to run it?

~Andrew

