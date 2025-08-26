Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B0B356DE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 10:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094101.1449431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqp3C-0004X3-1A; Tue, 26 Aug 2025 08:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094101.1449431; Tue, 26 Aug 2025 08:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqp3B-0004VC-Up; Tue, 26 Aug 2025 08:29:05 +0000
Received: by outflank-mailman (input) for mailman id 1094101;
 Tue, 26 Aug 2025 08:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Or/=3G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uqp3A-0004V5-CU
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 08:29:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b68ac781-8256-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 10:28:59 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3cbb3ff70a0so142962f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 01:28:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c86a8ccd1bsm10661409f8f.27.2025.08.26.01.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 01:28:57 -0700 (PDT)
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
X-Inumbo-ID: b68ac781-8256-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756196938; x=1756801738; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3ik9ZfGn50+cjex7KRxQ4iDBCBuXli6mDkWTQm16mU=;
        b=pyTOLHicmzm2NYGkaXpRbGjc4Jib43iKCFvWEhjKq4q73SNxxgLnfAnriAUGNyYucB
         5FdYWoNsgbkqe0P4q4XhZjaQ0bKfwt0R1O8L3We768Wr9XgxT9GhIx0CzxEPvS0IgmKv
         zvhFcxplju1hbTFRfxwA7szvsFJbGUk4JMHGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756196938; x=1756801738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3ik9ZfGn50+cjex7KRxQ4iDBCBuXli6mDkWTQm16mU=;
        b=SNoUpVuZnQv6lsltdtZSmnYNzY3ceybYORnoD6AciB00dsomcnoqyCD3to88GwECPd
         McQ38/xK24R0nF2jGjXdemQUunoDkYthvHbpkXz4vqLUmCTseH4ItWXFYJ4aTezMxPZR
         UyGLE7ADatichsT0HquDEK/FxmLtMxDWlsj8FW0/U45Lkq5vIkrC3kB90Eo5exhX6x1r
         vTCB+FavvYfsf5Q4IpbD1ClzraqTLAFQK4a8XQyZppwHSe7fEnRJDgSDDKqMptVHnN/2
         DBOhAb9fZCAMNf1AlVX4elGusdDucsNdJKgc6RnmN0WHWNyZ93AMmB2A0vArr49cEE3t
         IqOw==
X-Gm-Message-State: AOJu0Yxo7358WKRveFLu8SWgfZxkjxTOx2rbWD7lEpN0Qwn9BSai7O33
	qcGeE70fFrXk9CluY/fu9iZpEbpdGwycUQ/9QlwKnoJosnBcMaXyG1f7JWCpLXRjj4MyYBGysWV
	Uy52T
X-Gm-Gg: ASbGnctzEMD/gSFR9rf4t+2A3QtYpFkb34WZvqls9g0bQkTkqRXOOIhGi7bv958LmsI
	VI3nuGXcfiEX1wAnFLYhgfxqUgKMY1/KaaHqqWJK0sUYGFr8U5tMgQW2uRCRD/XKqeERFahcREI
	YlIOnOtcRaHIOVoV70ukAsgoYyWy+bYMT70onWH8Sb1yGAMXqlf9caTbtMXgJeioX3RoMnUoYuH
	a2njWq4oGSSMW1myqhJZ5FW7g46ACLmIrXT15byOjY8Y8xn94YHRtg3YJwt+GS8GwWz7S0fKHeP
	QFWkH7PuRbI9ZGvC7HGmJi8K9dY3Arxaa/Dd+2gRjSgsy+TjeASjeYJ1ERJMf2yC+7FXEGsGAhi
	8obejADl5a1yp8JogeIRwxeVQkaCXEk4qBWpQA1KiAQB0Twkil9zXSWDyfOvE2UJ/CmSxb8QzwN
	KF
X-Google-Smtp-Source: AGHT+IEP9aEsr7hzeyuNfMvWh+tS0zpzGl4JNIYUw/vOdLvKNYN+TnAPh63BFq6a/6z+PJY/tl2iTw==
X-Received: by 2002:a05:6000:2891:b0:3c5:9fee:7998 with SMTP id ffacd0b85a97d-3c5dcdfab5bmr9224491f8f.47.1756196938287;
        Tue, 26 Aug 2025 01:28:58 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:28:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK1wSKTg5LcuzBDc@macbook.local>
References: <aK0St0oUkJzR9lO0@mail-itl>
 <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>

On Tue, Aug 26, 2025 at 08:16:56AM +0200, Jan Beulich wrote:
> On 26.08.2025 03:49, Marek Marczykowski-Górecki wrote:
> > Hi,
> > 
> > I'm hitting an MSI-X issue after rebooting the domU. The symptoms are
> > rather boring: on initial domU start the device (realtek eth card) works
> > fine, but after domU restart, the link doesn't come up (there is no
> > "Link is Up" message anymore). No errors from domU driver or Xen. I
> > tracked it down to MSI-X - if I force INTx (via pci=nomsi on domU
> > cmdline) it works fine. Convincing the driver to poll instead of waiting
> > for an interrupt also workarounds the issue.
> > 
> > I noticed also some interrupts are not cleaned up on restart. The list
> > of MSIs in 'Q' debug key output grows:
> > 
> >     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45 46 47 >
> >     restart sys-net domU
> >     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45 46 47 48 >
> >     restart sys-net domU
> >     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45 46 47 48 49 >
> > 
> > and 'M' output is:
> > 
> >     (XEN)  MSI-X   41 vec=b1 lowest  edge   assert  log lowest dest=00000001 mask=1/H /1
> >     (XEN)  MSI-X   42 vec=b9 lowest  edge   assert  log lowest dest=00000004 mask=1/HG/1
> >     (XEN)  MSI-X   43 vec=c1 lowest  edge   assert  log lowest dest=00000010 mask=1/HG/1
> >     (XEN)  MSI-X   44 vec=d9 lowest  edge   assert  log lowest dest=00000001 mask=1/HG/1
> >     (XEN)  MSI-X   45 vec=e1 lowest  edge   assert  log lowest dest=00000001 mask=1/HG/1
> >     (XEN)  MSI-X   46 vec=e9 lowest  edge   assert  log lowest dest=00000040 mask=1/HG/1
> >     (XEN)  MSI-X   47 vec=32 lowest  edge   assert  log lowest dest=00000004 mask=1/HG/1
> >     (XEN)  MSI-X   48 vec=3a lowest  edge   assert  log lowest dest=00000040 mask=1/HG/1
> >     (XEN)  MSI-X   49 vec=42 lowest  edge   assert  log lowest dest=00000010 mask=1/ G/1
> > 
> > And also, after starting and stopping the domU, `xl pci-assignable-remove 03:00.0`
> > makes pciback to complain:
> > 
> >     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X release failed (-16)
> > 
> > This is all running on Xen 4.19.3, but I don't see much changes in this
> > area since then.
> > 
> > Some more info collected at https://github.com/QubesOS/qubes-issues/issues/9335
> > 
> > My question is: what should be responsible for this cleanup on domain
> > destroy? Xen, or maybe device model (which is QEMU in stubdomain here)?
> 
> The expectation is that qemu invokes the necessary cleanup, but of course ...
> 
> > I see some cleanup (apparently not enough) happening via QEMU when the
> > domU driver is unloaded, but logically correct cleanup shouldn't depend
> > on correct domU operation...
> 
> ... Xen may not make itself dependent upon either DomU or QEMU.

AFAICT free_domain_pirqs() called by arch_domain_destroy() should take
care of unbinding and freeing pirqs (but obviously not in this case).
Can you repeat the test with a debug=y hypervisor and post the
resulting serial or dmesg here?  Some of the errors on those paths are
printed with dprintk() and won't be visible unless using a Xen debug
build.

> What I find puzzling (assuming I can take the quoted output plus your annotations
> verbatim) is that the device apparently uses multiple vectors, and we're leaking
> exactly one of them. Also, since reboot is generally nothing else than shutdown
> and immediate relaunch, is there a leak also after shutdown? I ask because it
> might help to know which of the multiple vectors is leaked (first, last, random).

Can we maybe get the output of `lspci -vv` when the device is
attached?

Thanks, Roger.

