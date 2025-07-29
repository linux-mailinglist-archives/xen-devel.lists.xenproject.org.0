Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62EB154B8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063141.1428936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrzO-00028s-Eo; Tue, 29 Jul 2025 21:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063141.1428936; Tue, 29 Jul 2025 21:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrzO-000266-Bs; Tue, 29 Jul 2025 21:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1063141;
 Tue, 29 Jul 2025 21:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugrzN-000260-43
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:36:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0440fdbd-6cc4-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 23:35:59 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so35278665e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45895386627sm1840165e9.19.2025.07.29.14.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:35:58 -0700 (PDT)
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
X-Inumbo-ID: 0440fdbd-6cc4-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753824958; x=1754429758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FqMas0Gvnh8p10bi7MVm3QJ4+XwMIQIpTsd/cCOqDw8=;
        b=m85MN4XfSds/2WBNKknbzrk9X9TvPK0KATQRY7jsHg1BWHWtNHXMBsAeGnKl/QT4gU
         zmGZkaCI3hRJ50aCczAEYxQiBIJAVluQXJfwgkfGXYsuLPyRINhX7HplAJk9Jpe7S16j
         +Tq957s6yrSwkqhuMY0uLh6yKUCvmGx7hn4Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824958; x=1754429758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqMas0Gvnh8p10bi7MVm3QJ4+XwMIQIpTsd/cCOqDw8=;
        b=YqIHvYLahCmhlLmkJ+5yXpGhpPnCZ1JiedV8ATrGaiVzXSeQfM5AnPN1SzEXT2PcDz
         UMTLwgpvSpNFAc7UxHziN+rxFpdqndNIJ8QTdcqn4Txdzu+XBHDwggW7htYgcPkaBTyQ
         ZcGT1RCuxfH/BsXV9/aQtZUsD95O86PXH2OhCdNYeLLjQQhrnBgY96EO+OVpikxJShBO
         zxktDfNFYLld/5as1xTagdAiA0SpYI8/MP2lP2iC0me02L+C55aCOx9B1+E+IQD+Q/10
         nFVDcpO4XK+6wAQc/5aM684DBa4L9igdfb2lUbC7HItSpp/SEJ5mD7Y+uz8ggyRHLTCH
         fnEw==
X-Forwarded-Encrypted: i=1; AJvYcCXaMAKITQa5c7dRGWXSZxh3pIVX1tYdw3w+MnaaQnecak3AlGBIcRdWxFvAmsQHq65xFivKKlP0A2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrLidcVisIev9GtizoSKG0MrX9ZbNfmWPBnIBbbaa19ejyORVn
	5ou1C1VJh+o7w9UHahKjrT5lIGaG5j/pSk1+Wk8ds8qg5LeRsNWK6Su2S2s8xn7wxN0=
X-Gm-Gg: ASbGncsiXFP5Xi4yV7gq8rI6v2nz6pArPZdVRlkP5N9oyBugDm1/+HFtEQo8hlp5bKy
	eAD3EKeIVDVkcLVBY/En5PJzQSDkyponh6ix1inD3Vsu0xoC9DWOOyUEm6yei30FJrd37iEY8aH
	eC0PKvwB5O4+g3yq/MO0U4gpFu6v24jM6jGVKVCYCEKRx4+8OgODxnWUtWPyYJqs076rnp37kyM
	SngB1t4d9dwWjqLau709JkFGDbrBoBcAGI3rU+diFkjvfbCf7WrjvmfLi9zjdSjcKsG7KrsKl5L
	FkwYHT3X0rffvQAtwq3g6Ygtsz+gQcqUyRGWWvfuso7ef6Be+VxqpgSwNhnwwuwXIE800323faA
	QhhSj9KIP/ALzCA8S90332J6D0jxXpUE8OhlfwWqZ+kAHEUf7p+X5u/FdHn5aR0g9pFQ5
X-Google-Smtp-Source: AGHT+IHYtUMvy5LiSzUBaSoeCtXh1GeNJHnICTGCrC6xD/bMr3pviaYBAqaNQ9TMres1fRPVcg24Vw==
X-Received: by 2002:a05:600c:83cc:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45894ca4e1cmr2122375e9.21.1753824958432;
        Tue, 29 Jul 2025 14:35:58 -0700 (PDT)
Message-ID: <d96a1ee4-d1da-40b4-8d21-8ce38957f082@citrix.com>
Date: Tue, 29 Jul 2025 22:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] misra: address 5.5 pirq_cleanup_check
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
 <94a49589ab85c8988979f8cfd29c9124d1dedf42.1753822074.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <94a49589ab85c8988979f8cfd29c9124d1dedf42.1753822074.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2025 10:24 pm, Dmytro Prokopchuk1 wrote:
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index c8c1bfa615..2efb5f5c78 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -672,7 +672,7 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
>      if ( rc != 0 )
>      {
>          info->evtchn = 0;
> -        pirq_cleanup_check(info, d);
> +        PIRQ_CLEANUP_CHECK(info, d);

Well, this is awkward.  This is dead code, but only when you realise ...

> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index 95034c0d6b..958d0b1aca 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -185,7 +185,7 @@ extern struct pirq *pirq_get_info(struct domain *d, int pirq);
>  
>  void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
>  
> -#define pirq_cleanup_check(pirq, d) \
> +#define PIRQ_CLEANUP_CHECK(pirq, d) \
>      (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
>  

... what this is really doing.

Looking at this overall diff, it really is outrageous that we're hiding
a conditional call like this.

We should just remove the macro, and expand

    if ( !pirq->evtchn )
        pirq_cleanup_check(pirq, d);

in most of the callsites.  The overall diff will be smaller (no need to
change the comments), and the end result is proper regular normal C.

I can draft a patch to that effect.

~Andrew

