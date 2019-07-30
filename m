Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB607AABC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 16:18:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSur-0008P8-Pa; Tue, 30 Jul 2019 14:15:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wvG0=V3=amazon.de=prvs=10786bff1=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hsSup-0008P3-QP
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 14:15:48 +0000
X-Inumbo-ID: 86019246-b2d4-11e9-9239-133bd22f9861
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86019246-b2d4-11e9-9239-133bd22f9861;
 Tue, 30 Jul 2019 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1564496146; x=1596032146;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6g5m4/PQD76s8pLXn3XDA4BKVUQLRVRwd/bU9Zihelc=;
 b=oy7oYsIwhK3PR3jA+D/bN2qhpuhgSXPmn9lwUufno+dQzBMwzBMFP9Fv
 wjGGDyMmNxl35z9FrLCHJjYb1xpF5Brfp7U+B1VWpQX24qTtQZvuugLcv
 L8wVAnRLVZlDwN3btlFlfA9vVrrcV5CAoQ6qt62mQbphWPH8fELBpneSZ w=;
X-IronPort-AV: E=Sophos;i="5.64,327,1559520000"; d="scan'208";a="413054965"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Jul 2019 14:15:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 06665A23B8; Tue, 30 Jul 2019 14:15:44 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Jul 2019 14:15:44 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.160.20) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Jul 2019 14:15:37 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1564492503-22716-1-git-send-email-nmanthey@amazon.de>
 <1564492503-22716-2-git-send-email-nmanthey@amazon.de>
 <1687791e-0c6a-5fc0-36f1-e8429e829590@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <ef29a446-1552-64f2-8ef6-34033edf82fc@amazon.de>
Date: Tue, 30 Jul 2019 16:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1687791e-0c6a-5fc0-36f1-e8429e829590@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.20]
X-ClientProxiedBy: EX13D24UWB002.ant.amazon.com (10.43.161.159) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v4 1/2] common/grant_table:
 harden bound accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel
 Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bjoern
 Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMC8xOSAxNTozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDcuMjAxOSAxNTox
NSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiBHdWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxl
IG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxlZAo+PiBkYXRhIHRvIHRoZW0u
IFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkgbG9hZHMgYWZ0ZXIgYm91bmQK
Pj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQgYWNjZXNzZXMsIHdlCj4+IHVzZSB0aGUgYXJyYXlfaW5kZXhfbm9zcGVjIG1hY3JvIHdoZXJl
IGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybwo+PiBibG9ja19zcGVjdWxhdGlvbi4gTm90ZSwgdGhl
IGJsb2NrX3NwZWN1bGF0aW9uIG1hY3JvIGlzIHVzZWQgb24gYWxsCj4+IHBhdGggaW4gc2hhcmVk
X2VudHJ5X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcy4gVGhpcyB3YXksIGFmdGVyIGEKPj4g
Y2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVja3MgdGhhdCBoYXBwZW5lZCBi
ZWZvcmUgYmVjb21lCj4+IGFyY2hpdGVjdHVyYWwgdmlzaWJsZSwgc28gdGhhdCBubyBhZGRpdGlv
bmFsIHByb3RlY3Rpb24gaXMgcmVxdWlyZWQKPj4gZm9yIGNvcnJlc3BvbmRpbmcgYXJyYXkgYWNj
ZXNzZXMuIEFzIHRoZSB3YXkgd2UgaW50cm9kdWNlIGFuIGxmZW5jZQo+PiBpbnN0cnVjdGlvbiBt
aWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRhaW4gdmFsdWVzIGZyb20KPj4g
bWVtb3J5IG11bHRpcGxlIHRpbWVzLCB3ZSB0cnkgdG8gYXZvaWQgc3BlY3VsYXRpdmVseSBjb250
aW51aW5nCj4+IGV4ZWN1dGlvbiB3aXRoIHN0YWxlIHJlZ2lzdGVyIGRhdGEgYnkgbW92aW5nIHJl
bGV2YW50IGRhdGEgaW50bwo+PiBmdW5jdGlvbiBsb2NhbCB2YXJpYWJsZXMuCj4+Cj4+IFNwZWN1
bGF0aXZlIGV4ZWN1dGlvbiBpcyBub3QgYmxvY2tlZCBpbiBjYXNlIG9uZSBvZiB0aGUgZm9sbG93
aW5nCj4+IHByb3BlcnRpZXMgaXMgdHJ1ZToKPj4gICAtIHBhdGggY2Fubm90IGJlIHRyaWdnZXJl
ZCBieSB0aGUgZ3Vlc3QKPj4gICAtIHBhdGggZG9lcyBub3QgcmV0dXJuIHRvIHRoZSBndWVzdAo+
PiAgIC0gcGF0aCBkb2VzIG5vdCByZXN1bHQgaW4gYW4gb3V0LW9mLWJvdW5kIGFjY2Vzcwo+Pgo+
PiBPbmx5IHRoZSBjb21iaW5hdGlvbiBvZiB0aGUgYWJvdmUgcHJvcGVydGllcyBhbGxvd3MgdG8g
YWN0dWFsbHkgbGVhawo+PiBjb250aW51b3VzIGNodW5rcyBvZiBtZW1vcnkuIFRoZXJlZm9yZSwg
d2Ugb25seSBhZGQgdGhlIHBlbmFsdHkgb2YKPj4gcHJvdGVjdGl2ZSBtZWNoYW5pc21zIGluIGNh
c2UgYSBwb3RlbnRpYWwgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kCj4+IGFjY2VzcyBtYXRjaGVz
IGFsbCB0aGUgYWJvdmUgcHJvcGVydGllcy4KPj4KPj4gVGhpcyBjb21taXQgYWRkcmVzc2VzIG9u
bHkgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIHdob3NlIGluZGV4IGlzCj4+IGRpcmVjdGx5IGNvbnRy
b2xsZWQgYnkgdGhlIGd1ZXN0LCBhbmQgdGhlIGluZGV4IGlzIGNoZWNrZWQgYmVmb3JlLgo+PiBQ
b3RlbnRpYWwgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIHRoYXQgYXJlIGNhdXNlZCBieSBzcGVjdWxh
dGl2ZWx5Cj4+IGV2YWx1YXRpbmcgdGhlIHZlcnNpb24gb2YgdGhlIGN1cnJlbnQgdGFibGUgYXJl
IG5vdCBhZGRyZXNzZWQgaW4gdGhpcwo+PiBjb21taXQuIEhlbmNlLCBzcGVjdWxhdGl2ZSBvdXQt
b2YtYm91bmQgYWNjZXNzZXMgbWlnaHQgc3RpbGwgYmUKPj4gcG9zc2libGUsIGZvciBleGFtcGxl
IGluIGdudHRhYl9nZXRfc3RhdHVzX2ZyYW1lX21mbiwgd2hlbiBjYWxsaW5nCj4+IGdudHRhYl9n
cm93X3RhYmxlLCB0aGUgYXNzZXJ0aW9uIHRoYXQgdGhlIGdyYW50IHRhYmxlIHZlcnNpb24gZXF1
YWxzCj4+IHR3byBtaWdodCBub3QgaG9sZCB1bmRlciBzcGVjdWxhdGlvbi4KPj4KPj4gVGhpcyBp
cyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPj4gUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+Cj4+IE5vdGVzOgo+
PiAgICB2MzogIERyb3AgY29uZGl0aW9uIHRvIG5vdCBmaXggZGVmZWN0cyBpbiBjb21taXQgbWVz
c2FnZS4KPj4gICAgICAgICBDb3B5IGluIHJldmlld2VkLWJ5Lgo+IEFjY29yZGluZyB0byB0aGlz
ICh3aGljaCBhaXVpIG1lYW5zIHY0KSB0aGVyZSBhcmUgbm8gY29kZSBjaGFuZ2VzCj4gY29tcGFy
ZWQgdG8gdjMuIEF0IHRoZSByaXNrIG9mIGFubm95aW5nIHlvdSwgdGhpcyBkb2Vzbid0IGZpdCB3
ZWxsCj4gd2l0aCBtZSBoYXZpbmcgc2FpZCAiYW5kIHRoZW4gcGVyaGFwcyBtYWtlIGNoYW5nZXMg
dG8gYSBmZXcgbW9yZQo+IHBhdGhzIiBhbG9uZ3NpZGUgdGhlIG9wdGlvbiBvZiBkb2luZyB0aGlz
IHJlbW92YWwgaW4gcmVwbHkgdG8gdjMuCj4gQWZ0ZXIgYWxsIHlvdSd2ZSBub3cgZHJvcHBlZCBh
IGNvbmRpdGlvbiBmcm9tIHdoYXQgaXMgY292ZXJlZCBieQo+ICJPbmx5IHRoZSBjb21iaW5hdGlv
biBvZiAuLi4iLCBhbmQgaGVuY2UgdGhlcmUncyBhIHdpZGVyIHNldCBvZgo+IHBhdGhzIHRoYXQg
d291bGQgbmVlZCB0byBiZSBmaXhlZC4gSXQgd2FzIGZvciB0aGlzIHJlYXNvbiB0aGF0IGFzCj4g
dGhlIG90aGVyIGFsdGVybmF0aXZlIEkgZGlkIHN1Z2dlc3QgdG8gc2ltcGx5IHdlYWtlbiB0aGUg
d29yZGluZwo+IG9mIHRoZSBpdGVtIHlvdSd2ZSBub3cgZHJvcHBlZC4gSU9XIEknbSBhZnJhaWQg
bXkgUi1iIGlzIG5vdAo+IGFwcGxpY2FibGUgdG8gdjQuCgpJIHNlZSwgYW5kIGFtIHNvcnJ5IGZv
ciB0aGUgbWlzdW5kZXJzdGFuZGluZy4gSSBhbSBmaW5lIHdpdGggYWRkaW5nIHRoZQo0dGggY29u
ZGl0aW9uIGluIGEgd2Vha2VuZWQgZm9ybSAoZXNzZW50aWFsbHkgbW9kaWZ5aW5nIHRoZSBjb21t
aXQKbWVzc2FnZSB0byB0aGUgZm9ybSB5b3Ugc3VnZ2VzdGVkKS4gSSB3b25kZXIgd2hldGhlciB0
aGUgc3VtbWFyeSB3aGVuIHRvCmZpeCBhIHBvdGVudGlhbCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQgYWNjZXNzIHNob3VsZCBhY3R1YWxseSBiZQpkb2N1bWVudGVkIHNvbWV3aGVyZSBlbHNlIHRo
YW4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9mIHRoaXMgKG1vcmUgb3IKbGVzcyByYW5kb20pIGNv
bW1pdC4KCkJlc3QsCk5vcmJlcnQKCj4KPiBKYW4KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRl
ciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVo
cnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGlu
ClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
