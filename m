Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2BC3924
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:33:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFK7x-0000MG-WD; Tue, 01 Oct 2019 15:31:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q5vT=X2=amazon.com=prvs=17096c9fa=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFK7w-0000MA-Ve
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:31:49 +0000
X-Inumbo-ID: 955fe72a-e460-11e9-9703-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id 955fe72a-e460-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569943908; x=1601479908;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cbofGbzZXF88ns2GJEbT7AxAysiMuIRUT4DEZXmoX9o=;
 b=rkrMCfzhZgdknsBUX1RGBXr8j8/g8tBFO9IntKtcyGZCQAZcIuvC29GH
 cxEZa8AvJhTuC+SobZIXNtX2w5LpPPprz6r4ggLCX80o4xqs5Cyd5XjUo
 GDX3Ajtrgtr1GbSgar6Tnt0A6UY37QTCWAGuvDzPv7vWYY/7aLmRWyYQs o=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; d="scan'208";a="788839488"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 01 Oct 2019 15:31:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1CAE5A22A4; Tue,  1 Oct 2019 15:31:46 +0000 (UTC)
Received: from EX13D16UEA003.ant.amazon.com (10.43.61.183) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 15:31:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D16UEA003.ant.amazon.com (10.43.61.183) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 15:31:45 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 15:31:44 +0000
To: Wei Liu <wl@xen.org>
References: <cover.1569833766.git.hongyax@amazon.com>
 <f8b0b15146c357270fb0978f3ec50eea4695dc1c.1569833766.git.hongyax@amazon.com>
 <480a0733-07c4-b98a-a2c9-465cf9fbef63@amazon.com>
 <20191001152011.s254ddmdh2lv4tpa@debian>
From: Hongyan Xia <hongyax@amazon.com>
Message-ID: <d04bd8c6-16e9-7155-5973-0fa0fa604bb1@amazon.com>
Date: Tue, 1 Oct 2019 16:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001152011.s254ddmdh2lv4tpa@debian>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 39/55] x86: switch root_pgt to mfn_t and
 use new APIs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxNjoyMCwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIE9jdCAwMSwgMjAx
OSBhdCAwMjo1NDoxOVBNICswMTAwLCBIb25neWFuIFhpYSB3cm90ZToKPj4gT24gMzAvMDkvMjAx
OSAxMTozMywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4+PiBGcm9tOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+Pj4KPj4+IFRoaXMgdGhlbiByZXF1aXJlcyBtb3ZpbmcgZGVjbGFyYXRpb24g
b2Ygcm9vdCBwYWdlIHRhYmxlIG1mbiBpbnRvIG1tLmgKPj4+IGFuZCBtb2RpZnkgc2V0dXBfY3B1
X3Jvb3RfcGd0IHRvIGhhdmUgYSBzaW5nbGUgZXhpdCBwYXRoLgo+Pj4KPj4+IFdlIGFsc28gbmVl
ZCB0byBmb3JjZSBtYXBfZG9tYWluX3BhZ2UgdG8gdXNlIGRpcmVjdCBtYXAgd2hlbiBzd2l0Y2hp
bmcKPj4+IHBlci1kb21haW4gbWFwcGluZ3MuIFRoaXMgaXMgY29udHJhcnkgdG8gb3VyIGVuZCBn
b2FsIG9mIHJlbW92aW5nCj4+PiBkaXJlY3QgbWFwLCBidXQgdGhpcyB3aWxsIGJlIHJlbW92ZWQg
b25jZSB3ZSBtYWtlIG1hcF9kb21haW5fcGFnZQo+Pj4gY29udGV4dC1zd2l0Y2ggc2FmZSBpbiBh
bm90aGVyIChsYXJnZSkgcGF0Y2ggc2VyaWVzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+ICAgIHhlbi9hcmNoL3g4Ni9kb21h
aW4uYyAgICAgICAgICAgfCAxNSArKysrKysrKysrLS0tCj4+PiAgICB4ZW4vYXJjaC94ODYvZG9t
YWluX3BhZ2UuYyAgICAgIHwgIDIgKy0KPj4+ICAgIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAg
ICAgICAgfCAgMiArLQo+Pj4gICAgeGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jICAgICAgICB8ICAy
ICstCj4+PiAgICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAgICAgIHwgNDAgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4+PiAgICB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmgg
ICAgICAgIHwgIDIgKysKPj4+ICAgIHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCAg
MiArLQo+Pj4gICAgNyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2Fy
Y2gveDg2L2RvbWFpbi5jCj4+PiBpbmRleCBkYmRmNmIxYmMyLi5lOWJmNDdlZmNlIDEwMDY0NAo+
Pj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZG9t
YWluLmMKPj4+IEBAIC02OSw2ICs2OSw3IEBACj4+PiAgICAjaW5jbHVkZSA8YXNtL3B2L2RvbWFp
bi5oPgo+Pj4gICAgI2luY2x1ZGUgPGFzbS9wdi9tbS5oPgo+Pj4gICAgI2luY2x1ZGUgPGFzbS9z
cGVjX2N0cmwuaD4KPj4+ICsjaW5jbHVkZSA8YXNtL3NldHVwLmg+Cj4+PiAgICBERUZJTkVfUEVS
X0NQVShzdHJ1Y3QgdmNwdSAqLCBjdXJyX3ZjcHUpOwo+Pj4gQEAgLTE1ODAsMTIgKzE1ODEsMjAg
QEAgdm9pZCBwYXJhdmlydF9jdHh0X3N3aXRjaF9mcm9tKHN0cnVjdCB2Y3B1ICp2KQo+Pj4gICAg
dm9pZCBwYXJhdmlydF9jdHh0X3N3aXRjaF90byhzdHJ1Y3QgdmNwdSAqdikKPj4+ICAgIHsKPj4+
IC0gICAgcm9vdF9wZ2VudHJ5X3QgKnJvb3RfcGd0ID0gdGhpc19jcHUocm9vdF9wZ3QpOwo+Pj4g
KyAgICBtZm5fdCBycHRfbWZuID0gdGhpc19jcHUocm9vdF9wZ3RfbWZuKTsKPj4+IC0gICAgaWYg
KCByb290X3BndCApCj4+PiAtICAgICAgICByb290X3BndFtyb290X3RhYmxlX29mZnNldChQRVJE
T01BSU5fVklSVF9TVEFSVCldID0KPj4+ICsgICAgaWYgKCAhbWZuX2VxKHJwdF9tZm4sIElOVkFM
SURfTUZOKSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHJvb3RfcGdlbnRyeV90ICpycHQ7Cj4+
PiArCj4+PiArICAgICAgICBtYXBjYWNoZV9vdmVycmlkZV9jdXJyZW50KElOVkFMSURfVkNQVSk7
Cj4+PiArICAgICAgICBycHQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcocnB0X21mbik7Cj4+PiAr
ICAgICAgICBycHRbcm9vdF90YWJsZV9vZmZzZXQoUEVSRE9NQUlOX1ZJUlRfU1RBUlQpXSA9Cj4+
PiAgICAgICAgICAgICAgICBsNGVfZnJvbV9wYWdlKHYtPmRvbWFpbi0+YXJjaC5wZXJkb21haW5f
bDNfcGcsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09S
X1JXKTsKPj4+ICsgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHJwdCk7Cj4+PiArICAg
ICAgICBtYXBjYWNoZV9vdmVycmlkZV9jdXJyZW50KE5VTEwpOwo+Pj4gKyAgICB9Cj4+PiAgICAg
ICAgaWYgKCB1bmxpa2VseSh2LT5hcmNoLmRyNyAmIERSN19BQ1RJVkVfTUFTSykgKQo+Pj4gICAg
ICAgICAgICBhY3RpdmF0ZV9kZWJ1Z3JlZ3Modik7Cj4+Cj4+IEkgYW0gaGF2aW5nIHNlY29uZCB0
aG91Z2h0cyBvbiB3aGV0aGVyIEkgc2hvdWxkIGluY2x1ZGUgdGhpcyBwYXRjaCBmb3Igbm93Lgo+
PiBPYnZpb3VzbHkgdGhlIHBlci1kb21haW4gbWFwY2FjaGUgaW4gaXRzIGN1cnJlbnQgZm9ybSBj
YW5ub3QgYmUgdXNlZCBoZXJlCj4+IGR1cmluZyB0aGUgY29udGV4dCBzd2l0Y2guIEhvd2V2ZXIs
IEkgYWxzbyBkb24ndCB3YW50IHRvIHVzZSBQTUFQIGJlY2F1c2UgaXQKPj4gaXMganVzdCBhIGJv
b3RzdHJhcHBpbmcgbWVjaGFuaXNtIGFuZCBtYXkgcmVzdWx0IGluIGhlYXZ5IGxvY2sgY29udGVu
dGlvbgo+PiBoZXJlLgo+Pgo+PiBJIGFtIGluY2xpbmVkIHRvIGRyb3AgaXQgZm9yIG5vdyBhbmQg
aW5jbHVkZSB0aGlzIGFmdGVyIHdlIGhhdmUgYQo+PiBjb250ZXh0LXN3aXRjaCBzYWZlIG1hcHBp
bmcgbWVjaGFuaXNtLCBhcyB0aGUgY29tbWl0IG1lc3NhZ2Ugc3VnZ2VzdHMuCj4+Cj4gCj4gRHJv
cHBpbmcgdGhpcyBwYXRjaCBpcyBvZiBjb3Vyc2UgZmluZS4gVGhlbiB5b3UgbmVlZCB0byBjb25z
aWRlciBob3cgdG8KPiBtYWtlIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgcmVtYWluIGFwcGxpY2Fi
bGUgdG8gc3RhZ2luZy4KCkkgd2lsbCBtYWtlIHN1cmUgdGhlIHNlcmllcyBzdGlsbCBhcHBsaWVz
IGFmdGVyIGRyb3BwaW5nIGl0LgoKPiAKPiBJIGd1ZXNzIHRoZSBwbGFuIGluIHRoZSBzaG9ydCB0
ZXJtIGlzIHRvbyBrZWVwIGEgZ2xvYmFsIG1hcHBpbmcgZm9yIGVhY2gKPiByb290IHBhZ2UgdGFi
bGUsIHJpZ2h0PwoKWWVzLiBJIGhhdmUgY2hhbmdlZCBycHRzIHRvIGJlIHhlbmhlYXAgcGFnZXMg
aW4gbXkgbmV4dCByZXZpc2lvbiwgd2hpY2ggc28gZmFyIAp3b3JrcyBoYXBwaWx5IHdpdGhvdXQg
dGhlIGRpcmVjdCBtYXAuCgo+IAo+IFdlaS4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
