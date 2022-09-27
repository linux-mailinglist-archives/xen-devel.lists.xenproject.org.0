Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC25EC624
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412669.656069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBcY-0004pm-Ur; Tue, 27 Sep 2022 14:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412669.656069; Tue, 27 Sep 2022 14:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBcY-0004nD-S2; Tue, 27 Sep 2022 14:31:38 +0000
Received: by outflank-mailman (input) for mailman id 412669;
 Tue, 27 Sep 2022 14:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdUW=Z6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1odBcX-0004UQ-OI
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:31:37 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1784c17c-3e71-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 16:31:36 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id r18so21068195eja.11
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 07:31:37 -0700 (PDT)
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
X-Inumbo-ID: 1784c17c-3e71-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dZ56z9a8FzgaIJUBYRwqk8uPrh9dSpVkrxk/aa13/Ic=;
        b=xaYDpM6WnqNW4yy2LytLppAhl5HzVN2cGsJdqYg4+DB+G0FP2iqs6/htNpnul5d/4y
         IViPVsq9JWfQRwVM20CKVCqPt/GAenxtt37gpp4zFQsxz2aJp+JTCFi6JMLsAE8LnMk5
         9ifcDprk82QIXoE7GMR67IBCTRxh8gFIFIzZz4iuXScUILhJU2Dc8FlKAc1DqrQCEp+9
         uJ7eFftL4L2k+86Gq5RgYoM7KchnComCkkObn1zjDJROsfX73H7Cobgma4lDx4CbnoCe
         fDRkCuZBEUEeAxM93nkev5EsAzyqVuZAKL/wELe91L5esrcV+y0VY0x20mcFYfHQy2qa
         RkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dZ56z9a8FzgaIJUBYRwqk8uPrh9dSpVkrxk/aa13/Ic=;
        b=06+Tg3eDq6bA8PJTB+iKKobj/axBtLSdtu4MKm+ctpggycnEJIXXlyf54vFxIc2jGc
         Vmyt8fUfCSn7jLDsbtXB3ZHgQoni9o8by0sE0NFuBN4RA60xiRjVrlOjkbRGHrvvFwS9
         Ozt4EwAz5eK2OVgLKQ5Yjt15NRdstAtOvTVk2HJ3aAU2uHzOESj5XY0SUG2s0LJyohQU
         QiEUN0mqcVpDQgn240Dzcd11uaxrOPb/fQm7ljiMR98sZ4HOWnSwt7a0v/DbnZpXgZrz
         jle0KCtu3zRXcT9XeFiIO9WpPmWr7hZe/8ktOq7VNOzk3QAA1jmlmdOkbRZ/aDU9YMfS
         SV+A==
X-Gm-Message-State: ACrzQf3y3TYn9+0JYSVBR+/O6J15GC2bgnS9sOBDZL05r4ZA9Ius4Xye
	WDBSiWlFbxMujpYiV5Z63a/iCxbh8OZsrFyiGtqZ3w==
X-Google-Smtp-Source: AMsMyM67WLR/RBOYrtX9tTm2CbU91KPw5Nn33glQYdd1MYYd5bTz+3mSiaA3Ptg/4w2i43F2n9B7vNcCj0dH/kNbrUc=
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr23456389ejc.66.1664289096627; Tue, 27
 Sep 2022 07:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech> <fe58de74-8bf5-50df-eb32-2d479758bfd8@arm.com>
In-Reply-To: <fe58de74-8bf5-50df-eb32-2d479758bfd8@arm.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 27 Sep 2022 16:31:25 +0200
Message-ID: <CAG+AhRWJpWsov8if-KWUhzDUSuSN2yu_Z=3=UW7SypudT2cfDg@mail.gmail.com>
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for domains
To: Wei Chen <Wei.Chen@arm.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
	julien@xen.org, stefano.stabellini@amd.com, wl@xen.org, 
	marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Wei,

On Mon, Sep 26, 2022 at 8:39 AM Wei Chen <Wei.Chen@arm.com> wrote:
> On 2022/8/26 20:51, Carlo Nonato wrote:
> > +int domain_coloring_init(struct domain *d,
> > +                         const struct xen_arch_domainconfig *config)
> > +{
> > +    if ( is_domain_direct_mapped(d) )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "Can't enable coloring and directmap at the same time for %pd\n",
> > +               d);
> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( is_hardware_domain(d) )
> > +    {
> > +        d->arch.colors = dom0_colors;
> > +        d->arch.num_colors = dom0_num_colors;
> > +    }
> > +    else if ( config->num_colors == 0 )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Color config not found for %pd. Using default\n", d);
> > +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
> > +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
> > +    }
> > +    else
> > +    {
> > +        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
> > +        d->arch.num_colors = config->num_colors;
> > +        if ( config->from_guest )
> > +            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
> > +        else
> > +            memcpy(d->arch.colors, config->colors.p,
> > +                   sizeof(unsigned int) * config->num_colors);
> > +    }
> > +
> > +    if ( !d->arch.colors )
> > +    {
> > +        printk(XENLOG_ERR "Colors allocation failed for %pd\n", d);
> > +        return -ENOMEM;
> > +    }
> > +
> > +    if ( !check_colors(d->arch.colors, d->arch.num_colors) )
> > +    {
>
> If we add xfree(d->arch.colors) here for non-hw domains, is it possible
> to make this function have a complete fallback process? And I know
> currently, this is handled in domain_coloring_free.

Yes, you're right. Added.

> Cheers,
> Wei Chen

Thanks.

- Carlo Nonato

