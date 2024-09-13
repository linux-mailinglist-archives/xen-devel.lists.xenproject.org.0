Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95295978074
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 14:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798180.1208307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5ld-0003J6-Rd; Fri, 13 Sep 2024 12:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798180.1208307; Fri, 13 Sep 2024 12:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5ld-0003Hb-OY; Fri, 13 Sep 2024 12:51:17 +0000
Received: by outflank-mailman (input) for mailman id 798180;
 Fri, 13 Sep 2024 12:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sp5lc-0003HK-Q4
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 12:51:16 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dca7dd8d-71ce-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 14:51:15 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-371ba7e46easo1602633f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 05:51:15 -0700 (PDT)
Received: from [10.239.240.84] ([88.128.92.31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789567625esm16912174f8f.64.2024.09.13.05.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 05:51:14 -0700 (PDT)
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
X-Inumbo-ID: dca7dd8d-71ce-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726231875; x=1726836675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9gLBp0koInF/0xK7yidGfze0vMjXyRfth55udug9Lk=;
        b=cfBZ0RYhkLkDQAFkGAAOyxwQPXYXboOBUOl4IN0/RUspLxN69hdENUSI6zkHsgtDIW
         iVW42AghDbg/0aIGPXzmyLtjXXBfFv1uP6+r4RuWgGkZaxpl0fgs/1xK4WfZIk1yVWiD
         zhOIly2ewZl87NpR8WJSLjpxoS7jgJF5zF8yXLFZuTAnw6NBoNqDo0PUFYA1dvH8AKam
         X4ZAX93d8nZhHLDzbbCbOKwS4MQg8R3tDCXRzMv+3QnWSkobR5tHpA3lshAUnxnP75ty
         1xL8xfwFFB2Ci5dL2o6Mx5r+sivkrDW+Beggesht6wJ8+vTl8J/xtPiGtQYUUKtZoweR
         RQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231875; x=1726836675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9gLBp0koInF/0xK7yidGfze0vMjXyRfth55udug9Lk=;
        b=Fl0xbKsVFHZkgyKlBaCwQ7o6VClGm8bbPPEz147fZx+XzsaWTPI3pijnDeMBypVRsb
         IzzPSDk1+w6hLsiSwuxEY1VcmrdeVcj42Plrx0JKNn1VnIV+SR3pGH4mQz/QqbJlP5dz
         KmYP9OSfqklkmr+o8yz6gWe2a8Fa1rFsyb1OyrLHKSNRT07xPG6McqQYlXxuTJ7m/mqv
         6Dygqes0PxszsgaNRi1ufjwx+fucvbc6KWo09YvrU3YaBgEkUXmuHS2AjMwUOuWpI46X
         aVsszluD4tOrRgvovu9hwuFiyoEtm41YRUonz7qOST/Ck0qMQuAwKl0dw9+Tiw6ftm1j
         +VDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzHkUnKoVxxAMm6wtImFJ4DnRLLKb8UveM6FJtsC6/11sxivdzibccdLVrvRG74Q92NVt8/U61LfU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4U2YUxKUs12R9/7BPfFDYZHpa1Ni7sQ2ggukrNPIQNDSEbJn/
	MoO/5GSFMnet019YFpjpHEB91LcJB6o7Nga9486JO5YeMRyL/14I2LrXvJoNIA==
X-Google-Smtp-Source: AGHT+IHcFt8x7R61lxcaVgZbyQgQBM+wnzvwair7NyEts2wmaeJ77fV1848dFyeDhVgUd+bBx4CAbQ==
X-Received: by 2002:a05:6000:11c7:b0:368:633d:f111 with SMTP id ffacd0b85a97d-378c2d4c92dmr3758587f8f.40.1726231874418;
        Fri, 13 Sep 2024 05:51:14 -0700 (PDT)
Message-ID: <e0dd1013-ccf5-48b1-b6c5-371b81a41937@suse.com>
Date: Fri, 13 Sep 2024 14:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
 <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
 <2e0213cef457234037980f45e338efd586bc7870.camel@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e0213cef457234037980f45e338efd586bc7870.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 18:02, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-10 at 12:33 +0200, Jan Beulich wrote:
>>> +/*
>>> + * Mapping between linux logical cpu index and hartid.
>>> + */
>>> +#define cpuid_to_hartid(cpu) (pcpu_info[cpu].hart_id)
>>
>> Does this need to be a macro (rather than an inline function)?
> I started to rework that and I am using this macros for both read
> and write. So it will be needed to introduce set and get inline
> functions instead of just one macros. I think I will stick to one
> macros instead of 2 inline functions.

You may want to consult with Andrew as to use of such a macro on
the lhs of an assignment. I expect he'll ask to avoid such, and
instead indeed go with both a get and a set accessor (unless it
would make sense to simply open-code the few sets that there are
going to be).

Jan

