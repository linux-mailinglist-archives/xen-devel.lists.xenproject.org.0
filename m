Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B022201084
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 17:31:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmIzd-00048Y-RZ; Fri, 19 Jun 2020 15:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jmIzc-00048R-QZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 15:31:48 +0000
X-Inumbo-ID: fd121a28-b241-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd121a28-b241-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 15:31:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +6YHcBZ7jxmtPwZPLygqajhk+pqOKWRDZCpEOKn2tbqHKPKtd1Nl9ZoF0QlaNzpdY9OiSxwFue
 bJwvw2dYrxFNs/4QmnnhhBeMJqT+XZjD4wxxYPOhjh3FriH2HkmSAewC/hkNFda6d4fHdxLNiH
 1ZaxZhqZJYYQ8atK8n+QSSc07CEXpTC2KGNygCDTLCMFyd3pdkdV39GZU5HpBd5Batcx2V8jHU
 BrelWJmzLtce0gqSUGjt5r9sX1G/BHjqmN+VSIhsfC7eK+dmIDOx+Xx5lR56Km1Ch+FMyHifzK
 hGg=
X-SBRS: 2.7
X-MesageID: 21270335
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="21270335"
Date: Fri, 19 Jun 2020 17:31:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v2 3/7] x86/vmx: add IPT cpu feature
Message-ID: <20200619153140.GC735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
 <20200619134452.GA735@Air-de-Roger>
 <445735893.10257958.1592576548575.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <445735893.10257958.1592576548575.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 04:22:28PM +0200, Michał Leszczyński wrote:
> ----- 19 cze 2020 o 15:44, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
> > On Fri, Jun 19, 2020 at 01:40:21AM +0200, Michał Leszczyński wrote:
> >> Check if Intel Processor Trace feature is supported by current
> >> processor. Define hvm_ipt_supported function.
> >> 
> >> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> >> ---
> > 
> > We usually keep a shirt list of the changes between versions, so it's
> > easier for the reviewers to know what changed. As an example:
> > 
> > https://lore.kernel.org/xen-devel/20200613184132.11880-1-julien@xen.org/
> > 
> 
> There is a change list in the cover letter. Should I also add changelog for
> each individual patch?

Oh, sorry, completely missed that. IMO yes, it's easier for reviewers
because we then have the diff and the changelog at the same place.

Changelogs in cover letters are also fine, but I would tend to only
add big architectural changes there.

Roger.

