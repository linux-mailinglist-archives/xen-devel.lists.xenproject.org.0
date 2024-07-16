Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485949329EC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 17:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759671.1169356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjiY-00015r-Dh; Tue, 16 Jul 2024 15:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759671.1169356; Tue, 16 Jul 2024 15:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjiY-00013e-B0; Tue, 16 Jul 2024 15:03:50 +0000
Received: by outflank-mailman (input) for mailman id 759671;
 Tue, 16 Jul 2024 15:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KL91=OQ=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sTjiX-00013Y-5a
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 15:03:49 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a1ad0e1-4384-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 17:03:47 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so58039201fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 08:03:47 -0700 (PDT)
Received: from EMEAENGAAD91498. ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24a76f02sm5137075a12.2.2024.07.16.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 08:03:45 -0700 (PDT)
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
X-Inumbo-ID: 9a1ad0e1-4384-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721142227; x=1721747027; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jR0dvr9EgVpvCh6YoClqcaQMZNSQVE39cOhbob49r1M=;
        b=gSWrftpYnERQyzqS7XtiIGnVVjYWpADnR9vrtXgC3CfWL88hoF6+r4gf5oyxM+J3CG
         3NzlkOFtWV0WvzgbHNJywJ1E9oE41QpjrEGSXDnaBtdrOZlH85Pzscbre34AVh+uI3h6
         cfQ3sWsbbv8Sdfu1CA6y1fbbAXB8GS1bmdJGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142227; x=1721747027;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR0dvr9EgVpvCh6YoClqcaQMZNSQVE39cOhbob49r1M=;
        b=lgFvj6F8C/oc53fJgy2CvOOLfL2WOzoJvsmVNvXOb9rYVBgGWRMwy8CJXwfgkiX7J8
         TXhsTCEAHHUyFYUO4CjqrlgRqJKwNggc5SbKrYVgKUvcA92Rx+EDhSLQl3F4aJVIjsN7
         RGxyIW1U8igcbvK/Gay1og819FgGdfIoklk4E+KdZIy5i/pDS0FkGq9XwzhreYi87nTk
         jaiobMJ6c2YGtXWJNX+88IXmhgKup7PRv7GNvuytaQtvUuasrOUvjKYpzWwGlAKL7T5Q
         X0pv70nZHP+ekkk5mLG6y81RJHwdYzGDZgFAK13ETmVqNkFiUYQDn4TVULpv4bS+toGm
         zT2g==
X-Forwarded-Encrypted: i=1; AJvYcCVvpe83FA/oUdxzWdxgruLDr094TAUVb5DRrSnHwwVXglzNAeqJbHIbro8Lu9UFF/QQz8m2cvJVObR9Q1WqSd9EAlsgEwUBcYYcTLvefDw=
X-Gm-Message-State: AOJu0Yx+GAe3xxfb4JYI2YDJ0LnE4qOFA4BvhAKMLbcgegfh/+kqtrPK
	a3tw+esgqdLWB6nvog4cGaRuRkB8gm8j29ZFiGUl8hosEPU1Oa4sTvY48XZkbSc=
X-Google-Smtp-Source: AGHT+IGq7tjul9bo6FOiRy3nprA0idmRXI48aK4o5BUwp6/S5e4Boen6ai9JD9TfDoduvGortQH6/A==
X-Received: by 2002:a2e:9786:0:b0:2ee:4514:aa9a with SMTP id 38308e7fff4ca-2eef41e2a5fmr17684251fa.48.1721142226138;
        Tue, 16 Jul 2024 08:03:46 -0700 (PDT)
Message-ID: <66968bd1.050a0220.dfc8c.b00f@mx.google.com>
X-Google-Original-Message-ID: <20240716150316.oaqwgtkwksdx2gg3@EMEAENGAAD91498.>
Date: Tue, 16 Jul 2024 16:03:16 +0100
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
References: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com>
 <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>

On Tue, Jul 09, 2024 at 08:40:18AM +0200, Jan Beulich wrote:
> On 08.07.2024 17:42, Matthew Barnes wrote:
> > Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
> > startup.
> > 
> > There are efforts to support a maximum of 128 vCPUs, which would involve
> > bumping the OVMF constant from 64 to 128.
> > 
> > However, it would be more future-proof for OVMF to access the maximum
> > number of vCPUs for a domain and set itself up appropriately at
> > run-time.
> > 
> > For OVMF to access the maximum vCPU count, Xen will have to expose this
> > property via cpuid.
> 
> Why "have to"? The information is available from xenstore, isn't it?

I shall reword the commit message in patch v2 to avoid the wording "have
to".

> > This patch exposes the max_vcpus field via cpuid on the HVM hypervisor
> > leaf in edx.
> 
> If exposing via CPUID, why only for HVM?

Other related cpuid fields are also exposed in the HVM hypervisor leaf,
such as the vcpu id and the domain id.

Having said that, I wouldn't mind moving this field (or other fields, in
a separate patch) to a location meant for HVM *and* PV guests. Do you
have any suggestions?

> > --- a/xen/include/public/arch-x86/cpuid.h
> > +++ b/xen/include/public/arch-x86/cpuid.h
> > @@ -87,6 +87,7 @@
> >   * Sub-leaf 0: EAX: Features
> >   * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
> >   * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
> > + * Sub-leaf 0: EDX: max vcpus (iff EAX has XEN_HVM_CPUID_MAX_VCPUS_PRESENT flag)
> >   */
> 
> Unlike EBX and ECX, the proposed value for EDX cannot be zero. I'm therefore
> not entirely convinced that we need a qualifying flag. Things would be
> different if the field was "highest possible vCPU ID", which certainly would
> be the better approach if the field wasn't occupying the entire register.
> Even with it being 32 bits, I'd still suggest switching its meaning this way.

I shall tweak the value from "maximum vcpu count" to "maximum vcpu ID"
in patch v2.

Matt

