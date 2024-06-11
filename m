Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7515903F61
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 16:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738492.1145265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH2y5-0000N8-DO; Tue, 11 Jun 2024 14:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738492.1145265; Tue, 11 Jun 2024 14:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH2y5-0000Ks-9K; Tue, 11 Jun 2024 14:59:25 +0000
Received: by outflank-mailman (input) for mailman id 738492;
 Tue, 11 Jun 2024 14:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eM8s=NN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sH2y4-0000Km-1H
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 14:59:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ffcc929-2803-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 16:59:22 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so122735966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 07:59:22 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f00108531sm468117866b.211.2024.06.11.07.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:59:21 -0700 (PDT)
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
X-Inumbo-ID: 2ffcc929-2803-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718117962; x=1718722762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/+sL8UQsp33974oHDcUejEizKLfQHWG3c2yC3tFfww=;
        b=fOX1M1UOsCWQLMTwdS02jPSkG08b3QLEdX3CCiW0iKcbCm70fLjNdzqH0AeaVyu+5I
         vl/VSbkwKuPVd+0OBgmVc0GbS1IWZNVlzi5XhDs9b/j60aLqayoec/MZp6d1HSog+s7R
         GuCOnosfYEcOLhw4uMjhwboq3jLIvriISEOWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718117962; x=1718722762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/+sL8UQsp33974oHDcUejEizKLfQHWG3c2yC3tFfww=;
        b=ADWqK4X8j+Ho1P4IMwMQQrmetnY4ukAzAISAUUoy61bMClGWYbz1QyjaTgciIOVsYf
         J0Wm4bx2ag5CyDy0IrBivH42Yw6rkLeo8POsCDb+MmU5Y4WbATDy6ZHVuwiQDPCQs1nG
         +0axCzI5UGMvfd7LUbQ2Luhe7yHcbbznYso4CjzxgYfYP1UySzTFaIgnkZuJnFGPFFu7
         z0XYvIv61jD0ZEySaI266hJz73wzgXBlDrLLiSWjlS/EbqFr10HIsnjfDlgIIe2+opdj
         MZH2jwSj8YqYjY+HZ16glmsUS+c7E5kkkjd0xKVe/3uIDVEcAGM/NXx6r82ByacYEjEv
         T3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCxEu5OHA/W1ZKVXf6aUW3652awsrZGKzMgjVvEy8pTo3U8JvYepCghf//BEAy0LQmeGfM5cpuWEDRQXr0DGnEq6QQnqeLyAc/QNpP1qQ=
X-Gm-Message-State: AOJu0YwT2ajt2iU7qdPs4KTwHYNkFPWLc0rFTu8iEzReq7S0PBdulyRW
	3Nphi98yeeGJheq0A4EXifo8DmpEhx3LXqtiRnZ5GLoMoequmxPs8LphcWK3em8=
X-Google-Smtp-Source: AGHT+IFudohw47bDbB5i5747u3iZsRlP5B+jcAlQ/0xitOYbKpLMw+bk7sntCjz2k6k6h7HW33MdMA==
X-Received: by 2002:a17:907:84c:b0:a64:e418:f93f with SMTP id a640c23a62f3a-a6cdacfedbcmr1039452666b.60.1718117962183;
        Tue, 11 Jun 2024 07:59:22 -0700 (PDT)
Message-ID: <476f3b8d-6b0a-4246-878f-f2e284d75a3d@citrix.com>
Date: Tue, 11 Jun 2024 15:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
 <d4e5b4c8-d494-440b-8970-488b49bee12e@citrix.com>
 <79a2d936-62f1-4749-9e75-0be019cd3d99@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <79a2d936-62f1-4749-9e75-0be019cd3d99@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/05/2024 7:18 am, Jan Beulich wrote:
> On 30.05.2024 21:52, Andrew Cooper wrote:
>> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>>> diff --git a/README b/README
>>> index c8a108449e..30da5ff9c0 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -48,6 +48,10 @@ provided by your OS distributor:
>>>        - For ARM 64-bit:
>>>          - GCC 5.1 or later
>>>          - GNU Binutils 2.24 or later
>>> +      - For RISC-V 64-bit:
>>> +        - GCC 12.2 or later
>>> +        - GNU Binutils 2.39 or later
>> I would like to petition for GCC 10 and Binutils 2.35.
>>
>> These are the versions provided as cross-compilers by Debian, and
>> therefore are the versions I would prefer to do smoke testing with.
> See why I asked to amend the specified versions by a softening sentence that
> you (only now) said you dislike? The "this is what we use in CI" makes it a
> very random choice, entirely unrelated to the compiler's abilities.

"what's in CI" is an arbitrary choice, and that's *explicitly* fine and
the right choice for Oleksii to have made.

He's got the hard job of making the damn thing work in the first place. 
Requiring him to also go and get some old compilers to backdate the
support statement is unreasonable for you to demand.

In this case, I'm saying that it would be convenient for *me* if the
numbers were older, because that's what *I* have and what *I'm* wanting
to testing with.  This means that I'm the one taking on the
responsibility of playing backwards-compatibility-roulette.

Now, for other reasons I no longer have those versions, but one of the 3
bugs I raises is still a real bug needing fixing.

~Andrew

