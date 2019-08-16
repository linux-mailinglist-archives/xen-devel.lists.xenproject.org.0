Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6828FF95
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:00:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYyw-0003wG-JY; Fri, 16 Aug 2019 09:57:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyYyv-0003wB-43
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 09:57:13 +0000
X-Inumbo-ID: 3758ea78-c00c-11e9-b90c-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3758ea78-c00c-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565949431;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=n7p7/qEy+Ndn1uaaW52zRk+LmUbi4vb9cKhVCPZrV9Q=;
 b=S5ehe+8cGiBXPpRuSV+AEeCokDdgXRDkMyA0Q9AQtqZYb6ZvY93AgCZ2
 RX0f6Ne9gIERfzUDpKCuhNqA39N01NjE2JJ6sYvmCDd+GvD2NFuGkpxJV
 ojpiQgOA/YX76SptsVWnDjuFE07Nm+Xkgzyi7eSKKJRV1wRzZNLDujs4z g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UTeest7qj2sw/J7QpfJp6dwELf5X0PtR/CBmbpfp5XkD8oNWlHsoGcdAI4mYEIJucTC65txnrx
 K4rgqDlCqESUOJ/DIrfd4Er49xiUaAO4g9gOEUMv7RgPNdoCeewzlrMEA8yu24btqQdIz6CIsX
 YJPk11nyCcBS1uYNNRfLqmNU9/tZNB5/gZnN0mQGIsUU6/HjiCwe9M3jjs3bhb76KK8g2LDjFv
 Zfa8/exU1/SJccdBAepaadE0uhG40KBNKQqYCd5Qzdn+i8sCvMCeH3Jwzk8JEQEbM4htGzFiCK
 41A=
X-SBRS: 2.7
X-MesageID: 4510764
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4510764"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-6-wipawel@amazon.de>
 <20190808123916.8706-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <a60d70ae-bc71-ec7c-61e1-7cbde5ef2625@citrix.com>
Date: Fri, 16 Aug 2019 10:57:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190808123916.8706-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 6/6]
 create-diff-object: Do not include all .rodata sections
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC84LzE5IDE6MzkgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IE9sZGVyIHZl
cnNpb25zIG9mIEdDQyBkaWQgbm90IHNwbGl0IC5yb2RhdGEuc3RyIHNlY3Rpb25zIGJ5IGZ1bmN0
aW9uLgo+IEJlY2F1c2Ugb2YgdGhhdCwgdGhlIGVudGlyZSBzZWN0aW9uIHdhcyBhbHdheXMgaW5j
bHVkZWQuCj4gVGhlIGxpdmVwYXRjaC1idWlsZC10b29scyBjb21taXQgWzFdIGZpeGVkIHBhdGNo
IGNyZWF0aW9uIGFuZCBrZXB0Cj4gaW5jbHVkaW5nIGFsbCAucm9kYXRhLnN0ciBzZWN0aW9ucywg
aW4gb3JkZXIgdG8gbWFpbnRhaW4gZXhpc3RpbmcKPiBiZWhhdmlvciBmb3IgR0NDIDYuMSsuCj4g
VGhpcyBtZWFucyBhbGwgLnJvZGF0YS5zdHIgc2VjdGlvbnMgYXJlIGFsd2F5cyBpbmNsdWRlZCBi
eSBkZWZhdWx0LAo+IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGV5IGFyZSBuZWVkZWQgb3Igbm90
Lgo+IAo+IER1cmluZyBzdGFja2VkIGhvdHBhdGNoIGJ1aWxkcyBpdCBsZWFkcyB0byB1bm5lY2Vz
c2FyeSBhY2N1bXVsYXRpb24gb2YKPiB0aGUgLnJvZGF0YS5zdHIgc2VjdGlvbnMgYXMgZWFjaCBh
bmQgZXZlcnkgY29uc2VjdXRpdmUgaG90cGF0Y2ggbW9kdWxlCj4gY29udGFpbnMgYWxsIHRoZSAu
cm9kYXRhLnN0ciBzZWN0aW9ucyBvZiBwcmV2aW91cyBtb2R1bGVzLgo+IAo+IFRvIHByZXZlbnQg
dGhpcyBzaXR1YXRpb24sIG1hcmsgdGhlIC5yb2RhdGEuc3RyIHNlY3Rpb25zIGZvciBpbmNsdXNp
b24KPiBvbmx5IGlmIHRoZXkgYXJlIHJlZmVyZW5jZWQgYnkgYW55IG9mIHRoZSBjdXJyZW50IGhv
dHBhdGNoIHN5bWJvbHMgKG9yCj4gYSBjb3JyZXNwb25kaW5nIFJFTEEgc2VjdGlvbikuCj4gCj4g
RXh0ZW5kIHBhdGNoYWJpbGl0eSB2ZXJpZmljYXRpb24gdG8gZGV0ZWN0IGFsbCBub24tc3RhbmRh
cmQsIG5vbi1yZWxhLAo+IG5vbi1kZWJ1ZyBhbmQgbm9uLXNwZWNpYWwgc2VjdGlvbnMgdGhhdCBh
cmUgbm90IHJlZmVyZW5jZWQgYnkgYW55IG9mCj4gdGhlIHN5bWJvbHMgb3IgUkVMQSBzZWN0aW9u
cy4KPiAKPiBbMV0gMmFmNmYxYWE2MjMzIEZpeCBwYXRjaCBjcmVhdGlvbiB3aXRoIEdDQyA2LjEr
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9u
LmRlPgo+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpv
bi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4g
UmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQo+
IHYyOgo+ICogTWFkZSB0aGUgY29tbWl0IG1lc3NhZ2UgbW9yZSBwcmVjaXNlIGFuZCBhY2N1cmF0
ZSAoYmFzZWQgb24KPiAgICBSb3NzJyBjb21tZW50cyB0byB0aGUgdjEgcGF0Y2gpCj4gKiBLZXB0
IGxpbmVzIGxpbWl0ZWQgdG8gODAgY2hhcnMKPiAtLS0KPiAgIGNyZWF0ZS1kaWZmLW9iamVjdC5j
IHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY3JlYXRl
LWRpZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwo+IGluZGV4IDgzNjVhZjAuLjQy
NTIxNzUgMTAwNjQ0Cj4gLS0tIGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMKPiArKysgYi9jcmVhdGUt
ZGlmZi1vYmplY3QuYwo+IEBAIC0xMzUwLDggKzEzNTAsNyBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hf
aW5jbHVkZV9zdGFuZGFyZF9lbGVtZW50cyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKPiAgIAo+
ICAgCWxpc3RfZm9yX2VhY2hfZW50cnkoc2VjLCAma2VsZi0+c2VjdGlvbnMsIGxpc3QpIHsKPiAg
IAkJLyogaW5jbHVkZSB0aGVzZSBzZWN0aW9ucyBldmVuIGlmIHRoZXkgaGF2ZW4ndCBjaGFuZ2Vk
ICovCj4gLQkJaWYgKGlzX3N0YW5kYXJkX3NlY3Rpb24oc2VjKSB8fAo+IC0JCSAgICBzaG91bGRf
aW5jbHVkZV9zdHJfc2VjdGlvbihzZWMtPm5hbWUpKSB7Cj4gKwkJaWYgKGlzX3N0YW5kYXJkX3Nl
Y3Rpb24oc2VjKSkgewo+ICAgCQkJc2VjLT5pbmNsdWRlID0gMTsKPiAgIAkJCWlmIChzZWMtPnNl
Y3N5bSkKPiAgIAkJCQlzZWMtPnNlY3N5bS0+aW5jbHVkZSA9IDE7Cj4gQEAgLTEzNjIsNiArMTM2
MSwyMCBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hfaW5jbHVkZV9zdGFuZGFyZF9lbGVtZW50cyhzdHJ1
Y3Qga3BhdGNoX2VsZiAqa2VsZikKPiAgIAlsaXN0X2VudHJ5KGtlbGYtPnN5bWJvbHMubmV4dCwg
c3RydWN0IHN5bWJvbCwgbGlzdCktPmluY2x1ZGUgPSAxOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyB2
b2lkIGtwYXRjaF9pbmNsdWRlX3N0YW5kYXJkX3N0cmluZ19lbGVtZW50cyhzdHJ1Y3Qga3BhdGNo
X2VsZiAqa2VsZikKPiArewo+ICsJc3RydWN0IHNlY3Rpb24gKnNlYzsKPiArCj4gKwlsaXN0X2Zv
cl9lYWNoX2VudHJ5KHNlYywgJmtlbGYtPnNlY3Rpb25zLCBsaXN0KSB7Cj4gKwkJaWYgKHNob3Vs
ZF9pbmNsdWRlX3N0cl9zZWN0aW9uKHNlYy0+bmFtZSkgJiYKPiArCQkgICAgaXNfcmVmZXJlbmNl
ZF9zZWN0aW9uKHNlYywga2VsZikpIHsKPiArCQkJc2VjLT5pbmNsdWRlID0gMTsKPiArCQkJaWYg
KHNlYy0+c2Vjc3ltKQo+ICsJCQkJc2VjLT5zZWNzeW0tPmluY2x1ZGUgPSAxOwo+ICsJCX0KPiAr
CX0KPiArfQo+ICsKPiAgICNkZWZpbmUgaW5jX3ByaW50ZihmbXQsIC4uLikgXAo+ICAgCWxvZ19k
ZWJ1ZygiJSpzIiBmbXQsIHJlY3Vyc2VsZXZlbCwgIiIsICMjX19WQV9BUkdTX18pOwpUaGlzIHBh
dGNoIGxvb2tzIGdvb2QuIFRoZXJlIGlzIGEgY29tbWVudCBhdCB0aGUgdG9wIG9mIApzaG91bGRf
aW5jbHVkZV9zdHJfc2VjdGlvbigpIHdoaWNoIHNob3VsZCBwcm9iYWJseSBiZSB1cGRhdGVkIGFz
IHdlbGw6CgovKgogICogU3RyaW5nIHNlY3Rpb25zIGFyZSBhbHdheXMgaW5jbHVkZWQgZXZlbiBp
ZiB1bmNoYW5nZWQuCiAgKiBUaGUgZm9ybWF0IGlzIGVpdGhlcjoKICAqIC5yb2RhdGEuPGZ1bmM+
LnN0cjEuWzAtOV0rIChuZXcgaW4gR0NDIDYuMS4wKQogICogb3IgLnJvZGF0YS5zdHIxLlswLTld
KyAob2xkZXIgdmVyc2lvbnMgb2YgR0NDKQogICogRm9yIHRoZSBuZXcgZm9ybWF0IHdlIGNvdWxk
IGJlIHNtYXJ0ZXIgYW5kIG9ubHkgaW5jbHVkZSB0aGUgbmVlZGVkCiAgKiBzdHJpbmdzIHNlY3Rp
b25zLgogICovCgpJbiBmYWN0LCBpdCBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSB0byByZW5hbWUg
dGhlIGZ1bmN0aW9uIHRvIHNvbWV0aGluZyAKbGlrZSAiaXNfcm9kYXRhX3N0cl9zZWN0aW9uKCki
IHNpbmNlIHRoaXMgbW9yZSBhY2N1cmF0ZWx5IGRlc2NyaWJlcyB3aGF0IAppdCBkb2VzIG5vdy4K
ClRoYW5rcywKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
