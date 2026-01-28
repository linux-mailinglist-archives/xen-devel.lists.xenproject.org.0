Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKdZMF0kemkO3QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69137A368A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215767.1525888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl70k-0003pA-EO; Wed, 28 Jan 2026 14:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215767.1525888; Wed, 28 Jan 2026 14:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl70k-0003nN-Bs; Wed, 28 Jan 2026 14:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1215767;
 Wed, 28 Jan 2026 14:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCQL=AB=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1vl70i-0003nH-VH
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:59:12 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e8c312-fc59-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 15:59:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0AED460007;
 Wed, 28 Jan 2026 14:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0F7C4CEF1;
 Wed, 28 Jan 2026 14:59:07 +0000 (UTC)
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
X-Inumbo-ID: e5e8c312-fc59-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612347;
	bh=gVOMR1V4hcjeaNYFYShKh4GCAi/n0lKjKVqv/7s0UjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXYgIgZQFpF4OaS2aeeh29HK5PXhUS6cCC9vxUcDunyQ/KZJL1RMIixiElusW8/Kl
	 n8yNYfLEWh3H2unOQH0bXnc2ismKxpNUUc/iuT+e0D+B9ICQZXheGbr82f4ptADSq2
	 YySOlRXCrqmnZmk+XLeLNngwD2SzJ0EcRF0zJRdAnJ1KweUqNV4K6x6NxkXEriFBo2
	 lm/Jci15Jfsesy2hvdnmb2GaVxY+aevqf1Ju60+/Lljv/kK1m1S7QatgzDuzE97nz7
	 dYfVD1djkmQ02JPD8eY9zRwymtgNAF0S0BhzJnWoolIaH11Tz+9+0TfJDV45zzjKpN
	 yz1jZaDr2UILQ==
Date: Wed, 28 Jan 2026 07:59:05 -0700
From: Keith Busch <kbusch@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Message-ID: <aXokOX20HMD0E_PM@kbusch-mbp>
References: <20260127195907.34563-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127195907.34563-1-roger.pau@citrix.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:axboe@kernel.dk,m:martin.petersen@oracle.com,m:linux-nvme@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hch@lst.de,m:sagi@grimberg.me,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[kbusch@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[kbusch@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 69137A368A
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 08:59:06PM +0100, Roger Pau Monne wrote:
> The call to nvme_free_sgls() in nvme_unmap_data() has the sg_list and sge
> parameters swapped.  This wasn't noticed by the compiler because both share
> the same type.  On a Xen PV hardware domain, and possibly any other
> architectures that takes that path, this leads to corruption of the NVMe
> contents.

Thanks, applied to nvme-6.19 with updated subject.

