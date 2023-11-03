Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964BA7E05D2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627241.978175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywXW-0000D0-NE; Fri, 03 Nov 2023 15:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627241.978175; Fri, 03 Nov 2023 15:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywXW-00009T-Ju; Fri, 03 Nov 2023 15:56:54 +0000
Received: by outflank-mailman (input) for mailman id 627241;
 Fri, 03 Nov 2023 15:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUT0=GQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qywXV-00007Q-7v
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:56:53 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a523d97-7a61-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 16:56:51 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c594196344so30053201fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 08:56:51 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003fe61c33df5sm2967362wmq.3.2023.11.03.08.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:56:50 -0700 (PDT)
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
X-Inumbo-ID: 9a523d97-7a61-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699027011; x=1699631811; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lr2nSdRi+Qg0bYNURxf8o7SgpC2C+6dA+impShbvdQY=;
        b=WAwtUh8xUcA3xJjDYUCdrq4aGCpLzGKCJNE/QwZDjizJdxqCggLufbER/ZIJpPVso3
         GDI4jgVZf0DWk5zRsviwcHnEYdayZp1YEsSuB4lnyfGGk3vbcygZj0R9G9la7OHLuvwm
         633A3jy741xwIv2/e2VaiBUMtOGZ5DsdCNMOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699027011; x=1699631811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lr2nSdRi+Qg0bYNURxf8o7SgpC2C+6dA+impShbvdQY=;
        b=siXRHYOJml3kir1LqtUFxYdIT5Oz/OoZfCIN/+GZUI7GZdb3TA96R5N/Ttd9Vzla5/
         rSUcLRGcX5kZ5f+tboD3eiV8cSaklbZ15g9e4+2Vwo+P0k9vQgBG6R4SYU4N6dfJ4/N2
         2AKgS+PwEAFAapMT2laoXEQfateBxFJBAJdATXwpZuQ5SjX8yGCgUN688s4054Iym0pK
         swXr3HYdy20VXHnNsDMlkRprhWOL9ZlIhePjvkSSmfTYVVIdl/DnXCZYI+gd4dGV/kwV
         ss9/q4RIjQVNGuI3Snbtn2NBT9kIEot5Jw8k4AH/HTS9lhyHx/lcJEnt/y2jjEyVUkkE
         Ao0g==
X-Gm-Message-State: AOJu0Yz0FNtig5a9b8NyWFXd3hYfjyK3UHzIZoXnvJ+TazvuPe5RZxwE
	aisfinMvtTpaZpNXDtNh+nRDcA==
X-Google-Smtp-Source: AGHT+IHZJbiRgKHzBt3dBpQH2mTmXBaiCQV27divBTAu040E/7i4mLVxrzdeiw1GQejin7Dt0U1Hhw==
X-Received: by 2002:a05:651c:c9b:b0:2c0:7d6:570a with SMTP id bz27-20020a05651c0c9b00b002c007d6570amr20747117ljb.33.1699027010973;
        Fri, 03 Nov 2023 08:56:50 -0700 (PDT)
Date: Fri, 3 Nov 2023 16:56:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZUUYQhinrxrJcL63@macbook>
References: <20231103144537.90914-1-roger.pau@citrix.com>
 <93fc77ad-8696-4d83-b916-e47f883ac366@citrix.com>
 <ZUUS-fzShqxOs5IO@macbook>
 <ce44f81a-5dae-4c24-9ed2-f3cdffb78129@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce44f81a-5dae-4c24-9ed2-f3cdffb78129@citrix.com>

On Fri, Nov 03, 2023 at 03:44:30PM +0000, Andrew Cooper wrote:
> On 03/11/2023 3:34 pm, Roger Pau Monné wrote:
> > On Fri, Nov 03, 2023 at 03:10:18PM +0000, Andrew Cooper wrote:
> >> On 03/11/2023 2:45 pm, Roger Pau Monne wrote:
> >>> when sending those, as multiple CPUs can be targeted with a single ICR register
> >>> write.
> >>>
> >>> A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
> >>> box gives the following average figures:
> >>>
> >>> Physical mode: 26617931ns
> >>> Mixed mode:    23865337ns
> >>>
> >>> So ~10% improvement versus plain Physical mode.  Note that Xen uses Cluster
> >>> mode by default, and hence is already using the fastest way for IPI delivery at
> >>> the cost of reducing the amount of vectors available system-wide.
> >> 96 looks suspiciously like an Intel number.  In nothing else, you ought
> >> to say which CPU is it, because microarchitecture matters.  By any
> >> chance can we try this on one of the Bergamos, to give us a datapoint at
> >> 512?
> > Let me see if I can grab the only one that's not broken.
> >
> > Those figures are from an Intel IceLake IIRC.  Cluster mode is the
> > default, so this change shouldn't effect the performance of builds
> > that use the default settings.
> 
> "shouldn't" being the operative word.
> 
> You're presenting evidence to try and convince the reader that the
> reasoning is correct.
> 
> Therefore, it is important to confirm your assumptions, and that means
> measuring and reporting all 3.
> 
> Part of the analysis should say "we expected mixed and cluster to be the
> same, and the results show that".
> 
> And obviously, if mixed and cluster are wildly different, then we take a
> step back and think harder.

If they are different I'm definitely not sending the patch :).

> >>> +};
> >>> +
> >>>  static int cf_check update_clusterinfo(
> >>>      struct notifier_block *nfb, unsigned long action, void *hcpu)
> >>>  {
> >>> @@ -220,38 +248,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> >>>  static int8_t __initdata x2apic_phys = -1;
> >>>  boolean_param("x2apic_phys", x2apic_phys);
> >>>  
> >>> +enum {
> >>> +   unset, physical, cluster, mixed
> >>> +} static __initdata x2apic_mode = unset;
> >>> +
> >>> +static int __init parse_x2apic_mode(const char *s)
> >> cf_check
> > I'm probably confused, but other users of custom_param() do have the
> > cf_check attribute, see parse_spec_ctrl() for example.
> 
> Yes, and this function needs one but is missing it.
> 
> cf_check equates to "This function needs an ENDBR", which it does
> because it's invoked by function pointer.
> 
> It likely doesn't expode on a CET-active machine because this logic runs
> prior to turning CET-IBT on, and you'll only get a build error in the
> buster-ibt pipeline which has a still-unupstreamed GCC patch.

That was my guess, that CET wasn't yet active by the time this is
called.

For consistency we should fix all handlers of custom_param() (and
other command line parsing helpers) so they uniformly use cf_check,
otherwise it's likely I will make the same mistake when copy&paste to
introduce a new option.

Thanks, Roger.

