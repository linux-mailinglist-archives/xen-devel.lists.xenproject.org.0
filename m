Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC321F424
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 16:32:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvLya-0003nV-20; Tue, 14 Jul 2020 14:32:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvLyY-0003nH-Mb
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 14:32:06 +0000
X-Inumbo-ID: ca3e2690-c5de-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca3e2690-c5de-11ea-bb8b-bc764e2007e4;
 Tue, 14 Jul 2020 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594737125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=itH0grY7MffT3KoiW6iaLuvAdbO+5SArD63hAEr6TxE=;
 b=gXto9f/lmICFWo/C3I15YMe+5u09NQR/6I/R9pCnhTv+eJIiv4HhGUoD
 I2pYLWaobF1ThC/PBhAHux92VjldrkbV2csnbYWvjQEhDAmfYWID2kxNl
 Wb/ErNbmYYl/h7iCzGfFebJqI80NknZSfgTl2fB1cG/jgW3EotQHFE0TQ Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: l8GoQ23qy4S7V7XESdJ18zy/KiZNdFpDs5A2qjD1RZE1PXg9JqtiWwHqLD9TJuDKEI4zFYjUvh
 OugjLDZO+RsyLsVBu61su+PkptPNFpSCnC2YSK0d8GI6e6IvKaQtEAwvtfSaDGICi+xgmz8lyN
 /w3LIMIRe5rKuf+vDmf/0X7U1wQJXVUgylRFLbtLUBtxgfoOKXmWP2h0QWBImH3BopUWdFiFLX
 incJZEybQeDu3um0C58UrAGDmlw95mwy4DUyrVOWPheerc+8xvqOzbe8XM2PMuTbd1K9U0NDwp
 TXY=
X-SBRS: 2.7
X-MesageID: 22673717
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22673717"
Date: Tue, 14 Jul 2020 16:31:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/7] x86/mce: bring hypercall subop compat checking in
 sync again
Message-ID: <20200714143157.GM7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
 <20200714111900.GI7191@Air-de-Roger>
 <f82edef5-ee75-b24c-0a24-03ed38486882@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f82edef5-ee75-b24c-0a24-03ed38486882@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 14, 2020 at 01:47:11PM +0200, Jan Beulich wrote:
> On 14.07.2020 13:19, Roger Pau Monné wrote:
> > On Wed, Jul 01, 2020 at 12:26:54PM +0200, Jan Beulich wrote:
> >> Use a typedef in struct xen_mc also for the two subops "manually"
> >> translated in the handler, just for consistency. No functional
> >> change.
> > 
> > I'm slightly puzzled by the fact that mc_fetch is marked as needs
> > checking while mc_physcpuinfo is marked as needs translation,
> > shouldn't both be marked as needing translation? (since both need to
> > handle a guest pointer using XEN_GUEST_HANDLE)
> 
> I guess I'm confused - I see an exclamation mark on both respective

No, I was the one confused, you are right that both are marked as need
translation.

Roger.

