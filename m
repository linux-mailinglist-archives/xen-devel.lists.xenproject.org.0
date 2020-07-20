Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4073B2272C8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 01:24:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxf89-0003ao-Im; Mon, 20 Jul 2020 23:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt7f=A7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxf87-0003aj-M1
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 23:23:31 +0000
X-Inumbo-ID: 05938482-cae0-11ea-84d0-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05938482-cae0-11ea-84d0-bc764e2007e4;
 Mon, 20 Jul 2020 23:23:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B905A2080D;
 Mon, 20 Jul 2020 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595287410;
 bh=YCX2kVb8OMjeEDbNJaboAW7lEFLWf9Pi5pJJtP+Mr6s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=o/gcXCGXKPYiuxta9p3NqUMaJbyq2+oFYwCYsT10P4ZnmibWNzzFCgQCnxHCUvWab
 9ER5oiTVIw1hYCYwkkGi+iJre426xvbuyru+tOh41E4WVedbpfTJd/QXwFiE67oj4/
 ZV4tgvkd98ruidLCpbBwSzQ7ctCUZ62w2bfqkYqc=
Date: Mon, 20 Jul 2020 16:23:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
In-Reply-To: <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
Message-ID: <alpine.DEB.2.21.2007201509350.32544@sstabellini-ThinkPad-T480s>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Jul 2020, Bertrand Marquis wrote:
> > On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 17.07.2020 15:59, Bertrand Marquis wrote:
> >> 
> >> 
> >>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
> >>> 
> >>> On 17.07.2020 15:14, Bertrand Marquis wrote:
> >>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> On 16.07.2020 19:10, Rahul Singh wrote:
> >>>>>> # Emulated PCI device tree node in libxl:
> >>>>>> 
> >>>>>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> >>>>> 
> >>>>> I support Stefano's suggestion for this to be an optional thing, i.e.
> >>>>> there to be no need for it when there are PCI devices assigned to the
> >>>>> guest anyway. I also wonder about the pci_ prefix here - isn't
> >>>>> vpci="ecam" as unambiguous?
> >>>> 
> >>>> This could be a problem as we need to know that this is required for a guest upfront so that PCI devices can be assigned after using xl.> >>> 
> >>> I'm afraid I don't understand: When there are no PCI device that get
> >>> handed to a guest when it gets created, but it is supposed to be able
> >>> to have some assigned while already running, then we agree the option
> >>> is needed (afaict). When PCI devices get handed to the guest while it
> >>> gets constructed, where's the problem to infer this option from the
> >>> presence of PCI devices in the guest configuration?
> >> 
> >> If the user wants to use xl pci-attach to attach in runtime a device to a guest, this guest must have a VPCI bus (even with no devices).
> >> If we do not have the vpci parameter in the configuration this use case will not work anymore.
> > 
> > That's what everyone looks to agree with. Yet why is the parameter needed
> > when there _are_ PCI devices anyway? That's the "optional" that Stefano
> > was suggesting, aiui.
> 
> I agree in this case the parameter could be optional and only required if not PCI device is assigned directly in the guest configuration.

Great!

Moreover, we might also be able to get rid of the vpci parameter in
cases where are no devices assigned at boot time but still we want to
create a vpci host bridge in domU anyway. In those cases we could use
the following:

  pci = [];

otherwise, worse but it might be easier to implement in xl:

  pci = [""];

