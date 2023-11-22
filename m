Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D37F4E82
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638958.995974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5r9Z-0004I2-Lb; Wed, 22 Nov 2023 17:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638958.995974; Wed, 22 Nov 2023 17:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5r9Z-0004Fa-Io; Wed, 22 Nov 2023 17:36:45 +0000
Received: by outflank-mailman (input) for mailman id 638958;
 Wed, 22 Nov 2023 17:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1AL=HD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r5r9Y-0004FU-Ud
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:36:44 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b118a0-895d-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 18:36:43 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b344101f2so459885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:36:43 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fk4-20020a05600c0cc400b004068495910csm130148wmb.23.2023.11.22.09.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 09:36:42 -0800 (PST)
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
X-Inumbo-ID: b3b118a0-895d-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700674603; x=1701279403; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qdaaiWiaeEeZMUMcYPxtcc3iXmAuzpoGBdoaGAL9Y6Y=;
        b=lk+ARGzUljosHRSLQyx9A1JUmw4/1RLyK+xTerCHyQ1GuoxxDmAENpdyQwcpVDENc0
         q/PzW+ePCUS9tcK0r4d3NF7VB4gvrmA7ZF1U1uYa7O94kD8GAqrBVxu2Wlazguzk3Nlz
         tGYopevbY0a9KNHucVHQKEN9ZNsxy6Gqi/WL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700674603; x=1701279403;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdaaiWiaeEeZMUMcYPxtcc3iXmAuzpoGBdoaGAL9Y6Y=;
        b=peD9TdO88RHe01VFsyj2A7lVbs52qrAGJqmHAP6mQa2h/+90+2MDOsIGYxR00N6ngu
         /ZyiFwedspPtJYGVLBEiQ5u9oLT9ruysHUPcLEp14CTaIe10y+MC+NnfF//w/GB1oUeq
         gjyMTfZwWvLdjyg96D1LbosmaHvZKDytUJvnL7M7NMbl9b+/4Hx5qtIGDmd4U8l3UcF3
         KUPEQq95wLrZ+5gxuskV3UefzqdmNXBxM0WoX2vq5xAHKyxcKlk/kUcaN9zAdzFf3xYN
         9I1t3b1p/jS07+vDc+zZRE1YgxD3n40hskYvTRN9/QB7MIreXjQXFbKNX1B2z7qN4jZ8
         QmGw==
X-Gm-Message-State: AOJu0Yz4fzaf1BBHcb3QSE8CTk6dH5SiujzILHMM+xG1w+z2FXBswv2e
	hnzrsy6B7M4uQBDGurRpy1qoyZ633DnwezP6GUk=
X-Google-Smtp-Source: AGHT+IGx/rLKU1wJk4wNRfuLPdtPCTgHgCYzKKnuwORqkDqH6NsXMoUTuZrpim8VN83S1iIgbJFi3A==
X-Received: by 2002:a05:600c:45d2:b0:405:19dd:ad82 with SMTP id s18-20020a05600c45d200b0040519ddad82mr144244wmo.16.1700674602710;
        Wed, 22 Nov 2023 09:36:42 -0800 (PST)
Message-ID: <655e3c2a.050a0220.eedc6.0b67@mx.google.com>
X-Google-Original-Message-ID: <ZV48JyxD06zs9CfV@EMEAENGAAD19049.>
Date: Wed, 22 Nov 2023 17:36:39 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/x86: On x2APIC mode, derive LDR from APIC ID
References: <20231122160817.15266-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122160817.15266-1-alejandro.vallejo@cloud.com>

On Wed, Nov 22, 2023 at 04:08:17PM +0000, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
> 
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> x2APIC ID and internally derive LDR (or the other way around)
> 
> This patch fixes the implementation so we follow the rules in the x2APIC
> spec(s) and covers migrations from broken hypervisors, so LDRs are
> preserved even for hotppluggable CPUs and across APIC resets.
> 
> While touching that area, I removed the existing printk statement in
> vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
> mode and wouldn't affect the outcome) and put another printk as an else
> branch so we get warnings trying to load nonsensical LDR values we don't
> know about.
> 
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v3:
>   * Removed underscores from (x2)APIC_ID in commit message
>   * Added commit msg explaining the removal of the vlapic_load_fixup() printk
>   * Restored lowercase to hex "F"s
>   * Refactored a bit vlapic_load_fixup() so it has a trailing printk in
>     case of spotting a nonsensical LDR it doesn't understand.
>   * Moved field in domain.h with the other booleans
>   * Trimmed down field name in domain.h
>   * Trimmed down field comment in domain.h
> 
> If the field name in domain.h still seems too long I'm happy for it to be
> trimmed further down, but I do want to preserve the "_bug_" part of it.
I sent this one before Roger had a chance to reply to my reply on v2, which was...

> 
> OK, if you think mentioning `bug` is helpful, I think it would be best
> placed as a prefix: bug_x2apic_ldr_vcpu_id.  Having it in the middle
> of the field name makes it harder to spot.
> 
> Thanks, Roger.
... and I'm fine with that adjustment here.

Cheers,
Alejandro

