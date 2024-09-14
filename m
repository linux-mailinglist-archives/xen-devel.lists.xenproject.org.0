Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E970978E7C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 08:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798582.1208803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spMVF-00040L-AK; Sat, 14 Sep 2024 06:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798582.1208803; Sat, 14 Sep 2024 06:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spMVF-0003xD-5o; Sat, 14 Sep 2024 06:43:29 +0000
Received: by outflank-mailman (input) for mailman id 798582;
 Sat, 14 Sep 2024 06:43:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spMVD-0003x6-0E
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2024 06:43:27 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a45057fe-7264-11ef-99a2-01e77a169b0f;
 Sat, 14 Sep 2024 08:43:25 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so362610966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 23:43:25 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e5961sm39864466b.181.2024.09.13.23.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 23:43:24 -0700 (PDT)
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
X-Inumbo-ID: a45057fe-7264-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726296205; x=1726901005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cdcof4YPXf/QaGlRsd+O/IXh798IyDKqc1Lrb1hr3fo=;
        b=YyB3AzOJ4c3QKgkjN24WfYagOw/Q/G7GpimCjbm8DYsDbNUvVO56yPUf4oJjIC/4N9
         gaWxD/jF+jVmDAGCk38MRuAX7vLvo9U8cLf5L8OUienjfhIHgSU8s0bjTTRRgQWe8r0U
         8eVQKBoGGT2uBaKCc5oFEQDH9/9ec4xW4ve4egQzLPapfN89TDBNdxTEWrpWKxOe00te
         lctsshsMXVbreQRKZ+FBsTDHcymCsCW4+sxK6e6plvJLOGytkofjbS0kxryT+ASV5KRU
         vYegDU3nh5CFdUvPB10J874unrjyEcuMTtIkCvX3Rkqwm/q7CTFjDT9tG8YFqIiURqkl
         1+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726296205; x=1726901005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cdcof4YPXf/QaGlRsd+O/IXh798IyDKqc1Lrb1hr3fo=;
        b=gSzdTQyJEqo7DRQ7Vd3FU9iKH+P1qWNOGBF2VBgpJTn+t4sqHsZ6HNCYzEfi1KzTCz
         SbDYebwSZEXrB8N1OjeZy9Hhr7Y8JDmDcrVv0t2pvQzXgX6QJB6LvhyWrw6NcvY4zOeg
         1/3YSV6ppPw3B5FveI1OzBjbb0EYrR78hcD45/lHe049z7w39a9Pi1MguoYWRx8mTpkn
         NZFOD/sAzpgX4ns63micc5ywrd4um4DBVeWCFYK8oombikU34BnrGjMHo16kzor5uwL/
         FfU5nXYHlBT+/KvrI89eMOiBzx8JPmLWgnEXHgQnjXf0erqkTOp6u2LETRyRoGY7yNAO
         3Efg==
X-Forwarded-Encrypted: i=1; AJvYcCWjLvtjvCl2JzQNGvqyH9tHogibLJjUM0tL1B7kydToXY76WiesNbtkOYe5sCuOe6hpfrmDfXm0pMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7z47y9TbAr90jfZvhqssMPDu7Jb+XNSvAMVfzQxWjuPL6abs0
	LPcs2QRpAScxYQJlPOj3L0bkgGc0jre+mS0alLhpnFUNCuBRFSe4oBkT3qj8CA==
X-Google-Smtp-Source: AGHT+IGY+UcMzYI8tkKSIGpM5l1gGelcS30S8PfQh9MYrKLav9rjwUfHDrgfrkSi8qEs81N77qPWZg==
X-Received: by 2002:a17:906:d555:b0:a8d:5e1a:8d80 with SMTP id a640c23a62f3a-a902961ab79mr868849266b.40.1726296204465;
        Fri, 13 Sep 2024 23:43:24 -0700 (PDT)
Message-ID: <37ca8056-8801-4dfc-971f-b195143098f2@suse.com>
Date: Sat, 14 Sep 2024 08:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/boot: Avoid relocations in trampoline code to
 virtual addresses
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240828091956.127760-1-frediano.ziglio@cloud.com>
 <20240828091956.127760-2-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240828091956.127760-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 11:19, Frediano Ziglio wrote:
> Add virt_addr macro to make more clear the address we want and making
> symbol search easier.

This is not good enough a reason to make this change, especially in light
of the address space randomization aspect mentioned in reply to patch 1.
While there it only _may_ get in the way, here I'm sure it _will_. Which
isn't to say we can't go this route, just that it needs proper weighing
(and hence a better justification to start from).

Jan

