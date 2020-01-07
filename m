Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382A133788
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:40:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyP4-0000nt-AZ; Tue, 07 Jan 2020 23:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyP2-0000no-TT
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:36:48 +0000
X-Inumbo-ID: 8da286f8-31a6-11ea-bf56-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8da286f8-31a6-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 23:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440200; x=1609976200;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=My8oU4ytBcdcQ+UejUzlcPtOhmb8DAm8xNHPkmPJYvQ=;
 b=H6NGKtDKdgb6PmM+a20b1C8P6fI+DOJhCNmucoNel5EbQnlMQg6s9FUc
 wYzTeMabb0+vz9Q2QCj28sv/07pqVqn5l8bhPCL7mVYU7lG50e/I//kUy
 orrReDXFgd9d/vJyDu/hQ8JfBeiL2tIh3o+VsS4SD0hG4Awsl8mEBp5mE U=;
IronPort-SDR: sD0hFGoR+riFpzTxnD5uoaQgk4FuSlaIatLnlspL6yw4MTCBhzx49SWPF1KM3u++pTozpnXqG6
 46roJ3NRDYOg==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="11930335"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 07 Jan 2020 23:36:36 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 378EFA24D9; Tue,  7 Jan 2020 23:36:35 +0000 (UTC)
Received: from EX13D01UWB001.ant.amazon.com (10.43.161.75) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:36:25 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13d01UWB001.ant.amazon.com (10.43.161.75) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:36:24 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:36:24 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id D304340E0B; Tue,  7 Jan 2020 23:36:24 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:36:24 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.co>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>
Message-ID: <20200107233624.GA16802@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 00/11] Enable PM hibernation on guest VMs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: anchalag@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCkkgYW0gc2VuZGluZyBvdXQgYSBWMiB2ZXJzaW9uIG9mIHNlcmllcyBvZiBwYXRjaGVz
IHRoYXQgaW1wbGVtZW50cyBndWVzdCAKUE0gaGliZXJuYXRpb24uClRoZXNlIGd1ZXN0cyBhcmUg
cnVubmluZyBvbiB4ZW4gaHlwZXJ2aXNvci4gVGhlIHBhdGNoZXMgaGFkIGJlZW4gdGVzdGVkCmFn
YWluc3QgbWFpbnN0cmVhbSBrZXJuZWwuIEVDMiBpbnN0YW5jZSBoaWJlcm5hdGlvbiBmZWF0dXJl
IGlzIHByb3ZpZGVkIAp0byB0aGUgQVdTIEVDMiBjdXN0b21lcnMuIFBNIGhpYmVybmF0aW9uIHVz
ZXMgc3dhcCBzcGFjZSBjYXJ2ZWQgb3V0IHdpdGhpbiAKdGhlIGd1ZXN0W29yIGNhbiBiZSBhIHNl
cGFyYXRlIHBhcnRpdGlvbl0sIHdoZXJlIGhpYmVybmF0aW9uIGltYWdlIGlzIApzdG9yZWQgYW5k
IHJlc3RvcmVkIGZyb20uCgpXaHkgaXMgZ3Vlc3QgaGliZW5yYXRpb24gbmVlZGVkOgpEb2luZyBn
dWVzdCBoaWJlcm5hdGlvbiBkb2VzIG5vdCBpbnZvbHZlIGFueSBzdXBwb3J0IGZyb20gaHlwZXJ2
aXNvciBhbmQgdGhpcwp3YXkgZ3Vlc3QgaGFzIGNvbXBsZXRlIGNvbnRyb2wgb3ZlciBpdHMgc3Rh
dGUuIEluZnJhc3RydWN0dXJlIHJlc3RyaWN0aW9ucyBsaWtlCnNhdmluZyB1cCBndWVzdCBzdGF0
ZSBldGMgY2FuIGJlIG92ZXJjb21lIGJ5IGd1ZXN0IGluaXRpYXRlZCBoaWJlcm5hdGlvbi4KClRo
aXMgc2VyaWVzIGluY2x1ZGVzIHNvbWUgaW1wcm92ZW1lbnRzIG92ZXIgUkZDIHNlcmllcyBzZW50
IGxhc3QgeWVhcjoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE4LTA2L21zZzAwODIzLmh0bWwKCkFueSBjb21tZW50cyBvciBzdWdnZXN0aW9u
cyBhcmUgd2VsY29tZS4KCkNoYW5nZWxvZyB2MjoKMS4gUmVtb3ZlZCB0aW1lb3V0L3JlcXVlc3Qg
cHJlc2VudCBvbiB0aGUgcmluZyBpbiB4ZW4tYmxrZnJvbnQgZHVyaW5nIGJsa2Zyb250IGZyZWV6
ZQoyLiBGaXhlZCByZXN0b3Jpbmcgb2YgUElSUXMgd2hpY2ggd2FzIGFwcGFyZW50bHkgd29ya2lu
ZyBmb3IgNC45IGtlcm5lbHMgYnV0IG5vdCBmb3IKbmV3ZXIga2VybmVsLiBbTGVnYWN5IGlycXMg
d2VyZSBubyBsb25nZXIgcmVzdG9yZWQgYWZ0ZXIgaGliZXJuYXRpb24gaW50cm9kdWNlZCB3aXRo
CnRoaXMgY29tbWl0ICIwMjBkYjlkM2MxZGMwIl0KMy4gTWVyZ2VkIGNvdXBsZSBvZiByZWxhdGVk
IHBhdGNoZXMgdG8gbWFrZSB0aGUgY29kZSBtb3JlIGNvaGVyZW50IGFuZCByZWFkYWJsZQo0LiBD
b2RlIHJlZmFjdG9yaW5nCjUuIFNjaGVkIGNsb2NrIGZpeCB3aGVuIGhpYmVybmF0aW5nIGd1ZXN0
IGlzIHVuZGVyIGhlYXZ5IENQVSBsb2FkCk5vdGU6IFVuZGVyIHZlcnkgcmFyZSBjaXJjdW1zdGFu
Y2VzIHdlIHNlZSByZXN1bWUgZmFpbHVyZXMgd2l0aCBLQVNMUiBlbmFibGVkIG9ubHkKb24geGVu
IGluc3RhbmNlcy4gIFdlIGFyZSByb3VnaGx5IHNlZWluZyAzJSBmYWlsdXJlcyBbPjEwMDAgcnVu
c10gd2hlbiB0ZXN0aW5nIHdpdGgKdmFyaW91cyBpbnN0YW5jZSBzaXplcyBhbmQgc29tZSB3b3Jr
bG9hZCBydW5uaW5nIG9uIGVhY2ggaW5zdGFuY2UuIEkgYW0gY3VycmVudGx5CmludmVzdGlnYXRp
bmcgdGhlIGlzc3VlIGFzIHRvIGNvbmZpcm0gaWYgaXRzIGEgeGVuIGlzc3VlIG9yIGtlcm5lbCBp
c3N1ZS4KSG93ZXZlciwgaXQgc2hvdWxkIG5vdCBob2xkIGJhY2sgYW55b25lIGZyb20gcmV2aWV3
aW5nL2FjY2VwdGluZyB0aGVzZSBwYXRjaGVzLgoKVGVzdGluZyBkb25lOgpBbGwgdGhlIHRlc3Rp
bmcgaXMgZG9uZSB1c2luZyBhbWF6b24gbGludXggaW1hZ2VzIHcvdCBzdG9jayB1cHN0cmVhbSBr
ZXJuZWwKaW5zdGFsbGVkLiBBbGwgdGVzdGluZyBpcyBkb25lIGZvciBtdWx0aXBsZSBoaWJlcm5h
dGlvbiBjeWNsZS4KCmkuIG11bHRpcGxlIGxvb3BzW34xMDBdIG9mIGhpYmVybmF0aW9uIGluIGRp
c2sgbW9kZSA8cmVib290PiB3L3QgNS40IGd1ZXN0IGtlcm5lbCArIDQuMTEgeGVuCmlpLiBIaWJl
cm5hdGlvbiB0ZXN0ZWQgd2l0aCBtZW1vcnkgc3RyZXNzIHRlc3RlciBydW5uaW5nIGluIGJhY2tn
cm91bmQgb24gc21hbGxlciBhbmQKbGFyZ2VyIGluc3RhbmNlIHNpemVzIG9uIEVDMi5bPjUwMCBy
dW5zXQppaWkuIFRlc3RpbmcgaXMgYWxzbyBkb25lIG9uIHBoeXNpY2FsIGhvc3QgbWFjaGluZVtV
YnVudHUxOC4wNC80LjE1IGtlcm5lbC9zdG9jayB4ZW4tNC42XQpydW5uaW5nIGFtYXpvbiBsaW51
eCAyIE9TIGFzIGd1ZXN0IFZNIHdpdGggbXVsdGlwbGUgcXVldWVzLgppdi4gUmFuIGRkIHRvIHdy
aXRlIGEgbGFyZ2UgZmlsZSB3aXRoIGJzPTFrIGFuZCBoaWJlcm5hdGVkIG11bHRpcGxlIHRpbWVz
CgpUZXN0aW5nIEhvdyB0bzoKLS0tLS0tLS0tLS0tLS0tCkV4YW1wbGU6ClNldCB1cCBhIGZpbGUt
YmFja2VkIHN3YXAgc3BhY2UuIFN3YXAgZmlsZSBzaXplPj1Ub3RhbCBtZW1vcnkgb24gdGhlIHN5
c3RlbQpzdWRvIGRkIGlmPS9kZXYvemVybyBvZj0vc3dhcCBicz0kKCggMTAyNCAqIDEwMjQgKSkg
Y291bnQ9NDA5NiAjIDQwOTZNaUIKc3VkbyBjaG1vZCA2MDAgL3N3YXAKc3VkbyBta3N3YXAgL3N3
YXAKc3VkbyBzd2Fwb24gL3N3YXAKClVwZGF0ZSByZXN1bWUgZGV2aWNlL3Jlc3VtZSBvZmZzZXQg
aW4gZ3J1YiBpZiB1c2luZyBzd2FwIGZpbGU6CnJlc3VtZT0vZGV2L3h2ZGExIHJlc3VtZV9vZmZz
ZXQ9MjAwNzA0CgpFeGVjdXRlOgotLS0tLS0tLQpzdWRvIHBtLWhpYmVybmF0ZQpPUgplY2hvIGRp
c2sgPiAvc3lzL3Bvd2VyL3N0YXRlICYmIGVjaG8gcmVib290ID4gL3N5cy9wb3dlci9kaXNrCgpD
b21wdXRlIHJlc3VtZSBvZmZzZXQgY29kZToKIgojIS91c3IvYmluL2VudiBweXRob24KaW1wb3J0
IHN5cwppbXBvcnQgYXJyYXkKaW1wb3J0IGZjbnRsCgojc3dhcCBmaWxlCmYgPSBvcGVuKHN5cy5h
cmd2WzFdLCAncicpCmJ1ZiA9IGFycmF5LmFycmF5KCdMJywgWzBdKQoKI0ZJQk1BUApyZXQgPSBm
Y250bC5pb2N0bChmLmZpbGVubygpLCAweDAxLCBidWYpCnByaW50IGJ1ZlswXQoiCgpBbGVrc2Vp
IEJlc29nb25vdiAoMSk6CiAgUE0gLyBoaWJlcm5hdGU6IHVwZGF0ZSB0aGUgcmVzdW1lIG9mZnNl
dCBvbiBTTkFQU0hPVF9TRVRfU1dBUF9BUkVBCgpBbmNoYWwgQWdhcndhbCAoMik6CiAgeDg2L3hl
bjogSW50cm9kdWNlIG5ldyBmdW5jdGlvbiB0byBtYXAgSFlQRVJWSVNPUl9zaGFyZWRfaW5mbyBv
bgogICAgUmVzdW1lCiAgeGVuOiBDbGVhciBJUlFEX0lSUV9TVEFSVEVEIGZsYWcgZHVyaW5nIHNo
dXRkb3duIFBJUlFzCgpFZHVhcmRvIFZhbGVudGluICgxKToKICB4ODY6IHRzYzogYXZvaWQgc3lz
dGVtIGluc3RhYmlsaXR5IGluIGhpYmVybmF0aW9uCgpNdW5laGlzYSBLYW1hdGEgKDcpOgogIHhl
bi9tYW5hZ2U6IGtlZXAgdHJhY2sgb2YgdGhlIG9uLWdvaW5nIHN1c3BlbmQgbW9kZQogIHhlbmJ1
czogYWRkIGZyZWV6ZS90aGF3L3Jlc3RvcmUgY2FsbGJhY2tzIHN1cHBvcnQKICB4ODYveGVuOiBh
ZGQgc3lzdGVtIGNvcmUgc3VzcGVuZCBhbmQgcmVzdW1lIGNhbGxiYWNrcwogIHhlbi1uZXRmcm9u
dDogYWRkIGNhbGxiYWNrcyBmb3IgUE0gc3VzcGVuZCBhbmQgaGliZXJuYXRpb24gc3VwcG9ydAog
IHhlbi1ibGtmcm9udDogYWRkIGNhbGxiYWNrcyBmb3IgUE0gc3VzcGVuZCBhbmQgaGliZXJuYXRp
b24KICB4ODYveGVuOiBzYXZlIGFuZCByZXN0b3JlIHN0ZWFsIGNsb2NrIGR1cmluZyBoaWJlcm5h
dGlvbgogIHg4Ni94ZW46IGNsb3NlIGV2ZW50IGNoYW5uZWxzIGZvciBQSVJRcyBpbiBzeXN0ZW0g
Y29yZSBzdXNwZW5kCiAgICBjYWxsYmFjawoKIGFyY2gveDg2L2tlcm5lbC90c2MuYyAgICAgICAg
ICAgICB8ICAyOSArKysrKysrKysrCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jICAgICAg
fCAgIDggKysrCiBhcmNoL3g4Ni94ZW4vc3VzcGVuZC5jICAgICAgICAgICAgfCAgNjYgKysrKysr
KysrKysrKysrKysrKysrCiBhcmNoL3g4Ni94ZW4vdGltZS5jICAgICAgICAgICAgICAgfCAgIDMg
KwogYXJjaC94ODYveGVuL3hlbi1vcHMuaCAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvYmxv
Y2sveGVuLWJsa2Zyb250LmMgICAgICB8IDExOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLQogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgICAgICAgIHwgIDk4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFz
ZS5jICB8ICAxMyArKysrKwogZHJpdmVycy94ZW4vbWFuYWdlLmMgICAgICAgICAgICAgIHwgIDcz
ICsrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3hlbi90aW1lLmMgICAgICAgICAgICAg
ICAgfCAgMjggKysrKysrKystCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgfCAg
OTkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogaW5jbHVkZS9saW51eC9pcnEuaCAg
ICAgICAgICAgICAgIHwgICAxICsKIGluY2x1ZGUvbGludXgvc2NoZWQvY2xvY2suaCAgICAgICB8
ICAgNSArKwogaW5jbHVkZS94ZW4vZXZlbnRzLmggICAgICAgICAgICAgIHwgICAxICsKIGluY2x1
ZGUveGVuL3hlbi1vcHMuaCAgICAgICAgICAgICB8ICAgOCArKysKIGluY2x1ZGUveGVuL3hlbmJ1
cy5oICAgICAgICAgICAgICB8ICAgMyArCiBrZXJuZWwvaXJxL2NoaXAuYyAgICAgICAgICAgICAg
ICAgfCAgIDMgKy0KIGtlcm5lbC9wb3dlci91c2VyLmMgICAgICAgICAgICAgICB8ICAgNiArLQog
a2VybmVsL3NjaGVkL2Nsb2NrLmMgICAgICAgICAgICAgIHwgICA0ICstCiAxOSBmaWxlcyBjaGFu
Z2VkLCA1MzcgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgotLSAKMi4xNS4zLkFNWk4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
