Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CBE20D4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:40:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJdi-0006Np-B2; Wed, 23 Oct 2019 16:37:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EeSN=YQ=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iNJdh-0006Nk-9L
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:37:37 +0000
X-Inumbo-ID: 653d5780-f5b3-11e9-9487-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 653d5780-f5b3-11e9-9487-12813bfff9fa;
 Wed, 23 Oct 2019 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571848646;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BjnjCYjnlyixKYa2a1GtTz2EuUwc2G9iM8OuhMtvcgw=;
 b=Bp3oAdT44HHJjVkslCqLX+PL8f3H5EFnVYMuGaApWC25AtJsXN0JpQmE
 fjZeet8vHqiZQS2PllhYV4Hc2BMr7ioDn/Zcbw/8kY/vmhlICO7nKeiL3
 C+hWueAELYC6bCB6sRo5B+DR4kEgNgyhPWR9Bh3lyt7sWUmbMQ9DFWk+B U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ylDxPyCmXSyJ90Srb0rnIhdAgMAEmkaL8l7C9FidtWHLhqPP7QInkkAD8uZKmnnp8Dp6EzQQR1
 6Huk/NvsQBef048WvfR6uvakxsEY4n8mgBanoppUYiSNRagfjNGzu//QAPOpvsFG1ILegcPRgA
 qljbUe+V0dRv3z8FkBbx0RZO8aoWUAxg4ximDP5SvwCoaL2Or7unBgEBOW5R5y8gPUgkUMEtRK
 ZAGErt0Q6ETEtygaueVthXGgEWaH2H8bdDEja+M/ac3FaSlrcDL/Nq3lsPVb8M8IvRH6+AraT1
 RvY=
X-SBRS: 2.7
X-MesageID: 7427355
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7427355"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <d8ddfa34-caa8-ac53-8059-c4692bc343b5@citrix.com>
Date: Wed, 23 Oct 2019 17:37:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Norbert Manthey <nmanthey@amazon.de>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjMvMTkgMjo1OCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGcm9tOiBSb3NzIExh
Z2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPiAKPiBUaGUgYmluYXJ5IGRpZmZp
bmcgYWxnb3JpdGhtIHVzZWQgYnkgeGVuLWxpdmVwYXRjaCBkZXBlbmRzIG9uIGhhdmluZyB1bmlx
dWUKPiBzeW1ib2xzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxh
Z2Vyd2FsbEBjaXRyaXguY29tPgo+IApQcmVzdW1hYmx5IHRoaXMgc2hvdWxkIGJlICJsaXZlcGF0
Y2gtYnVpbGQiIG9yICJsaXZlcGF0Y2gtYnVpbGQtdG9vbHMiIApyYXRoZXIgdGhhbiAieGVuLWxp
dmVwYXRjaCIuCgotLSAKUm9zcyBMYWdlcndhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
