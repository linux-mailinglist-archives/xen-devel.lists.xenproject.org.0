Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F5A0557C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 09:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866973.1278367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRXA-0001LU-FE; Wed, 08 Jan 2025 08:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866973.1278367; Wed, 08 Jan 2025 08:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRXA-0001JI-Ca; Wed, 08 Jan 2025 08:35:24 +0000
Received: by outflank-mailman (input) for mailman id 866973;
 Wed, 08 Jan 2025 08:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVRX9-0001J7-2F
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 08:35:23 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f4501c0-cd9b-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 09:35:21 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so58203866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 00:35:21 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f90esm2453753966b.4.2025.01.08.00.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:35:19 -0800 (PST)
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
X-Inumbo-ID: 7f4501c0-cd9b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736325321; x=1736930121; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2A0EJYy6tH0BmzSWr8ztrxIn7qFybjG51eBRm64yv1w=;
        b=Pf+pGIQHjq6E4SO7V91pyZeuO1/bjz3H/WmTCoEZGuBiCk6oEmaA3Gb3ODgxpAslzb
         ZOqkrYdxm9fZDVJPv5sXZU9qwvVJ036kJQa0vrAND+V11/sqTbmuOa2Toc6PIJ2eF/ua
         luzn/6oGizPWYQF5ImB+Nliie1M6Sdsl5u44w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325321; x=1736930121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A0EJYy6tH0BmzSWr8ztrxIn7qFybjG51eBRm64yv1w=;
        b=rvRUni3EeZ8Ib/Jl3UJE43vF5fB091lOrwdDtRH24CY/I0iBdykriVEC/7rzJFVaN0
         zMDsjFKfV7EB3IniGsFrV377a41QUKd2Y0tudYpuVkFqfm8sO+qZik14YcqotgPL5ZeC
         zj+P9YESjqJtAWZRCWwW90ottU8GEFYCAFe7m9ssj9gf5l/SvZglS0RWF1G/5gfv8AYl
         oUCnKoC5v/G/KIrld0mE3opcshc4q2o8cmrdIDLQENqOw5uPCp292VmaC5uiyfXbO1AR
         JAUAMqW+vu0htx6FwWNjkCV13QjcrkDrHsPZ3cjJB5mXLbGFb6CAmyp9a9D74bwm5vJ/
         0WVw==
X-Forwarded-Encrypted: i=1; AJvYcCVFOJ5AHLK+nvZ/fVTrCrH/yHuSKPlqkL6vDJ6aR4MxXjsp/Eg1kHzD5Rv2ktO+QiT8Kx1oXnB4wWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtG/j+DXF6mb+MzDyJ9N2cxJRoYJ4VY9JgZb+LZaK2Q8PrN5dn
	ubyTYbYQT9z0bwGnSeocYuzgeiKcvKIHHH7901YwTHxhx4iqG+1d5WCQWx+gmRE=
X-Gm-Gg: ASbGncsVfBqETi2jtVKparafVQEeXOMLR3LyRD5kuidKqjyEWGTVzVJuyTRQ4ZqzG3a
	fWqQ8B3sxONFQvVmg/llTrvQhwTReQzDhAIL+0h2wT4Gw5LKUAQjbSSEoHHeDoQ7Yc7HPRO6d4V
	qSEdRdWZ6+Af+LZK7tqT5mgTbZR3gAHgBo+imBTcjMj22NKZA4sFDgnmFJupMnmEXPF7D1c4xRo
	7+oAIp8fTTjUs4Zq98CAq9AHlgPKWwTY+6oGyjG+Fk1JbdHavV7rG1CSSIC16ilzMY=
X-Google-Smtp-Source: AGHT+IHLmxb7T15SMKpGNVa0S6TPsrz4b4xItNAM8gvfV1nRO2LXaeXlmMVI/oNBdsh/Ql+91YIlYQ==
X-Received: by 2002:a17:907:720f:b0:aa6:75e1:1864 with SMTP id a640c23a62f3a-ab2ab6a8b3emr154224166b.4.1736325320070;
        Wed, 08 Jan 2025 00:35:20 -0800 (PST)
Date: Wed, 8 Jan 2025 09:35:18 +0100
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
Message-ID: <Z344xgqtpNZIDxHD@macbook.local>
References: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
 <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
 <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
 <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>
 <Z34xhkNu5YLyEzut@macbook.local>
 <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com>

On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
> On 08.01.2025 09:04, Roger Pau Monné wrote:
> > On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> >> On 08.01.2025 00:40, Stefano Stabellini wrote:
> >>> On Tue, 7 Jan 2025, Jan Beulich wrote:
> >>>> On 06.01.2025 19:48, Stefano Stabellini wrote:
> >>>>> On Mon, 6 Jan 2025, Jan Beulich wrote:
> >>>>>> On 04.01.2025 05:15, Denis Mukhin wrote:
> >>>>>>>
> >>>>>>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> >>>>>>>>
> >>>>>>>>> From: Denis Mukhin dmukhin@ford.com
> >>>>>>>>>
> >>>>>>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> >>>>>>>>>
> >>>>>>>>> The call is used in NS8250 emulator to identify the case when physical xen
> >>>>>>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
> >>>>>>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Such messages ought to be processed through guest_printk(), which wants a
> >>>>>>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
> >>>>>>>> current->domain anyway at the callsite, eliminating the need for such a
> >>>>>>>>
> >>>>>>>> helper altogether?
> >>>>>>>
> >>>>>>> If the current domain is owning the physical console and printing, say, Linux
> >>>>>>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> >>>>>>> can be disabled from Xen command line.
> >>>>>>
> >>>>>> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
> >>>>>> which domain a message came from. As long as only Dom0 messages are left un-
> >>>>>> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
> >>>>>> messages (and have console "focus") I think the prefix needs to be there.
> >>>>>
> >>>>> It looks like we are aligned on the desired behavior,
> >>>>
> >>>> Hmm, no, I don't think we are. I don't ...
> >>>>
> >>>>> but for clarity,
> >>>>> see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
> >>>>> here:
> >>>>>
> >>>>> I think we should provide a consistent behavior across architectures.
> >>>>> The current behavior with vpl011 and dom0less on ARM is the following:
> >>>>>
> >>>>> - no prefix for Dom0 output
> >>>>> - DOM$NUM for DomUs when not in focus, otherwise no prefix
> >>>>
> >>>> ... view this model as a desirable one. It leaves room for ambiguity.
> >>>
> >>> Adding a few more people in CC for feedback.
> >>>
> >>> My priority is to keep the architectures aligned. It might be OK to
> >>> change output format, but then let's do it uniformly on ARM as well.
> >>>
> >>> Jan, please clarify what you think would be better than the above. Is it
> >>> the following? I don't think I understood your preference.
> >>>
> >>> - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix
> >>
> >> No, I mean like we have it with guest_printk() today. (XEN) for Xen's
> >> own messages, (d<N>) for ordinary domains' ones, and no prefix
> >> exclusively for the hardware/control domain. What is best to do when
> >> hardware and control domains are distinct I'm uncertain - I'd be
> >> inclined to suggest that the hardware domain then stay the one without
> >> any prefix.
> > 
> > One concern I have with this approach is whether the addition of the
> > (d<N>) prefixes will skew output of interactive applications.  So far
> > the prefix is added to output from all domains different than dom0
> > because the console is not interactive for them, and hence no input
> > can be consumed.
> 
> Hmm, that's an aspect I have to admit I didn't think of.
> 
> > If that changes however, and domains different than dom0 can get input
> > from the Xen console then I wonder how much the added prefix will skew
> > output.  Another possible option would be to not print the prefix for
> > the domain that has the console input assigned (current target), and
> > print it for all other domains (even for dom0 when not in focus).
> 
> That's largely what aiui was proposed. My extra requirement there would
> then be that we make sure a log message is always emitted when console
> focus shifts, so it's possible to identify the owner for any part of
> the log.

Indeed, printing console input shifting should be a requirement
regardless of how we decide to print the prefix.

Thanks, Roger.

