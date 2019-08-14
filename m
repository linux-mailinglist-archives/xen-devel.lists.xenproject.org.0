Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA208CFF2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 11:45:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxpnb-0002gQ-Mn; Wed, 14 Aug 2019 09:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uZ+=WK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hxpnZ-0002gH-KP
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 09:42:29 +0000
X-Inumbo-ID: d41679f2-be77-11e9-8228-7bb96b8fd71a
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d41679f2-be77-11e9-8228-7bb96b8fd71a;
 Wed, 14 Aug 2019 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565775749;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nA1DsGWCnOsv3rlNrrKJo8EVdxafn/dd6o2QhFCXSE4=;
 b=D+FpGMxOv1U8F9CvJEX+Gm3YrIUBn176DCuzfv3Iq+EBKg78YWi3YYmT
 Q5mTYgYrEWrib68PxwWRZsPB0Q1BgD9XvtlHOibNF2tyDoxSr+o1jMMwA
 GDbKTfgNFKgUUxRgBcpfX+NnUPqudhQr7U8ykXJgxRmq3lTyYno50NQCP 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4H95HaKz0Z9s4j3+TGR4JRyHl2K1WzQWXEnDP+5Dd70k2wGRENmaiE9hF/K6avEhjKE/j2Imcy
 mepwjOWUP6zYgoR6s9wdwZ+eu80IpZSQ1KOqtTBkAXS/qQah7aj5Pn/ema3Ftioi51u/f/Ijnu
 d4qmODAA/y+xVGhoJHpqK3CgBikc/FIgiCS54ok+2kODDU+PGl2YDYNekfSwMQM4w3KK7bedZP
 RgUKH/Do02yALxu0bCvyLIulcgW7ibjKuR+lE6AV4r4t8Ua8tdH+2f3NNvxXq/QRxBzBP7HGKi
 Yzo=
X-SBRS: 2.7
X-MesageID: 4260538
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4260538"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <bb2f0618-77af-ce1d-66da-1ba403e3020c@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <f0a29654-0a94-f506-0645-7efb7ccf725f@citrix.com>
Date: Wed, 14 Aug 2019 10:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <bb2f0618-77af-ce1d-66da-1ba403e3020c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86emul: fix test harness and fuzzer
 build dependencies
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC85LzE5IDQ6NDAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCBmZDM1ZjMyYjRi
ICgidG9vbHMveDg2ZW11bDogVXNlIHN0cnVjdCBjcHVpZF9wb2xpY3kgaW4gdGhlCj4gdXNlcnNw
YWNlIHRlc3QgaGFybmVzc2VzIikgZGlkbid0IGFjY291bnQgZm9yIHRoZSBkZXBlbmRlbmNpZXMg
b2YKPiBjcHVpZC1hdXRvZ2VuLmggdG8gcG90ZW50aWFsbHkgY2hhbmdlIGJldHdlZW4gaW5jcmVt
ZW50YWwgYnVpbGRzLiBJbgo+IHBhcnRpY3VsYXIgdGhlIGhhcm5lc3MgaGFzIGEgInJ1biIgZ29h
bCB3aGljaCBpcyBzdXBwb3NlZCB0byBiZSB1c2FibGUKPiBpbmRlcGVuZGVudGx5IG9mIHRoZSBy
ZXN0IG9mIHRoZSB0b29scyBzdWItdHJlZSBidWlsZGluZywgYW5kIGJvdGggdGhlCj4gaGFybmVz
cyBhbmQgdGhlIGZ1enplciBjb2RlIGFyZSBhbHNvIHN1cHBvc2VkIHRvIGJlIGJ1aWxkYWJsZQo+
IGluZGVwZW5kZW50bHkuIFRoZXJlZm9yZSBhIHJlLWJ1aWxkIG9mIHRoZSBnZW5lcmF0ZWQgaGVh
ZGVyIG5lZWRzIHRvCj4gYmUgdHJpZ2dlcmVkIGZpcnN0LCB3aGljaCBpcyBhY2hpZXZlZCBieSBp
bnRyb2R1Y2luZyBhIG5ldyB0b3AtbGV2ZWwKPiB0YXJnZXQgcGF0dGVybiAoZm9yIGp1c3QgdGhl
ICJydW4iIHBhcnQgZm9yIG5vdykuCj4gCj4gRmluYWxseSBjcHVpZC5vIGRpZCBub3QgaGF2ZSBh
bnkgZGVwZW5kZW5jaWVzIGFkZGVkIGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gVEJEOiBTb21ldGhpbmcgc2ltaWxhciB3
b3VsZCBiZSBuaWNlIGZvciBidWlsZGluZyBib3RoIHRvb2xzL3Rlc3RzLyovCj4gwqDCoMKgwqAg
YW5kIHRvb2xzL2Z1enovKi8sIGJ1dCBJJ20gdW5jZXJ0YWluIHdoZXRoZXIgcmVzcGVjdGl2ZSB0
b3AgbGV2ZWwKPiDCoMKgwqDCoCB0YXJnZXRzIGJ1aWxkLXRlc3RzLSUgYW5kIGJ1aWxkLWZ1enot
JSB3b3VsZCBiZSB3ZWxjb21lLgo+IC0tLQo+IHYzOiBJbnRyb2R1Y2UgdG9wIGxldmVsIHJ1bi10
ZXN0cy0lIHRhcmdldC4KPiB2Mi4xOiBTcGxpdCBjb250cm92ZXJzaWFsIHBhcnRzIGZyb20gKGhv
cGVmdWxseSkgbm9uLWNvbnRyb3ZlcnNpYWwgb25lcy4KPiB2MjogR3VhcmQgJChNQUtFKSBpbnZv
Y2F0aW9ucyBieSAkKE1BS0VMRVZFTCkgY2hlY2tzLgo+IAo+IC0tLSBhL01ha2VmaWxlCj4gKysr
IGIvTWFrZWZpbGUKPiBAQCAtODAsNiArODAsOSBAQCBidWlsZC1kb2NzOgo+IMKgdGVzdDoKPiDC
oMKgwqDCoCAkKE1BS0UpIC1DIHRvb2xzL3B5dGhvbiB0ZXN0Cj4gwqAKPiArcnVuLXRlc3RzLSU6
IGJ1aWxkLXRvb2xzLXB1YmxpYy1oZWFkZXJzIHRvb2xzL3Rlc3RzLyUvCj4gK8KgwqDCoCAkKE1B
S0UpIC1DIHRvb2xzL3Rlc3RzLyQqIHJ1bgo+ICsKPiDCoCMgRm9yIG1vc3QgdGFyZ2V0cyBoZXJl
LAo+IMKgI8KgwqAgbWFrZSBDT01QT05FTlQtVEFSR0VUCj4gwqAjIGlzIGltcGxlbWVudGVkLCBt
b3JlIG9yIGxlc3MsIGJ5CgpIbW0gLS0gVGh1bmRlcmJpcmQgc2VlbXMgdG8ga25vdyB0aGF0IHRo
ZXJlJ3Mgb25seSBvbmUgc3BhY2UgaGVyZSwgYnV0CndoZW4gSSBzYXZlIHRoaXMgbWFpbCBhbmQg
dHJ5IHRvIGBnaXQgYW1gIGl0LCBJIGdldCBodW5rIGZhaWx1cmVzIGxpa2UgdGhpczoKCmBgYApk
aWZmIGEvTWFrZWZpbGUgYi9NYWtlZmlsZQkocmVqZWN0ZWQgaHVua3MpCkBAIC04MCw2ICs4MCw5
IEBAIGJ1aWxkLWRvY3M6CiAgdGVzdDoKICAJJChNQUtFKSAtQyB0b29scy9weXRob24gdGVzdAoK
K3J1bi10ZXN0cy0lOiBidWlsZC10b29scy1wdWJsaWMtaGVhZGVycyB0b29scy90ZXN0cy8lLwor
CSQoTUFLRSkgLUMgdG9vbHMvdGVzdHMvJCogcnVuCisKICAjIEZvciBtb3N0IHRhcmdldHMgaGVy
ZSwKICAjICAgbWFrZSBDT01QT05FTlQtVEFSR0VUCiAgIyBpcyBpbXBsZW1lbnRlZCwgbW9yZSBv
ciBsZXNzLCBieQpgYGAKCk5vdGUgdHdvIHNwYWNlcyBiZWZvcmUgdGhlICMgcmF0aGVyIHRoYW4g
MS4gIEkgbG9va2VkIGF0IHRoZSByYXcgZW1haWwKYW5kIGl0IGhhcyB0d28gc3BhY2VzOgoKYGBg
Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC04MCw2ICs4MCw5IEBAIGJ1aWxkLWRv
Y3M6CiAgdGVzdDoKICAJJChNQUtFKSAtQyB0b29scy9weXRob24gdGVzdAoKK3J1bi10ZXN0cy0l
OiBidWlsZC10b29scy1wdWJsaWMtaGVhZGVycyB0b29scy90ZXN0cy8lLworCSQoTUFLRSkgLUMg
dG9vbHMvdGVzdHMvJCogcnVuCisKICAjIEZvciBtb3N0IHRhcmdldHMgaGVyZSwKICAjICAgbWFr
ZSBDT01QT05FTlQtVEFSR0VUCiAgIyBpcyBpbXBsZW1lbnRlZCwgbW9yZSBvciBsZXNzLCBieQpg
YGAKCk9oLCB3ZWlyZCAtLSBidXQgdGhlIHZlcnNpb24gb24gZ21haWwgaXMgYSBjb21wbGV0ZWx5
IGRpZmZlcmVudAplbmNvZGluZzogZ21haWwgaGFzIGl0IGFzIGVuY29kZWQgYmFzZTY0LCB3aGVy
ZWFzIG15IGNvcnBvcmF0ZSBtYWlsIGhhcwppdCBlbmNvZGVkIGFzIDctYml0LiAgV2hhdCBkb2Vz
IGV2ZXJ5b25lIGVsc2Ugc2VlPwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
