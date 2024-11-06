Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EC9BF24C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 16:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831234.1246434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iOy-0008Ui-1m; Wed, 06 Nov 2024 15:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831234.1246434; Wed, 06 Nov 2024 15:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iOx-0008Sa-U2; Wed, 06 Nov 2024 15:56:59 +0000
Received: by outflank-mailman (input) for mailman id 831234;
 Wed, 06 Nov 2024 15:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8iOw-0008RG-Gd
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 15:56:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bddc291b-9c57-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 16:56:53 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so186567866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 07:56:53 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17ced03sm303162266b.104.2024.11.06.07.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 07:56:52 -0800 (PST)
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
X-Inumbo-ID: bddc291b-9c57-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJkZGMyOTFiLTljNTctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA4NjEzLjQ3ODg3NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730908613; x=1731513413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=28gQ1hYY7abQh9NSjEig4Q+GbvE8lmNYJgG2nLQs48I=;
        b=gf9CXSgW7MRVWA58OWEBupRRIufteV3wDOCJQLByhf4kDmnTYac+PCwXoz7yImHB7I
         pXREgo2v7Y/wTFX5P9E7BX4a+eSJEOkTr9ftS8lz/v82u4v8hlKAQKT2S/Zod+4YN3RI
         wmgUbflOmAwsHUvSgFrgKLqrkMMh/rS0U2qNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908613; x=1731513413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28gQ1hYY7abQh9NSjEig4Q+GbvE8lmNYJgG2nLQs48I=;
        b=np2b0UQknFs6am8E/2IfeE/wIswxffxZERok2vlx2prssNtp0ljovmkMpkvKc7SvWU
         LL1yyIpa9gBsnYWodvddEEXlIk6Rk6pokECCrEF5DZx0Qr3bpRJsYEok8Wazp3kLxCoH
         5YZurUKLX3q6ec1pM32U2CL6jMmFhsNHRH0wIjTTmMuleLkHT5CK+IhW1tqknMFkMxm+
         chQ3zqucOD36alPHDUO+J3DAcSKlvI/7Hhj/y1wfYcGg/i4zn8g7Sl2FlQwqMFP9vEHU
         xbSkBBehcvti0eq7bJaaJI5jDiv/BwPOFVqtM2q13TZwc8z4nwabimECTdwTFmWDxgCa
         4yPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+7lfSX741weQCPXB0Jx/M7Gg1+WrZNwI43TcwJCHZuBqS5ai5006wTSQH0rP7cVcBl2KeZBT3kWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWnIok6oktW2tQuV06RYeXGdz3oSRkEAbsJLe2d0fjTvE37Slc
	d+gvRE0fzPVWNlThqWrr6jpzXyFm8OdLzDtusN+fZ3CG75LXmI5Se2dO0uUvqWfskMyFAUvSEuK
	d
X-Google-Smtp-Source: AGHT+IEXWx0VTz5dD4VqLOaOjHn4nS72HGo6D0/GXLmasjckAmEcUzRIDKccgPTDXAofGijCXqdtbA==
X-Received: by 2002:a17:907:1c95:b0:a9e:82f3:d4ab with SMTP id a640c23a62f3a-a9ec66047e8mr279288766b.9.1730908612912;
        Wed, 06 Nov 2024 07:56:52 -0800 (PST)
Message-ID: <21d4af14-23ba-4783-bf9e-d670f72d1745@citrix.com>
Date: Wed, 6 Nov 2024 15:56:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 6/6] CI: Don't use -y with apt-get update
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1730743077.git.javi.merino@cloud.com>
 <67fbec9dd324802e1a1c5e3c38ae7853ede35e86.1730743077.git.javi.merino@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <67fbec9dd324802e1a1c5e3c38ae7853ede35e86.1730743077.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2024 1:05 pm, Javi Merino wrote:
> apt-get update refreshes the package lists.  -y doesn't do anything
> here.  It is needed for "apt-get install" or "apt-get upgrade" but not
> for apt-get update.  Drop it.
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  automation/build/debian/11-ppc64le.dockerfile        | 2 +-
>  automation/build/debian/11-riscv64.dockerfile        | 2 +-
>  automation/build/debian/12-ppc64le.dockerfile        | 2 +-
>  automation/build/debian/12-riscv64.dockerfile        | 2 +-
>  automation/build/debian/12-x86_64-gcc-ibt.dockerfile | 4 ++--
>  automation/build/ubuntu/16.04-x86_64.dockerfile      | 2 +-
>  automation/build/ubuntu/18.04-x86_64.dockerfile      | 2 +-
>  automation/build/ubuntu/20.04-x86_64.dockerfile      | 2 +-
>  automation/build/ubuntu/22.04-x86_64.dockerfile      | 2 +-
>  automation/build/ubuntu/24.04-x86_64.dockerfile      | 2 +-

Judging by this file list, the change is independent of patches 1-5, so
can go in straight away.

~Andrew

