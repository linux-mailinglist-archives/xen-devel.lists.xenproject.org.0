Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38EAA77C02
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934331.1336061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbcL-0006Aw-QC; Tue, 01 Apr 2025 13:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934331.1336061; Tue, 01 Apr 2025 13:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbcL-00068o-NX; Tue, 01 Apr 2025 13:25:25 +0000
Received: by outflank-mailman (input) for mailman id 934331;
 Tue, 01 Apr 2025 13:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzbcK-00068i-7F
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:25:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c368a62e-0efc-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:25:22 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so4936511f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:25:22 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff02e84sm155652855e9.32.2025.04.01.06.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:25:21 -0700 (PDT)
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
X-Inumbo-ID: c368a62e-0efc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743513922; x=1744118722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VFMj127YW25n0oGy9qJUEugIqGXnAG5LIQf0LifWFt4=;
        b=FqOU6mBTxEUV/YIrBXlHlZmZ2A0i94cZs9hhavuyL9x+EQeOe/g4OEFVvo9eoyxje6
         T26mkmiuqZ10YwZVmoNf1F8R++nRYr74bhcvn+bk6UIq2tu01cyFyaccI6d1dL2bL2nh
         EPUNOSjMhb0sunP6sUUWpr/qcuaOaaeIqKOTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513922; x=1744118722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFMj127YW25n0oGy9qJUEugIqGXnAG5LIQf0LifWFt4=;
        b=vSXNzQXrNtBciqzYjzzRfcmE3Tn9KFkjpiMKw0ct9xIhqgY3SDUIhc8nB3fS9G6poF
         LGBP1CTsTr4mnFM+51OQfeoBsPgxtHc1lbCMsTYSUAAFAY0+s7hmldArlzN57PukHu8u
         1sscjtKC3x/SPzURrQW8GmCCEsMuiJ9CRdqU8G1dAw0CCMPXNCvrUfL5R1nJuSw5Nufa
         haKZZthjaXXgwsqle5wZwyroVGnmqgEodohBIMP9p0og3qbrjp42/nEi9ZPkxJgoUyfx
         t8abIdz4J6jvvAzD1yiOsVvrGobdhxQsSMe/ouU90hENlqfoWkS1tQFVu2c8lPyYMwWT
         wvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGznOkC9XSmP2/NtfhKS7AJOgwLwVlaxGP6/Pxwp9VX2V0sYY1JAG/sYfvGgiD7DnFkfby3D3QV08=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8o7jHGaKpMsWxH4Kfq3Qfyq6DmEKe9VQ3PRp7fa0SGOJchfx4
	plJca7PP3rSEQZIZGzmT7Y2KEOgvkEmO1hmV5K9am0coJDo5lsVbqr1MVMDP/7A=
X-Gm-Gg: ASbGncvGCppMSUtYg8WDQeBkusdCb+e6i1oPuOXCGKf1Janodjox2IJ8UJj6P4utNaQ
	WVIOOYFjIt0XND9oUjYwRKeDj23Fluq5P7EDDiEKyWWXV4+sLdB2746xy5P/r1TQExTfOMNrVOi
	hNK8RSVSmypCgfyEfsT+SfUSezK9/Lu220VNVjHcfV8QcUbqWzl7ueyVNHNNWQLGUM88CqQBMKG
	n9RLhJBrAHUwACAfe0+aKXr7P5c62TYR/LbSF59L+xon431BM2zDbSUqjP4YsKP731KFnx/vdgN
	qW1qGjoNZATw10k1R7jFEHLzLuHkJJTtOEuAhgQXhPRAvBmNMPXWCtXB+D81Fmp546uljGIxaxb
	4HooUlSRY0UmBS8G2OASw
X-Google-Smtp-Source: AGHT+IG360ggLaWG8FKCdyc/K4kBcyCk1bzcQW8J0PBqjcMH4nHrVKICd7xpMX96ld65TMwefDEyKw==
X-Received: by 2002:a05:6000:430c:b0:39c:2692:425a with SMTP id ffacd0b85a97d-39c26924316mr1651885f8f.6.1743513921744;
        Tue, 01 Apr 2025 06:25:21 -0700 (PDT)
Message-ID: <2ad947f4-3a04-4461-a6ec-203ec350de4b@citrix.com>
Date: Tue, 1 Apr 2025 14:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] automation/dockers: add to README how to rebuild
 all containers
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401130840.72119-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 2:08 pm, Roger Pau Monne wrote:
> Document in the README how to rebuild all containers.  This is helpful when
> populating a local docker registry for testing purposes.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm working on extending Anthony's container-rebuild pipeline to do this
too, but that's not quite ready yet.

~Andrew

