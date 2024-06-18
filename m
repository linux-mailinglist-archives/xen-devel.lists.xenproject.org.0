Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D035A90C515
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742862.1149750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUer-0000JD-PC; Tue, 18 Jun 2024 08:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742862.1149750; Tue, 18 Jun 2024 08:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUer-0000Fo-Kw; Tue, 18 Jun 2024 08:57:41 +0000
Received: by outflank-mailman (input) for mailman id 742862;
 Tue, 18 Jun 2024 08:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBP2=NU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJUer-0000DG-0s
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:57:41 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0ba5ae3-2d50-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:57:40 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7953f1dcb01so449730685a.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:57:40 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe6b4dfsm506192185a.125.2024.06.18.01.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:57:38 -0700 (PDT)
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
X-Inumbo-ID: d0ba5ae3-2d50-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718701059; x=1719305859; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MJWeAXBDDEpLuGkGIY36gY2Jr0ZSeY/lNnVY9HPv1s=;
        b=fXovXeN2AsU06pmGEuJ8It8mRgdPfybM/gRMHZLxA7up9M3vAec2u+gOm0p7xMXZ5E
         OTLk78VU+Qbsh72M2qpe+8jLAfS/FADmmfPaQvc0wak93b/e+fupcFf3dSrxCELvNMOX
         j9wpPdE+xWlkvjzHv6GVToPM/CbpwLxYEDLOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718701059; x=1719305859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MJWeAXBDDEpLuGkGIY36gY2Jr0ZSeY/lNnVY9HPv1s=;
        b=FKe/UI1QN9oOOVaDTgiDMZdxogS2y7EyurekNCFKZbTKQihkNj5UtSMxiftLXQqolD
         7ySKM9asBA6uL5fkK9LdBX71fOYx+79RdgJqDcVPD+y/s2C6h3z/II8mFvWmyDJEhA/W
         IYgZhS736LTCXPqF4J2a/jc9tIfUGlK1AGFnOFHgezmhmerTXwx5zMZMv04vxIIcyv/V
         4hZhZrsab/I6njDojaOVIv/YL6fhGqxuaEZ7+48EykocsZd/fjyWEbsUTKsc5nJ/TFMZ
         +C0aL9s1H1DvOz9wJgXANMgBh8RK70mnBtkHxlgueVPr9Ir4Z1+CPv+k4eCSHOsnJ1/7
         tpgw==
X-Forwarded-Encrypted: i=1; AJvYcCVb/cBHLG1aL912Ff811wJ9UHIUptJmCsKP9O3ICrfVCbIV/yDaE6r02FXtoWEPxv8/uDRMIkXiDBqWBff8dgN6CEVfB2o4yb75txD0luc=
X-Gm-Message-State: AOJu0YyFj2lx7Ihtgm9JDMFMIK2gWpfkt2ZwFGvjK07j4fgLdCFwroR2
	D1FitG+gIAugwN7cFr2/n6Jyjd/GqalgERNxRn9jn8QWX1fYyYjlpPjbOuTTFH0=
X-Google-Smtp-Source: AGHT+IFECmvJp1ez2eLa+dpQfO6eX8nUMX4FYtnOHPp9ThmxkkpraoTUSlv3dCTdEWRDY19HCOSrbQ==
X-Received: by 2002:a05:620a:4005:b0:797:cfb3:155f with SMTP id af79cd13be357-798d240afdamr1497813685a.27.1718701058859;
        Tue, 18 Jun 2024 01:57:38 -0700 (PDT)
Date: Tue, 18 Jun 2024 10:57:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/xen/time: Reduce Xen timer tick
Message-ID: <ZnFL_0ihWiI7Yaf0@macbook>
References: <20240617141303.53857-1-frediano.ziglio@cloud.com>
 <2fe6ef97-84f2-4bf4-870b-b0bb580fa38f@suse.com>
 <ZnBKDRWi_2cO6WbA@macbook>
 <CACHz=Zg4Zoyr4KNeig4yDDNUxvV325beJEyT-L-K0a+FHp7oDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=Zg4Zoyr4KNeig4yDDNUxvV325beJEyT-L-K0a+FHp7oDg@mail.gmail.com>

On Tue, Jun 18, 2024 at 09:37:08AM +0100, Frediano Ziglio wrote:
> On Mon, Jun 17, 2024 at 3:37 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Mon, Jun 17, 2024 at 04:22:21PM +0200, Jan Beulich wrote:
> > > On 17.06.2024 16:13, Frediano Ziglio wrote:
> > > > Current timer tick is causing some deadline to fail.
> > > > The current high value constant was probably due to an old
> > > > bug in the Xen timer implementation causing errors if the
> > > > deadline was in the future.
> > > > This was fixed in Xen commit:
> > > > 19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future
> > >
> > > And then newer kernels are no longer reliably usable on Xen older than
> > > this?
> >
> > I think this should reference the Linux commit that removed the usage
> > of VCPU_SSHOTTMR_future on Linux itself, not the change that makes Xen
> > ignore the flag.
> >
> 
> Yes, Linux kernel stopped using this flag since 2016 with commit
> c06b6d70feb32d28f04ba37aa3df17973fd37b6b, "xen/x86: don't lose event
> interrupts", I'll add it in the commit message.
> 
> > > > --- a/arch/x86/xen/time.c
> > > > +++ b/arch/x86/xen/time.c
> > > > @@ -30,7 +30,7 @@
> > > >  #include "xen-ops.h"
> > > >
> > > >  /* Minimum amount of time until next clock event fires */
> > > > -#define TIMER_SLOP 100000
> > > > +#define TIMER_SLOP 1000
> > >
> > > It may be just the lack of knowledge of mine towards noadays's Linux'es
> > > time handling, but the change of a value with this name and thus
> > > commented doesn't directly relate to "timer tick" rate. Could you maybe
> > > help me see the connection?
> >
> > The TIMER_SLOP define is used in min_delta_{ns,ticks} field, and I
> > think this is wrong.
> >
> > The min_delta_ns for the Xen timer is 1ns.  If Linux needs some
> > greater min delta than what the timer interface supports it should be
> > handled in the generic timer code, not open coded at the definition of
> > possibly each timer implementation.
> >
> 
> I think this is done to reduce potential event handling frequency, in
> some other part of timer code (in kernel/time/clockevents.c) there's a
> comment "Deltas less than 1usec are pointless noise".

Then why does the interface allow for timers having a resolution up to
1ns then?

> I think it's hard for a software to get a frequency so high so I
> didn't propose 1ns.
> What are you suggesting? To put 1ns and see what happens? Is there any
> proper test code for this?

The Xen timer interface has a resolution of 1ns, and the Linux
structures that describe timers also support a 1ns resolution.  I can
perfectly understand that deltas of 1ns make no sense, but given how
the Xen timer works those won't be a problem.  The interrupt will get
injected strictly after the hypercall to setup the timer, because by
the time Xen processes the delta it will most likely have already
expired.

Forcing every timer to setup a minimal delta of 1usec is pointless.
It either needs to be done in the generic code, or the interface to
register timers needs to be adjusted to allow for a minimum resolution
of 1usec.

Thanks, Roger.

