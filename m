Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A03A54FB9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903828.1311772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDYh-0002ie-QU; Thu, 06 Mar 2025 15:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903828.1311772; Thu, 06 Mar 2025 15:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDYh-0002gV-Ng; Thu, 06 Mar 2025 15:54:51 +0000
Received: by outflank-mailman (input) for mailman id 903828;
 Thu, 06 Mar 2025 15:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tqDYg-0002FS-OH
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:54:50 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 556b1a74-faa3-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 16:54:50 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso1910264a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:54:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2ff4e75edb2sm3693712a91.4.2025.03.06.07.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 07:54:47 -0800 (PST)
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
X-Inumbo-ID: 556b1a74-faa3-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741276488; x=1741881288; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=37ZgWfR5Nnpd5UrOzHenaI+1wi0xoTg6BJOexVnWfW4=;
        b=SAmLzdz8dW7UHwqkNXAQSENahUhyLDGQKTu2lg3ArQKZMQw0iHZlQDQTJmZrS9MptG
         zq+2wxGtWZWYj/gfEAMLone1ZIK9VSrtcy7KLiHfIjro2IkghJ5m9/7xK6SRJ2T5BXq2
         w42monpONfuBKnpMKMZDh6VjMr3mBfsaYxmAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276488; x=1741881288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37ZgWfR5Nnpd5UrOzHenaI+1wi0xoTg6BJOexVnWfW4=;
        b=kNOoNN0rDL3p0Vu5po90QetcthpvZGENnTyIW9LLwgKX3UjoCh956ZQ6fpZEeH3CtZ
         NruEODT+TPQGgRKR7u2GzsNt6q7ToT/289vNiUvVmQ5cvJQCudMs4j9U/fIiJxnTSj7Q
         8xkWADBAZTnc3inXynK95p+ggMeXsSD7OdR1qfLKnm5WaweuyQQt61OW5z2PnG7BuBvc
         zS45p4ltjzTMgxnlpjbppN6qEnfNtsS+R/arXRtEneLQh3iNazT0dRqM9DkOumZy1/Sx
         0vVns26q8EkSUNKw1vMaYB1ACEjCusAIRwch3igEzT7oYX4Xk9GBuN/18D+mRkN4WevW
         1u7g==
X-Forwarded-Encrypted: i=1; AJvYcCUkd5t5RyJ00PFjlznMn6k7p6Y3vnaKdrcvKahLWfGVXgR0wUKIL6/kkNt2l7D3PzqkK7J5nf9Abtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2Ni7IfhoUS6Tuv7yfUDNFd/fEtewtcrejv4gThwc/mib4vvnU
	FDaoMIQ4aDQ92H1fNKYhTVWMX/E/LVhLmtq6kR8J5TolGbQkflbERARti18NVRLbc21PtSAMKUB
	3
X-Gm-Gg: ASbGncvvttQpO5p8DFns6tvrBSR4TjreVauDS4iQLHfM6ndgIMvrJj6dGrcteBnt3ba
	xjfblf+bL7wXfQw4X6DCAxy2xwewitiqEVbs6dV2ci35841rJbb+pybWA+flPbX6UItvz7D5BUV
	CLMyZp2Hmxj0/nlyH2z4Zs0JZEqBtJHu7Ifkd/wJeJZj0jjKQ998WnBGAsFM/CBw8r3oZBlIRSw
	HbASMjKhBRTWRaAWKCpyOQkQ5W+g6HlV0Ur4rRz1aO4YzpZdnMZ5oJ3SMsT6SR7lXGJPUM8VV/m
	U1N99pQp2rlEvqNsrkWLzwwCPTthYVwZqFU4FiBWz8A8mELhbw==
X-Google-Smtp-Source: AGHT+IEGrhAyaP4h/foK0popgQ55sNUjD490NS1hHboOLeWuN18iqTMeqq/DvOaUT+fXtuxl7m/m2g==
X-Received: by 2002:a17:90b:5743:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-2ff49842a71mr11937021a91.30.1741276488427;
        Thu, 06 Mar 2025 07:54:48 -0800 (PST)
Date: Thu, 6 Mar 2025 16:54:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/3] x86/apic: remove delivery and destination mode
 fields from drivers
Message-ID: <Z8nFQoHzXdeedN6j@macbook.local>
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-2-roger.pau@citrix.com>
 <f53539b7-ca49-465c-8aeb-205a489130ea@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f53539b7-ca49-465c-8aeb-205a489130ea@suse.com>

On Thu, Mar 06, 2025 at 04:33:37PM +0100, Jan Beulich wrote:
> On 06.03.2025 15:57, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/genapic/bigsmp.c
> > +++ b/xen/arch/x86/genapic/bigsmp.c
> > @@ -46,8 +46,6 @@ static int __init cf_check probe_bigsmp(void)
> >  
> >  const struct genapic __initconst_cf_clobber apic_bigsmp = {
> >  	APIC_INIT("bigsmp", probe_bigsmp),
> > -	.int_delivery_mode = dest_Fixed,
> > -	.int_dest_mode = 0, /* physical delivery */
> >  	.init_apic_ldr = init_apic_ldr_phys,
> >  	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
> >  	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> > --- a/xen/arch/x86/genapic/default.c
> > +++ b/xen/arch/x86/genapic/default.c
> > @@ -16,8 +16,6 @@
> >  /* should be called last. */
> >  const struct genapic __initconst_cf_clobber apic_default = {
> >  	APIC_INIT("default", NULL),
> > -	.int_delivery_mode = dest_Fixed,
> > -	.int_dest_mode = 0, /* physical delivery */
> >  	.init_apic_ldr = init_apic_ldr_flat,
> >  	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
> >  	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> > --- a/xen/arch/x86/genapic/x2apic.c
> > +++ b/xen/arch/x86/genapic/x2apic.c
> > @@ -140,8 +140,6 @@ static void cf_check send_IPI_mask_x2apic_cluster(
> >  
> >  static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
> >      APIC_INIT("x2apic_phys", NULL),
> > -    .int_delivery_mode = dest_Fixed,
> > -    .int_dest_mode = 0 /* physical delivery */,
> >      .init_apic_ldr = init_apic_ldr_phys,
> >      .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> >      .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> > @@ -163,8 +161,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
> >       * The following fields are exclusively used by external interrupts and
> >       * hence are set to use Physical destination mode handlers.
> >       */
> > -    .int_delivery_mode = dest_Fixed,
> > -    .int_dest_mode = 0 /* physical delivery */,
> >      .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> >      .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> 
> Like we had it everywhere above, ...
> 
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -1080,8 +1080,8 @@ static void __init setup_IO_APIC_irqs(void)
> >               */
> >              memset(&entry,0,sizeof(entry));
> >  
> > -            entry.delivery_mode = INT_DELIVERY_MODE;
> > -            entry.dest_mode = INT_DEST_MODE;
> > +            entry.delivery_mode = dest_Fixed;
> > +            entry.dest_mode = 0;
> 
> ... here and below these zeros would better gain a comment, or be expressed
> as e.g. (untested) MASK_EXTR(APIC_DEST_PHYSICAL, APIC_DEST_MASK).

I've started adding those comments, but then I got the impression they
where a bit redundant, many of the setting of the fields didn't have a
matching comment.  I was even tempted to just not setting the field at
all, seeing as the structure is zeroed.

Also this is the IO-APIC RTE, so it feels a bit out of place to use
the local APIC defines?

I will add a comment if you are fine with it.

Thanks, Roger.

