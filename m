Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4BAB8399
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985160.1371098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVYY-0000iv-NR; Thu, 15 May 2025 10:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985160.1371098; Thu, 15 May 2025 10:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVYY-0000hh-Je; Thu, 15 May 2025 10:11:14 +0000
Received: by outflank-mailman (input) for mailman id 985160;
 Thu, 15 May 2025 10:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFVYX-0000ha-L3
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:11:13 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed136b25-3174-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 12:11:11 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so1537096a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:11:11 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad22ba47376sm967964766b.53.2025.05.15.03.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:11:10 -0700 (PDT)
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
X-Inumbo-ID: ed136b25-3174-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747303871; x=1747908671; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cCZUFsZ4M11UEvy/3qp0CrrveNe+eVtvPPVzg5V55JA=;
        b=Ubl6fPYLmGoGk+MvLddmhS/56ivG/0+ByhuEJ6aQT02AeaLq2fikHKaQNMERPlapLN
         0gCKP5zBJ7JS9joqPi3d0Hv+4iNYwJ7moGfi77WcuwQxRc7z2oV2FFz5IFQcRXLlupUC
         BfRU1Q00/Uigq8OWzkMKVIX08p4RWsA8d13hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747303871; x=1747908671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCZUFsZ4M11UEvy/3qp0CrrveNe+eVtvPPVzg5V55JA=;
        b=vK22rxlUNlOSXy3ewODM01cQVH8ZOtqwSd458FA8zdygq3HRMtttTbNNyyXucS6XbQ
         slXqUwiYVuJ7iFgfo1EQ4rA/f3yDieOHTdMb//rX4R4d2r8wArwYh/6FYm5GBJLVknZ0
         jdLiHJXmr0iH+UpZWjxEvr48wRP8sSkDvBRwSYlE2FFNmM4ceoBkCoVNm2G9X/JXAmjl
         RhWilUktwO0VbisKPho9OJYFik/4TfxSaxK2g8vhhyjVaDxGCWAsT5wegDMfe8OfMxaq
         JwCMvife0eO7xn+WUK1yoJyZ8JX2PK5+Mq+46MFCJLvCjtpbRs2R+eNdpkN8wmsmgOP4
         PMgA==
X-Forwarded-Encrypted: i=1; AJvYcCU4P7fKaEj+/qI0uF+tu1AJSuGBIRPZU2Px6crEuEROlOpRnnL4Z/hYkWu2Gx123CG2lUEP8fMQOi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfiJNuOKeLpBC4HulaENiDUX07UZqEh1xaWyjgrnQ0Q756xbY9
	t4Oa9aEYxPaGaq9oL660OKCKxp0zlY/JBBiOapNzKtYOgZUyyLVReMAPjq1LyOo=
X-Gm-Gg: ASbGncvwlX4Gj5AEUoKJtjY0/AtKYv4XYhN7oU9DLqSE+yoTz5mxPD1CWgVkPrkBthi
	azgGIeZa/WjUdQUUeojXF41VME0pL1qLcoF5t38aEGlK8rxV3O1SUNjraLkDFAOkJBCSDiXg79K
	1NGTPOBMVCXvR8UnDRj+An8MXukTOgykCSCsZYnAyE9API7CpNujMG/S4nuPnXzxMAWRl00Mpvh
	XE4jkYEFLMA7IeRn13+U1JZ7DPJshQQha/WTHZCPbwm8CGiM57uwYwFJXTRToqVYAb67KqOmImT
	CfDPGuiURKwGvXDTdJmXCDcA3MzxYX5XOA1MgksNTnHfxKy0EYoBu9f0
X-Google-Smtp-Source: AGHT+IH21ruOMB6qTLHzUfW6AvN6IB2MjY53frGKBi97aUqDPGO0ghy/AsqK4j3PyhDlcYpCeu6rTQ==
X-Received: by 2002:a17:907:3947:b0:ac7:e5c4:1187 with SMTP id a640c23a62f3a-ad4f70f6179mr524336766b.11.1747303870683;
        Thu, 15 May 2025 03:11:10 -0700 (PDT)
Date: Thu, 15 May 2025 12:11:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
Message-ID: <aCW9vfNEsDFLbE-y@macbook.lan>
References: <20250515084123.43289-1-roger.pau@citrix.com>
 <8b0fa959-6d00-4bfb-bef0-b3d1ae7ce7e0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b0fa959-6d00-4bfb-bef0-b3d1ae7ce7e0@suse.com>

On Thu, May 15, 2025 at 11:24:59AM +0200, Jan Beulich wrote:
> On 15.05.2025 10:41, Roger Pau Monne wrote:
> > For once the message printed when a BAR overlaps with a non-hole regions is
> > not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
> > is quite likely overlapping with a reserved region in the memory map, and
> > already mapped as by default all reserved regions are identity mapped in
> > the p2m.  Fix the message so it just warns about the overlap, without
> > mentioning that the BAR won't be mapped, as this has caused confusion in
> > the past.
> > 
> > Secondly, when an overlap is detected the BAR 'enabled' field is not set,
> > hence other vPCI code that depends on it like vPCI MSI-X handling won't
> > function properly, as it sees the BAR as disabled, even when memory
> > decoding is enabled for the device and the BAR is likely mapped in the
> > p2m.  Change the handling of BARs that overlap non-hole regions to instead
> > remove any overlapped regions from the rangeset, so the resulting ranges to
> > map just contain the hole regions.  This requires introducing a new
> > pci_sanitize_bar_memory() that's implemented per-arch and sanitizes the
> > address range to add to the p2m.
> > 
> > For x86 pci_sanitize_bar_memory() removes any regions present in the host
> > memory map, for ARM this is currently left as a dummy handler to not change
> > existing behavior.
> > 
> > Ultimately the above changes should fix the vPCI MSI-X handlers not working
> > correctly when the BAR that contains the MSI-X table overlaps with a
> > non-hole region, as then the 'enabled' BAR bit won't be set and the MSI-X
> > traps won't handle accesses as expected.
> 
> While all of this reads plausible, I may need to look at this again later,
> to hopefully grok the connections and implications.

Thanks, it's indeed not trivial to follow.  I've attempted to write
this as best as I could.

I think the fix is far easier to understand than the description of
the issue and the connection with vPCI MSI-X handling.

> > --- a/xen/arch/x86/include/asm/pci.h
> > +++ b/xen/arch/x86/include/asm/pci.h
> > @@ -2,6 +2,7 @@
> >  #define __X86_PCI_H__
> >  
> >  #include <xen/mm.h>
> > +#include <xen/rangeset.h>
> 
> Please don't, ...
> 
> > @@ -57,14 +58,7 @@ static always_inline bool is_pci_passthrough_enabled(void)
> >  
> >  void arch_pci_init_pdev(struct pci_dev *pdev);
> >  
> > -static inline bool pci_check_bar(const struct pci_dev *pdev,
> > -                                 mfn_t start, mfn_t end)
> > -{
> > -    /*
> > -     * Check if BAR is not overlapping with any memory region defined
> > -     * in the memory map.
> > -     */
> > -    return is_memory_hole(start, end);
> > -}
> > +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
> > +int pci_sanitize_bar_memory(struct rangeset *r);
> 
> ... all you need is a struct forward decl here.

Hm, but any user that makes use of pci_sanitize_bar_memory() will need
to include rangeset.h anyway, hence it seemed better to just include
the header rather that pollute the current one by adding forward
declarations.

> 
> > --- a/xen/arch/x86/pci.c
> > +++ b/xen/arch/x86/pci.c
> > @@ -98,3 +98,53 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
> >  
> >      return rc;
> >  }
> > +
> > +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> > +{
> > +    /*
> > +     * Check if BAR is not overlapping with any memory region defined
> > +     * in the memory map.
> > +     */
> > +    if ( !is_memory_hole(start, end) )
> > +        gdprintk(XENLOG_WARNING,
> > +                 "%pp: BAR at [%"PRI_mfn", %"PRI_mfn"] not in memory map hole\n",
> > +                 &pdev->sbdf, mfn_x(start), mfn_x(end));
> > +
> > +    /*
> > +     * Unconditionally return true, pci_sanitize_bar_memory() will remove any
> > +     * non-hole regions.
> > +     */
> > +    return true;
> > +}
> > +
> > +/* Remove overlaps with any ranges defined in the host memory map. */
> > +int pci_sanitize_bar_memory(struct rangeset *r)
> > +{
> > +    unsigned int i;
> > +
> > +    for ( i = 0; i < e820.nr_map; i++ )
> > +    {
> > +        const struct e820entry *entry = &e820.map[i];
> > +        int rc;
> > +
> > +        if ( !entry->size )
> > +            continue;
> > +
> > +        rc = rangeset_remove_range(r, PFN_DOWN(entry->addr),
> > +                                   PFN_UP(entry->addr + entry->size - 1));
> > +        if ( rc )
> > +            return rc;
> 
> Perhaps better continue the loop in a best effort manner, only accumulating
> the error to then ...
> 
> > +    }
> > +
> > +    return 0;
> > +}
> 
> ... return here?

I think for the usage here, any error should be fatal, and should
result in the contents of the rangeset not being mapped.  Failure to
remove sensitive ranges from the rangeset cannot be worked around IMO,
hence accumulating errors doesn't seem helpful.

Thanks, Roger.

