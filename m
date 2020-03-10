Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C5180480
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:12:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBiOr-0005Fo-Jn; Tue, 10 Mar 2020 17:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GfWC=43=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jBiOp-0005Fh-Ou
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:10:35 +0000
X-Inumbo-ID: 0d7377bc-62f2-11ea-adf9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d7377bc-62f2-11ea-adf9-12813bfff9fa;
 Tue, 10 Mar 2020 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583860234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=izHnRl4uL37W40d/6Ni48bx6PqxsYj7kuIT0hH6RSPU=;
 b=JdQ8q4JyOwTVqAfM6EBdbUSjSrDc13KsSPrTSU0T4hMwlCMC/0Bnt5ZD
 kPRoLcv3WzvvQYV5G0sqlsAHKnwteBKvaAKrhHJ1Xh02WkszMbU0DSotf
 pgNHO5AqO69RaSgtJ2AcDAaukmLixAsC0C75wd5BUat87rBfOJN3csMrz g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4cVV4ofLY7kYXhlEQKj0AEp3++dZdibcIpYGWJuXtVGL9OkJkG5A/b+2oIGrzZqWMqkW9kYJjh
 /EMfbN5suOd95WcnOxCvfSWpDIKMYFxIIuLWdlSH9+Hm1BHHCg+lih/OI+RxfGbYMEMeHB+/CM
 a9dSqMNSD1JXaZ8JEV8pApNSy6Gj0tTk93dK1KEWG6QWSn08VA1Ug8YRuH6faNfy8CZsjK3Se0
 GclGOxxzBsV1QMhn4Ts2PR5f1ePbrlEafO4yVhnA7hOD5EqZGVgQzv9HgOfJIBqrNbC+6QqI/4
 SAc=
X-SBRS: 2.7
X-MesageID: 13721808
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="13721808"
Date: Tue, 10 Mar 2020 17:10:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200310171022.GE2152@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-14-anthony.perard@citrix.com>
 <ba5b75bf-acb0-5ff4-cd79-a96b6ae86c09@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba5b75bf-acb0-5ff4-cd79-a96b6ae86c09@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 13/23] xen/build: include
 include/config/auto.conf in main Makefile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDM6Mjk6NTVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vTWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9NYWtlZmlsZQo+ID4gQEAgLTQ5LDcgKzQ5LDcx
IEBAIGRlZmF1bHQ6IGJ1aWxkCj4gPiAgLlBIT05ZOiBkaXN0Cj4gPiAgZGlzdDogaW5zdGFsbAo+
ID4gIAo+ID4gLWJ1aWxkIGluc3RhbGw6OiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYKPiA+ICsK
PiA+ICtpZmVxICgkKHJvb3QtbWFrZS1kb25lKSwpCj4gCj4gVGhpcyBnZXR0aW5nIGNvbW11bmlj
YXRlZCBiZXR3ZWVuIG1ha2UgcmVjdXJzaW9uIGluc3RhbmNlcyB2aWEgLi4uCj4gCj4gPiArIyBz
ZWN0aW9uIHRvIHJ1biBiZWZvcmUgY2FsbGluZyBSdWxlcy5taywgYnV0IG9ubHkgb25jZS4KPiA+
ICsjCj4gPiArIyBUbyBtYWtlIHN1cmUgd2UgZG8gbm90IGluY2x1ZGUgLmNvbmZpZyBmb3IgYW55
IG9mIHRoZSAqY29uZmlnIHRhcmdldHMKPiA+ICsjIGNhdGNoIHRoZW0gZWFybHksIGFuZCBoYW5k
IHRoZW0gb3ZlciB0byB0b29scy9rY29uZmlnL01ha2VmaWxlCj4gPiArCj4gPiArY2xlYW4tdGFy
Z2V0cyA6PSAlY2xlYW4KPiA+ICtuby1kb3QtY29uZmlnLXRhcmdldHMgOj0gJChjbGVhbi10YXJn
ZXRzKSBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHVuaW5zdGFsbCBkZWJ1ZyBjbG9j
IFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgY3Njb3BlIFRBR1MgdGFncyBNQVAgZ3Rh
Z3MgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICB4ZW52ZXJzaW9uCj4gPiArCj4gPiAr
Y29uZmlnLWJ1aWxkICAgIDo9IG4KPiA+ICtuZWVkLWNvbmZpZyAgICAgOj0geQo+ID4gKwo+ID4g
K2lmbmVxICgkKGZpbHRlciAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxT
KSksKQo+ID4gKyAgICBpZmVxICgkKGZpbHRlci1vdXQgJChuby1kb3QtY29uZmlnLXRhcmdldHMp
LCAkKE1BS0VDTURHT0FMUykpLCkKPiA+ICsgICAgICAgIG5lZWQtY29uZmlnIDo9IG4KPiA+ICsg
ICAgZW5kaWYKPiA+ICtlbmRpZgo+ID4gKwo+ID4gK2lmbmVxICgkKGZpbHRlciAlY29uZmlnLCQo
TUFLRUNNREdPQUxTKSksKQo+ID4gKyAgICBjb25maWctYnVpbGQgOj0geQo+ID4gK2VuZGlmCj4g
PiArCj4gPiArZXhwb3J0IHJvb3QtbWFrZS1kb25lIDo9IHkKPiAKPiAuLi4gdGhlIGVudmlyb25t
ZW50LCBjYW4gd2UgYmUgYXMgcmVzaWxpZW50IGFzIHBvc3NpYmxlIGFnYWluc3QgYQo+IHZhcmlh
YmxlIG9mIHRoaXMgbmFtZSBhbHJlYWR5IGV4aXN0aW5nIGluIHRoZSBlbnZpcm9ubWVudCBiZWZv
cmUKPiB0aGUgdG9wIGxldmVsIG1ha2UgaW52b2NhdGlvbiwgYnkgbWFraW5nIHRoZSBjb25zdHJ1
Y3QgYWJvdmUKPiAKPiBpZm5lcSAoJChyb290LW1ha2UtZG9uZSkseSkKPiAKPiA/CgpTb3VuZCBn
b29kLCBJJ2xsIGRvIHRoYXQuCgo+ID4gK2VuZGlmICMgcm9vdC1tYWtlLWRvbmUKPiA+ICsKPiA+
ICtpZmVxICgkKGNvbmZpZy1idWlsZCkseSkKPiA+ICsjID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4g
KyMgKmNvbmZpZyB0YXJnZXRzIG9ubHkgLSBtYWtlIHN1cmUgcHJlcmVxdWlzaXRlcyBhcmUgdXBk
YXRlZCwgYW5kIGRlc2NlbmQKPiA+ICsjIGluIHRvb2xzL2tjb25maWcgdG8gbWFrZSB0aGUgKmNv
bmZpZyB0YXJnZXQKPiA+ICsKPiA+ICtjb25maWc6IEZPUkNFCj4gPiArCSQoTUFLRSkgLWYgJChC
QVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FS
Q0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgJEAK
PiAKPiBUaGlzLCAuLi4KPiAKPiA+ICsKPiA+ICsjIENvbmZpZy5tayB0cmllcyB0byBpbmNsdWRl
IC5jb25maWcgZmlsZSwgZG9uJ3QgdHJ5IHRvIHJlbWFrZSBpdAo+ID4gKyUvLmNvbmZpZzogOwo+
ID4gKwo+ID4gKyVjb25maWc6IEZPUkNFCj4gPiArCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29s
cy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNI
KSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgJEAKPiAKPiAuLi4gdGhp
cywgLi4uCj4gCj4gPiArZWxzZSAjICFjb25maWctYnVpbGQKPiA+ICsKPiA+ICtpZmVxICgkKG5l
ZWQtY29uZmlnKSx5KQo+ID4gK2luY2x1ZGUgaW5jbHVkZS9jb25maWcvYXV0by5jb25mCj4gPiAr
IyBSZWFkIGluIGRlcGVuZGVuY2llcyB0byBhbGwgS2NvbmZpZyogZmlsZXMsIG1ha2Ugc3VyZSB0
byBydW4gc3luY2NvbmZpZyBpZgo+ID4gKyMgY2hhbmdlcyBhcmUgZGV0ZWN0ZWQuCj4gPiAraW5j
bHVkZSBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYuY21kCj4gPiArCj4gPiArIyBBbGxvdyBwZW9w
bGUgdG8ganVzdCBydW4gYG1ha2VgIGFzIGJlZm9yZSBhbmQgbm90IGZvcmNlIHRoZW0gdG8gY29u
ZmlndXJlCj4gPiArJChLQ09ORklHX0NPTkZJRyk6Cj4gPiArCSQoTUFLRSkgLWYgJChCQVNFRElS
KS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChT
UkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgZGVmY29uZmln
Cj4gCj4gLi4uIHRoaXMsIGFuZCAuLi4KPiAKPiA+ICsjIFRoZSBhY3R1YWwgY29uZmlndXJhdGlv
biBmaWxlcyB1c2VkIGR1cmluZyB0aGUgYnVpbGQgYXJlIHN0b3JlZCBpbgo+ID4gKyMgaW5jbHVk
ZS9nZW5lcmF0ZWQvIGFuZCBpbmNsdWRlL2NvbmZpZy8uIFVwZGF0ZSB0aGVtIGlmIC5jb25maWcg
aXMgbmV3ZXIgdGhhbgo+ID4gKyMgaW5jbHVkZS9jb25maWcvYXV0by5jb25mICh3aGljaCBtaXJy
b3JzIC5jb25maWcpLgo+ID4gKyMKPiA+ICsjIFRoaXMgZXhwbG9pdHMgdGhlICdtdWx0aS10YXJn
ZXQgcGF0dGVybiBydWxlJyB0cmljay4KPiA+ICsjIFRoZSBzeW5jY29uZmlnIHNob3VsZCBiZSBl
eGVjdXRlZCBvbmx5IG9uY2UgdG8gbWFrZSBhbGwgdGhlIHRhcmdldHMuCj4gPiAraW5jbHVkZS9j
b25maWcvJS5jb25mIGluY2x1ZGUvY29uZmlnLyUuY29uZi5jbWQ6ICQoS0NPTkZJR19DT05GSUcp
Cj4gPiArCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25m
aWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9T
VENYWD0iJChIT1NUQ1hYKSIgc3luY2NvbmZpZwo+IAo+IC4uLiB0aGlzIGFyZSBhbG1vc3QgaWRl
bnRpY2FsLCBwcmV0dHkgbG9uZyBsaW5lcy4gQ2FuIHRoaXMgYmUgbWFjcm9pemVkLAo+IHBsZWFz
ZSwgd2l0aCB0aGUgYWN0dWFsIG1ha2UgZ29hbCBhcyBwYXJhbWV0ZXI/CgpTb3VuZCBnb29kLCB3
b3VsZCB0aGUgZm9sbG93aW5nIGJlIGZpbmU/CgprY29uZmlnID0gLWYgJChCQVNFRElSKS90b29s
cy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNI
KSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIKY29uZmlnOgogICAgJChN
QUtFKSAkKGtjb25maWcpICRACgpJIHdpbGwgcHV0IHRoYXQgbmV3IGBrY29uZmlnJyBtYWNybyBp
biBLYnVpbGQuaW5jbHVkZSwgYWxvbmcgdGhlCnNob3J0aGFuZCBmb3IgY2xlYW4uCgpUaGFua3Ms
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
