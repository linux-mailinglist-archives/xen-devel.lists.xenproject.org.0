Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665D8A31A5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 16:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704752.1101303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIKh-0004jr-Qp; Fri, 12 Apr 2024 14:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704752.1101303; Fri, 12 Apr 2024 14:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIKh-0004gg-Mw; Fri, 12 Apr 2024 14:56:51 +0000
Received: by outflank-mailman (input) for mailman id 704752;
 Fri, 12 Apr 2024 14:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvIKg-0004fD-Re
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 14:56:50 +0000
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [2607:f8b0:4864:20::e31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3cee4d9-f8dc-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 16:56:50 +0200 (CEST)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-479dbcdba2dso404335137.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 07:56:49 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s12-20020ad44b2c000000b0069b0c9a81b5sm2412689qvw.95.2024.04.12.07.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 07:56:47 -0700 (PDT)
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
X-Inumbo-ID: e3cee4d9-f8dc-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712933809; x=1713538609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yel18ObieU7UhXev70fM3gRKdzzX4ihHX8Pwq/c4H+w=;
        b=QOoxpx+IRm8UZT9B8mV95n2ij7kMEi0gQa6LbZa9jERB55H/vbtEiSCbkkBcO9MHgI
         6zQv6dmmzgdz+w7TscwzrSH/KhZK2iu5wb5xU6ZXq30ga4KPy6m+yz8Yr5nwSOxHKdhU
         cEtwAfsrzFmMTRcD7FtYE3IGi3NaMNXGOBMUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712933809; x=1713538609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yel18ObieU7UhXev70fM3gRKdzzX4ihHX8Pwq/c4H+w=;
        b=IInLdkv5ZdiFdZ9UdMp1S9wbruAKDujgVpwIAmNzffHVxSqXTtkIInXuSqKrpdZZdv
         tuZhTPGJ0of6rCwu1zXhceBqxbp7AX8P3ceWGcaHFybdHMH3GzZV4fCEuikAzk0h0aCN
         wblWrGLFtOTQHVhkKuC6gTZQ3fiWuTOuzDbrSaxRBLyvOMijjvYspk5IpoMhGWGDQ/+u
         nnQkVGd+yx+XRjwTTV5t9LS0irGo6Uqf/HHNR8PbKjBymOg4JJweAJ6SXL0FDSnQeKjU
         qBw7VntJq1TEpLDJDkQ1g4hmH+0SOmsK17mVSSAy18/lKsnCWCLQHY8iKSJexSjGol/C
         HO6g==
X-Forwarded-Encrypted: i=1; AJvYcCX3C9MvVq5iEkgUJyQlB3iLA3DJp50hUo/ww1UpKWA1xN+WB/gbsnF/zuNu+/jXCKftJT9aH7wEfmQJ3M74BsLvU1Xvy7ve/Kb9Ie2DeO8=
X-Gm-Message-State: AOJu0YxGF98JbzJxLtIVDbqjGl3RZAFxlS1ClzbbWTtvl9bFQ48traDz
	fJVevQT4n0gbkTUjN0w4O22xtKYYPECZiKZsLdPaVKtW7coCNbN9Nq3ieWQ1D20=
X-Google-Smtp-Source: AGHT+IGZPm+FIAOkPKOgY0ZQArf5Ad/fV9gnTy2WhwJ3E8RrWJzq/Ij1TxNdKTMCzQgLK7d0qTFsPg==
X-Received: by 2002:a05:6102:5491:b0:47a:28c9:8309 with SMTP id bk17-20020a056102549100b0047a28c98309mr3825654vsb.9.1712933808093;
        Fri, 12 Apr 2024 07:56:48 -0700 (PDT)
Message-ID: <80023689-5783-4b77-97b3-dba5a697057e@citrix.com>
Date: Fri, 12 Apr 2024 15:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Implemented Amd Secure Processor device driver
To: Andrei Semenov <andrei.semenov@vates.fr>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
 <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr>
 <db0f49d5-ea9e-4c62-b7ac-c856656b1e29@citrix.com>
 <be2e990c-50bc-4950-a70b-755ffebeaadd@vates.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <be2e990c-50bc-4950-a70b-755ffebeaadd@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 3:49 pm, Andrei Semenov wrote:
>> Can you discuss this comment:
>>>      CET shadow stack: adapt #CP handler???
>> some more.  What's going on?
>
> Yep. Actually CET Shadow Stack raised #21 exception  (near ret) on older
>
> versions of Xen (when I said older I talk about 4.19 unstable). This
> is no more
>
> the case on staging branch. So it was fixed somehow. Sorry didn't check
>
> - will fix.

#CP[near ret] means you (/something) clobbered the return address on the
one of the two stacks.

It is something to take seriously, but it's most likely an issue in the
code you're adding, rather than an existing issue in Xen.

~Andrew

