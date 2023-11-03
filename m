Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FF07E03DB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 14:42:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627165.978064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyuQw-000714-JP; Fri, 03 Nov 2023 13:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627165.978064; Fri, 03 Nov 2023 13:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyuQw-0006yD-GU; Fri, 03 Nov 2023 13:41:58 +0000
Received: by outflank-mailman (input) for mailman id 627165;
 Fri, 03 Nov 2023 13:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUT0=GQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qyuQv-0006y7-8a
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 13:41:57 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beba7be8-7a4e-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 14:41:52 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so18310745e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 06:41:52 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 y8-20020a5d4708000000b0032d9523de65sm1895028wrq.48.2023.11.03.06.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:41:51 -0700 (PDT)
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
X-Inumbo-ID: beba7be8-7a4e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699018911; x=1699623711; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KPhnDk3yFtgQalvvXMUI+OvNhiBQCR0sjk+I64vS5I8=;
        b=TfqqpsfnojTTsoIX2eZv8jSIo4sF8qNv7zdX2PG5RE7Njyw/nXCdqpPb9mP26nNTQ3
         Miol2nlRrmZ2JrsausZWy9Ebi2m2iLja9Ou7keewpf75MkmGsWXnKkck5D0j3Zb32Z0X
         4uEoGLgOz55YVrBxnpbiuUv2IpfO3efi9Q/b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699018911; x=1699623711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPhnDk3yFtgQalvvXMUI+OvNhiBQCR0sjk+I64vS5I8=;
        b=baChidZAxfuDPNaC1Ie6nGQRQ5vsB7gs7HDimQfE+0OaFNSe9IRqi/sJdhhRLJXoyf
         eyJ/CRrTTG07OgsrqEHXRFBbAk/v10nqvBuimOImTnvSteooP+ZaplB/eHIXueT0lTkV
         8rs5YGEHfaJurkdhZ5HZyZAKqVDqCN81t0SFXynPwCcyfsZPtR97Xlew6chT1N6BQ+MS
         ZKFfKKfDuniDhMk2Hjlj2qkXBKTaFO8oCYpf3b11J8MoGDqFNYRHl1aMwF+eOHHLArNw
         2DEPq+MQTxMwcqC0pJzgRmyCVGQWz6QB8MiGQuoWEVbxkepn8JO2mX7cRaFRXMHH3WG0
         GaeQ==
X-Gm-Message-State: AOJu0YxutHcss2DZfzC0T5XdglDCSBQMrG/pwK/ftnfSNZTczLW6UWd7
	yfiuG5lDenPFKfTpY3cietRpqA==
X-Google-Smtp-Source: AGHT+IEIWtX0VDm1xZJU7+w4TbvQJGIlgpVFXzeVSl8Fv5nDUTIYgvrEw+/gVJd4vgqd0eepsN/KuQ==
X-Received: by 2002:adf:d1ca:0:b0:32f:7967:aa4d with SMTP id b10-20020adfd1ca000000b0032f7967aa4dmr15118310wrd.68.1699018911634;
        Fri, 03 Nov 2023 06:41:51 -0700 (PDT)
Date: Fri, 3 Nov 2023 14:41:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZUT4nig3QbIodRwV@macbook>
References: <20231031145259.77199-1-roger.pau@citrix.com>
 <e6ec9635-4856-6f3b-88f6-d1baddad4741@suse.com>
 <ZUTsCjVYXQzJVVJi@macbook>
 <869b790e-91c1-f416-585e-2c14eb4a5087@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <869b790e-91c1-f416-585e-2c14eb4a5087@suse.com>

On Fri, Nov 03, 2023 at 01:51:13PM +0100, Jan Beulich wrote:
> On 03.11.2023 13:48, Roger Pau Monné wrote:
> > On Thu, Nov 02, 2023 at 02:38:09PM +0100, Jan Beulich wrote:
> >> On 31.10.2023 15:52, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/genapic/x2apic.c
> >>> +++ b/xen/arch/x86/genapic/x2apic.c
> >>> @@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
> >>>      .send_IPI_self = send_IPI_self_x2apic
> >>>  };
> >>>  
> >>> +/*
> >>> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> >>> + * cluster for inter processor interrupts.  Such mode has the benefits of not
> >>> + * sharing the vector space with all CPUs on the cluster, while still allowing
> >>> + * IPIs to be more efficiently delivered by not having to perform an ICR write
> >>> + * for each target CPU.
> >>> + */
> >>> +static const struct genapic __initconstrel apic_x2apic_mixed = {
> >>> +    APIC_INIT("x2apic_mixed", NULL),
> >>> +    /*
> >>> +     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
> >>> +     * exclusively used by external interrupts and hence are set to use
> >>> +     * Physical destination mode handlers.
> >>> +     */
> >>> +    .int_delivery_mode = dest_Fixed,
> >>> +    .int_dest_mode = 0 /* physical delivery */,
> >>> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
> >>> +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> >>> +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> >>> +    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
> >>> +    .send_IPI_self = send_IPI_self_x2apic
> >>> +};
> >>
> >> I'm afraid the comment is still misleading in one respect: The .init_apic_ldr
> >> hook is also set to its Clustered mode handler (and validly so). As before my
> >> suggestion would be to leverage that we're using dedicated initializers here
> >> and have a Physical mode portion and a Clustered mode one, each clarifying in
> >> a brief leading comment where/how the handlers are used.
> > 
> > I've split this as:
> > 
> > /*
> >  * Mixed x2APIC mode: use physical for external (device) interrupts, and
> >  * cluster for inter processor interrupts.  Such mode has the benefits of not
> >  * sharing the vector space with all CPUs on the cluster, while still allowing
> >  * IPIs to be more efficiently delivered by not having to perform an ICR write
> >  * for each target CPU.
> >  */
> > static const struct genapic __initconstrel apic_x2apic_mixed = {
> >     APIC_INIT("x2apic_mixed", NULL),
> >     /*
> >      * The following fields are exclusively used by external interrupts and
> >      * hence are set to use Physical destination mode handlers.
> >      */
> >     .int_delivery_mode = dest_Fixed,
> >     .int_dest_mode = 0 /* physical delivery */,
> >     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> >     .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> >     /*
> >      * The following fields are exclusively used by IPIs and hence are set to
> >      * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
> >      * is not used by IPIs,
> 
> Not quite correct, I think: This is setting up the receive side of the IPIs
> (iirc LDR needs to be set for logical delivery mode to be usable). Beyond
> that lgtm, fwiw.

No, LDR is read-only in x2APIC mode (it's rw in xAPIC mode).
init_apic_ldr_x2apic_cluster() just reads LDR, but doesn't set it.

Thanks, Roger.

