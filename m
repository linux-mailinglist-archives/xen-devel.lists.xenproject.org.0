Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZXJTJX/ue2keJgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 00:34:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F2B5B64
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 00:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217113.1526929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbWQ-0004uW-Kf; Thu, 29 Jan 2026 23:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217113.1526929; Thu, 29 Jan 2026 23:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbWQ-0004si-I3; Thu, 29 Jan 2026 23:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1217113;
 Thu, 29 Jan 2026 23:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlbWP-0004sc-TE
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 23:33:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f799f821-fd6a-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 00:33:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6DECC440EE;
 Thu, 29 Jan 2026 23:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CB2C4CEF7;
 Thu, 29 Jan 2026 23:33:48 +0000 (UTC)
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
X-Inumbo-ID: f799f821-fd6a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769729630;
	bh=XrUTPXDKKPRFMjII7zeiwjtCO89SxFuV/F/W1/Ggk7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f/QWiOUbjBKGsJNC91hWIZ0D761M/ZbM4EsKuJt09kfSNBlQ6wVyWkvR8Q+GXX7fp
	 M9yAv6YziojN50ggS0OalaWVmm4WX12/wpPXgxHKigoHDL7zwMzTrVBYvLtBLX6I4X
	 ABg+5h6b0E0bP9ikI1I0wzO99ESMWW+LmKSJFdCmj6jb2dbWsvdYKdQ4SEjwh1wE62
	 i4f5eGHllp7r9oOgyNYFBklAuTiiUMkn5QxnZjJXbHRim/++/M2GtbGFRJRKKcvWLO
	 +ymyd9tL3VB76Lx4rWhFV+9pszW+/iQR0deGEFZRJn3D8FeARo3wtF3P0tWyE7SCq9
	 c9UWG7WK5+kZQ==
Date: Thu, 29 Jan 2026 15:33:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 3/5] lib/arm: Add I/O memory copy helpers
In-Reply-To: <1308a872-dc7f-4e0f-aa9e-e9d05af3d135@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601291532390.2238666@ubuntu-linux-20-04-desktop>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com> <c1d8b28fffd3380bdf914526f6934a444be5e75c.1769696107.git.oleksii_moisieiev@epam.com> <1308a872-dc7f-4e0f-aa9e-e9d05af3d135@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Oleksii_Moisieiev@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 403F2B5B64
X-Rspamd-Action: no action

On Thu, 29 Jan 2026, Jan Beulich wrote:
> On 29.01.2026 15:16, Oleksii Moisieiev wrote:
> > --- /dev/null
> > +++ b/xen/arch/arm/lib/memcpy-fromio.c
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#include <xen/io.h>
> > +
> > +#include <asm/io.h>
> 
> Why both, when xen/io.h includes asm/io.h anyway?
> 
> > +/*
> > + * Arm implementation notes / limitations:
> > + * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
> > + *   32-bit accesses for the aligned bulk; no wider accesses are issued.
> > + * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
> > + *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
> > + * - MMIO must be mapped with appropriate device attributes to preserve
> > + *   ordering; no extra barriers beyond the ordered accessors are added.
> > + * - If source or destination is misaligned, leading bytes are copied
> > + *   byte-by-byte until both sides are 32-bit aligned,
> 
> Which may be never, which in turn may not be obvious to the reader.
> 
> > then bulk copy uses
> > + *   32-bit accesses.
> > + */
> 
> It'll be Arm maintainers to judge whether these restrictions are really
> going to be acceptable. I think I pointed out more than once that I
> think these functions end up being too-narrow-purpose.

I am not the greatest fan of this code, but it seems to fit the purpose
well enough, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

