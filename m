Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC97DBC8B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625202.974243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUAo-0000bt-I4; Mon, 30 Oct 2023 15:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625202.974243; Mon, 30 Oct 2023 15:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUAo-0000aS-Ei; Mon, 30 Oct 2023 15:27:26 +0000
Received: by outflank-mailman (input) for mailman id 625202;
 Mon, 30 Oct 2023 15:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxUAn-0000Z3-0b
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:27:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e80b18-7738-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:27:23 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d224dca585so288125366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 08:27:23 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 lx21-20020a170906af1500b0099bd1a78ef5sm6190991ejb.74.2023.10.30.08.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:27:22 -0700 (PDT)
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
X-Inumbo-ID: d2e80b18-7738-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698679643; x=1699284443; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oDv9YoFrTnA29vimrVV31aE1YbJjtL8YXlrkJxpuVGg=;
        b=WNI1LliKylmGGxxePJ+iTV0MzrjflAzHZzj0dRAypzR9RlCo6ENxNp+55rdN8o6jyo
         6lkM+rQx4DaRHvJXkmYqEt2karXJVWLr5A/aWBlsYoMyjoyilA2PaDijMwq0zb715CgV
         B3OZejn7sj2+Q4z2p4jIfx/e28npm7vSRlYpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698679643; x=1699284443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDv9YoFrTnA29vimrVV31aE1YbJjtL8YXlrkJxpuVGg=;
        b=F87O53pC/nhYuSwnYaoq2dqkQyH1GHARNcdjjTjqAtgqYA1Q+IXjxex4Rr80SWW3Mh
         VdjGm8vuNxusyxaHKh8LH1JR0fu35FUs0Iin61TbIdr0GOWQF6UjmDCaddhtnXRYfowa
         4veOqUuwOvzmvrhUjugaYJVPrhrFPCC4J5LpLwo4aAq1gMWtILXlsBWp+XW328CmKJGc
         LmTBYwBMjcQSANnaGwY+861/cdkdkA2P/fy6HOmTQ8Q0VQdEdNNOz2bxs3e+i58Fg556
         17j4yGFQxcH5roQmPDz0NN9dyWPQkMhDsyTuE5ihBDB6d05Htjp13mR7OvXoaHQfkTun
         WnbQ==
X-Gm-Message-State: AOJu0Yyj2e25R/weOEsdNL1UUXvZuNCoQC79P8VcTUU+fWZp71aSEhiv
	zvnRGoZ8WM9tYciIkV+EvluoAw==
X-Google-Smtp-Source: AGHT+IHYh6gRxVsqjMxqIACJjZmvbGMdi79cgQQtSNz58cUPUrN8AzXLllwXs3QkuLf7AwHu/CBB8A==
X-Received: by 2002:a17:907:3fa2:b0:9c4:4b20:44a9 with SMTP id hr34-20020a1709073fa200b009c44b2044a9mr9719619ejc.65.1698679643073;
        Mon, 30 Oct 2023 08:27:23 -0700 (PDT)
Date: Mon, 30 Oct 2023 16:27:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZT_LWjKgQxOE9lpj@macbook>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>

On Mon, Oct 30, 2023 at 07:50:27AM -0700, Elliott Mitchell wrote:
> On Tue, Oct 24, 2023 at 03:51:50PM +0200, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
> > index 707deef98c27..15632cc7332e 100644
> > --- a/xen/arch/x86/genapic/x2apic.c
> > +++ b/xen/arch/x86/genapic/x2apic.c
> > @@ -220,38 +239,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> >  static int8_t __initdata x2apic_phys = -1;
> >  boolean_param("x2apic_phys", x2apic_phys);
> >  
> > +enum {
> > +   unset, physical, cluster, mixed
> > +} static __initdata x2apic_mode = unset;
> > +
> > +static int __init parse_x2apic_mode(const char *s)
> > +{
> > +    if ( !cmdline_strcmp(s, "physical") )
> > +        x2apic_mode = physical;
> > +    else if ( !cmdline_strcmp(s, "cluster") )
> > +        x2apic_mode = cluster;
> > +    else if ( !cmdline_strcmp(s, "mixed") )
> > +        x2apic_mode = mixed;
> > +    else
> > +        return EINVAL;
> > +
> > +    return 0;
> > +}
> > +custom_param("x2apic-mode", parse_x2apic_mode);
> > +
> >  const struct genapic *__init apic_x2apic_probe(void)
> >  {
> > -    if ( x2apic_phys < 0 )
> > +    /* x2apic-mode option has preference over x2apic_phys. */
> > +    if ( x2apic_phys >= 0 && x2apic_mode == unset )
> > +        x2apic_mode = x2apic_phys ? physical : cluster;
> > +
> > +    if ( x2apic_mode == unset )
> >      {
> > -        /*
> > -         * Force physical mode if there's no (full) interrupt remapping support:
> > -         * The ID in clustered mode requires a 32 bit destination field due to
> > -         * the usage of the high 16 bits to hold the cluster ID.
> > -         */
> > -        x2apic_phys = iommu_intremap != iommu_intremap_full ||
> > -                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
> > -                      IS_ENABLED(CONFIG_X2APIC_PHYSICAL);
> > -    }
> > -    else if ( !x2apic_phys )
> > -        switch ( iommu_intremap )
> > +        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
> >          {
> 
> Could this explain the issues with recent AMD processors/motherboards?
> 
> Mainly the firmware had been setting this flag, but Xen was previously
> ignoring it?

No, not unless you pass {no-}x2apic_phys={false,0} on the Xen command
line to force logical (clustered) destination mode.

> As such Xen had been attempting to use cluster mode on an
> x2APIC where that mode was broken for physical interrupts?

No, not realy, x2apic_phys was already forced to true if
acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL is set on the FADT (I
just delete that line in this same chunk and move it here).

Thanks, Roger.

