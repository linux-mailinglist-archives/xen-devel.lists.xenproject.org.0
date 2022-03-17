Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E14DCB18
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291669.495214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsot-0000QW-Ts; Thu, 17 Mar 2022 16:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291669.495214; Thu, 17 Mar 2022 16:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsot-0000NC-Pn; Thu, 17 Mar 2022 16:17:47 +0000
Received: by outflank-mailman (input) for mailman id 291669;
 Thu, 17 Mar 2022 16:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtxi=T4=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nUsos-0000Ll-3r
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:17:46 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6d79850-a60d-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:17:45 +0100 (CET)
Received: by mail-io1-xd2a.google.com with SMTP id w7so6453348ioj.5
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 09:17:44 -0700 (PDT)
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
X-Inumbo-ID: c6d79850-a60d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JxLjpWSIHvZG9FKfsgH+mfSUEz4eG17pTg1A3b2zFkA=;
        b=eWFsg4onp/UCfEimNAk3GCR9Bmm3V6y2LgD4hHMuRDnB46GR+93fJtW7sCnLOwXJbq
         ChOjPHKRJZvPWrLyt5SHk0SSvyYYkCnT7XuR/9ObH5ixIZqcuFYpnJV20Hyzbs2i1fGx
         XmjaSc77JdJ1STHN9nDgyYz6nT8UkNitcMR60aykGPXmZBCio0lQkxYUwkH0Igsn9+nX
         IvXpGSQEjnbyaVYbaYOYGcUHefFyWu7uJuGP/Sx6abZ5phaeKzouJeAquNpvEMqLKtax
         7SmCrhuhcSSs0Y1cgRi8K6/H/4eVvmQVD1DQp/sM0XRtYbgnDAHoNvbr91sgLNzKLt0s
         f19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JxLjpWSIHvZG9FKfsgH+mfSUEz4eG17pTg1A3b2zFkA=;
        b=FChhUws/oVUTXXiGA5J0LfsdYtnsdY4rHGubWahXQvO05pm3IDHedW8WjOVceSD1Xw
         UKQMfUuhnQ6KF3fvlPQK92DHu/t6Q/4gDu+NaUYqSTpc1b+xAITBhEMeeHBhL3MgLf4h
         f2BDW0wdetXARY+GigGG+JhRid0zxYG1LaFNHrH37REM47H+/kFspJrDehvDout2wijq
         8baUdGqcZisH+u/nMJbuD3dmXNlZGHESgUD5o5A1GLpmbvYnPh5rRwwvT3M6HWTY3oHM
         RTed2G8JClXBeBSA2IlBk+G9d8sPIZbZIsfVg4WPjMC7Fdm3Hhy98g8gCJojHkfm30ka
         fOzg==
X-Gm-Message-State: AOAM533vhv587dgmr6+vF1G9Cw/pxAlzXBWrZSdI+23I7KPcvkN85lye
	E+DBUr2h87GLlL2hHbAq7mLEU17NahwxoCUchSU=
X-Google-Smtp-Source: ABdhPJyC/V8enoH+Adc3D2IRvA6nB3nabgVeLeYRTGcg13stAYvY6UYIb+SFYdcBJHi9oRf84OEW68mtS8j8JeHnlCU=
X-Received: by 2002:a05:6638:4102:b0:319:effe:d355 with SMTP id
 ay2-20020a056638410200b00319effed355mr2520443jab.121.1647533863778; Thu, 17
 Mar 2022 09:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com> <CABfawhnsbqBOuTyB-C4sY23GY-4-AXd38TXqVMemVt_duwSZiQ@mail.gmail.com>
 <3dc898e4-b00b-2e85-eda9-a28da6737ab5@suse.com> <CABfawh=FgBcLYgFr+4R7795bqKfeYyr5MF09__zDEpfk6hcmHg@mail.gmail.com>
 <2f0a88cc-f9f2-2b9b-dd0b-52321ab328c2@suse.com>
In-Reply-To: <2f0a88cc-f9f2-2b9b-dd0b-52321ab328c2@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 17 Mar 2022 12:17:07 -0400
Message-ID: <CABfawhmhfqL4V_XwFdnkeTU0EsnWMfcOrk6xU7CLDOn3tCyUeg@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 12:07 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.03.2022 16:59, Tamas K Lengyel wrote:
> > On Thu, Mar 17, 2022 at 11:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 17.03.2022 15:43, Tamas K Lengyel wrote:
> >>> On Thu, Mar 17, 2022 at 9:56 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 10.03.2022 19:44, Tamas K Lengyel wrote:
> >>>>> @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
> >>>>>      v->arch.dr6   = ctxt.dr6;
> >>>>>      v->arch.dr7   = ctxt.dr7;
> >>>>>
> >>>>> +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
> >>>>
> >>>> Setting reserved bits as well as certain combinations of bits will
> >>>> cause VM entry to fail. I think it would be nice to report this as
> >>>> an error here rather than waiting for the VM entry failure.
> >>>
> >>> Not sure if this would be the right spot to do that since that's all
> >>> VMX specific and this is the common hvm code.
> >>
> >> Well, it would be the VMX hook to do the checking, with an error
> >> propagated back here.
> >
> > I'm actually against it because the overhead of that error-checking
> > during vm forking would be significant with really no benefit. We are
> > copying the state from the parent where it was running fine before, so
> > doing that sanity checking thousands of times per second when we
> > already know its fine is bad.
>
> I can see your point, but my concern is not forking but normal migration
> or restoring of guests, where the incoming data is of effectively
> unknown origin.

IMHO for that route the error checking is better performed at the
toolstack level that sends the data to Xen.

Tamas

