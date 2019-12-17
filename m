Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE9122CBF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 14:19:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihCi0-0004K9-QS; Tue, 17 Dec 2019 13:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mCDn=2H=amazon.com=prvs=2471a56b0=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihChz-0004K4-VR
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 13:16:15 +0000
X-Inumbo-ID: 6713239a-20cf-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6713239a-20cf-11ea-a1e1-bc764e2007e4;
 Tue, 17 Dec 2019 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576588575; x=1608124575;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=Nm1QED8gp43x/zT1UUHR9X947gKFEpZ03i/XIdxXDaI=;
 b=ZSTg77Wead3kmxRhLwScE4a40nrMoCKDeGX3lcAD0fBIkXHex3RGCFTb
 4AliDMTtJ7MYoL+ynx49NKDPCGx3H1C0vOyE7Zc3eKTY/WCvSCEv3CvKJ
 PHhLJqJX2h7ZAwV1uytOvjjbONRRngydpgs77MPFmWNlU7S6A+ZbMbIYJ U=;
IronPort-SDR: vi4NhioA0murkDrs42ZQ2cyA/36yAAx4m9Msoq3hzWH6XkIljOquK3vpXTvIUE13e7V25F2a8z
 gLY5hVXC/xKQ==
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="14004316"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 17 Dec 2019 13:16:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 17E0EA189E; Tue, 17 Dec 2019 13:15:59 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 13:15:58 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.74) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 13:15:53 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 <jgross@suse.com>
Date: Tue, 17 Dec 2019 14:15:26 +0100
Message-ID: <20191217131526.17300-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20191217113915.GS11756@Air-de-Roger> (raw)
X-Originating-IP: [10.43.161.74]
X-ClientProxiedBy: EX13D24UWA001.ant.amazon.com (10.43.160.138) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v10 2/4] xen/blkback: Squeeze page pools if
 a memory pressure is detected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, konrad.wilk@oracle.com,
 pdurrant@amazon.com, sjpark@amazon.de, linux-kernel@vger.kernel.org,
 SeongJae Park <sj38.park@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSAxMjozOToxNSArMDEwMCAiUm9nZXIgUGF1IE1vbm7DqSIgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKCj4gT24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDg6
NDg6MDNQTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiA+IE9uIG9uLCAxNiBEZWMgMjAx
OSAxNzoyMzo0NCArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiA+IAo+ID4gPiBPbiAxNi4x
Mi4xOSAxNzoxNSwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiA+ID4gPiBPbiBNb24sIDE2IERlYyAy
MDE5IDE1OjM3OjIwICswMTAwIFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uY29tPiB3cm90
ZToKPiA+ID4gPiAKPiA+ID4gPj4gT24gTW9uLCAxNiBEZWMgMjAxOSAxMzo0NToyNSArMDEwMCBT
ZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmNvbT4gd3JvdGU6Cj4gPiA+ID4+Cj4gPiA+ID4+
PiBGcm9tOiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+ID4gPiA+Pj4KPiA+ID4g
PiBbLi4uXQo+ID4gPiA+Pj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMu
Ywo+ID4gPiA+Pj4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ID4g
PiA+Pj4gQEAgLTgyNCw2ICs4MjQsMjQgQEAgc3RhdGljIHZvaWQgZnJvbnRlbmRfY2hhbmdlZChz
dHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LAo+ID4gPiA+Pj4gICB9Cj4gPiA+ID4+PiAgIAo+ID4g
PiA+Pj4gICAKPiA+ID4gPj4+ICsvKiBPbmNlIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVk
LCBzcXVlZXplIGZyZWUgcGFnZSBwb29scyBmb3IgYSB3aGlsZS4gKi8KPiA+ID4gPj4+ICtzdGF0
aWMgdW5zaWduZWQgaW50IGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zID0gMTA7Cj4gPiA+ID4+
PiArbW9kdWxlX3BhcmFtX25hbWVkKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+ID4gPiA+
Pj4gKwkJYnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMsIGludCwgMDY0NCk7Cj4gPiA+ID4+PiAr
TU9EVUxFX1BBUk1fREVTQyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+ID4gPj4+ICsi
RHVyYXRpb24gaW4gbXMgdG8gc3F1ZWV6ZSBwYWdlcyBidWZmZXIgd2hlbiBhIG1lbW9yeSBwcmVz
c3VyZSBpcyBkZXRlY3RlZCIpOwo+ID4gPiA+Pj4gKwo+ID4gPiA+Pj4gKy8qCj4gPiA+ID4+PiAr
ICogQ2FsbGJhY2sgcmVjZWl2ZWQgd2hlbiB0aGUgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVk
Lgo+ID4gPiA+Pj4gKyAqLwo+ID4gPiA+Pj4gK3N0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0
cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCj4gPiA+ID4+PiArewo+ID4gPiA+Pj4gKwlzdHJ1Y3Qg
YmFja2VuZF9pbmZvICpiZSA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOwo+ID4gPiA+Pj4g
Kwo+ID4gPiA+Pj4gKwliZS0+YmxraWYtPmJ1ZmZlcl9zcXVlZXplX2VuZCA9IGppZmZpZXMgKwo+
ID4gPiA+Pj4gKwkJbXNlY3NfdG9famlmZmllcyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcyk7
Cj4gPiA+ID4+Cj4gPiA+ID4+IFRoaXMgY2FsbGJhY2sgbWlnaHQgcmFjZSB3aXRoICd4ZW5fYmxr
YmtfcHJvYmUoKScuICBUaGUgcmFjZSBjb3VsZCByZXN1bHQgaW4KPiA+ID4gPj4gX19OVUxMIGRl
cmVmZXJlbmNpbmdfXywgYXMgJ3hlbl9ibGtia19wcm9iZSgpJyBzZXRzICctPmJsa2lmJyBhZnRl
ciBpdCBsaW5rcwo+ID4gPiA+PiAnYmUnIHRvIHRoZSAnZGV2Jy4gIFBsZWFzZSBfZG9uJ3QgbWVy
Z2VfIHRoaXMgcGF0Y2ggbm93IQo+ID4gPiA+Pgo+ID4gPiA+PiBJIHdpbGwgZG8gbW9yZSB0ZXN0
IGFuZCBzaGFyZSByZXN1bHRzLiAgTWVhbndoaWxlLCBpZiB5b3UgaGF2ZSBhbnkgb3BpbmlvbiwK
PiA+ID4gPj4gcGxlYXNlIGxldCBtZSBrbm93Lgo+ID4gCj4gPiBJIHJlZHVjZWQgc3lzdGVtIG1l
bW9yeSBhbmQgYXR0YWNoZWQgYnVuY2ggb2YgZGV2aWNlcyBpbiBzaG9ydCB0aW1lIHNvIHRoYXQK
PiA+IG1lbW9yeSBwcmVzc3VyZSBvY2N1cnMgd2hpbGUgZGV2aWNlIGF0dGFjaG1lbnRzIGFyZSBv
bmdvaW5nLiAgVW5kZXIgdGhpcwo+ID4gY2lyY3Vtc3RhbmNlLCBJIHdhcyBhYmxlIHRvIHNlZSB0
aGUgcmFjZS4KPiA+IAo+ID4gPiA+IAo+ID4gPiA+IE5vdCBvbmx5ICctPmJsa2lmJywgYnV0ICdi
ZScgaXRzZWxmIGFsc28gY291bGUgYmUgYSBOVUxMLiAgQXMgc2ltaWxhcgo+ID4gPiA+IGNvbmN1
cnJlbmN5IGlzc3VlcyBjb3VsZCBiZSBpbiBvdGhlciBkcml2ZXJzIGluIHRoZWlyIHdheSwgSSBz
dWdnZXN0IHRvIGNoYW5nZQo+ID4gPiA+IHRoZSByZWNsYWltIGNhbGxiYWNrICgnLT5yZWNsYWlt
X21lbW9yeScpIHRvIGJlIGNhbGxlZCBmb3IgZWFjaCBkcml2ZXIgaW5zdGVhZAo+ID4gPiA+IG9m
IGVhY2ggZGV2aWNlLiAgVGhlbiwgZWFjaCBkcml2ZXIgY291bGQgYmUgYWJsZSB0byBkZWFsIHdp
dGggaXRzIGNvbmN1cnJlbmN5Cj4gPiA+ID4gaXNzdWVzIGJ5IGl0c2VsZi4KPiA+ID4gCj4gPiA+
IEhtbSwgSSBkb24ndCBsaWtlIHRoYXQuIFRoaXMgd291bGQgbmVlZCB0byBiZSBjaGFuZ2VkIGJh
Y2sgaW4gY2FzZSB3ZQo+ID4gPiBhZGQgcGVyLWd1ZXN0IHF1b3RhLgo+ID4gCj4gPiBFeHRlbmRp
bmcgdGhpcyBjYWxsYmFjayBpbiB0aGF0IHdheSB3b3VsZCBiZSBzdGlsbCBub3QgdG9vIGhhcmQu
ICBXZSBjb3VsZCB1c2UKPiA+IHRoZSBhcmd1bWVudCB0byB0aGUgY2FsbGJhY2suICBJIHdvdWxk
IGtlZXAgdGhlIGFyZ3VtZW50IG9mIHRoZSBjYWxsYmFjayB0bwo+ID4gJ3N0cnVjdCBkZXZpY2Ug
KicgYXMgaXMsIGFuZCB3aWxsIGFkZCBhIGNvbW1lbnQgc2F5aW5nICdOVUxMJyB2YWx1ZSBvZiB0
aGUKPiA+IGFyZ3VtZW50IG1lYW5zIGV2ZXJ5IGRldmljZXMuICBBcyBhbiBleGFtcGxlLCB4ZW5i
dXMgd291bGQgcGFzcyBOVUxMLWVuZGluZwo+ID4gYXJyYXkgb2YgdGhlIGRldmljZSBwb2ludGVy
cyB0aGF0IG5lZWQgdG8gZnJlZSBpdHMgcmVzb3VyY2VzLgo+ID4gCj4gPiBBZnRlciBzZWVpbmcg
dGhpcyByYWNlLCBJIGFtIG5vdyBhbHNvIHRoaW5raW5nIGl0IGNvdWxkIGJlIGJldHRlciB0byBk
ZWxlZ2F0ZQo+ID4gZGV0YWlsZWQgY29udHJvbCBvZiBlYWNoIGRldmljZSB0byBpdHMgZHJpdmVy
LCBhcyBzb21lIGRyaXZlcnMgaGF2ZSBzb21lCj4gPiBjb21wbGljYXRlZCBhbmQgdW5pcXVlIHJl
bGF0aW9uIHdpdGggaXRzIGRldmljZXMuCj4gPiAKPiA+ID4gCj4gPiA+IFdvdWxkbid0IGEgZ2V0
X2RldmljZSgpIGJlZm9yZSBjYWxsaW5nIHRoZSBjYWxsYmFjayBhbmQgYSBwdXRfZGV2aWNlKCkK
PiA+ID4gYWZ0ZXJ3YXJkcyBhdm9pZCB0aGF0IHByb2JsZW0/Cj4gPiAKPiA+IEkgZGlkbid0IHVz
ZWQgdGhlIHJlZmVyZW5jZSBjb3VudCBtYW5pcHVsYXRpb24gb3BlcmF0aW9ucyBiZWNhdXNlIG90
aGVyIHNpbWlsYXIKPiA+IHBhcnRzIGFsc28gZGlkbid0LiAgQnV0LCBpZiB0aGVyZSBpcyBubyBp
bXBsaWNpdCByZWZlcmVuY2UgY291bnQgZ3VhcmFudGVlLCBpdAo+ID4gc2VlbXMgdGhvc2Ugb3Bl
cmF0aW9ucyBhcmUgaW5kZWVkIG5lY2Vzc2FyeS4KPiA+IAo+ID4gVGhhdCBzYWlkLCBhcyBnZXQv
cHV0IG9wZXJhdGlvbnMgb25seSBhZGp1c3QgdGhlIHJlZmVyZW5jZSBjb3VudCwgdGhvc2Ugd2ls
bAo+ID4gbm90IG1ha2UgdGhlIGNhbGxiYWNrIHRvIHdhaXQgdW50aWwgdGhlIGxpbmtpbmcgb2Yg
dGhlICdiYWNrZW5kJyBhbmQgJ2Jsa2lmJyB0bwo+ID4gdGhlIGRldmljZSAoeGVuX2Jsa2JrX3By
b2JlKCkpIGlzIGZpbmlzaGVkLiAgVGh1cywgdGhlIHJhY2UgY291bGQgc3RpbGwgaGFwcGVuLgo+
ID4gT3IsIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gCj4gSSB3b3VsZCBleHBlY3QgdGhlIGRl
dmljZSBpcyBub3QgYWRkZWQgdG8gdGhlIGxpc3Qgb2YgYmFja2VuZCBkZXZpY2VzCj4gdW50aWwg
dGhlIHByb2JlIGhvb2sgaGFzIGZpbmlzaGVkIHdpdGggYSBub24tZXJyb3IgcmV0dXJuIGNvZGUu
IEllOgo+IGJ1c19mb3JfZWFjaF9kZXYgc2hvdWxkIF9ub3RfIGl0ZXJhdGUgb3ZlciBkZXZpY2Vz
IGZvciB3aGljaCB0aGUgcHJvYmUKPiBmdW5jdGlvbiBoYXNuJ3QgYmVlbiBydW4gdG8gY29tcGV0
aXRpb24gd2l0aG91dCBlcnJvcnMuCj4gCj4gVGhlIHNhbWUgd2F5IEkgd291bGQgZXhwZWN0IHRo
ZSByZW1vdmUgaG9vayB0byBmaXJzdCByZW1vdmUgdGhlIGRldmljZQo+IGZyb20gdGhlIGxpc3Qg
b2YgYmFja2VuZCBkZXZpY2VzIGFuZCB0aGVuIHJ1biB0aGUgcmVtb3ZlIGhvb2suCj4gCj4gYmxr
YmFjayB1c2VzIGFuIGFkLWhvYyByZWZlcmVuY2UgY291bnRpbmcgbWVjaGFuaXNtLCBidXQgaWYg
dGhlIGFib3ZlCj4gYXNzdW1wdGlvbnMgYXJlIHRydWUgSSB0aGluayBpdCB3b3VsZCBiZSBlbm91
Z2ggdG8gdGFrZSBhbiBleHRyYQo+IHJlZmVyZW5jZSBpbiB4ZW5fYmxrYmtfcHJvYmUgYW5kIGRy
b3AgaXQgaW4geGVuX2Jsa2JrX3JlbW92ZS4KCldlbGwsIGlmIHRoZSBhc3N1bXB0aW9uIGlzIHRy
dWUsIHdvdWxkbid0IHRoZSBKdWVyZ2VuJ3MgYXBwcm9hY2ggc29sdmVkIHRoZQpwcm9ibGVtPyAg
QXMgcHJldmlvdXNseSBzYWlkLCBJIHRyaWVkIHRoZSBhcHByb2FjaCBidXQgZmFpbGVkIHRvIHNv
bHZlIHRoaXMKcmFjZS4gIFRoZSBhc3N1bXB0aW9uIGlzIHdyb25nIG9yIEkgbWlzc2VkIHNvbWV0
aGluZy4gIEkgdGhpbmsgSnVlcmdlbiBhbHNvCnRoaW5rIHRoZSBhc3N1bXB0aW9uIGlzIG5vdCB0
cnVlIGFzIGhlIHN1Z2dlc3RlZCB1c2Ugb2YgbG9ja2luZyBidXQgbm90IHN1cmUuCkp1ZXJnZW4s
IGlmIEkgbWlzdW5kZXJzdG9vZCwgcGxlYXNlIGxldCBtZSBrbm93LgoKClRoYW5rcywKU2VvbmdK
YWUgUGFyawoKPiAKPiBBZGRpdGlvbmFsbHkgaXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcgdG8gc3dp
dGNoIHRoZSBhZC1ob2MgcmVmZXJlbmNlCj4gY291bnRpbmcgdG8gdXNlIGdldF9kZXZpY2UvcHV0
X2RldmljZSAoaW4gYSBzZXBhcmF0ZSBwYXRjaCksIGJ1dCBJJ20KPiBub3Qgc3VyZSBob3cgZmVh
c2libGUgdGhhdCBpcy4KPiAKPiBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
