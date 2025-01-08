Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5CA054F3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 09:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866951.1278337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVR3C-00041k-NY; Wed, 08 Jan 2025 08:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866951.1278337; Wed, 08 Jan 2025 08:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVR3C-00040G-Kj; Wed, 08 Jan 2025 08:04:26 +0000
Received: by outflank-mailman (input) for mailman id 866951;
 Wed, 08 Jan 2025 08:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVR3B-00040A-KU
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 08:04:25 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cac8e48-cd97-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 09:04:24 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso456016266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 00:04:24 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f012229sm2460332166b.133.2025.01.08.00.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:04:23 -0800 (PST)
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
X-Inumbo-ID: 2cac8e48-cd97-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736323464; x=1736928264; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eP/XOq7s93PU1PGEJyApHf3GDjb9SkgJS2Ocy1yA1pY=;
        b=CiY0mUgKd8IwTu3hBl4LZ3B+3Tp6IVFKq1mFCpmwZWLtU1yJtarGBK1kqiYszdpXPj
         J4N4g7BHd6ZWqvuL5DjY8qDdiCRjanWCaqRUKIre6jB/Gf8hPU09kQnuL95IcLrKkmyj
         jtWRow2T6XsKOjWO2u0vWpN8g/AMOrWfcdmzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736323464; x=1736928264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eP/XOq7s93PU1PGEJyApHf3GDjb9SkgJS2Ocy1yA1pY=;
        b=q45OAmrnxgdqqBUIzqtuj6pvgXn5o6akZNLzWyFJEi0UBZBQCz44R9d/mvwV9VH8/h
         avtJSj9C/yojX0lV5m0p2RXoa0XX4zfSpEIdl4zXPSmRXgcIxRg1KGEh/q9Qg7Uspw0z
         CL2FYdgn6RHBDkak7eoyGNUzEBDLsm/XctAiQRtoWit7XBqX0yDn4qLwl1NqQfSUFNPW
         eQINjAx6p9EjPgCT33ZwmbnQd6avLf60Sn8hqubl3YnYdiOeRRAm8/s8ZLWFksTNOPxu
         ENTiQTVPzxZbUFPLG5PFZ93VNrEIzJv/fM6TOpNyItUAzUjpvTrJbisVB1FKRTSoXLpx
         n5qw==
X-Forwarded-Encrypted: i=1; AJvYcCWf0kS3T1JZBBejyAB84uVyXWrlanadr4+Jfu87WEDtyvK/0+YTuPfCF6h+rROUXZ71Bzh6CPRfBbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaW3pkAnWNGIvu4oXYWFCBhSt7YHyLuvTDLEKdPNtgcCSTcGIb
	obkesNd7tmrqd/DlrisvNb13MzTogF0Jv1AWwOKYdKcR1wNRupR+lBS2n1xX4mM=
X-Gm-Gg: ASbGncsrQlA5yP3xl3I/gG1pDB4gcCgIZXjkTZ0rXD91v7Xl7Lx2BvvIOy9RR3ozcgj
	0MjIpKwT/z72MWl2//p6CIRKWVxy6dUdYuGR07Dref6URkgwIbQVijFt12sYzof2kesXbG3L0Cz
	cEGoX+7OCc9kaxulEXpo2AXghmpyCG8T6hn8vSuly6HL2kOcYiZOBcRXsuBuZzm96DIIZVVaJef
	DfmWesYxOOsQc30oBbTtpErOnehPF/W/OxNLei8/dp5yCFGe0knbsF3HqLOfHxi1AQ=
X-Google-Smtp-Source: AGHT+IE6Ma8bgK8ETIwfm+exAS8GnGvdfSAXCMOTFK3MqHcc13ArCVsUTJ7qNOxaRLmJkLbvEAgJ8Q==
X-Received: by 2002:a17:907:c03:b0:aa6:84c3:70e2 with SMTP id a640c23a62f3a-ab2ab6fe0d9mr153427966b.20.1736323464074;
        Wed, 08 Jan 2025 00:04:24 -0800 (PST)
Date: Wed, 8 Jan 2025 09:04:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <Z34xhkNu5YLyEzut@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
 <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
 <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
 <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>

On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> On 08.01.2025 00:40, Stefano Stabellini wrote:
> > On Tue, 7 Jan 2025, Jan Beulich wrote:
> >> On 06.01.2025 19:48, Stefano Stabellini wrote:
> >>> On Mon, 6 Jan 2025, Jan Beulich wrote:
> >>>> On 04.01.2025 05:15, Denis Mukhin wrote:
> >>>>>
> >>>>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> >>>>>>
> >>>>>>> From: Denis Mukhin dmukhin@ford.com
> >>>>>>>
> >>>>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> >>>>>>>
> >>>>>>> The call is used in NS8250 emulator to identify the case when physical xen
> >>>>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
> >>>>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
> >>>>>>
> >>>>>>
> >>>>>> Such messages ought to be processed through guest_printk(), which wants a
> >>>>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
> >>>>>> current->domain anyway at the callsite, eliminating the need for such a
> >>>>>>
> >>>>>> helper altogether?
> >>>>>
> >>>>> If the current domain is owning the physical console and printing, say, Linux
> >>>>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> >>>>> can be disabled from Xen command line.
> >>>>
> >>>> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
> >>>> which domain a message came from. As long as only Dom0 messages are left un-
> >>>> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
> >>>> messages (and have console "focus") I think the prefix needs to be there.
> >>>
> >>> It looks like we are aligned on the desired behavior,
> >>
> >> Hmm, no, I don't think we are. I don't ...
> >>
> >>> but for clarity,
> >>> see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
> >>> here:
> >>>
> >>> I think we should provide a consistent behavior across architectures.
> >>> The current behavior with vpl011 and dom0less on ARM is the following:
> >>>
> >>> - no prefix for Dom0 output
> >>> - DOM$NUM for DomUs when not in focus, otherwise no prefix
> >>
> >> ... view this model as a desirable one. It leaves room for ambiguity.
> > 
> > Adding a few more people in CC for feedback.
> > 
> > My priority is to keep the architectures aligned. It might be OK to
> > change output format, but then let's do it uniformly on ARM as well.
> > 
> > Jan, please clarify what you think would be better than the above. Is it
> > the following? I don't think I understood your preference.
> > 
> > - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix
> 
> No, I mean like we have it with guest_printk() today. (XEN) for Xen's
> own messages, (d<N>) for ordinary domains' ones, and no prefix
> exclusively for the hardware/control domain. What is best to do when
> hardware and control domains are distinct I'm uncertain - I'd be
> inclined to suggest that the hardware domain then stay the one without
> any prefix.

One concern I have with this approach is whether the addition of the
(d<N>) prefixes will skew output of interactive applications.  So far
the prefix is added to output from all domains different than dom0
because the console is not interactive for them, and hence no input
can be consumed.

If that changes however, and domains different than dom0 can get input
from the Xen console then I wonder how much the added prefix will skew
output.  Another possible option would be to not print the prefix for
the domain that has the console input assigned (current target), and
print it for all other domains (even for dom0 when not in focus).

Thanks, Roger.

