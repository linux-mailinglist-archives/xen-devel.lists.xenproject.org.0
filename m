Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16B15FA5A
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:24:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kHN-0000Om-F5; Fri, 14 Feb 2020 23:21:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kHL-0000OF-FG
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:21:47 +0000
X-Inumbo-ID: c522203c-4f80-11ea-bb5b-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c522203c-4f80-11ea-bb5b-12813bfff9fa;
 Fri, 14 Feb 2020 23:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722507; x=1613258507;
 h=date:from:to:subject:message-id:mime-version;
 bh=1fLOsGyjydnuCdMIlSr0tRhTDRsX7ZRCLdT+L++drvk=;
 b=DbMh0I/U1CZ9lqQETNR5cZlAspsl5bLkuUPfeW5hy4RbvH5U0GprSXqY
 VjRBOL63n/YIrMRMP4XFrVw9PWTArFuBdTH4tYMl7KPCK8Y480D7yYJIN
 82lILRvCSdMwPVnjnqyCkYKzUBKUgXspWuiJ0LhXeMISfVVhyDrdJn9Ou w=;
IronPort-SDR: alGkphRrlsws2hadl8S9c/eZyCGO7Z01dk4t0uMbaNcrIZgDXf7iizySPNmo2aoN60Pt/CeZH3
 cqsJr0cy5oHg==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="17277260"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 14 Feb 2020 23:21:34 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 455CEA0719; Fri, 14 Feb 2020 23:21:32 +0000 (UTC)
Received: from EX13D08UEB001.ant.amazon.com (10.43.60.245) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:21:20 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB001.ant.amazon.com (10.43.60.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:21:20 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:21:20 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 003184028E; Fri, 14 Feb 2020 23:21:19 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:21:19 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC RESEND PATCH v3 00/12] Enable PM hibernation on
 guest VMs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVzZW5kaW5nIHRoaXMgaW4gYSBtb3JlIHRocmVhZGVkIGZvcm1hdC4KICAKSGVsbG8sCkkgYW0g
c2VuZGluZyBvdXQgYSB2MyB2ZXJzaW9uIG9mIHNlcmllcyBvZiBwYXRjaGVzIHRoYXQgaW1wbGVt
ZW50cyBndWVzdApQTSBoaWJlcm5hdGlvbi4KVGhlc2UgZ3Vlc3RzIGFyZSBydW5uaW5nIG9uIHhl
biBoeXBlcnZpc29yLiBUaGUgcGF0Y2hlcyBoYWQgYmVlbiB0ZXN0ZWQKYWdhaW5zdCBtYWluc3Ry
ZWFtIGtlcm5lbC4gRUMyIGluc3RhbmNlIGhpYmVybmF0aW9uIGZlYXR1cmUgaXMgcHJvdmlkZWQK
dG8gdGhlIEFXUyBFQzIgY3VzdG9tZXJzLiBQTSBoaWJlcm5hdGlvbiB1c2VzIHN3YXAgc3BhY2Ug
Y2FydmVkIG91dCB3aXRoaW4KdGhlIGd1ZXN0W29yIGNhbiBiZSBhIHNlcGFyYXRlIHBhcnRpdGlv
bl0sIHdoZXJlIGhpYmVybmF0aW9uIGltYWdlIGlzCnN0b3JlZCBhbmQgcmVzdG9yZWQgZnJvbS4K
CkRvaW5nIGd1ZXN0IGhpYmVybmF0aW9uIGRvZXMgbm90IGludm9sdmUgYW55IHN1cHBvcnQgZnJv
bSBoeXBlcnZpc29yIGFuZAp0aGlzIHdheSBndWVzdCBoYXMgY29tcGxldGUgY29udHJvbCBvdmVy
IGl0cyBzdGF0ZS4gSW5mcmFzdHJ1Y3R1cmUKcmVzdHJpY3Rpb25zIGZvciBzYXZpbmcgdXAgZ3Vl
c3Qgc3RhdGUgY2FuIGJlIG92ZXJjb21lIGJ5IGd1ZXN0IGluaXRpYXRlZApoaWJlcm5hdGlvbi4K
ClRoaXMgc2VyaWVzIGluY2x1ZGVzIHNvbWUgaW1wcm92ZW1lbnRzIG92ZXIgUkZDIHNlcmllcyBz
ZW50IGxhc3QgeWVhcjoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE4LTA2L21zZzAwODIzLmh0bWwKCkNoYW5nZWxvZyB2MzoKMS4gRmVlZGJh
Y2sgZnJvbSBWMgoyLiBJbnRyb2R1Y2VkIDIgbmV3IHBhdGNoZXMgZm9yIHhlbiBzY2hlZCBjbG9j
ayBvZmZzZXQgZml4CjMuIEZpeGVkIHBpcnEgc2h1dGRvd24vcmVzdG9yZSBpbiBnZW5lcmljIGly
cSBzdWJzeXN0ZW0KNC4gU3BsaXQgc2F2ZS9yZXN0b3JlIHN0ZWFsIGNsb2NrIHBhdGNoZXMgaW50
byAyIGZvciBiZXR0ZXIgcmVhZGFiaWxpdHkKCkNoYW5nZWxvZyB2MjoKMS4gUmVtb3ZlZCB0aW1l
b3V0L3JlcXVlc3QgcHJlc2VudCBvbiB0aGUgcmluZyBpbiB4ZW4tYmxrZnJvbnQgZHVyaW5nIGJs
a2Zyb250IGZyZWV6ZQoyLiBGaXhlZCByZXN0b3Jpbmcgb2YgUElSUXMgd2hpY2ggd2FzIGFwcGFy
ZW50bHkgd29ya2luZyBmb3IgNC45IGtlcm5lbHMgYnV0IG5vdCBmb3IKbmV3ZXIga2VybmVsLiBb
TGVnYWN5IGlycXMgd2VyZSBubyBsb25nZXIgcmVzdG9yZWQgYWZ0ZXIgaGliZXJuYXRpb24gaW50
cm9kdWNlZCB3aXRoCnRoaXMgY29tbWl0ICIwMjBkYjlkM2MxZGMwIl0KMy4gTWVyZ2VkIGNvdXBs
ZSBvZiByZWxhdGVkIHBhdGNoZXMgdG8gbWFrZSB0aGUgY29kZSBtb3JlIGNvaGVyZW50IGFuZCBy
ZWFkYWJsZQo0LiBDb2RlIHJlZmFjdG9yaW5nCjUuIFNjaGVkIGNsb2NrIGZpeCB3aGVuIGhpYmVy
bmF0aW5nIGd1ZXN0IGlzIHVuZGVyIGhlYXZ5IENQVSBsb2FkCk5vdGU6IFVuZGVyIHZlcnkgcmFy
ZSBjaXJjdW1zdGFuY2VzIHdlIHNlZSByZXN1bWUgZmFpbHVyZXMgd2l0aCBLQVNMUiBlbmFibGVk
IG9ubHkKb24geGVuIGluc3RhbmNlcy4gIFdlIGFyZSByb3VnaGx5IHNlZWluZyAzJSBmYWlsdXJl
cyBbPjEwMDAgcnVuc10gd2hlbiB0ZXN0aW5nIHdpdGgKdmFyaW91cyBpbnN0YW5jZSBzaXplcyBh
bmQgc29tZSB3b3JrbG9hZCBydW5uaW5nIG9uIGVhY2ggaW5zdGFuY2UuIEkgYW0gY3VycmVudGx5
CmludmVzdGlnYXRpbmcgdGhlIGlzc3VlIGFzIHRvIGNvbmZpcm0gaWYgaXRzIGEgeGVuIGlzc3Vl
IG9yIGtlcm5lbCBpc3N1ZS4KSG93ZXZlciwgaXQgc2hvdWxkIG5vdCBob2xkIGJhY2sgYW55b25l
IGZyb20gcmV2aWV3aW5nL2FjY2VwdGluZyB0aGVzZSBwYXRjaGVzLgoKVGVzdGluZyBkb25lOgpB
bGwgdGVzdGluZyBpcyBkb25lIGZvciBtdWx0aXBsZSBoaWJlcm5hdGlvbiBjeWNsZSBmb3IgNS40
IGtlcm5lbCBvbiBFQzIuCgpUZXN0aW5nIEhvdyB0bzoKLS0tLS0tLS0tLS0tLS0tCkV4YW1wbGU6
ClNldCB1cCBhIGZpbGUtYmFja2VkIHN3YXAgc3BhY2UuIFN3YXAgZmlsZSBzaXplPj1Ub3RhbCBt
ZW1vcnkgb24gdGhlIHN5c3RlbQpzdWRvIGRkIGlmPS9kZXYvemVybyBvZj0vc3dhcCBicz0kKCgg
MTAyNCAqIDEwMjQgKSkgY291bnQ9NDA5NiAjIDQwOTZNaUIKc3VkbyBjaG1vZCA2MDAgL3N3YXAK
c3VkbyBta3N3YXAgL3N3YXAKc3VkbyBzd2Fwb24gL3N3YXAKClVwZGF0ZSByZXN1bWUgZGV2aWNl
L3Jlc3VtZSBvZmZzZXQgaW4gZ3J1YiBpZiB1c2luZyBzd2FwIGZpbGU6CnJlc3VtZT0vZGV2L3h2
ZGExIHJlc3VtZV9vZmZzZXQ9MjAwNzA0CgpFeGVjdXRlOgotLS0tLS0tLQpzdWRvIHBtLWhpYmVy
bmF0ZQpPUgplY2hvIGRpc2sgPiAvc3lzL3Bvd2VyL3N0YXRlICYmIGVjaG8gcmVib290ID4gL3N5
cy9wb3dlci9kaXNrCgpDb21wdXRlIHJlc3VtZSBvZmZzZXQgY29kZToKIgojIS91c3IvYmluL2Vu
diBweXRob24KaW1wb3J0IHN5cwppbXBvcnQgYXJyYXkKaW1wb3J0IGZjbnRsCgojc3dhcCBmaWxl
CmYgPSBvcGVuKHN5cy5hcmd2WzFdLCAncicpCmJ1ZiA9IGFycmF5LmFycmF5KCdMJywgWzBdKQoK
I0ZJQk1BUApyZXQgPSBmY250bC5pb2N0bChmLmZpbGVubygpLCAweDAxLCBidWYpCnByaW50IGJ1
ZlswXQoiCgpBbGVrc2VpIEJlc29nb25vdiAoMSk6CiAgUE0gLyBoaWJlcm5hdGU6IHVwZGF0ZSB0
aGUgcmVzdW1lIG9mZnNldCBvbiBTTkFQU0hPVF9TRVRfU1dBUF9BUkVBCgpBbmNoYWwgQWdhcndh
bCAoNCk6CiAgeDg2L3hlbjogSW50cm9kdWNlIG5ldyBmdW5jdGlvbiB0byBtYXAgSFlQRVJWSVNP
Ul9zaGFyZWRfaW5mbyBvbgogICAgUmVzdW1lCiAgZ2VuaXJxOiBTaHV0ZG93biBpcnEgY2hpcHMg
aW4gc3VzcGVuZC9yZXN1bWUgZHVyaW5nIGhpYmVybmF0aW9uCiAgeGVuOiBJbnRyb2R1Y2Ugd3Jh
cHBlciBmb3Igc2F2ZS9yZXN0b3JlIHNjaGVkIGNsb2NrIG9mZnNldAogIHhlbjogVXBkYXRlIHNj
aGVkIGNsb2NrIG9mZnNldCB0byBhdm9pZCBzeXN0ZW0gaW5zdGFiaWxpdHkgaW4KICAgIGhpYmVy
bmF0aW9uCgpNdW5laGlzYSBLYW1hdGEgKDcpOgogIHhlbi9tYW5hZ2U6IGtlZXAgdHJhY2sgb2Yg
dGhlIG9uLWdvaW5nIHN1c3BlbmQgbW9kZQogIHhlbmJ1czogYWRkIGZyZWV6ZS90aGF3L3Jlc3Rv
cmUgY2FsbGJhY2tzIHN1cHBvcnQKICB4ODYveGVuOiBhZGQgc3lzdGVtIGNvcmUgc3VzcGVuZCBh
bmQgcmVzdW1lIGNhbGxiYWNrcwogIHhlbi1uZXRmcm9udDogYWRkIGNhbGxiYWNrcyBmb3IgUE0g
c3VzcGVuZCBhbmQgaGliZXJuYXRpb24gc3VwcG9ydAogIHhlbi1ibGtmcm9udDogYWRkIGNhbGxi
YWNrcyBmb3IgUE0gc3VzcGVuZCBhbmQgaGliZXJuYXRpb24KICB4ZW4vdGltZTogaW50cm9kdWNl
IHhlbl97c2F2ZSxyZXN0b3JlfV9zdGVhbF9jbG9jawogIHg4Ni94ZW46IHNhdmUgYW5kIHJlc3Rv
cmUgc3RlYWwgY2xvY2sKCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jICAgICAgfCAgIDgg
KysKIGFyY2gveDg2L3hlbi9zdXNwZW5kLmMgICAgICAgICAgICB8ICA3MiArKysrKysrKysrKysr
KysrKysKIGFyY2gveDg2L3hlbi90aW1lLmMgICAgICAgICAgICAgICB8ICAxOCArKysrLQogYXJj
aC94ODYveGVuL3hlbi1vcHMuaCAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvYmxvY2sveGVu
LWJsa2Zyb250LmMgICAgICB8IDExOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGRy
aXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jICAgICAgICB8ICA5OCArKysrKysrKysrKysrKysrKysr
KysrKy0KIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jICB8ICAgMSArCiBkcml2ZXJz
L3hlbi9tYW5hZ2UuYyAgICAgICAgICAgICAgfCAgNzMgKysrKysrKysrKysrKysrKysrCiBkcml2
ZXJzL3hlbi90aW1lLmMgICAgICAgICAgICAgICAgfCAgMjkgKysrKysrKy0KIGRyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmUuYyB8ICA5OSArKysrKysrKysrKysrKysrKysrKy0tLS0tCiBp
bmNsdWRlL2xpbnV4L2lycS5oICAgICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVkZS94ZW4veGVu
LW9wcy5oICAgICAgICAgICAgIHwgICA4ICsrCiBpbmNsdWRlL3hlbi94ZW5idXMuaCAgICAgICAg
ICAgICAgfCAgIDMgKwoga2VybmVsL2lycS9jaGlwLmMgICAgICAgICAgICAgICAgIHwgICAyICst
CiBrZXJuZWwvaXJxL2ludGVybmFscy5oICAgICAgICAgICAgfCAgIDEgKwoga2VybmVsL2lycS9w
bS5jICAgICAgICAgICAgICAgICAgIHwgIDMxICsrKysrLS0tCiBrZXJuZWwvcG93ZXIvdXNlci5j
ICAgICAgICAgICAgICAgfCAgIDYgKy0KIDE3IGZpbGVzIGNoYW5nZWQsIDUzMyBpbnNlcnRpb25z
KCspLCA0MCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjEuQU1aTgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
