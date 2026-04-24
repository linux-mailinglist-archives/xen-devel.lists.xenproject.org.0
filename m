Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cETdDuH562ksTgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2026 01:16:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D3463FEC
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2026 01:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294053.1571322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGPkD-0001sS-Cg; Fri, 24 Apr 2026 23:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294053.1571322; Fri, 24 Apr 2026 23:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGPkD-0001q1-9C; Fri, 24 Apr 2026 23:15:33 +0000
Received: by outflank-mailman (input) for mailman id 1294053;
 Fri, 24 Apr 2026 23:15:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wGPkB-0001pv-OU
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 23:15:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGPk9-006D7V-4u
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2026 01:15:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69ebf97f-e002-0a2a0a5209dd-0a2a4505c674-10
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2026 01:15:30 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69ebf990-aaa8-0a2a45050019-aceafc1f88bc-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2026 01:15:30 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45D0940E34;
 Fri, 24 Apr 2026 23:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07AFC2BCB0;
 Fri, 24 Apr 2026 23:15:27 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777072528;
	bh=oLKd9v1uv4DZICMQa7d2btuR4XwM6ccabR4xaT/WOVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XrPZzhd8gqlvrlhRjmnvzAkOWZkp7z6h07lMvp5hKcGz2ymBYWeuskWexLTk/f31O
	 LWy0Qw1ac3KdNU5L9jgjuwuMaJczlwjZsBakurn2EdLA/NMWleOOtC0YQZL80rcAcO
	 Ze/NnKmoOiwyvgqozVTwRkegiEKMzTYEoeMtFeWMHAfcstN99SpNUeNOjNkuqIez7Q
	 c3FVWzCw6j7A0I1bSGqDXrPbaAGxSRBFRK+UjpjrOQ//ixN19sidlBr9aXUHma5jG0
	 9M03z7bet+WE23nU59UaAAYS21fRjHRVO/RwaKbHp59RtagmqRqsqzyxVRnhV5mkfw
	 LisnYBy+gfI+w==
Date: Fri, 24 Apr 2026 16:15:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peng Fan <peng.fan@oss.nxp.com>
cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, iommu@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device
 DMA memory
In-Reply-To: <aesV0ai8SM89cb3j@shlinux89>
Message-ID: <alpine.DEB.2.22.394.2604241614280.6871@ubuntu-linux-20-04-desktop>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com> <f6cf1d46-9d2e-4b52-a6b9-fb45d01b874f@suse.com> <aesV0ai8SM89cb3j@shlinux89>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1721512358-1777072528=:6871"
X-purgate-ID: tlsNG-c201ff/1777072530-E85AF443-C6FB816D/0/0
X-purgate-type: clean
X-purgate-size: 2710
X-Rspamd-Queue-Id: CD9D3463FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[nxp.com:server fail,lists.xenproject.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1721512358-1777072528=:6871
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Apr 2026, Peng Fan wrote:
> Hi Juergen,
> 
> On Mon, Apr 20, 2026 at 02:19:34PM +0200, Jürgen Groß wrote:
> >On 15.04.26 17:08, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
> >> physical address passed in refers to normal RAM that is part of the
> >> kernel linear(direct) mapping, as it unconditionally derives a CPU
> >> virtual address via phys_to_virt().
> >> 
> >> With Xen swiotlb, devices may use per-device coherent DMA memory,
> >> such as reserved-memory regions described by 'shared-dma-pool',
> >> which are assigned to dev->dma_mem. These regions may be marked
> >> no-map in DT and therefore are not part of the kernel linear map.
> >> In such cases, pfn_valid() still returns true, but phys_to_virt()
> >> is not valid and cache maintenance via arch_sync_dma_* will fault.
> >> 
> >> Prevent this by excluding devices with a private DMA memory pool
> >> (dev->dma_mem) from the arch_sync_dma_* fast path, and always
> >> fall back to xen_dma_sync_* for those devices to avoid invalid
> >> phys_to_virt() conversions for no-map DMA memory while preserving the
> >> existing fast path for normal, linear-mapped RAM.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>   drivers/xen/swiotlb-xen.c | 17 +++++++++++++----
> >>   1 file changed, 13 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> >> index 2cbf2b588f5b20cfbf9e83a8339dc22092c9559a..b1445df99d9a8f1d18a83b8c413bada6e5579209 100644
> >> --- a/drivers/xen/swiotlb-xen.c
> >> +++ b/drivers/xen/swiotlb-xen.c
> >> @@ -195,6 +195,11 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
> >>   }
> >>   #endif /* CONFIG_X86 */
> >> +static inline bool dev_has_private_dma_pool(struct device *dev)
> >> +{
> >> +	return dev && dev->dma_mem;
> >> +}
> >> +
> >
> >I don't think this will compile on x86.
> 
> My bad, I only tried the build for ARM64. I use below changes, if it looks
> good.
> 
> #ifdef CONFIG_ARM64
> static inline bool dev_has_private_dma_pool(struct device *dev)
> {
> 	return dev && dev->dma_mem;
> }
> #else
> static inline bool dev_has_private_dma_pool(struct device *dev)
> {
> 	return false;
> }
> #endif

Please use CONFIG_DMA_DECLARE_COHERENT

--8323329-1721512358-1777072528=:6871--

