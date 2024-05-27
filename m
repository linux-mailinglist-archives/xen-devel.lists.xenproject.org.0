Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DF8CFC3D
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 10:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730648.1135799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBW96-0004w0-39; Mon, 27 May 2024 08:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730648.1135799; Mon, 27 May 2024 08:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBW95-0004tb-Vy; Mon, 27 May 2024 08:55:55 +0000
Received: by outflank-mailman (input) for mailman id 730648;
 Mon, 27 May 2024 08:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0flO=M6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBW94-0004tV-Gg
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 08:55:54 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eba2da90-1c06-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 10:55:52 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4202c1d19d5so77046395e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 01:55:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100ee954bsm134581655e9.4.2024.05.27.01.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 01:55:51 -0700 (PDT)
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
X-Inumbo-ID: eba2da90-1c06-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716800151; x=1717404951; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q09bIT5UaOFKGQ3FhV6lga2ObNJfZ+ZqQjmXP2nUV/w=;
        b=sP683EVaUXalBTlDGQ7aLiPQBLVSjzUAwHaKO6HVuMu2YCBF0pT2daMEYRhRbO1748
         YC83CYggGlTTJs/Ni8PFT7F5OkopvlR0UsKu3JgapQGSc4Kgv87lKXpSxaIpomq3iGZS
         VaIVfS1v1FNPtZwAIOHYlvBiywUd3NTBGrBJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800151; x=1717404951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q09bIT5UaOFKGQ3FhV6lga2ObNJfZ+ZqQjmXP2nUV/w=;
        b=U/OSgwUtpTVfYhBhQ1BAADyrL7tUakzDiwpPNC4iMzTbbOEKLuSp9nWBHNEJlhr+vK
         0rS3m2hXFR1XnBaEumuu75KjP5ohjzoui4/xujyUjXNfaf/G7eQLHfr/15aMLs19BrEK
         P4M4Y6IY4j/EcpwS6S2BWTEoJbXHpEEMYyqHMhaSksncAF039/Y6nRYfI5PtPvbhN93C
         Dcj3FhP9CdtsGrhScYr9roBY98Ick5um6mBwvFLygkQkaxYgdcIgr+ivxlabFw2+VumH
         t9AbVYXUMhmLAquShwFsPEZIt86eY2BoeSpQvuXStn6E5v2xQP1xSd0Ow6pviuDsaoeI
         5b6w==
X-Gm-Message-State: AOJu0YwynPTPFKCk/rBG10/EDo6xR+FICkQGHsVU+bSn66wn4tADA0H1
	3z+r08J2qb+dNKjzvk24FWE2Q/aPdjluK966hOJGj9m+G9bv02xjb/5gFrxgPEM=
X-Google-Smtp-Source: AGHT+IFK1cxfMvoevF0DZE6dn3cMZG1fA9lMLNH9Ow2yiZGbXjRmxpjrKtRaocvaIknAt36HjiKsUg==
X-Received: by 2002:a05:600c:4450:b0:420:2cbe:7f00 with SMTP id 5b1f17b1804b1-421089f98fdmr61159985e9.39.1716800151545;
        Mon, 27 May 2024 01:55:51 -0700 (PDT)
Date: Mon, 27 May 2024 10:55:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
Message-ID: <ZlRKljHLB_qBu4rP@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9rOqooa3PJCyw1@macbook>
 <d6ebb2f0-fb15-4ca4-9833-cd635511b2d3@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6ebb2f0-fb15-4ca4-9833-cd635511b2d3@cloud.com>

On Fri, May 24, 2024 at 04:16:01PM +0100, Alejandro Vallejo wrote:
> On 23/05/2024 17:13, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 01:39:24PM +0100, Alejandro Vallejo wrote:
> >> @@ -86,10 +113,11 @@ static void boot_cpu(unsigned int cpu)
> >>          BUG();
> >>  
> >>      /*
> >> -     * Wait for the secondary processor to complete initialisation.
> >> +     * Wait for the secondary processor to complete initialisation,
> >> +     * which is signaled by its x2APIC ID being writted to the LUT.
> >>       * Do not touch shared resources meanwhile.
> >>       */
> >> -    while ( !ap_callin )
> >> +    while ( !ACCESS_ONCE(CPU_TO_X2APICID[cpu]) )
> >>          cpu_relax();
> > 
> > As a further improvement, we could launch all APs in pararell, and use
> > a for loop to wait until all positions of the CPU_TO_X2APICID array
> > are set.
> 
> I thought about it, but then we'd need locking for the prints as well,
> or refactor things so only the BSP prints on success.

Hm, I see, yes, we would likely need to refactor the printing a bit so
each AP only prints one line, and then add locking around the calls in
`cpu_setup()`.

> The time taken is truly negligible, so I reckon it's better left for
> another patch.

Oh, indeed, sorry if I made it look it should be part of this patch,
that wasn't my intention.  Just something that might be worth looking
into doing in the future.

Thanks, Roger.

