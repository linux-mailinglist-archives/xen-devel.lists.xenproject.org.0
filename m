Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA983941F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 17:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670529.1043382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSJEw-0005qq-Fy; Tue, 23 Jan 2024 16:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670529.1043382; Tue, 23 Jan 2024 16:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSJEw-0005of-D7; Tue, 23 Jan 2024 16:03:06 +0000
Received: by outflank-mailman (input) for mailman id 670529;
 Tue, 23 Jan 2024 16:03:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amTM=JB=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1rSJEu-0005oZ-F4
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 16:03:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13e0608-ba08-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 17:03:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4D378CE2F25;
 Tue, 23 Jan 2024 16:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE89C433F1;
 Tue, 23 Jan 2024 16:02:54 +0000 (UTC)
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
X-Inumbo-ID: e13e0608-ba08-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025774;
	bh=fBQWnLEBcYKTR5Qq7Ag6Kr3ZXGVUxHSMlcYjRnrDpCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=W6h4Q+yW/ndZBGBIYtAlkUk50X2t2NYM6vTxdjLeHdF0LS7L/E7xxpzJYiLpK3ZVf
	 cxLMQ6NCDTLGEQb3Ee69CTnTiPCnP5O7OAKltCTwxTbk6Tng/0W8zHUfqUrZzaJlOr
	 JEGR09vZVL32iC1gSTucjmxerZB1C+BrO7Nge/bay5nEfiRf7JvahldiZKXN6yeNNl
	 wjxbZxVI8GjvV+ieI3y1Z6Nb1l72e93Ql8ayabmkdTLQgWY07nx5uo+dBgiRV/GV5s
	 RBAt7o76WucKEx7ES6icgfU/zS67hfRDPH3KzAm1KlHvrrY4zNRdXCxGkV33OcfaUX
	 ARNNR+BTs1psA==
Date: Tue, 23 Jan 2024 10:02:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <20240123160252.GA316914@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5849D7A9EC2BEB55CAF3A889E7742@BL1PR12MB5849.namprd12.prod.outlook.com>

On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> >> There is a need for some scenarios to use gsi sysfs.
> >> For example, when xen passthrough a device to dumU, it will
> >> use gsi to map pirq, but currently userspace can't get gsi
> >> number.
> >> So, add gsi sysfs for that and for other potential scenarios.
> ...

> > I don't know enough about Xen to know why it needs the GSI in
> > userspace.  Is this passthrough brand new functionality that can't be
> > done today because we don't expose the GSI yet?
>
> In Xen architecture, there is a privileged domain named Dom0 that
> has ACPI support and is responsible for detecting and controlling
> the hardware, also it performs privileged operations such as the
> creation of normal (unprivileged) domains DomUs. When we give to a
> DomU direct access to a device, we need also to route the physical
> interrupts to the DomU. In order to do so Xen needs to setup and map
> the interrupts appropriately.

What kernel interfaces are used for this setup and mapping?

