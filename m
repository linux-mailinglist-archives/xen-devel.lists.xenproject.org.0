Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA099FE91B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 17:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863530.1274899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSIqP-0003Et-4W; Mon, 30 Dec 2024 16:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863530.1274899; Mon, 30 Dec 2024 16:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSIqP-0003D6-1G; Mon, 30 Dec 2024 16:42:17 +0000
Received: by outflank-mailman (input) for mailman id 863530;
 Mon, 30 Dec 2024 16:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kngX=TX=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tSIqM-0003Ck-OW
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 16:42:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 033b5395-c6cd-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 17:42:09 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso63219465e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2024 08:42:09 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a457584bcsm12989464f8f.89.2024.12.30.08.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 08:42:08 -0800 (PST)
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
X-Inumbo-ID: 033b5395-c6cd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735576929; x=1736181729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeKnEKsR0+uOT+NFBKBAtZvitld2Kqz+mQfzQ7jeZOk=;
        b=GQCSsH441/oBh0IRtmrs5SmqrYnJVbRHvpHHU5KfrDrC78dktgaqSubd+CeEbqUz1Y
         8v0Q80XN1eBfXs/xFnzF8sDA2+WAmdWuJIWzToebywrQqSd7Ne+HGkyUga3tVhjoxo42
         ri2bnNKTNESoGGvRnI6+6Q4gM2GvqaoU6hzrsHDM4oYfit18J5W4a5lthg/D8hwQk6RW
         33bawgpLRvCI+l9oFpitNe5+ZTeue7YUqc4ASPW/XuMO4mNuJ2GFifol1Q6+588UPOnD
         I4XWUuroNZ4zmSne1X+1XkFmDcl5qEBKBf/hHy0kBmEY1DkdEB4JKXK5/kWGqiRoCrHR
         L0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735576929; x=1736181729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeKnEKsR0+uOT+NFBKBAtZvitld2Kqz+mQfzQ7jeZOk=;
        b=Gz0znwLSoOhhRNfjB6pdWj9FRozxweeNg2KhLdsDCOn0R972i0XioBHwIPYlJvUtuM
         n4yRBWA4lg81Mxd+rHqdNzL+SwKz3gDEimLpxXfX58iLCAuWbjgMQliChzAsTNX9dVJh
         Kxx097HE4wPEgTkXtj8kJCQVycsol2lgumHQ5JmD9THn9jHceVa9C3PQfWBbqO5Xzs6z
         vNRAscbLVnnNr1LGJO9y0Zt+eVRdhdrL5T1fwAVYNsJKOjQP2TIcWgVIvssJ9tjb87Bs
         afhbKajBH+sm1WY7UwASnokgVizvVtoT2ZOa3Oe1s+uiyzZgoAunAAQsy317Vo9BVfPT
         aCag==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9R31LkCz/llF5syKqh7k3g42vHM6nObHcET5q42+Wefx8bTD8Ehe2NSFTxQVliGchOtHBWhG0w4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhKVlLqs+t5GSsTQ/hYo5XxXVU1wpk7Sz6MmX2Zb2dJbrl+/b6
	dP9F/grdZrwCLOwsoibT4cXdXrDu+GUVFmE3BjylgiI1/cPiyYYghaGkKX8qIKM=
X-Gm-Gg: ASbGncvCoQdNRE5kPOIY9xPCed5l0Ifs6OgikxLyfvOB+cm0Ld2m/HdtT1Eh9rLpkfW
	wmOnStai8qvaujbcuXmM0RK5wL1GYA2tcGGtwqrT4dYGi2OQwwEKiWlr1qWDzJvacT1oN2SON2S
	/h6lyWRkpeLpF6wAyd7PWI2b2qoRuRu5kuGZ5Q2IFzUT3ZOlKviWlNMliwocjcj7mEB5Ju0hooh
	Ie8wzy1lQYXhNSlggmWvM/QVsouVCA7M1mmm6/dS+CGiv1xqueCRNlLpZT8OEBjxniRjQeCJ540
	3qJTSEMNoePyxRfODIXUwv6L
X-Google-Smtp-Source: AGHT+IFSOfue9OZ0StQtjpEHd7pGzqC744lEPd6nwbKJP91hf+X3OX90JKPSuYktgpgVYlnNiexKGg==
X-Received: by 2002:a5d:47cf:0:b0:385:ee59:44eb with SMTP id ffacd0b85a97d-38a221fa9ffmr30615491f8f.33.1735576929176;
        Mon, 30 Dec 2024 08:42:09 -0800 (PST)
Message-ID: <20fbbcc8-bf6d-44c2-b904-be52debc1f8a@linaro.org>
Date: Mon, 30 Dec 2024 17:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] hw: Mark architecture specific devices with specific
 endianness
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anthony PERARD <anthony@xenproject.org>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <huth@tuxfamily.org>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20241106184612.71897-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241106184612.71897-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/11/24 19:46, Philippe Mathieu-Daudé wrote:
> When a device is only built for an architecture built for
> a particular endianness, we can simplify the device to not
> use the "target native endianness" definition and directly
> use the proper target endianness.
> 
> Philippe Mathieu-Daudé (5):
>    hw/i386: Mark devices as little-endian
>    hw/tricore: Mark devices as little-endian
>    hw/m68k: Mark devices as big-endian
>    hw/openrisc: Mark devices as big-endian
>    hw/sparc: Mark devices as big-endian

I'm queuing this series, better to test it early in the dev cycle.

