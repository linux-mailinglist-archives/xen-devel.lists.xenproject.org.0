Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220371DD2A0
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 18:01:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbncX-00085O-Uu; Thu, 21 May 2020 16:00:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFaT=7D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jbncW-00083X-1m
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 16:00:32 +0000
X-Inumbo-ID: 321e1096-9b7c-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 321e1096-9b7c-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 16:00:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so5958089wrw.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=spyphAFyJlXm/hizdcLp1TmVYviGGpi8QG1vV3BS/z0=;
 b=hJCs6nLwDU8DrnP44yaAEWgxNEiVHYXDQapS29DcWm96j/Y1AkcozbCeVZWzcYbsWy
 tgcDZ9VDpvkuaCIUdwuH3SO2KPOZE/X3XToGZrKg1nuAfNusCnRPaujTP1O1HWmyAF+B
 iSFqnug5gmutgHCSkaTryOBS0yZVx362gqZcC4IBqo/9gaFG6DL+0mHplM2irWFnyLqz
 G/wlI7qVxAL0MH1bcu5fZUCtDBlLmuwv6DAhUA/0kmhAgS8t7UFNJDhIUqMl26PCI/Ui
 bzkWR1aFGtUNo3O+ylqBSdPjlnakw+K2idl95yBssvtzMNvebqA8goCN7qLvcEqTG3QO
 /+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=spyphAFyJlXm/hizdcLp1TmVYviGGpi8QG1vV3BS/z0=;
 b=MNVBzCY/n5xqGmtgxWl0gljgn+5C4FmsIHDjx5sa4U0flJKhXVQ7ZZggw3Dzj13d4J
 bLhnFF8pGdFsVdKTboHpD8wBjHMKpgozleLOCkj6/DcQo4GMQWiNq8B9jQnYrDEy2Mqr
 DnNjuBBrLFtdeCEHBIuqDl0nlcRIptj3jbc95a/ONG01vD37TCz2DtxhcxBHfcnb6myi
 kfwfeVlzBSi+0k5djodDjmBzT592UpWlT17nzv1jJ083UfABYiCnxerwMMJkCBZRskeA
 BuAN/3no0Kb40GWBZq7oH4teLi0PSijYXfHflxGf+HEif5VkryAWdJ8b3Dy4DYs1tEHX
 RpCw==
X-Gm-Message-State: AOAM532Ry3rRtZUtAe9KhWnjG+ZLfhl8wEPP2g/3/0YMwlpMgm+gMRQm
 Zn1TtYoXvcpp5tcBNFKy4jI=
X-Google-Smtp-Source: ABdhPJwa9bmXHpKIjt0/NV+HqpHW183nSJ8PtUAeGScEV8q8uO20duP+mYu+rh187XltJN4Bs821+A==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr557173wru.198.1590076830419;
 Thu, 21 May 2020 09:00:30 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id 88sm4117361wre.45.2020.05.21.09.00.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 09:00:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <paul@xen.org>, "'Julien Grall'" <julien@xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-5-paul@xen.org>
 <dd544d5d-aa25-f035-d96b-747f07c23513@xen.org>
 <004401d62f84$1d9a2c40$58ce84c0$@xen.org>
In-Reply-To: <004401d62f84$1d9a2c40$58ce84c0$@xen.org>
Subject: RE: [PATCH v4 4/5] common/domain: add a domain context record for
 shared_info...
Date: Thu, 21 May 2020 17:00:28 +0100
Message-ID: <000001d62f88$f354b180$d9fe1480$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIT1cQvb66Smwxss7bTr3fjVXX5DAJ/pCGkAnVDoB8CdO2uVqf8F1Ig
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 21 May 2020 16:26
> To: 'Julien Grall' <julien@xen.org>; xen-devel@lists.xenproject.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Wei Liu'
> <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>;
> 'Jan Beulich' <jbeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>
> Subject: RE: [PATCH v4 4/5] common/domain: add a domain context record for shared_info...
> 
> > -----Original Message-----
> [snip]
> > > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > index 7cc9526139..14e96c3bc2 100644
> > > --- a/xen/common/domain.c
> > > +++ b/xen/common/domain.c
> > > @@ -33,6 +33,7 @@
> > >   #include <xen/xenoprof.h>
> > >   #include <xen/irq.h>
> > >   #include <xen/argo.h>
> > > +#include <xen/save.h>
> > >   #include <asm/debugger.h>
> > >   #include <asm/p2m.h>
> > >   #include <asm/processor.h>
> > > @@ -1649,6 +1650,64 @@ int continue_hypercall_on_cpu(
> > >       return 0;
> > >   }
> > >
> > > +static int save_shared_info(const struct domain *d, struct domain_context *c,
> > > +                            bool dry_run)
> > > +{
> > > +    struct domain_shared_info_context ctxt = {
> > > +#ifdef CONFIG_COMPAT
> > > +        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
> > > +#endif
> > > +        .buffer_size = sizeof(shared_info_t),
> > > +    };
> > > +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> > > +    int rc;
> > > +
> > > +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> > > +    if ( rc )
> > > +        return rc;
> > > +
> > > +    rc = domain_save_data(c, &ctxt, hdr_size);
> > > +    if ( rc )
> > > +        return rc;
> > > +
> > > +    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
> > > +    if ( rc )
> > > +        return rc;
> > > +
> > > +    return domain_save_end(c);
> > > +}
> > > +
> > > +static int load_shared_info(struct domain *d, struct domain_context *c)
> > > +{
> > > +    struct domain_shared_info_context ctxt;
> > > +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> > > +    unsigned int i;
> > > +    int rc;
> > > +
> > > +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> > > +    if ( rc || i ) /* expect only a single instance */
> > > +        return rc;
> >
> > This will return 0 if there is multiple instance. Is it intended?
> >
> 
> No, it ought to be an error... probably ENOENT.

Actually I think ENXIO might be better... ENOENT tends to imply something is missing rather than unexpected.

  Paul


