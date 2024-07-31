Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33290943003
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768687.1179585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9Kc-0002Ym-9G; Wed, 31 Jul 2024 13:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768687.1179585; Wed, 31 Jul 2024 13:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9Kc-0002Vs-6V; Wed, 31 Jul 2024 13:25:30 +0000
Received: by outflank-mailman (input) for mailman id 768687;
 Wed, 31 Jul 2024 13:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ9Ka-0002Vm-1q
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:25:28 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 590444a0-4f40-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:25:26 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6b7a8cada97so29268586d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 06:25:26 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fac3b21sm74088186d6.114.2024.07.31.06.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 06:25:25 -0700 (PDT)
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
X-Inumbo-ID: 590444a0-4f40-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722432325; x=1723037125; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=70XqCmaInfFNNxORb/iEciO5LxyKeRJ1WuhMAdYK01o=;
        b=OrOl7sHGzKWl/QpoyWX2Vr/vNHwdicJPKNh0xSKkrVypdlEV9zwSL3vh4g52kXk1pp
         kD7OhkNrWERP78bNU07+lS7XNA04Ka99sAixPx3V7vGlyY2B0F1CK6JhsgnhrGH8O9aC
         mUf8Hco4LwCVyWD7b41aS0iZJbulBV/GlHN9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432325; x=1723037125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70XqCmaInfFNNxORb/iEciO5LxyKeRJ1WuhMAdYK01o=;
        b=rp4E2A/ARkpvPiGdwtfQVtdktBSL5xMubmWp6E4aUoFKXEZQmmdPj9Q3H591h4YXwT
         OHxeSwjzabkRWpJEiaPSFfap73H3wbx5OgyKnrGR8Bc0HQzmBCBw6RCU/GDBudCjFFJt
         4mqmgM1v3OjOThIw3RbACVEpV0hA6A6skfh10LulXHPoYTMpVXlHlVP4XL0SeVkpT139
         dhxA5/lw07gJKbJmzzwEtg/myPxy5hPqthKEpxoEHbOb02vaUnkgxNY77SpKW7PCiGsw
         5iN9RoWQi/S/PF5efS8bn9TrVaKPenoqO2cyYUrHOIfPu1pho2SaYqU0EaZ53pcCFTai
         DXZg==
X-Forwarded-Encrypted: i=1; AJvYcCVKdK+Me9jU1z4b3nxZ+KvLS2xYKv0RrRk1L5i6JVXIWJ8s1eTIR47WUBGBBHGWmeHXBRNMpaecMI2R9N+Hruv/WSmMiOp4WcgtCRFkduQ=
X-Gm-Message-State: AOJu0YzXjnrrvzxvaGloQGBLqNvhWnmgZQYIySSAZipMVpOHhGCnI7hq
	4C2N33QsYkHVl87uFaT2XR4p13UNXpX1oJQCU/1vR01NYUWZrHce8qzHe1yI4xo=
X-Google-Smtp-Source: AGHT+IG2sbLvB9CEyBcRBHfGghLRDEQVt0pSDjBmM/AOANswuzzg/ulNdaWB+aFIG4BK7h4l6KvO+A==
X-Received: by 2002:ad4:5ca9:0:b0:6b5:4125:415d with SMTP id 6a1803df08f44-6bb55a17157mr176782736d6.13.1722432325453;
        Wed, 31 Jul 2024 06:25:25 -0700 (PDT)
Date: Wed, 31 Jul 2024 15:25:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <Zqo7Q-leDNCXs4Fr@macbook>
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-3-roger.pau@citrix.com>
 <3918b171-b908-4962-8fdf-5236056902f8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3918b171-b908-4962-8fdf-5236056902f8@suse.com>

On Wed, Jul 31, 2024 at 08:44:46AM +0200, Jan Beulich wrote:
> On 30.07.2024 17:28, Roger Pau Monne wrote:
> > The PVH dom0 builder doesn't switch page tables and has no need to run with
> > SMAP disabled.
> > 
> > Use stac() and clac(), as that's safe to use even if events would hit in the
> > middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
> > not safe, so the stac() call is done strictly after elf_load_binary() because
> > that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.
> 
> And that was the main concern causing the CR4.SMAP override to be used instead,
> iirc. While I'm sure you've properly audited all code paths, how can we be sure
> there's not going to be another stac() or clac() added somewhere? Or setting of
> EFLAGS as a whole, clearing EFLAGS.AC without that being explicit? I think we'd
> be better off sticking to the fiddling with CR4.

On approach I didn't test would be to add ASSERTs in stac/clac
functions to ensure that the state is as intended.  IOW: for stac we
would assert that the AC flag is not set, while for clac we would do
the opposite and assert that it's set before clearing it.

That should detect nesting.

> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Considering the bug Andrew pointed out on the code you remove from setup.c,
> don't we want a Fixes: tag as well?

No, I think the current code is correct, it was my change that was
incorrect.

> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -830,6 +830,15 @@ int __init dom0_construct_pv(struct domain *d,
> >          printk("Failed to load the kernel binary\n");
> >          goto out;
> >      }
> > +
> > +    /*
> > +     * Disable SMAP to allow user-accesses when running on dom0 page-tables.
> > +     * Note this must be done after elf_load_binary(), as such helper uses
> > +     * raw_{copy_to,clear}_guest() helpers which internally call stac()/clac()
> > +     * and those calls would otherwise nest with the ones here.
> 
> Just in case you and Andrew would outvote me on which approach to take:
> I'm okay with "helpers" here, but the earlier "such helper" reads a little
> odd to me. Imo using "that" or "it" instead would be better. Not the least
> because personally a function like elf_load_binary() goes beyond what I'd
> call a mere "helper" (in that case dom0_construct_pv() toos could be deemed
> a helper, etc).

Hm, yes, would be better to reword that.

Thanks, Roger.

