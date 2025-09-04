Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F003B43935
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 12:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109829.1459241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7Wk-0007Pk-5Z; Thu, 04 Sep 2025 10:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109829.1459241; Thu, 04 Sep 2025 10:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7Wk-0007Ma-2x; Thu, 04 Sep 2025 10:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1109829;
 Thu, 04 Sep 2025 10:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJB8=3P=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uu7Wi-0007MO-Eu
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 10:49:12 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca888227-897c-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 12:49:11 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-55f6507bd53so946551e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 03:49:11 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace8121sm1129405e87.84.2025.09.04.03.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 03:49:10 -0700 (PDT)
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
X-Inumbo-ID: ca888227-897c-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756982951; x=1757587751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nR8TSyxQE0jhlJodX/fnhUjsMeLTIC+vPJygL9k0iM=;
        b=kPp6xd5wAipZFclQxk7JyckepW31dh+CVmsxbVKN+IpQ1F2bPxyTjNZw78thEripRY
         eBtcelWV45vgO4B1GAublmMFfWPLVheLvMxv092mPtE5+rZ2tDo+W4DcBIFkTC8LGg+/
         NbaUAwZMkRbY5+flQe/XAIULqce5EjITuONzgn7DcgYb6ylV4OVvSSMHVOyq3CSR4p/U
         mcntwHnrhBWJ+mubLIE+K8vKQty4jplqa9OGS45wPhThxAdv1N6J7GkDms6EL4mJ4mpR
         yiZx6c2/94jaMrMwKLpC6u6vhtrAGi1UGi4ySQ/UpcyHuF0Edm0L6FeAWGE9kswrYyCJ
         fBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982951; x=1757587751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nR8TSyxQE0jhlJodX/fnhUjsMeLTIC+vPJygL9k0iM=;
        b=RfOm8TjFouzi32yf9fxQ5AH5uM/6D4NYdxXQh/J3dua9E8rS2KzGnY8bFgPBcyIa9k
         6fSekNdWQqI3PNRxMxiebHZq6InSNXZMjQa+pGvYRFoWP5t6ikaq7Ovw5MYVdRSYkTNQ
         7XZSqEAntucdGM5itWxfkrDuS9VIxZCOotcz9ljBgdBnMfV1KCBRSxeKrW5IfX/jhbQk
         S6dpK2Qr7Oe7GYmokBxtUckASP4/wB7f43L9FwmM7TkTQ8a1LXzG+szgVW44m4zxaOlj
         XVD7hzJq7UeTD/7gr4020EJJlggjBMED00JAQI+7I4eSKhIxwDGj/t+5kIeFHmJjeQB0
         6DKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV+L99sZxMVF2KYoogSMdpRQ87gAAEIROJ6UShVrn4baTRjOal8M8vsEdrpo1FZZwRoJ7ol+w8A20=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ3HsoSQqfhaPZeYKn0dBGkcUWiqQkYIQKqEhSY3Evh9EsrMil
	lfzSQ3XTuZMlN0uhs/7jkid5id4l8+9Epr3ps1njOkGu1cre6y58Dx1Q
X-Gm-Gg: ASbGncsKKCv9KNeX18eQijMIa+wsK3CU7FKlSC5coYmIpH7aEY9Hbq6HwcmFvJu0GA/
	ZBWfbqmVkBh8qexyzaATTnML3p3ezFNaEo71xQNUahPjb4TYHKVvkKDhzfOYlkhizpz8HGccUKm
	nvj3/e+VIgA6Ckj77rfd5IlFD7my571NhfdPqwKX3PjoVntCxTu+6KLylgLmacM9kLYWLaEh2/S
	pzg7kU9C0Vo21AWO+VKvVzzlDaGVUAhYRGI7CIdFYtzTR4kzdBs9wj2czjjRkN0A2bR+37hI3N1
	nQUnmDo9u/pL7a3GLNX8yeZElhdcLpY9whv9uYcYg4q4wH8pgFQNAe8wQgykD631W+2s6r4CmqS
	TovOg8azyT4ShIV/SbJqipfd1HA==
X-Google-Smtp-Source: AGHT+IG6B0ndSnXtouzAq1Rlvz3J1/jrSn40Nr0nBsPeddw/0jC6aGsN5Tbc0QrCt5hy7DkUdUFuQg==
X-Received: by 2002:a05:6512:ace:b0:55f:4db1:e450 with SMTP id 2adb3069b0e04-55f708b7213mr5250385e87.22.1756982950759;
        Thu, 04 Sep 2025 03:49:10 -0700 (PDT)
Message-ID: <9d40e91c-5e9a-441b-85ad-8dddf4427cdb@gmail.com>
Date: Thu, 4 Sep 2025 13:49:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
 <cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com> <87plc7tdxx.fsf@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <87plc7tdxx.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04.09.25 00:37, Volodymyr Babchuk wrote:
> Hi Oleksandr,

Hello Volodymyr

> 
> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
> 
> 
> [...]
> 
>>> +static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t spi_base,
>>> +                                           uint32_t espi_base)
>>> +{
>>> +    if ( reg < espi_base )
>>> +        return reg - spi_base;
>>> +    else
>>> +        return reg - espi_base;
>>> +}
>>
>> I am wondering (I do not request a change) whether
>> vgic_get_reg_offset() is really helpfull,
>> e.g. is
>>   offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORITYRnE);
>> much better than:
>>   offset = reg < GICD_IPRIORITYRnE ? reg - GICD_IPRIORITYR : reg -
>>   GICD_IPRIORITYRnE;
>>
> 
> IMO, it is easy to make a mistake, because you need to write register
> name 3 times. Can cause errors during copy-pasting.

I got it

  But I saw clever
> trick by Mykola Kvach, something like this:
> 
> #define vgic_get_reg_offset(addr, reg_name) ( addr < reg_name##nE ? \
>   addr - reg_name : addr - reg_name##nE )
> 
> And then you can just use this as
> 
> offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR)

 From my PoV, the idea looks good

> 
> I don't know what maintainers think about this type of preprocessor
> trickery, but in my opinion it is justified in this case, because it
> leaves less room for a mistake.
> 
> 


