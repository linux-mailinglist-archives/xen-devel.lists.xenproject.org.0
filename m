Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D988AD99
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 19:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697856.1089047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roouy-0004zV-VB; Mon, 25 Mar 2024 18:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697856.1089047; Mon, 25 Mar 2024 18:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roouy-0004xy-SY; Mon, 25 Mar 2024 18:19:32 +0000
Received: by outflank-mailman (input) for mailman id 697856;
 Mon, 25 Mar 2024 18:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O34W=K7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rooux-0004xo-8u
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 18:19:31 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387737b7-ead4-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 19:19:29 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-341cf77b86dso939225f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 11:19:29 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bh9-20020a170906a0c900b00a461b1e814asm3296707ejb.130.2024.03.25.11.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 11:19:28 -0700 (PDT)
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
X-Inumbo-ID: 387737b7-ead4-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711390769; x=1711995569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvBsIoalMhTbP8dXubwTtIrROadED8ydufDKo1YTCFQ=;
        b=IcBLQ+1whxcEgN8ekMqPcsmXCb7ycgYeY73WW63iACta1qWpsASP1uNc84R8zndXfS
         7zxnbCglskx1tW7XLSIeYip/MOEGzblaItUTPA1AMdFSf3qlo7J2v0aPrgC6fBiU7dDu
         rfQuYau026mjeFurqFaKJ7mtH93b/uJVTc6ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711390769; x=1711995569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvBsIoalMhTbP8dXubwTtIrROadED8ydufDKo1YTCFQ=;
        b=vW5tKecn3qY+Xp32OMtO4G9+LpnNdr/I4nf+JPAaJJNp9tpDUVybU7XhwT51FnJqHK
         PnfqbCt3egiFu7of86unpTjdLxqH+bffvul1nPw4UY8xZ0VI1LyC+qVYViiv1IlXdWnq
         C+H0PpwMn7eJxC63P2TPBvL1GWqgMq905XqlAQ+co3bMIeeSJr8uVmuU0yHNGrbpI7ab
         mVhB1WYv3CexjdqEXnVkv8tSqM11lgUz5XdIkDQ4EHliMcrwqprBoH/m0WkyOWstNGOX
         /oxGxnD29O6lCHMHU3vBhItaBrjGmWXtVIFJ3G/JqihRWXdIzZ6XAPaynKMNN2pfxHSN
         1Lhw==
X-Gm-Message-State: AOJu0YydWHACluJds1FCC5l/Ry4427QeRmmYBo08zK38EUGmDcfgVxV/
	DxMKpMWMuYYBsKrJ2osz//Lt3Lokfq2Moo5H02Vl8e21POU0o6YZqR0rLSjYedc=
X-Google-Smtp-Source: AGHT+IHR7OS8odIdUvdlcnt1s5cCa3aiP5NwShIR40+jSNQ9BzCWjSAgnd/3qch7pwvJR9uyJhIyRQ==
X-Received: by 2002:a05:6000:4009:b0:341:cd0d:b78a with SMTP id cp9-20020a056000400900b00341cd0db78amr3925279wrb.48.1711390769180;
        Mon, 25 Mar 2024 11:19:29 -0700 (PDT)
Message-ID: <142a2b55-371a-4401-9dec-161c0cabcf07@cloud.com>
Date: Mon, 25 Mar 2024 18:19:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tools/xc: Add xc_cpu_policy to the public xenctrl.h
 header
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-3-alejandro.vallejo@cloud.com>
 <ZfnRhQ94uIwQCN3v@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZfnRhQ94uIwQCN3v@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2024 17:55, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 03:38:30PM +0000, Alejandro Vallejo wrote:
>> Move struct xc_cpu_policy data structure out of xg_private.h and into
>> the public xenguest.h so it can be used by libxl.
> 
> I will let Andrew comment on this one, IIRC the initial idea was to
> not leak cpu_policy into libxl, and to instead have it as an opaque
> object that libxl can interact with using helpers.

I wrote this a while ago, and can't quite remember why I left this here.
Looking closely I think it's leftover from something else I eventually
turned into its own series[1]. I don't _think_ it's needed for this
series, so I'll just drop it in v2. If everything blows up I'll tell you
why I needed it :)

[1]
https://lore.kernel.org/xen-devel/20240207173957.19811-1-alejandro.vallejo@cloud.com/

> 
> I haven't looked at followup patches - I assume this is done to
> manipulate the cpuid data more easily from libxl, and ultimately drop
> xc_xend_cpuid?

Yes, we can't drop that altogether because xl exposes an interface
allowing fine-grained manipulation of CPUID/MSR data, but it becomes
minimal. The general idea is to is to stop moving separate buffers
around in tandem and use a single data structure instead whenever possible.

Cheers,
Alejandro

