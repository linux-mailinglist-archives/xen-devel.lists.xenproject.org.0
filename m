Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B2A2AD39
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 17:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883009.1293102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg4L3-0000hH-QY; Thu, 06 Feb 2025 16:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883009.1293102; Thu, 06 Feb 2025 16:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg4L3-0000eP-Nj; Thu, 06 Feb 2025 16:02:49 +0000
Received: by outflank-mailman (input) for mailman id 883009;
 Thu, 06 Feb 2025 16:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yiA=U5=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tg4L2-0000eJ-3f
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 16:02:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf240d0-e4a3-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 17:02:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 66EA5A440CE;
 Thu,  6 Feb 2025 16:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A70C4CEDD;
 Thu,  6 Feb 2025 16:02:44 +0000 (UTC)
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
X-Inumbo-ID: cdf240d0-e4a3-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738857765;
	bh=x2gpS+dhI9K78ESB6TIOUjl5kGdcJeTQlkc7ugTmD8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=I0jqkoALn105vNr6UekMx9bp4Yqy6RNwxreb6YwQCm1EkdfON9b4CUgmSsxPxZg3I
	 p9QiBLC233isUkmx0OR3+Lkoxv3GNPZrCxrZufzXgWOu3r/OCbZ+/nOqOPeTYsnqdO
	 z34KWJMCxAJRtWF/nc0l36XUpK5jV1KrB/YUGb0r1FfAIAWhZWrJJwJuTO72RLlKZl
	 H3lR7XCtidM3qhwpdnTxmBNGKbJ9OOR/CPln+kTQMRdwyPWDBqzIaJ0/5BS9sPrUGu
	 RgJj/PYWGqr6ll4sTxy4lLmQNzlSBD7GvrxlNvN8SobxPPdOvGIuWL46XkptPVSvrZ
	 4sIdM1+Al0wmg==
Date: Thu, 6 Feb 2025 10:02:42 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <20250206160242.GA985980@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6Rz1o3CnnuUiaoI@macbook.local>

On Thu, Feb 06, 2025 at 09:33:26AM +0100, Roger Pau Monné wrote:
> On Wed, Feb 05, 2025 at 09:17:31AM -0600, Bjorn Helgaas wrote:
> > Please run git log --oneline and match the subject line capitalization
> > style, i.e.,
> > 
> >   PCI/MSI: Remove ...
> > 
> > But it doesn't look like this actually *removes* the functionality, it
> > just implements it differently so it can be applied more selectively.
> > 
> > So maybe the subject should say something like "control use of MSI
> > masking per IRQ domain, not globally"
> 
> What about:
> 
> PCI/MSI: convert pci_msi_ignore_mask to per MSI domain flag
> 
> Which is slightly shorter?

Much better.  Also capitalize "Convert".

