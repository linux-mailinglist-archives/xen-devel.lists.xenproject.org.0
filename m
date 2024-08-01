Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231CF9442F3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 07:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769299.1180175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZOpL-0004hB-8i; Thu, 01 Aug 2024 05:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769299.1180175; Thu, 01 Aug 2024 05:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZOpL-0004eE-69; Thu, 01 Aug 2024 05:58:15 +0000
Received: by outflank-mailman (input) for mailman id 769299;
 Thu, 01 Aug 2024 05:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZOpJ-0004Wu-Cu
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 05:58:13 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08eef0ea-4fcb-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 07:58:12 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so690618366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 22:58:12 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41462sm832456166b.119.2024.07.31.22.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 22:58:10 -0700 (PDT)
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
X-Inumbo-ID: 08eef0ea-4fcb-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722491891; x=1723096691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrzXj9hBjHLBbAPVtBe7OuM7CtNeowl5zK25rnUfrqo=;
        b=QBf+a7ZE59iX0mqhLMbFxkZmWMqQsQCDviDjsTtYBR6XVMQJw5UV9py722Cz8vilj2
         rFdmrxVj7kOaz06g1ygRZZhIM61Ya3jn98r7GznPBMBet5q0TX6N2cnG/Dqw/iQ67Suw
         cisbtir4WFB5bWfCZk49kEkjemt1fAGRZAq3OTe8hJL14yTbmE74MN8p4rLIkVfSnOqh
         8fkKKldrh4TyvVQjPACzg9yFMKhvyyf+5bNtsAH6TNu7/ohQzqXHO7cwHi4ZabVc00iI
         FwbRgyCtej3fHMbPBLBO2C4pcKDxc0wpdS9uztfwHZHeyUSOMWbyaB7v5IrGpvQ/IlLT
         hCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722491891; x=1723096691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrzXj9hBjHLBbAPVtBe7OuM7CtNeowl5zK25rnUfrqo=;
        b=QZrxjSV3rw87k7g7mqTdZfI5U6SpDSLOCT50u08VS94A9Sd0a5xtRBJjy9WCBK/Cqr
         /s/Ylpx2/WJc+YqVFjlqCRvX7Tps0WOv/Tpvc0GaBKb4q2Mz9jw8ho76lUL5pC4BcZ3V
         x1S9X6t1W8xT/WemRaMfTIyn3dU3W3ck/pW4aRFlOT8WdKrJltQBgyVrjuMtlnKjMCtl
         61v6Y872nSZf8Y96RY6yx5CSoMGY6i5VGyiF5nBTooV3f6KeFayjFuhmqLkhayE5e003
         cAy2BhBIKgyEE2DscDDnydT9+3MM9iOn+vZ9+8GtiOuRBLTFrxTRqxda6waV1qshn0cS
         ePbw==
X-Forwarded-Encrypted: i=1; AJvYcCV6kyH+vsKhfIDBre0SpSR1x68viZFtBUXOLO3O/IolNP+K2PFDHN5selXSLnxlCDlX+RE4ZDSuhK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww6pn+jjJAuM7lCQc+BJbkOBJecfUJcEqtbND3kxwf7OxFdlnW
	p/9VogmooFi62EJk5eD+/89cFY3A/dOd85iSp3dUf0P4ChEfBu7JDWqL+PP/Tl4=
X-Google-Smtp-Source: AGHT+IEdxR2PF49t/h+j3Ngv/qCjOIRoXd8vL5KzVadxEPd3A7uUAOZ4ec5zEiP0fanRdbUZ2q4XXw==
X-Received: by 2002:a17:907:7ba8:b0:a77:e7cb:2982 with SMTP id a640c23a62f3a-a7daf9ddda6mr86982866b.26.1722491891199;
        Wed, 31 Jul 2024 22:58:11 -0700 (PDT)
Message-ID: <3e678546-282b-461c-9a3e-363799f24e80@suse.com>
Date: Thu, 1 Aug 2024 07:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mini-os: mm: introduce generic page table walk
 function
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-2-jgross@suse.com>
 <20240731213312.7qztj2qwv7g4if5e@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240731213312.7qztj2qwv7g4if5e@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.24 23:33, Samuel Thibault wrote:
> Juergen Gross, le mer. 31 juil. 2024 15:00:24 +0200, a ecrit:
>> +            ptindex[lvl] = (va >> ptdata[lvl].shift) &
>> +                           (ptdata[lvl].entries - 1);
> 
> It seems that this kind of va+lvl-to-index computation happens several
> times? It's probably worth making it a macro.

Agreed.


Juergen


