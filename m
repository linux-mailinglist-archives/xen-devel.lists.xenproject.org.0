Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D095269DB69
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 08:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498538.769405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNKq-0006QF-Gr; Tue, 21 Feb 2023 07:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498538.769405; Tue, 21 Feb 2023 07:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNKq-0006OC-E9; Tue, 21 Feb 2023 07:45:12 +0000
Received: by outflank-mailman (input) for mailman id 498538;
 Tue, 21 Feb 2023 07:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUos=6R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUNKp-0006O3-3P
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 07:45:11 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9db3279-b1bb-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 08:45:08 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id o12so13831949edb.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 23:45:08 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 md1-20020a170906ae8100b008b174ef3cdesm6316129ejb.27.2023.02.20.23.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:45:07 -0800 (PST)
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
X-Inumbo-ID: a9db3279-b1bb-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nb4m+NMSSZ8Xb7XVkirvpnqdk3gD/LNuPpLu5BP4rW4=;
        b=DD+pcRXM82S2cPljLEEhL8v7MNzjG+9rs6D9ggvC6fMzhzhXiSIoj1nWl/Rcv3c+hO
         JyPsld0ry5xj6i8cJFkWMuQdbW6a/YUFGPAdzezQUijwZ36XOYYJxy1L7JK1LjyClpUo
         DF6Yc61vpRQjxiSvXMMbhWX4xz07oqwLWVDtInxuM90vnb8yFzn7xpeo3X/AsjbbU6Vo
         f/z0BK4sb19v1y/zf/YbkKvovvTEAWLyPV2d2oQWkHuvkRdoiadmm7FmAXXATZ4KGepr
         d5c2H2A7rWCyEAcoH9Xz/0go2wCkobyhG3ykC+NlBTiBrr2TxdthdvjD5CrNGQ+5s2ZB
         omzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nb4m+NMSSZ8Xb7XVkirvpnqdk3gD/LNuPpLu5BP4rW4=;
        b=wc/bRGMR97If+55yPrOdAKInXZGUK60oECCIMMKq7osSA+7w+FHXF1U7VOiUOZ2Z+r
         RUFmR3fVJNfO97v3h9fiPytuNpI6jsJY/IFaUDRi+ilWW5Bi2nBl1/tCHvG+tTRVX5CZ
         JrUHvNi17FMd/t5ivYKKcvL+E9Ha/u2ab7ctp5xWLgY1ynDSsNoKhCu2F/gKOKW43Yyy
         2BNHLbx0bzCEj+dCoHvbwQGfuayoH1xMBRKaZKsaIq6pwk9EZHbnjmVVmkuFxsP5UPK/
         YZppkVQ6UzxjJfYthk6ckknhk3Hlb5q6N8zu/B97B+DlZlKy5MZp83KiPn6JJ4T/qAnw
         SjNg==
X-Gm-Message-State: AO0yUKXJU2T/QP5pAwreB0Vxe7pq0BxtWlEDcIlIGdTs7QMyTe1t0549
	QPJfCEDnFm/Fqjm+d75SKsXXxJNaK44=
X-Google-Smtp-Source: AK7set8zm+XrZGG/HtFfax0h0db5O30uMJph6obF9LBOv8SpENrMCc8niqL2wxQ/cLmAHSk2PuV9zg==
X-Received: by 2002:a17:907:ea2:b0:8aa:f2f2:7543 with SMTP id ho34-20020a1709070ea200b008aaf2f27543mr16234016ejc.29.1676965508059;
        Mon, 20 Feb 2023 23:45:08 -0800 (PST)
Message-ID: <936cd14b-70b8-0c28-3aa8-85e5b3f2a8c9@gmail.com>
Date: Tue, 21 Feb 2023 09:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] x86/svm: cleanup svm.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-2-burzalodowa@gmail.com>
 <0f35ee23-c6f2-9015-4328-266baf287156@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <0f35ee23-c6f2-9015-4328-266baf287156@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 2/21/23 00:12, Andrew Cooper wrote:
> On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
>> Do not include the headers:
>>    xen/irq.h
>>    asm/hvm/svm/intr.h
>>    asm/io.h
>>    asm/mem_sharing.h
>>    asm/regs.h
> 
> Out of interest, how are you calculating these?  They're accurate as far
> as I can tell.

I do not use a script (at least not a decent one), if that 's the 
question :) . I verify that none of the symbols defined or declared in 
the header is used in the file including the header.

> 
> Looking at asm/hvm/svm/*, intr.h itself can be straight deleted,
> svmdebug.h can be merged into vmcb.h, and all the others can move into
> xen/arch/x86/hvm/svm/ as local headers.  None of them have any business
> being included elsewhere in Xen.

I can send another patch for that.

> 
>> because none of the declarations and macro definitions in them is used.
>> Sort alphabetically the rest of the headers.
> 
> Minor grammar point. "Sort the rest of the headers alphabetically" would
> be a more normal way of phrasing this.

I will fix it in v2.

> 
>>
>> Remove the forward declaration of svm_function_table and place start_svm()
>> after the svm_function_table's definition.
>>
>> Replace double new lines with one.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

-- 
Xenia

