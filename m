Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFBDAD3E11
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 18:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011101.1389425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1OU-0008T2-Eu; Tue, 10 Jun 2025 16:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011101.1389425; Tue, 10 Jun 2025 16:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1OU-0008RS-B3; Tue, 10 Jun 2025 16:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1011101;
 Tue, 10 Jun 2025 16:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uP1OT-0008RM-9t
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 16:00:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb486e49-4613-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 18:00:08 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-452f9735424so14373305e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 09:00:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4521375b60fsm148306025e9.40.2025.06.10.09.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 09:00:07 -0700 (PDT)
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
X-Inumbo-ID: fb486e49-4613-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749571208; x=1750176008; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/upbL8I9kaywVUZVGGfQQ134HOzgX2YGj9tshAPkMM=;
        b=iEy3YVf6GN0A/gwvVXgU/4sG4E2N4NdMdezKkVUwOyw6TSIkINvqus3L3iGPK9ZnrC
         6xueHlHOIydvQX5WsFyNAnJNIkxq0TU52tl3wUIQ5zHWoE+RSwOgq78BHQpIxItRhA7V
         Xt4phTq8kyi6LwXZjADwrUfD2jtP4RYfnZoao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571208; x=1750176008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/upbL8I9kaywVUZVGGfQQ134HOzgX2YGj9tshAPkMM=;
        b=cx80HyskoPywUzjAHxY9ybNbHXlUqdlhhc/kiEi+IqwGg9xoOxcKVvENR7JHqzXOhX
         ytDyj29G0xEzU0VqBcstPRd3M07QcB8rsY5+qTlM6FLu5ntk7jNBBpjqhoHQliM6E8a+
         uwyNPClilofXFp8+1b5z8Ndv6XoykkXv1hHWYUWhaxoKH3ZVdjPiYFrBYgwPxHvOiBKH
         4bKWKHotS2S0tfsTCqFTfDerQyJXOhvSl126Rmb336uR31UeoenVVo9BDZIGb2oSGekl
         fWZ1buYmapdOeBCoFML0tJolaZdylO/L5u25KW5+1jq5+a/Kb6IxnRqpfHnjrFM/N6R/
         /DCg==
X-Forwarded-Encrypted: i=1; AJvYcCVmlERQ4v9ajodSKwKslTOS2DMlGDSNT3cgZltURlT1cG5MOCV5X3EES53N5VqzRtJ2GLHYdaCeD9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMyCpfzujx3jEDAfTq+Ts9HXRWUypNB7bi762H2nihtbJktYHO
	DrVJ4v5WpiHz80Woj50hJ1UgkL0Apas+RwchkR3f+jnrlW5SNkpVtN60LAAfAoBTj1I=
X-Gm-Gg: ASbGncvNKqGk8gGBdWtTr+XOtvWoYyK9gftPawysWsQKdn43cr0atZwgWnpW2lsqBXQ
	z7AWy1S6MHA+vAmbqNg7Rgg+nNGNtBUNwsoQ+Jwp5G7WRw9qYKl0/FmDNfVN2oCYbWXNkdbqZ7C
	2qktyRuP3YUrydsYW+TrxfbmjoeTDCJ0mAW0Fpb6+6uJNGmekL6EW1ITU+3tjwj0+UiYhdcQy1l
	2t4bIzpBayF/3u/Znw/QcVGojGIjiabVQ6oFwaE3kMAphnkgrtCrXEOjYElYIfz+OZ+K3zBj/Hm
	L/fgk0kCC44Ge2XPqy2tak0GkOwg8t9aYLV9spYLTPvxBiDf9gNAQuTGwlJ7c1HQgJ45xMZKMtH
	uBqVcyr3QolZe5R3f7VRXqh4y2DyG2XqCk8g=
X-Google-Smtp-Source: AGHT+IFCT7nx25u3GatylzHG+WtJc4ELMiGEyXB+198brpmA8tvfI5uBfPCpIM20kiCfi8VTne722g==
X-Received: by 2002:a05:600c:4751:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4530c39d65fmr94588445e9.13.1749571207777;
        Tue, 10 Jun 2025 09:00:07 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:00:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aEhWhlU70O-OOpjs@macbook.local>
References: <20250605161659.18201-1-roger.pau@citrix.com>
 <bdb0d15b-619e-4ff1-9db5-0beb07683a39@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdb0d15b-619e-4ff1-9db5-0beb07683a39@suse.com>

On Tue, Jun 10, 2025 at 05:45:52PM +0200, Jan Beulich wrote:
> On 05.06.2025 18:16, Roger Pau Monne wrote:
> > @@ -271,6 +279,43 @@ void pci_setup(void)
> >              if ( bar_sz == 0 )
> >                  continue;
> >  
> > +            if ( !xenpci_bar_uc &&
> > +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> > +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> > +                 vendor_id == 0x5853 &&
> > +                 (device_id == 0x0001 || device_id == 0x0002) )
> > +            {
> > +                if ( is_64bar )
> > +                {
> > +                     printf("xenpci dev %02x:%x unexpected MMIO 64bit BAR%u\n",
> > +                            devfn >> 3, devfn & 7, bar);
> > +                     continue;
> > +                }
> > +
> > +                if ( bar_sz > pci_mem_end ||
> > +                     ((pci_mem_end - bar_sz) & ~(bar_sz - 1)) < pci_mem_start )
> > +                {
> > +                     printf("xenpci dev %02x:%x BAR%u size %llx overflows low PCI hole\n",
> > +                            devfn >> 3, devfn & 7, bar, bar_sz);
> > +                     continue;
> > +                }
> 
> Is "continue" really the right way of handling the problem here?

The problem will only appear when using the newly added option.

> We didn't
> skip this BAR prior to your changes just because of either of these being
> true.

I can add a label to keep the previous logic in case the expectations
don't match.

Thanks, Roger.

