Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A260B8BD0D7
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 16:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717700.1120161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3zle-00056s-9K; Mon, 06 May 2024 14:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717700.1120161; Mon, 06 May 2024 14:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3zle-000542-5Q; Mon, 06 May 2024 14:56:38 +0000
Received: by outflank-mailman (input) for mailman id 717700;
 Mon, 06 May 2024 14:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3zlc-00053M-56
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 14:56:36 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b3b5c4-0bb8-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 16:56:27 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34dc9065606so1117655f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 07:56:34 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 gb30-20020a056000459e00b0034e0346317dsm10875061wrb.13.2024.05.06.07.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 07:56:33 -0700 (PDT)
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
X-Inumbo-ID: d0b3b5c4-0bb8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715007394; x=1715612194; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb6o4xcA50FNFY7MOE6kYEZuFMP9IHg+DGUAMLrgFTg=;
        b=nsOSvJCGRcA3R1Jpso6JdIZqHl2Wr1iWmLdqQ8E9vE8Pp30GxK81pFkv1cgWS6Xojl
         NB+F+6jyDs8xgmz44P9NC7pZ5p8UR8a3RU5MpQY1Xxanw3FDEtp7fKmv8KW6qz8pBLOv
         ADA0PvQDq2cd4J+7jSnNtntDpbEyIcsA8ybzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715007394; x=1715612194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb6o4xcA50FNFY7MOE6kYEZuFMP9IHg+DGUAMLrgFTg=;
        b=sOLshOnaccm2/YJi5ATppWhmqTq+ooiwDzMv5jyWdpBIOziAV0xT6A1ebkZfEngt1P
         VpZNTF82566RpTHYjD8rQ6v6sCsOl+c77gTSCQfb05vGlh6MWT6poHWRiHJOvyw8Z7vx
         VEnRmnsLBn3tzbxdUuJ80+WYmljsv1UFT9YLAz619qhnePJovj/W1Q4aoVSYwtdr+ysh
         vT1QYlasetb1DVVMadR0nuZwxID5RZvPs9Py9t0ONkgYavqITKY1XgNNJk8ja4lVzcI3
         cnZkcx7OKV1LSPnhiPJyoPOZ/9ja9Zo63ulOxEOcSGUAC1lfBiTnRBcJnaCZfdugSN0o
         MTyg==
X-Forwarded-Encrypted: i=1; AJvYcCW73jyWUXvw1QyC4piruwFj6fxrOZ+zIwJG7JUtPryHcE09+Byq8QUYgfeTxV+y8QkpoXPdb+Nb7oFU7z615YmC6BTGxZuvS0CVwvSEQxs=
X-Gm-Message-State: AOJu0YxgPpF4Ezmi6Qp5TM3HBzd54/MihoGppbEpaTaoSQJ8QsuRieli
	CTa56xWGT7pyWTWLjHgTN/ewHrfbHk7MUWRcXXvOnOYvGiI5jBNMSfJyMxRC238=
X-Google-Smtp-Source: AGHT+IFbyGkn2kF8b+GifpcQjgpWWXSTRirQMqfCe5M7IydErtyysMQrxmbULxejkVG72qrQbJAiUA==
X-Received: by 2002:a05:6000:188d:b0:34e:5284:4753 with SMTP id a13-20020a056000188d00b0034e52844753mr11336441wri.1.1715007393792;
        Mon, 06 May 2024 07:56:33 -0700 (PDT)
Date: Mon, 6 May 2024 16:56:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19? 2/2] xen/x86: remove foreign mappings from the
 p2m on teardown
Message-ID: <ZjjvoFS2jPy_tt95@macbook>
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-3-roger.pau@citrix.com>
 <54a52cc8-4c36-4086-a10e-114e9a733f45@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54a52cc8-4c36-4086-a10e-114e9a733f45@suse.com>

On Mon, May 06, 2024 at 12:41:49PM +0200, Jan Beulich wrote:
> On 30.04.2024 18:58, Roger Pau Monne wrote:
> > @@ -2695,6 +2691,70 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
> >      return rc;
> >  }
> >  
> > +/*
> > + * Remove foreign mappings from the p2m, as that drops the page reference taken
> > + * when mapped.
> > + */
> > +int relinquish_p2m_mapping(struct domain *d)
> > +{
> > +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> 
> Are there any guarantees made anywhere that altp2m-s and nested P2Ms can't
> hold foreign mappings? p2m_entry_modify() certainly treats them all the same.

Good point, I will disable those initially, as I don't think there's a
need right now for foreign mapping in altp2m-s and nested p2ms.

> > +    unsigned long gfn = gfn_x(p2m->max_gfn);
> > +    int rc = 0;
> > +
> > +    if ( !paging_mode_translate(d) )
> > +        return 0;
> > +
> > +    BUG_ON(!d->is_dying);
> > +
> > +    p2m_lock(p2m);
> > +
> > +    /* Iterate over the whole p2m on debug builds to ensure correctness. */
> > +    while ( gfn && (IS_ENABLED(CONFIG_DEBUG) || p2m->nr_foreign) )
> > +    {
> > +        unsigned int order;
> > +        p2m_type_t t;
> > +        p2m_access_t a;
> > +
> > +        _get_gfn_type_access(p2m, _gfn(gfn - 1), &t, &a, 0, &order, 0);
> > +        ASSERT(IS_ALIGNED(gfn, 1u << order));
> 
> This heavily relies on the sole place where max_gfn is updated being indeed
> sufficient.
> 
> > +        gfn -= 1 << order;
> 
> Please be consistent with the kind of 1 you shift left. Perhaps anyway both
> better as 1UL.
> 
> > +        if ( t == p2m_map_foreign )
> > +        {
> > +            ASSERT(p2m->nr_foreign);
> > +            ASSERT(order == 0);
> > +            /*
> > +             * Foreign mappings can only be of order 0, hence there's no need
> > +             * to align the gfn to the entry order.  Otherwise we would need to
> > +             * adjust gfn to point to the start of the page if order > 0.
> > +             */
> 
> I'm a little irritated by this comment. Ahead of the enclosing if() you
> already rely on (and assert) GFN being suitably aligned.

Oh, I've added that outer assert later, and then didn't remove this
comment.

> > +            rc = p2m_set_entry(p2m, _gfn(gfn), INVALID_MFN, order, p2m_invalid,
> > +                               p2m->default_access);
> > +            if ( rc )
> > +            {
> > +                printk(XENLOG_ERR
> > +                       "%pd: failed to unmap foreign page %" PRI_gfn " order %u error %d\n",
> > +                       d, gfn, order, rc);
> > +                ASSERT_UNREACHABLE();
> > +                break;
> > +            }
> 
> Together with the updating of ->max_gfn further down, for a release build
> this means: A single attempt to clean up the domain would fail when such a
> set-entry fails. However, another attempt to clean up despite the earlier
> error would then not retry for the failed GFN, but continue one below.
> That's unexpected: I'd either see such a domain remain as a zombie forever,
> or a best effort continuation of all cleanup right away.

I see, thanks for spotting that.  Will change the logic to ensure the
index is not updated past the failed to remove entry.

> > +        }
> > +
> > +        if ( !(gfn & 0xfff) && hypercall_preempt_check() )
> 
> By going from gfn's low bits you may check way more often than necessary
> when encountering large pages.

Yeah, it's difficult to strike a good balance, short of counting by
processed entries rather than using the gfn value.  I'm fine with
checking more often than required, as long as we always ensure that
progress is made on each function call.

Thanks, Roger.

