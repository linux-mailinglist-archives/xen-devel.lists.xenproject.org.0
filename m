Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A81A7E961
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940808.1340447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qsp-0005N1-IK; Mon, 07 Apr 2025 18:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940808.1340447; Mon, 07 Apr 2025 18:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qsp-0005K5-ER; Mon, 07 Apr 2025 18:07:43 +0000
Received: by outflank-mailman (input) for mailman id 940808;
 Mon, 07 Apr 2025 18:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1qsn-0005Jz-QU
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:07:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 322120b2-13db-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 20:07:41 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso51436445e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 11:07:41 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bb7bfsm135231375e9.17.2025.04.07.11.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 11:07:40 -0700 (PDT)
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
X-Inumbo-ID: 322120b2-13db-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744049260; x=1744654060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zrHCSy21K0DGFkpeuH2hjMjz9IC9jhXg90W3UCgWexs=;
        b=vB8/QSj19SPFAh8kYcrKDjYzglTnZWQ/Yeq6snshxs8xRMjyScBN9Ni8wLS5lhi7tP
         a4qd0gG0EFbGHDWjZ1hS8JOxhYSJiTT0NDmF+3VIl6XauPzyEQfws6COhRd6Rk8Dt7fU
         oR9omYlmAjA2LTYAz33rBIDrsu9g7JXKLQWoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049260; x=1744654060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrHCSy21K0DGFkpeuH2hjMjz9IC9jhXg90W3UCgWexs=;
        b=WKn1wFaC+watYCtOYNgDuJgLQtkcQ+H3hsdu5BmwrgYuI0KZoamwZeSpYcE6/za6Rm
         qkE+9sJjItXi5hDx/Lv1HEZ0avG0Ya/5InFL7TubgGvy1eWCzpbqUGg2cQvr2S7z8CK/
         ZurhlhyR47CkCoVcffkbWo+juBzDHvcSgylv4nNWpnDjU2Fwu3l7qUDalJ4aMrBzCuJx
         +VwcPJJUeLdEEwbtXC2pLZh0beSBklJT9FoAZ19lsnemvpkJVU1YsAQhB5/vrrLFu8UT
         BWpxtDZNk3rf9eJsS0nRb7pi8w1lpbfkPnwzbNq6gp/TonMnQUGmidCpvt6rlZYHRze4
         8fWA==
X-Forwarded-Encrypted: i=1; AJvYcCUlSRYsHnwT/4cfyI0/2xfycRZWbJ5kyRGrf6hK2I9xp4fwyi2K/WIDmSCOSrqCm5aERNpWCgusSPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze2Jb4zZ1Ac5UCghNyURIwWi0NavIo6MMveihiAZgxOeJxBhup
	gkZTarsYmfldfykdcES2ASgAVo/RETH8rthc57Ac5JDHffQCNHrQ2cFHUOjYICk=
X-Gm-Gg: ASbGncv9tUHwz1kj3YwOzbBIIwL1i98uCkywplz0M6o7ST253ETw5vsy66Sb0wmuoce
	77kaA3LW/pXyG5RLWBa46H/UbYF+CP/NHR1qTzaGOtPNxuTdO2R+uXNVfkdeWR/lcmrn387JJrS
	wCkIBOD2wu2Go73JJ4ESiyN8A2xo0Z2eQ3p6Z4Mv+5JFOcwg6A2jQfuN5lfXY58hFXpMnagu0A4
	roI3HUxYSBETqgtvaY9dR8pzZ9+Fi8JE/+gJHGfdrb7vHq7cxgbD2upffY3K0ExeCPYcwGHcPRU
	D9zV8vHiSUxf+s8+zVWU6MQ3LEwbTIG0ToynD6KNMKqrAcQqGhx62B+4S3YnjFVljSp2wcPWCXK
	wWx1JjnwOf9UXKJX6UKvw
X-Google-Smtp-Source: AGHT+IGRVshS+dVuK839SPQCTqMdsIftQzAggIKRxeDcpDewtD9o9c6RSMgHnFTRAIctdC06E0yumA==
X-Received: by 2002:a5d:64ee:0:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-39d0de25c1emr12719312f8f.26.1744049260394;
        Mon, 07 Apr 2025 11:07:40 -0700 (PDT)
Message-ID: <13532ce0-e066-491d-a913-b85268b9639f@citrix.com>
Date: Mon, 7 Apr 2025 19:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] CI: switch qubes runners to use console.exp
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <33fe66669f6ca9fb7573d69d9f9fefeb653fe503.1744028549.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <33fe66669f6ca9fb7573d69d9f9fefeb653fe503.1744028549.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 1:31 pm, Marek Marczykowski-Górecki wrote:
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
> index 31ce97b91b63..d1689fa5bf7f 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -28,21 +28,34 @@ if {[info exists env(UBOOT_CMD)]} {
>      send "$env(UBOOT_CMD)\r"
>  }
>  
> +if {[info exists env(BOOT_MSG)]} {
> +    expect -re "$env(BOOT_MSG)"
> +}

We're gaining an increasingly complex set of environment variables to
control this script.  In particular, this is more a signs-of-life
message than a completion.

I think this patch wants splitting into two.  First doing the -re
changes, and adding BOOT_MSG, and some comments explaining how each part
is supposed to be used.  I expect the xilinx- jobs want to use BOOT_MSG
too, whereas I expect we don't want the qemu/cirrus smoke tests to use
it, seeing as they're all direct-boot in qemu.

The, the second patch is converting qubes-x86-64.sh to use it, adding
WAKEUP_CMD/SYSPEND_MSG as they're pretty specific.

~Andrew

