Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118EB1E43FA
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 15:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdwGv-0005ew-6S; Wed, 27 May 2020 13:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0l=7J=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdwGt-0005er-Pf
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 13:39:03 +0000
X-Inumbo-ID: 6cec3d36-a01f-11ea-8993-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cec3d36-a01f-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 13:39:02 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:34504
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdwGr-000762-Lf (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 27 May 2020 14:39:01 +0100
Subject: Re: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
To: Florian Weimer <fweimer@redhat.com>, xen-devel@lists.xenproject.org
References: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
Date: Wed, 27 May 2020 14:39:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: libc-alpha@sourceware.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/05/2020 14:03, Florian Weimer wrote:
> I'm about to remove nosegneg support from upstream glibc, special builds
> that use -mno-tls-direct-seg-refs, and the ability load different
> libraries built in this mode automatically, when the Linux kernel tells
> us to do that.  I think the intended effect is that these special builds
> do not use operands of the form %gs:(%eax) when %eax has the MSB set
> because that had a performance hit with paravirtualization on 32-bit
> x86.  Instead, the thread pointer is first loaded from %gs:0, and the
> actual access does not use a segment prefix.
>
> Before doing that, I'd like to ask if anybody is still using this
> feature?
>
> I know that we've been carrying nosegneg libraries for many years, in
> some cases even after we stopped shipping 32-bit kernels. 8-/ The
> feature has always been rather poorly documented, and the way the
> dynamic loader selects those nosegneg library variants is still very
> bizarre.

I wasn't even aware of this feature, or that there was a problem wanting
fixing.

That said, I have found:

# 32-bit x86 does not perform well with -ve segment accesses on Xen.
CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)

in one of our makefiles.

Why does the MSB make any difference?  %gs still needs to remain intact
so the thread pointer can be pulled out, so there is nothing that Xen or
Linux can do in the way of lazy loading.

Beyond that, its straight up segment base semantics in x86.  There will
be a 1-cycle AGU delay from a non-zero base, but that nothing to do with
Xen and applies to all segment based TLS accesses on x86, and you'll win
that back easily through reduced register pressure.

Are there any further details on the perf problem claim?  I find it
suspicious.


Either way, 32bit PV is on its last legs (not too bad, for something
which was essentially killed by the AMD64 spec).

Ring 1 counting as supervisor mode as far as pagetables goes has already
caused guests to suffer a major performance hit on hardware with
SMAP/SMEP (IvyBridge and later), as well as various speculative
mitigations (we can't rely on SMEP preventing the CPU from speculating
back into Ring 1, etc), and the forthcoming CET Shadow Stack feature
totally kills Ring1/2 as usable concepts in the architecture.

Linux is threatening to drop PV32 support, and I've recently added an
option to Xen to compile out and/or disable PV32 (both for attack
surface reduction purposes, and as a necessary consequence of using
Shadow Stacks).

With both my XenServer and upstream x86 maintainers hats on, PV32 is
solely for legacy workloads now.  People currently using PV32 obviously
don't care about performance, or haven't been taking security updates. 
I severely doubt they'll notice any change from this.

~Andrew

