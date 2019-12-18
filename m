Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005C124F6E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 18:37:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihdBn-0004fw-LZ; Wed, 18 Dec 2019 17:32:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihdBm-0004fr-GV
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 17:32:46 +0000
X-Inumbo-ID: 672d01b4-21bc-11ea-90d2-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 672d01b4-21bc-11ea-90d2-12813bfff9fa;
 Wed, 18 Dec 2019 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576690366; x=1608226366;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=FeQX76NID8dsLOSp0CkwolZX9DdPQj+OFtakt4kP7kA=;
 b=nRYHIzoz1h36JzUmBWJxDb9Ci7OJ5pfyMkQyM8ygu5uW0yvZH5wdeoph
 T8TZtMESQoNKB9mVZvzPyHKXlSZzJeoMP9SgH8nWkAWDizjK5y0bDlowd
 3fiECUIXLpTXA3ONW2/T/4ZSbb2n79Gk5D/5l2km5iPnKAxGuUGyV6yQP k=;
IronPort-SDR: svtqNpTkuYb1WJ3MaCtzj/m7rTHlM88SUQfhUrvm4+MNQU/nZTWWMsutjb3KahLmjnakVAmTra
 /F+7pzDEND6g==
X-IronPort-AV: E=Sophos;i="5.69,330,1571702400"; 
   d="scan'208";a="9070911"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 18 Dec 2019 17:32:45 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id C914FC59C5; Wed, 18 Dec 2019 17:32:42 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 17:32:41 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.78) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 17:32:36 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Wed, 18 Dec 2019 18:32:17 +0100
Message-ID: <20191218173217.7501-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <7edb266e-3185-5adc-1121-1b61feaf5a34@suse.com> (raw)
X-Originating-IP: [10.43.161.78]
X-ClientProxiedBy: EX13D33UWB002.ant.amazon.com (10.43.161.88) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v12 2/5] xenbus/backend: Protect xenbus
 callback with lock
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, sj38.park@gmail.com, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOCBEZWMgMjAxOSAxNjoxMTo1MSArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE4LjEyLjE5IDE1OjQwLCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gT24gV2VkLCAxOCBEZWMgMjAxOSAxNDozMDo0NCArMDEwMCAiSsO8cmdlbiBHcm/D
nyIgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+PiBPbiAxOC4xMi4xOSAxMzo0Miwg
U2VvbmdKYWUgUGFyayB3cm90ZToKPiA+Pj4gT24gV2VkLCAxOCBEZWMgMjAxOSAxMzoyNzozNyAr
MDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+
PiBPbiAxOC4xMi4xOSAxMTo0MiwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiA+Pj4+PiBGcm9tOiBT
ZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+ID4+Pj4+Cj4gPj4+Pj4gJ3JlY2xhaW1f
bWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3aXRoIGEgZHJpdmVyIGNvZGUgYXMgdGhpcyBjYWxs
YmFjawo+ID4+Pj4+IHdpbGwgYmUgY2FsbGVkIGZyb20gYW55IG1lbW9yeSBwcmVzc3VyZSBkZXRl
Y3RlZCBjb250ZXh0LiAgVG8gZGVhbCB3aXRoCj4gPj4+Pj4gdGhlIGNhc2UsIHRoaXMgY29tbWl0
IGFkZHMgYSBzcGlubG9jayBpbiB0aGUgJ3hlbmJ1c19kZXZpY2UnLiAgV2hlbmV2ZXIKPiA+Pj4+
PiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGlzIGNhbGxlZCwgdGhlIGxvY2sgb2YgdGhlIGRl
dmljZSB3aGljaCBwYXNzZWQKPiA+Pj4+PiB0byB0aGUgY2FsbGJhY2sgYXMgaXRzIGFyZ3VtZW50
IGlzIGxvY2tlZC4gIFRodXMsIGRyaXZlcnMgcmVnaXN0ZXJpbmcKPiA+Pj4+PiB0aGVpciAncmVj
bGFpbV9tZW1vcnknIGNhbGxiYWNrIHNob3VsZCBwcm90ZWN0IHRoZSBkYXRhIHRoYXQgbWlnaHQg
cmFjZQo+ID4+Pj4+IHdpdGggdGhlIGNhbGxiYWNrIHdpdGggdGhlIGxvY2sgYnkgdGhlbXNlbHZl
cy4KPiA+Pj4+Cj4gPj4+PiBBbnkgcmVhc29uIHlvdSBkb24ndCB0YWtlIHRoZSBsb2NrIGFyb3Vu
ZCB0aGUgLnByb2JlKCkgYW5kIC5yZW1vdmUoKQo+ID4+Pj4gY2FsbHMgb2YgdGhlIGJhY2tlbmQg
KHhlbmJ1c19kZXZfcHJvYmUoKSBhbmQgeGVuYnVzX2Rldl9yZW1vdmUoKSk/IFRoaXMKPiA+Pj4+
IHdvdWxkIGVsaW1pbmF0ZSB0aGUgbmVlZCB0byBkbyB0aGF0IGluIGVhY2ggYmFja2VuZCBpbnN0
ZWFkLgo+ID4+Pgo+ID4+PiBGaXJzdCBvZiBhbGwsIEkgd291bGQgbGlrZSB0byBrZWVwIHRoZSBj
cml0aWNhbCBzZWN0aW9uIGFzIHNtYWxsIGFzIHBvc3NpYmxlLgo+ID4+PiBXaXRoIG15IHNtYWxs
IHRlc3QsIEkgY291bGQgc2VlIHNsaWdodGx5IGluY3JlYXNpbmcgbWVtb3J5IHByZXNzdXJlIGFz
IHRoZQo+ID4+PiBjcml0aWNhbCBzZWN0aW9uIGJlY29tZXMgd2lkZXIuICBBbHNvLCBzb21lIGRy
aXZlcnMgbWlnaHQgc2hhcmUgdGhlIGRhdGEgdGhlaXIKPiA+Pj4gJ3JlY2xhaW1fbWVtb3J5JyBj
YWxsYmFjayB0b3VjaGVzIHdpdGggb3RoZXIgZnVuY3Rpb25zLiAgSSB0aGluayBvbmx5IHRoZQo+
ID4+PiBkcml2ZXIgb3duZXJzIGNhbiBrbm93IHdoYXQgZGF0YSBpcyBzaGFyZWQgYW5kIHdoYXQg
aXMgdGhlIG1pbmltdW0gY3JpdGljYWwKPiA+Pj4gc2VjdGlvbiB0byBwcm90ZWN0IGl0Lgo+ID4+
Cj4gPj4gQnV0IHRoaXMga2luZCBvZiBzZXJpYWxpemF0aW9uIGNhbiBzdGlsbCBiZSBhZGRlZCBv
biB0b3AuCj4gPiAKPiA+IEknbSBzdGlsbCB3b3JyeWluZyBhYm91dCB0aGUgdW5uZWNlc3Nhcmls
eSBsYXJnZSBjcml0aWNhbCBzZWN0aW9uLCBidXQgaXQgbWlnaHQKPiA+IGJlIHNtYWxsIGVub3Vn
aCB0byBiZSBpZ25vcmVkLiAgSWYgbm8gb3RoZXJzIGhhdmUgc3Ryb25nIG9iamVjdGlvbiwgSSB3
aWxsIHRha2UKPiA+IHRoZSBsb2NrIGFyb3VuZCB0aGUgJy0+cHJvYmUoKScgYW5kICctPnJlbW92
ZSgpJy4KPiAKPiBUaGUgbG9jayBpcyBwZXIgZGV2aWNlLCBzbyBjb250ZW50aW9uIGlzIHBvc3Np
YmxlIG9ubHkgZm9yIHRoZQo+IHJlY2xhaW0gY2FzZS4gSW4gY2FzZSBwcm9iZSBvciByZW1vdmUg
YXJlIHJ1bm5pbmcgcmVjbGFpbSB3aWxsIGhhdmUKPiBub3RoaW5nIHRvIGZyZWUgKGluIHByb2Jl
IGNhc2Ugbm90aGluZyBpcyBhbGxvY2F0ZWQgeWV0LCBpbiByZW1vdmUKPiBjYXNlIGV2ZXJ5dGhp
bmcgc2hvdWxkIGJlIGZyZWVkIGFueXdheSkuIFNvIHRoZSBsYXJnZXIgY3JpdGljYWwgc2VjdGlv
bgo+IGlzIG5vIHByb2JsZW0gYXQgYWxsIElNTy4KCkFncmVlZC4gIEkgdGhpbmsgSSB3YXMgd29y
cmllZCBhYm91dCBub3RoaW5nIHJlYWxseSBleGlzdGluZyBub3cuCgo+IAo+ID4+IEFuZCB3aXRo
IHRoZSB0cnlsb2NrIGluIHRoZSByZWNsYWltIHBhdGggSSBiZWxpZXZlIHlvdSBjYW4gZXZlbiBh
dm9pZAo+ID4+IHRoZSBpcnEgdmFyaWFudHMgb2YgdGhlIHNwaW5sb2NrLiBCdXQgSSBtaWdodCBi
ZSB3cm9uZywgc28geW91IHNob3VsZAo+ID4+IHRyeSB0aGF0IHdpdGggbG9ja2RlcCBlbmFibGVk
LiBJZiBpdCBpcyB3b3JraW5nIHRoZXJlIGlzIG5vIGhhcm0gZG9uZQo+ID4+IHdoZW4gbWFraW5n
IHRoZSBjcml0aWNhbCBzZWN0aW9uIGxhcmdlciwgYXMgbWVtb3J5IGFsbG9jYXRpb25zIHdpbGwK
PiA+PiB3b3JrIGFzIGJlZm9yZS4KPiA+IAo+ID4gWWVzLCB5b3UncmUgcmlnaHQuICBJIHdpbGwg
dHJ5IHRlc3Qgd2l0aCBsb2NrZGVwLgo+IAo+IFRoYW5rcywKCkdvb2QgbmV3cywgbG9ja2RlcCBz
YXlzIGl0J3Mgb2theSA6KQoKV2lsbCBwb3N0IG5leHQgdmVyc2lvbiBzb29uLgoKClRoYW5rcywK
U2VvbmdKYWUgUGFyawoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
