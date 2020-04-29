Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9871BE0E8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:29:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTni8-0007D2-4Y; Wed, 29 Apr 2020 14:29:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTni6-0007Cx-RH
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:29:14 +0000
X-Inumbo-ID: cc58919e-8a25-11ea-ae69-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc58919e-8a25-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588170555;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QsJPr9iVs6pqzFsZwMChw0wq8FGtmGYc2t1CUvxjZ0E=;
 b=cMe6R79w66lO15WHnAprk5W+aTmC9VVh7xQD+tStKZ+mfY3Hd8FABYix
 XVxa28202UKig7TIx1bz0wuPP4Sjk4D3nEWw7rgO+BLFmTTm38B3GMVY9
 fji/nyZ3iXbEiN24yuur2zgdKc3N26APIMS6TeHZTpDLCj9Y99LQACL34 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q47QSwH1T/DS5B0ActYX3BQu40sA6UWVichvIGhQv22eweOT6gBHgkeeVuEHtztef6rU5hyLwr
 ukCJgeKovpRasPAdwNpp0KxLNPCWw0B0+rSd7Gv6/KHnjzEp5+yzTztf3UeMIMX3tWbOC8b2Mr
 aGwN16dG4NN67xCUDIRIhZGXWckExnmPeNswvEYip1z2VTdnozmTflJvRxykGV/Auo/sfW6RMt
 jAN6hsdT8SobS3pNBtqsV9vhEE6t7jK42X/hsnOCNJsCFVKpFVcyOCVZqDSP17RePYpPTcw8Ir
 gVk=
X-SBRS: 2.7
X-MesageID: 16430618
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16430618"
Subject: Re: [PATCH] x86/CPUID: correct error indicator for max extended leaf
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <fa32442e-158f-f855-efad-09f4d6696adf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <56366abc-78cc-64f7-f122-bdeac9a8ee3c@citrix.com>
Date: Wed, 29 Apr 2020 15:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa32442e-158f-f855-efad-09f4d6696adf@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 15:11, Jan Beulich wrote:
> With the max base leaf using 0, this one should be using the extended
> leaf counterpart thereof, rather than some arbitrary extended leaf.
>
> Fixes: 588a966a572e ("libx86: Introduce x86_cpu_policies_are_compatible()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

