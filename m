Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9074290A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556896.869754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtA7-0005Vk-KZ; Thu, 29 Jun 2023 15:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556896.869754; Thu, 29 Jun 2023 15:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtA7-0005T1-HI; Thu, 29 Jun 2023 15:02:23 +0000
Received: by outflank-mailman (input) for mailman id 556896;
 Thu, 29 Jun 2023 15:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtA5-0005St-PC
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:02:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f257070f-168d-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:02:20 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so1212051e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:02:20 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bm24-20020a0564020b1800b0051d9bf340cdsm3900291edb.43.2023.06.29.08.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 08:02:19 -0700 (PDT)
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
X-Inumbo-ID: f257070f-168d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688050940; x=1690642940;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XT2n8d/HgibZyJ2yJYHctqlTiyYQx04wrKeh5Qlv9lk=;
        b=BhV5c7KRV0ocB7XUalDgyRBxfrQR9J6BcySobKAf6A36eSWlmspSjrV7G69OwV11YO
         ki234zMLUyZgsXwMXvwtqm4FXO35gCMx3YadWuJs6GpqAfiDaycU99E+WqKAHT/zvFu8
         cnZxYIW4bLZpGAsI3e22Xbew6iK5bofCDFZoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688050940; x=1690642940;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2n8d/HgibZyJ2yJYHctqlTiyYQx04wrKeh5Qlv9lk=;
        b=TQSt/derlZhQVTaQ9eS+xI59Q6ShIVfgZfcKXdbw560aag5iRhVQRAmCprfM7buzqz
         1ERKz2dtmnf+10kkAG0qVRXv9jFODXpJ2q+tO+Avoqga/rlf2b963Hd9lexicJmsmbdE
         6m1ifuF3pSpTCNH9R9NRzRolg1anasRLoPnmGSU9eslcq5Ndn+fuIZWh4LV3OPrroCJF
         /nMk7LdfZJkfLMF0rth0xahVzD1pPUjyWeq0YkWbNYVu8tZFqs6HedO5+vISfTuCUA88
         oTlrF56OY5E6X3ievuk3ZdQwA438HVWUIZwPMXRlMsjlKXIR2XozMxJ4x9bggGPWw70U
         rDVQ==
X-Gm-Message-State: ABy/qLZEe0qwrM/JrN99GDDh8yDa0is5TR02GhdCQjS2Q6H8wznhlRX7
	H53V3RlD3AS/JN0bszeQT48tbFpLd4mWIhcqxME=
X-Google-Smtp-Source: APBJJlEP4AkaNV88Ua4n4jaL4Uf4OKddugdy7n8dNEYFSSkD1yU7cc39x/UAT1Fn1Rc+wgpsnh0CUQ==
X-Received: by 2002:a05:6512:447:b0:4fb:94fd:645f with SMTP id y7-20020a056512044700b004fb94fd645fmr138502lfk.68.1688050940197;
        Thu, 29 Jun 2023 08:02:20 -0700 (PDT)
Message-ID: <649d9cfb.050a0220.f3327.779b@mx.google.com>
X-Google-Original-Message-ID: <ZJ2c+yJ9TQlMa+D8@EMEAENGAAD19049.>
Date: Thu, 29 Jun 2023 16:02:19 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 3/4] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
 <20230622174219.8871-4-alejandro.vallejo@cloud.com>
 <da108604-6468-757b-5fd2-d477cb388e5d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da108604-6468-757b-5fd2-d477cb388e5d@suse.com>

On Fri, Jun 23, 2023 at 09:33:56AM +0200, Jan Beulich wrote:
> On 22.06.2023 19:42, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -885,5 +885,18 @@ int __init early_microcode_init(unsigned long *module_map,
> >      if ( ucode_mod.mod_end || ucode_blob.size )
> >          rc = early_microcode_update_cpu();
> >  
> > +    /*
> > +     * MSR_ARCH_CAPS may have appeared after the microcode update.
> > +     * Reload relevant fields in boot_cpu_data if so because they are
> > +     * needed in tsx_init().
> > +     */
> > +    if ( boot_cpu_data.cpuid_level >= 7 )
> > +        boot_cpu_data.x86_capability[FEATURESET_7d0]
> > +            = cpuid_count_edx(7, 0);
> > +    if ( cpu_has_arch_caps )
> > +        rdmsr(MSR_ARCH_CAPABILITIES,
> > +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
> > +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
> > +
> >      return rc;
> >  }
> 
> Did you consider simply calling early_cpu_init() a 2nd time, and then
> perhaps from setup.c and only if ucode load didn't report an error?
> There's a printk() in there which will want avoiding on the 2nd pass,
> but otherwise this would look more future-proof to me.
> 
> Jan
I had, but avoiding the internal printk() was annoying. I've simply created
a boolean "verbosity" flag on the new version for early_cpu_init() and
called it at the end of early_microcode_init().

Alejandro

