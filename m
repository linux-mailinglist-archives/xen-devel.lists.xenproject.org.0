Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E58AD944
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 01:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710251.1109393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz3KS-0000Ri-Df; Mon, 22 Apr 2024 23:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710251.1109393; Mon, 22 Apr 2024 23:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz3KS-0000Pq-B7; Mon, 22 Apr 2024 23:44:08 +0000
Received: by outflank-mailman (input) for mailman id 710251;
 Mon, 22 Apr 2024 23:44:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBKa=L3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rz3KR-0000Pk-IR
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 23:44:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 332cb7b3-0102-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 01:44:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B5F1CCE0B87;
 Mon, 22 Apr 2024 23:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4147C113CC;
 Mon, 22 Apr 2024 23:43:55 +0000 (UTC)
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
X-Inumbo-ID: 332cb7b3-0102-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713829436;
	bh=ftdY5MoPlJRlourWN0hBdjtDsuTbiYYQLOZr8pjKMOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YcqxJb49SxdttTBjZXKmZZ8PolJ2OlUeYJzPfaUNFqIJVjfgDPwkCQUHQciBIIhUO
	 WU3hcbXkQwc3TY+dl/Ui/R1fFnP4kLFLtOzdyp7X5pJmRRP//ZA6WaL/soClkZn55i
	 L869oiEEL8PNjLP2ByYnzNe+OTiEouTLy76SAYEW142O1QdtZjBVU/4tZfcW4rkSvY
	 opRicgUvkR/VGh1NX5edCj3U8t/qLgm74kSph9vU0nhoUb20ITQauDSESLRTxJDFJU
	 n9OePTtDqY3T1l9GqH+kdGJ28Gw9WzrVIhOl6DT2XoNdZDMwXNp/ImUlED6OcE/W2b
	 19tWdDfCHK9jg==
Date: Mon, 22 Apr 2024 16:43:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: George Dunlap <george.dunlap@cloud.com>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, zithro <slack@rabbit.lu>, 
    xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@cloud.com>
Subject: Re: Detecting whether dom0 is in a VM
In-Reply-To: <5154b22a-747a-435c-9bd2-1716b7d3303d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404221643310.2917619@ubuntu-linux-20-04-desktop>
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com> <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com> <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu> <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com> <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com> <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com> <CA+zSX=bCC8A06t_gSpYCjxG1BZoC2EWnHhYAQtTM6b0WyzyZNA@mail.gmail.com>
 <CA+zSX=Zfnp7g1dSLb4WATShC2o4u-sULniccmW9-2AjBLH9zTg@mail.gmail.com> <5154b22a-747a-435c-9bd2-1716b7d3303d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1684106491-1713829437=:2917619"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1684106491-1713829437=:2917619
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Apr 2024, Jan Beulich wrote:
> On 19.04.2024 17:29, George Dunlap wrote:
> > On Fri, Jul 7, 2023 at 3:56 PM George Dunlap <george.dunlap@cloud.com> wrote:
> >>>>>> Xen's public interface offers access to the featuresets known / found /
> >>>>>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
> >>>>>> via xc_get_cpu_featureset().
> >>>>>>
> >>>>>
> >>>>> Are any of these exposed in dom0 via sysctl, or hypfs?
> >>>>
> >>>> sysctl - yes (as the quoted name also says). hypfs no, afaict.
> >>>>
> >>>>>  SYSCTLs are
> >>>>> unfortunately not stable interfaces, correct?  So it wouldn't be practical
> >>>>> for systemd to use them.
> >>>>
> >>>> Indeed, neither sysctl-s nor the libxc interfaces are stable.
> >>>
> >>> Thinking of it, xen-cpuid is a wrapper tool around those. They may want
> >>> to look at its output (and, if they want to use it, advise distros to
> >>> also package it), which I think we try to keep reasonably stable,
> >>> albeit without providing any guarantees.
> >>
> >>
> >> We haven't had any clear guidance yet on what the systemd team want in the <xen in a VM, systemd in a dom0> question; I just sort of assumed they wanted the L-1 virtualization *if possible*.  It sounds like `vm-other` would be acceptable, particularly as a fall-back output if there's no way to get Xen's picture of the cpuid.
> >>
> >> It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and the old Virt SIG CentOS packages; so I'd expect most packages to follow suit.  That's a place to start.
> >>
> >> Just to take the discussion all the way to its conclusion:
> >>
> >> - Supposing xen-cpuid isn't available, is there any other way to tell if Xen is running in a VM from dom0?
> >>
> >> - Would it make sense to expose that information somewhere, either in sysfs or in hypfs (or both?), so that eventually even systems which may not get the memo about packaging xen-cpuid will get support (or if the systemd guys would rather avoid executing another process if possible)?
> > 
> > Resurrecting this thread.
> > 
> > To recap:
> > 
> > Currently, `systemd-detect-virt` has the following  input / output table:
> > 
> > 1. Xen on real hardware, domU: xen
> > 2. Xen on real hardware, dom0: vm-other
> > 3. Xen in a VM, domU: xen
> > 4. Xen in aVM, dom0: vm-other
> > 
> > It's the dom0 lines (2 and 4) which are problematic; we'd ideally like
> > those to be `none` and `vm-other` (or the actual value, like `xen` or
> > `kvm`).
> > 
> > It looks like ATM, /proc/xen/capabilities will contain `control_d` if
> > it's a dom0.  Simply unilaterally returning `none` if
> > /proc/xen/capabilities contains `control_d` would correct the vast
> > majority of instances (since the number of instances of Xen on real
> > hardware is presumably higher than the number running virtualized).
> > 
> > Is /proc/xen/capabilities expected to stay around?  I don't see
> > anything equivalent in /dev/xen.
> 
> I believe it's intended to stay around, but a definitive answer can only
> come from Linux folks. Jürgen, Stefano?

No plans to get rid of /proc/xen/capabilities that I am aware
--8323329-1684106491-1713829437=:2917619--

