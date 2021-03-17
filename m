Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA433F3BD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 15:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98732.187455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXZz-0006K1-81; Wed, 17 Mar 2021 14:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98732.187455; Wed, 17 Mar 2021 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXZz-0006Jc-4J; Wed, 17 Mar 2021 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 98732;
 Wed, 17 Mar 2021 14:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXZx-0006JX-Ja
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:55:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXZx-0008Ji-Ga
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:55:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXZx-00055F-Cc
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:55:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lMXZs-0002Hj-Ku; Wed, 17 Mar 2021 14:55:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Lppww/5fj3La1xHnXVfpjZMCX9yQLxDR3gk9pptxD4U=; b=ckdpDKPsP42KCltCnbYxZ81qDj
	fR9jmOH8YTveJfHFTJ35KopmDHljf7+ytoOtcP7DAYt3jKM+0CE7XoDy/zks9vzM8QWfLG4Qi0btv
	QUQj8Y4GjqaiumrB+ldVzbnwx5eduBBwp+Ld4BBB9E5ylGfOJs5J5hiSItIdEijvItpI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24658.6228.390535.850901@mariner.uk.xensource.com>
Date: Wed, 17 Mar 2021 14:55:16 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Call for tools backports (was Re: preparations for 4.13.3)
In-Reply-To: <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
	<b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: preparations for 4.13.3"):
> On 08/03/2021 09:49, Jan Beulich wrote:
> > All,
> > 
> > the release is overdue (my apologies). Please point out backports
> > you find missing from the respective staging branches, but which
> > you consider relevant.
> > > Ones that I have queued already, but which hadn't passed the push
> > gate to master yet when doing a swipe late last week, are
> > 
> > c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
> > 9318fdf757ec x86/shadow: suppress "fast fault path" optimization without reserved bits
> > 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when running virtualized
> 
> I would like to also consider the following one:
> 
> 28804c0ce9fd SUPPORT.MD: Clarify the support state for the Arm SMMUv{1, 
> 2} drivers (4.11+ as updating the security support)
> 067935804a8e xen/vgic: Implement write to ISPENDR in vGICv{2, 3} (4.13+)
>      To support newer kernel on stable Xen
> d81133d45d81 xen/arm: Add workaround for Cortex-A53 erratum #843419 (4.13+)
> fd7479b9aec2 xen/arm: Add workaround for Cortex-A55 erratum #1530923 (4.13+)
> 5505f5f8e7e8 xen/arm: Add Cortex-A73 erratum 858921 workaround (4.13+)
> 63b4c9bfb788 xen/arm: mm: Access a PT entry before the table is unmapped 
> (4.13 only)
> f6790389613c xen/arm: sched: Ensure the vCPU context is seen before 
> vcpu_pause() returns (4.13 only)
> 
> I have put in parentheses the list of versions targeted.

My backport list seems to have very few tools patches on it.

If anyone has any tools bugfixes that ought to go into 4.13 please do
let me know!

Additionally, perhaps this one commit to be backported ?
  935e0836710ce8cab584155b2844cea8497a5159
  arm: replace typeof() with __typeof__()

Thanks,
Ian.

