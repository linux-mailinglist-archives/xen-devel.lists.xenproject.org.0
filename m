Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B6CE8F2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 18:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHVe8-00067k-T6; Mon, 07 Oct 2019 16:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DAgt=YA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iHVe6-00067f-Qa
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 16:14:02 +0000
X-Inumbo-ID: 787ce1c8-e91d-11e9-97b7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 787ce1c8-e91d-11e9-97b7-12813bfff9fa;
 Mon, 07 Oct 2019 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570464840;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kcPoYRiHNKYeHUVAC5w5y/RtVqirUqRhMcPKU4jTtQg=;
 b=F022xwsqpz7f72jeDhYwKAnpRXCRUxdF12TBTtSIc07a9LLu/lGhOlho
 dPFpm1+Yi1N/uV2FE/tIIVTzJKyWYTducc3I2Jw8YbsOKSAf95mi13kgx
 G+6bI9piM0zd4DR4LV4p1gbdRfPcOVL1sdTM2A6XgY2wrvTMmI7GdW7le E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g3b3fD9w/hdxlIoZDthJXbN3QwIFuPvRI0r+LjETlmJTGlRv7YqRIt0BwYMQf6O6ypLS1OpMTO
 6fe7J0QfoKypS0MOIr4smRxjw9sasv7o/11IFGc+JSjFv72q6d7s65fa96D+vqkiiHuvEZ58cO
 h37ndqpItS3+plkfwg2p4tyZzBF8qlwpjeYHixNNihAAq0YOQfGewIgWIkP/KVwzx2g6ZW6Cfz
 wix/1L2OZhFGfb1jnTMTXenDKCYy71KESljJYmykgO/AszB3aqccIMrTKyMSdp/LW3/XsONQjU
 FfY=
X-SBRS: 2.7
X-MesageID: 6818243
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,268,1566878400"; 
   d="scan'208";a="6818243"
To: Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <5b1bad1b-f381-869d-95a8-036a236a2b31@citrix.com>
Date: Mon, 7 Oct 2019 17:13:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
 Practice
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNy8xOSAxMDoxNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDkuMjAxOSAy
MTozOSwgTGFycyBLdXJ0aCB3cm90ZToKPj4gKyMjIyBWZXJib3NlIHZzLiB0ZXJzZQo+PiArRHVl
IHRvIHRoZSB0aW1lIGl0IHRha2VzIHRvIHJldmlldyBhbmQgY29tcG9zZSBjb2RlIHJldmlld2Vy
LCByZXZpZXdlcnMgb2Z0ZW4gYWRvcHQgYQo+PiArdGVyc2Ugc3R5bGUuIEl0IGlzIG5vdCB1bnVz
dWFsIHRvIHNlZSByZXZpZXcgY29tbWVudHMgc3VjaCBhcwo+PiArPiB0eXBvCj4+ICs+IHMvcmVz
aW9ucy9yZWdpb25zLwo+PiArPiBjb2Rpbmcgc3R5bGUKPj4gKz4gY29kaW5nIHN0eWxlOiBicmFj
a2V0cyBub3QgbmVlZGVkCj4+ICtldGMuCj4+ICsKPj4gK1RlcnNlIGNvZGUgcmV2aWV3IHN0eWxl
IGhhcyBpdHMgcGxhY2UgYW5kIGNhbiBiZSBwcm9kdWN0aXZlIGZvciBib3RoIHRoZSByZXZpZXdl
ciBhbmQKPj4gK3RoZSBhdXRob3IuIEhvd2V2ZXIsIG92ZXJ1c2UgY2FuIGNvbWUgYWNyb3NzIGFz
IHVuZnJpZW5kbHksIGxhY2tpbmcgZW1wYXRoeSBhbmQKPj4gK2NhbiB0aHVzIGNyZWF0ZSBhIG5l
Z2F0aXZlIGltcHJlc3Npb24gd2l0aCB0aGUgYXV0aG9yIG9mIGEgcGF0Y2guIFRoaXMgaXMgaW4g
cGFydGljdWxhcgo+PiArdHJ1ZSwgd2hlbiB5b3UgZG8gbm90IGtub3cgdGhlIGF1dGhvciBvciB0
aGUgYXV0aG9yIGlzIGEgbmV3Y29tZXIuIFRlcnNlCj4+ICtjb21tdW5pY2F0aW9uIHN0eWxlcyBj
YW4gYWxzbyBiZSBwZXJjZWl2ZWQgYXMgcnVkZSBpbiBzb21lIGN1bHR1cmVzLgo+IAo+IEFuZCBh
bm90aGVyIHJlbWFyayBoZXJlOiBOb3QgYmVpbmcgdGVyc2UgaW4gc2l0dWF0aW9ucyBsaWtlIHRo
ZSBvbmVzCj4gZW51bWVyYXRlZCBhcyBleGFtcGxlcyBhYm92ZSBpcyBhIGRvdWJsZSB3YXN0ZSBv
ZiB0aGUgcmV2aWV3ZXIncyB0aW1lOgoKRldJVyBJIGRvbid0IHRoaW5rIHRoaXMgZG9jdW1lbnQg
cHJvaGliaXRzIHRlcnNlIHJlcGxpZXMuICBJdCBwb2ludHMgb3V0CnRoYXQgdGhleSBjYW4gY29t
ZSBhY3Jvc3MgYXMgdW5mcmllbmRseSwgYW5kIHRoZXkgY2FuIGJlIHBlcmNlaXZlZCBhcwpydWRl
IGluIHNvbWUgY3VsdHVyZXM7IGJvdGggb2Ygd2hpY2ggYXJlIHRydWUuICBJdCB0aGVuICpyZWNv
bW1lbmRzKgp0aGF0IHJldmlld2VycyBjb21wZW5zYXRlIGZvciBpdCBpbiBhIHJldmlldyBvcGVu
aW5nIChpLmUuLCBvbmNlIHBlcgpwYXRjaCAvIHNlcmllcykgd2hpY2ggZXhwcmVzc2VzIGFwcHJl
Y2lhdGlvbjsgd2hpY2ggaXMgYm90aCBoZWxwZnVsIGFuZApyZWxhdGl2ZWx5IGxvdyBjb3N0LgoK
VGhlIHBvaW50IG9mIHRoZSBvcGVuaW5nIGlzIHRvIHNldCB0aGUgdG9uZS4gIElmIHlvdSBzdGFy
dCBvdXQgd2l0aApzb21ldGhpbmcgcG9zaXRpdmUsIGFuZCBlbmRzIHdpdGggInRoYW5rcyIsIHRo
ZW4gYSBsb25nIHNlcmllcyBvZiB0ZXJzZQpjb21tZW50cyBpcyBtb3JlIGxpa2VseSB0byBiZSBy
ZWFkIGFzIHNpbXBseSBiZWluZyBlZmZpY2llbnQuICBJZiB0aGUKZW50aXJlIHJldmlldyBjb25z
aXN0cyBvZiBub3RoaW5nIGJ1dCBjcml0aWNpc20gb3IgdGVyc2UgY29tbWVudHMsIGl0J3MKbW9y
ZSBsaWtlbHkgdG8gYmUgcmVhZCBhcyBhbm5veWFuY2Ugb24gdGhlIHBhcnQgb2YgdGhlIHJldmll
d2VyLgoKPiBUaGV5IHNob3VsZG4ndCBldmVuIG5lZWQgdG8gbWFrZSBzdWNoIGNvbW1lbnRzLCBl
c3BlY2lhbGx5IG5vdCBtYW55Cj4gdGltZXMgZm9yIGEgc2luZ2xlIHBhdGNoIChzZWUgeW91ciBt
ZW50aW9uIG9mICJvdmVydXNlIikuICBJIHJlYWxpemUKPiB3ZSBzdGlsbCBoYXZlIG5vIGF1dG9t
YXRlZCBtZWNoYW5pc20gdG8gY2hlY2sgc3R5bGUgYXNwZWN0cywgYnV0Cj4gYW55Ym9keSBjYW4g
ZWFzaWx5IGxvb2sgb3ZlciB0aGVpciBwYXRjaGVzIGJlZm9yZSBzdWJtaXR0aW5nIHRoZW0uCj4g
QW5kIGZvciBhbiBvY2Nhc2lvbmFsIGlzc3VlIEkgdGhpbmsgYSB0ZXJzZSByZXBseSBpcyBxdWl0
ZSByZWFzb25hYmxlCj4gdG8gaGF2ZS4KClRoaXMgc29ydCBvZiBzb3VuZHMgbGlrZSB5b3UgYXJl
ICppbnRlbmRpbmcqIHRvIGV4cHJlc3MgYW5ub3lhbmNlPwoKSWYgc28sIHRoYXQncyBhIHNsaWdo
dGx5IGRpZmZlcmVudCBxdWVzdGlvbiB0aGFuIHdoYXQgdGhpcyBzZWN0aW9uIGlzCmFkZHJlc3Np
bmcuIDotKQoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
