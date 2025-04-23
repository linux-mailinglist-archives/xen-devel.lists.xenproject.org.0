Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED1A98C6C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 16:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964770.1355477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7amF-0005sh-AJ; Wed, 23 Apr 2025 14:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964770.1355477; Wed, 23 Apr 2025 14:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7amF-0005r8-7P; Wed, 23 Apr 2025 14:08:39 +0000
Received: by outflank-mailman (input) for mailman id 964770;
 Wed, 23 Apr 2025 14:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7amE-0005r2-94
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:08:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72a315ed-204c-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 16:08:36 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so802505266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 07:08:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6ec0beb8sm795815566b.2.2025.04.23.07.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 07:08:35 -0700 (PDT)
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
X-Inumbo-ID: 72a315ed-204c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745417316; x=1746022116; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6K5IMW0MKKhVyBsgSa9lk21LMhsy+Swk4sZRjS84kk=;
        b=XzL1hhVnU2JEjNJw39ipVDfGwcpPi1Shxz8l99PcpCyjRqkgYRecOCuhfXPWTWtPRD
         Zvxm2umX7RMXNH7UbWIlmw8TqJuI/bkfnEzBVeBz2sTKeCjJpvqpqyrr84KjOOYnw9DL
         86rrY24gAO8xJvbocbnsiX0H1tGe23oFcuUq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417316; x=1746022116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6K5IMW0MKKhVyBsgSa9lk21LMhsy+Swk4sZRjS84kk=;
        b=lgxXRBkVoWBkKRPbbt9AcaSx4ezI9n7QFn0yDZWWh4bbC+XOpuJxhZ7DAOT9plsZHL
         z+xNcntknGyjAZWL3A5PkaRG6APrmV/v45cNgnldcESoUnL4G0VwCUmaJw0g6qJjR5Pw
         KPc4Nvjta/yNSAr/46enqfjslpTIKWnTXU2iy5rvnJIhJyV6dZ81fdWOKfIzh7MSwmJW
         qN+5yadhg4GNqYqPn96ZmqwbNJwbpXxQ35VH/pzG2SS5k6Jg/21PATb2+gdoQgceUL5n
         6D+EEm7v1ZMs7iZp+GNO+z1O3FtSvUB4Rt6DaAe9dClQhz+9/e6AxbcVlY6efbiyW8L5
         QjXw==
X-Gm-Message-State: AOJu0YyoIlJKTYFXhJ1bRGQQ+FGLxu5MxiixuzUzYKURwagzcqfMEVzI
	sAwxTLB83pgf4t2uDX+LmF/sJijdHGY4OA+qHmG7pPxG4WO1JW7W1aWr1BYaqOk=
X-Gm-Gg: ASbGncvv53Jf+AFMLZkrQY/GgG2sO8leB+LQCQC0gdt3sH32Vm3eL9rFA3qW49f7OrF
	X+JG6vAYeyKpVuDpZwEXC5h2gwDSmwq5UzwRu3/bjZ2EcRMbmjgPI5GTf9HJUJZP904ug574iTX
	0fIkjw1heT9f0rWC5pERDMrc3k+jjjmUktYYlwiIu2Nuv6ooCoVxDXxHUvsDX6pAKdCsrA6ICBD
	BoX/MKSkcyAQxJEbx6WIz+Fx3K/lLc4Gy+yxvDFQQT9SpkzaLynYJGQAHOcaCLwBO1zoZZBjgi3
	YbBJElTHkaXvkqn0Pt2+hx0ScGmlafdU1sFUO2o+9BgZtw==
X-Google-Smtp-Source: AGHT+IFZRt5M3BcSggui6hncvOs/ecca+cR+driqo/jKafVF2Jl4ZbsgJgPf9PC+51cVJVHgkZ9GTw==
X-Received: by 2002:a17:906:d153:b0:acd:89ba:8069 with SMTP id a640c23a62f3a-acd89baac19mr576573566b.7.1745417315560;
        Wed, 23 Apr 2025 07:08:35 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:08:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86/intel: workaround several MONITOR/MWAIT errata
Message-ID: <aAj0Yqc0FtlTlVCF@macbook.lan>
References: <20250423113215.80755-1-roger.pau@citrix.com>
 <cd7c88b4-848b-4051-bbd6-8a8b78416ebd@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd7c88b4-848b-4051-bbd6-8a8b78416ebd@citrix.com>

On Wed, Apr 23, 2025 at 02:13:01PM +0100, Andrew Cooper wrote:
> On 23/04/2025 12:32 pm, Roger Pau Monne wrote:
> > There are several errata on Intel regarding the usage of the MONITOR/MWAIT
> > instructions, all having in common that stores to the monitored region
> > might not wake up the CPU.
> >
> > Fix them by forcing the sending of an IPI for the affected models.
> >
> > The Ice Lake issue has been reproduced internally on XenServer hardware,
> > and the fix does seem to prevent it.  The symptom was APs getting stuck in
> > the idle loop immediately after bring up, which in turn prevented the BSP
> > from making progress.  This would happen before the watchdog was
> > initialized, and hence the whole system would get stuck.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Apollo and Lunar Lake fixes have not been tested, due to lack of hardware.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> > index 420198406def..1dbf15b01ed7 100644
> > --- a/xen/arch/x86/acpi/cpu_idle.c
> > +++ b/xen/arch/x86/acpi/cpu_idle.c
> > @@ -441,8 +441,14 @@ void cpuidle_wakeup_mwait(cpumask_t *mask)
> >      cpumask_andnot(mask, mask, &target);
> >  }
> >  
> > +/* Force sending of a wakeup IPI regardless of mwait usage. */
> > +bool __ro_after_init force_mwait_ipi_wakeup;
> > +
> >  bool arch_skip_send_event_check(unsigned int cpu)
> >  {
> > +    if ( force_mwait_ipi_wakeup )
> > +        return false;
> > +
> 
> I don't especially like this.  The callers are a loop over all CPUs, and
> this can't be inlined/simplified automatically.

Hm, I can look into this later, I can make maybe turn
arch_skip_send_event_check into an inline.  Let me get this
committed first.

Thanks, Roger.

