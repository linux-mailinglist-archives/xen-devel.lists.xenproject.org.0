Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511DB98F353
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809617.1222040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOBJ-0006y6-G0; Thu, 03 Oct 2024 15:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809617.1222040; Thu, 03 Oct 2024 15:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOBJ-0006vd-DG; Thu, 03 Oct 2024 15:55:57 +0000
Received: by outflank-mailman (input) for mailman id 809617;
 Thu, 03 Oct 2024 15:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNe7=Q7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swOBI-0006vX-BL
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:55:56 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f959d9b4-819f-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 17:55:55 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5398cc2fcb7so1365637e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 08:55:55 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9910472ba1sm100622966b.161.2024.10.03.08.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 08:55:54 -0700 (PDT)
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
X-Inumbo-ID: f959d9b4-819f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727970955; x=1728575755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=33kSgyhQmgeJG1ypM+SZFw9jtkXS2IvainDxKi4tE4c=;
        b=Q1Rnb6xsncUhEjoo2reR2nWNrJf4J19IwVEvmhxeRVGjVhE/3Usoe6ofxJ0QeUBPNe
         QAckUtnyqzW0A1QIjoXXO1ykKg1RhXwUpBR65QgxlUNsSUZYRKX2tKlWYaY8MDfwiSHo
         RhaG0RQ/seBIMiX0uVarKGJQbkYekNYWIOJzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970955; x=1728575755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33kSgyhQmgeJG1ypM+SZFw9jtkXS2IvainDxKi4tE4c=;
        b=Jt8X/iybVKWlZWkGTCyn0/lB3JRdIvIzVTfulP1WsOeVqLqjrBlnJFI9U3TWgX29ag
         La7Zfkrsv/B91mwnShgYqIzGS+YaSgxcE9dcxJBNeaQixQRCiYGxAls2VJKGjoJeGc/G
         Qzixv/H094KOShjjLP5+b7Lsm8Vwe9VTG5y9K1vvft6kA3jqG7gkwJMg3stjWMO09iPd
         sxx6ODTC+68fYazJLVckdV1PG54+ChQOD7HiMzL0cbKYfhZpk3IgXTKCLQ5jV5I2+zSy
         p3E0wYuqxetDtjfOX5ffuLOCqnk1KJBMr0B6OAMOlIDCmI1dlPhUwKnD4/pKWlxaojrN
         P0rg==
X-Forwarded-Encrypted: i=1; AJvYcCUVmjjPxa00FueMAT8pGjofKxhGTlLj/xp1YilA/M0Ukpu7LO+Wku6beuLmK6wuEiCqMxxgNqBH3Pg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkXXA0elPChkj1uuRb8oxSQn2m2CjoZVVJnlLE97sA1aPWAqW/
	Q29DZXTJaf+nkFpg9fwWdkEgyYU1XFkpdWyB3U1129lwKqlpyQ5WU5Zhi8I/aHk=
X-Google-Smtp-Source: AGHT+IEhhiQhjYR3gP0QLu8zCBTrdovTb9KN4ZFotYcBNCnInfziVYwJpTP4T7/lx5ff1I0y4tz5xA==
X-Received: by 2002:a05:6512:e9e:b0:539:8b81:7f04 with SMTP id 2adb3069b0e04-539a067b936mr4759518e87.32.1727970954811;
        Thu, 03 Oct 2024 08:55:54 -0700 (PDT)
Message-ID: <b9f609a0-d641-4cd9-bf2c-eb1929038587@citrix.com>
Date: Thu, 3 Oct 2024 16:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/dpci: do not leak pending interrupts on CPU offline
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241003142036.43287-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241003142036.43287-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2024 3:20 pm, Roger Pau Monne wrote:
> The current dpci logic relies on a softirq being executed as a side effect of
> the cpu_notifier_call_chain() call in the code path that offlines the target
> CPU.  However the call to cpu_notifier_call_chain() won't trigger any softirq
> processing, and even if it did, such processing should be done after all
> interrupts have been migrated off the current CPU, otherwise new pending dpci
> interrupts could still appear.
>
> Current ASSERT in

"Currently the ASSERT() in"

>  the cpu callback notifier is fairly easy to trigger by doing
> CPU offline from a PVH dom0.
>
> Solve this by instead moving out any dpci interrupts pending processing once
> the CPU is dead.  This might introduce more latency than attempting to drain
> before the CPU is put offline, but it's less complex, and CPU online/offline is
> not a common action.  Any extra introduced latency should be tolerable.
>
> Fixes: f6dd295381f4 ('dpci: replace tasklet with softirq')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Yeah, I'm not concerned with minor extra latency in the offline path. 
In production it's used 0% of the time to many many significant figures.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

