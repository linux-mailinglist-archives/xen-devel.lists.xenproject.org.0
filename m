Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279EF2D63B2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 18:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49651.87793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPrJ-0002e5-Ct; Thu, 10 Dec 2020 17:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49651.87793; Thu, 10 Dec 2020 17:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPrJ-0002dg-9h; Thu, 10 Dec 2020 17:36:05 +0000
Received: by outflank-mailman (input) for mailman id 49651;
 Thu, 10 Dec 2020 17:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBdS=FO=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1knPrH-0002db-Ru
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 17:36:03 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 731dfe6f-bfae-43b4-b232-a19c1bf58060;
 Thu, 10 Dec 2020 17:36:02 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0BAHZvue015214
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 18:35:57 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id E38F82E9383; Thu, 10 Dec 2020 18:35:51 +0100 (MET)
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
X-Inumbo-ID: 731dfe6f-bfae-43b4-b232-a19c1bf58060
Date: Thu, 10 Dec 2020 18:35:51 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201210173551.GJ455@antioche.eu.org>
References: <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
 <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
 <20201210170319.GG455@antioche.eu.org>
 <ed06a0f4-8468-addf-2797-be3ba3a2d607@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed06a0f4-8468-addf-2797-be3ba3a2d607@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 10 Dec 2020 18:35:58 +0100 (MET)

On Thu, Dec 10, 2020 at 05:18:39PM +0000, Andrew Cooper wrote:
> The debugging earlier shows that MMUEXT_SET_LDT has indeed been called. 
> Presumably 0xffffbd000000a000 is a plausible virtual address for NetBSD
> to position the LDT?

Yes, it is. 

> 
> However, Xen finds the mapping not-present when trying to demand-map it,
> hence why the #PF is forwarded to the kernel.
> 
> The way we pull guest virtual addresses was altered by XSA-286 (released
> not too long ago despite its apparent age), but *should* have been no
> functional change.  I wonder if we accidentally broke something there. 
> What exactly are you running, Xen-wise, with the 4.13 version?

It is 4.13.2, with the patch for XSA351

> 
> Given that this is init failing, presumably the issue would repro with
> the net installer version too?

Hopefully yes, maybe even as a domU. But I don't have a linux dom0 to test.

If you have a Xen setup you can test with
http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.1/amd64/binary/kernel/netbsd-INSTALL_XEN3_DOMU.gz

note that this won't boot as a dom0 kernel.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

