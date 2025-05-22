Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97252AC05A6
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993029.1376482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0KJ-0006rC-Vb; Thu, 22 May 2025 07:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993029.1376482; Thu, 22 May 2025 07:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0KJ-0006p4-Sq; Thu, 22 May 2025 07:26:51 +0000
Received: by outflank-mailman (input) for mailman id 993029;
 Thu, 22 May 2025 07:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI0KI-0006K9-TY
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:26:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f89349b-36de-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:26:49 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442ed8a275fso96053965e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:26:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f3dd94f1sm97278215e9.35.2025.05.22.00.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:26:47 -0700 (PDT)
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
X-Inumbo-ID: 1f89349b-36de-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747898808; x=1748503608; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4WU5xmLRElTwZZkWu2x+8D04HEL65/GvsCbnJyPA9I=;
        b=HPayl2J42+LHbM06QAb6zrxS6j53zA6vrUC90YYW9cx7mQgvZ7Bczm1LJ5oOGesChT
         pIq6zuFk2F1ELFeknlmou5H5PgOpdj5AcWW4jODObnNo+WgQ9rj63giXWOMHdPt2iZSi
         s+S7ghg9p7Lqy/Z27ucL6hd6py4CEXYlFV97s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898808; x=1748503608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4WU5xmLRElTwZZkWu2x+8D04HEL65/GvsCbnJyPA9I=;
        b=XuZw3qK9bOCMhZUrh1/sszk5SwHXPALXHz9xfudIyuj36Gsa4NXUosQNp6RZ1eRW/s
         xWW+TMgQAAj6okK57XClWLuFOzGcDE1f+T5rte329D7cTt1ZUchErOTJloXxZwqXGEbg
         Ij76jwN9EyTx7xhoyZtbP8eyoBLWLpbNngtwiPW6OMz1C9TSyKKI9HMOXxgLqlswFP9k
         TGYdglGpdQTCplCVMvW1tlhvsf2mI9EAvxL8Lg6yJpNjSQucfFBYQTzw1t5rnHNfGSgc
         ndrRLJ9XrR03bCmBLJG3hUQ8aojL81IyMIttpyAjD14XsX/7m4iK/uVPTXknhwhe/qzl
         C+8Q==
X-Gm-Message-State: AOJu0YxKMKyL23W1N+4QhnXHZtWgDbLkWK5qHrNvS9Eu+jeVp51zT5cM
	XVt4WGSWiCpwiAhKOLePKjbcWbEIxeJL6c2Wtdo5w9KGcjiOo1rzVjozG4GQflJMjdI=
X-Gm-Gg: ASbGnctbIUJDETaBZdLQFKYiD5nwMLYZVfdBdlNBXyz+Iaa7HW4/dWXS2rdhLx4lb/V
	iUFF1kX9/9Ty2BVzjJh/Kc3uv/MaSF1NByjikJQrLsD9dT29tJQd8JXM7mTBAszyXUdlq3L1zmq
	rIezxWSp1Ep5tPxYyKDjdZYQ5xKlgHjfaSHdFTlt0K114KfKQju16HEWJ/tHG8AuRTD1r3uwdDn
	Su9lMjObctdQDQIlUDRgkBhslKhQQXiOyh+Hzs0KCKX6BcHsj1dNhfEdOb6dBJeTipY9mB+w2ut
	Yqa8EXSgGxSNqMLRn/TPUCPaV5RnXQYIqeLhjKBpUP7EIQtD1hGIIOWuUGHmOoINjz7kKPimqou
	W7ATciSaeKL23ykgMcYk=
X-Google-Smtp-Source: AGHT+IE+xhB7g+vH7dOPfPzmy3WOLqk7UPUEQjk1D3k9DR/CoQD743PK+pOonchCJLMgrwj67zVCZA==
X-Received: by 2002:a05:600c:524c:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-442fd633ae6mr260882545e9.17.1747898808334;
        Thu, 22 May 2025 00:26:48 -0700 (PDT)
Date: Thu, 22 May 2025 09:26:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/boot: attempt to print trace and panic on AP
 bring up stall
Message-ID: <aC7Rt8tyoF09aYl3@macbook.local>
References: <20250521165504.89885-1-roger.pau@citrix.com>
 <20250521165504.89885-3-roger.pau@citrix.com>
 <b66645c8-0e3e-4414-acd3-a0acc6731a14@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b66645c8-0e3e-4414-acd3-a0acc6731a14@citrix.com>

On Wed, May 21, 2025 at 07:16:18PM +0100, Andrew Cooper wrote:
> On 21/05/2025 5:55 pm, Roger Pau Monne wrote:
> > With the current AP bring up code Xen can get stuck indefinitely if an AP
> 
> You want a comma between "code, Xen" to make the sentence easier to parse.
> 
> > freezes during boot after the 'callin' step.  Introduce a 10s timeout while
> > waiting for APs to finish startup.
> 
> 5s is the timeout used in other parts of AP bringup.  I'd suggest being
> consistent here.
> 
> 
> > On failure of an AP to complete startup send an NMI to trigger the printing
> 
> Again, a comma between "startup, send" would go a long way.
> 
> > of a stack backtrace on the stuck AP and panic on the BSP.
> >
> > The sending of the NMI re-uses the code already present in fatal_trap(), by
> > moving it to a separate function.
> 
> I'd be tempted to split the patch in two.
> 
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> 
> It may be worth nothing that this came from the ICX143 investigation,
> even if it wasn't relevant in the end?
> 
> > diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> > index 48ce996ba414..77dce3e3e22b 100644
> > --- a/xen/arch/x86/smpboot.c
> > +++ b/xen/arch/x86/smpboot.c
> > @@ -1388,10 +1389,17 @@ int __cpu_up(unsigned int cpu)
> >      time_latch_stamps();
> >  
> >      set_cpu_state(CPU_STATE_ONLINE);
> > +    start = NOW();
> >      while ( !cpu_online(cpu) )
> >      {
> >          cpu_relax();
> >          process_pending_softirqs();
> > +        if ( NOW() > start + SECONDS(10) )
> 
> (NOW() - start) > SECONDS(10)
> 
> It has one fewer boundary conditions, even if it is rather unlikely that
> start + 10s will overflow.
> 
> > diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> > index c94779b4ad4f..9b9e3726e2fb 100644
> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -734,6 +736,40 @@ static int cf_check nmi_show_execution_state(
> >      return 1;
> >  }
> >  
> > +void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
> > +{
> > +    unsigned int msecs, pending;
> > +
> > +    force_show_all = show_all;
> > +
> > +    watchdog_disable();
> > +    console_start_sync();
> > +
> > +    cpumask_copy(&show_state_mask, mask);
> > +    set_nmi_callback(nmi_show_execution_state);
> > +    /* Ensure new callback is set before sending out the NMI. */
> > +    smp_wmb();
> 
> I know this is only moving code, but this is wrong.  So is the smp_mb()
> in the x2apic drivers.
> 
> It would only be correct in principle for xAPIC (which is an MMIO
> store), except it's UC and is strongly ordered anyway.  Furthermore, the
> sequence point for the send_IPI_mask() prevents the compiler from
> reordering this unsafely.
> 
> The x2APIC drivers need LFENCE;MFENCE on Intel, and just MFENCE on AMD,
> and this (critically) is not smp_mb(), which is now just a locked operation.
> 
> I bet these aren't the only examples of incorrect barriers WRT IPIs.  I
> guess we should fix those separately.

Thanks, I will remove the smp_wmb() ahead of moving the code, but
other instances in the APIC drivers I will leave for a different
series, I don't want to delay the work here on those fixes.

Regards, Roger.

