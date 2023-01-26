Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4567C95B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 12:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484944.751846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL01t-0006r4-BZ; Thu, 26 Jan 2023 11:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484944.751846; Thu, 26 Jan 2023 11:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL01t-0006oL-8q; Thu, 26 Jan 2023 11:02:53 +0000
Received: by outflank-mailman (input) for mailman id 484944;
 Thu, 26 Jan 2023 11:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9FD=5X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pL01r-0006oF-Pc
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 11:02:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8e9b41f-9d68-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 12:02:49 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id qx13so3959416ejb.13
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 03:02:49 -0800 (PST)
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
X-Inumbo-ID: f8e9b41f-9d68-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bujbm72cptBXg/nA31OUEyqO7n4/E7HF5yfYemWcZ6o=;
        b=c+h2jQRkciPXrKdsi6WVM2efQhnOM8MYjV4DAldu0bohYZKPjSenZRrttjcFoLw3mx
         Ogf5nMyYp4biL3I7rzKhDeR+FbE5jKyDkD51IufU9N4qae/ZExLINErYrRm3/TngHazJ
         pefg19QhUcu/QtcXcXBQw5P71tCIFpOKRwFeqp6iuR3iMs1jHJlUH53EzD5Q+qlW2Y3f
         JFv5E+v8eaCntol8DDYBlUV2WVO3SjVBvXFGCTw9bMh84fKpJLmvU60Cd8KsNfkurXvI
         H4dzLTOHsgiIE1kABv5wuLmp0pmg1tqIu3Bfcc7LLWa4u7uhaNzo8ixeoB+qXvncIUsR
         xLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bujbm72cptBXg/nA31OUEyqO7n4/E7HF5yfYemWcZ6o=;
        b=TF1wdgkgBxPoPyfunhg+1+LvPnrtbYXxP33VLGYX7PcLP1IM6bVzh7qNEkvV/bHIMo
         tU67uuQobhBYE2i82oMzbuAqA2rQa4Egf5X/9uUzWD1q5bc3DoJbKjGrH00nAA3MwGFe
         on1Hoftf6KwQNIUd9mJBoaOKy3X2bkTLZ5LB1TjM6JqXWzDPrhqe5k/D1kItGt7jKPYA
         1qQLURJAxITy4kEJe1C53yuYdStrQ7RtNbB1GmmG+PsaWRa2YWJF3pPSm5QGndHgOQaq
         VVIXoBQPs7V0rrCf9s1/JCJJ2jQ1Sf/AxmC5dv/G23ijQwufnalPMxGYa9H/CGZY7zwQ
         D6dw==
X-Gm-Message-State: AFqh2krbo6u/Wn3WDNixg0Mn3nhC7gmFAVaRXTWSbmTn/nACwQbZN7m0
	GQ6b4+vmfNOC7caug1Jwy3HYXsp5znTRH9AvUIqSxQ==
X-Google-Smtp-Source: AMrXdXs6ZO20bnYkjz9tUNqm/EaiI9vO3ArxqEmCfUEJCp/qLipGMo6wjTU2IGtZn94XRgc4X26+HFanW7Q+KuwiZqA=
X-Received: by 2002:a17:907:d043:b0:868:dca5:b73c with SMTP id
 vb3-20020a170907d04300b00868dca5b73cmr3726723ejc.1.1674730969321; Thu, 26 Jan
 2023 03:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-9-carlo.nonato@minervasys.tech> <79a1cd30-b2b6-f7e1-f000-d78520ec9e0e@xen.org>
In-Reply-To: <79a1cd30-b2b6-f7e1-f000-d78520ec9e0e@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 26 Jan 2023 12:02:38 +0100
Message-ID: <CAG+AhRXNhFOFe-jmN6Lj=RH9zhnZF+=k6yT412_GB0js9pLPTA@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] xen/arm: use colored allocator for p2m page tables
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Thu, Jan 26, 2023 at 11:25 AM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 23/01/2023 15:47, Carlo Nonato wrote:
> > Cache colored domains can benefit from having p2m page tables allocated
> > with the same coloring schema so that isolation can be achieved also for
> > those kind of memory accesses.
> > In order to do that, the domain struct is passed to the allocator and the
> > MEMF_no_owner flag is used.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v4:
> > - fixed p2m page allocation using MEMF_no_owner memflag
> > ---
> >   xen/arch/arm/p2m.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> > index 948f199d84..f9faeb61af 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -4,6 +4,7 @@
> >   #include <xen/iocap.h>
> >   #include <xen/ioreq.h>
> >   #include <xen/lib.h>
> > +#include <xen/llc_coloring.h>
> >   #include <xen/sched.h>
> >   #include <xen/softirq.h>
> >
> > @@ -56,7 +57,10 @@ static struct page_info *p2m_alloc_page(struct domain *d)
> >        */
> >       if ( is_hardware_domain(d) )
> >       {
> > -        pg = alloc_domheap_page(NULL, 0);
> > +        if ( is_domain_llc_colored(d) )
> > +            pg = alloc_domheap_page(d, MEMF_no_owner);
> > +        else
> > +            pg = alloc_domheap_page(NULL, 0);
> I don't think we need to special case a colored domain here.You could
> simply always pass the domain/MEMF_no_owner and let the function decide
> what to do.
>
> This approach would also be useful when NUMA will be supported on Arm
> (the series is still under review).

Ok, nice. This was pointed out also by Jan in the previous revision.

> >           if ( pg == NULL )
> >               printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
> >       }
> > @@ -105,7 +109,10 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
> >           if ( d->arch.paging.p2m_total_pages < pages )
> >           {
> >               /* Need to allocate more memory from domheap */
> > -            pg = alloc_domheap_page(NULL, 0);
> > +            if ( is_domain_llc_colored(d) )
> > +                pg = alloc_domheap_page(d, MEMF_no_owner);
> > +            else
> > +                pg = alloc_domheap_page(NULL, 0);
>
> Ditto.
>
> >               if ( pg == NULL )
> >               {
> >                   printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>
> Cheers,
>
> --
> Julien Grall

