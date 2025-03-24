Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAAA6DC1B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925572.1328442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiD7-0006p0-Pc; Mon, 24 Mar 2025 13:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925572.1328442; Mon, 24 Mar 2025 13:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiD7-0006nY-N4; Mon, 24 Mar 2025 13:51:25 +0000
Received: by outflank-mailman (input) for mailman id 925572;
 Mon, 24 Mar 2025 13:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jtpT=WL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1twiD5-0006nR-SW
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:51:23 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11c0a6f5-08b7-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 14:51:22 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso423128866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 06:51:22 -0700 (PDT)
Received: from [10.81.43.157] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb64895sm675311166b.113.2025.03.24.06.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:51:20 -0700 (PDT)
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
X-Inumbo-ID: 11c0a6f5-08b7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742824281; x=1743429081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jnJLIrKjfDEdu6JvAt5qo9/EkSvuY2OFElmNaSvA5go=;
        b=sBd7RElBEAFcCZtHPc3H+yNQwynuQcY8ExL1+1flFxbBljm/Kd/mAZVbJ+7bhqy7ZI
         HdsomhfkY3qfbyhU9gHkxize6Gnhs/FfOIstx1RG2f2ZJAq1/OS8axhNEuktZrkl+UYk
         08L3RfKkVjfg2s28c/flAdT5wKOsYW/Ox9bMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824281; x=1743429081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnJLIrKjfDEdu6JvAt5qo9/EkSvuY2OFElmNaSvA5go=;
        b=WEQZGdKxB7m+t5AsqzrKemdpMeDwXJRLWF6JpoifQlL+qKwBqWB89AtCUQzFc1O20H
         CyxBefLNSZeveDxEhBgSpmAD8ttCGUwToj/1E7n8dQRicgqZyFFVsjWiavd16AO2nNSn
         oajoFpXEPYZp8wQk78+ftVsfWo1iSsxxJYwG5S+JHW4WVEv2v1iHJU+QbpA6MDDr3lJo
         MByoRwf8Kxf6gpmZpfEgBCyfAm8oNxfACn4Ab6qthWiPiuFbK6MD4YmzDr3zRhB7Sq8l
         mXEK7lOXIHPQ/mnZsU5mkO8l+jrjdbVC8nMmQbUhA5VcuZlz6VmfJ5IvG9Il2YrW34qO
         +58w==
X-Gm-Message-State: AOJu0Yxw0TFjVrm25ru5nTL7RpxfA3EUdQy+JOWM5WOsGLGBI9L44MPn
	iuo3OnMXSIe8nt7qYvHy2t2IT/yba3PgtTldsFksU2fJcHs+Zs9I0eDRj0XEMkckVOd48fGbpXR
	ApaY=
X-Gm-Gg: ASbGnctJgBVYa4g5vo26eMSXEWUE4uTmPSqKoBQvzhDAubrtzbXQ/nVD+V6lE6Oq/Ed
	fvHDjwG+UkQhW4u6rTJ3ClaQdgUEET8bPSl3nhJa6LcnmBuefdCpOlyCcBXlsiuRU/9tH+ajIpz
	9TbuIgzd74UfpC5VeetiqIHZEPqBqmwfSfsiey95XAwxhGHqClqF60v2tvItNqGPFncxvwcK1r3
	uswsgJI/+qm6jKfCx3osPJGgA3QJBzGdVFLsIubH0+P2/oylCRqmNKV83X4sdbfFB8nSPLA8ek/
	vDeFbMnbFZE5H2yeV7PgW6qISGUnWCGo0BLgpBt30RWTtvxAfyXFBT4=
X-Google-Smtp-Source: AGHT+IEQdMjmVBE/jvJcqEQQFnt8b9Gj0MiQrtVdnZ54jyocGIji8p+kC5LZN1ParemKsjq5gl4kGw==
X-Received: by 2002:a17:906:f59d:b0:ac1:daba:c6c with SMTP id a640c23a62f3a-ac3f22a0c6amr1225624466b.24.1742824281033;
        Mon, 24 Mar 2025 06:51:21 -0700 (PDT)
Message-ID: <7b16c87d-f2af-451e-a58f-36461a697ad7@citrix.com>
Date: Mon, 24 Mar 2025 13:51:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
To: xen-devel@lists.xenproject.org, dmkhn@proton.me
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250320230339.3897874-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250320230339.3897874-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 11:05 pm, dmkhn@proton.me wrote:
> Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
> range as per [1]. This macro replaces hardcoded checks against the
> open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
> the code a bit.
>
> [1] Intel SDM volume 3A
>     Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
>     Section "Valid Interrupt Vectors"
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Would it be possible to adjust your git configuration so committer is
set to Denis Mukhin <dmukhin@ford.com> ?

Right now, it takes manual fixup to prevent your commits going in as
authored by dmkhn@proton.me, and one already slipped through. 
https://xenbits.xen.org/gitweb/?p=xen.git&a=search&h=refs%2Fheads%2Fstaging&st=author&s=dmkhn%40proton.me

Thanks,

~Andrew

