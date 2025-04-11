Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32679A86753
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947877.1345492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L8P-0003nT-6W; Fri, 11 Apr 2025 20:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947877.1345492; Fri, 11 Apr 2025 20:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L8P-0003kO-1X; Fri, 11 Apr 2025 20:37:57 +0000
Received: by outflank-mailman (input) for mailman id 947877;
 Fri, 11 Apr 2025 20:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3L8N-0003Gz-6d
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:37:55 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7809178-1714-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:37:53 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so1996066f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 13:37:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979620sm3107518f8f.52.2025.04.11.13.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 13:37:52 -0700 (PDT)
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
X-Inumbo-ID: d7809178-1714-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744403872; x=1745008672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JzBENLeE+61Pc4t7dtnNaPo2e2yH9jenXq3NFXWnvOg=;
        b=AhUkkQpoHnoAbtM6rjzNvN7niUZcEN1yh+zsaxiYh5zDzAOWo2gLYMX+PeF9syVYjr
         MLMp+R+VjBRfjKLNxx3ljAi1eOd7N3zRuQJzLKfpPi+wJN4x3Y625lqTkFBzUk07Udjo
         mvusJATyYDF85NDZOo1yR9uEt5Lm2CfxhhTqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403872; x=1745008672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzBENLeE+61Pc4t7dtnNaPo2e2yH9jenXq3NFXWnvOg=;
        b=OQQ0RGTyUOWBeyy9vDut9k0KjfsXQQLD3AqjlQGZ/2hVAdIFsV2SkX6OiHuKlHoxRk
         3IkhqZNKsUka2GLzIWVoufEurM2PwYI5ErYzeOwxuDSlOJZM1GRqaUEb/YiuooRzqn7d
         e7OSpBW0jNHFb6lNkK/ZOLk2GAfVcI6GWEqvkoT4tlai7JD8SzsRBQOZysuywQO4KLsj
         BREtn9TcoU6hD0Mb1cArFh6P9dDT60kfi7PGjOwhtpimoOk3cdJYsOGRgj7P2crLZlim
         L0l8BnWBb4t7VhUjSWEqFNRb60pqfWQcxrtVjLZehwtIuQv4dKFOMRuko6E+zR2VWbRv
         44vA==
X-Forwarded-Encrypted: i=1; AJvYcCWsxhTmBezDPf+UjYsEIUTLL2hAgA79z4nvbi5aQbbGS3ijVSUIVHTvJvx6LcJRM8e1tAou/hKz6Oo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwGLCREbSYm/d6M5ezFhwUsd461B+NWs9Fsp4AHHoBpGQoQoE2
	CBocA1hJJltA33B14BEDRCTxiXjp1i37mk9ldhm4vjcEmVYt6Rw6Wsh44N2Is1Y=
X-Gm-Gg: ASbGncupEgGMWsQfY2qjOvWy7s9r46ATYqhiGA/cl36c+M6qiT0eQGgZBrMcrA9WHHJ
	OwfR8Wx7NYma1zY4bSatS+Uhr18ZNHYj+fHYo9BjgpXmiwW5UA/Z43wAzNLhqKsfYeCwF3bqB8e
	psTmfqFMuRl7r4UqcEqIumjAoju2j1dD9k5zYrmwy1tOz9iTO3AnCacx2j0WxK63AZK1jzJrs33
	rTExUiT3n4Ek+yLkhFHNbOl0ZJ0yQS+YRKiPUcgVTEHWSJohSb4uyO7+Dk9levlBdjFnPg5FSqI
	dRgZr4yXc8smAZcKoAsLX8WaKqSr9n8p+zJJ5jYWYUdq9RCYbHzu0/yZm9b3tMLmBT7zT7OSc+y
	0t5JaEw==
X-Google-Smtp-Source: AGHT+IEaNCgRQGqbTgs9ZMdxnWmnLGIrTtyufmQWly/IkKrDebyAc/AomGwyOIQj1UuXjFBHnKe15A==
X-Received: by 2002:a05:6000:4205:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39ea5201388mr2692321f8f.19.1744403872498;
        Fri, 11 Apr 2025 13:37:52 -0700 (PDT)
Message-ID: <108d72f6-c384-4d80-b354-9115c1bb0355@citrix.com>
Date: Fri, 11 Apr 2025 21:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] CI: fix waiting for final test message
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <ad1db17ffa1883b1aa21a8480e4fb628a6d0c929.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ad1db17ffa1883b1aa21a8480e4fb628a6d0c929.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 9:32 pm, Marek Marczykowski-Górecki wrote:
> Expect normally discards initial part of its buffer after matching the
> patter, before looking for the next one. If both PASSED and LOG_MSG
> happen to be in the buffer at the same time, depending on their order,
> only one will be matched and the waiting for the other will timeout.
> Example expect -d output of this happening (parts eclipsed for brevity):
>
>     expect: does "\r\r\r\nWelcome to Alpine Linux 3.18\r\r\r\n...\r\r\r\r\n(domU) + echo 'pci test passed'\r\r\r\r\n(domU) pci test passed\r\r\r\r..." (spawn_id exp4) match regular expression "pci test passed"? Gate "pci test passed"? gate=yes re=yes
>     ...
>     Gate keeper glob pattern for '\nWelcome to Alpine Linux' is '
>     Welcome to Alpine Linux'. Activating booster.
>     expect: does "'\r\r\r\r\n(domU) pci test passed\r\r\r\r\n(domU)  [ ok ]\r\r\r\r\n(domU)  [ ok ]\r\r\r\r\n(domU) \r\r\r\r\r\n(domU) domU Welcome to Alpine Linux 3.18\r\r\r\r\n(domU) \rKernel 6.6.56 on an x86_64 (/dev/hvc0)\r\r\r\r\n(domU) \r\r\r\r\r\n" (spawn_id exp4) match regular expression "\nWelcome to Alpine Linux"? Gate "\nWelcome to Alpine Linux"? gate=no
>
> Fix this by using -notransfer flag to keep matched part in the buffer.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citix.com>

