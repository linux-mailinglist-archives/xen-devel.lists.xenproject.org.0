Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF5EB1A56E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069501.1433353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiwhq-0003YP-KE; Mon, 04 Aug 2025 15:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069501.1433353; Mon, 04 Aug 2025 15:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiwhq-0003VD-HG; Mon, 04 Aug 2025 15:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1069501;
 Mon, 04 Aug 2025 15:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEzl=2Q=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uiwho-0003V7-P1
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:02:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ecb330-7144-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 17:02:15 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so4976615e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:02:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c47b10asm15546318f8f.60.2025.08.04.08.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:02:14 -0700 (PDT)
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
X-Inumbo-ID: 01ecb330-7144-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754319735; x=1754924535; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ra+2KvMwL1gIIILY0e8xcHmgCZ5EEzejiGz4ScwUAWY=;
        b=RdqC5eIXpM1TKFRLb5OsjgsDMveAHgEkxnaevmqWUi+FiCLhWqdOdsLPenlWAqerPC
         /0TirF8HzF6k3ScQVipw0FX7dLx2V9PnTm8fcK6yRKMG6q9dj1dTQEtBBvWDBECWEoOv
         dug9R9Z1IfabVEIX6K5gLGdcH5rKaqrluudJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754319735; x=1754924535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra+2KvMwL1gIIILY0e8xcHmgCZ5EEzejiGz4ScwUAWY=;
        b=pK2vazwyeyYSyTH+RUgcvanzzPJl6gQTB1UKLBTIOP5HT5tzRMHST06vAksRDV6qX/
         MtGEfechBqDXTbShzcxgXCtH/0ya4ZfEeM/QIhKv+/JyMYdDQAzoIKh8ZDVV/r6Mgu78
         vU97Jncj34HHlDxjfn1izN+yVErCWx2PJFm5+NSqo+RvE9JTRkt6pZq+aOjgS1D9ttFr
         7lMRnOR7jRic6qAxUe1Z0il/XHk/yu42hxPVbIj6XT2AdqMRB1W1FS2t9HYN/PwCUGXt
         8RWE4tgJ7wvb8HWIU/7q63w+X+QpCuExgabKw46KpRIv0ESzKnlkiFI32rt2o/ojxZwG
         InfA==
X-Gm-Message-State: AOJu0YyETYlB0rVf5vig41vLGqz34DwcXhohcUpGesg6FCF7I5XBkQ3J
	fj+Ft3NpeCvFdT7rrHO1sGMLquaroGGq9GjYqosSJKdNvnPh9Yx9Yb5Xb4ikXuZJ35U=
X-Gm-Gg: ASbGncu3N7botJgt5MC4DxuZ1jZ0A8RNQNXy7dAnXjSBwGWo3zXQre7yc9KIQXuiDm4
	3Imx/JT+vKRIaOlQqzQxhj2hhG9UXdxFAlXsb+Js4BvkNLqPpa7uyMv6sBGFEGfRkQgi3PzLQZp
	C28qpZ2N+Nx6hBpHxcitpQK2yptPNrnC3l2gaJ1f4GN28awPqFl0ufqL/1egQY7JIAAnI9jrM6M
	bykwJoc/LQ11ulfz1RIvvUoR2pgShr+Qqq0ZbMUhcTbeCYJ60LM/cBr75JAQdpyrG7LFp63Q8e4
	oOTo5IDXCKMPrx8PhW4ytp1VukuHeFTFWsZ6eg1KB+YLYbxSjPb6ys4hE59hBYrJuzxxXGeDclh
	/b+eKfcFGifF1tClZ7YHDuZDp/TJSkp+aEhyfiVxlMJjcRaC/XK+Hh9kv6UUUyMr65g==
X-Google-Smtp-Source: AGHT+IF9Wwue/lSscaS6cVbgXxpWhyb6gs3+Hf4VDUamXB3dfd7reHIb8wT9ex2THYMkYIJXut5P+g==
X-Received: by 2002:a05:600c:3b93:b0:459:94a7:220f with SMTP id 5b1f17b1804b1-45994a72576mr49153515e9.26.1754319734525;
        Mon, 04 Aug 2025 08:02:14 -0700 (PDT)
Date: Mon, 4 Aug 2025 17:02:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Message-ID: <aJDLdb4wngFMJ7tA@macbook.local>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com>
 <aIJi8E2BC-dzAIz8@macbook.local>
 <aIM5IR-d4_u19JVe@macbook.local>
 <6d5545a2-bbf0-4cf9-9820-5eaf6d8530f8@amd.com>
 <aJC76twnBXNQnA3d@macbook.local>
 <6b8a8631-14c5-4e57-91f9-22acdf7efa07@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b8a8631-14c5-4e57-91f9-22acdf7efa07@suse.com>

On Mon, Aug 04, 2025 at 03:57:24PM +0200, Jan Beulich wrote:
> On 04.08.2025 15:55, Roger Pau Monné wrote:
> > On Fri, Aug 01, 2025 at 05:06:32PM -0400, Stewart Hildebrand wrote:
> >> On 7/25/25 03:58, Roger Pau Monné wrote:
> >>> On Thu, Jul 24, 2025 at 06:44:32PM +0200, Roger Pau Monné wrote:
> >>>> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
> >>>>> @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >>>>>      return rc;
> >>>>>  }
> >>>>>  
> >>>>> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> >>>>> +                                            uint16_t cmd, bool rom_only)
> >>>>> +{
> >>>>> +    struct vpci_map_task *task = xzalloc(struct vpci_map_task);
> >>>>
> >>>> xvzalloc() preferably.
> >>>>
> >>>> This however introduces run-time allocations as a result of guest
> >>>> actions, which is not ideal IMO.  It would be preferable to do those
> >>>> allocations as part of the header initialization, and re-use them.
> >>>
> >>> I've been thinking over this, as I've realized that while commenting
> >>> on it, I didn't provide any alternatives.
> >>>
> >>> The usage of rangesets to figure out the regions to map is already not
> >>> optimal, as adding/removing from a rangeset can lead to memory
> >>> allocations.  It would be good if we could create rangesets with a
> >>> pre-allocated number of ranges (iow: a pool of struct ranges), but
> >>> that's for another patchset.  I think Jan already commented on this
> >>> aspect long time ago.
> >>
> >> +1
> >>
> >>> I'm considering whether to allocate the deferred mapping structures
> >>> per-vCPU instead of per-device.  That would for example mean moving
> >>> the current vpci_bar->mem rangeset so it's allocated in vpci_vcpu
> >>> struct instead.  The point would be to not have the rangesets per
> >>> device (because there can be a lot of devices, specially for the
> >>> hardware domain), but instead have those per-vCPU.  This should work
> >>> because a vCPU can only queue a single vPCI operation, from a single
> >>> device.
> >>>
> >>> It should then be possible to allocate the deferred mapping structures
> >>> at vCPU creation.  I also ponder if we really need a linked list to
> >>> queue them; AFAIK there can only ever be an unmapping and a mapping
> >>> operation pending (so 2 operations at most).  Hence we could use a
> >>> more "fixed" structure like an array.  For example in struct vpci_vcpu
> >>> you could introduce a struct vpci_map_task task[2] field?
> >>>
> >>> Sorry, I know this is not a minor change to request.  It shouldn't
> >>> change the overall logic much, but it would inevitably affect the
> >>> code.  Let me know what you think.
> >>
> >> Thanks for the feedback and suggestion. Yeah, I'll give this a try.
> >> Here's roughly what I'm thinking so far. I'll keep playing with it.
> >>
> >> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >> index 5241a1629eeb..942c9fe7d364 100644
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -387,6 +387,16 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
> >>   */
> >>  static int vcpu_teardown(struct vcpu *v)
> >>  {
> >> +#ifdef CONFIG_HAS_VPCI
> >> +    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
> >> +    {
> >> +        struct vpci_map_task *task = &v->vpci.task[i];
> >> +
> >> +        for ( unsigned int j = 0; j < ARRAY_SIZE(task->bars); j++ )
> >> +            rangeset_destroy(task->bars[j].mem);
> > 
> > You might want to additionally do:
> > 
> > task->bars[j].mem = NULL;
> 
> Should we perhaps introduce RANGESET_DESTROY() along the lines of XFREE() et al?

Yes, I was wondering whether to recommend it here, but didn't want to
add noise, so was planning on adding this to my queue.  But yes, if
you can/will please do it Stewart.

Thanks, Roger.

