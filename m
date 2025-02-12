Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D620A3220A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 10:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886258.1295935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8zX-0004A5-9V; Wed, 12 Feb 2025 09:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886258.1295935; Wed, 12 Feb 2025 09:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8zX-000476-6A; Wed, 12 Feb 2025 09:25:11 +0000
Received: by outflank-mailman (input) for mailman id 886258;
 Wed, 12 Feb 2025 09:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uxJh=VD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ti8zV-000470-N4
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 09:25:09 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ffdbe97-e923-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 10:25:08 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21f44e7eae4so110748575ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 01:25:08 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3650e63fsm109629545ad.41.2025.02.12.01.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 01:25:06 -0800 (PST)
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
X-Inumbo-ID: 3ffdbe97-e923-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739352307; x=1739957107; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VCukYLwGOVYvHtBH1rykRpPRMsvqkw5OcTQejEUpHR8=;
        b=r3xs5+XrHhlmrhiioVeZB9UNvfYeppv5q8oHgWDL/GSauDmf91ktvwNpluO2PQ5Rql
         TkE7/O+NFFdrEj9x0mNgkmoK2A+w5MOMDP46YTDLIIu5rTVY5wBxL9kIMD1O7GIRqV7h
         oqf6ZextEm5NkP3oS8mg7rHTTzDyu3FPc6muA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352307; x=1739957107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCukYLwGOVYvHtBH1rykRpPRMsvqkw5OcTQejEUpHR8=;
        b=upPcKtsQF61TwqoETFqjy3xgPnxSyq3M9zGZRgJuQWCeT0OyyqawX22NVxWoL+p/fF
         tcu5OHn9hWc9YRVuGYqDL4Ad2NrkMTP5F1MWzJV+gQfGFzImIEQO1eFIjAUNLA/DDaBs
         B3DZqmeec+IZBt/180Hv9pcW3PETOqMZUMMUGi2hq01jffI3TXRUcbbUAaiIS1QmvuAo
         VFohfimzGW3jbkmUDEIxf3TTFetkgu1fuNf9DWjHqgDr8eNZinSqeOWDMHuj/8ToZI8W
         Uw+Dn/JVELGrlvtVTETFbbmaQ0YfrTVjP9inrfTfUfHMeDTWmREBoouzP71hj/C3vccr
         qElA==
X-Gm-Message-State: AOJu0Yyo4wo89p+ksdVTecpCQgAf+M3jfZodKPtT6Nz4mOM4tKCnd65x
	mjbdJNxx/d7ID0pThemoKhZJ01f68eH5GUHJwr/4DJVY1K86g4O1/IggwbgK148=
X-Gm-Gg: ASbGnct7s9Fxj6eO3KlVhZWFiiJFHCkVcHtud0pMxRYS19l7Saw/NF82luF5XeKI5Gt
	fom/C75/Z8sisGk5VhDywuAsY77K5lxrcezoVdGsPCOX9VhK9ZZz5c7Pr2TvZVaNmYxs9TCKU7X
	EiffAOJyS4zuttk0pn0gBPadlD5zuVK3PNf9koDu1t4hLpTd2puN0MzmpWV/fSZOA1Sd2LBA1Nd
	uSCG6sCZH0zQ9tSQ0EDwaT8JII6gC3wKQUdm9jMMDO1zRM2eI5cIY5+Xgr6chnYv1WKkZFc7xNi
	floFfT/35mbNUlVL2Tcw
X-Google-Smtp-Source: AGHT+IE0H9bFsmmke66Q33PyXv3Vs+jXRYwwjIz9fBShavsu7MVkl7OrvmBfyIfSlyXIGCrI0dKo2Q==
X-Received: by 2002:a17:903:41c6:b0:220:bd61:a346 with SMTP id d9443c01a7336-220bd61a46emr35141935ad.40.1739352307186;
        Wed, 12 Feb 2025 01:25:07 -0800 (PST)
Date: Wed, 12 Feb 2025 10:25:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20 v3 0/5] xen/x86: prevent local APIC errors at
 shutdown
Message-ID: <Z6xo7Us0LiJqiEi1@macbook.local>
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <Z6uZZrR9XvTFjtO9@macbook.local>
 <30b4c319-64fc-4a8f-bc8d-a60e10831357@gmail.com>
 <6191ed5b-ec66-4054-a6bc-173ab578aa54@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6191ed5b-ec66-4054-a6bc-173ab578aa54@suse.com>

On Wed, Feb 12, 2025 at 09:51:16AM +0100, Jan Beulich wrote:
> On 12.02.2025 09:33, Oleksii Kurochko wrote:
> > 
> > On 2/11/25 7:39 PM, Roger Pau Monné wrote:
> >> On Tue, Feb 11, 2025 at 12:02:04PM +0100, Roger Pau Monne wrote:
> >>> Hello,
> >>>
> >>> The following series aims to prevent local APIC errors from stalling the
> >>> shtudown process.  On XenServer testing we have seen reports of AMD
> >>> boxes sporadically getting stuck in a spam of:
> >>>
> >>> APIC error on CPU0: 00(08), Receive accept error
> >>>
> >>> Messages during shutdown, as a result of device interrupts targeting
> >>> CPUs that are offline (and have the local APIC disabled).
> >>>
> >>> First patch strictly solves the issue of shutdown getting stuck, further
> >>> patches aim to quiesce interrupts from all devices (known by Xen) as an
> >>> attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
> >>> make kexec more reliable.
> >>>
> >>> Thanks, Roger.
> >>>
> >>> Roger Pau Monne (5):
> >>>    x86/shutdown: offline APs with interrupts disabled on all CPUs
> >>>    x86/irq: drop fixup_irqs() parameters
> >>>    x86/smp: perform disabling on interrupts ahead of AP shutdown
> >>>    x86/pci: disable MSI(-X) on all devices at shutdown
> >>>    x86/iommu: disable interrupts at shutdown
> >> This is now fully reviewed, can I get your opinion (and
> >> release-acked-by) on which patches we should take for 4.20?
> > 
> > If my understanding is correct to unblock shutdown process, it is enough just
> > to have only first patch merged, correct? So the first patch should be merged.
> > 
> > As second patch doesn't have functional changes, IMO, it could be merged to
> > despite of the fact we have Hard code freeze period.
> > 
> > All other patches, I would like to ask additional opinion (as I am an expert in x86),
> > at first glance it looks like an absence of these patches in staging branch will
> > lead only to triggering "Receive accept error" which I believe won't block shutdown
> > process, so these patches could be postponed until 4.21. On other side, if it is
> > low-risk fixes then we could consider to merge them now.

I expect the following patches might make kexec'ing from Xen a bit
more reliable, as the kexec'ed kernel should find an environment with
interrupts from all Xen known devices quiesced.

> I'm not Roger, but as a data point: While I'm uncertain about patch 2, all
> others in this series will very likely be backported anyway.

I plan to backport the series to the XenServer patch queue also when it
goes in.

Thanks, Roger.

