Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FE116C59
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:35:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHIJ-0007XU-5F; Mon, 09 Dec 2019 11:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xl4W=Z7=amazon.com=prvs=239a0b868=sjpark@srs-us1.protection.inumbo.net>)
 id 1ieHII-0007XP-DE
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:33:38 +0000
X-Inumbo-ID: bda9ab42-1a77-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bda9ab42-1a77-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575891218; x=1607427218;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=jCDbQSdoBdfMrVuJUQRfuw9YKJvl0RFzFJ83Wu3g8QU=;
 b=EgTLVB2BmaIqAuenrfyQg0x0+/Ir4PiIXqhWygW4GIxjQVqihXu4p0Om
 9cvbBvLp+otU8vaYo3TDg0pToW4YnyaMf/ijeNaRo/1FXJ2LjDHN747Xi
 mU4uO/O9ccABZkmV5pir2Slt9xKtN4++NWhEqxzrwaaOnLZVirF3VMIgd g=;
IronPort-SDR: L9FyZ/Wo8dtPzPzFif4LsTdQfHQIxKbR+hC5608Mr4rSs8W9JKV103XRU93491eIRRYTYnZCnB
 BKNPXn1P+gLQ==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; d="scan'208";a="12413711"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 09 Dec 2019 11:33:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id B356AA1C95; Mon,  9 Dec 2019 11:33:23 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 11:33:22 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.100) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 11:33:19 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>
Date: Mon, 9 Dec 2019 12:32:40 +0100
Message-ID: <20191209113240.847-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <17131297-6d09-7302-d632-246f62487652@suse.com> (raw)
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D37UWA003.ant.amazon.com (10.43.160.25) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
 memory pressure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "sj38.park@gmail.com" <sj38.park@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA5IERlYyAyMDE5IDEyOjA4OjEwICswMTAwICJKw7xyZ2VuIEdyb8OfIiA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKCj5PbiAwOS4xMi4xOSAxMTo1MiwgU2VvbmdKYWUgUGFyayB3cm90
ZToKPj4gT24gTW9uLCA5IERlYyAyMDE5IDExOjE1OjIyICswMTAwICJKw7xyZ2VuIEdyb8OfIiA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4KPj4+IE9uIDA5LjEyLjE5IDEwOjQ2LCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+PiBGcm9t
OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+IFNlbnQ6IDA5IERlY2VtYmVy
IDIwMTkgMDk6MzkKPj4+Pj4gVG86IFBhcmssIFNlb25namFlIDxzanBhcmtAYW1hem9uLmNvbT47
IGF4Ym9lQGtlcm5lbC5kazsKPj4+Pj4ga29ucmFkLndpbGtAb3JhY2xlLmNvbTsgcm9nZXIucGF1
QGNpdHJpeC5jb20KPj4+Pj4gQ2M6IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgRHVycmFudCwKPj4+Pj4gUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvbT47IHNqMzgucGFya0BnbWFpbC5jb207IHhlbi0KPj4+Pj4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzFdIHhlbi9ibGtiYWNr
OiBTcXVlZXplIHBhZ2UgcG9vbHMgaWYgYSBtZW1vcnkKPj4+Pj4gcHJlc3N1cmUKPj4+Pj4KPj4+
Pj4gT24gMDkuMTIuMTkgMDk6NTgsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4+Pj4+PiBFYWNoIGBi
bGtpZmAgaGFzIGEgZnJlZSBwYWdlcyBwb29sIGZvciB0aGUgZ3JhbnQgbWFwcGluZy4gIFRoZSBz
aXplIG9mCj4+Pj4+PiB0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJvIGFuZCBiZSBpbmNyZWFzZWQg
b24gZGVtYW5kIHdoaWxlIHByb2Nlc3NpbmcKPj4+Pj4+IHRoZSBJL08gcmVxdWVzdHMuICBJZiBj
dXJyZW50IEkvTyByZXF1ZXN0cyBoYW5kbGluZyBpcyBmaW5pc2hlZCBvciAxMDAKPj4+Pj4+IG1p
bGxpc2Vjb25kcyBoYXMgcGFzc2VkIHNpbmNlIGxhc3QgSS9PIHJlcXVlc3RzIGhhbmRsaW5nLCBp
dCBjaGVja3MgYW5kCj4+Pj4+PiBzaHJpbmtzIHRoZSBwb29sIHRvIG5vdCBleGNlZWQgdGhlIHNp
emUgbGltaXQsIGBtYXhfYnVmZmVyX3BhZ2VzYC4KPj4+Pj4+Cj4+Pj4+PiBUaGVyZWZvcmUsIGBi
bGtmcm9udGAgcnVubmluZyBndWVzdHMgY2FuIGNhdXNlIGEgbWVtb3J5IHByZXNzdXJlIGluIHRo
ZQo+Pj4+Pj4gYGJsa2JhY2tgIHJ1bm5pbmcgZ3Vlc3QgYnkgYXR0YWNoaW5nIGEgbGFyZ2UgbnVt
YmVyIG9mIGJsb2NrIGRldmljZXMgYW5kCj4+Pj4+PiBpbmR1Y2luZyBJL08uCj4+Pj4+Cj4+Pj4+
IEknbSBoYXZpbmcgcHJvYmxlbXMgdG8gdW5kZXJzdGFuZCBob3cgYSBndWVzdCBjYW4gYXR0YWNo
IGEgbGFyZ2UgbnVtYmVyCj4+Pj4+IG9mIGJsb2NrIGRldmljZXMgd2l0aG91dCB0aG9zZSBoYXZp
bmcgYmVlbiBjb25maWd1cmVkIGJ5IHRoZSBob3N0IGFkbWluCj4+Pj4+IGJlZm9yZS4KPj4+Pj4K
Pj4+Pj4gSWYgdGhvc2UgZGV2aWNlcyBoYXZlIGJlZW4gY29uZmlndXJlZCwgZG9tMCBzaG91bGQg
YmUgcmVhZHkgZm9yIHRoYXQKPj4+Pj4gbnVtYmVyIG9mIGRldmljZXMsIGUuZy4gYnkgaGF2aW5n
IGVub3VnaCBzcGFyZSBtZW1vcnkgYXJlYSBmb3IgYmFsbG9vbmVkCj4+Pj4+IHBhZ2VzLgo+Pj4+
Pgo+Pj4+PiBTbyBlaXRoZXIgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUgb3IgeW91ciByZWFz
b25pbmcgZm9yIHRoZSBuZWVkIG9mCj4+Pj4+IHRoZSBwYXRjaCBpcyB3cm9uZy4KPj4+Pj4KPj4+
Pgo+Pj4+IEkgdGhpbmsgdGhlIHVuZGVybHlpbmcgaXNzdWUgaXMgdGhhdCBwZXJzaXN0ZW50IGdy
YW50IHN1cHBvcnQgaXMgaG9nZ2luZyBtZW1vcnkgaW4gdGhlIGJhY2tlbmRzLCB0aGVyZWJ5IGNv
bXByb21pc2luZyBzY2FsYWJpbGl0eS4gSUlVQyB0aGlzIHBhdGNoIGlzIGVzc2VudGlhbGx5IGEg
YmFuZC1haWQgdG8gZ2V0IGJhY2sgdG8gdGhlIHNjYWxhYmlsaXR5IHRoYXQgd2FzIHBvc3NpYmxl
IGJlZm9yZSBwZXJzaXN0ZW50IGdyYW50IHN1cHBvcnQgd2FzIGFkZGVkLiBVbHRpbWF0ZWx5IHRo
ZSByaWdodCBhbnN3ZXIgc2hvdWxkIGJlIHRvIGdldCByaWQgb2YgcGVyc2lzdGVudCBncmFudHMg
c3VwcG9ydCBhbmQgdXNlIGdyYW50IGNvcHksIGJ1dCBzdWNoIGEgY2hhbmdlIGlzIGNsZWFybHkg
bW9yZSBpbnZhc2l2ZSBhbmQgd291bGQgbmVlZCBmYXIgbW9yZSB0ZXN0aW5nLgo+Pj4KPj4+IFBl
cnNpc3RlbnQgZ3JhbnRzIGFyZSBob2dnaW5nIGJhbGxvb25lZCBwYWdlcywgd2hpY2ggaXMgZXF1
aXZhbGVudCB0bwo+Pj4gbWVtb3J5IG9ubHkgaW4gY2FzZSBvZiB0aGUgYmFja2VuZCdzIGRvbWFp
biBtZW1vcnkgYmVpbmcgZXF1YWwgb3IKPj4+IHJhdGhlciBuZWFyIHRvIGl0cyBtYXggbWVtb3J5
IHNpemUuCj4+Pgo+Pj4gU28gY29uZmlndXJpbmcgdGhlIGJhY2tlbmQgZG9tYWluIHdpdGggZW5v
dWdoIHNwYXJlIGFyZWEgZm9yIGJhbGxvb25lZAo+Pj4gcGFnZXMgc2hvdWxkIG1ha2UgdGhpcyBw
cm9ibGVtIG11Y2ggbGVzcyBzZXJpb3VzLgo+Pj4KPj4+IEFub3RoZXIgcHJvYmxlbSBpbiB0aGlz
IGFyZWEgaXMgdGhlIGFtb3VudCBvZiBtYXB0cmFjayBmcmFtZXMgY29uZmlndXJlZAo+Pj4gZm9y
IGEgZHJpdmVyIGRvbWFpbiwgd2hpY2ggd2lsbCBsaW1pdCB0aGUgbnVtYmVyIG9mIGNvbmN1cnJl
bnQgZm9yZWlnbgo+Pj4gbWFwcGluZ3Mgb2YgdGhhdCBkb21haW4uCj4+Cj4+IFJpZ2h0LCBzaW1p
bGFyIHByb2JsZW1zIGZyb20gb3RoZXIgYmFja2VuZHMgYXJlIHBvc3NpYmxlLgo+Pgo+Pj4KPj4+
IFNvIGluc3RlYWQgb2YgaGF2aW5nIGEgYmxrYmFjayBzcGVjaWZpYyBzb2x1dGlvbiBJJ2QgcmF0
aGVyIGhhdmUgYQo+Pj4gY29tbW9uIGNhbGxiYWNrIGZvciBiYWNrZW5kcyB0byByZWxlYXNlIGZv
cmVpZ24gbWFwcGluZ3MgaW4gb3JkZXIgdG8KPj4+IGVuYWJsZSBhIGdsb2JhbCByZXNvdXJjZSBt
YW5hZ2VtZW50Lgo+Pgo+PiBUaGlzIHBhdGNoIGlzIGFsc28gYmFzZWQgb24gYSBjb21tb24gY2Fs
bGJhY2ssIG5hbWVseSB0aGUgc2hyaW5rZXIgY2FsbGJhY2sKPj4gc3lzdGVtLiAgQXMgdGhlIHNo
cmlua2VyIGNhbGxiYWNrIGlzIGRlc2lnbmVkIGZvciB0aGUgZ2VuZXJhbCBtZW1vcnkgcHJlc3N1
cmUKPj4gaGFuZGxpbmcsIEkgdGhvdWdodCB0aGlzIGlzIGEgcmlnaHQgb25lIHRvIHVzZS4gIE90
aGVyIGJhY2tlbmRzIGhhdmluZyBzaW1pbGFyCj4+IHByb2JsZW1zIGNhbiB1c2UgdGhpcyBpbiB0
aGVpciB3YXkuCj4KPiBCdXQgdGhpcyBpcyBhZGRyZXNzaW5nIG1lbW9yeSBzaG9ydGFnZSBvbmx5
IGFuZCBpdCBpcyBhY3RpbmcgZ2xvYmFsbHkuCj4KPiBXaGF0IEknZCBsaWtlIHRvIGhhdmUgaW4g
c29tZSAobWF5YmUgZGlzdGFudCkgZnV0dXJlIGlzIGEgd2F5IHRvIGNvbnRyb2wKPiByZXNvdXJj
ZSB1c2FnZSBwZXIgZ3Vlc3QuIFdoeSB3b3VsZCB5b3Ugd2FudCB0byB0aHJvdHRsZSBwZXJmb3Jt
YW5jZSBvZgo+IGFsbCBndWVzdHMgaW5zdGVhZCBvZiBvbmx5IHRoZSBvbmUgY2F1c2luZyB0aGUg
cGFpbiBieSBob2dnaW5nIGxvdHMgb2YKPiByZXNvdXJjZXM/CgpHb29kIHBvaW50LiAgSSB3YXMg
YWxzbyBjb25jZXJuZWQgYWJvdXQgdGhlIHBlcmZvcm1hbmNlIGZhaXJuZXNzIGF0IGZpcnN0LCBi
dXQKc2V0dGxlZCBpbiB0aGlzIHVnbHkgYnV0IHNpbXBsZSBzb2x1dGlvbiBtYWlubHkgYmVjYXVz
ZSBteSB3b3JzdC1jYXNlCnBlcmZvcm1hbmNlIHRlc3QgKGRldGFpbGVkIGluIDFzdCBwYXRjaCdz
IGNvbW1pdCBtc2cpIHNob3dzIG5vIHZpc2libGUKcGVyZm9ybWFuY2UgZGVncmFkYXRpb24sIHRo
b3VnaCBpdCBpcyBhIG1pbmltYWwgdGVzdCBvbiBteSB0ZXN0IGVudmlyb25tZW50LgoKQW55d2F5
LCBJIGFncmVlIHdpdGggeW91ciBmdXR1cmUgZGlyZWN0aW9uLgoKPgo+IFRoZSBuZXcgYmFja2Vu
ZCBjYWxsYmFjayBzaG91bGQgKElNTykgaGF2ZSBhIGRvbWlkIGFzIHBhcmFtZXRlciBmb3IKPiBz
cGVjaWZ5aW5nIHdoaWNoIGd1ZXN0IHNob3VsZCBiZSB0YWtlbiBhd2F5IHJlc291cmNlcyAoaW5j
bHVkaW5nIHRoZQo+IHBvc3NpYmlsaXR5IHRvIHNlbGVjdCAiYW55IGRvbWFpbiIpLgo+Cj4gSXQg
bWlnaHQgYmUgcmVhc29uYWJsZSB0byBoYXZlIHlvdXIgc2hyaW5rZXIgaG9vayBpbiBlLmcuIHhl
bmJ1cyBmb3IKPiBjYWxsaW5nIHRoZSBiYWNrZW5kIGNhbGxiYWNrcy4gQW5kIHlvdSBjb3VsZCBo
YXZlIGFub3RoZXIgYWdlbnQgaW4gdGhlCj4gZ3JhbnQgZHJpdmVyIHJlYWN0aW5nIG9uIHNob3J0
YWdlIG9mIHBvc3NpYmxlIGdyYW50IG1hcHBpbmdzLgo+Cj4gSSBkb24ndCBleHBlY3QgeW91IHRv
IGltcGxlbWVudCBhbGwgb2YgdGhhdCBhdCBvbmNlLCBidXQgSSB0aGluayBoYXZpbmcKPiB0aGF0
IGlkZWEgaW4gbWluZCB3aGVuIGFkZHJlc3NpbmcgY3VycmVudCBpc3N1ZXMgd291bGQgYmUgbmlj
ZS4gU28gYXMgYQo+IHN0YXJ0aW5nIHBvaW50IHlvdSBjb3VsZCBtb3ZlIHRoZSBzaHJpbmtlciBo
b29rIHRvIHhlbmJ1cywgYWRkIHRoZQo+IGdlbmVyaWMgY2FsbGJhY2sgdG8gc3RydWN0IHhlbmJ1
c19kcml2ZXIsIHBvcHVsYXRlIHRoYXQgY2FsbGJhY2sgaW4KPiBibGtiYWNrIGFuZCBjYWxsIGl0
IGluIHRoZSBzaHJpbmtlciBob29rIHdpdGggImFueSBkb21haW4iLiBUaGlzIHdvdWxkCj4gZW5h
YmxlIGEgZnV0dXJlIGV4dGVuc2lvbiB0byBvdGhlciBiYWNrZW5kcyBhbmQgYSBkeW5hbWljIHJl
c291cmNlCj4gbWFuYWdlbWVudCBpbiBhIG5hdHVyYWwgd2F5LgoKQXBwcmVjaWF0ZSB0aGlzIGtp
bmQgYW5kIGRldGFpbGVkIGFkdmljZS4gIEkgd2lsbCBwb3N0IHRoZSBzZWNvbmQgdmVyc2lvbgph
cHBseWluZyB5b3VyIGNvbW1lbnRzLCBzb29uLgoKClRoYW5rcywKU2VvbmdKYWUgUGFyawoKPgo+
Cj5KdWVyZ2VuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
