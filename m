Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B51A21DDF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 14:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879150.1289369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td87f-0004d7-Cl; Wed, 29 Jan 2025 13:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879150.1289369; Wed, 29 Jan 2025 13:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td87f-0004bd-9g; Wed, 29 Jan 2025 13:28:51 +0000
Received: by outflank-mailman (input) for mailman id 879150;
 Wed, 29 Jan 2025 13:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGF7=UV=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1td87d-0004bX-52
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 13:28:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7530e31-de44-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 14:28:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C8E33A41998;
 Wed, 29 Jan 2025 13:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE94C4CED3;
 Wed, 29 Jan 2025 13:28:44 +0000 (UTC)
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
X-Inumbo-ID: f7530e31-de44-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738157325;
	bh=dE0lsgSjq4wk0o7MP8rz5Jo7m5fcmyVktKNkz3zHsZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hqZWOMa6ZL1bscQx1L8m6C56jziOWBnJArDsY11+mhGnyX5uXmGC0E80eJst57Hbx
	 r4qSCNBkneQ4tYvtNB4Ewcw3TEjRMIV3amFJd7RiebPbTq+CNsC2xPa1M0JSexNDBN
	 YEYRKsY8OAWvjbYuXz7TxaMnpnrayTBjS01sw2J0BZUzW4q3z/KH6goEWuO+LV6XyS
	 VC/NPUQ+iTcQZSb52f8voS3dHNjq0KPFLNl+xU3/BofWCK9mAPUoBGHlGHbAzd6jq1
	 ipliraRXQHamGVvYpM6PQ1ozCRK+SoK3BMIguJymRwxoH70yHAHxw5WqJxg3sLJJPK
	 hJ4yVWsecHVlg==
Date: Wed, 29 Jan 2025 07:28:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250129132843.GA451331@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22ad7276-624d-49fb-a2bb-1b7908318a4e@suse.com>

On Wed, Jan 29, 2025 at 10:17:20AM +0100, Jan Beulich wrote:
> On 29.01.2025 04:22, Marek Marczykowski-Górecki wrote:
> > On Tue, Jan 28, 2025 at 09:03:15PM -0600, Bjorn Helgaas wrote:
> >> The report claims the problem only happens with Xen.  I'm not a Xen
> >> person, and I don't know how to find the relevant config accessors.
> >> The snippets of kernel messages I see at [1] all mention pciback, so
> >> that's my only clue of where to look.  Bottom line, I have no idea
> >> what the config accessor path is, and maybe we could learn something
> >> by looking at whatever it is.
> > 
> > AFAIK there are no separate config accessors under Xen dom0, the default
> > ones are used. xen-pcifront takes over PCI config space access (and few
> > more) only in a domU (and only for PV), when PCI passthrough is used.
> > Here, it didn't went that far...
> > 
> > But then, Xen may intercept such access [2]. If I read it right, it
> > should allow all access (is_hardware_domain(dom0)==true, and also the
> > device is not on ro_map - otherwise reset wouldn't work at all).
> 
> The other day you mentioned (on Matrix I think) that you observe mmcfg
> not being used on that system. Am I misremembering? (Since the capability
> where the control bit lives is an extended one, that capability would
> neither be read nor modified when mmcfg is unavailable.)

If you're referring to the Configuration RRS Software Visibility
Enable bit, that's in the PCIe Capability Root Control register, which
is in the PCI-compatible config space (the first 256 bytes), not the
extended config space.

