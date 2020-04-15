Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2F1AA8F2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:47:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiO5-0005Th-8N; Wed, 15 Apr 2020 13:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOiO2-0005TZ-Vn
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:47:31 +0000
X-Inumbo-ID: a615e36c-7f1f-11ea-8a50-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a615e36c-7f1f-11ea-8a50-12813bfff9fa;
 Wed, 15 Apr 2020 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586958450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yUBYWgBvcCBEiFtZi4KYlWiNs/ExtQYAzVUtpY5TCXI=;
 b=Q2kGFkP8Zbn3VTerPB3rqraFulyDgjEUaH4ETJGR7fFuLozyEl9kwS71
 +/ge3EksgK8+DvBhC7WQI/fmqIW+mydsKHvcFF2N4LgsSQoANQoO8W8e5
 UKVs0Tn9bFF7rJfTyo7eroP+7A0UgXB5NAU3Hzp7+iUnieF4G1pnIgd8Y 4=;
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
IronPort-SDR: peEHnSpgsP5lzsl00C1ScIXEZwpEd47Ov3D29kI8RK90Ex6aHkSs0+gYSFrh8E7oYrAFpg3XDa
 LNvsiFAWizHgiIGxMD8vdDdhrZgpW8kKS17eBo/mH7JCKToXjpwWbZY+OlmgwVV81ozsa3Pf0a
 tZKcQpLKihU7QlPy5UXlp17vFLwsPKo/oZORIEcnVEOa3gFcXwwoUm+Z8gP5xiyPUXDV+KhNaG
 k7SrTK8xYl2ORD0JEKuptWxRg/b0NRLla1cce8P8wJdfGO4StX3TSar0cfTCGS8ALFClVzgDJZ
 rsU=
X-SBRS: 2.7
X-MesageID: 15700282
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15700282"
Date: Wed, 15 Apr 2020 15:47:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH OSSTEST 1/2] exanime: test for SMT and add a host flag
Message-ID: <20200415134722.GL28601@Air-de-Roger>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <24215.1635.613926.945930@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <24215.1635.613926.945930@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 02:04:35PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH OSSTEST 1/2] exanime: test for SMT and add a host flag"):
> > Check if hosts have SMT based on the number of threads per core. A
> > value of threads per core different than 0 implies SMT support.
> ...
> > +logm("$ho->{Ident} threads per core: $threads");
> > +hostflag_putative_record($ho, "smt", !!$threads);
> 
> This code LGTM but I wonder if it would be a good idea to start
> namespacing these kind of hardware feature flags.  cpu-*, hardware-*,
> feature-* maybe ?  Would you care to make a suggestion ?

cpu-smt seems fine if we plan to do similar namespacing with other
hardware features, I could see cpu-{smt,vmx,svm} and
devices-{iommu,sriov,ats} or some such for example.

If OTOH we don't want to be that fine grained I think
hw-{smt,iommu,vmx,...} would also be fine.

Not sure whether this has helped much. I guess my vote would be for
cpu-smt namespace.

Thanks, Roger.

