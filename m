Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE271E1034
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdDsi-0006na-6E; Mon, 25 May 2020 14:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZKA=7H=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jdDsf-0006nV-Th
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:15:05 +0000
X-Inumbo-ID: 21200952-9e92-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21200952-9e92-11ea-b07b-bc764e2007e4;
 Mon, 25 May 2020 14:15:05 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e10so15141579edq.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucr8+ugM3xNV+eS4h/rXd6GByzTSfj97ee8k7HUgYww=;
 b=n8N76yKOdxWyw4pK+GJ6QORn+G0BWsunOktbSHPz8fXQfNd48OqbtBbJDdEBzW4Nm0
 knBXRkzma1MDyZh/8EfN/ZeMvKxXgsHdQWudTIOrrqX8P3pJAcfOgshvC2IWJcNNK1Jv
 eRASkR2KVV160GqqY6357l9kLC7GTvKzNJ+rUVYzsBbVw3T0IVfaG+yI21pkL/g56LVl
 99rHoIfWGd5txj6bkD4sbmKMbhV744GKkdZLppSeUAl9Jr70DBmpswXklB7A2Szg3IwL
 R7X5nTm1PAPraX2UQROsr+pNqsh/JfXjlWZmP4LKWP1NWZldtpxkut8E/DI5NY8sQYIK
 agEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucr8+ugM3xNV+eS4h/rXd6GByzTSfj97ee8k7HUgYww=;
 b=RvRkIxELtdBRgSXqxMb6LkiYpwRBlmL1gO4YTgq5SdqWJ1mM6Tqydd/iva1Pw9tn4w
 bA6A4l5cN2ky780IPG4FrDeKy6fyjJAPj8l/jVlfH5cQMfR2ERm5X7ENT+JcEre+vb2H
 zaXaNN3nmf8Bh8VY0FpyT1EwvByD87c3m8/82Xzjlrglz4TITUOtB4chZOoizyKJP9sS
 0fT9D7e+Vcq5qz5iNQudm5kdjkezpBWKtB8QlgTaDwuNNdzNbPd4/Unnl9Ymw2O+EW4V
 PHAiSpAFyJ4hS5eqIm4qntBnbXNSJoj6Cw1o4LHz0ghJOL9nPoJ3oyN4SBnOvpxXYfjT
 ewXw==
X-Gm-Message-State: AOAM530MOHj0m2J8piY45Uu1z7LBP1cVXca4S++Eq/YVbnue39rNEKv4
 e9M+aB00WGLzS5w8clGLr3/TtW4WLIY=
X-Google-Smtp-Source: ABdhPJxVit5FhbsyL55qOXqUluLSKrW0X/ikjdLQhRnylUUM84QzLRaNBydIAIgZc4XBda/prnVtAg==
X-Received: by 2002:a50:a985:: with SMTP id n5mr15715676edc.338.1590416103820; 
 Mon, 25 May 2020 07:15:03 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id o18sm15668538eji.97.2020.05.25.07.15.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 07:15:03 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id q11so5058620wrp.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 07:15:02 -0700 (PDT)
X-Received: by 2002:a5d:5707:: with SMTP id a7mr15180113wrv.259.1590416102538; 
 Mon, 25 May 2020 07:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
 <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
 <e5a2899c-f375-55e8-fc6c-940b70929ae6@suse.com>
 <CABfawhnB4WY6U-XcigT+X=n4e8qdDMFokMWR1Sc_s-oMeyZRWg@mail.gmail.com>
 <78714288-89b0-6a53-4f74-f2306ae6e749@suse.com>
In-Reply-To: <78714288-89b0-6a53-4f74-f2306ae6e749@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 May 2020 08:14:27 -0600
X-Gmail-Original-Message-ID: <CABfawhkMzpekYLqXqZZZ5Mxum-eHqMAWvAguaRakFasJKtPfFQ@mail.gmail.com>
Message-ID: <CABfawhkMzpekYLqXqZZZ5Mxum-eHqMAWvAguaRakFasJKtPfFQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 8:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.05.2020 15:46, Tamas K Lengyel wrote:
> > On Mon, May 25, 2020 at 7:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 25.05.2020 14:18, Tamas K Lengyel wrote:
> >>> On Mon, May 25, 2020 at 12:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 22.05.2020 18:33, Tamas K Lengyel wrote:
> >>>>> When running shallow forks without device models it may be undesirable for Xen
> >>>>> to inject interrupts. With Windows forks we have observed the kernel going into
> >>>>> infinite loops when trying to process such interrupts, likely because it attempts
> >>>>> to interact with devices that are not responding without QEMU running. By
> >>>>> disabling interrupt injection the fuzzer can exercise the target code without
> >>>>> interference.
> >>>>>
> >>>>> Forks & memory sharing are only available on Intel CPUs so this only applies
> >>>>> to vmx.
> >>>>
> >>>> Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
> >>>> this. Would you mind pointing me at where this restriction is coming from?
> >>>
> >>> Both mem_access and mem_sharing are only implemented for EPT:
> >>> http://xenbits.xen.org/hg/xen-unstable.hg/file/5eadf9363c25/xen/arch/x86/mm/p2m-ept.c#l126.
> >>
> >> p2m-pt.c:p2m_type_to_flags() has a similar case label.
> >
> > It doesn't do anything though, does it? For mem_sharing to work you
> > actively have to restrict the memory permissions on the shared entries
> > to be read/execute only. That's only done for EPT.
>
> Does it not? I seems to me that it does, seeing the case sits
> together with the p2m_ram_ro and p2m_ram_logdirty ones:
>
>     case p2m_ram_ro:
>     case p2m_ram_logdirty:
>     case p2m_ram_shared:
>         return flags | P2M_BASE_FLAGS;
>
> >> And I can't
> >> spot a respective restriction in mem_sharing_memop(), i.e. it looks
> >> to me as if enabling mem-sharing on NPT (to satisfy hap_enabled()
> >> in mem_sharing_control()) would be possible.
> >
> > If you are looking for an explicit gate like that, then you are right,
> > there isn't one. You can ask the original authors of this subsystem
> > why that is. If you feel like adding an extra gate, I wouldn't object.
>
> Well, the question here isn't about gating - that's an independent
> bug if it's indeed missing. The question is whether SVM code also
> needs touching, as was previously requested. You tried to address
> this by stating an Intel-only limitation, which I couldn't find
> proof for (so far).

Well, as far as I'm concerned VM forking is for Intel hardware only.
If mem_sharing seems to work for non-Intel hw - I was unaware of that
- than I'll just add an extra check for the VM fork hypercall that
gates it. It may be possible for technically be made available for
other hw as well, but at this time that's completely out-of-scope.

Tamas

