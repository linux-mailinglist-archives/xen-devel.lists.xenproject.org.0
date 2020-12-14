Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F82D9BD2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 17:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52357.91444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koqOT-00040Y-Ai; Mon, 14 Dec 2020 16:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52357.91444; Mon, 14 Dec 2020 16:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koqOT-00040C-7G; Mon, 14 Dec 2020 16:08:13 +0000
Received: by outflank-mailman (input) for mailman id 52357;
 Mon, 14 Dec 2020 16:08:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0N7=FS=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1koqOS-000407-D8
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:08:12 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c264d67d-0e2c-434d-b970-2024800322d5;
 Mon, 14 Dec 2020 16:08:10 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0BEG82mf024267
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 17:08:03 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id BF20C2E936F; Mon, 14 Dec 2020 17:07:57 +0100 (MET)
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
X-Inumbo-ID: c264d67d-0e2c-434d-b970-2024800322d5
Date: Mon, 14 Dec 2020 17:07:57 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/PV: guest_get_eff_kern_l1e() may still need to
 switch page tables
Message-ID: <20201214160757.GA5165@antioche.eu.org>
References: <89ae6a3b-bfbf-a701-53f5-4dfc80065924@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89ae6a3b-bfbf-a701-53f5-4dfc80065924@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 14 Dec 2020 17:08:04 +0100 (MET)

On Mon, Dec 14, 2020 at 02:57:53PM +0100, Jan Beulich wrote:
> While indeed unnecessary for pv_ro_page_fault(), pv_map_ldt_shadow_page()
> may run when guest user mode is active, and hence may need to switch to
> the kernel page tables in order to retrieve an LDT page mapping.
> 
> Fixes: 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")
> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Manuel, could you test this again, just to be on the safe side
> before we throw it in (at which point we could then also again
> add a Tested-by)? Thanks.

Yes, this works for me. thanks !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

