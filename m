Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E512E19D9BC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:06:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNuD-0000ES-JR; Fri, 03 Apr 2020 15:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKNuB-0000D6-Gn
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:06:47 +0000
X-Inumbo-ID: bc0a700a-75bc-11ea-bd33-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc0a700a-75bc-11ea-bd33-12813bfff9fa;
 Fri, 03 Apr 2020 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585926406;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Tlppwdnd7Augm4VpWNCEngzyG8J6ZiKDyrkT+O7UC/g=;
 b=Dxu5u1gWwqtsKGd/TB0j/VAeqaatpKQpw23pXO56sxxAmh+6CZ35x1GI
 dJrR6JDaRSDUZJz6K91a1tHDefVgpvF8+WCNvg6jr6ZtuA1m5kavZoTer
 j+AKTN542BxTY17a73+HVRp9nChOKHsJzpkK2c6vRzSStI1Gia+FO5z+f 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iUVjkVtZWP38Hs8DoCPhi7ogNdy1sSRlQIAtV6L3dSNz47pyXhfs0C+cgIA2OTVq23SaS8JyEg
 32BdWbXAshMLmjD+4rooji1cr8CxsKB7Qe3tUAhGooF0YWACnCKR72OSSKdlr0U9zMDki3kcYu
 yhixRv7tMuOAEjQb6h8m5apsM78iefc6lfjRMX/1caaqE0gUgrQRlzteNJU1qvO7ueYG3PzukS
 PyNNmunHkw1Oh/+i1dSWJhFwXbpknf4jHaFqScQ20CbqOr2+pq0LgwM+n9KgEgcvixPw11fJPP
 774=
X-SBRS: 2.7
X-MesageID: 15802556
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15802556"
Subject: Re: [PATCH v2 0/2] x86/cpuidle: Cannon Lake adjustments
To: Jan Beulich <jbeulich@suse.com>
References: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
 <afe81b7e-4895-89ee-49dd-b6c0130923a1@citrix.com>
 <8813266d-cb33-0bb7-16d1-d1bf54142d2b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <29ead7aa-19ff-7746-ddc8-df24d126c4f6@citrix.com>
Date: Fri, 3 Apr 2020 16:06:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8813266d-cb33-0bb7-16d1-d1bf54142d2b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 09:06, Jan Beulich wrote:
> On 02.04.2020 16:58, Andrew Cooper wrote:
>> On 02/04/2020 09:22, Jan Beulich wrote:
>>> As requested in reply to v1, this is now a pair of patches with
>>> the expectation that only patch 1 would be acked and go in.
>>>
>>> 1: drop Cannon Lake support
>>> 2: support Cannon Lake (again)
>> Dropping Cannon Lake support is only of any incremental benefit if we
>> drop it from everywhere, and I didn't mean to block this single patch on it.
> How would dropping it from everywhere in one go be any better?
> I would see a benefit then only if we added code to refuse
> booting there.
>
>> Consider either A-by.
> I'm sorry to ask, but "either" here is unclear to me: Do you
> mean both of the above, or "the first one here or the original
> v1 one"? I don't see a point committing this in two pieces, if
> the combination of both is fine by you as well.

Pick whichever patch you prefer.

Looking at Linux recently, it appears that Ice Lake inherited some of
the Cannon Lake uarch designs, so while we don't necessarily care about
Cannon Lake CPUs themselves, the same details might be applicable in
later CPUs as well.

~Andrew

