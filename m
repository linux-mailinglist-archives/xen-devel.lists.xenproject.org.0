Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67F1A23D4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 16:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMBS4-00036Y-HB; Wed, 08 Apr 2020 14:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G77i=5Y=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1jMBS2-00036T-Ll
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 14:13:10 +0000
X-Inumbo-ID: 120e48c0-79a3-11ea-b4f4-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 120e48c0-79a3-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 14:13:08 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jMBRr-0007Ob-HA; Wed, 08 Apr 2020 16:12:59 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id A83CE10069D; Wed,  8 Apr 2020 16:12:58 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
Date: Wed, 08 Apr 2020 16:12:58 +0200
Message-ID: <87k12qawwl.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 peterz@infradead.org, hpa@zytor.com, Ankur Arora <ankur.a.arora@oracle.com>,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ankur Arora <ankur.a.arora@oracle.com> writes:
> A KVM host (or another hypervisor) might advertise paravirtualized
> features and optimization hints (ex KVM_HINTS_REALTIME) which might
> become stale over the lifetime of the guest. For instance, the
> host might go from being undersubscribed to being oversubscribed
> (or the other way round) and it would make sense for the guest
> switch pv-ops based on that.

If your host changes his advertised behaviour then you want to fix the
host setup or find a competent admin.

> This lockorture splat that I saw on the guest while testing this is
> indicative of the problem:
>
>   [ 1136.461522] watchdog: BUG: soft lockup - CPU#8 stuck for 22s! [lock_torture_wr:12865]
>   [ 1136.461542] CPU: 8 PID: 12865 Comm: lock_torture_wr Tainted: G W L 5.4.0-rc7+ #77
>   [ 1136.461546] RIP: 0010:native_queued_spin_lock_slowpath+0x15/0x220
>
> (Caused by an oversubscribed host but using mismatched native pv_lock_ops
> on the gues.)

And this illustrates what? The fact that you used a misconfigured setup.

> This series addresses the problem by doing paravirt switching at
> runtime.

You're not addressing the problem. Your fixing the symptom, which is
wrong to begin with.

> The alternative use-case is a runtime version of apply_alternatives()
> (not posted with this patch-set) that can be used for some safe subset
> of X86_FEATUREs. This could be useful in conjunction with the ongoing
> late microcode loading work that Mihai Carabas and others have been
> working on.

This has been discussed to death before and there is no safe subset as
long as this hasn't been resolved:

  https://lore.kernel.org/lkml/alpine.DEB.2.21.1909062237580.1902@nanos.tec.linutronix.de/

Thanks,

        tglx

