Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B067F5B0E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639465.996870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r660p-0003h3-9u; Thu, 23 Nov 2023 09:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639465.996870; Thu, 23 Nov 2023 09:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r660p-0003dp-6p; Thu, 23 Nov 2023 09:28:43 +0000
Received: by outflank-mailman (input) for mailman id 639465;
 Thu, 23 Nov 2023 09:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r660n-0003cT-IN
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:28:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afee9fdd-89e2-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 10:28:40 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32fd7fc9f19so413148f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 01:28:40 -0800 (PST)
Received: from [192.168.13.100] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adf978f000000b00332d41f0798sm1133102wrb.29.2023.11.23.01.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 01:28:39 -0800 (PST)
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
X-Inumbo-ID: afee9fdd-89e2-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700731720; x=1701336520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhzwxHV+Bdiyx5bPUyokPHdYwQaX3xP8WnSIJkZBw6k=;
        b=O3NuCeZ06uYSMly7B/4JKN0g8gR2vtvVHGfaSB7SMaUapkoUplTo90nyxihivk6oR7
         pQ5iYjSNNPPohB+uDNEEtMEJgGCayi4bTxMY06rfp0JhUJOlDZn/QTEt92t89HOSmP3Y
         WMbnrZl3xkJkbgp3E5QTporbgjLyOpBc8188RnBFhSqqh/MGiYlFYwta6PRyxC4E9Jk9
         qy29VQKWxnGMT2po0a7AVvuDxZ1tEnh3qU50JRCYuWEkcP0EQ5hBAyBE6qeMBg3bvNqX
         UOFGTEOeDG9hB/syrysf8ifd1W1Xfl6GN9p8QOjHRlmddjbdJV4LWxSc64BKkVDgdPGJ
         3iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700731720; x=1701336520;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhzwxHV+Bdiyx5bPUyokPHdYwQaX3xP8WnSIJkZBw6k=;
        b=Y3u5JGFNCWFjX5q3QllSEKUmZgrEpX2qzv58AaU2aHldUSRdA33uzEw1dCK1gweBVo
         c6sOUZ+8rU1O166u7J5Z0zB51YEbOMlRlyjmMinhzyB8z4IEHxyhEBP2+uicfpQPbmFJ
         WRbFfB7k6y9nyrRryJWmhjnqLYBydsJEotEv7r9IFnAWfhKqk3WPdoqwfOxOghOG+YkM
         k/XJGsaMiAVapGa++pRok+7s1n0br7Fi34BJ5jGHnc1wVxXueoUAvPhe+Gh/Kwf2rGIP
         ZmAOiaBm+jX+sUOHLkWPZNCBNWbqD5dYK7yiWnRy6gWTRXsqeNwbDPTrInuoXl8mYX6D
         oKmQ==
X-Gm-Message-State: AOJu0YyWedMBSflF25Gjyg5AubyxoYKQqqTpJ23HwoZVLeZEogwyRrvl
	i+BtPVCw08otQJAUlem1KL4=
X-Google-Smtp-Source: AGHT+IHQg35CBXWM7ovP6a+uuURYIDYPDMvLcCf1tCeYG05bGkoXJV359Re8tnwnd/6OVfkUgZwzIg==
X-Received: by 2002:a5d:4dc3:0:b0:31f:ef77:67e4 with SMTP id f3-20020a5d4dc3000000b0031fef7767e4mr3306792wru.37.1700731719676;
        Thu, 23 Nov 2023 01:28:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org>
Date: Thu, 23 Nov 2023 09:28:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
Organization: Xen Project
In-Reply-To: <87cyw1z61i.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2023 00:07, Volodymyr Babchuk wrote:
> 
> Hi,
> 
> Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
> 
>> Hi Stefano,
>>
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>
>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>>> On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>>>>>>> On Wed, 22 Nov 2023, Paul Durrant wrote:
>>>>>>>> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>>>
>>>>>>>>> Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER to
>>>>>>>>> inherit the owner of the directory.
>>>>>>>>
>>>>>>>> Ah... so that's why the previous patch is there.
>>>>>>>>
>>>>>>>> This is not the right way to fix it. The QEMU Xen support is *assuming* that
>>>>>>>> QEMU is either running in, or emulating, dom0. In the emulation case this is
>>>>>>>> probably fine, but the 'real Xen' case it should be using the correct domid
>>>>>>>> for node creation. I guess this could either be supplied on the command line
>>>>>>>> or discerned by reading the local domain 'domid' node.
>>>>>>>
>>>>>>> yes, it should be passed as command line option to QEMU
>>>>>>
>>>>>> I'm not sure I like the idea of a command line option for something
>>>>>> which QEMU could discover for itself.
>>>>>
>>>>> That's fine too. I meant to say "yes, as far as I know the toolstack
>>>>> passes the domid to QEMU as a command line option today".
>>>>
>>>> The -xen-domid argument on the QEMU command line today is the *guest*
>>>> domain ID, not the domain ID in which QEMU itself is running.
>>>>
>>>> Or were you thinking of something different?
>>>
>>> Ops, you are right and I understand your comment better now. The backend
>>> domid is not on the command line but it should be discoverable (on
>>> xenstore if I remember right).
>>
>> Yes, it is just "~/domid". I'll add a function that reads it.
> 
> Just a quick question to QEMU folks: is it better to add a global
> variable where we will store own Domain ID or it will be okay to read
> domid from Xenstore every time we need it?
> 
> If global variable variant is better, what is proffered place to define
> this variable? system/globals.c ?
> 

Actually... is it possible for QEMU just to use a relative path for the 
backend nodes? That way it won't need to know it's own domid, will it?

   Paul


