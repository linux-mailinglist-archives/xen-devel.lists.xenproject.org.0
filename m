Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C34CC386
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 18:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283612.482694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPp20-0001fg-2i; Thu, 03 Mar 2022 17:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283612.482694; Thu, 03 Mar 2022 17:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPp1z-0001dk-Vf; Thu, 03 Mar 2022 17:14:23 +0000
Received: by outflank-mailman (input) for mailman id 283612;
 Thu, 03 Mar 2022 17:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nUi=TO=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nPp1y-0001de-RG
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 17:14:22 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cca1409-9b15-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 18:14:20 +0100 (CET)
Received: by mail-qk1-x72e.google.com with SMTP id g24so4417970qkl.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Mar 2022 09:14:20 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 g2-20020a37e202000000b00607e264a208sm1284711qki.40.2022.03.03.09.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 09:14:18 -0800 (PST)
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
X-Inumbo-ID: 5cca1409-9b15-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r3j8kd/nS/vCxqwkAj6LyrvAJ8Ze30ZAvwyjGjkhz4k=;
        b=Tv8DKjIjWUzJeur6akOrdF5+rpQEOA4jMSOzpxSb9NO8QmAnlfBNG5FHEOHPHaYYU1
         n/UPi4FHfZYqlIrZZ3BWpQn0h8v6/SxzncVI9JdVusJLrTHcUb/ZoxG8Epkgu0phs+Cd
         jUMHPSNmoXDW8SbZOuCuDCnVOVy3P0v3ISArid9mGUWbEiPkSLA43Q0mwlYFBCsLmTug
         3v5zeWQgh/N4E8veWcgs9zzZguKxlAUQzCVUc4hALrbGXu/EynCZzSz6tlkzayexmtjm
         PUzA0yZuI9Sr+17ChpedrCdrdCkN/Pq+1mszYzQhF9GUBqyX+X19LNimhdnh4+aHTkOb
         aBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r3j8kd/nS/vCxqwkAj6LyrvAJ8Ze30ZAvwyjGjkhz4k=;
        b=kI/VzU2iaD8HmEM2AkkLtqv2b8fAzX3tm9w9qJXjlu7+J+cNq9Nb+BjkFFyEinUx3C
         SmOESsqQrQyg3Psj+UhmS2kHlx/gvf3S0ddyYhSAhZ2pAXkP14KE3Mnr8X/GjOc7cVlK
         hUlo7iiQohFK0N5LltsSsJQv41U3bJqBKyl8wH/c61sglLATKnUy5v7v1Ck374laN/3i
         0wVLcoUF1lo8FlpMEUTv8ysm7zdZcCJJ69JkZwGnbvH4qLa3HR70SHC9kylLzvi+AuHQ
         rWOSeUznOXQBYa023v8Rpj7V7n5Utv6w5HT6cgmvgU10rm7wDsXuh5a8Acdz2BgUS9gA
         s3Cw==
X-Gm-Message-State: AOAM532XF5gBPsZBeAM7Pith2JVQjetoxIgC/QRePEhLMl3/46sHRFUr
	UO+CWZWzS+JFNmedYNiY9Nw=
X-Google-Smtp-Source: ABdhPJxdQhAkJhNcmGuazrt1a8B/mTDv0jCqfHaONZeVjuJuNkaE8OFK1RGe6rDm0hndINjQzL0vNw==
X-Received: by 2002:a37:9a4c:0:b0:47e:157b:a80c with SMTP id c73-20020a379a4c000000b0047e157ba80cmr152367qke.114.1646327659035;
        Thu, 03 Mar 2022 09:14:19 -0800 (PST)
Message-ID: <8a1fc9175a1227e8f7271face85e5a38671e0891.camel@gmail.com>
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
From: Alex Olson <this.is.a0lson@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
	Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 03 Mar 2022 11:14:17 -0600
In-Reply-To: <c416bfc2-218a-e641-5fd7-505ea4f7a322@suse.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
	 <20220303103057.49181-4-roger.pau@citrix.com>
	 <9a02db6a23b269fe774ad4a0bc4c662e5e4df37c.camel@gmail.com>
	 <c416bfc2-218a-e641-5fd7-505ea4f7a322@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I wasn't sure of the distinction between hardware domain and control domain for these commands, but they appear to be blocked at the moment when dom0 executes them, including a lot at boot.  Are you suggesting to use is_hardware_domain(currd) instead in my diff?    

Or should the hardware domain always be able to execute any physdev op command? (such as to bypass the switch statement entirely)


It looks like hvm_physdev_op() is the only real caller of do_physdev_op(), and  several other commands (besides the ones in the diff below) are also being blocked by the default case of hvm_physdev_op.

PHYSDEVOP_pirq_eoi_gmfn_v2
PHYSDEVOP_pirq_eoi_gmfn_v1
PHYSDEVOP_IRQ_UNMASK_NOTIFY // legacy?
PHYSDEVOP_apic_read
PHYSDEVOP_apic_write
PHYSDEVOP_alloc_irq_vector
PHYSDEVOP_set_iopl
PHYSDEVOP_set_iobitmap
PHYSDEVOP_restore_msi
PHYSDEVOP_restore_msi_ext
PHYSDEVOP_setup_gsi
PHYSDEVOP_get_free_pirq
PHYSDEVOP_dbgp_op

Thanks

-Alex

On Thu, 2022-03-03 at 17:47 +0100, Jan Beulich wrote:
> On 03.03.2022 17:45, Alex Olson wrote:
> > --- a/xen/arch/x86/hvm/hypercall.c
> > +++ b/xen/arch/x86/hvm/hypercall.c
> > @@ -84,6 +84,17 @@ static long hvm_physdev_op(int cmd,
> > XEN_GUEST_HANDLE_PARAM(void) arg)
> >  
> >      switch ( cmd )
> >      {
> > +
> > +    case PHYSDEVOP_manage_pci_add:
> > +    case PHYSDEVOP_manage_pci_remove:
> > +    case PHYSDEVOP_pci_device_add:
> > +    case PHYSDEVOP_pci_device_remove:
> > +    case PHYSDEVOP_manage_pci_add_ext:
> > +    case PHYSDEVOP_prepare_msix:
> > +    case PHYSDEVOP_release_msix:
> > +        if ( is_control_domain(currd) )
> > +            break;
> 
> These are all operations which I think are purposefully permitted to
> be invoked by the hardware domain only. That's where all the devices
> live when they're not passed through to guests.
> 
> Jan
> 


