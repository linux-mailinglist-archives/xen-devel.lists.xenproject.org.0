Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E11226BE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 09:34:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ih8GL-0005Ia-84; Tue, 17 Dec 2019 08:31:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mCDn=2H=amazon.com=prvs=2471a56b0=sjpark@srs-us1.protection.inumbo.net>)
 id 1ih8GK-0005IV-1w
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 08:31:24 +0000
X-Inumbo-ID: 9bfb48e4-20a7-11ea-88e7-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bfb48e4-20a7-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576571484; x=1608107484;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=yaCCpNmgt5dSoQPGblWjHYjeIUxTXhnRUwlNrk8CnRw=;
 b=WvdramhmVmahiTCQ6MNFIiMkii00Chpzuj4APTYLdxp9Beuz8WD24iWj
 Bd+EWqCbZaxuRAGIfvWKk3Ox5I63bhqbRLhTDuWkm1VxAWbqr04GePPAT
 WULAHuSx9LkY1axnI3zTJfWOPcwZyRSow5dyntJrFtwETnNFaQAgAYx9g s=;
IronPort-SDR: qlMQyxHyUynkXHtberbg7XaHg+mK9a/9sUkc7P2uGjez8l17ICqpNSggSUiOHNDOGvUtEU8GdO
 Jqh+qqt/p9zw==
X-IronPort-AV: E=Sophos;i="5.69,324,1571702400"; 
   d="scan'208";a="8816134"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 17 Dec 2019 08:31:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 981D8A2A79; Tue, 17 Dec 2019 08:31:10 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 08:31:10 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.100) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 08:31:05 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Tue, 17 Dec 2019 09:30:32 +0100
Message-ID: <20191217083032.19400-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <f9f686ce-aeca-0947-5b2b-91e1d0c183dd@suse.com> (raw)
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D21UWB003.ant.amazon.com (10.43.161.212) To
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
Cc: axboe@kernel.dk, SeongJae Park <sj38.park@gmail.com>,
 SeongJae Park <sjpark@amazon.com>, konrad.wilk@oracle.com, pdurrant@amazon.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSAwOToxNjo0NyArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE3LjEyLjE5IDA4OjU5LCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gT24gVHVlLCAxNyBEZWMgMjAxOSAwNzoyMzoxMiArMDEwMCAiSsO8cmdlbiBHcm/D
nyIgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+PiBPbiAxNi4xMi4xOSAyMDo0OCwg
U2VvbmdKYWUgUGFyayB3cm90ZToKPiA+Pj4gT24gb24sIDE2IERlYyAyMDE5IDE3OjIzOjQ0ICsw
MTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+ID4+Pgo+ID4+Pj4gT24gMTYuMTIuMTkgMTc6MTUs
IFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gPj4+Pj4gT24gTW9uLCAxNiBEZWMgMjAxOSAxNTozNzoy
MCArMDEwMCBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmNvbT4gd3JvdGU6Cj4gPj4+Pj4K
PiA+Pj4+Pj4gT24gTW9uLCAxNiBEZWMgMjAxOSAxMzo0NToyNSArMDEwMCBTZW9uZ0phZSBQYXJr
IDxzanBhcmtAYW1hem9uLmNvbT4gd3JvdGU6Cj4gPj4+Pj4+Cj4gPj4+Pj4+PiBGcm9tOiBTZW9u
Z0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+ID4+Pj4+Pj4KPiA+Pj4+PiBbLi4uXQo+ID4+
Pj4+Pj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ID4+Pj4+Pj4g
KysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ID4+Pj4+Pj4gQEAgLTgy
NCw2ICs4MjQsMjQgQEAgc3RhdGljIHZvaWQgZnJvbnRlbmRfY2hhbmdlZChzdHJ1Y3QgeGVuYnVz
X2RldmljZSAqZGV2LAo+ID4+Pj4+Pj4gICAgIH0KPiA+Pj4+Pj4+ICAgICAKPiA+Pj4+Pj4+ICAg
ICAKPiA+Pj4+Pj4+ICsvKiBPbmNlIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLCBzcXVl
ZXplIGZyZWUgcGFnZSBwb29scyBmb3IgYSB3aGlsZS4gKi8KPiA+Pj4+Pj4+ICtzdGF0aWMgdW5z
aWduZWQgaW50IGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zID0gMTA7Cj4gPj4+Pj4+PiArbW9k
dWxlX3BhcmFtX25hbWVkKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+ID4+Pj4+Pj4gKwkJ
YnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMsIGludCwgMDY0NCk7Cj4gPj4+Pj4+PiArTU9EVUxF
X1BBUk1fREVTQyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+Pj4+Pj4+ICsiRHVyYXRp
b24gaW4gbXMgdG8gc3F1ZWV6ZSBwYWdlcyBidWZmZXIgd2hlbiBhIG1lbW9yeSBwcmVzc3VyZSBp
cyBkZXRlY3RlZCIpOwo+ID4+Pj4+Pj4gKwo+ID4+Pj4+Pj4gKy8qCj4gPj4+Pj4+PiArICogQ2Fs
bGJhY2sgcmVjZWl2ZWQgd2hlbiB0aGUgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLgo+ID4+
Pj4+Pj4gKyAqLwo+ID4+Pj4+Pj4gK3N0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYpCj4gPj4+Pj4+PiArewo+ID4+Pj4+Pj4gKwlzdHJ1Y3QgYmFja2Vu
ZF9pbmZvICpiZSA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOwo+ID4+Pj4+Pj4gKwo+ID4+
Pj4+Pj4gKwliZS0+YmxraWYtPmJ1ZmZlcl9zcXVlZXplX2VuZCA9IGppZmZpZXMgKwo+ID4+Pj4+
Pj4gKwkJbXNlY3NfdG9famlmZmllcyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcyk7Cj4gPj4+
Pj4+Cj4gPj4+Pj4+IFRoaXMgY2FsbGJhY2sgbWlnaHQgcmFjZSB3aXRoICd4ZW5fYmxrYmtfcHJv
YmUoKScuICBUaGUgcmFjZSBjb3VsZCByZXN1bHQgaW4KPiA+Pj4+Pj4gX19OVUxMIGRlcmVmZXJl
bmNpbmdfXywgYXMgJ3hlbl9ibGtia19wcm9iZSgpJyBzZXRzICctPmJsa2lmJyBhZnRlciBpdCBs
aW5rcwo+ID4+Pj4+PiAnYmUnIHRvIHRoZSAnZGV2Jy4gIFBsZWFzZSBfZG9uJ3QgbWVyZ2VfIHRo
aXMgcGF0Y2ggbm93IQo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIHdpbGwgZG8gbW9yZSB0ZXN0IGFuZCBz
aGFyZSByZXN1bHRzLiAgTWVhbndoaWxlLCBpZiB5b3UgaGF2ZSBhbnkgb3BpbmlvbiwKPiA+Pj4+
Pj4gcGxlYXNlIGxldCBtZSBrbm93Lgo+ID4+Pgo+ID4+PiBJIHJlZHVjZWQgc3lzdGVtIG1lbW9y
eSBhbmQgYXR0YWNoZWQgYnVuY2ggb2YgZGV2aWNlcyBpbiBzaG9ydCB0aW1lIHNvIHRoYXQKPiA+
Pj4gbWVtb3J5IHByZXNzdXJlIG9jY3VycyB3aGlsZSBkZXZpY2UgYXR0YWNobWVudHMgYXJlIG9u
Z29pbmcuICBVbmRlciB0aGlzCj4gPj4+IGNpcmN1bXN0YW5jZSwgSSB3YXMgYWJsZSB0byBzZWUg
dGhlIHJhY2UuCj4gPj4+Cj4gPj4+Pj4KPiA+Pj4+PiBOb3Qgb25seSAnLT5ibGtpZicsIGJ1dCAn
YmUnIGl0c2VsZiBhbHNvIGNvdWxlIGJlIGEgTlVMTC4gIEFzIHNpbWlsYXIKPiA+Pj4+PiBjb25j
dXJyZW5jeSBpc3N1ZXMgY291bGQgYmUgaW4gb3RoZXIgZHJpdmVycyBpbiB0aGVpciB3YXksIEkg
c3VnZ2VzdCB0byBjaGFuZ2UKPiA+Pj4+PiB0aGUgcmVjbGFpbSBjYWxsYmFjayAoJy0+cmVjbGFp
bV9tZW1vcnknKSB0byBiZSBjYWxsZWQgZm9yIGVhY2ggZHJpdmVyIGluc3RlYWQKPiA+Pj4+PiBv
ZiBlYWNoIGRldmljZS4gIFRoZW4sIGVhY2ggZHJpdmVyIGNvdWxkIGJlIGFibGUgdG8gZGVhbCB3
aXRoIGl0cyBjb25jdXJyZW5jeQo+ID4+Pj4+IGlzc3VlcyBieSBpdHNlbGYuCj4gPj4+Pgo+ID4+
Pj4gSG1tLCBJIGRvbid0IGxpa2UgdGhhdC4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIGNoYW5nZWQg
YmFjayBpbiBjYXNlIHdlCj4gPj4+PiBhZGQgcGVyLWd1ZXN0IHF1b3RhLgo+ID4+Pgo+ID4+PiBF
eHRlbmRpbmcgdGhpcyBjYWxsYmFjayBpbiB0aGF0IHdheSB3b3VsZCBiZSBzdGlsbCBub3QgdG9v
IGhhcmQuICBXZSBjb3VsZCB1c2UKPiA+Pj4gdGhlIGFyZ3VtZW50IHRvIHRoZSBjYWxsYmFjay4g
IEkgd291bGQga2VlcCB0aGUgYXJndW1lbnQgb2YgdGhlIGNhbGxiYWNrIHRvCj4gPj4+ICdzdHJ1
Y3QgZGV2aWNlIConIGFzIGlzLCBhbmQgd2lsbCBhZGQgYSBjb21tZW50IHNheWluZyAnTlVMTCcg
dmFsdWUgb2YgdGhlCj4gPj4+IGFyZ3VtZW50IG1lYW5zIGV2ZXJ5IGRldmljZXMuICBBcyBhbiBl
eGFtcGxlLCB4ZW5idXMgd291bGQgcGFzcyBOVUxMLWVuZGluZwo+ID4+PiBhcnJheSBvZiB0aGUg
ZGV2aWNlIHBvaW50ZXJzIHRoYXQgbmVlZCB0byBmcmVlIGl0cyByZXNvdXJjZXMuCj4gPj4+Cj4g
Pj4+IEFmdGVyIHNlZWluZyB0aGlzIHJhY2UsIEkgYW0gbm93IGFsc28gdGhpbmtpbmcgaXQgY291
bGQgYmUgYmV0dGVyIHRvIGRlbGVnYXRlCj4gPj4+IGRldGFpbGVkIGNvbnRyb2wgb2YgZWFjaCBk
ZXZpY2UgdG8gaXRzIGRyaXZlciwgYXMgc29tZSBkcml2ZXJzIGhhdmUgc29tZQo+ID4+PiBjb21w
bGljYXRlZCBhbmQgdW5pcXVlIHJlbGF0aW9uIHdpdGggaXRzIGRldmljZXMuCj4gPj4+Cj4gPj4+
Pgo+ID4+Pj4gV291bGRuJ3QgYSBnZXRfZGV2aWNlKCkgYmVmb3JlIGNhbGxpbmcgdGhlIGNhbGxi
YWNrIGFuZCBhIHB1dF9kZXZpY2UoKQo+ID4+Pj4gYWZ0ZXJ3YXJkcyBhdm9pZCB0aGF0IHByb2Js
ZW0/Cj4gPj4+Cj4gPj4+IEkgZGlkbid0IHVzZWQgdGhlIHJlZmVyZW5jZSBjb3VudCBtYW5pcHVs
YXRpb24gb3BlcmF0aW9ucyBiZWNhdXNlIG90aGVyIHNpbWlsYXIKPiA+Pj4gcGFydHMgYWxzbyBk
aWRuJ3QuICBCdXQsIGlmIHRoZXJlIGlzIG5vIGltcGxpY2l0IHJlZmVyZW5jZSBjb3VudCBndWFy
YW50ZWUsIGl0Cj4gPj4+IHNlZW1zIHRob3NlIG9wZXJhdGlvbnMgYXJlIGluZGVlZCBuZWNlc3Nh
cnkuCj4gPj4+Cj4gPj4+IFRoYXQgc2FpZCwgYXMgZ2V0L3B1dCBvcGVyYXRpb25zIG9ubHkgYWRq
dXN0IHRoZSByZWZlcmVuY2UgY291bnQsIHRob3NlIHdpbGwKPiA+Pj4gbm90IG1ha2UgdGhlIGNh
bGxiYWNrIHRvIHdhaXQgdW50aWwgdGhlIGxpbmtpbmcgb2YgdGhlICdiYWNrZW5kJyBhbmQgJ2Js
a2lmJyB0bwo+ID4+PiB0aGUgZGV2aWNlICh4ZW5fYmxrYmtfcHJvYmUoKSkgaXMgZmluaXNoZWQu
ICBUaHVzLCB0aGUgcmFjZSBjb3VsZCBzdGlsbCBoYXBwZW4uCj4gPj4+IE9yLCBhbSBJIG1pc3Np
bmcgc29tZXRoaW5nPwo+ID4+Cj4gPj4gTm8sIEkgdGhpbmsgd2UgbmVlZCBhIHhlbmJ1cyBsb2Nr
IHBlciBkZXZpY2Ugd2hpY2ggd2lsbCBuZWVkIHRvIGJlCj4gPj4gdGFrZW4gaW4geGVuX2Jsa2Jr
X3Byb2JlKCksIHhlbmJ1c19kZXZfcmVtb3ZlKCkgYW5kIHdoaWxlIGNhbGxpbmcgdGhlCj4gPj4g
Y2FsbGJhY2suCj4gPiAKPiA+IEkgYWxzbyBhZ3JlZSB0aGF0IGxvY2tpbmcgc2hvdWxkIGJlIHVz
ZWQgYXQgbGFzdC4gIEJ1dCwgYXMgZWFjaCBkcml2ZXIgbWFuYWdlcwo+ID4gaXRzIGRldmljZXMg
YW5kIHJlc291cmNlcyBpbiB0aGVpciB3YXksIGl0IGNvdWxkIGhhdmUgaXRzIHVuaXF1ZSByYWNl
Cj4gPiBjb25kaXRpb25zLiAgQW5kLCBlYWNoIHVuaXF1ZSByYWNlIGNvbmRpdGlvbiBtaWdodCBo
YXZlIGl0cyB1bmlxdWUgZWZmaWNpZW50Cj4gPiB3YXkgdG8gc3luY2hyb25pemUgaXQuICBUaGVy
ZWZvcmUsIEkgdGhpbmsgdGhlIHN5bmNocm9uaXphdGlvbiBzaG91bGQgYmUgZG9uZQo+ID4gYnkg
ZWFjaCBkcml2ZXIsIG5vdCBieSB4ZW5idXMgYW5kIHRodXMgd2Ugc2hvdWxkIG1ha2UgdGhlIGNh
bGxiYWNrIHRvIGJlIGNhbGxlZAo+ID4gcGVyLWRyaXZlci4KPiAKPiB4ZW5idXMgY29udHJvbHMg
Y3JlYXRpb24gYW5kIHJlbW92aW5nIG9mIGRldmljZXMsIHNvIGFwcGx5aW5nIGxvY2tpbmcKPiBh
dCB4ZW5idXMgbGV2ZWwgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGluIG9yZGVyIHRvIGF2b2lk
IHJhY2VzIHdpdGgKPiBkZXZpY2UgcmVtb3ZhbC4KPiAKPiBJbiBjYXNlIGEgYmFja2VuZCBoYXMg
ZnVydGhlciBzeW5jaHJvbml6YXRpb24gcmVxdWlyZW1lbnRzIHRob3NlIGhhdmUgdG8KPiBiZSBo
YW5kbGVkIGF0IGJhY2tlbmQgbGV2ZWwsIG9mIGNvdXJzZS4KPiAKPiBJbiB0aGUgZW5kIHlvdSds
bCBuZWVkIHRoZSB4ZW5idXMgbGV2ZWwgbG9ja2luZyBhbnl3YXkgaW4gb3JkZXIgdG8gYXZvaWQK
PiBhIHJhY2Ugd2hlbiB0aGUgbGFzdCBiYWNrZW5kIHNwZWNpZmljIGRldmljZSBpcyBqdXN0IGJl
aW5nIHJlbW92ZWQgd2hlbgo+IHRoZSBjYWxsYmFjayBpcyBhYm91dCB0byBiZSBjYWxsZWQgZm9y
IHRoYXQgZGV2aWNlLiBPciB5b3UnZCBuZWVkIHRvCj4gY2FsbCB0cnlfZ2V0X21vZHVsZSgpIGJl
Zm9yZSBjYWxsaW5nIGludG8gZWFjaCBiYWNrZW5kLi4uCgpBZ3JlZWQuICBUaGFuayB5b3UgZm9y
IHlvdXIga2luZCBleHBsYW5hdGlvbiBvZiB5b3VyIGNvbmNlcm5zLgoKClRoYW5rcywKU2VvbmdK
YWUgUGFyawoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
