Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E792738
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 16:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzinM-0008NK-SE; Mon, 19 Aug 2019 14:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qYle=WP=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hzinL-0008NF-B7
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 14:38:03 +0000
X-Inumbo-ID: f1923eec-c28e-11e9-8bee-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1923eec-c28e-11e9-8bee-12813bfff9fa;
 Mon, 19 Aug 2019 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566225482;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jcXDUHt3kuV6sz6i6DgCm8VKgVmcbSqXeOq9nqzP4ws=;
 b=PpZ8ieT6edKwba/3TyPMbIIVL9g0Ni8nAwZT2hrvz+ZuZQ9s0aRBLQYH
 k/cileXUx1nTWGW9XIV20ruACJbH3gSNIb0TEbiQToKFZgdJB3qjuCcqk
 aQmM9DnV69I5TSfv/DNQjEHrsI+eoFlrryQVKm48GofJoDseCe88KicKb c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: erc+gGkdZBaUWDltiWrvcu9mTgLOaUi6fNPeMEPztdfb1pFNmd3dwwF9necFoE1Ct3KJ92DOUa
 NaofjkgofR4/1mtDXGx785qCjbIcqvn8GQqnx0PyoTlkBoWuUiAOvRDny/pCSuDxBjSYi2EQej
 3/9wGw6kDpE7orUWaiJ3/NdhfANLx1gTcF9wBNOgbL6A3ZA52vQWTILgtucLy7uIA1MlgDp9aK
 cIhaf4fWzheMNUnAf9WvE3kKdycL74QUiPOs9redFYoouObRmToM7kUYmn9h0ujfRo+MztNEi2
 CCU=
X-SBRS: 2.7
X-MesageID: 4443404
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4443404"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190814075525.83191-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <cc4079ad-1427-b601-3bf3-8f350920cd33@citrix.com>
Date: Mon, 19 Aug 2019 15:37:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190814075525.83191-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-hooks-1 PATCH 1/3] create-diff-object:
 Handle extra pre-|post- hooks
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNC8xOSA4OjU1IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBJbmNsdWRl
IG5ldyBzZWN0aW9ucyBjb250YWluaW5nIG9wdGlvbmFsIHByZS0sIHBvc3QtIGFjdGlvbiBob29r
cy4KPiAKPiBUaGUgZm9sbG93aW5nIG5ldyBzZWN0aW9uIG5hbWVzIGFyZSBzdXBwb3J0ZWQ6Cj4g
ICAgLSAubGl2ZXBhdGNoLmhvb2tzLnByZWFwcGx5Cj4gICAgLSAubGl2ZXBhdGNoLmhvb2tzLnBv
c3RhcHBseQo+ICAgIC0gLmxpdmVwYXRjaC5ob29rcy5wcmVyZXZlcnQKPiAgICAtIC5saXZlcGF0
Y2guaG9va3MucG9zdHJldmVydAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3
aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiAtLS0KUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxs
IDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
