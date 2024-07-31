Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE5943457
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769019.1179926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCTh-0005PH-Lt; Wed, 31 Jul 2024 16:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769019.1179926; Wed, 31 Jul 2024 16:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCTh-0005NR-J9; Wed, 31 Jul 2024 16:47:05 +0000
Received: by outflank-mailman (input) for mailman id 769019;
 Wed, 31 Jul 2024 16:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZCTf-0005BK-N9
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:47:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8293bb66-4f5c-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 18:47:02 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aabb71bb2so816321466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 09:47:02 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab536cesm786447566b.84.2024.07.31.09.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 09:47:00 -0700 (PDT)
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
X-Inumbo-ID: 8293bb66-4f5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722444421; x=1723049221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X7GvT4JakZHIAsuI/+PcazpFhy1evIsVaV/HmXZwsuY=;
        b=UPIyV1NP92hSLYZDnirqrXdHgov/qRJTgiWWLPWXHdwDoCcr6rEzZWEJekFRUkj4Cg
         qSrL7t4HmVMM4w6Um/dHXuKjVBfAlVZYTRJW2a2/Z/mz2ezzEmQA2KF3ebVjayOu/JtD
         v+AskMUEPhpUVWQefhdJoXrrjQTTRmc+LAS4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722444421; x=1723049221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7GvT4JakZHIAsuI/+PcazpFhy1evIsVaV/HmXZwsuY=;
        b=APYkxdjHpZdMNPsTQ5N0UWXFE93a4J4nVkIeIFRx0OWpaGi4CfZaQFuY2bsUcoECcX
         +UKhgd/gOZpsZPgzQ9/7SvYe2vI0GfYmfnvTOiz/j6tCzlb1airONG/y/21ND22AkkJs
         aKy9bRi5hOGwfUi9AEXCnKDn+eRk4Xs0f4W0M9moX0l3+260fhEB9dxNWts4xdIV5m5p
         +bLvdzvDwm4gFDyn9e/Xf7YFTVbzVH6lRxNvprsjCDPTfRcUXl6jH9aTCIbPoljaCntc
         o/YfMKezVABCbL9n0ucmKC3bt9KgrjGFE2w0bJLUl34N96hShjqg+owUiO2FUKhGkO51
         qnAw==
X-Forwarded-Encrypted: i=1; AJvYcCV4SgKBwQlRzhjk2JLb4NqFHjveWGcffeB4fErJQqMWv+H8NkYv1yK0jpLdzqDOUvCa8wttt8yKK1pFm+oYg6crQvXmNomNoTgMyTih2FI=
X-Gm-Message-State: AOJu0Yx4s8k2rL/8mbau8c4KVR7Sils7PWdr3YdWdvNsS0zNUFjFMb6B
	S2nKT3bIeJRPjbUIVJb+FC6oDtJUjv8MvGabcaFR90pPF+fcRHNGiTF2VLFxgME=
X-Google-Smtp-Source: AGHT+IEGdSnD+oYgAbwL1NaAtJmeYpj7IFthJ7cQLrcUNYR2Kh++n8GnJUwFQidVHlBAuZ82DlOVVA==
X-Received: by 2002:a17:907:18c6:b0:a7d:a080:bb3 with SMTP id a640c23a62f3a-a7da0800e94mr134395366b.33.1722444421263;
        Wed, 31 Jul 2024 09:47:01 -0700 (PDT)
Message-ID: <e560b170-b00f-415c-9e45-3c287ffd3b3b@citrix.com>
Date: Wed, 31 Jul 2024 17:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240730152855.48745-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2024 4:28 pm, Roger Pau Monne wrote:
> The PVH dom0 builder doesn't switch page tables and has no need to run with
> SMAP disabled.
>
> Use stac() and clac(), as that's safe to use even if events would hit in the
> middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
> not safe, so the stac() call is done strictly after elf_load_binary() because
> that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Summarising a discussion on Matrix.

There are 3 options.

1) Simply reposition the write_cr4()/cr4_pv32_mask adjustments.
2) This form (use stac/clac instead of playing with cr4).
3) Delay the original set_in_cr4(SMAP).

As proved by the confusion thus far, cr4_pv32_mask adjustments are
fragile and can go unnoticed in the general case (need a lucky watchdog
NMI hit to trigger).  Hence I'd prefer to remove the adjustments.

Using stac()/clac() is much easier.  It is fragile because of nesting
(no AC save/restore infrastructure), but any mistake here will be picked
up reliably in Gitlab CI because both adl-* and zen3p-* support SMAP.

Personally I think option 2 is better than 1, hence why I suggested it. 
It's got a fragile corner case but will be spotted reliably.

However, it occurs to me that option 3 exists as well... just delay
setting SMAP until after dom0 is made.  We have form now with only
activating CET-SS on the way out of __start_xen().

Furthermore, option 3 would allow us to move the cr4_pv32_mask
adjustment into set_in_cr4() and never need to opencode it.

(Although this is a bit tricky given the current code layout. 
cr4_pv32_mask also wants to be __ro_after_init and non-existent in a
!PV32 build.)

~Andrew

