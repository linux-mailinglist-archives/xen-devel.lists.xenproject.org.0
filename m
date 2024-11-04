Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA189BB2F4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 12:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829941.1244872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7v7v-0005rW-Qn; Mon, 04 Nov 2024 11:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829941.1244872; Mon, 04 Nov 2024 11:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7v7v-0005pD-Nq; Mon, 04 Nov 2024 11:20:07 +0000
Received: by outflank-mailman (input) for mailman id 829941;
 Mon, 04 Nov 2024 11:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O1IB=R7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t7v7u-0005p7-J9
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 11:20:06 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc74c18f-9a9e-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 12:20:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so537698266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 03:20:03 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e565e098asm540630666b.132.2024.11.04.03.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 03:20:01 -0800 (PST)
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
X-Inumbo-ID: bc74c18f-9a9e-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJjNzRjMThmLTlhOWUtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzE5MjAzLjEyNTMyLCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730719202; x=1731324002; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhShygv7xRE3mw/zSLnp9s5OVDLep70S43sBjj3r3EY=;
        b=cFai4dFKm+53r1weIY1ZovjoVBzKwGQ/OIyMNunrsQRE2JHAU+2ggAH9TOGTSTHjsh
         2hpv8N5X1kB+y59L4DTcUlAMRZFTD6xzG4pXcgR+gBDkF8BS5LP5PFiqwdj9gIpQqJCi
         4Kf4AKBsMi4r9fHUu9f4oURXUVDQmuIchiS6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730719202; x=1731324002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhShygv7xRE3mw/zSLnp9s5OVDLep70S43sBjj3r3EY=;
        b=vVZMqGt9PAi0tdaRSa0QAk9eGbBiu5ovbcUsFotFLHAjqsmfDCUCGxkXI/SzmYJOpz
         M8/AFjz/izuaq/GU1h7FeQ/qv55bLCUFI6+SebnOi50yFWLh0eMtdoCBW2Lg+Ck0Md2i
         2xGD123u0W2bYsyEk5eQ10AJxslpiiCCZepU8as95d2x3SSTMSn6ckA+5yNxq9dYQ/vG
         WkkrnUudE8nMRRviZzL3vLTGLreICNdco6FWhrEv8JWfdW/yDEdw2UGg1hfD+g49rD8e
         dfMEZnXVEhsL1I6TedxUxvupov8r6RpvkBIex5JcWCqrrxuHvBBwjb+cU0VmUdjWo6Mg
         OaAA==
X-Forwarded-Encrypted: i=1; AJvYcCXC0DlKt+C/6ecwmPUd19MiYZ6TSlzTZ+xkrFbXUR9C0YxrvPlZAYHEFxOPUaeoavy5Mh8lqvZdXiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw8WwGzh3NxSpLhSOA7EqVpa7QmLlCTYpbuySKg5tT1Dl7ECGF
	HjinR+NTfvHuuo2OYxY45ak5wEFK00v1HNqz24rebLl7j6QHeO7LRMDS4QcHnbU=
X-Google-Smtp-Source: AGHT+IE1bFgzh7lRoTR8gQZBPSN9QDPlCEWThh+XWgCclC7jWi1QL4lKDKx4PCAjIeggnKOGILIQ1A==
X-Received: by 2002:a17:907:9490:b0:a9a:eeb:b263 with SMTP id a640c23a62f3a-a9e50caff2fmr1460099366b.58.1730719202221;
        Mon, 04 Nov 2024 03:20:02 -0800 (PST)
Date: Mon, 4 Nov 2024 12:20:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <Zyit4HLFOS5GZ-Ze@macbook>
References: <20241031085713.6156-1-roger.pau@citrix.com>
 <64059351-dd82-4393-8852-ff60d6d8d5bb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64059351-dd82-4393-8852-ff60d6d8d5bb@suse.com>

On Mon, Nov 04, 2024 at 10:56:36AM +0100, Jan Beulich wrote:
> On 31.10.2024 09:57, Roger Pau Monne wrote:
> > @@ -71,6 +72,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> >  
> >  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> >  
> > +/*
> > + * Store the EOI handle when using interrupt remapping.
> > + *
> > + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> > + * format repurposes the vector field to store the offset into the Interrupt
> > + * Remap table.  This breaks directed EOI, as the CPU vector no longer matches
> > + * the contents of the RTE vector field.  Add a translation cache so that
> > + * directed EOI uses the value in the RTE vector field when interrupt remapping
> > + * is enabled.
> > + *
> > + * Intel VT-d Xen code still stores the CPU vector in the RTE vector field when
> > + * using the remapped format, but use the translation cache uniformly in order
> > + * to avoid extra logic to differentiate between VT-d and AMD-Vi.
> > + *
> > + * The matrix is accessed as [#io-apic][#pin].
> > + */
> > +static uint8_t **io_apic_pin_eoi;
> 
> __ro_after_init?

Oh, yes indeed, allocations are static after init.

> > @@ -273,6 +292,17 @@ void __ioapic_write_entry(
> >      {
> >          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> >          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> > +        /*
> > +         * Might be called before io_apic_pin_eoi is allocated.  Entry will be
> > +         * initialized to the RTE value once the cache is allocated.
> 
> With the movement of the allocation to enable_IO_APIC(), isn't this part of
> the comment stale now?

There are still paths that call __ioapic_write_entry() before
enable_IO_APIC().  See for example how x2apic_bsp_setup() makes use of
save_IO_APIC_setup() ahead of enable_IO_APIC().

> > +         * The vector field is only cached for raw RTE writes when using IR.
> > +         * In that case the vector field might have been repurposed to store
> > +         * something different than the CPU vector, and hence need to be cached
> > +         * for performing EOI.
> > +         */
> > +        if ( io_apic_pin_eoi )
> > +            io_apic_pin_eoi[apic][pin] = e.vector;
> 
> The conditional here is necessary anyway, isn't it (for the allocation
> being conditional itself)?

Indeed, the matrix won't be allocated if interrupt remapping is not
enabled.

> With the adjustments (or clarification of why they cannot be made)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> If the adjustments can be confirmed I'd also be happy to make them while
> committing, to save another round-trip.

I agree with the __ro_after_init, see my reply to the code comment.

Regards, Roger.

