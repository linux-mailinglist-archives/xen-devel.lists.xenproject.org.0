Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650B72E8B6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548299.856178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q975z-0007Gw-0K; Tue, 13 Jun 2023 16:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548299.856178; Tue, 13 Jun 2023 16:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q975y-0007EM-Tc; Tue, 13 Jun 2023 16:42:14 +0000
Received: by outflank-mailman (input) for mailman id 548299;
 Tue, 13 Jun 2023 16:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBMi=CB=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q975x-0007ED-If
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:42:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee6c895-0a09-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 18:42:12 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f8d176396bso7008115e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 09:42:12 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc850000000b003f7ead9be7fsm14827273wml.38.2023.06.13.09.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 09:42:11 -0700 (PDT)
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
X-Inumbo-ID: 3ee6c895-0a09-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686674532; x=1689266532;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8jPHH0n3tW8eef21HgwqfbkWRC0F9sd3ik60Nshuf8A=;
        b=YsAeLg5EJ1kf1sSGNNK4nYk7LZhXEecvvdPgFdNWc9+M8/wXPQBk9QKpOdaHB1Mq7w
         n+qTgPApo5GVcbCSwFUiuJJg8IHZg7swYteBQUyaFOFCfJGFpGuIX8HeMkQE/mG+V7I1
         yL5WSRfpVJSktgexbNV4vTkpxN/7HbtngNRSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686674532; x=1689266532;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jPHH0n3tW8eef21HgwqfbkWRC0F9sd3ik60Nshuf8A=;
        b=VkyQy7GF3Vk5rzRJMz5Qgz+ORitZPT9C/JOa5uJIIRfe/09mlOYXqzl/sYceY6ZuCg
         ZsWntg98Y7DSPgHcrRi5eVn2cOB/EK7W4OMAx6642pbfu3T7yorlb47m08Oo42vFo6y6
         t9M2gSrCNeyAl19ff/rG7Iy3I75vTgjyKqBAcxcV+tVfuEJzvJLc9FYfedma+sH65r4a
         wzlWaJZNtKy7w/rWLNS4cMAW1kBMtG9GcH75JCgZhJyy43AqNIH2XdBi9ocaiZoBV5Cx
         k9stjulKi7TAE9x9M7CjpXBBB8XfFErM6yDWM9I0XfXuqMvEJG+mhZfsIJHCohyD2+L1
         1gJQ==
X-Gm-Message-State: AC+VfDxVQTGkA0xCMbWlt310hKQDHx10+rsiWDjCSnQPEaCCOmqZatWc
	sIxhS9PWmqe9NOf4wUE5dQCQFA==
X-Google-Smtp-Source: ACHHUZ7tmVv7C4yvedukhdzV049YQU2gaXmleMNrXQAs6UCWNal3yVRsdq2Izdfg+YVyoXRXmzhCVA==
X-Received: by 2002:a7b:cd9a:0:b0:3f8:cbd9:7724 with SMTP id y26-20020a7bcd9a000000b003f8cbd97724mr1488605wmj.16.1686674531767;
        Tue, 13 Jun 2023 09:42:11 -0700 (PDT)
Message-ID: <64889c63.7b0a0220.b6f4.adb8@mx.google.com>
X-Google-Original-Message-ID: <ZIicYBO0ARdgUx0t@EMEAENGAAD19049.>
Date: Tue, 13 Jun 2023 17:42:08 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] x86/microcode: Prevent attempting updates if
 DIS_MCU_LOAD is set
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-5-alejandro.vallejo@cloud.com>
 <26a77ade-7c77-0309-7a1d-e083621c9dcf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a77ade-7c77-0309-7a1d-e083621c9dcf@suse.com>

On Tue, Jun 13, 2023 at 08:57:06AM +0200, Jan Beulich wrote:
> On 05.06.2023 19:08, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -749,11 +749,12 @@ __initcall(microcode_init);
> >  /* Load a cached update to current cpu */
> >  int microcode_update_one(void)
> >  {
> > +    if ( ucode_ops.collect_cpu_info )
> > +        alternative_vcall(ucode_ops.collect_cpu_info);
> > +
> >      if ( !ucode_ops.apply_microcode )
> >          return -EOPNOTSUPP;
> >  
> > -    alternative_vcall(ucode_ops.collect_cpu_info);
> > -
> >      return microcode_update_cpu(NULL);
> >  }
> 
> This adjustment (and related logic below) doesn't really fit the purpose
> that the title states. I wonder if the two things wouldn't better be
> split.
Well, before this patch collect_cpu_info() and apply_microcode() were both
set or cleared together , whereas after this patch that's no longer the
case (hence the change). I can submit it standalone patch earlier in v3,
seeing as it does no harm. The commit message could also do with better
wording.

> 
> > @@ -849,12 +850,25 @@ static void __init early_read_cpuid_7d0(void)
> >              = cpuid_count_edx(7, 0);
> >  }
> >  
> > +static bool __init this_cpu_can_install_update(void)
> > +{
> > +    uint64_t mcu_ctrl;
> > +
> > +    if ( !cpu_has_mcu_ctrl )
> > +        return true;
> > +
> > +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> > +    return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
> > +}
> 
> As Andrew says, in principle AMD could have a means as well. Surely that
> would be a different one, so I wonder if this shouldn't be a new hook.
> 
> > @@ -871,6 +885,15 @@ int __init early_microcode_init(unsigned long *module_map,
> >           * present.
> >           */
> >          ucode_ops = intel_ucode_ops;
> > +
> > +        /*
> > +         * In the case where microcode updates are blocked by the
> > +         * DIS_MCU_LOAD bit we can still read the microcode version even if
> > +         * we can't change it.
> > +         */
> > +        if ( !this_cpu_can_install_update() )
> > +            ucode_ops = (struct microcode_ops){ .collect_cpu_info =
> > +                                    intel_ucode_ops.collect_cpu_info };
> 
> Similarly I'm not happy to see a direct reference to some vendor specific
> field. I think it wants to be the hook to return such an override struct.
> 
> Jan
I'm moving things around a little in v3. We'll have accessors for both AMD
and Intel that provide the right thing, encapsulating vendor-specifics
(including family checks) inside ${VENDOR}.c

Alejandro

