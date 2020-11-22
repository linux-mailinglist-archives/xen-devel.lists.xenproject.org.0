Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E912BC74F
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 17:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33385.64412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgsYi-0000wl-Kb; Sun, 22 Nov 2020 16:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33385.64412; Sun, 22 Nov 2020 16:49:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgsYi-0000wM-GO; Sun, 22 Nov 2020 16:49:52 +0000
Received: by outflank-mailman (input) for mailman id 33385;
 Sun, 22 Nov 2020 16:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08CP=E4=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
 id 1kgsYf-0000wH-7L
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 16:49:50 +0000
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1fe6885-f3bc-4e2a-add9-3225fa569524;
 Sun, 22 Nov 2020 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id AB0CF1280302;
 Sun, 22 Nov 2020 08:49:44 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id iwIwMm9lBMHQ; Sun, 22 Nov 2020 08:49:44 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CCD1012802EA;
 Sun, 22 Nov 2020 08:49:42 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=08CP=E4=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
	id 1kgsYf-0000wH-7L
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 16:49:50 +0000
X-Inumbo-ID: d1fe6885-f3bc-4e2a-add9-3225fa569524
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d1fe6885-f3bc-4e2a-add9-3225fa569524;
	Sun, 22 Nov 2020 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id AB0CF1280302;
	Sun, 22 Nov 2020 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606063784;
	bh=17TrMRtvefoo+nGHR97pCnj/lxz5M0xWRk4mlB4j/j4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=DJQ3WuSCh5ONJkQLvrRDKWjtqFtZT1TAPnAUYm6nnSis8bRSxmxTUdD1PrB7UWicY
	 RxKUvvDgawnlhMMDvZIHrNHIQxzEk4H+L7edJ9WYAgYp3e2Z+uWjpWqDuwMfVruTvK
	 GP/WMd/p5KAU/iZA/nGFhNVXHTmLoWjH8aSdKt9E=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwIwMm9lBMHQ; Sun, 22 Nov 2020 08:49:44 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CCD1012802EA;
	Sun, 22 Nov 2020 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606063784;
	bh=17TrMRtvefoo+nGHR97pCnj/lxz5M0xWRk4mlB4j/j4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=DJQ3WuSCh5ONJkQLvrRDKWjtqFtZT1TAPnAUYm6nnSis8bRSxmxTUdD1PrB7UWicY
	 RxKUvvDgawnlhMMDvZIHrNHIQxzEk4H+L7edJ9WYAgYp3e2Z+uWjpWqDuwMfVruTvK
	 GP/WMd/p5KAU/iZA/nGFhNVXHTmLoWjH8aSdKt9E=
Message-ID: <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Rix <trix@redhat.com>, Matthew Wilcox <willy@infradead.org>
Cc: joe@perches.com, clang-built-linux@googlegroups.com, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net, 
 kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org,  devel@acpica.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, 
 linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com, 
 linux-mtd@lists.infradead.org, keyrings@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 alsa-devel@alsa-project.org, bpf@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-nfs@vger.kernel.org, 
 patches@opensource.cirrus.com
Date: Sun, 22 Nov 2020 08:49:41 -0800
In-Reply-To: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
	 <20201122032304.GE4327@casper.infradead.org>
	 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
	 <20201122145635.GG4327@casper.infradead.org>
	 <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 08:10 -0800, Tom Rix wrote:
> On 11/22/20 6:56 AM, Matthew Wilcox wrote:
> > On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
> > > On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> > > > On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com
> > > > wrote:
> > > > > The fixer review is
> > > > > https://reviews.llvm.org/D91789
> > > > > 
> > > > > A run over allyesconfig for x86_64 finds 62 issues, 5 are
> > > > > false positives. The false positives are caused by macros
> > > > > passed to other macros and by some macro expansions that did
> > > > > not have an extra semicolon.
> > > > > 
> > > > > This cleans up about 1,000 of the current 10,000 -Wextra-
> > > > > semi-stmt warnings in linux-next.
> > > > Are any of them not false-positives?  It's all very well to
> > > > enable stricter warnings, but if they don't fix any bugs,
> > > > they're just churn.
> > > > 
> > > While enabling additional warnings may be a side effect of this
> > > effort
> > > 
> > > the primary goal is to set up a cleaning robot. After that a
> > > refactoring robot.
> > Why do we need such a thing?  Again, it sounds like more churn.
> > It's really annoying when I'm working on something important that
> > gets derailed by pointless churn.  Churn also makes it harder to
> > backport patches to earlier kernels.
> > 
> A refactoring example on moving to treewide, consistent use of a new
> api may help.
> 
> Consider
> 
> 2efc459d06f1630001e3984854848a5647086232
> 
> sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output
> 
> A new api for printing in the sysfs.  How do we use it treewide ?
> 
> Done manually, it would be a heroic effort requiring high level
> maintainers pushing and likely only get partially done.
> 
> If a refactoring programatic fixit is done and validated on a one
> subsystem, it can run on all the subsystems.
> 
> The effort is a couple of weeks to write and validate the fixer,
> hours to run over the tree.
> 
> It won't be perfect but will be better than doing it manually.

Here's a thought: perhaps we don't.  sysfs_emit isn't a "new api" its a
minor rewrap of existing best practice.  The damage caused by the churn
of forcing its use everywhere would far outweigh any actual benefit
because pretty much every bug in this area has already been caught and
killed by existing tools.  We can enforce sysfs_emit going forwards
using tools like checkpatch but there's no benefit and a lot of harm to
be done by trying to churn the entire tree retrofitting it (both in
terms of review time wasted as well as patch series derailed).

James



