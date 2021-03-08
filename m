Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0208330A63
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94727.178324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCMs-0003ck-B0; Mon, 08 Mar 2021 09:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94727.178324; Mon, 08 Mar 2021 09:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCMs-0003a4-7d; Mon, 08 Mar 2021 09:40:02 +0000
Received: by outflank-mailman (input) for mailman id 94727;
 Mon, 08 Mar 2021 09:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU7p=IG=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lJCMr-0003VM-MT
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:40:01 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b4785d2-222d-411b-8042-6d1140108d36;
 Mon, 08 Mar 2021 09:40:00 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lJCMo-000Dbx-LI; Mon, 08 Mar 2021 09:39:58 +0000
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
X-Inumbo-ID: 3b4785d2-222d-411b-8042-6d1140108d36
Date: Mon, 8 Mar 2021 09:39:58 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/2][4.15?] x86/shadow: encode full GFN in magic MMIO
 entries
Message-ID: <YEXw7nM+glqc/Oz2@deinos.phlegethon.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <ccf12da3-b3df-7be1-1898-992ec994b78f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ccf12da3-b3df-7be1-1898-992ec994b78f@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:37 +0100 on 05 Mar (1614962265), Jan Beulich wrote:
> Since we don't need to encode all of the PTE flags, we have enough bits
> in the shadow entry to store the full GFN. Don't use literal numbers -
> instead derive the involved values. Or, where derivation would become
> too ugly, sanity-check the result (invoking #error to identify failure).
> 
> This then allows dropping from sh_l1e_mmio() again the guarding against
> too large GFNs.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

> I wonder if the respective check in sh_audit_l1_table() is actually
> useful to retain with these changes.

Yes, I think so.  We care about these PTEs being bogus for any reason,
not just the ones that this could address.

> -#define SH_L1E_MAGIC 0xffffffff00000001ULL
> +#define SH_L1E_MAGIC_NR_META_BITS 4
> +#define SH_L1E_MAGIC_MASK ((~0ULL << (PADDR_BITS - PAGE_SHIFT + \
> +                                      SH_L1E_MAGIC_NR_META_BITS)) | \
> +                           _PAGE_PRESENT)

I don't think this makes the code any more readable, TBH, but if you
prefer it that's OK.  I'd be happier with it if you added a
BUILD_BUG_ON that checks that 1ULL << (PADDR_BITS - 1) is set in the
mask, since that's the main thing we care about.

> -#define SH_L1E_MMIO_MAGIC       0xffffffff00000001ULL
> -#define SH_L1E_MMIO_MAGIC_MASK  0xffffffff00000009ULL
> -#define SH_L1E_MMIO_GFN_MASK    0x00000000fffffff0ULL
> +#define SH_L1E_MMIO_MAGIC       SH_L1E_MAGIC_MASK
> +#define SH_L1E_MMIO_MAGIC_BIT   ((_PAGE_PRESENT | _PAGE_RW | _PAGE_USER) + 1)

IMO this would be more readable as a straight 0x8 (or even _PAGE_PWT).
The ack stands either way.

Cheers,

Tim.


