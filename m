Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4C682D8F9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 13:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667365.1038543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMI7-0006dR-Hf; Mon, 15 Jan 2024 12:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667365.1038543; Mon, 15 Jan 2024 12:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMI7-0006bs-El; Mon, 15 Jan 2024 12:42:11 +0000
Received: by outflank-mailman (input) for mailman id 667365;
 Mon, 15 Jan 2024 12:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPMI6-0006bm-GY
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 12:42:10 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb7fca0-b3a3-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 13:42:08 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso9214051a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 04:42:08 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170906274d00b00a2b608ad048sm5234711ejd.28.2024.01.15.04.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 04:42:07 -0800 (PST)
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
X-Inumbo-ID: 7eb7fca0-b3a3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705322528; x=1705927328; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHRnL7OFk58JWmF7qip3gJ+Dxrz4aAB5HdIpQ/qcUSU=;
        b=Mfky/2ZoRe1M9zf5UoCuBZTaCAg7CzDvinFa/qg4kn58cp6QTJVEF2G8RRN+yuGjor
         TuVFCNxRri+Z2lpdxhdSfwKUy1euXld/n+DSku4Kbr/WGHJuofJmiCD8ae6Lh9+SiFYO
         Pyvzrc2Gyh0kB1yM7BNQgTo3p3b2tVg5GoPlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705322528; x=1705927328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHRnL7OFk58JWmF7qip3gJ+Dxrz4aAB5HdIpQ/qcUSU=;
        b=E8IhkFx1jxpTIwpdbnGFzpQOZMMQVE5dm6CJ9iQ87hqNKPFQ1GXSxBm8bN/whMTV2j
         tJ1uhYaNP8V8NYMBEHDsCXmCjCE313y9nxcMEY7tw4KUN1ZAjapz3reWS07H6yS3lEyC
         nMh1brXIGZ0neH783Pr5tFrISBW//qnn5q8SyeYUpfqw/jv6C125U+CV54FPm8M0aqOC
         JrtHJ37CYRkZw04bM0o4bF8q1+g7Qsby/Ng/ehiZm/d/L4Q0mRxftHzhHMohny+TfMO6
         fZaAccuqaEkfd+Y01jm22Ga+A8OUyzod2nDsfvR9BjvvYWKlTKxT48c0iH8puiwfsF+4
         FgJg==
X-Gm-Message-State: AOJu0YwJvXYyw1b9JwucLMYThRTspa6klBZaRWNBAPEACFmASmqUVBGX
	I3UjI/EcomlBaf8SDwh/Lh2fzdP0tIkWZg==
X-Google-Smtp-Source: AGHT+IGcUFbs/eChy5SnY6UzZBfGmg/Ea6RXISpoPFMV94qdvhuaQTnnbN8R7ueToFhp4NixXtn7hg==
X-Received: by 2002:a17:907:a80a:b0:a2c:aff6:f6a9 with SMTP id vo10-20020a170907a80a00b00a2caff6f6a9mr2656993ejc.150.1705322527797;
        Mon, 15 Jan 2024 04:42:07 -0800 (PST)
Date: Mon, 15 Jan 2024 13:42:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option
 to skip timer check
Message-ID: <ZaUoHlW5izg-ZJaw@macbook>
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-2-julien@xen.org>
 <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
 <8b8a62a0-f854-405e-b256-5eee4bfdcb6c@xen.org>
 <b74f1f28-58da-4604-a7ef-370aeb0522ce@suse.com>
 <d0daf858-eda8-4b2a-9cfe-82fff834df8f@xen.org>
 <3a0b6d8a-d9f3-41d0-9acc-e84b5d9d3e33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a0b6d8a-d9f3-41d0-9acc-e84b5d9d3e33@suse.com>

On Thu, Jan 04, 2024 at 09:54:30AM +0100, Jan Beulich wrote:
> On 02.01.2024 20:09, Julien Grall wrote:
> > Hi Jan,
> > 
> > On 14/12/2023 10:35, Jan Beulich wrote:
> >> On 14.12.2023 11:14, Julien Grall wrote:
> >>> On 14/12/2023 10:10, Jan Beulich wrote:
> >>>> On 11.12.2023 13:23, Julien Grall wrote:
> >>>>> --- a/xen/arch/x86/io_apic.c
> >>>>> +++ b/xen/arch/x86/io_apic.c
> >>>>> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
> >>>>>    int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
> >>>>>    int __read_mostly nr_ioapics;
> >>>>>    
> >>>>> +/*
> >>>>> + * The logic to check if the timer is working is expensive. So allow
> >>>>> + * the admin to bypass it if they know their platform doesn't have
> >>>>> + * a buggy timer.
> >>>>> + */
> >>>>> +static bool __initdata pit_irq_works;
> >>>>> +boolean_param("pit-irq-works", pit_irq_works);
> >>>>> +
> >>>>>    /*
> >>>>>     * Rough estimation of how many shared IRQs there are, can
> >>>>>     * be changed anytime.
> >>>>> @@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
> >>>>>    {
> >>>>>        unsigned long t1, flags;
> >>>>>    
> >>>>> +    if ( pit_irq_works )
> >>>>> +        return 1;
> >>>>
> >>>> When the check is placed here, what exactly use of the option means is
> >>>> system dependent. I consider this somewhat risky, so I'd prefer if the
> >>>> check was put on the "normal" path in check_timer(). That way it'll
> >>>> affect only the one case which we can generally consider "known good",
> >>>> but not the cases where the virtual wire setups are being probed. I.e.
> > 
> > By "known good", do you mean the following:
> > 
> > diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> > index c89fbed8d675..c39d39ee951a 100644
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -1960,7 +1959,8 @@ static void __init check_timer(void)
> >            * Ok, does IRQ0 through the IOAPIC work?
> >            */
> >           unmask_IO_APIC_irq(irq_to_desc(0));
> > -        if (timer_irq_works()) {
> > +        if (pit_irq_works || timer_irq_works()) {
> > +            printk("====== pirq_irq_works %d =====\n", pit_irq_works);
> >               local_irq_restore(flags);
> >               return;
> >           }
> 
> Yes.
> 
> >>> I am not against restricting when we allow skipping the timer check. But
> >>> in that case, I wonder why Linux is doing it differently?
> >>
> >> Sadly Linux'es git history doesn't go back far enough (begins only at past
> >> 2.6.11), so I can't (easily) find the patch (and description) for the x86-64
> >> change. The later i386 change is justified mainly by paravirt needs, so
> >> isn't applicable here. I wouldn't therefore exclude that my point above
> >> wasn't even taken into consideration. Furthermore their command line option
> >> is "no_timer_check", which to me firmly says "don't check" without regard to
> >> whether the source (PIT) is actually okay. That's different with the option
> >> name you (imo validly) chose.
> > 
> > Just to note that the name was suggested by Roger. I have to admit that 
> > I didn't check if this made sense for the existing placement.
> 
> Roger, thoughts?

Right, with the usage of HPET in legacy replacement mode we are no
longer exclusively testing the PIT, so might make sense to use a more
generic name, timer-irq-works or some such.

Thanks, Roger.

