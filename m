Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16518406035
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183732.332041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTk6-0008PE-MZ; Thu, 09 Sep 2021 23:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183732.332041; Thu, 09 Sep 2021 23:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTk6-0008NL-JM; Thu, 09 Sep 2021 23:46:06 +0000
Received: by outflank-mailman (input) for mailman id 183732;
 Thu, 09 Sep 2021 23:46:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOTk5-0008NF-64
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:46:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17de3832-11c8-11ec-b1ff-12813bfff9fa;
 Thu, 09 Sep 2021 23:46:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA98F610C8;
 Thu,  9 Sep 2021 23:46:02 +0000 (UTC)
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
X-Inumbo-ID: 17de3832-11c8-11ec-b1ff-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631231163;
	bh=qCHuprjemJfJf5P4BSEt414s3j0OwdMpC9rBbvIuo9c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bdjwFSME/PYNs67qR+Y/nzejh2okMKWu+IyHqyUjT5alRNfbs0WAglnHwYQwQDRq3
	 h+QV1Bv1kfWbWEN+oMFJtmr6ywgXvGkmmbXZ1k9FWYyQo/foSpsv6NW2PmHOo1wxrd
	 yMoTc5dhIJJpBbJUfJn0Mia2bN/pKEsCYV6vcwp6owyzij0bKOcylVnyYkUzjJp/Wc
	 UAPr5QZBs7PcXcLVksVuF0SIGssOqCubXQMnNZab5fYstoiQ8djGk9H1HHjaWMczcM
	 J+3l2bTHCPwv3dBIhJYUEEO2VXcppNh2KOEKTHZuRkvr+9OAb4FCyprQRD60odlJjp
	 J8edMbYR6B6Yg==
Date: Thu, 9 Sep 2021 16:46:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
In-Reply-To: <f9c4837c-085d-d7a3-d79d-a77c6b5bf201@suse.com>
Message-ID: <alpine.DEB.2.21.2109091645270.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com> <731afb80-bb68-0c66-4f0f-341a46118770@xen.org> <DBFA6CEF-F8BC-4516-B609-99985F0C4698@arm.com> <b17f7970-ec4c-96e8-1a1c-0d3039d4d43e@xen.org>
 <f9c4837c-085d-d7a3-d79d-a77c6b5bf201@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Aug 2021, Jan Beulich wrote:
> On 20.08.2021 16:34, Julien Grall wrote:
> > On 20/08/2021 13:19, Rahul Singh wrote:
> >>> On 19 Aug 2021, at 1:31 pm, Julien Grall <julien@xen.org> wrote:
> >>> On 19/08/2021 13:02, Rahul Singh wrote:
> >>>> Add cmdline boot option "pci=on" to enable/disable the PCI init during
> >>>> boot.
> >>>
> >>> I read this as "PCI" will be either disabled/enabled for the platform. Whereas, I think it will be used to decide whether Xen discover PCI and PCI passthrough is supported or not.
> >>
> >> Yes. I will modify the option to "pci-passthrough== <boolean>"
> >>>
> >>> Can you also clarify why a user would want to select "pci=off"?
> >>
> >> As pci-passthrough support emulate the PCI devices for DOM0 also, I thought if someone want to
> >> boot the DOM0 without emulating the PCI device in XEN and wants to have direct access to device.
> > 
> > Dom0 will always have direct access to the PCI device. The only 
> > difference is whether the access to the hostbridge and config space will 
> > be trapped by Xen. I expect the both to mainly happen during boot and 
> > therefore the overhead will be limited.
> > 
> >>
> >> I am ok to drop this patch if you feel adding the option is not required at all.
> > One of the reason I could see this option to be useful is to figure out 
> > if an issue occurs because of the hostbridge emulation. Yet, I am still 
> > not fully convinced adding an option is worth it.
> > 
> > Jan and others, any opinions?
> 
> Well, if there's a proper fallback, then why not allow using it in
> case of problems?

I think it would be good to have the option, if nothing else for
debugging.

