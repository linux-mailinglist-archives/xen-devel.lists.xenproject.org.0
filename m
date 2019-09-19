Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACDB7EC6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 18:08:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAyx6-00032d-Gj; Thu, 19 Sep 2019 16:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iqgf=XO=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iAyx4-00032O-Sy
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 16:06:38 +0000
X-Inumbo-ID: 7574fdaa-daf7-11e9-b76c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7574fdaa-daf7-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568909198;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sKsvBqqB9sauIKSCWzPLOYBOGjvmbO36NI1He2xd4ww=;
 b=J3R1xCbu5nlcomu2daHEbVqytVlp0bLPKiV4YTrnWnKBKJiz9fAkf+om
 oTDXxK7Oc1hT0OVyUFEq/8THuf+Si05OJ9RmLU/haDZL6NtRWZGgHQpKM
 3gOx5N8K8uXqBLW018tjdSVmYUfLTgxF0Ykttbi+1F1Upew590xwdVe0l o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9NHtI+1OCquPfs1LrjDne38Kp9haY5ELRAPucnUIdxDGKMGUT2vrjSv2esyXGsPgsDEmmFXqLm
 E+Mz6aLUq8ZXdt6AtK9LB1P23vTGt+MIfA9wIS1ZrDizO7qaSjfFHf+m7JdYC3WqPkanGSSfrK
 J8ofqlB1SpwAPOiSku79IDCZmg2pUBHhWPXiY3FS6ErRvDdaJJZT5ZuANFUZIQYgPsl9+yXG/P
 XH6BLPymNmLF4ZXT9JlgQwAzGMOTHKDZK7J0in5Vfo2EYZmeqO+QtfVeMQT1iQXKc3ooQVcXn3
 nxg=
X-SBRS: 2.7
X-MesageID: 5796282
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5796282"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-9-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <3f3a6877-5153-68f2-549a-5643c4cc73c3@citrix.com>
Date: Thu, 19 Sep 2019 17:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-9-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 08/12] livepatch: Add support for inline
 asm hotpatching expectations
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhpcyBp
cyB0aGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZXhwZWN0YXRpb25zIGVuaGFuY2Vt
ZW50Cj4gdG8gaW1wcm92ZSBpbmxpbmUgYXNtIGhvdHBhdGNoaW5nLgo+IAo+IEV4cGVjdGF0aW9u
cyBhcmUgZGVzaWduZWQgYXMgb3B0aW9uYWwgZmVhdHVyZSwgc2luY2UgdGhlIG1haW4gdXNlIG9m
Cj4gdGhlbSBpcyBwbGFubmVkIGZvciBpbmxpbmUgYXNtIGhvdHBhdGNoaW5nLiBUaGUgZmxhZyBl
bmFibGVkIGFsbG93cwo+IHRvIGNvbnRyb2wgdGhlIGV4cGVjdGF0aW9uIHN0YXRlLgo+IEVhY2gg
ZXhwZWN0YXRpb24gaGFzIGRhdGEgYW5kIGxlbiBmaWVsZHMgdGhhdCBkZXNjcmliZSB0aGUgZGF0
YQo+IHRoYXQgaXMgZXhwZWN0ZWQgdG8gYmUgZm91bmQgYXQgYSBnaXZlbiBwYXRjaGluZyAob2xk
X2FkZHIpIGxvY2F0aW9uLgo+IFRoZSBsZW4gbXVzdCBub3QgZXhjZWVkIHRoZSBkYXRhIGFycmF5
IHNpemUuIFRoZSBkYXRhIGFycmF5IHNpemUKPiBmb2xsb3dzIHRoZSBzaXplIG9mIHRoZSBvcGFx
dWUgYXJyYXksIHNpbmNlIHRoZSBvcGFxdWUgYXJyYXkgaG9sZHMKPiB0aGUgb3JpZ2luYWwgZGF0
YSBhbmQgdGhlcmVmb3JlIG11c3QgbWF0Y2ggd2hhdCBpcyBzcGVjaWZpZWQgaW4gdGhlCj4gZXhw
ZWN0YXRpb24gKGlmIGVuYWJsZWQpLgo+IAo+IFRoZSBwYXlsb2FkIHN0cnVjdHVyZSBpcyBtb2Rp
ZmllZCBhcyBlYWNoIGV4cGVjdGF0aW9uIHN0cnVjdHVyZSBpcwo+IHBhcnQgb2YgdGhlIGxpdmVw
YXRjaF9mdW5jIHN0cnVjdHVyZSBhbmQgaGVuY2UgZXh0ZW5kcyB0aGUgcGF5bG9hZC4KPiAKPiBF
YWNoIGV4cGVjdGF0aW9uIGlzIGNoZWNrZWQgcHJpb3IgdG8gdGhlIGFwcGx5IGFjdGlvbiAoaS5l
LiBhcyBsYXRlCj4gYXMgcG9zc2libGUgdG8gY2hlY2sgYWdhaW5zdCB0aGUgbW9zdCBjdXJyZW50
IHN0YXRlIG9mIHRoZSBjb2RlKS4KPiAKPiBGb3IgdGhlIHJlcGxhY2UgYWN0aW9uIGEgbmV3IHBh
eWxvYWQncyBleHBlY3RhdGlvbnMgYXJlIGNoZWNrZWQgQUZURVIKPiBhbGwgYXBwbGllZCBwYXls
b2FkcyBhcmUgc3VjY2Vzc2Z1bGx5IHJldmVydGVkLCBidXQgQkVGT1JFIG5ldyBwYXlsb2FkCj4g
aXMgYXBwbGllZC4gVGhhdCBicmVha3MgdGhlIHJlcGxhY2UgYWN0aW9uJ3MgYXRvbWljaXR5IGFu
ZCBpbiBjYXNlIG9mCj4gYW4gZXhwZWN0YXRpb24gY2hlY2sgZmFpbHVyZSB3b3VsZCBsZWF2ZSBh
IHN5c3RlbSB3aXRoIGFsbCBwYXlsb2Fkcwo+IHJldmVydGVkLiBUaGF0IGlzIG9idmlvdXNseSBp
bnNlY3VyZS4gVXNlIGl0IHdpdGggY2F1dGlvbiBhbmQgYWN0Cj4gdXBvbiByZXBsYWNlIGVycm9y
cyEKPiAKc25pcAo+ICAgICogTG9va3VwIHNwZWNpZmllZCBzZWN0aW9uIGFuZCB3aGVuIGV4aXN0
cyBhc3NpZ24gaXRzIGFkZHJlc3MgdG8gYSBzcGVjaWZpZWQgaG9vay4KPiAgICAqIFBlcmZvcm0g
c2VjdGlvbiBwb2ludGVyIGFuZCBzaXplIHZhbGlkYXRpb246IHNpbmdsZSBob29rIHNlY3Rpb25z
IG11c3QgY29udGFpbiBhCj4gQEAgLTEzNDUsNiArMTQwMCwyMCBAQCBzdGF0aWMgdm9pZCBsaXZl
cGF0Y2hfZG9fYWN0aW9uKHZvaWQpCj4gICAKPiAgICAgICAgICAgaWYgKCByYyA9PSAwICkKPiAg
ICAgICAgICAgewo+ICsgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgKiBNYWtlIHN1cmUg
YWxsIGV4cGVjdGF0aW9uIHJlcXVpcmVtZW50cyBhcmUgbWV0Lgo+ICsgICAgICAgICAgICAgKiBC
ZXdhcmUgYWxsIHRoZSBwYXlsb2FkcyBhcmUgcmV2ZXJ0ZWQgYXQgdGhpcyBwb2ludC4KPiArICAg
ICAgICAgICAgICogSWYgZXhwZWN0YXRpb25zIGFyZSBub3QgbWV0IHRoZSBzeXN0ZW0gaXMgbGVm
dCBpbiBhCj4gKyAgICAgICAgICAgICAqIGNvbXBsZXRlbHkgVU5QQVRDSEVEIHN0YXRlIQo+ICsg
ICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgcmMgPSBsaXZlcGF0Y2hfY2hlY2tfZXhwZWN0
YXRpb25zKGRhdGEpOwo+ICsgICAgICAgICAgICBpZiAoIHJjICkKPiArICAgICAgICAgICAgewo+
ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogU1lTVEVN
IE1JR0hUIEJFIElOU0VDVVJFOiAiCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIlJlcGxhY2Ug
YWN0aW9uIGhhcyBiZWVuIGFib3J0ZWQgYWZ0ZXIgcmV2ZXJ0aW5nIEFMTCBwYXlsb2FkcyFcbiIs
IGRhdGEtPm5hbWUpOwo+ICsgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgIH0K
PiArCj4gICAgICAgICAgICAgICBpZiAoIGlzX2hvb2tfZW5hYmxlZChkYXRhLT5ob29rcy5hcHBs
eS5hY3Rpb24pICkKPiAgICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgICBwcmludGso
WEVOTE9HX0lORk8gTElWRVBBVENIICIlczogQ2FsbGluZyBhcHBseSBhY3Rpb24gaG9vayBmdW5j
dGlvblxuIiwgZGF0YS0+bmFtZSk7Cj4gQEAgLTE3OTgsNiArMTg2NywxMSBAQCBzdGF0aWMgaW50
IGxpdmVwYXRjaF9hY3Rpb24oc3RydWN0IHhlbl9zeXNjdGxfbGl2ZXBhdGNoX2FjdGlvbiAqYWN0
aW9uKQo+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgIH0KPiAg
IAo+ICsgICAgICAgICAgICAvKiBNYWtlIHN1cmUgYWxsIGV4cGVjdGF0aW9uIHJlcXVpcmVtZW50
cyBhcmUgbWV0LiAqLwo+ICsgICAgICAgICAgICByYyA9IGxpdmVwYXRjaF9jaGVja19leHBlY3Rh
dGlvbnMoZGF0YSk7Cj4gKyAgICAgICAgICAgIGlmICggcmMgKQo+ICsgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gKwo+ICAgICAgICAgICAgICAgaWYgKCBpc19ob29rX2VuYWJsZWQoZGF0YS0+aG9v
a3MuYXBwbHkucHJlKSApCj4gICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19JTkZPIExJVkVQQVRDSCAiJXM6IENhbGxpbmcgcHJlLWFwcGx5IGhvb2sgZnVu
Y3Rpb25cbiIsIGRhdGEtPm5hbWUpOwoKSSB3b25kZXIgaWYgdGhpcyBzaG91bGQgYmUgZG9uZSBp
biB0aGUgY3JpdGljYWwgcmVnaW9uIGZvciBjb25zaXN0ZW5jeSAKd2l0aCB0aGUgcmVwbGFjZSBj
b2RlIGFuZCB0byBtaW5pbWl6ZSB0aGUgY2hhbmNlIG9mIHNvbWV0aGluZyBnb2luZyAKd3Jvbmcg
YmV0d2VlbiBjYWxsaW5nIHRoZSBzeXNjdGwgYW5kIHRoZSBwYXRjaGluZyBhY3R1YWxseSBoYXBw
ZW5pbmcuIApUaG91Z2h0cz8KClRoZSBwYXRjaCBsb29rcyBmaW5lIG90aGVyd2lzZS4KClJvc3MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
