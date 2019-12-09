Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C0116B8C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:56:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGez-0003G3-NE; Mon, 09 Dec 2019 10:53:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xl4W=Z7=amazon.com=prvs=239a0b868=sjpark@srs-us1.protection.inumbo.net>)
 id 1ieGey-0003Fw-BU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:53:00 +0000
X-Inumbo-ID: 107b2694-1a72-11ea-87bc-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 107b2694-1a72-11ea-87bc-12813bfff9fa;
 Mon, 09 Dec 2019 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575888780; x=1607424780;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=7b19Ik5i6iJTWRb6DDwOlywn9r/llQCNAsaaQHiunpg=;
 b=mtdUm4X+6yB6Lhc2OD5aqnnSjBXSWd1drGT5Lbn3bMiQuEXwSSM8jYuq
 I5WRdjOa5tGDk3q/mLvUqTie1/wzuz3fMSgHEDUb5Cw7jJ+we+TUuu3Za
 ck7JHNDaIBd7ZmNVWxUQega8b/Xs+h5jYf99uGszPw9Q37MsdElzCD0FL o=;
IronPort-SDR: PBZ1GWKcDaJl8Ndj1bxsK2qfu0qgHzc1XCXN2WJix89t2R0mDpGffy+b9M3Y3oH/5/2DLWV/N3
 tizEtAqisDxA==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="6790975"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Dec 2019 10:52:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7F399225828; Mon,  9 Dec 2019 10:52:57 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 10:52:56 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.192) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 10:52:53 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>
Date: Mon, 9 Dec 2019 11:52:18 +0100
Message-ID: <20191209105218.23583-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <e913c44e-c898-9504-1e2a-927563563208@suse.com> (raw)
X-Originating-IP: [10.43.161.192]
X-ClientProxiedBy: EX13D17UWB002.ant.amazon.com (10.43.161.141) To
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

T24gTW9uLCA5IERlYyAyMDE5IDExOjE1OjIyICswMTAwICJKw7xyZ2VuIEdyb8OfIiA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKCj5PbiAwOS4xMi4xOSAxMDo0NiwgRHVycmFudCwgUGF1bCB3cm90
ZToKPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+PiBGcm9tOiBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4+PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDA5OjM5Cj4+PiBU
bzogUGFyaywgU2VvbmdqYWUgPHNqcGFya0BhbWF6b24uY29tPjsgYXhib2VAa2VybmVsLmRrOwo+
Pj4ga29ucmFkLndpbGtAb3JhY2xlLmNvbTsgcm9nZXIucGF1QGNpdHJpeC5jb20KPj4+IENjOiBs
aW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IER1cnJhbnQsCj4+PiBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgc2ozOC5wYXJrQGdtYWls
LmNvbTsgeGVuLQo+Pj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjMgMC8xXSB4ZW4vYmxrYmFjazogU3F1ZWV6ZSBwYWdlIHBvb2xzIGlmIGEgbWVt
b3J5Cj4+PiBwcmVzc3VyZQo+Pj4KPj4+IE9uIDA5LjEyLjE5IDA5OjU4LCBTZW9uZ0phZSBQYXJr
IHdyb3RlOgo+Pj4+IEVhY2ggYGJsa2lmYCBoYXMgYSBmcmVlIHBhZ2VzIHBvb2wgZm9yIHRoZSBn
cmFudCBtYXBwaW5nLiAgVGhlIHNpemUgb2YKPj4+PiB0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJv
IGFuZCBiZSBpbmNyZWFzZWQgb24gZGVtYW5kIHdoaWxlIHByb2Nlc3NpbmcKPj4+PiB0aGUgSS9P
IHJlcXVlc3RzLiAgSWYgY3VycmVudCBJL08gcmVxdWVzdHMgaGFuZGxpbmcgaXMgZmluaXNoZWQg
b3IgMTAwCj4+Pj4gbWlsbGlzZWNvbmRzIGhhcyBwYXNzZWQgc2luY2UgbGFzdCBJL08gcmVxdWVz
dHMgaGFuZGxpbmcsIGl0IGNoZWNrcyBhbmQKPj4+PiBzaHJpbmtzIHRoZSBwb29sIHRvIG5vdCBl
eGNlZWQgdGhlIHNpemUgbGltaXQsIGBtYXhfYnVmZmVyX3BhZ2VzYC4KPj4+Pgo+Pj4+IFRoZXJl
Zm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1c2UgYSBtZW1vcnkgcHJlc3N1
cmUgaW4gdGhlCj4+Pj4gYGJsa2JhY2tgIHJ1bm5pbmcgZ3Vlc3QgYnkgYXR0YWNoaW5nIGEgbGFy
Z2UgbnVtYmVyIG9mIGJsb2NrIGRldmljZXMgYW5kCj4+Pj4gaW5kdWNpbmcgSS9PLgo+Pj4KPj4+
IEknbSBoYXZpbmcgcHJvYmxlbXMgdG8gdW5kZXJzdGFuZCBob3cgYSBndWVzdCBjYW4gYXR0YWNo
IGEgbGFyZ2UgbnVtYmVyCj4+PiBvZiBibG9jayBkZXZpY2VzIHdpdGhvdXQgdGhvc2UgaGF2aW5n
IGJlZW4gY29uZmlndXJlZCBieSB0aGUgaG9zdCBhZG1pbgo+Pj4gYmVmb3JlLgo+Pj4KPj4+IElm
IHRob3NlIGRldmljZXMgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQsIGRvbTAgc2hvdWxkIGJlIHJlYWR5
IGZvciB0aGF0Cj4+PiBudW1iZXIgb2YgZGV2aWNlcywgZS5nLiBieSBoYXZpbmcgZW5vdWdoIHNw
YXJlIG1lbW9yeSBhcmVhIGZvciBiYWxsb29uZWQKPj4+IHBhZ2VzLgo+Pj4KPj4+IFNvIGVpdGhl
ciBJJ20gbWlzc2luZyBzb21ldGhpbmcgaGVyZSBvciB5b3VyIHJlYXNvbmluZyBmb3IgdGhlIG5l
ZWQgb2YKPj4+IHRoZSBwYXRjaCBpcyB3cm9uZy4KPj4+Cj4+Cj4+IEkgdGhpbmsgdGhlIHVuZGVy
bHlpbmcgaXNzdWUgaXMgdGhhdCBwZXJzaXN0ZW50IGdyYW50IHN1cHBvcnQgaXMgaG9nZ2luZyBt
ZW1vcnkgaW4gdGhlIGJhY2tlbmRzLCB0aGVyZWJ5IGNvbXByb21pc2luZyBzY2FsYWJpbGl0eS4g
SUlVQyB0aGlzIHBhdGNoIGlzIGVzc2VudGlhbGx5IGEgYmFuZC1haWQgdG8gZ2V0IGJhY2sgdG8g
dGhlIHNjYWxhYmlsaXR5IHRoYXQgd2FzIHBvc3NpYmxlIGJlZm9yZSBwZXJzaXN0ZW50IGdyYW50
IHN1cHBvcnQgd2FzIGFkZGVkLiBVbHRpbWF0ZWx5IHRoZSByaWdodCBhbnN3ZXIgc2hvdWxkIGJl
IHRvIGdldCByaWQgb2YgcGVyc2lzdGVudCBncmFudHMgc3VwcG9ydCBhbmQgdXNlIGdyYW50IGNv
cHksIGJ1dCBzdWNoIGEgY2hhbmdlIGlzIGNsZWFybHkgbW9yZSBpbnZhc2l2ZSBhbmQgd291bGQg
bmVlZCBmYXIgbW9yZSB0ZXN0aW5nLgo+Cj5QZXJzaXN0ZW50IGdyYW50cyBhcmUgaG9nZ2luZyBi
YWxsb29uZWQgcGFnZXMsIHdoaWNoIGlzIGVxdWl2YWxlbnQgdG8KPm1lbW9yeSBvbmx5IGluIGNh
c2Ugb2YgdGhlIGJhY2tlbmQncyBkb21haW4gbWVtb3J5IGJlaW5nIGVxdWFsIG9yCj5yYXRoZXIg
bmVhciB0byBpdHMgbWF4IG1lbW9yeSBzaXplLgo+Cj5TbyBjb25maWd1cmluZyB0aGUgYmFja2Vu
ZCBkb21haW4gd2l0aCBlbm91Z2ggc3BhcmUgYXJlYSBmb3IgYmFsbG9vbmVkCj5wYWdlcyBzaG91
bGQgbWFrZSB0aGlzIHByb2JsZW0gbXVjaCBsZXNzIHNlcmlvdXMuCj4KPkFub3RoZXIgcHJvYmxl
bSBpbiB0aGlzIGFyZWEgaXMgdGhlIGFtb3VudCBvZiBtYXB0cmFjayBmcmFtZXMgY29uZmlndXJl
ZAo+Zm9yIGEgZHJpdmVyIGRvbWFpbiwgd2hpY2ggd2lsbCBsaW1pdCB0aGUgbnVtYmVyIG9mIGNv
bmN1cnJlbnQgZm9yZWlnbgo+bWFwcGluZ3Mgb2YgdGhhdCBkb21haW4uCgpSaWdodCwgc2ltaWxh
ciBwcm9ibGVtcyBmcm9tIG90aGVyIGJhY2tlbmRzIGFyZSBwb3NzaWJsZS4KCj4KPlNvIGluc3Rl
YWQgb2YgaGF2aW5nIGEgYmxrYmFjayBzcGVjaWZpYyBzb2x1dGlvbiBJJ2QgcmF0aGVyIGhhdmUg
YQo+Y29tbW9uIGNhbGxiYWNrIGZvciBiYWNrZW5kcyB0byByZWxlYXNlIGZvcmVpZ24gbWFwcGlu
Z3MgaW4gb3JkZXIgdG8KPmVuYWJsZSBhIGdsb2JhbCByZXNvdXJjZSBtYW5hZ2VtZW50LgoKVGhp
cyBwYXRjaCBpcyBhbHNvIGJhc2VkIG9uIGEgY29tbW9uIGNhbGxiYWNrLCBuYW1lbHkgdGhlIHNo
cmlua2VyIGNhbGxiYWNrCnN5c3RlbS4gIEFzIHRoZSBzaHJpbmtlciBjYWxsYmFjayBpcyBkZXNp
Z25lZCBmb3IgdGhlIGdlbmVyYWwgbWVtb3J5IHByZXNzdXJlCmhhbmRsaW5nLCBJIHRob3VnaHQg
dGhpcyBpcyBhIHJpZ2h0IG9uZSB0byB1c2UuICBPdGhlciBiYWNrZW5kcyBoYXZpbmcgc2ltaWxh
cgpwcm9ibGVtcyBjYW4gdXNlIHRoaXMgaW4gdGhlaXIgd2F5LgoKClRoYW5rcywKU2VvbmdKYWUg
UGFyawoKCj4KPgo+SnVlcmdlbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
