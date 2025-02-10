Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F1A2E9D7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884650.1294396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRIq-0004By-FQ; Mon, 10 Feb 2025 10:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884650.1294396; Mon, 10 Feb 2025 10:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRIq-00049L-Bk; Mon, 10 Feb 2025 10:46:12 +0000
Received: by outflank-mailman (input) for mailman id 884650;
 Mon, 10 Feb 2025 10:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uJm=VB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thRIo-000484-Of
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:46:10 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bb127d6-e79c-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:46:08 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21f7f03d856so23044135ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:46:08 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ad54cabd45bsm2221708a12.21.2025.02.10.02.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 02:46:06 -0800 (PST)
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
X-Inumbo-ID: 3bb127d6-e79c-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739184367; x=1739789167; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFRjliNxUM/57ATnvoOWJ/pL0ySc+bL8PKv+TYaLwxw=;
        b=ZFs1XCbphYJ5cH7LryTHEY6OE2SbIYAiaqIvtiQzpFgNr9E8say1arRGtexBVtWd7w
         S5x8nldIXPbb0guuthXipcICF9Lye/lUsGFMjgiXoNEETreMwBsBGjD2gXcbvBTCIweI
         ck59ePk1WEnJIKNjpqF8p6N7W9gb/oikmrA/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184367; x=1739789167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFRjliNxUM/57ATnvoOWJ/pL0ySc+bL8PKv+TYaLwxw=;
        b=AxikVeieD4tygpIdrtYm7DObOhy9D13VrDm7rWfKknrk6RN2T8lOgV7OzCLj4obFXh
         QmTiX/9uKv92AFnOm/qicNi0WHEfhAAZ44bLG+PRAdOVfYjO9ARsINpLdA0qkzbbMmZ7
         0tU1Q5x3P+Wqv9DOjhGB6mXfpByF4AaiK6cUwD5F9F9O5xYsCgMrX5lbkzRwAbWclSBH
         9eomcZGpWu9ozERNJhWm35fzj/BAJLX+WHKTC2cZvcq1wVjboT6FEq0/lhXlVNiDI3U9
         6P7bf4zeLSR0p5eGgrisE4ljyUVoIdphuaeDLj/3QgH1Kpfm9tc7VXWU4J64APY7w2fB
         7sWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKttljw27vUm0RUo9sASJKDhUgh062QhrJyxMcs1ugqfQmpPAmFhEyy9vm64VG4OAO61Ni9oxysdM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ4rZoqkGPGOmfrHm/xaOn+IBlXbHMHuaTNQzwKogv/a/2cTru
	q7bjfF/Ns5JPriFEXOvTece9NLOOqVIFO2kDFKxUT/namhHm9q4Atq+3OMuIPUG1IqqAHZ+zylV
	6
X-Gm-Gg: ASbGncsvHJHpVFbeQHJBj6D7a+kUHIHGkMsBc1OosS1BSV+jbF/sXE+5SN2C8kGu5i6
	yosdDYzc7amVjydrBpotOaQY/WVquZWX0+7EIGL8/28VBrVF5JonuqJNW/lmbBsqYzMEQp0qfjj
	dS8szoBUR66nmKM625wJULryQDALcExUNSEA0oYZTSuWMbHgUIu/bAy4FbhYaazuqirI9yHdzwE
	j93c4KapwyJIZOnOkQ9GY0eHGK3TYuYTvIkQzZ3obU+2T0wffDjIWtu0cAg1j5EFUHu7aXcFauV
	Iwy1X0ECkzX1EtCrzOQb
X-Google-Smtp-Source: AGHT+IEjfx800iKGgYoQXb54Sd9iBshX7uAH0B7c1plenqoGW02rsm+4kKu5OXPtxB93Wd4nfvjSUw==
X-Received: by 2002:a05:6a21:329c:b0:1eb:34a6:593e with SMTP id adf61e73a8af0-1ee03a21c14mr23586447637.1.1739184366842;
        Mon, 10 Feb 2025 02:46:06 -0800 (PST)
Date: Mon, 10 Feb 2025 11:46:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/5] x86/shutdown: offline APs with interrupts
 disabled on all CPUs
Message-ID: <Z6nY6WqTstPpEKa9@macbook.local>
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-2-roger.pau@citrix.com>
 <2fa4f84e-3773-4bab-9be1-ef068a1cce36@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fa4f84e-3773-4bab-9be1-ef068a1cce36@suse.com>

On Mon, Feb 10, 2025 at 11:20:20AM +0100, Jan Beulich wrote:
> On 06.02.2025 16:06, Roger Pau Monne wrote:
> > The current shutdown logic in smp_send_stop() will disable the APs while
> > having interrupts enabled on the BSP or possibly other APs. On AMD systems
> > this can lead to local APIC errors:
> > 
> > APIC error on CPU0: 00(08), Receive accept error
> > 
> > Such error message can be printed in a loop, thus blocking the system from
> > rebooting.  I assume this loop is created by the error being triggered by
> > the console interrupt, which is further stirred by the ESR handler
> > printing to the console.
> > 
> > Intel SDM states:
> > 
> > "Receive Accept Error.
> > 
> > Set when the local APIC detects that the message it received was not
> > accepted by any APIC on the APIC bus, including itself. Used only on P6
> > family and Pentium processors."
> > 
> > So the error shouldn't trigger on any Intel CPU supported by Xen.
> > 
> > However AMD doesn't make such claims, and indeed the error is broadcasted
> > to all local APICs when an interrupt targets a CPU that's already offline.
> > 
> > To prevent the error from stalling the shutdown process perform the
> > disabling of APs and the BSP local APIC with interrupts disabled on all
> > CPUs in the system, so that by the time interrupts are unmasked on the BSP
> > the local APIC is already disabled.  This can still lead to a spurious:
> > 
> > APIC error on CPU0: 00(00)
> > 
> > As a result of an LVT Error getting injected while interrupts are masked on
> > the CPU, and the vector only handled after the local APIC is already
> > disabled.
> 
> Isn't this bogus, too? As in: Error interrupt without any ESR bits set? Since
> I can already see our QA folks report this as another issue, can we perhaps
> somehow amend the log message in that case, indicating we think it's bogus?

Note that the disable_local_APIC() call in __stop_this_cpu() does also
call clear_local_APIC(), which will attempt to clear ESR also.

Further patches in the series prevent the error from triggering in the
first place, since an attempt is made to disable or mask all possible
external interrupt sources Xen knows about before doing AP shutdown.

> 
> > Note the NMI crash path doesn't have such issue, because disabling of APs
> > and the caller local APIC is already done in the same contiguous region
> > with interrupts disabled.  There's a possible window on the NMI crash path
> > (nmi_shootdown_cpus()) where some APs might be disabled (and thus
> > interrupts targeting them raising "Receive accept error") before others APs
> > have interrupts disabled.  However the shutdown NMI will be handled,
> > regardless of whether the AP is processing a local APIC error, and hence
> > such interrupts will not cause the shutdown process to get stuck.
> > 
> > Remove the call to fixup_irqs() in smp_send_stop(), as it doesn't achieve
> > the intended goal of moving all interrupts to the BSP anyway, because when
> > called the APs are still set as online in cpu_online_map.
> 
> This is a little too little for my taste: The fact the APs are still online
> was, after all, intended to be covered by passing cpumask_of(cpu).
> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I suppose there simply is no "good" commit to blame here with a Fixes: tag.

Wondered the same, but I couldn't find any suitable commit.  It's been
like this forever as far as I can tell.  It's possible my previous
fixes for fixup_irqs() made this worse, but I don't think it was
correct to begin with.

> 
> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -345,6 +345,11 @@ void __stop_this_cpu(void)
> >  
> >  static void cf_check stop_this_cpu(void *dummy)
> >  {
> > +    const bool *stop_aps = dummy;
> > +
> > +    while ( !*stop_aps )
> > +        cpu_relax();
> > +
> >      __stop_this_cpu();
> >      for ( ; ; )
> >          halt();
> > @@ -357,16 +362,25 @@ static void cf_check stop_this_cpu(void *dummy)
> >  void smp_send_stop(void)
> >  {
> >      unsigned int cpu = smp_processor_id();
> > +    bool stop_aps = false;
> > +
> > +    /*
> > +     * Perform AP offlining and disabling of interrupt controllers with all
> > +     * CPUs on the system having interrupts disabled to prevent interrupt
> > +     * delivery errors.  On AMD systems "Receive accept error" will be
> > +     * broadcasted to local APICs if interrupts target CPUs that are offline.
> > +     */
> > +    if ( num_online_cpus() > 1 )
> > +        smp_call_function(stop_this_cpu, &stop_aps, 0);
> > +
> > +    local_irq_disable();
> 
> With the extensive comment I think this is going to be okay. Just one grammar
> thing (and I'm curious myself), mainly to Andrew as a native speaker (or any
> other native speakers who read this): While I can find the form you use even
> in things calling themselves dictionaries, I've still been under the impression
> that it is "be broadcast". (If so, also somewhere in the description then.)

I don't have a strong opinion.  I also looked it up and seemed to be
correct, but might not be fine to use in this context.

Thanks, Roger.

