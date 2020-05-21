Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6A1DD14A
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 17:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbn53-0003zn-I3; Thu, 21 May 2020 15:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFaT=7D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jbn51-0003zi-Ff
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 15:25:55 +0000
X-Inumbo-ID: 5c688f98-9b77-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c688f98-9b77-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 15:25:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f13so5885042wmc.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ayWuTYNvwTVM7qJ3U+nBeIGZYdKlMjTykYnWta1uC/w=;
 b=ZrpxpW6gi11IWChJSTz0COaM5DOn3+ubIPx4haK4otZ/OPkGKw2+1eV6VX3JbBJYuI
 +hzIbVpWa5fFMOu/f0nrKc7ZQF1QKuajjSUb0/aIi5rO10gPZVNXhthwHH0SKMnyCBrx
 6Y2fCfXmZ3u8nCbNQ8D+PnhZe+h61aEFU0zjgVOms5YI4MMWSkwWPUElMMKPiRYyUIzx
 OHRiYCqcenm7S6wvfByHhU+hc5C3mX+BaHk9nAIyPYIRKNgi+I7Olh9CU8UaJ+lfTKwd
 Uk95QA72y2Z/Mjgxq35rbsSznbPjjfj/SVwdXMOGkKWpU1iUTWCX2nRz2O2G7YMsxaFF
 e0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ayWuTYNvwTVM7qJ3U+nBeIGZYdKlMjTykYnWta1uC/w=;
 b=J0e+oumzBUglG3D8jAFSBxPEzJKfiwFaQVDvWpn3vY3xqSJ/GjIo4rcITrAWqGOF5X
 lgFdUH17IqDMkh+cDkDLBojE5iwPDp++2preScx+2MjYMb34iOCQKPkQAU9c+rGdu3YC
 GVVcCcltqONWfsXwfNXHEE+CFbbOda1ksA+CdlEwAfH8Hg+aRZNdFP8oQajIWfRTW0B9
 OyKLFo5YeJF55vCxSppG9U4MYbr+GxWAW3q3vzvD6GX7Zb0j8aoyRlmmKRsO2QAok7Sj
 PCFgeQkOfKxpAVa8Jk2Tn2ZM4hF/xgDYvwxHVJilrLq3NotpUuAWbcjXaeSfNi8duz5A
 MjKg==
X-Gm-Message-State: AOAM530xc1cOBd0WE9vysSQdo76/TVSlVjty72hfqOa6z3FGu3iw65M8
 lXP8SRxth6FxuZS5I3NSp18=
X-Google-Smtp-Source: ABdhPJy/sfbLMmNvTRd1rS6HEGErF5MHa13sbgk0PD9n4wADuFHqjQhrzEYIDTrDYvRcIKw0Sb2zJA==
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr9306190wmh.119.1590074753809; 
 Thu, 21 May 2020 08:25:53 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id h74sm6988292wrh.76.2020.05.21.08.25.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 08:25:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-5-paul@xen.org>
 <dd544d5d-aa25-f035-d96b-747f07c23513@xen.org>
In-Reply-To: <dd544d5d-aa25-f035-d96b-747f07c23513@xen.org>
Subject: RE: [PATCH v4 4/5] common/domain: add a domain context record for
 shared_info...
Date: Thu, 21 May 2020 16:25:51 +0100
Message-ID: <004401d62f84$1d9a2c40$58ce84c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIT1cQvb66Smwxss7bTr3fjVXX5DAJ/pCGkAnVDoB+oD7LJEA==
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
[snip]
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 7cc9526139..14e96c3bc2 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -33,6 +33,7 @@
> >   #include <xen/xenoprof.h>
> >   #include <xen/irq.h>
> >   #include <xen/argo.h>
> > +#include <xen/save.h>
> >   #include <asm/debugger.h>
> >   #include <asm/p2m.h>
> >   #include <asm/processor.h>
> > @@ -1649,6 +1650,64 @@ int continue_hypercall_on_cpu(
> >       return 0;
> >   }
> >
> > +static int save_shared_info(const struct domain *d, struct domain_context *c,
> > +                            bool dry_run)
> > +{
> > +    struct domain_shared_info_context ctxt = {
> > +#ifdef CONFIG_COMPAT
> > +        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
> > +#endif
> > +        .buffer_size = sizeof(shared_info_t),
> > +    };
> > +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> > +    int rc;
> > +
> > +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc = domain_save_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    return domain_save_end(c);
> > +}
> > +
> > +static int load_shared_info(struct domain *d, struct domain_context *c)
> > +{
> > +    struct domain_shared_info_context ctxt;
> > +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> > +    if ( rc || i ) /* expect only a single instance */
> > +        return rc;
> 
> This will return 0 if there is multiple instance. Is it intended?
> 

No, it ought to be an error... probably ENOENT.

> > +
> > +    rc = domain_load_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( ctxt.buffer_size != sizeof(shared_info_t) )
> > +        return -EINVAL;
> > +
> > +#ifdef CONFIG_COMPAT
> > +    has_32bit_shinfo(d) = ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO;
> > +#endif
> Should we check the flag is not set when compat is not supported?
> 
> This would prevent someone to try restoring a compat shared info on a
> platform not support it.
> 

That would be prudent, yes. Probably a straight EINVAL for this one.

  Paul


