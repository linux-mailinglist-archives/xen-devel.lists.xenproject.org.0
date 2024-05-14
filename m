Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17E8C5839
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721614.1125185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tNt-0002wS-Jc; Tue, 14 May 2024 14:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721614.1125185; Tue, 14 May 2024 14:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tNt-0002u8-Go; Tue, 14 May 2024 14:44:05 +0000
Received: by outflank-mailman (input) for mailman id 721614;
 Tue, 14 May 2024 14:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6tNs-0002u2-Eh
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:44:04 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67a96310-1200-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:44:03 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-792ce7a1fa8so346945485a.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:44:03 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf3106c2sm569422385a.106.2024.05.14.07.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 07:44:01 -0700 (PDT)
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
X-Inumbo-ID: 67a96310-1200-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715697841; x=1716302641; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yU54ZWAH083rLTWsflh2hCSJ7w8yWqPrKomATStyodM=;
        b=bfQ84rRcnI/7sE8zII/OOWR7e710PDNsqHJ2ZL51wj7Pt6J1yK76eBpFWfrSwf/Gct
         mJA2M4tcBHYxpdbL8aazrkyjhhWxOs2C8DjYI0KVyebOE5ZPrYpXJM9f3V/ZbhVZ74GS
         ao8XrLFc1wWJ7LW4yGrxFCgoetsVh6Wl3RPYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697841; x=1716302641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yU54ZWAH083rLTWsflh2hCSJ7w8yWqPrKomATStyodM=;
        b=mKTpNFiADsjdDJOHjlLDCp9Tyspd6dYAHWw6HpRgPCO15XXUCfhhWwnAl518SiP0rp
         5ho51PUIO2r74z3/1WYtl7qhBwfABRieSZtCdVQBeAbUwoCiULw3SqVhbrdJZYw0MpAD
         hxRaV2zuNV9bEKPjcfO2zW2IPEfGRCq3HbZAg7GMkxR7BW45MwP1XbSmY5kbaRIBTq7E
         2W89UjHj6T4lKejx8IG80w3wg/TRHFZMrH0sB01jn/9I0DfBvaAbVm4Lh8qXYAnFqzsT
         T5qh19/hjXOjbY+Tz8VYdP2JorRMm4tYL75/zwilQ7JGKBZQg0ex9TviJC/aJ6WKFzyb
         VIMA==
X-Gm-Message-State: AOJu0YwOr+X2jnyYPM7RA8q058Sq9aMs5syPchFZaKGEz/HTzKVa8NQm
	TL+Ax2ZYMFF0bF5zvbTrG039UjSfSoJfzedj2tr3hXWYvP2LTsbhiu3vILwYbPk=
X-Google-Smtp-Source: AGHT+IHh99zfJ7zdzINhue8fHdXkNa7E4LKWeQms9Bv2K1OjP4wgYyFQww2wuaEldVKbYYLxWSbR/A==
X-Received: by 2002:a05:620a:9372:b0:792:e0b5:c029 with SMTP id af79cd13be357-792e0b5cc3bmr549214385a.21.1715697841444;
        Tue, 14 May 2024 07:44:01 -0700 (PDT)
Date: Tue, 14 May 2024 16:43:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
Message-ID: <ZkN4q6H591SeT6wH@macbook>
References: <20240513085925.59324-1-roger.pau@citrix.com>
 <2d245c04-3bf9-4b9d-ad02-e754dcbefa28@citrix.com>
 <dd689012-0554-43ae-b22b-035415ce3392@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd689012-0554-43ae-b22b-035415ce3392@citrix.com>

On Tue, May 14, 2024 at 02:50:18PM +0100, Andrew Cooper wrote:
> On 14/05/2024 12:09 pm, Andrew Cooper wrote:
> > On 13/05/2024 9:59 am, Roger Pau Monne wrote:
> >> There's no point in forcing a system wide update of the MTRRs on all processors
> >> when there are no changes to be propagated.  On AP startup it's only the AP
> >> that needs to write the system wide MTRR values in order to match the rest of
> >> the already online CPUs.
> >>
> >> We have occasionally seen the watchdog trigger during `xen-hptool cpu-online`
> >> in one Intel Cascade Lake box with 448 CPUs due to the re-setting of the MTRRs
> >> on all the CPUs in the system.
> >>
> >> While there adjust the comment to clarify why the system-wide resetting of the
> >> MTRR registers is not needed for the purposes of mtrr_ap_init().
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> For consideration for 4.19: it's a bugfix of a rare instance of the watchdog
> >> triggering, but it's also a good performance improvement when performing
> >> cpu-online.
> >>
> >> Hopefully runtime changes to MTRR will affect a single MSR at a time, lowering
> >> the chance of the watchdog triggering due to the system-wide resetting of the
> >> range.
> > "Runtime" changes will only be during dom0 boot, if at all, but yes - it
> > is restricted to a single MTRR at a time.
> >
> > It's XENPF_{add,del,read}_memtype, but it's only used by Classic Linux. 
> > PVOps only issues read_memtype.
> >
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Actually no - this isn't safe in all cases.
> 
> There are BIOSes which get MTRRs wrong, and with the APs having UC
> covering a wider region than the BSP.
> 
> In this case, creating consistency will alter the MTRRs on all CPUs
> currently up, and we do need to perform the rendezvous in that case.

I'm confused, the state that gets applied in mtrr_set_all() is not
modified to match what's in the started AP registers.

An AP starting with a different set of MTRR registers than the saved
state will result in the MTRR state on the AP being changed, but not
the Xen state stored in mtrr_state, and hence there will be no changes
to synchronize.

> There are 3 cases:
> 
> 1) Nothing to do.  This is the overwhemlingly common case.
> 2) Local changes only.  No broadcast, but we do need to enter CD mode.
> 3) Remote changes needed.  Needs full broadcast.

Please bear with me, but I don't think 3) is possible during AP
bringup.  It's possible I'm missing a path where the differences in
the started AP MTRR state are somehow reconciled with the cached MTRR
state?

Thanks, Roger.

