Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF098412F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802506.1212761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st1Kx-0007wP-8N; Tue, 24 Sep 2024 08:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802506.1212761; Tue, 24 Sep 2024 08:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st1Kx-0007us-5g; Tue, 24 Sep 2024 08:55:59 +0000
Received: by outflank-mailman (input) for mailman id 802506;
 Tue, 24 Sep 2024 08:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st1Kw-0007um-Ly
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:55:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc4c2e2-7a52-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:55:56 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so4326703f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 01:55:56 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3492dsm60035966b.19.2024.09.24.01.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 01:55:55 -0700 (PDT)
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
X-Inumbo-ID: cfc4c2e2-7a52-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727168156; x=1727772956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B0b9D0kXma09Gbi7yN2wpsn+0JQr3CaXLpigc1L/kuE=;
        b=npTm37IEGVuoTAtDJcwVKE5D+12mqg8DK8jT/IcGLaOQJ6Nk0sZSdJ9qRo1hHyh6nj
         2SBJq2CbzVk7RNf2dSqrpp7ZZNuPtAcBAHPH2o3UhwKiHVefJtYTnz8lo7wIcLlQjjXk
         ixz4UIIdjF3SCDUJ7Gl/wAElHzoKoN8gvk3Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727168156; x=1727772956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0b9D0kXma09Gbi7yN2wpsn+0JQr3CaXLpigc1L/kuE=;
        b=iCB487vJou/iuEl+gCWPQdZiGlUeHy22kuIWlSwWafMPBYGjGzUzC/ajLpCnOrXP3m
         JUwblc5et42+BNtAcHzlZfEgDQsMMGIqiJX6QrKDx9JYWASIdND1YdLpebpdP6H5/0wf
         1mFeNs2q3vOSHL9EXkW4hRTeirpJiHcnB9OezEnsUsHcs4/eKoysJ03kUeWyJdS8hnhs
         6oZHGepQ4aCZRbk3aYDp7cqgLWZF7jwTV+fGuR43CAyuw7v0KkOJrOjwOXVrakxDhn26
         gs6V+6rLu4sB4law5i9U9I9HGQXvqCZBEF/iqsKQHZeRGwI0aRGit0kjsiTYQ3aeoXlu
         nBTw==
X-Forwarded-Encrypted: i=1; AJvYcCXNStQEuEXUDafps52qStNzm6miPfdVWOVpEaMSde/Eb9wqB6uDeURCan2MsyOPP3NfHRLyxKrHlY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwparRZ5P0raFEa2v4e1aqw/q1W8MPvBbeSBGXKC2g+4n2Xsr13
	uSfj4EcGjHWWnn5FKAtqOcDftETcHJ37cigRhsc97/kZ4kXYsfBs7nmCtLrOnr4=
X-Google-Smtp-Source: AGHT+IHu5WG5HNXPpTzLbQ3yPf7hIxAbzE2ElO3rDm+8aYcGAVt2imO7ISg3Yr4EYCWJ2uafvjqxEQ==
X-Received: by 2002:adf:fc52:0:b0:374:b363:2dea with SMTP id ffacd0b85a97d-37a422532femr12829394f8f.10.1727168155814;
        Tue, 24 Sep 2024 01:55:55 -0700 (PDT)
Message-ID: <531900b4-e128-4044-bf7b-c8e4157d7b35@citrix.com>
Date: Tue, 24 Sep 2024 09:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/efi: Use generic PE/COFF structures
To: Jan Beulich <jbeulich@suse.com>, Milan Djokic <milandjokic1995@gmail.com>
Cc: frediano.ziglio@cloud.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
 <5dfa21dd5f8e968bf38fda5690964e0f1d957ccc.1727113391.git.milandjokic1995@gmail.com>
 <5926cad8-2013-4ac2-9b23-14540b010a32@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5926cad8-2013-4ac2-9b23-14540b010a32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 9:22 am, Jan Beulich wrote:
> On 23.09.2024 19:50, Milan Djokic wrote:
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -88,6 +88,8 @@ extra-y += xen.lds
>>  hostprogs-y += boot/mkelf32
>>  hostprogs-y += efi/mkreloc
>>  
>> +$(obj)/efi/mkreloc:HOSTCFLAGS += -I$(srctree)/include
> Nit: Blank please after colon, just like it is e.g. ...
>
>>  # Allows usercopy.c to include itself
>>  $(obj)/usercopy.o: CFLAGS-y += -iquote .
> ... here. Could surely be taken care of while committing.

There were two others I'd spotted, which I was intending on tweaking on
commit.

~Andrew

