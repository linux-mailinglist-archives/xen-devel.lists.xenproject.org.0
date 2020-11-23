Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17D82BFDDD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 01:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33585.64689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh07M-0006oi-CF; Mon, 23 Nov 2020 00:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33585.64689; Mon, 23 Nov 2020 00:54:08 +0000
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
	id 1kh07M-0006oJ-8k; Mon, 23 Nov 2020 00:54:08 +0000
Received: by outflank-mailman (input) for mailman id 33585;
 Mon, 23 Nov 2020 00:54:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eYGc=E5=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kh07K-0006oE-Ik
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 00:54:06 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.118])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c962261-e1a7-4c4a-8f70-940e7b13b1b2;
 Mon, 23 Nov 2020 00:54:05 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2D37318029125;
 Mon, 23 Nov 2020 00:54:05 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Nov 2020 00:53:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eYGc=E5=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kh07K-0006oE-Ik
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 00:54:06 +0000
X-Inumbo-ID: 6c962261-e1a7-4c4a-8f70-940e7b13b1b2
Received: from smtprelay.hostedemail.com (unknown [216.40.44.118])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6c962261-e1a7-4c4a-8f70-940e7b13b1b2;
	Mon, 23 Nov 2020 00:54:05 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2D37318029125;
	Mon, 23 Nov 2020 00:54:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2911:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:4250:4321:4425:5007:6119:6691:6742:6743:7903:10004:10400:10848:11026:11232:11658:11914:12296:12297:12555:12740:12760:12895:13069:13161:13229:13311:13357:13439:14659:14721:21080:21433:21627:21740:30041:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: steam95_4513bd127361
X-Filterd-Recvd-Size: 3177
Received: from XPS-9350.home (unknown [47.151.128.180])
	(Authenticated sender: joe@perches.com)
	by omf02.hostedemail.com (Postfix) with ESMTPA;
	Mon, 23 Nov 2020 00:53:59 +0000 (UTC)
Message-ID: <21826b6d513c4d9ccc795179c1edb0df2361d870.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: Finn Thain <fthain@telegraphics.com.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Tom Rix
 <trix@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
 clang-built-linux@googlegroups.com, linux-hyperv@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
 tboot-devel@lists.sourceforge.net, kvm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org,
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
Date: Sun, 22 Nov 2020 16:53:58 -0800
In-Reply-To: <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
References: <20201121165058.1644182-1-trix@redhat.com>
	         <20201122032304.GE4327@casper.infradead.org>
	         <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
	         <20201122145635.GG4327@casper.infradead.org>
	         <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
	 <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
	 <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
	 <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 09:33 +1100, Finn Thain wrote:
> On Sun, 22 Nov 2020, Joe Perches wrote:

> > But provably correct conversions IMO _should_ be done and IMO churn 
> > considerations should generally have less importance.
[]
> Moreover, the patch review workload for skilled humans is being generated 
> by the automation, which is completely backwards: the machine is supposed 
> to be helping.

Which is why the provably correct matters.

coccinelle transforms can be, but are not necessarily, provably correct.

The _show transforms done via the sysfs_emit_dev.cocci script are correct
as in commit aa838896d87a ("drivers core: Use sysfs_emit and sysfs_emit_at
for show(device *...) functions")

Worthwhile?  A different question, but I think yes as it reduces the
overall question space of the existing other sprintf overrun possibilities.



