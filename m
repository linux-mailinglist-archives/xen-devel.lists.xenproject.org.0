Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AC9DA54E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844584.1260075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGEth-0001e0-Ou; Wed, 27 Nov 2024 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844584.1260075; Wed, 27 Nov 2024 10:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGEth-0001c2-LL; Wed, 27 Nov 2024 10:03:49 +0000
Received: by outflank-mailman (input) for mailman id 844584;
 Wed, 27 Nov 2024 10:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcf5=SW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1tGEtf-0001bw-NO
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:03:47 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3076296-aca6-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 11:03:44 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cefa22e9d5so7750022a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 02:03:44 -0800 (PST)
Received: from premium-test ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa533b04d87sm548596166b.97.2024.11.27.02.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 02:03:43 -0800 (PST)
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
X-Inumbo-ID: e3076296-aca6-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUzMDc2Mjk2LWFjYTYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzAxODI0LjY5NTY1LCJzZW5kZXIiOiJqYXZpLm1lcmlub0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732701824; x=1733306624; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmbLlkb4NmSUIxKM+PDbkcfS5R5LagIULrwe7hZwjx4=;
        b=No7bWRLTAjhHK76eB+Afrz0kkUlo++GX/22d/rl2yfU+cRnEkGTSiKH6VCWZS+Nwd6
         n9App3ZNjYC9K1Ai9NnNX+wK6VO/LXV/Zxx3QmZ8ki7dkTyuCzeiNeLRNVCVKosk+BD+
         6RGSi08o6LcQepNIKcJThZ+W/k3caIsngEGQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701824; x=1733306624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmbLlkb4NmSUIxKM+PDbkcfS5R5LagIULrwe7hZwjx4=;
        b=bcjrExNBJ9aj3ecH09TOEBf0oarSOleomHfeLAcfS2O13c0cMzxyoGPW/8lmTOKSNU
         nOcgh8XkmH8/Nce9BQR9bKBH4OHjZ2PVPoDZESMHaLr8UETf9HrK8kAOx38mOsh6zy5x
         QJ11qMSCON3vTGf0ImgGGmEPC8FwLVFhcXwegGuHStGbkV/aucW2WC6zqyza24KB7WQa
         VmEQixniCgMhhasizc8fikd9Ny9t3zwLdRdAPuB0VWf54ASu9kWGDQHyLvYeLrwAKAMg
         x+uoK5lzorzaiA0L588T7zh6t/TmafTLMSAfflODItB9SsRNK+2Z0LcYxT1AsI+/2No2
         dVEQ==
X-Gm-Message-State: AOJu0YwMys+ytiHJRzlKwVnTMLBS+lrvdmns36ywvAW3Z2YEe7ZfDo+7
	ke+ayqV0gOsiuVGC+vZY+/7wXpXr9537O29JO36tDrK3kWfQUZYRw3sHvkI6GNW9HwRhWY1c8iZ
	GGmg=
X-Gm-Gg: ASbGncvaxJGPCY3K+JlBYc/DpUkCqC8WkNXRzT02iTFfSCFwi9qu15aE+UKTLwRq9es
	FI8BcEKlYNIz3xwigPYZAtmvBLWj2zWvr1IbhKEI44/8GYzfUS9EAlCjG9XgD/d/UUe5xOTVqbj
	huVlyy7zv0RGYiZvj4V8hLkR8Whzw2Nji5Zv5IfgYs/kL9RossSe/hpUQQfCjuCJazdALgZxuBC
	W/v97CazQ648gIHmbEcR7TkDIcrSeXUgDnfyG9xOq4CS1jB4o9Dyrg=
X-Google-Smtp-Source: AGHT+IE5e9Bk1LlDSDkiJ05es4jAKIrYx3W9397tREINncKiQrBRi/fJW7aJjkhkFUltb9lSvI7UPA==
X-Received: by 2002:a17:906:18b1:b0:aa5:3853:5541 with SMTP id a640c23a62f3a-aa581044cc9mr156112866b.41.1732701824000;
        Wed, 27 Nov 2024 02:03:44 -0800 (PST)
Date: Wed, 27 Nov 2024 10:03:43 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <JBeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
Message-ID: <j743is6qrolxcblkz7q5ta46l2y6vad3e4vetcrgtziqpdpo6y@q7tsoe45ltdf>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126205859.23090-1-andrew.cooper3@citrix.com>

On Tue, Nov 26, 2024 at 08:58:59PM +0000, Andrew Cooper wrote:
> The SDM instructs software to write 0 to ESR prior to reading it.  However,
> due to an original Pentium erratum, most logic skips the write based on there
> being more than 3 LVTs; a stand-in to identify the Pentium.
> 
> Xen, being 64bit, doesn't need compatibility for i586 processors.
> 
> Introduce a new apic_read_esr() helper, quoting the SDM to explain why a
> function named apic_read_esr() has a write in it too.
> 
> Use the new helper throughout apic.c and smpboot.c, which allows us to remove
> some useless reads of APIC_LVR.  This in turn removes the external callers of
> get_maxlvt(), so make it local to apic.c
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Javi Merino <javi.merino@cloud.com>
> 
> Based on Javi's patch correcting error_interrupt()

Fair enough.  I was only looking at error_interrupt() and missed the
bigger picture. This patch is more comprehensive and this is very nice:

> Bloat-o-meter reports:
> 
>   add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-269 (-269)
>   Function                                     old     new   delta
>   get_maxlvt                                    48       -     -48
>   __cpu_up                                    1465    1417     -48
>   clear_local_APIC                            1109    1050     -59
>   setup_local_APIC                             942     828    -114
> ---
>  xen/arch/x86/apic.c             | 29 ++++++++++-------------------
>  xen/arch/x86/include/asm/apic.h | 24 +++++++++++++++++++++++-
>  xen/arch/x86/smpboot.c          | 17 ++++-------------
>  3 files changed, 37 insertions(+), 33 deletions(-)

Reviewed-by: Javi Merino <javi.merino@cloud.com>

