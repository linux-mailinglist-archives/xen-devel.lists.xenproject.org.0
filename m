Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A01A983FB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964192.1355054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VjU-0007pK-3C; Wed, 23 Apr 2025 08:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964192.1355054; Wed, 23 Apr 2025 08:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VjT-0007n6-Ut; Wed, 23 Apr 2025 08:45:27 +0000
Received: by outflank-mailman (input) for mailman id 964192;
 Wed, 23 Apr 2025 08:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7VjS-0007kk-Lz
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:45:26 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d032fb9-201f-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 10:45:25 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso4430845f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:45:25 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa4a4b9csm17626150f8f.84.2025.04.23.01.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 01:45:24 -0700 (PDT)
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
X-Inumbo-ID: 4d032fb9-201f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745397925; x=1746002725; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kym774bl+kjd6z/+jrcXV+eFZM2aLIxckmPgZL+MVy0=;
        b=QP+8peF9dG6VdObkxjuZr3xNwYsArbYqeGW4WcpovBtSnvJ8+DNel89ObWDAGAABUs
         lJ0O2sF4n+a5NPwy/wNFx5F4fukTd7QgKWKnpMuauuj/6eiPPCZM68EG/XviVbimR65Y
         KcNWOj8WKCHJDQm1LQNreGqy0GW03EoZOWpNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397925; x=1746002725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kym774bl+kjd6z/+jrcXV+eFZM2aLIxckmPgZL+MVy0=;
        b=e3Swx9kmvZ2ZGbENIASVykLymj4vz8MtbTNCo0pZnxa3gEj77zYiNSzFsn+Ogx0W+Q
         e46CEBIzDKUmIyLywolvWQG1BmrXhplwAIf7jcLuevSiyUmKvpAX/zBzvl0Wp8vYEvTp
         0Bl28KnizX/9aUZuKtlcW6ELd60e0fCOU0NJE2PnplAmLhk8LopI0rmf4eQjv0Z1+A3y
         jtNm67jc36L0v6ImdqJBbRn5kd+sCbZGJ2R3lF+xsj5jZqghGeacQ/hJOrtmPXyxw+k5
         DAaY7zKIyUBIDgLxJwuHg6NXBeND76d4ZGbRWji74mBETkiF/i42sVD3eNN3X7L8w4wG
         aheQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4NSI4GDj2WEFGQmFtub6SboFIKmCtttjFSflorVzzReCdNWuNPcFeEogHXul0TuwNyvJxjHEue8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziLTf0AVD8YcnWEodFsDQjPqB7mwWKwTL6cl9C9Qa0tDyHILbH
	A2Ug7jOD8YpRwXeJI7DoBva+Nrn0s/ZkSlGHRsVnAQGeklmhudfadpm2HQz95Hw=
X-Gm-Gg: ASbGncs3FR7Pj3HaxMW0oPriimNOOXshSlwKZLHHccm2ppBgLaLj3Sex6ymZaptUhTS
	kmWs+KuIzdI4HipFPkZHBBe0+2BQDm6ZJ8eVy8uWshmuKZbmyGmM16sPMz4rh8i9c60mIeNOQ1d
	yKer2zaRTS4ls96wSBd3Mw9lHmtLo9D5jlrRr8mG3XGwxVm6bDrxnAghSa7AcDP2AsIzl0X/iXn
	Skukai3uY++pb/SFm9l6+7Us+JWFzJ6FLd4HdgKq0F7VwqpvZ5eNAB0c84R4D+kA9hQ2EaiVwuo
	n1sZbc1hZfzafYjA8lxu8s83fyvY5QPuJB6MhHdgSD3/F2GL0kDDj6mz
X-Google-Smtp-Source: AGHT+IHo1T3YnzaEeJzEQGS7bkmjkPmElidtxxi6HaGApq1pAc7uZX5a9rCosC2/qJH7ST96lrz+zA==
X-Received: by 2002:a05:6000:184c:b0:39c:e0e:b27a with SMTP id ffacd0b85a97d-39efba47e42mr17267721f8f.23.1745397925150;
        Wed, 23 Apr 2025 01:45:25 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:45:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
Message-ID: <aAioMDTUgjn3MJS2@macbook.lan>
References: <20250417161913.14661-1-roger.pau@citrix.com>
 <463cd02d-febc-4878-90b5-9272f91b9033@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <463cd02d-febc-4878-90b5-9272f91b9033@suse.com>

On Tue, Apr 22, 2025 at 10:26:37AM +0200, Jan Beulich wrote:
> On 17.04.2025 18:19, Roger Pau Monne wrote:
> > @@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
> >      }
> >  }
> >  
> > +/*
> > + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
> > + * processor to wait in a sleep state until a store to the armed address range
> > + * occurs. Due to this erratum, stores to the armed address range may not
> > + * trigger MWAIT to resume execution.
> > + *
> > + * ICX143: Under complex microarchitectural conditions, a monitor that is armed
> > + * with the MWAIT instruction may not be triggered, leading to a processor
> > + * hang.
> > + *
> > + * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
> 
> I didn't manage to spot all three spec updates; none of these have a ucode fix,
> hence permitting the workaround to be avoided?
> 
> Since CPX is 3rd Gen Xeon Scalable just like ICX is, I'm surprised that one's
> unaffected. The most recent spec update there is a year old than ICX'es, so
> may simply be too old to include the erratum?
> 
> Sunny Cove is used by further Icelake models - they're known to be unaffected?

FWIW, client IceLake also seems to be unaffected, so I don't really
know.  So far I've only found this issue in the ICX spec update.  The
fix for Linux limits this further to model 106 only.

> > + * Force the sending of an IPI in those cases.
> > + */
> > +static void probe_mwait_errata(void)
> > +{
> > +    static const struct x86_cpu_id models[] = {
> > +        /* Apollo Lake */
> > +        INTEL_FAM6_MODEL(0x5C),
> > +        /* Ice Lake */
> > +        INTEL_FAM6_MODEL(0x6A),
> > +        INTEL_FAM6_MODEL(0x6C),
> > +        /* Lunar Lake */
> > +        INTEL_FAM6_MODEL(0xBD),
> 
> Use identifiers from intel-family.h here?

Sure.

> > +        { }
> > +    };
> > +#undef INTEL_FAM6_MODEL
> > +
> > +    if ( boot_cpu_has(X86_FEATURE_MONITOR) && !force_mwait_ipi_wakeup &&
> > +         x86_match_cpu(models) )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Forcing IPI MWAIT wakeup due to CPU erratum\n");
> > +        force_mwait_ipi_wakeup = true;
> > +    }
> > +}
> 
> Do we really need to cater for asymmetric systems? IOW can't we do this once
> on the BSP? Otherwise - why the use of boot_cpu_has() here? Oh, wait ...
> 
> > @@ -406,6 +443,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
> >  		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
> >  
> >  	probe_c3_errata(c);
> > +	if (c == &boot_cpu_data)
> > +		probe_mwait_errata();
> >  }
> 
> ..., you do this for the BSP only. Then why's the function not __init and
> the global variable not __ro_after_init (and models[] __initconst)?
> 
> (Later) Except that this path is also taken for S3 resume, from
> recheck_cpu_features(). This shouldn't alter the variable value anymore,
> though. A disagreement ought to result in recheck_cpu_features() to
> report failure. (Imo perhaps better to avoid the call above during resume.)

I did consider to limit the call based on system_state, wasn't sure
whether that would be more churn than help.

LNL030 has a reference to: "It may be possible for the BIOS to contain
a workaround for this erratum." so wasn't fully sure we wouldn't need
to check for this in all cores if there's some firmware fix for it
that Xen could identify.

Thanks, Roger.

