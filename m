Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FA2C8353
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 12:36:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41032.74118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhT8-0001XE-6Z; Mon, 30 Nov 2020 11:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41032.74118; Mon, 30 Nov 2020 11:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhT8-0001Wp-35; Mon, 30 Nov 2020 11:35:46 +0000
Received: by outflank-mailman (input) for mailman id 41032;
 Mon, 30 Nov 2020 11:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3zd=FE=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kjhT6-0001Wk-GE
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 11:35:44 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b64e9de-1139-42bf-8371-6e68610583df;
 Mon, 30 Nov 2020 11:35:41 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AUBZXm3023070
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 12:35:34 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 017D22E9CAC; Mon, 30 Nov 2020 12:35:27 +0100 (MET)
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
X-Inumbo-ID: 5b64e9de-1139-42bf-8371-6e68610583df
Date: Mon, 30 Nov 2020 12:35:27 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201130113527.GE1084@antioche.eu.org>
References: <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
 <20201127202211.eqrxloii5x54zode@Air-de-Roger>
 <20201127214420.GA637@antioche.eu.org>
 <20201128145311.3gmzq5lnkz6ajdtr@Air-de-Roger>
 <20201128171430.GB631@antioche.eu.org>
 <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 30 Nov 2020 12:35:34 +0100 (MET)


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 30, 2020 at 11:00:23AM +0100, Jan Beulich wrote:
> On 28.11.2020 18:14, Manuel Bouyer wrote:
> > On Sat, Nov 28, 2020 at 03:53:11PM +0100, Roger Pau Monné wrote:
> >>> the trace is at
> >>> http://www-soc.lip6.fr/~bouyer/xen-log13.txt
> >>
> >> Thanks! I think I've found the issue and I'm attaching a possible fix
> >> (fix.patch) to this email. In any case I've also attached a further
> >> debug patch, in case the fix turns out to be wrong. Please test the
> >> fix first, as the debug patch will end up triggering a panic when the
> >> buffer is full.
> > 
> > Yes, fix.patch does make the system boot as expected !
> 
> May I translate this to a Tested-by?
> 
> Patch also
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks much to both of you for all the effort here!

Also, please don't forget the attached patch !
Without it, the hypervisor panics.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-pvh-panic

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 64dd0a929c..3eb6102a61 100644
--- xen/drivers/vpci/msix.c.orig
+++ xen/drivers/vpci/msix.c
@@ -370,7 +370,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
 
             entry->updated = false;
         }
-        else
+        else if ( msix->enabled )
             vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
 
         break;

--oyUTqETQ0mS9luUI--

