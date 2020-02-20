Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16A165C45
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:57:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4jSe-0003yI-Cw; Thu, 20 Feb 2020 10:53:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1oA1=4I=amazon.co.uk=prvs=31285a090=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4jSc-0003yD-JZ
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:53:38 +0000
X-Inumbo-ID: 3f79e1e2-53cf-11ea-ade5-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f79e1e2-53cf-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582196019; x=1613732019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rJV25T5nKJSWUK78xPMDAKoXp8f/mzm4y/4AHpOgJjs=;
 b=Q0hZrd8CNTEwTwnZRFOEZJCP1x0P/SxV1iX+g5HFMdUjaKtX5LrCS4r7
 lGaanLYwSiVFvuZzIkkL+NibDiXVQTwxvE/QL+cw4Sq6snbJuZseauogg
 iDouwb2yyD5kb/lQ10/4j7fxsgshkNFSgWAicd8guzcK5UpNvqDgRxP10 I=;
IronPort-SDR: kLAuFFPkxedcY++yR+zduXdR9puVct8bm+mlLBGpXhIWnFYIigS0Boef7oRbj0BLsfjE7DssBg
 RQ0XK7gq09pA==
X-IronPort-AV: E=Sophos;i="5.70,464,1574121600"; d="scan'208";a="26303207"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 20 Feb 2020 10:53:37 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3EECCA3297; Thu, 20 Feb 2020 10:53:33 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 20 Feb 2020 10:53:33 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 20 Feb 2020 10:53:32 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 20 Feb 2020 10:53:32 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 3/3] x86/hyperv: L0 assisted TLB flush
Thread-Index: AQHV5xoJ294n08JQuUGoMRrJ32rMSKgie7XQ
Date: Thu, 20 Feb 2020 10:53:32 +0000
Message-ID: <1a400c1d22b143f582a02dcbc1728b88@EX13D32EUC003.ant.amazon.com>
References: <20200219114411.26922-1-liuwe@microsoft.com>
 <20200219114411.26922-4-liuwe@microsoft.com>
In-Reply-To: <20200219114411.26922-4-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.98]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 3/3] x86/hyperv: L0 assisted TLB flush
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxOSBGZWJydWFyeSAyMDIw
IDExOjQ0Cj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPjsgV2VpIExpdQo+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BB
VENIIHY0IDMvM10geDg2L2h5cGVydjogTDAgYXNzaXN0ZWQgVExCIGZsdXNoCj4gCj4gSW1wbGVt
ZW50IEwwIGFzc2lzdGVkIFRMQiBmbHVzaCBmb3IgWGVuIG9uIEh5cGVyLVYuIEl0IHRha2VzIGFk
dmFudGFnZQo+IG9mIHNldmVyYWwgaHlwZXJjYWxsczoKPiAKPiAgKiBIVkNBTExfRkxVU0hfVklS
VFVBTF9BRERSRVNTX0xJU1QKPiAgKiBIVkNBTExfRkxVU0hfVklSVFVBTF9BRERSRVNTX0xJU1Rf
RVgKPiAgKiBIVkNBTExfRkxVU0hfVklSVFVBTF9BRERSRVNTX1NQQUNFCj4gICogSFZDQUxMX0ZM
VVNIX1ZJUlRVQUxfQUREUkVTU19TUEFDRV9FWAo+IAo+IFBpY2sgdGhlIG1vc3QgZWZmaWNpZW50
IGh5cGVyY2FsbHMgYXZhaWxhYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdl
QG1pY3Jvc29mdC5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
