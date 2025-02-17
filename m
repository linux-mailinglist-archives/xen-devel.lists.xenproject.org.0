Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315DA38904
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890639.1299781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3sZ-0004AA-Is; Mon, 17 Feb 2025 16:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890639.1299781; Mon, 17 Feb 2025 16:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3sZ-000497-GG; Mon, 17 Feb 2025 16:21:55 +0000
Received: by outflank-mailman (input) for mailman id 890639;
 Mon, 17 Feb 2025 16:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk3sX-000491-Io
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:21:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4995c70e-ed4b-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:21:48 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43967004304so21512835e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:21:48 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398a64febasm18875315e9.1.2025.02.17.08.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:21:47 -0800 (PST)
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
X-Inumbo-ID: 4995c70e-ed4b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739809308; x=1740414108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vXrdYPv2/LleVJp730elhgBpqwjFwXRO3KAxyuuSej4=;
        b=EM+QqoCUeN3EBsursbYA1GSZyRi03wpL5on9zEdZ4fWWv0/B2dYVOJH0gfXb8YeqqD
         hi+a9tinEHQnVnXzTE1O6uEA7W/yZvyZt/Ac7BWhwEJ0rWuQpxmOW4g0h7UuMIq6izJt
         UPrdpxTjErU4Qt+M7CfFgYhzX1Vo14V+GBdhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809308; x=1740414108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXrdYPv2/LleVJp730elhgBpqwjFwXRO3KAxyuuSej4=;
        b=TIwBBRp2rmV0QplPWTEWfzeGbphpkp3yECJFwhcGl/EDGL0B0/dcc+2SUQBN6pGZ6D
         LbACZgqRl//0dAMGutIBdgjCi/LM3NI9uuI0GsiWN0j7qCM4AEyhgwTiaZLj7qjpwbsa
         Bq0q8gM4sFXiArFP4pE5I4w332xZfzAqYMQeovBjSDZ1maN3PRIMRYp40mVTXfpU6c1D
         QtJG5kJ2KWViuHPSTyVYj6Z59Fq5lGi9rr09JQbPwRJ+m4vKN9xU0ivnp/yx7g8PqSoq
         8zybehsJYcmgBvIE+/AWM3qBYihA19bCXiDtVeY1YTMX7HHcpnAX7SpFAZgMYJGGvAMu
         7dNg==
X-Gm-Message-State: AOJu0YziWbbKWH9tFGJCzRP1ref0bVCcFVu7yzjM3gx8gtMwEtU/Zj+e
	eimecTrW4iXTClgt/zWUnt8zr6cKv2uTakDqNgcKt7EoQpRir702b87eTYWyNSU=
X-Gm-Gg: ASbGncsyyhFl852TqYItj5nmbRQbn1yPGQfIS7+XUGokNQw/aEIgK4Q3l/JPonGyF1B
	WUXLXz0LUfh3Q+wsqwnTG6HHB0G3gH1fVS+bc0+6uwyDmIifg7aMUjzHolBwposwdH06HsRE294
	Cc5ItexvNTbdvKQpJxhj23g2lXNj8E6WzKFmRdqVVxWX2aYTfsTVc64xgeZfR2bzL0oYGxrS3z2
	L6dS+Sban/WjXWQk41aREEJjCn7K1Y5KL62uYAwrrdp2iSVXbz3kZ78dGYu5u0r5+G2Rmak5YYO
	tj9/nhHUn4XzQ5ovMKIHaMrIehGo/GMqgR9XEhXVJ1uIJuy2C7QXqGo=
X-Google-Smtp-Source: AGHT+IG+8E1+DUOgRCFgh2GhzHZuoFQQPuhDXWgR6W+hJ9IftfsPfvE4dArYgnVu0VehsTrB4Q1SHQ==
X-Received: by 2002:a05:600c:a4e:b0:439:88bb:d035 with SMTP id 5b1f17b1804b1-43988bbd4bemr28986495e9.5.1739809307957;
        Mon, 17 Feb 2025 08:21:47 -0800 (PST)
Message-ID: <d4608684-d476-45ae-bd1a-c007cd9e4b14@citrix.com>
Date: Mon, 17 Feb 2025 16:21:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Add option to scan microcode by default
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250217160844.3164003-1-ross.lagerwall@citrix.com>
 <6cf4fc56-5798-468c-b1c5-9ca7c5398503@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6cf4fc56-5798-468c-b1c5-9ca7c5398503@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 4:18 pm, Jan Beulich wrote:
> On 17.02.2025 17:08, Ross Lagerwall wrote:
>> A lot of systems automatically add microcode to the initrd so it can be
>> useful as a vendor policy to always scan for microcode. Add a Kconfig
>> option to allow setting the default behaviour.
>>
>> The default behaviour is unchanged since the new option defaults to
>> "no".
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>  xen/arch/x86/Kconfig              | 11 +++++++++++
>>  xen/arch/x86/cpu/microcode/core.c |  2 +-
>>  2 files changed, 12 insertions(+), 1 deletion(-)
> Please also update the command line doc accordingly.

I've got an open task to fix both the cmdline and sphinx docs WRT
changes in 4.20.  I could do this too.

~Andrew

