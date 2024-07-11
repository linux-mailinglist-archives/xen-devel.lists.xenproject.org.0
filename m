Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972FF92E239
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757173.1165926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpAQ-0004QW-Tz; Thu, 11 Jul 2024 08:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757173.1165926; Thu, 11 Jul 2024 08:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpAQ-0004Nv-QI; Thu, 11 Jul 2024 08:28:42 +0000
Received: by outflank-mailman (input) for mailman id 757173;
 Thu, 11 Jul 2024 08:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRpAP-0004Np-He
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:28:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 936b85cf-3f5f-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 10:28:40 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso9927455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:28:40 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f1138sm107761295e9.19.2024.07.11.01.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 01:28:39 -0700 (PDT)
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
X-Inumbo-ID: 936b85cf-3f5f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720686519; x=1721291319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+rgLAqRwrN61JZstEw4Z3cUJ01gNpmGzjbofpECTgso=;
        b=Mz98nsvHCsS66/+X8myh3/11a/8BANElXoaZ360xhg+kwH5/dRHD6DMxMjfTxf74f3
         IvAFUlred9kgkbxB9txal2IV8IxBLezM/+HqfTalNOmqHWrWdVDC8Q0dBNj/WRot2imY
         /Lt8yKTVzYAB+5l0KowQ15GZCzPNPp3wuH84Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686519; x=1721291319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rgLAqRwrN61JZstEw4Z3cUJ01gNpmGzjbofpECTgso=;
        b=nFouVjGR0qCefMO2lo4YaYwRQaS0ZLxq5DcqQRXe5sVHKbDA+fYOU7DVvdLglt2yBn
         uhDel+lHAN/+tbctypU7Pel1Sp+i7dS5az8BBIHr8MNI6la/488irqkpjiyezA4ml9zg
         STOx2zfa6ALTapzS5WnNJ2tQtWb960zQ7hLQQHzp21r9C8kFhD9H6P7bj1pwtcgkw+Ng
         zrGd69ImqaH9PPvZP8NV6na8n5HF0YkKZkLD1tdhVE3KOYFxiKB9C/aM4r1NstkQztZ1
         JtKlFkwKuToU9dSjUmM9Ih9ddjaHRl7aDjhQ+iJKGDr3gayDK8fJMw3ypUB9pkX3r08h
         5ZSA==
X-Forwarded-Encrypted: i=1; AJvYcCXqp0Q3lfcBN0CVeZ0g505v4ZFnljuQAUn+1DXIKZcBKkenA11sWywotVNREVgjWi04fQJq7uKPdP9imMMwaR1Qwxcq3rs9VVsApIeMIGI=
X-Gm-Message-State: AOJu0Yz1WMtRt7l1rOwpt6CU354y1cJQy2T9ms61PVGWatUIIE0LxbNd
	Tg36n52hTqlkALCfG307X8Mki3x+Ybu+p+uThBFa+47u3LGb9Y4rn7n6vRbu0wA=
X-Google-Smtp-Source: AGHT+IEXu5BSR8RG0xFpkc/z79TSxLnkC6HHIFgA5+yDSjQHJoUYzXR2fj3eOTGBDDV6R+h+CuZISg==
X-Received: by 2002:a7b:cc8a:0:b0:426:618a:a092 with SMTP id 5b1f17b1804b1-427981e0b8amr15036945e9.13.1720686519526;
        Thu, 11 Jul 2024 01:28:39 -0700 (PDT)
Message-ID: <72549968-b2b1-46b8-a807-f92977d1231f@citrix.com>
Date: Thu, 11 Jul 2024 09:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] xen/riscv: introduce trap_init()
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <83b9053330e4dae38e926c99f47d0ef11d9dd31d.1719918148.git.oleksii.kurochko@gmail.com>
 <35049d21-b08c-4382-8a71-4430c7f209cf@suse.com>
 <bce854bb63b07cc9f16509c163c7b90d56dcb2dc.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bce854bb63b07cc9f16509c163c7b90d56dcb2dc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 9:19 am, Oleksii wrote:
> On Wed, 2024-07-10 at 11:50 +0200, Jan Beulich wrote:
>> On 02.07.2024 13:23, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -12,6 +12,18 @@
>>>  #include <asm/riscv_encoding.h>
>>>  #include <asm/traps.h>
>>>  
>>> +/*
>>> + * Initialize the trap handling.
>>> + *
>>> + * The function is called after MMU is enabled.
>>> + */
>>> +void trap_init(void)
>> It may be deliberate that this isn't __init, but for the present
>> needs it
>> certainly could be. This is the kind of thing that imo want saying in
>> the
>> description (which sadly once again is entirely empty).
> I just missed to add __init so I have to added it in the next patch
> version.
>
> Thanks for finding that.

Don't be so hasty.  It will definitely need to not be __init as soon as
you add multi-CPU support to Xen.

Just say so in the commit message, and save yourself needing to undo the
__init in a later patch.

~Andrew

