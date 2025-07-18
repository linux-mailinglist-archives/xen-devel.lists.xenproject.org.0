Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5813B0A1A7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048544.1418759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucj19-0006pQ-S8; Fri, 18 Jul 2025 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048544.1418759; Fri, 18 Jul 2025 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucj19-0006mJ-On; Fri, 18 Jul 2025 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 1048544;
 Fri, 18 Jul 2025 11:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucj18-0006mC-42
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:12:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e3b4c46-63c8-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 13:12:40 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45610582d07so15403985e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 04:12:40 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c9edsm1548426f8f.88.2025.07.18.04.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 04:12:39 -0700 (PDT)
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
X-Inumbo-ID: 1e3b4c46-63c8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752837159; x=1753441959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IUiPAV6dh1JeUnIjgSWjsgzl5lK+43Ay2ut4mLRh6wA=;
        b=gXcLYYtzo39tyGwBWqzfbXoDjqviY91vY4AKvrc5OMzyA+bBmLAzAGEfXdM1T6Uq4c
         eMGT7XAPojK7ExUX16vaNUyGJCII1925nT28ljQCPF7h/OiYz2LpmqbB8cb1fuF55JaR
         HSJvtwo2pBVhDkhsnKo47bJHhKREPtQkC8cZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752837159; x=1753441959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUiPAV6dh1JeUnIjgSWjsgzl5lK+43Ay2ut4mLRh6wA=;
        b=fb4JxdkRkNf+RDfHWrtM6nlwnKzReP/4jmjAuzMBz3i1a2mVMt2NHmFT2FGfYI57LG
         X75Kg08V+3xl4usRxuhTICjtUEYNOOLqHcKZcyeEVDwC46IVk1xVb8HDPZ4MJ51dS+w6
         dthBGd5o4Y6oFK4Fz5XW74Wk9FL3exAzoyMOJrOXU1sJCU/+prApZgP4T1YQZM6oplbn
         GfWc0/1Xi5nEkOJZ/p4EfJOiNTHPhVKUvg90uybP65QFZ0ct/K4bbNN0Hqo3BRqOF327
         gP7/I2gASIBUZ+BTjjdXYN8UhkQEXeCsn7jWfQiCKoKur/HmjTYm9SMwXHU50GJysm/t
         vOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuv8YY+O1AHw+bX4VvOimO3QVLZ9CnwWOY43UJtq8wIHYR16pypA6W3OUbxrDCux1QnmLhT58q7Z4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQbdL7j3Zv3aYAlV0KRwTOTBJtTpmIWnKzOY7WDwucr1coaOCb
	6VkJXb78PMmWAGvzPN9iXjhH7gxFf0eaQRTn53crLwDAfHq2wXbt38DT14GtTxt7KfQ=
X-Gm-Gg: ASbGncsHZ1x48sufABZOyZqcf+7ggAy7s9M20wPb1DW+9lMm3mxFKEbuTC+DPI8hRW5
	3DRosu0D/ZUNWvRLCmLyKzzQhIeMBmB0rggj39TQMJG+BRbZsr08OfHaT1A8Kt9c/SPwqZBr/+x
	ZcwJGqadzVJGewPA/WBxgEqF+ovUs3bMzm4a+jsIYpnETaaDX6FRT5d8aNtd4rf6mq812DkZLwg
	RSDNHl7vO01jW2ITYkyzMpFdPceA5E9BJQK//8NlbegqhbHZ/1JOaNx5qeHZ3hzmSD69fgKyw+t
	cyMo3TxBba/gIkG0W/rIp4XxJvovV0jKPKFQQzEwzNGDLpqs6QSiyljtgIRaU2wltdEaXWfEmr5
	Y4W6TTGCCiz9CJHYZv5/WcdZx9YpQb4CB0nsAqzFpJaFd3R5R7hIw4QAOVrvUyRjse/g2cYVGnN
	57YNM=
X-Google-Smtp-Source: AGHT+IHcXfZvKIO1laMAu8my27XSKZ4oDlvrEhs/jg30uKRQZl+wyicWN1uYkT/keajWkJJkwmMOyw==
X-Received: by 2002:a05:6000:41e1:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b613e983fcmr5170508f8f.34.1752837159505;
        Fri, 18 Jul 2025 04:12:39 -0700 (PDT)
Message-ID: <a0e250fe-8b88-4c54-8554-1e488bd58c28@citrix.com>
Date: Fri, 18 Jul 2025 12:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Reuse PrintMessage function
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250718094139.19351-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250718094139.19351-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 10:41 am, Frediano Ziglio wrote:
> PrintMessage function print a message string followed by a
> new line.
> Move the function from ARM specific code to common code.
> Reuse it in EFI code.
> No functional changes.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Please no.

Hiding \n (or \r\n) in strings is an antipattern and a source of
confusion that we do not want in Xen.

Instead, delete PrintMessage() and convert ARM to use PrintStr().  That
looks like it was premature anti-optimisation.  You save 4 bytes per
string, but it costs 12 byte minimum in .text to set up the function
call, let alone the function call itself.

~Andrew

