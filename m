Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8519CD06
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 00:45:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK8aR-0006R0-Vw; Thu, 02 Apr 2020 22:45:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK8aQ-0006Qu-6s
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 22:45:22 +0000
X-Inumbo-ID: a1fbab36-7533-11ea-bc74-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1fbab36-7533-11ea-bc74-12813bfff9fa;
 Thu, 02 Apr 2020 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585867521;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WmVvjFHqz74Tb/GtnUZsvLt7r1IV5kg1ZHIgxk++gcE=;
 b=hJrRLJBWK21NMK/Rmks87Le7zzxOeyHopIg+LHsyKkxITWiGo215IUMb
 nVlaeQE5k+yP396NjWXcKvfLln5M79RMy3zvMtxVkseAR+orWKjFzjhIi
 wOy2kjJzQdN7q2DvBOKyaye03FX9tdaXUzS44u7PEqFaEGZHrvf4oFgp5 E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NPIQlOlRPL7ksXr+lG5+SsAdEl79/iyV4rs4eH0mP7xWr2dZHXyVBuEunun+gcZzRGiHfYu6PJ
 N76q4ZVuKZeT93ETULZADdfwG1p8ex7lC3V8kk0qXThnCKf+pOzOG6Kn32fc9PVnANsFqlR9+f
 e7VSDM+O4hHXWm9Tan8YCT6mEp3h24i/Mzra0OB4Ta8IXvI6EsN9vAUEOB08eUhmGRGDFkDhx3
 GcQu/Z9Qzr9I0EMXdHr05bLBYjfgLUxp+e817kL4Y3K7XNVMpHTTmTIa/jvIcjQVJJQpT29UE6
 LGo=
X-SBRS: 2.7
X-MesageID: 15509610
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,337,1580792400"; d="scan'208";a="15509610"
Subject: Re: [PATCH 4/5] x86/p2m: drop pointless nested variable from
 guest_physmap_add_entry()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
 <c31cac8b-99b8-5cfd-bb8b-57ff529d34ad@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e6507e5d-17fd-628c-a8e8-f0c914c18b83@citrix.com>
Date: Thu, 2 Apr 2020 23:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c31cac8b-99b8-5cfd-bb8b-57ff529d34ad@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/04/2020 12:40, Jan Beulich wrote:
> There's an outer scope rc already, and its use for the mem-sharing logic
> does not conflict with its use elsewhere in the function.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

