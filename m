Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AC82AC0B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666123.1036596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsMB-0000Ax-6r; Thu, 11 Jan 2024 10:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666123.1036596; Thu, 11 Jan 2024 10:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsMB-00008J-43; Thu, 11 Jan 2024 10:32:15 +0000
Received: by outflank-mailman (input) for mailman id 666123;
 Thu, 11 Jan 2024 10:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNsM9-00008D-Fj
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:32:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae590d52-b06c-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 11:32:12 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e613b6afbso2915085e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:32:12 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b0040e56830a35sm1381333wmo.18.2024.01.11.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:32:11 -0800 (PST)
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
X-Inumbo-ID: ae590d52-b06c-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704969132; x=1705573932; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BatfChXWOq5UIApCFhClhqrW5DrFkJPGSIQlXTzWDok=;
        b=awul8LNAk1cuVXFw2LAB9kQ0Pi2yIkvFgtBIUz3iwkmLyWBeJ8qD2RsnchoCcvheTE
         XgpkAzg7Grz5xzZSzsuKys+HtTbaJDCMRDR/fDp/89g3VqwatA/IpU0qXVVyiTXyZeY7
         d1QzFGHOIAyofW6mDB1fZe1+cTXwS8RjqP4bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969132; x=1705573932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BatfChXWOq5UIApCFhClhqrW5DrFkJPGSIQlXTzWDok=;
        b=P2F7yxFJKuHU+BOGb+iNX8sF0AtXCtfY6PTR7IsDu6rZJN9wDd7Tj0wf3XExL8Mo4t
         Hc4fG+dj8pl6m3vj7I6+h8tcETV6VIXbKq2xeJSrDPwXNWlfocE/2+a5zrkphaaJ0tzc
         bQ9Xk8kBLm5sqwSgTyC1l73SQ+apBGyqnztUUhPOrq9L+Cie6sifeihJVYGO2dU0caUr
         iOh8LXvx4fstjA0Fd/08zX052qxs8x+KrD8vij8V0d2VNAQlBGAF0z52MH0N9V8qcagu
         8uAZgHYlbkgghEymrP9I0FprANy48+5lU/6eBOghqihUXF6pOz2/TLx0Un12FI2hbA6M
         oNLg==
X-Gm-Message-State: AOJu0YxaD47aVoGqcihVSPYgX8ai+nfnNr/Deuc0WEDQDmXcYhWxqHcI
	6TzptO0Gk9Q0zg8l4aPVGgBuMLVqQznwbQ==
X-Google-Smtp-Source: AGHT+IE4RRugYhLGvjPH+TQEsXu38avj1KXzGB+T1xVnRA2+azYtn/+g7vCPx3P4aXC5AQSeY1aMYQ==
X-Received: by 2002:a05:600c:5128:b0:40e:52de:1571 with SMTP id o40-20020a05600c512800b0040e52de1571mr290922wms.18.1704969131957;
        Thu, 11 Jan 2024 02:32:11 -0800 (PST)
Date: Thu, 11 Jan 2024 11:32:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Message-ID: <ZZ_Dq7taOJmSi7Kb@macbook>
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <d09dfd7c-a266-4c3b-ade6-c537b30b0a1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d09dfd7c-a266-4c3b-ade6-c537b30b0a1d@suse.com>

On Thu, Jan 11, 2024 at 11:00:28AM +0100, Jan Beulich wrote:
> On 11.01.2024 10:08, Roger Pau Monne wrote:
> > When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> > MSR contains per-counter enable bits that is ANDed with the enable bit in the
> > counter EVNTSEL MSR in order for a PMC counter to be enabled.
> > 
> > So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> > bits being set by default, but at least on some Intel Sapphire and Emerald
> > Rapids this is no longer the case, and Xen reports:
> > 
> > Testing NMI watchdog on all CPUs: 0 40 stuck
> > 
> > The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> > doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> > relevant enable bit in PERF_GLOBAL_CTRL not being set.
> > 
> > Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
> > general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
> > PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
> >    enable all counters.
> > ---
> > Unsure whether printing a warning if the value of PERF_GLOBAL_CTRL is not
> > correct is of any value, hence I haven't added it.
> > ---
> >  xen/arch/x86/cpu/intel.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> > index dfee64689ffe..40d3eb0e18a7 100644
> > --- a/xen/arch/x86/cpu/intel.c
> > +++ b/xen/arch/x86/cpu/intel.c
> > @@ -533,9 +533,25 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
> >  	init_intel_cacheinfo(c);
> >  	if (c->cpuid_level > 9) {
> >  		unsigned eax = cpuid_eax(10);
> > +		unsigned int cnt = (uint8_t)(eax >> 8);
> 
> (Not just) since ./CODING_STYLE wants us to avoid fixed width types where
> possible, personally I'd prefer "& 0xff" here.

Hm, OK.  I got confused and somehow was under the impression we prefer
to truncate using fixed types rather than masks.

> >  		/* Check for version and the number of counters */
> > -		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
> > +		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
> > +			uint64_t global_ctrl;
> > +			unsigned int cnt_mask = (1UL << cnt) - 1;
> > +
> > +			/*
> > +			 * On (some?) Sapphire/Emerald Rapids platforms each
> > +			 * package-BSP starts with all the enable bits for the
> > +			 * general-purpose PMCs cleared.  Adjust so counters
> > +			 * can be enabled from EVNTSEL.
> > +			 */
> > +			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> > +			if ((global_ctrl & cnt_mask) != cnt_mask)
> > +				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
> > +				       global_ctrl | cnt_mask);
> 
> Should there perhaps be a log message?

I had a post-commit remark about that exactly.  I can add one.

Thanks, Roger.

