Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623B8CE17A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 09:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729110.1134244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPGI-00082Z-Ds; Fri, 24 May 2024 07:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729110.1134244; Fri, 24 May 2024 07:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPGI-0007zn-Ax; Fri, 24 May 2024 07:22:46 +0000
Received: by outflank-mailman (input) for mailman id 729110;
 Fri, 24 May 2024 07:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAPGH-0007zQ-7R
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 07:22:45 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695a506b-199e-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 09:22:43 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-420180b5838so44040855e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 00:22:43 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c93c6sm889533f8f.85.2024.05.24.00.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 00:22:42 -0700 (PDT)
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
X-Inumbo-ID: 695a506b-199e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716535363; x=1717140163; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hDYO1vx3pxdXiZRN27quhtULXuy3BunbmQgjoaLa634=;
        b=DyMLKLuhNS8pYKU7Kw60N0Qr909BtRIcouDTTuEcOoZOC1849kfkMo3RDMIPdynDE3
         WoSnNV26Z9lfSiOVMo898kmiP9FMoG2IGgh8AqNOjoTJVfKIwxVk5OTZQt7qQgrFzPO3
         G5fz/ZXrgS/nw7jWkuPU33gq/KjHFiJu3gl9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716535363; x=1717140163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDYO1vx3pxdXiZRN27quhtULXuy3BunbmQgjoaLa634=;
        b=hy0PK5bguYckueD4ZD0NgnNfdG0hxkhTx9V89B310HKXEiVSS7JyRfoeHnlFzVLdXk
         j6lFxUntMIOIf8Ae5ZFeK+ymFB6EZmCsIXFlSQStnkchfMQaqd81PZWFUkLEoVoD4/Y9
         VkSGgbrhtyWlZ2e63Me4swtVVv+VMatt8MXpvT+CD/A5Om6dNR1Z6vtwZrpSuLWyRJ9U
         aF9HEjFPDfhcLwTNhFWv4jWidmMzpQqggmpzG8rjvBLRUyin9AQSHmYOCpAJKTsaVAlQ
         UD0kZcK6gHbFhW8lh3iNQUeAKzAHLFN32TNaOzcPue9/UJWgHBvZjUBFTcoYaxRcxplQ
         gWRw==
X-Forwarded-Encrypted: i=1; AJvYcCXODwXxwO+xkpu5kO2nFXdyYUD9g2iG6YdRXxEioyLoA3aXTSUkyewJ8y/d3/HFe1VL1a7f3yY/v+yWnVLyyRVfbrFoN+UM+zsJWPxvT30=
X-Gm-Message-State: AOJu0YwPF6yVeO4tAhNfcAejqLEOELvAaiWcFxpYyn4Ui+MDRe8tMqxs
	HuVL4TlW5jP8FC/sxS3enfpGkPjk+Kn0SFKxgWViSY0KMeBZ4ExKNlghwaNInPI=
X-Google-Smtp-Source: AGHT+IEZxBS18z8UiBenD2B5gQoP1aU6T1KWFMp4np+gywznQz84I0TpVTRLuHvpklGdp0wgDA/ODQ==
X-Received: by 2002:a5d:6342:0:b0:354:c329:90d1 with SMTP id ffacd0b85a97d-3552fdefa90mr1185753f8f.63.1716535363001;
        Fri, 24 May 2024 00:22:43 -0700 (PDT)
Date: Fri, 24 May 2024 09:22:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/8] x86/vlapic: Move lapic_load_hidden migration
 checks to the check hook
Message-ID: <ZlBAQbgE7FvobVsu@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
 <630e0117-f401-4d55-a1de-2682d8d9b406@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <630e0117-f401-4d55-a1de-2682d8d9b406@citrix.com>

On Thu, May 23, 2024 at 07:58:57PM +0100, Andrew Cooper wrote:
> On 08/05/2024 1:39 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 8a244100009c..2f06bff1b2cc 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1573,35 +1573,54 @@ static void lapic_load_fixup(struct vlapic *vlapic)
> >                 v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
> >  }
> >  
> > -static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> > +static int cf_check lapic_check_hidden(const struct domain *d,
> > +                                       hvm_domain_context_t *h)
> >  {
> >      unsigned int vcpuid = hvm_load_instance(h);
> > -    struct vcpu *v;
> > -    struct vlapic *s;
> > +    struct hvm_hw_lapic s;
> >  
> >      if ( !has_vlapic(d) )
> >          return -ENODEV;
> >  
> >      /* Which vlapic to load? */
> > -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> > +    if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL )
> 
> As you're editing this anyway, swap for
> 
>     if ( !domain_vcpu(d, vcpuid) )
> 
> please.
> 
> >      {
> >          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
> >                  d->domain_id, vcpuid);
> >          return -EINVAL;
> >      }
> > -    s = vcpu_vlapic(v);
> >  
> > -    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
> > +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) )
> > +        return -ENODATA;
> > +
> > +    /* EN=0 with EXTD=1 is illegal */
> > +    if ( (s.apic_base_msr & (APIC_BASE_ENABLE | APIC_BASE_EXTD)) ==
> > +         APIC_BASE_EXTD )
> > +        return -EINVAL;
> 
> This is very insufficient auditing for the incoming value, but it turns
> out that there's no nice logic for this at all.
> 
> As it's just a less obfuscated form of the logic from
> lapic_load_hidden(), it's probably fine to stay as it is for now.
> 
> The major changes since this logic was written originally are that the
> CPU policy correct (so we can reject EXTD on VMs which can't see
> x2apic), and that we now prohibit VMs moving the xAPIC MMIO window away
> from its default location (as this would require per-vCPU P2Ms in order
> to virtualise properly.)

Since this is just migration of the existing checks I think keeping
them as-is is best.  Adding new checks should be done in a followup
patch.

Thanks, Roger.

