Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F578C0C7F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 10:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719124.1121720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4z3X-0002Di-6C; Thu, 09 May 2024 08:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719124.1121720; Thu, 09 May 2024 08:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4z3X-0002BB-2L; Thu, 09 May 2024 08:23:11 +0000
Received: by outflank-mailman (input) for mailman id 719124;
 Thu, 09 May 2024 08:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Rdn=MM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4z3V-0002B5-F5
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 08:23:09 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cebbd77-0ddd-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 10:23:07 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34da04e44a2so397075f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 01:23:07 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacff4sm1037126f8f.79.2024.05.09.01.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 01:23:06 -0700 (PDT)
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
X-Inumbo-ID: 5cebbd77-0ddd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715242986; x=1715847786; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rp9uqeEeeTpVuGLE1TK2mKhExUqdNcRzK4GLCWB/SbA=;
        b=d1MRtwtzKcDjdcC5FGUX1FUdgCyGkD2HI3eBnlsws2ZAHyz5kyCwS65ZcSE+SSGlr6
         K/Ygs0DB6YehC3Qz5r7OnxZ8Gxv/F9neLO2QLp5IJ6syriGZWJ7u3EcxBX4eYhEZabAT
         L6GH25lFdidMICsVVsjfKN3ndGeKvXiMHHj2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715242986; x=1715847786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rp9uqeEeeTpVuGLE1TK2mKhExUqdNcRzK4GLCWB/SbA=;
        b=J9jlCw41QAJCZkNSdlTyxA1UgdXcp64s9Ay/6CdVRV30v5wOb1clCfWudeYfJxg/C5
         dmPCra9Ho/F+zYeaTcII3EJC0tZoImF/0WF87GOGNMEi3RlCIuxOt7Xtw7eZbqI4lH7o
         urG8QZGJOsiNbLL/SWYNJ7EBRTiONtY6hvAf7TutWcuzXoMa8dSb3195wfWffNlXZP18
         W/CcFGAyuiLB1cfDDdO1Q+kHLGrmowHcsZjG0TfciQN1swxbWZq7AiSUlg3ZAvLE7nSr
         DsHjwwRXH+c1fnF5CT61QoSH++/nPW+M3/dbOPcv+XnoSdkmct2seSFYoTvWRMlsimgw
         uMbg==
X-Gm-Message-State: AOJu0YwYg/oCbvu4WAryUgSZoxfhrJqlQh0UsQh0R7zzcBHgi9i0VeV/
	6v8UNi0J23C0PhDkRXZBjPMVOLGHBQBaXZ15hqGd5LZK+hEJ6IQo/OMJv55VoK4=
X-Google-Smtp-Source: AGHT+IHy4GzO3XZd4HD9UcdrSM0dak1uGWem4KVfsBnprBVTeTpNjY5oiBcLtmKhLn5kTTgKev+C2w==
X-Received: by 2002:adf:e68e:0:b0:34d:95e2:c5cb with SMTP id ffacd0b85a97d-34fca14b375mr3287726f8f.3.1715242986453;
        Thu, 09 May 2024 01:23:06 -0700 (PDT)
Date: Thu, 9 May 2024 10:23:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Subject: Re: [PATCH for-4.19 v2 2/3] xen/x86: enable altp2m at create domain
 domctl
Message-ID: <ZjyH6f-diiqLO-0D@macbook>
References: <20240508112323.38946-1-roger.pau@citrix.com>
 <20240508112323.38946-3-roger.pau@citrix.com>
 <d43a704a-fd2a-4778-9250-a69b483016b4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d43a704a-fd2a-4778-9250-a69b483016b4@citrix.com>

On Wed, May 08, 2024 at 08:38:07PM +0100, Andrew Cooper wrote:
> On 08/05/2024 12:23 pm, Roger Pau Monne wrote:
> > Enabling it using an HVM param is fragile, and complicates the logic when
> > deciding whether options that interact with altp2m can also be enabled.
> >
> > Leave the HVM param value for consumption by the guest, but prevent it from
> > being set.  Enabling is now done using the misc_flags field in
> > xen_arch_domainconfig.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - New in this version.
> 
> Ha.  So this is actually work that Petr has been wanting to do.
> 
> Petr has a series hoping to make it into 4.19 (x86: Make MAX_ALTP2M
> configurable), which just missed out on this side of things.
> 
> altp2m is not architecture specific at all, and there's even support for
> ARM out on the mailing list.  Therefore, the altp2m mode wants to be
> common, just like the new MAX_ALTP2M setting already is.

Initially I had it as a set of XEN_DOMCTL_CDF_* flags, but it wasn't
clear to me whether the modes could be shared between arches.

> Both fields can reasonably share uint32_t, but could you work with Petr
> to make both halfs of this land cleanly.

I'm happy for Petr to pick this patch as part of the series if he
feels like.

I assume the plan would be to add an XEN_DOMCTL_CDF_altp2m flag, and
then a new field to signal the mode.

> 
> As to the HVMPARAM, I'd really quite like to delete it.  It was always a
> bodge, and there's a full set of HVMOP_altp2m_* for a guest to use.

I've assumed we must keep HVM_PARAM_ALTP2M for backwards
compatibility.

> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 20e83cf38bbd..dff790060605 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -708,13 +711,33 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >          }
> >      }
> >  
> > -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> > +    if ( config->arch.misc_flags & ~XEN_X86_MISC_FLAGS_ALL )
> >      {
> >          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
> >                  config->arch.misc_flags);
> >          return -EINVAL;
> >      }
> >  
> > +    if ( altp2m && (altp2m & (altp2m - 1)) )
> > +    {
> > +        dprintk(XENLOG_INFO, "Multiple altp2m options selected in flags: %#x\n",
> > +                config->flags);
> > +        return -EINVAL;
> 
> I think this would be clearer to follow by having a 2 bit field called
> altp2m_mode and check for <= 2.

Don't we need 3 bits, for mixed, external and limited modes?

We could do with 2 bits if we signal altp2m enabled in a different
field, and then introduce a field to just contain the mode.

FWIW, the check should be `if ( altp2m & (altp2m - 1) )`.  I had
updated this, but seems like I missed to re-generate the patches.

> > +    }
> > +
> > +    if ( altp2m && nested_virt )
> > +    {
> > +        dprintk(XENLOG_INFO,
> > +                "Nested virt and altp2m are mutually incompatible\n");
> 
> There's nothing inherently incompatible.  I think it's more that noone
> had any interest in trying to make it work in combination with nested p2ms.
> 
> I'd phrase it as "not supported", rather than incompatible.

"Nested virt and altp2m are not supported together\n"

> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( altp2m && !hap )
> > +    {
> > +        dprintk(XENLOG_INFO, "altp2m requires HAP\n");
> > +        return -EINVAL;
> > +    }
> 
> altp2m ought to work fine with shadow.  It's only if you want VMFUNC/#VE
> acceleration that you depend on EPT.
> 
> Again, I'd phrase this as "not supported".

"altp2m is only supported with HAP\n"

To avoid the double negation of "not supported without HAP" wording.

Thanks, Roger.

