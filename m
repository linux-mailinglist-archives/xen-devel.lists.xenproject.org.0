Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D77D126D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 17:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619821.965522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtrEc-0001xh-8x; Fri, 20 Oct 2023 15:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619821.965522; Fri, 20 Oct 2023 15:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtrEc-0001w2-6E; Fri, 20 Oct 2023 15:16:22 +0000
Received: by outflank-mailman (input) for mailman id 619821;
 Fri, 20 Oct 2023 15:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkgR=GC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qtrEa-0001vw-Gh
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 15:16:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e364a8b-6f5b-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 17:16:18 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo1391295a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 08:16:18 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056402135000b005333922efb0sm1618109edw.78.2023.10.20.08.16.17
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 08:16:17 -0700 (PDT)
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
X-Inumbo-ID: 9e364a8b-6f5b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697814977; x=1698419777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5p8Zbez3+b5oWMFe2613Z149cqySqsMcLqv7T3zXKE=;
        b=P7IMB7hW6NvCl3cssG7VNPdvHa04jFiPkr27/T9JFgDS0uo473zY8Jt05OWw0+/CwA
         by4mGh2HRxLX+EyYa5Su+N7AcQgbAMNLiy3Kha4f+PYRB7O3nzExUpz1P1tDVLLDaegr
         2ibS5MO/DJrIY9wc0fH6tqXCX1Fa7Thhs8t0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697814977; x=1698419777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5p8Zbez3+b5oWMFe2613Z149cqySqsMcLqv7T3zXKE=;
        b=LexlEe9jSkSnPTnmszWbs8qCeIgB2FAglwJ+n7QlznRdYQo0Ramt9R5333cmVK1Ijk
         gZ4TBEaJ6NDKduiteRbYeYuHweWkhcL6vGiBA72SlqDbEgrrbzDRI9zi01/oEKK8ZIdb
         4Bqkxx588ohYiTdN0Dmpiw+B1QPKv/zdU1o0kGebeJCerJNVFrHwUEas6JB57JC+cEXQ
         sJu2wCxnxK6G06nnbdSNMDAgxPjK9q+bcPP0/8Xv/MfQcNWUCdVetxrGW3KRUch6LiCc
         NDMb9nVeFIa9QMO5cyInU2EVe51cD4g0lRSPBtxSPvhpc4ow4gunS5vZPBQEUIAfmbGV
         ZvzQ==
X-Gm-Message-State: AOJu0Yx0/NZtKalcJLZx4N+1O5aclt812Jm7FyTXnWXVFzq27DYcUaN+
	4ycultH9qvj6qKyGJDFCZMOsq7mvllsJdEvsaUfzzw==
X-Google-Smtp-Source: AGHT+IG5gaDoPf4+JRTIPU9q2GHHwaXadYUyIx4ql7OzAEJU70hPKVxi4x969EA6uKBe8LEkms8ucA==
X-Received: by 2002:a05:6402:50d2:b0:53e:ba3d:acb9 with SMTP id h18-20020a05640250d200b0053eba3dacb9mr2082846edb.24.1697814977674;
        Fri, 20 Oct 2023 08:16:17 -0700 (PDT)
Message-ID: <ff1a67f7-8b33-4e7e-8e31-d5201f7212c1@citrix.com>
Date: Fri, 20 Oct 2023 16:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
 <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com> <ZTKAqBILUBNelYCS@macbook>
 <7e1fb34868adfa51f1a48eb8d77f4b92643db85e.camel@infradead.org>
 <0c2f1fd0-22d2-419b-8fc3-4788563fe9f2@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0c2f1fd0-22d2-419b-8fc3-4788563fe9f2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/10/2023 3:50 pm, Durrant, Paul wrote:
> On 20/10/2023 14:37, David Woodhouse wrote:
> [snip]
>>>
>>> [0]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/tty/hvc/hvc_xen.c#L258
>>
>> I'm not convinced I believe what the comment says there about evtchn 0
>> being theoretically valid. I don't believe zero is a valid evtchn#, is
>> it?
>
> gfn 0 might be valid, but I'm also pretty sure evtchn 0 is not valid.

GFN 0 very much is valid.

evtchn 0 OTOH is explicitly not valid.  From evtchn_init():

    evtchn_from_port(d, 0)->state = ECS_RESERVED;


However, the fields being 0 doesn't mean not available.  That's the
signal to saying "not connected yet", because that's what dom0 gets
before xenconsoled starts up.

~Andrew

