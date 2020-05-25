Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513A1E0533
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 05:36:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3t7-0000pK-Vb; Mon, 25 May 2020 03:34:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvLo=7H=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jd3t6-0000pF-Pq
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 03:34:52 +0000
X-Inumbo-ID: b0ff8bec-9e38-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ff8bec-9e38-11ea-b07b-bc764e2007e4;
 Mon, 25 May 2020 03:34:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g12so14582158wrw.1
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 20:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WFt2U/4Q6uJzgd+Uj0nMH6M2jMoWfRNDoTmzInOyY/Y=;
 b=LJVqcIqrLKhirSUV1vufxjx+7P1U/9qwNpOWwaQVbvLcqXp0R/069We4KqnnKykNr1
 khXf5CDrP9GQegVFbpZKtJMzZ0i0hrvsZVP/h8zMWD+e6v7Fj64iR97yHKtNNbuBjBYp
 kXZ4y2AJHua99QgUsb28m5Z7NRuV05X4RuDiyDgvN6wBOz24yZBTsoSwviWPFGbLgjRH
 dAFUNKN8zIISTqhQmxoPNtVSHNvYw76LeP0QWH3N4tavjvqr8faygILVz2toJh5fmc1s
 p1Z96oMrt4LV0FYKDNYIgOAJWboq41MrHDMkJtPjAFXDVhbbcNUablYGpgBY9Ep+Y0M3
 qN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WFt2U/4Q6uJzgd+Uj0nMH6M2jMoWfRNDoTmzInOyY/Y=;
 b=g+EAPiNHfn6CVbCdVZmC47uTc5/qccjNSSTCRrKNboz2I/znedIoq/4Qgv5gqCMGsw
 a0E7/2a0VlURBjnDoBKcok2ZvtBwlG0mHuzolMLzU139QRx+OSHTyys85dKHBQ6eD1SY
 LFY4HpHvInjkvmbNl3Av+yVrReoNht7Z5wB60YkuVen7M3KrtKkv6uQhJTmmJYTi6ZI/
 9jwOR91pI2EUEtS/JcqWeX0LyE8852PAFwvdzewHlk96383WXtOkNsPjdMYhV+bHNXNB
 i+3rC25Y6gOD3Z7X5JkaY3TvHXeV81LegK4FWyM7YLGN7oBUI4OS7iQw4hooisd8xzuW
 R4Hw==
X-Gm-Message-State: AOAM531wxlebn4rM/Xmdpyk6tStK/BlV875XbrX6jFLrzzGx6JayH9n5
 ZvTgIBihKTClmT9SibNgnf1If2s2tlh3Dmi87e0=
X-Google-Smtp-Source: ABdhPJz+dBDKGggBvE0hzelO51+s8kh+SkgfvijCDCKDVePO6KaytGax0SK1hpXNvXjsxj9ef8aDwpI1HWqFWaePdo4=
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr14012962wrq.182.1590377690927; 
 Sun, 24 May 2020 20:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <MWHPR11MB1645167038AA1273F6CC6D848CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1645167038AA1273F6CC6D848CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 24 May 2020 21:34:15 -0600
Message-ID: <CABfawhm6iOhiUuQg6ONQcKAjcg5H=jATFLM4YQ4BLwLkDBdX2A@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: "Tian, Kevin" <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Lengyel, Tamas" <tamas.lengyel@intel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, May 24, 2020 at 8:33 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Lengyel, Tamas <tamas.lengyel@intel.com>
> > Sent: Saturday, May 23, 2020 12:34 AM
> >
> > When running shallow forks without device models it may be undesirable for
> > Xen
>
> what is shallow forks? and why interrupt injection is not desired without
> device model? If it means just without Qemu thing, you still get local APIC
> interrupts such as timers, PMI, etc.

I refer to shallow forks as VM forks that run without a device model
(ie. QEMU). Effectively these are domains that run only with CPU and
memory, both of which are copied from the parent VM as needed. When an
interrupt is injected into a VM fork (because its state is copied from
a parent where an interrupt might be pending) the interrupt handler
might want to talk to the device model which is not present for the
fork. In such situations the VM fork ends up executing the interrupt
handler instead of the code we want to fuzz, which we want to avoid
for obvious reasons.

>
> > to inject interrupts. With Windows forks we have observed the kernel going
> > into
> > infinite loops when trying to process such interrupts, likely because it
> > attempts
>
> what is the relationship between shallow forks and windows forks then?

They are the same, but we only observed this behavior with Windows forks.

>
> > to interact with devices that are not responding without QEMU running. By
> > disabling interrupt injection the fuzzer can exercise the target code without
> > interference.
>
> what is the fuzzer?

https://github.com/intel/kernel-fuzzer-for-xen-project/

>
> >
> > Forks & memory sharing are only available on Intel CPUs so this only applies
> > to vmx.
>
> I feel lots of background is missing thus difficult to judge whether below change
> is desired...

You may find the VM forking series worthwhile to review to get some
context: https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg01162.html.
In a nutshell, it's an experimental feature geared towards fuzzing and
it's disabled by default (note that it's gated on CONFIG_MEM_SHARING
being enabled).

Tamas

