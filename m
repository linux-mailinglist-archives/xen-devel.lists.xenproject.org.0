Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6B193B87
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:12:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOX1-0005BN-Sr; Thu, 26 Mar 2020 09:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHOX0-0005BA-8v
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:10:30 +0000
X-Inumbo-ID: a324015e-6f41-11ea-b34e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a324015e-6f41-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585213829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k/k4cT6+o9Ovb8BVGU3tHbN6JG76r3Ap5550Mkx/spw=;
 b=ew2QqxQIEespjVZ+vFZpE74+yJeVDNoHfRd4287JhaTqBX/esJpai7ka
 jssw44+4w7O2Da8RRayUYhm4DHUuUBPVipuhSi0+DbQCvNT5xXZ7rdgIN
 EdeTGyxSgiuoLNoX4zNVRpovt/Zfwmu0MS7cNVaUZU6+mpVGOIXYl4w5f A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xssDvOvuiYLMDEOOm1ce2iuZ80QiAHy2oKxPDGCtam6cGYXyh1fNKKD++AisP2v3FrWghF9jn1
 8FUJCsTBLqFI/A1iNi1rSZeu0lBKjEkNNxv4UWendK1OfLcNMY1wEVhzZLaUqBsVzWWGSEN4Y9
 368GgwzxncQYewhf7l1oeJKJyMI8wg+gykgs3J70HXe54jfE825f5dvzAliHrwdDeAd4daKq/s
 pjJK/olKU8JiOLXb/6hydTPeFkgpeBv9a1aTs12N9+AiCn6nw4ZzZGQhXHxiLv/dE5yaiNbbrY
 7y8=
X-SBRS: 2.7
X-MesageID: 15078381
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,307,1580792400"; d="scan'208";a="15078381"
Date: Thu, 26 Mar 2020 10:10:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200326091019.GI28601@Air-de-Roger>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <c88f7cac-9990-957d-746b-fc60040c4c59@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c88f7cac-9990-957d-746b-fc60040c4c59@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <tamas.lengyel@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 08:07:09AM +0100, Jan Beulich wrote:
> On 25.03.2020 16:47, Roger Pau Monné wrote:
> > On Mon, Mar 23, 2020 at 10:04:35AM -0700, Tamas K Lengyel wrote:
> >> +static int copy_vcpu_settings(struct domain *cd, struct domain *d)
> >> +{
> >> +    unsigned int i;
> >> +    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> >> +    int ret = -EINVAL;
> >> +
> >> +    for ( i = 0; i < cd->max_vcpus; i++ )
> >> +    {
> >> +        const struct vcpu *d_vcpu = d->vcpu[i];
> >> +        struct vcpu *cd_vcpu = cd->vcpu[i];
> >> +        struct vcpu_runstate_info runstate;
> >> +        mfn_t vcpu_info_mfn;
> >> +
> >> +        if ( !d_vcpu || !cd_vcpu )
> >> +            continue;
> >> +
> >> +        /*
> >> +         * Copy & map in the vcpu_info page if the guest uses one
> >> +         */
> >> +        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
> >> +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> >> +        {
> >> +            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
> >> +
> >> +            /*
> >> +             * Allocate & map the page for it if it hasn't been already
> >> +             */
> >> +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> >> +            {
> >> +                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
> >> +                unsigned long gfn_l = gfn_x(gfn);
> >> +                struct page_info *page;
> >> +
> >> +                if ( !(page = alloc_domheap_page(cd, 0)) )
> >> +                    return -ENOMEM;
> >> +
> >> +                new_vcpu_info_mfn = page_to_mfn(page);
> >> +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> >> +
> >> +                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn, PAGE_ORDER_4K,
> >> +                                     p2m_ram_rw, p2m->default_access, -1);
> >> +                if ( ret )
> >> +                    return ret;
> >> +
> >> +                ret = map_vcpu_info(cd_vcpu, gfn_l,
> >> +                                    d_vcpu->vcpu_info_offset);
> >> +                if ( ret )
> >> +                    return ret;
> >> +            }
> >> +
> >> +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> >> +        }
> >> +
> >> +        /*
> >> +         * Setup the vCPU runstate area
> >> +         */
> >> +        if ( guest_handle_is_null(runstate_guest(cd_vcpu)) )
> > 
> > Maybe I'm confused, but isn't this the other way around and you need
> > to check? If the parent runstate is not null copy it to the fork,
> > ie:
> > 
> > if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
> > {
> >     ...
> > 
> >> +        {
> >> +            runstate_guest(cd_vcpu) = runstate_guest(d_vcpu);
> >> +            vcpu_runstate_get(cd_vcpu, &runstate);
> >> +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);
> > 
> > You should check the return code I think.
> 
> I don't think so - this is a best effort operation just like e.g.
> in the handling of VCPUOP_register_runstate_memory_area.

I think printing a debug message might be helpful, not so much as for
the importance of failing to copy the runstate area, but it could
signal that something went wrong, anyway I don't have such a strong
opinion.

Just to confirm, __copy_to_guest will cause the forked domain memory
to be populated and the whole page to be copied over right? (and will
also cause the page tables to be added to the fork physmap in write
mode to set the accessed/dirty bits)

Thanks, Roger.

