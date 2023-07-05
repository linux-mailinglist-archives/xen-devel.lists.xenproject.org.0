Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC87484B4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 15:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559181.873928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2Jb-00082S-2t; Wed, 05 Jul 2023 13:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559181.873928; Wed, 05 Jul 2023 13:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2Ja-00080M-Vu; Wed, 05 Jul 2023 13:13:02 +0000
Received: by outflank-mailman (input) for mailman id 559181;
 Wed, 05 Jul 2023 13:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ax/R=CX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qH2Ja-00080G-AM
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 13:13:02 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa87936c-1b35-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 15:13:00 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99357737980so425395566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 06:13:00 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bu2-20020a170906a14200b009829dc0f2a0sm14489665ejb.111.2023.07.05.06.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 06:12:59 -0700 (PDT)
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
X-Inumbo-ID: aa87936c-1b35-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688562780; x=1691154780;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TY199SDQDe/xSpHLWKJswILQ0On+ma3T5edE7oPEr20=;
        b=GUhh5S2vZNItlczwPmcZzOWV1m+EQjGJmoqOGCe3d8Whm344G17eYnkbaU7oY4p5no
         lEPubtGaAyVckFRc2ciqE85rjUQflh8uHjXJEsAG+kttU2TB3U1h8fRM2kHLtxskqvGZ
         Sq0/lKjpy9A+02vn14CS/q3YGqMoJPjpRyYG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688562780; x=1691154780;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY199SDQDe/xSpHLWKJswILQ0On+ma3T5edE7oPEr20=;
        b=ZOQNmYfSF9RJsGPcpWJtKcp1yGb3M4fILmc2yLy71Mqis/Q9wNwh32LzrEJdZp2cvr
         auFDImGKZXfT0BuABpkVZHBTu0GP+hueJLUoWOdtNcjP5FTxRugSfu0WdnI75w2wapa7
         c2eQ2aEALKyBwfDj2LjJ/EIs2Ign1S8vEJlK0ZnYAXJQNVp5xljY3lMIyp5MVSKfVASG
         5t+B3akjKsG2gTQm/W3Y00VD4oDLK26MITK5tJby3MeksEFZLZBnJTRVhKoCS2JqOGGF
         ii7TBig81ND1kcP9rJrhgApMRhA84F1cQ0m7oZzdN0IBxFN4siy9qvbC0+7aezSQvmaQ
         76Eg==
X-Gm-Message-State: ABy/qLbg4WNno+0MqGNCwpnNNA7mVI9YDEug/JIJXq0H7RPOkJmcJdk5
	nWZZ2ncth7jXQsqh5r+l8iddDQ==
X-Google-Smtp-Source: APBJJlFzs5tkCN9yKqz4UrRDVhkU1qJ7han4QMFDjCZdPK3iSa+j19VZj4gW24/ADDI5i90aV+f+tg==
X-Received: by 2002:a17:906:5fd1:b0:975:942e:81e7 with SMTP id k17-20020a1709065fd100b00975942e81e7mr11808499ejv.37.1688562780063;
        Wed, 05 Jul 2023 06:13:00 -0700 (PDT)
Message-ID: <64a56c5b.170a0220.c33b5.793c@mx.google.com>
X-Google-Original-Message-ID: <ZKVsWhLTlxojSwaM@EMEAENGAAD19049.>
Date: Wed, 5 Jul 2023 14:12:58 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 3/4] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-4-alejandro.vallejo@cloud.com>
 <0dafce38-e572-3675-7f5f-a44a097abf09@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dafce38-e572-3675-7f5f-a44a097abf09@suse.com>

On Wed, Jul 05, 2023 at 12:43:27PM +0200, Jan Beulich wrote:
> On 29.06.2023 17:26, Alejandro Vallejo wrote:
> > @@ -324,9 +324,10 @@ void __init early_cpu_init(void)
> >  	case X86_VENDOR_SHANGHAI: this_cpu = &shanghai_cpu_dev; break;
> >  	case X86_VENDOR_HYGON:    this_cpu = &hygon_cpu_dev;    break;
> >  	default:
> > -		printk(XENLOG_ERR
> > -		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
> > -		       c->x86_vendor_id);
> > +		if (verbose)
> > +			printk(XENLOG_ERR
> > +			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
> > +			       c->x86_vendor_id);
> 
> Just as a remark:
> 
> 	if (!verbose)
> 		break;
> 
> would have been less of a delta and keeping all lines within the 80
> chars limit.
Very true, that looks nicer.

> > @@ -340,10 +341,11 @@ void __init early_cpu_init(void)
> >  	c->x86_capability[FEATURESET_1d] = edx;
> >  	c->x86_capability[FEATURESET_1c] = ecx;
> >  
> > -	printk(XENLOG_INFO
> > -	       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
> > -	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
> > -	       c->x86_model, c->x86_model, c->x86_mask, eax);
> > +	if (verbose)
> > +		printk(XENLOG_INFO
> > +		       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
> > +		       x86_cpuid_vendor_to_str(boot_cpu_data->x86_vendor), c->x86, c->x86,
> > +		       c->x86_model, c->x86_model, c->x86_mask, eax);
> 
> Since rearrangement to limit line length isn't really possible here,
> the last two lines need re-flowing to stay within limits.
I assumed they could could share the length of the printk string. I don't
mind either way.

> 
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -886,5 +886,11 @@ int __init early_microcode_init(unsigned long *module_map,
> >      if ( ucode_mod.mod_end || ucode_blob.size )
> >          rc = early_microcode_update_cpu();
> >  
> > +    /*
> > +     * MSR_ARCH_CAPS may have appeared after the microcode update. Reload
> > +     * boot_cpu_data if so because they are needed in tsx_init().
> > +     */
> > +    early_cpu_init(false);
> 
> I think the comment would better talk of ARCH_CAPS as an example of what
> may newly appear with a ucode update.
I just started writing a paragraph stating that it's unlikely anything else
will just appear, but thinking it through you're definitely right. A new
MSR_NEW_SPEC_MITIGATIONS might very well appear.

Something along this lines would be better?
```
          * Microcode updates may change CPUID or MSRs. We need to reload
          * the early subset boot_cpu_data before continuing. Notably tsx_init()
          * needs an up to date MSR_ARCH_CAPS.
```

> 
> With at least the middle item taken care of (which I'd be happy to
> do while committing)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
Thanks. I'm happy with all 3 changes being done on commit.

Alejandro

