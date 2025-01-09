Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280AA06FB3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 09:06:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867843.1279385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnYW-00015m-H8; Thu, 09 Jan 2025 08:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867843.1279385; Thu, 09 Jan 2025 08:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnYW-00013I-EX; Thu, 09 Jan 2025 08:06:16 +0000
Received: by outflank-mailman (input) for mailman id 867843;
 Thu, 09 Jan 2025 08:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVnYU-00013A-SI
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 08:06:14 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97969240-ce60-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 09:06:12 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso116678566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 00:06:12 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9136297sm45520166b.91.2025.01.09.00.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 00:06:11 -0800 (PST)
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
X-Inumbo-ID: 97969240-ce60-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736409972; x=1737014772; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j89FAdSM2FhMmnRlCPQkfxGAPchvJJ41YGEB72TbuGc=;
        b=Ts0kt4eoI+/Da/tevDWYC4sEu3jlR8jTrmr1hkUqxpHwez/TUBvmIbuVvV/Naluyxe
         M62+TOZd+SOTedtAwBblOMKAe9of81ZssyY4C0qVDPM7OYGOWQOKJslL5oBPev0KrRRW
         MqX/DAU7rxJg8u+BRqe6WY5acCsFnnEITSYmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736409972; x=1737014772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j89FAdSM2FhMmnRlCPQkfxGAPchvJJ41YGEB72TbuGc=;
        b=K6eViOMkgyBB2jBSii83KmRQh1p+EaSeog3vXp38s95HnfB0vKWRIT8Kv9bpSEzKcB
         2Qbp3GL0HrQIOu97fvWSn+xfXg7xkjda6KS88b4iJzQ300hkGThcg3/RQpu7yki4PC1t
         q8HPnXpxMJX0QclzpGc957J16WXR7dsBQH5J5gH/cYOwHBsu+butyDkVgWzJnpcTvpuR
         lZv3pN4bi9i+fEyGuE0sebj+ad4wn4Unf8VkrdMwVbOJDtY00yzv57e5YajiL6HYhJnO
         NgRcem7oRNbCFM6isJ25GUoDVnXk1TEW0HN7erMK784CuwWW4xQ8kxlgaP/F2Nt5jb4B
         CJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE5TQiRASFBBxud9UVp2O4TnaeyintP5hA8AMT1+P9+GLBBt2A4Z0eKF1xrcWTUj0T/NipbJTrNX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9xMzM5989QoyuLGQ12CDx8s/iLAUjAVokDI76kzNT4VFBsw0Z
	X74t5KisQ8uL1LsiKYE8DBoJb4qtu0V+lS6oZcrJGngXCTf8+zgMhGTeg+eAmso=
X-Gm-Gg: ASbGncuPiAb8UdWDzcV6WTM9SC8aq5+DJ+h/rhAfTQj9vcHVK7p9yheDxmDqXrDfFuT
	lXKKacUbsHYEgvwlHDGsr4oIcFuMRxzr6BsOhq7GJV+j25HTSbDeBgKTD/XVSZnMrsc31X1iZTH
	Y0iGsvbodXescGauD2YOMaz6nPIHvlDr/CxknQ6+TUWft9xQzzqJoAL9uCrMmSVdpDpcFuMd2Ay
	0s9YzxezrNptgv3QuqgABAANIM+iuH74LBt7wgoHPyknsKooF8PSTExXVootKh78zw=
X-Google-Smtp-Source: AGHT+IG+vLUjCJavr572zrGQ7sQQaINJqYuCUuqebrt3uxilgo2TK8JPEjpYTwxb2+ZxxoYy2VK7tQ==
X-Received: by 2002:a17:907:7255:b0:aa6:8600:24f3 with SMTP id a640c23a62f3a-ab2ab5f5353mr405431966b.25.1736409972095;
        Thu, 09 Jan 2025 00:06:12 -0800 (PST)
Date: Thu, 9 Jan 2025 09:06:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Denis Mukhin <dmkhn@proton.me>, Jan Beulich <jbeulich@suse.com>,
	dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <Z3-Dcraxc55vi-ur@macbook.local>
References: <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
 <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
 <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>
 <Z34xhkNu5YLyEzut@macbook.local>
 <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com>
 <Z344xgqtpNZIDxHD@macbook.local>
 <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
 <alpine.DEB.2.22.394.2501081615050.133435@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2501081615050.133435@ubuntu-linux-20-04-desktop>

On Wed, Jan 08, 2025 at 04:29:24PM -0800, Stefano Stabellini wrote:
> On Wed, 8 Jan 2025, Denis Mukhin wrote:
> > On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
> > > > On 08.01.2025 09:04, Roger Pau Monné wrote:
> > > > > On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> > > > > > On 08.01.2025 00:40, Stefano Stabellini wrote:
> > > > > > > On Tue, 7 Jan 2025, Jan Beulich wrote:
> > > > > > > > On 06.01.2025 19:48, Stefano Stabellini wrote:
> > > > > > > > > On Mon, 6 Jan 2025, Jan Beulich wrote:
> > > > > > > > > > On 04.01.2025 05:15, Denis Mukhin wrote:
> > > > > > > > > > > On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich jbeulich@suse.com wrote:
> > > > > > > > > > > > On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > > From: Denis Mukhin dmukhin@ford.com
> > > > > > > > > > > > > 
> > > > > > > > > > > > > console_owner_domid() is introduced to obtain the "console owner" domain ID.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The call is used in NS8250 emulator to identify the case when physical xen
> > > > > > > > > > > > > console focus is owned by the domain w/ NS8250 emulator, in which case,
> > > > > > > > > > > > > messages from guest OS are formatted w/o '(XEN)' prefix.
> > > > > > > > > > > > 
> > > > > > > > > > > > Such messages ought to be processed through guest_printk(), which wants a
> > > > > > > > > > > > domain pointer, not a domid_t anyway. Plus isn't that going to be
> > > > > > > > > > > > current->domain anyway at the callsite, eliminating the need for such a
> > > > > > > > > > > > 
> > > > > > > > > > > > helper altogether?
> > > > > > > > > > > 
> > > > > > > > > > > If the current domain is owning the physical console and printing, say, Linux
> > > > > > > > > > > login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> > > > > > > > > > > can be disabled from Xen command line.
> > > > > > > > > > 
> > > > > > > > > > Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
> > > > > > > > > > which domain a message came from. As long as only Dom0 messages are left un-
> > > > > > > > > > prefixed, that's likely fine. Yet as soon as multiple domains can issue such
> > > > > > > > > > messages (and have console "focus") I think the prefix needs to be there.
> > > > > > > > > 
> > > > > > > > > It looks like we are aligned on the desired behavior,
> > > > > > > > 
> > > > > > > > Hmm, no, I don't think we are. I don't ...
> > > > > > > > 
> > > > > > > > > but for clarity,
> > > > > > > > > see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
> > > > > > > > > here:
> > > > > > > > > 
> > > > > > > > > I think we should provide a consistent behavior across architectures.
> > > > > > > > > The current behavior with vpl011 and dom0less on ARM is the following:
> > > > > > > > > 
> > > > > > > > > - no prefix for Dom0 output
> > > > > > > > > - DOM$NUM for DomUs when not in focus, otherwise no prefix
> > > > > > > > 
> > > > > > > > ... view this model as a desirable one. It leaves room for ambiguity.
> > > > > > > 
> > > > > > > Adding a few more people in CC for feedback.
> > > > > > > 
> > > > > > > My priority is to keep the architectures aligned. It might be OK to
> > > > > > > change output format, but then let's do it uniformly on ARM as well.
> > > > > > > 
> > > > > > > Jan, please clarify what you think would be better than the above. Is it
> > > > > > > the following? I don't think I understood your preference.
> > > > > > > 
> > > > > > > - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix
> > > > > > 
> > > > > > No, I mean like we have it with guest_printk() today. (XEN) for Xen's
> > > > > > own messages, (d<N>) for ordinary domains' ones, and no prefix
> > > > > > exclusively for the hardware/control domain. What is best to do when
> > > > > > hardware and control domains are distinct I'm uncertain - I'd be
> > > > > > inclined to suggest that the hardware domain then stay the one without
> > > > > > any prefix.
> > > > > 
> > > > > One concern I have with this approach is whether the addition of the
> > > > > (d<N>) prefixes will skew output of interactive applications. So far
> > > > > the prefix is added to output from all domains different than dom0
> > > > > because the console is not interactive for them, and hence no input
> > > > > can be consumed.
> > > > 
> > > > Hmm, that's an aspect I have to admit I didn't think of.
> > > > 
> > > > > If that changes however, and domains different than dom0 can get input
> > > > > from the Xen console then I wonder how much the added prefix will skew
> > > > > output. Another possible option would be to not print the prefix for
> > > > > the domain that has the console input assigned (current target), and
> > > > > print it for all other domains (even for dom0 when not in focus).
> > > > 
> > > > That's largely what aiui was proposed. My extra requirement there would
> > > > then be that we make sure a log message is always emitted when console
> > > > focus shifts, so it's possible to identify the owner for any part of
> > > > the log.
> > > 
> > > 
> > > Indeed, printing console input shifting should be a requirement
> > > regardless of how we decide to print the prefix.
> > 
> > Console input focus switch is indicated after pressing Crtl+aaa, e.g.:
> > [[
> > ...
> > (XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to switch input)
> > (XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to switch input)
> > (XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to switch input)
> > ...
> > ]]
> 
> 
> Roger, Jan, you should use Xen Dom0less more :-) This is the way it
> already works on ARM. Let me expand on my earlier message that was too
> terse.

Hehe, I should use ARM more in general I think :).

> At boot time, Xen prints messages with the (XEN) prefix as usual:
> 
> (XEN) Brought up 4 CPUs
> 
> When Dom0 starts, it has not prefix (and has input by default):
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> 
> When a DomU starts, it has the following prefix (and doesn't have
> input):
> 
> (XEN) DOM1: [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> 
> 
> Eventually, both Linuxes finish booting, you can login into Dom0 as
> usual. Messages from Dom1, if any, are still printed with (XEN) DOM1 as
> prefix.
> 
> You can switch input to Dom1 with Ctrx-aaa, the same way that you do
> today to switch between Xen and Dom0. Xen prints a message:
> 
> (XEN) *** Serial input to DOM1 (type 'CTRL-a' three times to switch input)
> 
> Now, as you type, you send characters to Dom1. And Dom1 doesn't have the
> DOM1 prefix any longer, while it is still has (XEN) because the message
> is printed by Xen on behalf of the domain:
> 
> (XEN) / # echo hello world
> (XEN) hello world
> 
> If Dom0 prints anything in the backgrounds, it shows without prefixes:
> 
> hello world from dom0
> 
> If another domain, dom2, prints anything in the background, it shows
> with (XEN) DOM2 prefix:
> 
> (XEN) DOM2: hello from dom2
> 
> I think it makes sense to be consistent across architectures and we
> should default to the same behavior on x86 too. If we want to make
> improvements, the one thing I could potentially see changing is adding a
> DOM0 prefix to Dom0 messages when Dom0 does not have input. If we do
> that, let's do it on both ARM and x86 architectures.

The usual prefix is (d<domid>) IIRC, that's what guest_printk() uses,
is there any reason dom0less uses "(XEN) DOM<domid>:" instead of the
guest_printk() prefix?

My preference would be use to (d<domid>) prefix for any guest output
that doesn't belong to the domain that's the recipient of the input
(iow: not in console input focus).  And drop the (XEN) prefix from
guest output.

The rest looks all sensible to me.  I think we should avoid adding any
prefixes to guest output when it has the console focus, as otherwise
interactive applications might not work correctly.

Thanks, Roger.

