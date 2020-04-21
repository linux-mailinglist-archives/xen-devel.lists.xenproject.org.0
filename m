Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6201B1F8E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 09:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQn26-0004wg-Uw; Tue, 21 Apr 2020 07:09:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zbep=6F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQn25-0004wZ-97
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 07:09:25 +0000
X-Inumbo-ID: 07728d08-839f-11ea-910b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07728d08-839f-11ea-910b-12813bfff9fa;
 Tue, 21 Apr 2020 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587452965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hnuYWUrcISGhyqgbBWbE93SDbcbhAnI50QvY7gz3WXY=;
 b=Z3MuwFqyFt2zi31ZAwDdFZLZRu78NOIT/5J/umBqk+Bk1kPlaTF9Et9Q
 crPEF2Yhql0cTBKAJeKNxgzWFcWjk0wtuE7UhZ/N8HbC/osbH9QvIsFZp
 M0JKCYtYXb9lGE1489PZL/SrmpICccHCm/nP2XsBXCVEvn5BVP3HZrLIC 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0fzLVnxxwZbV0SMiETKcq8c8BxoPnoeChdpNpHJbtja0yLqfE5ZTUIXPwZJPRGKu5TTAiHoOZY
 tRDhc4QW9EQO65bSm8J4XjiYQUqp51+1Kh+c4GVPtMeGTBBMq9LR1NUCjBW8OKgn0lV/GiMnZM
 jByhMvPeLt76pt5VNwxciTiqFLCwsmDixhZlU0Sg1wwRVwKUNMI7FMSzP89xD1ltUPHB2Iew/i
 EFpuU8TPEijK5JlnxxGnFfA0CqU5GqEpbuCNAu7p3JdD0MTaLZrc/DJTZnLS6Ty2StJoS86XSR
 /+k=
X-SBRS: 2.7
X-MesageID: 15968412
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,409,1580792400"; d="scan'208";a="15968412"
Date: Tue, 21 Apr 2020 09:09:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v15 2/3] mem_sharing: allow forking domain with IOMMU
 enabled
Message-ID: <20200421070913.GT28601@Air-de-Roger>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
 <20200420075655.GR28601@Air-de-Roger>
 <CABfawhmWm_KasEPG=4e1V4qF5uh-ErtazsK=O8gS2n80KrqOyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmWm_KasEPG=4e1V4qF5uh-ErtazsK=O8gS2n80KrqOyA@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 20, 2020 at 08:19:12AM -0600, Tamas K Lengyel wrote:
> On Mon, Apr 20, 2020 at 1:57 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Fri, Apr 17, 2020 at 10:06:32AM -0700, Tamas K Lengyel wrote:
> > > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > > index d36d64b8dc..1d2149def3 100644
> > > --- a/xen/include/public/memory.h
> > > +++ b/xen/include/public/memory.h
> > > @@ -536,7 +536,9 @@ struct xen_mem_sharing_op {
> > >          } debug;
> > >          struct mem_sharing_op_fork {      /* OP_FORK */
> > >              domid_t parent_domain;        /* IN: parent's domain id */
> > > -            uint16_t pad[3];              /* Must be set to 0 */
> > > +#define XENMEM_FORK_WITH_IOMMU_ALLOWED 1  /* Allow forking domain with IOMMU */
> >
> > Since this is a flags field, can you express this is as: (1u << 0).
> 
> I was thinking of doing that then it won't fit into a single line. For
> this particular flag it would also make no difference.

Right, but when new flags are added it looks weird IMO to have:

#define XENMEM_FORK_WITH_IOMMU_ALLOWED 1
#define XENMEM_FOO_BAR_WITH_FOO        (1u << 1)

Thanks, Roger.

