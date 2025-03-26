Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A0A71493
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927518.1330248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNqY-00044n-DM; Wed, 26 Mar 2025 10:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927518.1330248; Wed, 26 Mar 2025 10:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNqY-00042Q-AU; Wed, 26 Mar 2025 10:18:54 +0000
Received: by outflank-mailman (input) for mailman id 927518;
 Wed, 26 Mar 2025 10:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mf06=WN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txNqW-00042K-T7
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:18:52 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65876b1-0a2b-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 11:18:51 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22403cbb47fso130744655ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:18:51 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22780f3966esm106377465ad.13.2025.03.26.03.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 03:18:49 -0700 (PDT)
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
X-Inumbo-ID: b65876b1-0a2b-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742984330; x=1743589130; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Db10ZU16XpLJFmNhtVonPGqlBLb3EZGYInBr3P0oVkQ=;
        b=FmXZQc0zwtdOz2mCAP3xeM+lqyihQpJdEq6u5MkJpVAbY1P7Y4Ha6bcORUC+nCS9CE
         0rrCm/5pKuDsUN+zdBuMwDZEFYN55tLjbD8GQ/SxRJfd1YQKbH+Md6AMaNy5pJBWHBTV
         A5HaptW4pNamPLO4U8Gmi5WxPIIOYocqfy7/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742984330; x=1743589130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Db10ZU16XpLJFmNhtVonPGqlBLb3EZGYInBr3P0oVkQ=;
        b=UIc4H7o1xIsMfP49R6Hrkcs9y6zZkd06M7XHPLeK/LWILkaGufvZHh426DFXSQFQOA
         doTMzibLLcCmW63K25CyiynMOJR8lu9Sd7z2u/Pvi5kX9oKwF2SVRfVRalmHNCmc7b2z
         HwUwpJxsFMvnO2a7HzUqoju/ksIrztX/yVqC7ejRSRFK8bD+zhMu7RPnHXkKNcne6ysL
         eIRN3qshFKYS2vI24YO9htmcUQdbLGBarve2Z1kOpw8rXbbE2K8ugzmtYMqJcafJWpEO
         T6hO6rFfriTGt+7Pngyf/WynuxgmuncM0BlbCRdw6VrPuBrBmQmWVrRdbOueHICX0cre
         800Q==
X-Gm-Message-State: AOJu0YxOxQ+4CCu8DBFZD4ahJ9QuRzF0eoID640vxG31nWJSWk7Oqw5N
	jQTQq4/t0h9xz7UtJuSD11YApY7IW7CYsMw2cDM64lre4aqm02WUcqnxOQg9iME=
X-Gm-Gg: ASbGncvkg2B35tuE9zZdhYWmPwg98h8ltAH14LpHSpikvugBNHclA15NGNjjKsDKvbz
	8nXVfyqTn1mU08NZBjWUgGuJRi05yX02MichqgJgaiHG8aKSaQxzFTHZR/DYFIWAYozcskbjW2s
	ePaoRSSL96/40INbMIyha9z2yn3UYX5qmGTzkIObr+M9z3nkNqz9OCJGjNihmcerwWNW6EFw+27
	4quLJUS0JxWN8DnNx7ZjxidgNMKKsSs+qVHynRXz4TculCMsx7ML9axnTMahFsldowqr0e4yX2+
	LzxsTNs5z2JFM1hSE8PvlnHtBgHXaqMCSsPIR64k86w31SsaHw==
X-Google-Smtp-Source: AGHT+IHf0vUmRm/KTp+g9tg2N8FmUeOWyQJto2vPEs4MTPoZ8vaiyNP2BVhhXuWNOQXQZmRavEZOOg==
X-Received: by 2002:a17:903:46c5:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22780e122dcmr296161435ad.42.1742984329879;
        Wed, 26 Mar 2025 03:18:49 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:18:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PVH: expose OEMx ACPI tables to Dom0
Message-ID: <Z-PUhO3C1qp3L8-l@macbook.local>
References: <c9365d42-c15d-4d93-acd8-106ca46cb7f3@suse.com>
 <Z-PHJk8GT-y1NnHl@macbook.local>
 <59685c88-44c6-43fe-9f6e-1121d51fd76f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59685c88-44c6-43fe-9f6e-1121d51fd76f@suse.com>

On Wed, Mar 26, 2025 at 10:45:18AM +0100, Jan Beulich wrote:
> On 26.03.2025 10:21, Roger Pau Monné wrote:
> > On Wed, Mar 26, 2025 at 09:45:09AM +0100, Jan Beulich wrote:
> >> What they contain we don't know, but we can't sensibly hide them. On my
> >> Skylake system OEM1 (with a description of "INTEL  CPU EIST") is what
> >> contains all the _PCT, _PPC, and _PSS methods, i.e. about everything
> >> needed for cpufreq. (_PSD interestingly are in an SSDT there.)
> >>
> >> Further OEM2 there has a description of "INTEL  CPU  HWP", while OEM4
> >> has "INTEL  CPU  CST". Pretty clearly all three need exposing for
> >> cpufreq and cpuidle to work.
> >>
> >> Fixes: 8b1a5268daf0 ("pvh/dom0: whitelist PVH Dom0 ACPI tables")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> Sadly the commit above says nothing at all about the criteria used by
> >> which tables would want to be whitelisted.
> > 
> > I think at that point it was mostly an allow list that enabled me to
> > boot PVH on the systems I was testing.  I don't think it was intended
> > to be complete, but rather something that we would expand as needed.
> > There where many and bigger missing pieces of PVH dom0 when that was
> > committed.
> 
> To be frank, with that it was premature to declare PVH Dom0 fully supported.
> This aspect also isn't mentioned in the caveats in SUPPORT.md.

It's supported with caveats, so I wouldn't call it fully supported.
See for example the recent addition of the pf-fixup option.

Note the wording in SUPPORT.md:

"PVH dom0 hasn't received the same test coverage as PV dom0, so it can exhibit
unexpected behavior or issues on some hardware.

At least the following features are missing on a PVH dom0:"

I think it's quite clear from the usage of "at least" that the list of
caveats might not be complete.  The missing ACPI tables would just be
one extra caveat, which sadly we didn't list.

> >> Further tables on said system
> >> which weren't blacklisted prior to that commit, yet which also aren't
> >> whitelisted are DBGP, DBG2, FIDT, LPIT, MIGT, MSCT, NITR, PCCT, RASF,
> >> SVOS, UEFI, WDDT, and WSMT. Even without diving into the details of any
> >> of them it seems pretty clear to me that at least some would want
> >> whitelisting, too.
> > 
> > I cannot find any reference about: FIDT, MIGT, NITR, SVOS and WDDT in
> > the ACPI spec.
> 
> WDDT - Watchdog Descriptor Table (Table 5.6 in spec version 6.5)
> 
> > The MSCT I think we don't want to expose, as it's related to topology
> > data.
> > 
> > Regarding RASF I would be slightly worried about the patrol scrub
> > feature.  The memory map exposed to dom0 will be different from the
> > native one, and there's also the interposed p2m.
> 
> Thing is - either kind of Dom0 needs to have a sufficient level of insight
> into the host memory map to support memory-related RAS features. Which may
> mean that RASF may only be exposed if the Dom0 kernel declares itself as
> aware of the need to consider data there to refer to a separate address
> space.

Yes, but then, how is a PVH dom0 going to be aware of such addresses?
Given the automatic translation of gfn -> mfn that's completely hidden
from dom0.

I'm not saying it can't be done, but I think RASF shouldn't be exposed
to a PVH dom0 until we understand how such feature is supposed to work
with the interposed p2m and the fabricated memory map available to a
PVH dom0.  Note a PVH dom0 can still get the host memory map from the
XENMEM_machine_memory_map hypercall.

> >> --- a/xen/arch/x86/hvm/dom0_build.c
> >> +++ b/xen/arch/x86/hvm/dom0_build.c
> >> @@ -1010,12 +1010,20 @@ static bool __init pvh_acpi_table_allowe
> >>              return true;
> >>          else
> >>          {
> >> +    skip:
> >>              printk("Skipping table %.4s in non-ACPI non-reserved region\n",
> >>                     sig);
> >>              return false;
> >>          }
> >>      }
> >>  
> >> +    if ( !strncmp(sig, "OEM", 3) )
> >> +    {
> >> +        if ( acpi_memory_banned(address, size) )
> >> +            goto skip;
> >> +        return true;
> >> +    }
> > 
> > I may have put this ahead of the loop, so that the goto label doesn't
> > go backwards (which always feels weird to me).
> 
> It felt odd to me to put it first; I'm almost always hesitant to add stuff
> to the front of something that's already there, due to the possible
> implication of "what I add is more important than what was there before".
> 
> As to label vs goto placement: It's the other way around for me. C wants
> everything else declared before use. Hence I prefer to have labels appear
> before their use. I'm actually puzzled by Misra not sharing that view,
> and instead having Rule 15.2 (which we haven't adopted yet afaics) to
> demand the opposite (and assuming Rule 15.1 is being violated in the
> first place).

Oh, I see.  No strong opinion really.

> >> +
> > 
> > I wonder if additionally we should print tables filtered to dom0 here:
> > 
> > if ( opt_dom0_verbose )
> >     printk("Hidden ACPI Table %.4s\n", sig);
> > 
> > So that it's more obvious which tables are not exposed.
> 
> I, too, thought about that, but assumed it may not have been done before
> for a reason. Plus it would want to be a separate change anyway, imo.

Indeed, it should be a separate change, sorry if my comment made it
look I would rather merge with the current commit.

Thanks, Roger.

