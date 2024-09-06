Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0696F8EC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 18:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791930.1201945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smbMk-0008Uc-FE; Fri, 06 Sep 2024 15:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791930.1201945; Fri, 06 Sep 2024 15:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smbMk-0008SF-Bh; Fri, 06 Sep 2024 15:59:18 +0000
Received: by outflank-mailman (input) for mailman id 791930;
 Fri, 06 Sep 2024 15:59:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smbMi-0008S8-CX
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 15:59:16 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f679f6fa-6c68-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 17:59:14 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f4f2868710so23397671fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 08:59:14 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56d1ccsm2581936a12.55.2024.09.06.08.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 08:59:12 -0700 (PDT)
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
X-Inumbo-ID: f679f6fa-6c68-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725638353; x=1726243153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H32N38nS/MTxq7LZz6EnJ+gR9lk4GalWCKtQ77lcecg=;
        b=LIsGE8OvA7xLAz+dBOO7a1KVbe8W1zIrwDHY5hYXWv3rvWNsr7Y35kouG5zs6+OuXi
         111trVlgcRqe4BBlVbW1WhaWTXDKgNv4AkNtKVCJU7wy+nJJezu6ciHfKTKcrtU4Kpo3
         NV2Ldq3BUBWVlwL2NLS43t5/KzAPJ1aTiF7j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725638353; x=1726243153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H32N38nS/MTxq7LZz6EnJ+gR9lk4GalWCKtQ77lcecg=;
        b=FoHjhC2LCUb2lzGHZIZuYrp3nfksSr9/3vzIGdpZX5DrXtGWkIFVvjkuF22e0kM4fj
         wwMO/jOsxyykbVZcEMvTQ0QvJyVeWxBZNRrSszdG37hQbNBLJo0WNn65PE1QJpS547Hp
         ibDZbl/CoR0965WPicq4wj9RrffUmJPwrqTlZRIq9TuOzjlbXFR39T6H7A9xnvbFfoQB
         y493aViBkg/DGQrAqS/B4/RRGEtjwtei6c82BVemRPdCliZTwr1n2Mz7FtEORSSWHhRc
         eXdg7OxTyD1noFFvJSaNH/W/xMVyF6Zfot//Ez5q6aDQWSz78/GWPRHgUj+V9PaV5El7
         iO+A==
X-Forwarded-Encrypted: i=1; AJvYcCWAqHYt5aLrJbBCL3dRS90FopLi35/kuaySqkwSBuvn2YwTONfdSrujdA/m5AcHhOxspg1f3+Ypp8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKmLtPq/6Xek6vo5WHkxtaW+i1ULvtd4OA/aoPHG0KIz79CShn
	Dn19LwcZtDMy73X1qmcIeKDRs37Ek2sElCmWPlCYI0NDCjEo9SReW74mKWjT1qiKRNcbNjsH0n+
	z
X-Google-Smtp-Source: AGHT+IHShSauWSefAQO0pgEblCBwTcv9XMi9yTCH/5sTyf17WzkwvazM1/jBWoBuy7Re0k+rW6KCRA==
X-Received: by 2002:a2e:6119:0:b0:2f7:4e8c:9c11 with SMTP id 38308e7fff4ca-2f751ea793emr22277481fa.1.1725638352753;
        Fri, 06 Sep 2024 08:59:12 -0700 (PDT)
Message-ID: <772a9d43-6338-40be-9499-1055ac94cfe6@citrix.com>
Date: Fri, 6 Sep 2024 16:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Reuse 32 bit C code more safely
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240904145648.33707-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 3:56 pm, Frediano Ziglio wrote:
> This RFC series attempt to:
> - use more C code, that is replace some assembly code with C;
> - avoid some code duplication between C and assembly;
> - prevent some issues having relocations in C code.
>
> The idea is extending the current C to binary code conversion
> done for 32 bit C code called from head.S making sure relocations
> are safe and allowing external symbols usage from C code.
>
> Note that, as an addition, scripts generating code check for no
> data to allow code and data separation.
>
> More details of the implementation are in commit message 2/5,
> which is the largest patch.
> Patch 1/5 is to prepare code and avoid data.
> Patch 3/5 is an example of code reuse between 32 and 64 bit.
> Patch 4/5 is also another example of code reuse but is more hacky and
> dirty due to not being possible include use some headers.
>
> Code boot successfully using:
> - BIOS boot;
> - EFI boot with Grub2 and ELF file;
> - direct EFI boot without Grub.
>
> Suggestions/opinions are welcome.
>
> Code is currently based on "staging" branch, currently commit
> 6471badeeec92db1cb8155066551f7509cd82efd.

I fully support taking logic out of asm and writing it in C, as well as
taking steps to dedup the EFI and non-EFI paths.  A couple of
observations before diving into the details.

The visibility pragmas mean that you've lost the `-include xen/config.h`
from the $(CC) invocation.  We use this to get some Xen-wide settings
everywhere, which includes handling visibility.

The symlinks for dual builds are going to cause problems for tarball
archives.  Instead you can encode this with make rules.  e.g.

    obj-y += foo32.o foo64.o

    %32.o: %.c
        $(CC) -m32 ...

    %64.o: %.c
        $(CC) -m64 ...

will build two different .o's from the same .c.  This is how XTF builds
different tests from the same source.


I'm on the fence with the ifdefary and bit suffixes.  I don't think we
need the error case because x86_128 isn't coming along any time soon.

For completeness, there's a trick used by the shadow code (see
SHADOW_INTERNAL_NAME()) which adds a suffix without local ifdefary. 
It's nicer to read, but breaks grep/cscope/etc.  I'm torn as to which is
the lesser evil.

~Andrew

