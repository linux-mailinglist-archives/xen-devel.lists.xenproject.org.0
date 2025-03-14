Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05BCA6182B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915041.1320682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8zd-0008Fl-F5; Fri, 14 Mar 2025 17:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915041.1320682; Fri, 14 Mar 2025 17:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8zd-0008EH-Bl; Fri, 14 Mar 2025 17:38:45 +0000
Received: by outflank-mailman (input) for mailman id 915041;
 Fri, 14 Mar 2025 17:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt8zb-0008EB-ST
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:38:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bca6d1e-00fb-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:38:42 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5491eb379so3480399a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:38:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816ad394fsm2281185a12.58.2025.03.14.10.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 10:38:40 -0700 (PDT)
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
X-Inumbo-ID: 2bca6d1e-00fb-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741973921; x=1742578721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hpl4cnxJekM6FfThiai/zXx2e+8FHnMQX9KX/EA43M=;
        b=ovriCOQQFM0gcLQihmGamdbY8Fa0Hcm5kCSMaD8L6WnLOFrhfdTCC579FbC901CTXP
         nf+RoE1IuGDfuQnDQBBcfb9ymCeKXLKAOnBF459UGNhJlQSNVat0io2UPW0KbfrxS53Z
         y1YVWPTJ1Czm9SpaYqyKVYp625MFFoX0bpfkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973921; x=1742578721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Hpl4cnxJekM6FfThiai/zXx2e+8FHnMQX9KX/EA43M=;
        b=BrUX8RHxOXVGGUG4hzYKpDLgshkFodM3Si1yYCmdlQYLAJ2xHD1yzB2skxk+AOMv/0
         Y8EDsJba+1KrWaQN2aOVT9CY2DZhKLTlJ1wbpMDIIqKcuLBvEwTXl+VeE90IKbLb73KA
         Mr6gMgd0NS/byztWyp8K+Fd1/fvURn+2zZmuAz7EYzZ5aqxSTy/uyU7spQ2P1M7ZbGXH
         HK3ocooZuBfY6URQ93TLGNsPMWWM+mdujPzbl4NRKbd7R+Ic9TvhENWsZAHReC/f6Ezb
         xGFRRdo+smGZEGM7K9bWtJhf5TW1ZfDPwPflxcVK+Tyq8bkbl3dBKkUA3XFI3wgEDwJn
         Gwxw==
X-Forwarded-Encrypted: i=1; AJvYcCV58yYLVdj0fj3TcWgPrDhii915DT70SkgQTNOuGnGTxYFbX8g7NgdsthnAxojFraImdI8K+fX07zk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgOnf5vFdwYtNZ9YwPAp6vdmtV7/62PIgLpRMuxTML6Yn5wnOQ
	dEjyMl2tLd6I6tSKJgMqFc4wGGeNMk4glwN/FBTs6ZqKbgF9Ygtm7iktZinbStM=
X-Gm-Gg: ASbGnctmw61nC+f3lKIXeFT66lPfP/qYoS7XlSymOlsk//xmhOhFraXbRIubwL4ky0A
	rr/+fEn2Tvr4Cs9K2ACbGxygpJ4ACU77Fx8vk56aCozuKQicuFOGRN5874H9ZToW7nDbCk4o3tv
	fP1Ntg/5CO1fbrRX5XrbKGqJCIiiUvsvYETBBWX7Q6mEsZwi5nYiOYa3c7PR1H8QHDMTYbMkU6a
	+HFR6wIyKBJzwg1K/CRt4e9s1mF3om7pXqc2wRRsBJMpjRul86q0aviIxM4FXdSHarSeBAehMBK
	4Jdq+b+a7rRgV3UQYkacylplZ/GQaqgyS+t8/fgcseSHnliULuir8K1k2Yx6c9dR7gaDGyFXqVJ
	8rvm3t+SZ
X-Google-Smtp-Source: AGHT+IHuMJzFPdxHT1lX8H7MOJc+B3zP2VTHngVCjVPqPXY4kEQg95WAJY20qc2mfqobNynUfwUAuA==
X-Received: by 2002:a05:6402:5210:b0:5e5:bde4:7575 with SMTP id 4fb4d7f45d1cf-5e89f24e3b1mr3892430a12.1.1741973921524;
        Fri, 14 Mar 2025 10:38:41 -0700 (PDT)
Message-ID: <6ad08678-372f-4ce0-822c-96f97475594b@citrix.com>
Date: Fri, 14 Mar 2025 17:38:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] make build of vm_event/mem_access/monitor optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 5:19 am, Sergiy Kibrik wrote:
> This series aims to provide a possibility to build Xen without mem_access and
> related features. It is already largely covered by corresponding
> CONFIG_MEM_ACCESS option, yet there're still some parts remaining.
> Hopefully this would help to reduce dead code a bit.
>
> As coverage of MEM_ACCESS config option begins to extend beyond actual
> mem_access code it has been suggested to rename it into VM_EVENT, as a more
> general option controlling mem_access, vm_event and monitor code.
>
> v3 series:
> https://lore.kernel.org/xen-devel/cover.1741687645.git.Sergiy_Kibrik@epam.com/
>   -Sergiy
>
>
> Sergiy Kibrik (2):
>   xen: kconfig: rename MEM_ACCESS -> VM_EVENT
>   x86:monitor: control monitor.c build with CONFIG_VM_EVENT option
>
> Stefano Stabellini (1):
>   xen: mem_access: conditionally compile vm_event.c & monitor.c

I've taken this as it's been going on for long enough.

I've folded a few fixes.  Please be aware of these in the future.

In EXTRA_RANDCONFIG in patch 1, the CONFIG items are sorted, so the
rename caused a resorting to be needed.

In patch 3, extra comments on the #else and #endif, before more content
gets added.

~Andrew

