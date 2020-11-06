Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D5D2A8E8E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 06:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20299.46255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1katyv-0000Ug-JB; Fri, 06 Nov 2020 05:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20299.46255; Fri, 06 Nov 2020 05:08:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1katyv-0000Tl-CE; Fri, 06 Nov 2020 05:08:13 +0000
Received: by outflank-mailman (input) for mailman id 20299;
 Fri, 06 Nov 2020 00:47:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rXhF=EM=redhat.com=bmasney@srs-us1.protection.inumbo.net>)
 id 1kapuw-00066e-Rt
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 00:47:50 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 03bb0b44-ec3e-4d54-85ce-d493d375b0a4;
 Fri, 06 Nov 2020 00:47:47 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-_f3ycuUTPVimMG1z3kOKgw-1; Thu, 05 Nov 2020 19:47:45 -0500
Received: by mail-qk1-f197.google.com with SMTP id f126so2187281qke.17
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 16:47:45 -0800 (PST)
Received: from tp-x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
 by smtp.gmail.com with ESMTPSA id
 d133sm2374130qke.106.2020.11.05.16.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 16:47:44 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rXhF=EM=redhat.com=bmasney@srs-us1.protection.inumbo.net>)
	id 1kapuw-00066e-Rt
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 00:47:50 +0000
X-Inumbo-ID: 03bb0b44-ec3e-4d54-85ce-d493d375b0a4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 03bb0b44-ec3e-4d54-85ce-d493d375b0a4;
	Fri, 06 Nov 2020 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604623667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qyPnP4lF1Yi0XyDpJZZP5+UOnDqVjqVsDwjLlXmGNic=;
	b=J2l6QohYRr05Y4dYaT6txMFrxZahuftn0584OSmokXjF2Ix1tr54KEGfms8Nbek76F6UAr
	bivCcm/o/t61n5JvgXVpcR4HGISIe1h1sMFIP+p0Rn76GJEd3NxHAUvKdGKej5IGgGQvwc
	DEDW6Tab0THXEhJX5SI1sVOjBX5xSg0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-_f3ycuUTPVimMG1z3kOKgw-1; Thu, 05 Nov 2020 19:47:45 -0500
X-MC-Unique: _f3ycuUTPVimMG1z3kOKgw-1
Received: by mail-qk1-f197.google.com with SMTP id f126so2187281qke.17
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 16:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qyPnP4lF1Yi0XyDpJZZP5+UOnDqVjqVsDwjLlXmGNic=;
        b=ROYnjUvdVDVgnFpG2heWEhKSZsvpq7Rw09+DldUAj8XJHUZKj+FODKX34GX5BBt5QE
         USz6+W3jOnGwlI9O58qURBrIyUCzFB49eU9XS8pGa8sRjkafoNtMao/+rhjrrbAA3K/7
         BTP3g8wUru7AsBQB9ybVQ7OVWd2dG6oZ4Vip+u04cj1rwIS75dQFVevEDewGg7KkBbmV
         /2rTm7FXB0IEsMTpR/+Fgg46IDzkCM6PcGVFL/wEnYcbZOkQZmPiesOA/jv5ml1GoHIZ
         Xrc2om/v9Ufz0LDw431ioSmpZ2abk8W+dD9Q+Qod5JhGhKQYSQKvGcKMtM7ba28arKbk
         J7qg==
X-Gm-Message-State: AOAM533fsKdrBAROhPDAt+lu/Q+C8a2VjVcxXLhpAG+DwW7Hp6iFZOEj
	h7qqrqHh2Z0wuNs9GEOK2SByk+QzzCUSGGNVa80li7CCYkaUhxpShPLFbp1IDnX68whYgWouCOk
	zAYF+ru6ordqxkNUmE70khexV5cI=
X-Received: by 2002:ac8:6d1:: with SMTP id j17mr4841433qth.230.1604623665165;
        Thu, 05 Nov 2020 16:47:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbRk7Wv/ie/4F9jx8fbSx+H1AvkziIsrSKBGbSjzVCO8ww8iY9yV90ttVKnnSFxemgsIHUZw==
X-Received: by 2002:ac8:6d1:: with SMTP id j17mr4841425qth.230.1604623664969;
        Thu, 05 Nov 2020 16:47:44 -0800 (PST)
Received: from tp-x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id d133sm2374130qke.106.2020.11.05.16.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 16:47:44 -0800 (PST)
Date: Thu, 5 Nov 2020 19:47:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
	hpa@zytor.com, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, dustymabe@redhat.com
Subject: Re: [PATCH] x86/xen: fix warning when running with nosmt mitigations
Message-ID: <20201106004743.GA380136@tp-x1>
References: <20201106003529.391649-1-bmasney@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201106003529.391649-1-bmasney@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bmasney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2020 at 07:35:29PM -0500, Brian Masney wrote:
> diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
> index 799f4eba0a62..4a052459a08e 100644
> --- a/arch/x86/xen/spinlock.c
> +++ b/arch/x86/xen/spinlock.c
> @@ -93,9 +93,24 @@ void xen_init_lock_cpu(int cpu)
>  
>  void xen_uninit_lock_cpu(int cpu)
>  {
> +	int irq;
> +
>  	if (!xen_pvspin)
>  		return;
>  
> +	/*
> +	 * When booting the kernel with 'mitigations=auto,nosmt', the secondary
> +	 * CPUs are not activated and only the primary thread on each CPU core
> +	 * is used. In this situation, xen_hvm_smp_prepare_cpus(), and more
> +	 * importantly xen_init_lock_cpu(), is not called, so the
> +	 * lock_kicker_irq is not initialized for the secondary CPUs. Let's
> +	 * exit early if the irq is not set to avoid a warning in the console
> +	 * log.
> +	 */
> +	irq = per_cpu(lock_kicker_irq, cpu);
> +	if (irq == -1)
> +		return;
> +
>  	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);

As soon as I saw this on lore, I saw that I should have passed the irq
variable to unbind_from_irqhandler() rather than doing another per_cpu()
lookup. I'll wait for feedback about the general approach before posting
a v2.

Brian


