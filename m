Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51466A71813
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927864.1330620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRO3-000777-DH; Wed, 26 Mar 2025 14:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927864.1330620; Wed, 26 Mar 2025 14:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRO3-00075D-AN; Wed, 26 Mar 2025 14:05:43 +0000
Received: by outflank-mailman (input) for mailman id 927864;
 Wed, 26 Mar 2025 14:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txRO2-000757-Dl
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:05:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 663fb15d-0a4b-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 15:05:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so54544625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 07:05:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e65e0sm17222226f8f.61.2025.03.26.07.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 07:05:38 -0700 (PDT)
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
X-Inumbo-ID: 663fb15d-0a4b-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742997940; x=1743602740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cafV8F5fk3ODPRuNl0QQ4xMCrm493oADg7WVkzKyP94=;
        b=X55/GwgUKbEqrZZfXTvKDu9H42NY8BOxoY/EnHEYOWWtDw85FsVqzCghTcrbyOLSq9
         /z6B++gnuXDFKJ6foEsjv8qcUqKr4JLO26rps7Tqm5Wsgob9RcJXSo3jsCu8FN/nnDzz
         4Zylcp7c/7np1ToIuiFpntFu8fwiq6X1nCRZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997940; x=1743602740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cafV8F5fk3ODPRuNl0QQ4xMCrm493oADg7WVkzKyP94=;
        b=MOV7GZAdNbkxEN+GVmTT5wxvm5nauPU5LWxUueGRSEww0eMArdXpmrBE0H3PUa7wzz
         LsX0jXbh/+mu+N7WCsjDkJWgp2Srec55fUa7gQOoJBylDeF0nsl+L52Eh2HVqIewlVri
         gzH8O4UgLPhlUUAzeT2Qu4QbVTSXvG7P8YJ4ueYAKaiHknHONKO0lGUH/reg/Z0cQIfr
         nimgb51aTj3zDZIhYDus9w+GqjCS0tzbXcSSBggm7Do8qG9glQXLln9b15EwVcRiYHa9
         ZItldoH44vnlwIKM4lGDW8USkIZaekxyyLjflrRNL+ztDQGW8Tje5Bdr0BJQeCJcbGuo
         ieAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFe6X8i5CsTw22/GRASplRrLv4r3ht6M8ThEMkX6P5kUtIPyK7m8miy5nCSIdh61WCye8IUsXbZS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAxGQblUGUhHgbE8pB1itS0qsUj2mtLUZBTlpTXqV8B5ApfkMk
	NTCYej3j37sdm614tgRB0PNxIjCmKqX+rnNh/dWjdVFNTWMVYcv2idcgLffhQfU=
X-Gm-Gg: ASbGnct9nPMLwoZu6OjAA8X1RpiElm49u/h5DO/CBC+XmCDEs45dTPcR8+5LgQSbAph
	z/QeVlAx6clY3HzYIxfoKR2PrR0KMLQRMa4aTzlZSzclCTQC1/teABHFlkK2Io+6HLFjdzRM4YF
	PnywhpebaXMCYeGKl6ttCwclDfD/t2ymQ6efMg37LCyZoRm8XkaEZ+tSBNEFqyAvUHr8U1+iB6J
	A2dg23j7qOgzKxd2ebtffdHO/jiVnV9YcxWPeeWVEFSfQ043evF/2uzM5HtlwunCYcBkpI3UHh2
	n4V/6guG25KGBptC/6NgkIco9V6k+Ipry25asiXW7Rk1EV+LVvHHYWpCwzHRyYjTtjgQhUZRruP
	sOoT4BWu6pQ==
X-Google-Smtp-Source: AGHT+IG31YQK0lns7bL8/SUBFauUDIRlLHFzcKIzZ3FizdMIvgjkQMisa+1tal4advrfyXA0AqLR4A==
X-Received: by 2002:a05:600c:5742:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43d510fff60mr148133725e9.19.1742997938769;
        Wed, 26 Mar 2025 07:05:38 -0700 (PDT)
Message-ID: <936e7ebf-69e1-4854-87c5-340f56b9d432@citrix.com>
Date: Wed, 26 Mar 2025 14:05:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>
References: <20250325174110.467-1-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250325174110.467-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/03/2025 5:41 pm, Alejandro Vallejo wrote:
> The way this undocumented feature works is via qemu-trad (who nobody
> uses anymore), by intercepting 3 magic PIOs. 0x88 is one of them, and
> it's probed by hvmloader as a means of detecting support for this (so,
> on qemu-upstream this check always fails). If hvmloader detects the
> feature, it appends an SSDT with AML inherited from some laptop ~20y
> ago. QEMU then communicates with a userspace daemon (xenpmd) via an
> undocumented xenstore key ("refreshbatterystatus") in order to report
> battery levels.

Any chance we can make this less undocumented, even if it is a note
saying "removed now" ?

>
> Seeing how no one uses, mantains or cares about qemu-trad anymore, rip
> it all out. The hvmloader check, the SSDT generation logic and xenpmd.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> If this feature is truly wanted, it must be implemented in
> qemu-upstream. Ideally in a MUCH less roundabout way. And definitely
> without involving xenstore.
> ---
>  .gitignore                      |   1 -
>  tools/Makefile                  |   1 -
>  tools/firmware/hvmloader/util.c |   7 -
>  tools/libacpi/Makefile          |   2 +-
>  tools/libacpi/build.c           |   9 -
>  tools/libacpi/libacpi.h         |   2 +-
>  tools/libacpi/ssdt_pm.asl       | 409 -------------------------
>  tools/xenpmd/Makefile           |  30 --
>  tools/xenpmd/xenpmd.c           | 525 --------------------------------
>  9 files changed, 2 insertions(+), 984 deletions(-)
>  delete mode 100644 tools/libacpi/ssdt_pm.asl
>  delete mode 100644 tools/xenpmd/Makefile
>  delete mode 100644 tools/xenpmd/xenpmd.c

I'm tempted to summarily ack this based on diffstat alone.

Juergen has expressed an interest in finally purging qemu-trad in this
release cycle, which I agree with.

If we're going to do this, then I suggest we delete qemu-trad first. 
Otherwise we are technically breaking something that someone might be using.

~Andrew

