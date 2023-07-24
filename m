Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B26E75F613
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568887.888986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNuWO-000629-QI; Mon, 24 Jul 2023 12:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568887.888986; Mon, 24 Jul 2023 12:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNuWO-0005zt-NQ; Mon, 24 Jul 2023 12:18:40 +0000
Received: by outflank-mailman (input) for mailman id 568887;
 Mon, 24 Jul 2023 12:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YiG=DK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qNuWN-0005sr-JB
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:18:39 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37728426-2a1c-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:18:37 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso33578765e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:18:37 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcc8f000000b003fbfef555d2sm12773706wma.23.2023.07.24.05.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:18:36 -0700 (PDT)
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
X-Inumbo-ID: 37728426-2a1c-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690201117; x=1690805917;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tYZQ4FB+RN4vRq77iIyVxuJsWHDHH83ZPg7RUhTxPHg=;
        b=T0kG+pRnHndzeXyTOWTxmnJRjcaBrolfkcVPRb3339U3dM1WlhWGj7Fy5RC7Q2MmuH
         XRgHDCRByzuUFJWTSgZ7tLWpP2kHNlqkQPKanB9FgwQ/9YiX0qqy3uxOdslJzdgX4fnx
         eCN9PwlQbwu6gXzx3+KcNd7rP3vOadwBp6dRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690201117; x=1690805917;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYZQ4FB+RN4vRq77iIyVxuJsWHDHH83ZPg7RUhTxPHg=;
        b=VT5TgwwiGG+SqdPJQqfHq7PDsodU8lPKbiN7Kax7kSJQ0fSA/n+wS1/TOpsZzwMEOJ
         p+06fEU084cXkQ5xxBWj4bJGeIOQV6gb2D7vanU/vFzD16qscAjqrnKSYbgRp/gVe8gU
         SsOFEGIeCZcmUX8JuxnWZ2KQfY23VrnnjMz9d/4wDkWe281FRkTOqgClK4nLIidB+gyQ
         IQ1rx+1Kt7XJzP7jqnFlnThKuvjNAhPRbry6NuQ+HZvdeTnpGAUWbVM4OvPkdpNziXRw
         4zy580XNtiF1EeEPLUnVSYYw7qZep+t92XJqYXPBqK55e2s0MrEJGxTjfVkinE/azkZE
         055g==
X-Gm-Message-State: ABy/qLZgVe+IAL3PnUjcI9UmVyZYC4aEqppJz+64IxLMdW6F+h6V6/Qk
	uV9uRW+y5z8SHf9UAY6wSJEc7Q==
X-Google-Smtp-Source: APBJJlH60vqJNPd2I/GwBUqo2Sc1ErpXryoFOKnzSGgYeVHoZrJzf69P36xIWg4/Cxj4jYR3mppd5g==
X-Received: by 2002:a05:600c:240c:b0:3f8:facf:7626 with SMTP id 12-20020a05600c240c00b003f8facf7626mr6933033wmp.20.1690201116915;
        Mon, 24 Jul 2023 05:18:36 -0700 (PDT)
Message-ID: <64be6c1c.7b0a0220.49ba9.0e38@mx.google.com>
X-Google-Original-Message-ID: <ZL5sG254Ryx/E8TJ@EMEAENGAAD19049.>
Date: Mon, 24 Jul 2023 13:18:35 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
 <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>

On Fri, Jul 21, 2023 at 06:05:51PM +0100, Julien Grall wrote:
> Hi Alejandro,
> 
> On 17/07/2023 17:03, Alejandro Vallejo wrote:
> > +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
> 
> For newer interface, I would rather prefer if we use start + size. It is
> easier to reason (you don't have to wonder whether 'emfn' is inclusive or
> not) and avoid issue in the case you are trying to handle a region right at
> the end of the address space as emfn would be 0 in the non-inclusive case
> (not much a concern for MFNs as the last one should be invalid, but it makes
> harder to reason).
I could agree on this, but every single caller is based on (smfn, emfn),
so it needlessly forces every caller to perform conversions where the
callee can do it just once. That said, I think your point makes sense and
it ought to be done. Probably as as part of a bigger refactor where
(smfn, emfn)-based functions are turned into (base, len) variants.

> 
> > +{
> > +    uint64_t base = smfn << PAGE_SHIFT;
> 
> On Arm32, physical address are up to 40-bit. So you want to cast smfn to
> uint64_t before shifting. That said, it would be best to use pfn_to_paddr()
> and possibly switch to paddr_t for the type.
Ack. I keep forgetting 32 bits is not gone on non-x86 ports :)

> 
> Note that I understand that the rest of the PDX code is using uint64_t. So I
> would be ok if you don't want to switch to paddr_t.
Not for this patch, but I will keep "Turn all u64 maddr variables in
pdx.[ch] into paddr_t" in the back of my head for a rainy day.

> 
> > +    uint64_t len = (emfn - smfn) << PAGE_SHIFT;
> 
> Same here.
Ack.

Thanks,
Alejandro

