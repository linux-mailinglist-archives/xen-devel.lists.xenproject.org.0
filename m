Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923912007ED
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 13:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmFIC-0006YV-3R; Fri, 19 Jun 2020 11:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jmFIA-0006YQ-Eb
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 11:34:42 +0000
X-Inumbo-ID: dd497bf8-b220-11ea-bb68-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd497bf8-b220-11ea-bb68-12813bfff9fa;
 Fri, 19 Jun 2020 11:34:41 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PjcMl5Va+MTY639Yg3lLjm98tx6+wShgVKLNj0ereRPAGL+fmycsM2qYnK9+q0Yb+BcEpXaMhZ
 GKvYLm9b6GGXgiqqvIbCwYdL0CsuZ2BnSzhK/8Z2zzQeT+OW8y3Un1cO/5BEDbX5H5xqKckIJj
 26P2/l/iHfH9hVtC36SMDEJYBhc9uUTaYKeexLSgC+lPV1zs8fGVkwvKHdqC1dnpsk7DId0Eua
 uUNc8NMg/P7QkzIEh9L9aMQZeJ8odPzbI4aetrIlIj3ITz6/IVGjoTk0tX1C2fAH8oXC56AWUn
 ly8=
X-SBRS: 2.7
X-MesageID: 21247920
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="21247920"
Date: Fri, 19 Jun 2020 13:34:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v2 1/7] xen/mm: lift 32 item limit from mfn/gfn arrays
Message-ID: <20200619113434.GZ735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan
 Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 01:38:00AM +0200, Michał Leszczyński wrote:
> Replace on-stack array allocation with heap allocation
> in order to lift the limit of 32 items in mfn/gfn arrays
> when calling acquire_resource.

I'm afraid this is not correct, you cannot allow unbounded amounts of
items to be processed like this, it's likely that you manage to
trigger the watchdog if the list is long enough, specially when doing
set_foreign_p2m_entry.

You need to process the items in batches (32 was IMO a good start), and
then add support for hypercall continuations. Take a look at how
XENMEM_populate_physmap just a couple of lines below makes use of
hypercall_create_continuation.

After processing every batch you need to check if
hypercall_preempt_check returns true and if so use
hypercall_create_continuation in order to encode a continuation.

Thanks, Roger.

