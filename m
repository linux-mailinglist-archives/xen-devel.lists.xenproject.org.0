Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD3CA6ED81
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926262.1329131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1QF-0005KR-8o; Tue, 25 Mar 2025 10:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926262.1329131; Tue, 25 Mar 2025 10:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1QF-0005I1-6G; Tue, 25 Mar 2025 10:22:15 +0000
Received: by outflank-mailman (input) for mailman id 926262;
 Tue, 25 Mar 2025 10:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kATq=WM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tx1QD-0005Hu-Dg
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:22:13 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00e38fc4-0963-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 11:22:07 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224171d6826so32635885ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 03:22:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-227811c0cb8sm86079655ad.122.2025.03.25.03.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 03:22:05 -0700 (PDT)
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
X-Inumbo-ID: 00e38fc4-0963-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742898126; x=1743502926; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQs2MQ7qVRbNMJHbCM5bWSarB3xGRHf2C0jjYhuIPRM=;
        b=GvYkRfH1emLMAlvZnWNfJO9sQETijnN3kKmbYgDk6+9LDqPMkWzbAX6qBIUPdF7Fjj
         lrIEAuqUAJCE3s4K0ldJuV8Qt3XTHE6niDJbTDo/PDnQ3uPythdvtuEK4+LdGTkBZNjn
         jtXXddB9pzXksIOaFOX7UjKYf2rYtOfHBtW3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742898126; x=1743502926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQs2MQ7qVRbNMJHbCM5bWSarB3xGRHf2C0jjYhuIPRM=;
        b=B8yt5ruQ3w0Kyhz0WEWUgF4WrX8Zt0IJ1572hTp5vCtiQPgD9o0e8hfO8bV+LMUYL7
         zX1TFK0UrZLsi74CEwCv20AeHydOEMyjPJLrlAdmkJ1iq6Tb7fLmBfRxppuZpR1FcKf9
         NL/bTk6G97SjRTOU86QTclKTqlC0NeVpcqQ7x7Wo7kMsNEo5WhYjS1KGlvz2BQ/OnYtO
         3uXzZ0LAfxLjvkcTnrvaJ3X0my0nNieGFBcKtviBuYvnmTSPZ+VDST3ARlxaaoF0f8TM
         cCR1YyxWHdadCU18Oi9DGbLTcLTlP2xJ87bUESqvNy/qb1fuvenexRaWBby23ncZXVld
         PVog==
X-Forwarded-Encrypted: i=1; AJvYcCWQZm1ZyIV3cmy4lF0KWsKE3vtp4wsEHqPs94bVeDhF4Tstk1bCS72ETl509wJ8ECR2g2vxWHw4DuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv5nPOLttYqgJAbyrEfSgrWurcU8aklejQ5RDf+qVxlazMi08Y
	CrwDRBwulMmGTz6rd0xS81nHp+amPPcNOTAbu1GG3S3jMK6hHFRiUYQKJDtoxlk=
X-Gm-Gg: ASbGnctIBIoAeB7Xsd+DtBHQeL1DVivKtnRMS0F6fEmbnZDZD4cuKqaD00LjMdf3M3A
	a0mNPwnnvnMYr9helQ88/6WqTlZ1MjK+gRmqIXvSmkk4zJWmSx0IxJ34KWlzhs7gPA6wXqLxHb9
	mi1QcjN+4Avm7FKbw4Pze2bpun3iNNbuIASxcIeTtkuMH4/PJ5nSyFNqQk08/LuCxE3DQsDnli9
	Mv8akWYp7hiaOBLyQE4ScX1RaZGs79BCg+xTVTmc7Neh5X6e1nlkbs4awaWqUas/k+aDG6ZKI+Y
	Fa1d2rOfk9zVW9vzOJIGhSNfBesLe4ZF3fVMS58Csol3x+kAzw==
X-Google-Smtp-Source: AGHT+IF85xhWKCrs08RP4P7IKWzeGYUYqC72eXPjEagDGhBRZZgGX/BU+7NeI+5hClPwqyJM9bhKWA==
X-Received: by 2002:a17:902:ef11:b0:224:c46:d166 with SMTP id d9443c01a7336-22780e14e84mr295978445ad.40.1742898126108;
        Tue, 25 Mar 2025 03:22:06 -0700 (PDT)
Date: Tue, 25 Mar 2025 11:22:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Gomez <da.gomez@kernel.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <Z-KDyCzeovpFGiVu@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local>
 <87y0wtzg0z.ffs@tglx>
 <87v7rxzct0.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7rxzct0.ffs@tglx>

On Tue, Mar 25, 2025 at 10:20:43AM +0100, Thomas Gleixner wrote:
> On Tue, Mar 25 2025 at 09:11, Thomas Gleixner wrote:
> 
> > On Mon, Mar 24 2025 at 20:18, Roger Pau Monné wrote:
> >> On Mon, Mar 24, 2025 at 07:58:14PM +0100, Daniel Gomez wrote:
> >>> The issue is that info appears to be uninitialized. So, this worked for me:
> >>
> >> Indeed, irq_domain->host_data is NULL, there's no msi_domain_info.  As
> >> this is x86, I was expecting x86 ot always use
> >> x86_init_dev_msi_info(), but that doesn't seem to be the case.  I
> >> would like to better understand this.
> >
> > Indeed. On x86 this should not happen at all. On architectures, which do
> > not use (hierarchical) interrupt domains, it will return NULL.
> >
> > So I really want to understand why this happens on x86 before such a
> > "fix" is deployed.
> 
> So after staring at it some more it's clear. Without XEN, the domain
> returned is the MSI parent domain, which is the vector domain in that
> setup. That does not have a domain info set. But on legacy architectures
> there is not even a domain.
> 
> It's really wonderful that we have a gazillion ways to manage the
> backends of PCI/MSI....

I'm a bit confused by what msi_create_device_irq_domain() does, as it
does allocate an irq_domain with an associated msi_domain_info
structure, however that irq_domain is set in
dev->msi.data->__domains[domid].domain rather than dev->msi.domain,
and doesn't override the default irq_domain set by
pcibios_device_add().

And the default x86 irq_domain (set by pcibios_device_add()) doesn't
have an associated msi_domain_info.

> So none of the suggested pointer checks will cover it correctly. Though
> there is already a function which allows to query MSI domain flags
> independent of the underlying insanity. Sorry for not catching it in
> review.

Oh, that's nice, I didn't know about that helper.

> Untested patch below.

LGTM, but (as you can see) I'm not expert on that area.

Thanks, Roger.

