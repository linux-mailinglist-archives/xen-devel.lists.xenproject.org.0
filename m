Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D861F10A39D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:54:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZeze-0005xZ-3h; Tue, 26 Nov 2019 17:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZezc-0005xU-U1
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:51:17 +0000
X-Inumbo-ID: 58491cda-1075-11ea-a55d-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58491cda-1075-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574790676; x=1606326676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=A6WW4h9Zjml5i5ang8E4C45PafAnPFuLW9sky8DwwTA=;
 b=LHwDrzAVgIHRbrvAR/NlsH4CXzkdG6oRGUMEbc4TIJn+r31XykfqwWWM
 0KZ7yTyAQ3TJjHPi2rtro/qhtVlGzjyXkRVSpE3RWyxdrYQSoJmMLnEWS
 Q9T2pFFQAYU4Df/PfVSiUfq8px1F6MM9mjXImCj3S7uqdshN8HLWP7/mD Q=;
IronPort-SDR: ATfD2XLU5eOnQ3uYobzw6nVgVQB5CRmiZnmVWtRor3e9KbdNxAJHwaBD0QpQdJzW81P6Mh3zpz
 f1bx7Z+AUqGA==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; 
   d="scan'208";a="5877704"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Nov 2019 17:51:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 906E014167C; Tue, 26 Nov 2019 17:51:13 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 17:51:12 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 17:51:11 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 17:51:11 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wAgAAGFwCAAAVUAIAAA80AgAGMj4CAATPFAIAJ1PUA
Date: Tue, 26 Nov 2019 17:51:11 +0000
Message-ID: <60D2D242-4806-402F-99BC-F0CE572E5925@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
 <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
 <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
 <1A2AE077-662E-40C0-820D-13EC3B88D1F3@amazon.com>
 <69cbfa61-fae3-ee6a-b482-31cca7f05d60@citrix.com>
In-Reply-To: <69cbfa61-fae3-ee6a-b482-31cca7f05d60@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.9]
Content-ID: <3E48961AB59746429542440E130D9567@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Paraschiv, Andra-Irina" <andraprs@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDIwLiBOb3YgMjAxOSwgYXQgMTI6NDIsIFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFz
bGlAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTkvMTEvMjAxOSAxNzoyMSwgV2llY3pvcmtp
ZXdpY3osIFBhd2VsIHdyb3RlOgo+PiAKPj4gCj4+PiBPbiAxOC4gTm92IDIwMTksIGF0IDE4OjQx
LCBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gCj4+
PiBPbiAxOC8xMS8yMDE5IDE3OjI4LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4+Pj4g
Cj4+Pj4gQ291bGQgeW91IGJ1aWxkIHRoZSBscCB3aXRoIGRlYnVnICgtZCkgYW5kIHByb3ZpZGUg
bWUgd2l0aCB0aGUgY3JlYXRlLWRpZmYtb2JqZWN0LmxvZyBmaWxlPwo+Pj4+IAo+Pj4gCj4+PiBJ
J3ZlIGF0dGFjaGVkIHRoZSBsb2cuIEJ0dywgSSB0aGluayBJIHByb3ZpZGVkIGFsbCB0aGUgbmVj
ZXNzYXJ5IGluZm9ybWF0aW9uCj4+PiBmb3Igb3RoZXJzIHRvIHJlcGVhdCBteSBleHBlcmltZW50
Lgo+Pj4gCj4+IAo+PiBTb3JyeSBmb3IgYW5vdGhlciByZXF1ZXN0LCBidXQgSSBkbyBub3Qgc2Vl
bSB0byBiZSBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGxvY2FsbHkuCj4+IENvdWxkIHlvdSBzZW5k
IG1lIHRoZSBsaXZlcGF0Y2ggbW9kdWxlIGJpbmFyeSB0aGF0IGZhaWxzIHRvIHVwbG9hZD8KPiAK
PiBUaGF0J3MgaW50ZXJlc3RpbmcuIEkndmUgYXR0YWNoZWQgdGhlIGJpbmFyeSB0aGF0IG15IHN5
c3RlbSBwcm9kdWNlcy4KPiBXaGF0IHZlcnNpb24gb2YgZ2NjIGRvIHlvdSB1c2U/CgpUaGUgdmVy
c2lvbiB1c2VkIHdhczogZ2NjIChHQ0MpIDcuMi4xIDIwMTcwOTE1CgpCdXQgSSBoYXZlIGZpbmFs
bHkgbWFuYWdlZCB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGg6CjEuIGdjYyAoVWJ1bnR1IDYu
NS4wLTJ1YnVudHUxfjE4LjA0KSA2LjUuMCAyMDE4MTAyNgoyLiBnY2MtNyAoVWJ1bnR1IDcuNC4w
LTF1YnVudHUxfjE4LjA0LjEpIDcuNC4wCgpJIHRoaW5rIGl0IGlzIG5vdCByZWxhdGVkIHRvIHRo
ZSBjb21taXQ6CmNvbW1pdCA4NTRhN2NhNjBlMzUgImNyZWF0ZS1kaWZmLW9iamVjdDogRG8gbm90
IGluY2x1ZGUgYWxsIC5yb2RhdGEgc2VjdGlvbnMiCgpJIG1hbmFnZWQgdG8gcmVwcm9kdWNlIGl0
IGFsc28gd2l0aCBlYXJsaWVyIHZlcnNpb24gY29tbWl0OgoiMGMxMDQ1NyBSZW1vdmUgc2VjdGlv
biBhbGlnbm1lbnQgcmVxdWlyZW1lbnQiCgpCdXQgdGhpcyB0aW1lIGEgZGlmZmVyZW50IHN5bWJv
bCBjYXVzZXMgdGhlIGZhaWx1cmU6CgooWEVOKSBsaXZlcGF0Y2g6IDAwMDEtbGl2ZS1wYXRjaDog
VW5rbm93biBzeW1ib2w6IGh2bS5jI2xhc3RwYWdlLjIyODU2Cgo+IAo+IC0tCj4gVGhhbmtzLAo+
IFNlcmdleQo+IDwwMDAxLWxpdmUtcGF0Y2gtc3RyaXBwZWQubGl2ZXBhdGNoPgoKQmVzdCBSZWdh
cmRzLApQYXdlbCBXaWVjem9ya2lld2ljegoKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhy
dW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4K
VXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
