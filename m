Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC362A8881
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 22:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20167.45840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kamQb-0002M5-5V; Thu, 05 Nov 2020 21:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20167.45840; Thu, 05 Nov 2020 21:04:17 +0000
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
	id 1kamQb-0002Lj-24; Thu, 05 Nov 2020 21:04:17 +0000
Received: by outflank-mailman (input) for mailman id 20167;
 Thu, 05 Nov 2020 21:04:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kamQY-0002Ld-OW
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 21:04:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce768885-05cb-4fa2-896b-f48bf62dfbf9;
 Thu, 05 Nov 2020 21:04:12 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE36A20719;
 Thu,  5 Nov 2020 21:04:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kamQY-0002Ld-OW
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 21:04:14 +0000
X-Inumbo-ID: ce768885-05cb-4fa2-896b-f48bf62dfbf9
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ce768885-05cb-4fa2-896b-f48bf62dfbf9;
	Thu, 05 Nov 2020 21:04:12 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DE36A20719;
	Thu,  5 Nov 2020 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604610251;
	bh=RLXu6lmZAGdZwVlZF09rCSVfr+dJo4OlU+/n/lNHF5g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F4fIAMGRKwrpZMIABciM9OLFcQxKCqpxJ5QSCWtfPcbyUx+v9QZ+qGPuEdLTA3u2s
	 TKe2Eo9VaQWowuOpwXVvp4uL72NBZf0thKFm7rQLxwUVqSQYtc2ZFo5c3jTmYIP6Oi
	 EbxuzMNOJwCu/ulI0jTgAXx6kmqttGEZzt4MiIR0=
Date: Thu, 5 Nov 2020 13:04:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com, 
    Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for
 PCI ATS functionality.
In-Reply-To: <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
Message-ID: <alpine.DEB.2.21.2011051300450.2323@sstabellini-ThinkPad-T480s>
References: <cover.1604417224.git.rahul.singh@arm.com> <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com> <c9874396-44d2-b969-104f-eb40b4e107c9@suse.com> <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2020, Jan Beulich wrote:
> On 04.11.2020 16:43, Jan Beulich wrote:
> > On 03.11.2020 16:59, Rahul Singh wrote:
> >> --- a/xen/drivers/pci/Kconfig
> >> +++ b/xen/drivers/pci/Kconfig
> >> @@ -1,3 +1,12 @@
> >>  
> >>  config HAS_PCI
> >>  	bool
> >> +
> >> +config PCI_ATS
> >> +	bool "PCI ATS support"
> >> +	default y
> >> +	depends on X86 && HAS_PCI
> >> +	---help---
> >> +	 Enable PCI Address Translation Services.
> >> +
> >> +	 If unsure, say Y.
> > 
> > Support for "---help---" having gone away in Linux, I think we'd
> > better not add new instances. Also indentation of help content
> > typically is by a tab and two spaces. With these two adjusted
> > 
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Initially I wanted to merely reply indicating I'd be fine making
> these changes while committing, but there are two more things
> (and I withdraw my R-b): For one, isn't strict pci_dev's ats
> field now unused when !PCI_ATS? If so, if should get an #ifdef
> added. And then, what exactly is it in ats.c that's x86-specific?
> Shouldn't the whole file instead be moved one level up, and be
> usable by Arm right away?

If the issue is that ATS wouldn't work on ARM straight away, then I
think it would be best to make this a silent option like we did in patch
#1: if x86 && HAS_PCI -> automatically enable, otherwise disable. I
wouldn't move the code just yet, that's better done when we can actually
test it on ARM.

