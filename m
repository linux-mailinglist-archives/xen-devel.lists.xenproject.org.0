Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C3805826
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647999.1011863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWyR-0005bV-DC; Tue, 05 Dec 2023 15:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647999.1011863; Tue, 05 Dec 2023 15:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWyR-0005Yr-9w; Tue, 05 Dec 2023 15:04:35 +0000
Received: by outflank-mailman (input) for mailman id 647999;
 Tue, 05 Dec 2023 15:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAWyQ-0005XK-9q
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:04:34 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98171b23-937f-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:04:31 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33349b3f99aso1841927f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:04:31 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b0033339e03a60sm9463879wrp.59.2023.12.05.07.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:04:31 -0800 (PST)
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
X-Inumbo-ID: 98171b23-937f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701788671; x=1702393471; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUiOyLY2Pjwf708Ro4smCRG8Qe1QO1yDFhCbJ3wkyx4=;
        b=iZxsz7bUWm67YPB5lPlv40jfbWn9fDzD3voZ6bdcVrrH0aS/34ht26ejxKVEOnAvdL
         /OLDkSBWAEH1RTWUs0efpmorzu9WIHZltrfEmahL/+NE0MexUpeM0GztPYsDLKAqqars
         TS62+EW1w50iYYWzj4w/jfVCqFe2yBIsHl61U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788671; x=1702393471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUiOyLY2Pjwf708Ro4smCRG8Qe1QO1yDFhCbJ3wkyx4=;
        b=MWxjxwWWFflA3ukC7S3XGPnJU13rlhxFK7CobjLF4AEqBOOAXXLhWMx8bMsoOmxqDD
         lGZ89jCZz9DSPo4XbTHRIoB7RLjrcp2NgnBA0v/vh1NhMEX5FByR7zgfAJ73uqSKzZW0
         px/x3c21pWY5IiqStjY4UAWwVn54YT5Rt762frG4Nc9HtQEm9QRi/PeklWxjcBB4rvGA
         M1w83uSFHhhgFFK/pKgtfoJ+sRppPpo032j3ubtsMPDjO09GvnIH8sfhCunZUXYcCKBt
         PAqN0Iwq4mU7A60qgr4txsIKiTC4mx+Z6jNLaGbr7xhKvhbYNLY1ydflnWMXHCjTOC7V
         n8eA==
X-Gm-Message-State: AOJu0YxK48VFdqypb3dgIC/L+957DXlub8po/CQ3YlX1A7pkJJvWIDJI
	owYwTUpeyi1bCnZp3OdycnWjjQ==
X-Google-Smtp-Source: AGHT+IFSuDrjQYY6BqlPBnK4aZ7AdWfEioWyO7TqBgo1aqguGJcOnXxNxO8JILgAuZitoMvabtejJA==
X-Received: by 2002:a5d:51c2:0:b0:333:2fd2:51f0 with SMTP id n2-20020a5d51c2000000b003332fd251f0mr4015141wrv.105.1701788671273;
        Tue, 05 Dec 2023 07:04:31 -0800 (PST)
Date: Tue, 5 Dec 2023 16:04:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] xen/livepatch: register livepatch regions when loaded
Message-ID: <ZW87_kZhE3UJC3UZ@macbook>
References: <20231130142944.46322-1-roger.pau@citrix.com>
 <20231130142944.46322-2-roger.pau@citrix.com>
 <4bfb71ef-0443-40dd-a854-349db42a7a30@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bfb71ef-0443-40dd-a854-349db42a7a30@suse.com>

On Tue, Dec 05, 2023 at 02:47:56PM +0100, Jan Beulich wrote:
> On 30.11.2023 15:29, Roger Pau Monne wrote:
> > diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> > index 5f89703f513b..b444253848cf 100644
> > --- a/xen/common/virtual_region.c
> > +++ b/xen/common/virtual_region.c
> > @@ -23,14 +23,8 @@ static struct virtual_region core_init __initdata = {
> >  };
> >  
> >  /*
> > - * RCU locking. Additions are done either at startup (when there is only
> > - * one CPU) or when all CPUs are running without IRQs.
> > - *
> > - * Deletions are bit tricky. We do it when Live Patch (all CPUs running
> > - * without IRQs) or during bootup (when clearing the init).
> > - *
> > - * Hence we use list_del_rcu (which sports an memory fence) and a spinlock
> > - * on deletion.
> > + * RCU locking. Modifications to the list must be done in exclusive mode, and
> > + * hence need to hold the spinlock.
> >   *
> >   * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
> >   */
> > @@ -58,38 +52,28 @@ const struct virtual_region *find_text_region(unsigned long addr)
> >  
> >  void register_virtual_region(struct virtual_region *r)
> >  {
> > -    ASSERT(!local_irq_is_enabled());
> > +    unsigned long flags;
> >  
> > +    spin_lock_irqsave(&virtual_region_lock, flags);
> >      list_add_tail_rcu(&r->list, &virtual_region_list);
> > +    spin_unlock_irqrestore(&virtual_region_lock, flags);
> >  }
> >  
> >  static void remove_virtual_region(struct virtual_region *r)
> >  {
> > -    unsigned long flags;
> > +     unsigned long flags;
> 
> Nit: Stray blank added?

Oh, my bad.

> > -    spin_lock_irqsave(&virtual_region_lock, flags);
> > -    list_del_rcu(&r->list);
> > -    spin_unlock_irqrestore(&virtual_region_lock, flags);
> > -    /*
> > -     * We do not need to invoke call_rcu.
> > -     *
> > -     * This is due to the fact that on the deletion we have made sure
> > -     * to use spinlocks (to guard against somebody else calling
> > -     * unregister_virtual_region) and list_deletion spiced with
> > -     * memory barrier.
> > -     *
> > -     * That protects us from corrupting the list as the readers all
> > -     * use list_for_each_entry_rcu which is safe against concurrent
> > -     * deletions.
> > -     */
> > +     spin_lock_irqsave(&virtual_region_lock, flags);
> > +     list_del_rcu(&r->list);
> > +     spin_unlock_irqrestore(&virtual_region_lock, flags);
> >  }
> >  
> >  void unregister_virtual_region(struct virtual_region *r)
> >  {
> > -    /* Expected to be called from Live Patch - which has IRQs disabled. */
> > -    ASSERT(!local_irq_is_enabled());
> > -
> >      remove_virtual_region(r);
> > +
> > +    /* Assert that no CPU might be using the removed region. */
> > +    rcu_barrier();
> >  }
> 
> rcu_barrier() is a relatively heavy operation aiui. Seeing ...
> 
> >  #if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
> 
> ... this I'd like to ask to consider hiding {,un}register_virtual_region()
> in "#ifdef CONFIG_LIVEPATCH" as well, to make clear these aren't supposed
> to be used for other purpose. Would at the same time address two Misra
> violations, I think (both functions having no callers when !LIVEPATCH).

That's fine, I can do it this same patch unless you prefer such
adjustment to be in a separate change.

Thanks, Roger.

