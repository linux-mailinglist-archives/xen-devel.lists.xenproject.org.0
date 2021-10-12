Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D692742AF45
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 23:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207683.363578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPd3-0008J9-Or; Tue, 12 Oct 2021 21:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207683.363578; Tue, 12 Oct 2021 21:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPd3-0008Gt-Lf; Tue, 12 Oct 2021 21:48:09 +0000
Received: by outflank-mailman (input) for mailman id 207683;
 Tue, 12 Oct 2021 21:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maPd1-0008GU-Ae
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 21:48:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c972439-c221-44e4-82f6-6f4797510a08;
 Tue, 12 Oct 2021 21:48:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AB6060F92;
 Tue, 12 Oct 2021 21:48:05 +0000 (UTC)
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
X-Inumbo-ID: 1c972439-c221-44e4-82f6-6f4797510a08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634075286;
	bh=tbto5fAni3B84AbFpdLv1HG9sxkBTBmcZ9Ze4Du/azA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pELu/u/M9yHjuoxsQgIRPP6MPOPS8ZrAMPKHBrMiATyABtNvggm4TJXlrwGmZ0cYB
	 1u3Ykcnm9r/fISXUYLVr7Z4plDnutssw6PkIFYrt+qWzXlJGrLsmBB4LdWPQynHunM
	 YKv26m+CVimybHQGyB1IypxZnnWcU5BiZusSYyakBemzxfuJxER/T/4kixqtpNoT9u
	 Bkt9zI86Dhx1RQ/iBTxn/Y0fSFv/UZ1XrF0JmMrmJYleFByKt0iH1hXWC7oFJNwHvE
	 kAvLW4R1i4l+ahqIQtXAJE34rdrE/XafTCJgkP1UX4ames1+o4l3HdLiwH69vcoxsI
	 fMdfM78C5DYDw==
Date: Tue, 12 Oct 2021 14:48:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Andre.Przywara@arm.com, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci
 flag
In-Reply-To: <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
Message-ID: <alpine.DEB.2.21.2110121439100.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com> <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-664768228-1634074774=:9408"
Content-ID: <alpine.DEB.2.21.2110121439400.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-664768228-1634074774=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110121439401.9408@sstabellini-ThinkPad-T480s>

On Mon, 11 Oct 2021, Roger Pau Monné wrote:
> On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
> > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> > Reject the use of this new flag for x86 as VPCI is not supported for
> > DOMU guests for x86.
> 
> I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
> PVH dom0, like we do for any other CDF flags when Xen builds dom0.
> 
> Things like PVH vs PV get translated into CDF flags by create_dom0,
> and processed normally by the sanitise_domain_config logic, vPCI
> should be handled that way.
> 
> Do you think you could see about fixing this?

Andrew suggested to use XEN_SYSCTL_PHYSCAP_vpci to check whether we can
set XEN_DOMCTL_CDF_vpci in libxl and it looks like we have consensus on
this approach. [1][2]

So it makes sense that XEN_DOMCTL_CDF_vpci is only set when
XEN_SYSCTL_PHYSCAP_vpci is also set, i.e. XEN_SYSCTL_PHYSCAP_vpci ==
XEN_DOMCTL_CDF_vpci.

From [2], XEN_SYSCTL_PHYSCAP_vpci is not going to be set on x86, so then
XEN_DOMCTL_CDF_vpci should also be left unset?

If you think XEN_DOMCTL_CDF_vpci should be set for x86 PVH Dom0, then
XEN_SYSCTL_PHYSCAP_vpci should also be set for x86 PVH Dom0.


[1] https://marc.info/?l=xen-devel&m=163372953907637
[2] https://marc.info/?l=xen-devel&m=163395821428850
--8323329-664768228-1634074774=:9408--

