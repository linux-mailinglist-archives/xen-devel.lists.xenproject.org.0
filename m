Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191C88C84D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 16:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698136.1089537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9Bf-0004zH-6o; Tue, 26 Mar 2024 15:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698136.1089537; Tue, 26 Mar 2024 15:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9Bf-0004w4-42; Tue, 26 Mar 2024 15:58:07 +0000
Received: by outflank-mailman (input) for mailman id 698136;
 Tue, 26 Mar 2024 15:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvZH=LA=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1rp9Bd-0004vs-Oc
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 15:58:05 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0b8e92b-eb89-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 16:58:04 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-789e6e1d96eso382541585a.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 08:58:04 -0700 (PDT)
Received: from EMEAENGAAD91498 ([160.101.131.1])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05620a148f00b00789f3e53d04sm3121726qkj.126.2024.03.26.08.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 08:58:02 -0700 (PDT)
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
X-Inumbo-ID: a0b8e92b-eb89-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711468683; x=1712073483; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2G8XtjFfIX8eX+c1Z74JQK5HAFUvy9DvIqvRyQc860=;
        b=QD6F/pv6Hxv+oR7ZD+CH7YcUOiXKZqOHQTohWePtjyK59CRMt5JWc0OnZYmK6Sm8lY
         hZjNfALBwsM8kuPfGztz1YSqCVTVe8kLY7P3qLqmtg9SoBb53tN2Nbh62cQTNO87oVPn
         70+eY0t5WCspZzjzPcVJjxjHNrEQ6TD7hmqhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711468683; x=1712073483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2G8XtjFfIX8eX+c1Z74JQK5HAFUvy9DvIqvRyQc860=;
        b=eYNhmGdPaPBZdTURNVKhDNEOyU/oDjmnLM+bk3GQQST63BxDDuW312NZvNRbKoY//s
         2996DhZtjKlLrDxyBD3k6hPTfBzrUInQCTpTubXbRWC9R2DrOobhAYO9qn0HPYruKPQs
         THdcgLQK1U/uXCnri/2xNvST7E1MLgVreeVTY2tmwDqPJXN87ypv7FagiwAIk01KOhGr
         fqI0jWkIgpM2mH8htUaMT4n3a9S7xX20Kiuk8YpvueDdi+z0UCjc7lHfcUYU2etX2YtI
         CiIBcNlyIUpDnYImp9XU4z0N1d5+PR+jrOZiVLtlholHFYqIwQ19IZ9NbfrC5b4FzDhR
         ObgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQFia2SHZNRCljWBH0MDoYYSeykrNV4Z7Gps6HN3FQ854lMelspYkB8waYdX5w4eAdq6snAqE9c+4Ho97MU1D1JKalm+sPEZlFlvJQkCU=
X-Gm-Message-State: AOJu0Ywb/kDAPBVlR2MEggnb6/CHn/yImLMic3DsKvl8OP+doBlUx1pb
	jfFFqYrJtErUhB4oqstnB3GTki0eLZeIBUJ1pCyIreLltQCaaRfwnYtXpljzc7g=
X-Google-Smtp-Source: AGHT+IHJAAPCveKBgT2q54F3lc4fTPnZqsyYgMJdH26Rn2nlSSRbe7LGK8XkdxD4eqXrhr5y6Hcsvw==
X-Received: by 2002:a05:620a:4154:b0:78a:30d2:c3d2 with SMTP id k20-20020a05620a415400b0078a30d2c3d2mr199407qko.4.1711468682953;
        Tue, 26 Mar 2024 08:58:02 -0700 (PDT)
Date: Tue, 26 Mar 2024 15:57:58 +0000
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
Message-ID: <sjkt43mvc7mpqqbqi3yky5eouf6lk3cuiksskvrnoo7hyq7gfp@7lfnxlbpvuef>
References: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
 <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>

> > This patch scans each APIC ID before constructing the MADT, and uses the
> > x2APIC entry for each vCPU whose APIC ID exceeds the size limit imposed
> > by regular APIC entries.
> 
> It is my understanding that if you use any x2APIC entry, every CPU needs
> to have one.

In the ACPI 6.4 specification, section 5.2.12.12, the note says the following:

[Compatibility note] On some legacy OSes, Logical processors with APIC ID
values less than 255 (whether in XAPIC or X2APIC mode) must use the Processor
Local APIC structure to convey their APIC information to OSPM, and those
processors must be declared in the DSDT using the Processor() keyword.

Therefore, even in X2APIC mode, it's better to represent processors with APIC
ID values less than 255 with APIC entries for legacy reasons.

> > @@ -134,27 +151,45 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
> >          io_apic->ioapic_id   = config->ioapic_id;
> >          io_apic->ioapic_addr = config->ioapic_base_address;
> >  
> > -        lapic = (struct acpi_20_madt_lapic *)(io_apic + 1);
> > +        apicid_entry = io_apic + 1;
> >      }
> >      else
> > -        lapic = (struct acpi_20_madt_lapic *)(madt + 1);
> > +        apicid_entry = madt + 1;
> >  
> >      info->nr_cpus = hvminfo->nr_vcpus;
> > -    info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, lapic);
> > +    info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, apicid_entry);
> >      for ( i = 0; i < hvminfo->nr_vcpus; i++ )
> >      {
> > -        memset(lapic, 0, sizeof(*lapic));
> > -        lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
> > -        lapic->length  = sizeof(*lapic);
> > -        /* Processor ID must match processor-object IDs in the DSDT. */
> > -        lapic->acpi_processor_id = i;
> > -        lapic->apic_id = config->lapic_id(i);
> > -        lapic->flags = (test_bit(i, hvminfo->vcpu_online)
> > -                        ? ACPI_LOCAL_APIC_ENABLED : 0);
> > -        lapic++;
> > +        uint32_t apic_id = config->lapic_id(i);
> > +        if ( apic_id < 255 )
> 
> Nit (here and below): This file uses hypervisor coding style. and hence a
> blank line is wanted between declaration(s) and statement(s).

I will add this in patch V2

> > +        {
> > +            struct acpi_20_madt_lapic *lapic = apicid_entry;
> > +            memset(lapic, 0, sizeof(*lapic));
> > +            lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
> > +            lapic->length  = sizeof(*lapic);
> > +            /* Processor ID must match processor-object IDs in the DSDT. */
> > +            lapic->acpi_processor_id = i;
> > +            lapic->apic_id = apic_id;
> > +            lapic->flags = (test_bit(i, hvminfo->vcpu_online)
> > +                            ? ACPI_LOCAL_APIC_ENABLED : 0);
> > +            apicid_entry = lapic + 1;
> > +        }
> > +        else
> > +        {
> > +            struct acpi_20_madt_x2apic *x2apic = apicid_entry;
> > +            memset(x2apic, 0, sizeof(*x2apic));
> > +            x2apic->type    = ACPI_PROCESSOR_LOCAL_X2APIC;
> > +            x2apic->length  = sizeof(*x2apic);
> > +            x2apic->apic_id = apic_id;
> > +            x2apic->flags   = (test_bit(i, hvminfo->vcpu_online)
> > +                                ? ACPI_LOCAL_APIC_ENABLED : 0);
> 
> Nit: Indentation off by 1.

I will add this in patch V2

Matt

