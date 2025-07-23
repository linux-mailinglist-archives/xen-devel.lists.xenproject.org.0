Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D4B0F3A5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053976.1422748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZLZ-00077R-4W; Wed, 23 Jul 2025 13:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053976.1422748; Wed, 23 Jul 2025 13:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZLZ-00074i-1J; Wed, 23 Jul 2025 13:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1053976;
 Wed, 23 Jul 2025 13:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueZLW-00074c-UJ
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:17:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1d5ef8-67c7-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:17:17 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so73568775e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 06:17:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458691aaeb4sm22971035e9.22.2025.07.23.06.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 06:17:16 -0700 (PDT)
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
X-Inumbo-ID: 5b1d5ef8-67c7-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753276637; x=1753881437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f+QpP2ro68bVMO/LAmkxo9hp+vP5WMt8o2p0sui87dQ=;
        b=gqpUnjStyORfMuWWhAoEgit+BkJgL0h4oGyWz4wILbOisA9m95ZZctNw0vzkW3AIzd
         JhHFfzkd22p5w6qBNLZPuQ6BlM5eAMdibY9Uy/hgXpY3HcwI9d4Nx9GMXxtgZemsCVW4
         uxJv75P8lIyx5M0WQaHEd2ln7eRurEzC4A1cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276637; x=1753881437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+QpP2ro68bVMO/LAmkxo9hp+vP5WMt8o2p0sui87dQ=;
        b=vx6/XPfYPMGAG+EfxwUw4OisA5l8rlKYTSi0kbw2/R/5yy+uvPY5RFE2cBMWgGgPLQ
         gZKwjsCMYT3zMMGX8f1b2UoKBmJ9cB1RhAGaiJzdf8ng+RyYTPkAe1+BuUV9QLD+Cq37
         YyXTx62qThFxdzsy8yA/2KPHBE8FWuWWDlV3kclb05wHqrTtHFDQbKElaTbmaKMIsTtf
         4htayV8H/EweeiebAImbcovVacwPgw6NxK7iNOiI9rZvOJWgL/aosfxjCcaIl+CouF27
         WW3iqYGRIcsp+4VSndOlgIU0DEOEPyMY6TnDOD96PHzjfmhJg3bHW+WJx/+yhJzsBFHK
         PDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXymRQcm7+qQSDRd3biA+KHWAoXSPHZprC2CEEoj+H5FPkjtQbY0zBZLVHRnQ5sJzwI5yYZoMvxT6s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZz3xCr+SGTr+4z+h8HcW8As+9T4e5tc4/7JduzupxrViB5xIw
	35W4GGCO0OVypWz4a27TJ9SBcVqqJU2PxtPum7VKT2GDdOkxM7dL5Oth+STkuHx7sTc=
X-Gm-Gg: ASbGnctyy+erNNI4hWWv9uU4t37+Ca7TdouhLe5RsqPmnTU7/wiy3zR/W3Ba7fcDuBX
	YyB+bKzGzECaWaTzW4EmcKYOxB2Y7t8bYIS8CTMy0R1KR7mUcvTWCjRVvOlkHAwmSCgNZE9I92t
	mg4pTGhtpyV0jPvL0EiSfi/LZyRv6Fwi9HFuYkaEj69fyHQqx7RXe502GlX/T1pmU2H9fFvNwbt
	vlGTUiIdHB6BaIPS+x3NWL3qsuwzPpgNBHfrbAuiPhPQms5LlIVCaCKMuj9StEyjTe8lbtjMkMa
	0HrD0LJCmiViUlSGlPRRLNtBWxQ9wg1fL7Nz7ic2bjBwwZ+rtfaZKVgw8EACOFXiKXDW6tTOwS1
	witr9ztBHPtdYeEpjbv7mjKzrqH4OYOMOkdIEFA0xkZkWgiprcSCRkjCm+d2+ZYn7OYqD
X-Google-Smtp-Source: AGHT+IGN5HPy6j/2h4Xk6CzJZfU3XBSqRiTfjBtu06Jpl7gJRgJxuhCgXcTA5gepNXtTswWLMnERKQ==
X-Received: by 2002:a05:600c:8b71:b0:441:b698:3431 with SMTP id 5b1f17b1804b1-45868d67841mr23179825e9.28.1753276636816;
        Wed, 23 Jul 2025 06:17:16 -0700 (PDT)
Message-ID: <40bad17c-7baf-44ae-b845-bb19b5aa83f9@citrix.com>
Date: Wed, 23 Jul 2025 14:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PCI passthrough of XHCI on Framework AMD crashes the host
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <aIDXIqA4L7wcJH2T@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aIDXIqA4L7wcJH2T@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 1:35 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> There is yet another issue affecting Framework AMD... When I start a
> domU with XHCI controller attached (PCI passthrough), the whole host
> resets if there was an USB device plugged into it. I don't get any panic
> message (neither on XHCI console - which is connected to a different
> XHCI controller, nor on VGA), and the reboot reason register shows
> 0x08000800 ("an uncorrected error caused a data fabric sync flood
> event") according to [1].

I checked with a contact at AMD, and "data fabric sync flood" is a final
emergency reaction, and is a "stop everything" action intended to
prevent further data corruption.

The hardware is fatally unhappy with something...

~Andrew

