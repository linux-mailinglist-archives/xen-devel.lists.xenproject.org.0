Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC83A21FA7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 15:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879195.1289419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td9Oe-0001Ho-Vh; Wed, 29 Jan 2025 14:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879195.1289419; Wed, 29 Jan 2025 14:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td9Oe-0001Fz-Sw; Wed, 29 Jan 2025 14:50:28 +0000
Received: by outflank-mailman (input) for mailman id 879195;
 Wed, 29 Jan 2025 14:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGF7=UV=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1td9Oc-0001Fr-Nz
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 14:50:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e811a94-de50-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 15:50:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C77AC5C5D56;
 Wed, 29 Jan 2025 14:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA68C4CED1;
 Wed, 29 Jan 2025 14:50:22 +0000 (UTC)
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
X-Inumbo-ID: 5e811a94-de50-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738162222;
	bh=Yulc6gJaTzGVoS9ctTWsVTmw0HAG9Y+R9cKgd4fepeQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OjJriJO65H3ftNFlkfAjt2ManhpLdvdPy3FlOlQ4vyK0XIdBe47wDizeToGtuHSiF
	 7LFWxyVWq9wGi/VsxMyoaZXkRTPtsXlcE8V0HrM7S9709NJM07bP6/aOtBBclwwBr3
	 FGnSwDrNI4TW7cFrnVH5gImtdBKqXdVkQaJXEcjNOyftS4Mjh4kCY9qy2yFv+zYq6u
	 DFqUwR3UBBFzu9ZLwhmFlMAzdCe8MOi//Amfhhkn/2uOJ9OPpl+GrFqyflBRjnURLb
	 7BBxtn4QMCUHmrOvgO/zBA8bGyf0SgzhC94Qm3rDdlHK86R6ExitPGSEsRqsa10Sa9
	 sgX1jF/eyk0kQ==
Date: Wed, 29 Jan 2025 08:50:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250129145019.GA459546@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <841e1793-4635-4f06-b0c9-37530215c08b@suse.com>

On Wed, Jan 29, 2025 at 02:52:33PM +0100, Jan Beulich wrote:
> On 29.01.2025 14:32, Bjorn Helgaas wrote:
> > On Wed, Jan 29, 2025 at 04:47:28AM +0100, Marek Marczykowski-Górecki wrote:
> >> On Tue, Jan 28, 2025 at 09:40:18PM -0600, Bjorn Helgaas wrote:
> >>> I guess the code at [2] is running in user mode and uses Linux
> >>> syscalls for config access?  Is it straceable?
> >>
> >> Nope, it's running as the hypervisor and mediates Linux's access to the
> >> hardware. In fact, Linux PV kernel (which dom0 is by default under Xen)
> >> is running in ring 3...
> >>
> >> But I can add some more logging there.
> > 
> > So I guess the hypervisor performs the config access on behalf of the
> > Linux PV kernel?  Obviously Linux thinks CRS/RRS SV is enabled, but I
> > suppose all the lspci output is similarly based on whatever the
> > hypervisor does, so how do we know the actual hardware config?
> 
> The hypervisor only intercepts config space writes; reads, particularly
> when going via mmcfg, ought to be unaffected, and hence what lspci shows
> should be "the actual hardware config".

FWIW, on x86, the first 256 bytes of config space for domain 0 uses
raw_pci_ops even when mmcfg is available (see raw_pci_read()).  This
normally means IO ports 0xcf8/0xcfc.

