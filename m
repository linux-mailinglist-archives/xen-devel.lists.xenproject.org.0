Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CtpLDtlk2k44QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 19:43:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF261470BF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 19:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234490.1537741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs3Yd-0007Qy-1c; Mon, 16 Feb 2026 18:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234490.1537741; Mon, 16 Feb 2026 18:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs3Yc-0007O3-Uv; Mon, 16 Feb 2026 18:42:54 +0000
Received: by outflank-mailman (input) for mailman id 1234490;
 Mon, 16 Feb 2026 18:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDeG=AU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vs3Yb-0007Nx-U0
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 18:42:53 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a1bfcf0-0b67-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 19:42:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 489E340DAD;
 Mon, 16 Feb 2026 18:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9F6C116C6;
 Mon, 16 Feb 2026 18:42:45 +0000 (UTC)
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
X-Inumbo-ID: 4a1bfcf0-0b67-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771267367;
	bh=W3eerZi73M8UsHNPHnN+3bupeIQmef+WrbSYUslgQg4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JIXVqFzHR67j29zE0LJIL6lvxedSgWKP+/N0TPA8KrDlAtMJ5+UlzT8UvgFqJ9YOt
	 A2kvc6t/5UiRK/Jvzom+3QpD763U9uI5J4vsh27JsDsGQedyjizGxDXDi4BISnN4gK
	 YkkRw2o5kiCzrOItwbmpBmvMrkOIKTtW5d9iSJWe9doOHjygjTY55xp/iFaWgdbx62
	 KJDF0fUDwVV8jVxNdBgelIP1Jz2Yy+/p9E4JDQs6TvRXG5Gmj8oq5REi7cCAalZDRD
	 BB6JyB3ZRr0eoUHDMe1JHCCC+EbE0KjdXsrHskqmMyuW1LPPdNXsE7dpktVBb6v9tR
	 ZpkW3QqFXKBig==
Date: Mon, 16 Feb 2026 10:42:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Romain Caritey <Romain.Caritey@microchip.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
In-Reply-To: <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com> <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com> <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6AF261470BF
X-Rspamd-Action: no action

On Mon, 16 Feb 2026, Jan Beulich wrote:
> On 12.02.2026 17:21, Oleksii Kurochko wrote:
> > domain_use_host_layout() is generic enough to be moved to the
> > common header xen/domain.h.
> 
> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
> 
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
> >  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
> >  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> >  
> > +/*
> > + * Is the domain using the host memory layout?
> > + *
> > + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
> > + * To avoid any trouble finding space, it is easier to force using the
> > + * host memory layout.
> > + *
> > + * The hardware domain will use the host layout regardless of
> > + * direct-mapped because some OS may rely on a specific address ranges
> > + * for the devices.
> > + */
> > +#ifndef domain_use_host_layout
> > +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
> > +                                    is_hardware_domain(d))
> 
> ... is_domain_direct_mapped() isn't something that I'd like to see further
> proliferate in common (non-DT) code.

Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
domain) on x86 as well. In fact, we already have a working prototype,
although it is not suitable for upstream yet.

In addition to the PSP use case that we discussed a few months ago,
where the PSP is not behind an IOMMU and therefore exchanged addresses
must be 1:1 mapped, we also have a new use case. We are running the full
Xen-based automotive stack on an Azure instance where SVM (vmentry and
vmexit) is available, but an IOMMU is not present. All virtual machines
are configured as PVH.

