Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8694193B4D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 09:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHO6V-0002MB-2M; Thu, 26 Mar 2020 08:43:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHO6S-0002M6-Ug
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 08:43:04 +0000
X-Inumbo-ID: cc9c7e0c-6f3d-11ea-8776-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc9c7e0c-6f3d-11ea-8776-12813bfff9fa;
 Thu, 26 Mar 2020 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585212181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kCaUVrjU8cJ/V48DnC1tNTmeEiNtZ0OKK4BBirTkpBg=;
 b=cqqXD9JqbpEKTgS2uLgfj0+bk97OZ8muULLQObep9R+ngO1aMu3uNmRD
 hUnIlxsVDUk73KDeSThpP5d/bcxzcqYDanDf8k4Dqgh4olV/sNtgb9VAo
 3Qpx9iurf5oUwlT8SttJO50FvnChP9u+ediMt49hMYZH+Xd2ZxS+Gsz77 c=;
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
IronPort-SDR: r2HjN4gOGTct0Ooa+4Zh4bykVwC4TTAV7wmqB0bdu1i5L4W+e5Z3sZR4G1/HorwkisD1F3yi6b
 Y3CJDFmU0Yzmlcm6vlOGNaV+I3WebXjajUglDpV9PgF4lu0oYnCBUSsuvsfHwmRrb7HErCgdSs
 qJU/BrtH8vPiNnrZY+W1Xwv4bqWf+HaXlP1xadpF9dY3Iv+4CJ2SSTrAxa88xlWCHxr8M30Dkq
 38odQAknCVuYphcTi7vOlQc53WNAOzsswpoCeLoYFsIStmeDqeoaFZfsinqBQDSlzrg2zItJfT
 884=
X-SBRS: 2.7
X-MesageID: 14649783
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,307,1580792400"; d="scan'208";a="14649783"
Date: Thu, 26 Mar 2020 09:42:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200326084250.GH28601@Air-de-Roger>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
 <20200325165444.GF28601@Air-de-Roger>
 <a3ff04a8-a3ec-9726-373a-56dcdc9927ac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3ff04a8-a3ec-9726-373a-56dcdc9927ac@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 08:02:22AM +0100, Jan Beulich wrote:
> On 25.03.2020 17:54, Roger Pau Monné wrote:
> > On Wed, Mar 25, 2020 at 04:42:07PM +0000, Julien Grall wrote:
> >> On 25/03/2020 16:34, Tamas K Lengyel wrote:
> >>>>> --- a/xen/common/domain.c
> >>>>> +++ b/xen/common/domain.c
> >>>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
> >>>>>
> >>>>>       v->vcpu_info = new_info;
> >>>>>       v->vcpu_info_mfn = page_to_mfn(page);
> >>>>> +#ifdef CONFIG_MEM_SHARING
> >>>>> +    v->vcpu_info_offset = offset;
> >>>>
> >>>> There's no need to introduce this field, you can just use v->vcpu_info
> >>>> & ~PAGE_MASK AFAICT.
> >>>
> >>> Just doing what you suggest above results in:
> >>>
> >>> mem_sharing.c:1603:55: error: invalid operands to binary & (have
> >>> ‘vcpu_info_t * const’ {aka ‘union <anonymous> * const’} and ‘long
> >>> int’)
> >>>                                       d_vcpu->vcpu_info & ~PAGE_MASK);
> >>>
> >>> I can of course cast the vcpu_info pointer to (long int), it's just a
> >>> bit ugly. Thoughts?
> >>
> >> FWIW, I will also need the offset for liveupdate. I have used (unsigned
> >> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.
> > 
> > I think using:
> > 
> > (vaddr_t)v->vcpu_info & ~PAGE_MASK
> > 
> > is acceptable, but that would require adding a vaddr_t typedef to x86.
> 
> I don't think vaddr_t is necessary given that all over the place we
> assume conversions between pointers and unsigned long to be fine.

Right, using unsigned long is indeed fine, but I also agree with Tamas
that it's slightly ugly and hence wanted to provide a 'cleaner'
suggestion.

Roger.

