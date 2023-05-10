Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB36FDBF5
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 12:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532747.829042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwhQz-0002jK-6w; Wed, 10 May 2023 10:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532747.829042; Wed, 10 May 2023 10:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwhQz-0002h1-3q; Wed, 10 May 2023 10:52:37 +0000
Received: by outflank-mailman (input) for mailman id 532747;
 Wed, 10 May 2023 10:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NoG=A7=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwhQy-0002gv-1J
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 10:52:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3c74206-ef20-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 12:52:32 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3075e802738so6270424f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 03:52:32 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d400a000000b00307a3045d65sm4992933wrp.46.2023.05.10.03.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 03:52:30 -0700 (PDT)
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
X-Inumbo-ID: c3c74206-ef20-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683715952; x=1686307952;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zadnsZQHrMaPOWZK8QAnphZZY6spWdciijMZY/kvrM4=;
        b=S4lU1Nm/B+HbdBieOau78/vGwgwOpWqnztCu2JcV/ASS7eZqMKQ+gNARBO3iPf8aV3
         jtriUzfxa1ihGObdNpwA9L0kasI/LC/XBpfUfg6reqODJl6qun0ZDBNzTJmFBL4UOEoC
         ++doNEb/dVU1pyPhVwh+VIgmNtMkLfSf2mg98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683715952; x=1686307952;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zadnsZQHrMaPOWZK8QAnphZZY6spWdciijMZY/kvrM4=;
        b=LQbdB7gc/j0XwOZV24uEWyY5UQu9X3W08HSAeqIEYwGWnclgrCkVFmXKDkYppltk2y
         DIfx9+amfc+lBFuSVTlOMLB2sV5XeDOxYBbzu3EVQffqPd9leDMuv3J4kO1gXup20O3R
         FoQtRV7CLWrt4AQuZaPnf1FBa7CKvd+FTtZrJ3/dK4sW3C3wuLqiZy051ovHSW4ziMeR
         1zt6axGxV5EnJLbZqTo2AXB3UyRJWYd2dwXdNBHKT7PnhCeahyaxWNisQC4Jk88/ogej
         9h8J8hBt4/r5IEal73ydRrHQMn/4s/rsqGGvixVHSeOggsvR78ESLuf0waZiOkb4Z4ag
         gOgw==
X-Gm-Message-State: AC+VfDyTF7dKgmdB06Fy6KhMC/ZcpTj7+bDS/0AozEoAnoIdvCa4tTc4
	3OWKgH+ckx6rueFJrPQk1pm/sQ==
X-Google-Smtp-Source: ACHHUZ4oEbOUWLj76uGMdHyvet9QNIJ8iRyXoJHmtZx9dmiG9ireCoJAIjpSW9YGdV99RNz/Ovro0g==
X-Received: by 2002:a5d:4dc1:0:b0:307:97d9:d9a with SMTP id f1-20020a5d4dc1000000b0030797d90d9amr6689481wru.13.1683715951733;
        Wed, 10 May 2023 03:52:31 -0700 (PDT)
Message-ID: <645b776e.5d0a0220.3ff50.bf0e@mx.google.com>
X-Google-Original-Message-ID: <ZFt3bI2Nl8CgLsuU@EMEAENGAAD19049.>
Date: Wed, 10 May 2023 11:52:28 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
 <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
 <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
 <7d41940f-e671-954c-1afc-510e4fa674fa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d41940f-e671-954c-1afc-510e4fa674fa@suse.com>

On Wed, May 10, 2023 at 10:15:31AM +0200, Jan Beulich wrote:
> On 09.05.2023 12:05, Andrew Cooper wrote:
> > On 08/05/2023 2:18 pm, Jan Beulich wrote:
> >> On 05.05.2023 19:57, Alejandro Vallejo wrote:
> >>> This is in order to aid guests of AMD hardware that we have exposed
> >>> CPUID faulting to. If they try to modify the Intel MSR that enables
> >>> the feature, trigger levelling so AMD's version of it (CpuidUserDis)
> >>> is used instead.
> >>>
> >>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>> ---
> >>>  xen/arch/x86/msr.c | 9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >> Don't you also need to update cpu-policy.c:calculate_host_policy()
> >> for the guest to actually know it can use the functionality? Which
> >> in turn would appear to require some form of adjustment to
> >> lib/x86/policy.c:x86_cpu_policies_are_compatible().
> > 
> > I asked Alejandro to do it like this.
> > 
> > Advertising this to guests requires plumbing another MSR into the
> > infrastructure which isn't quite set up properly let, and is in flux
> > from my work.
> 
> Maybe there was some misunderstanding here, as I realize only now. I
> wasn't asking to expose the AMD feature, but instead I was after
> 
>     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
>     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
>     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
> 
> wanting to be extended by "|| boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)".
> That, afaict, has no connection to plumbing yet another MSR.
> 
> Jan

Let me backtrack a little. There's 2 different (but related) matters under
discussion:

 1. Trapping PV guest attempts to run the cpuid instruction
 2. Providing a virtualized CPUID faulting interface so a guest kernel
    can intercept the CPUID instructions of code running under it.

This series was meant to provide fix (1) on AMD hardware. I did go a bit
beyond in v1, trying to provide support for a unified faulting mechanism
on AMD, but providing a virtualized CPUID faulting interface needs to be
done a bit more carefully than that. Doing it partially now just adds tech
debt to be paid when CpuidUserDis is exposed to the domains.

Changing the policy to expose the Intel interface when AMD is the backend
falls on (2), which is probably better off done separately in a unified way.

v2 removes the changes to x86/msr.c so only (1) is addressed.

Does this make sense?

Alejandro

