Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5AED67C4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:54:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3YE-0006jl-RH; Mon, 14 Oct 2019 16:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0Yg=YH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iK3YD-0006jf-QK
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:50:29 +0000
X-Inumbo-ID: ba21a7b4-eea2-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba21a7b4-eea2-11e9-beca-bc764e2007e4;
 Mon, 14 Oct 2019 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571071829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hpDYbgy8D7XI0iNfRO73c6Y96KUbgb6gNMHjod7JQTE=;
 b=cEtnQaqAFU1khMMz5JQGSfvoMilPm9cAmK3+wH7zEJVSTtTXMtLNNxUz
 7qP9yYpkZd44hlDD022XWv6PlBfKbwmRGMQkn7XHSSjlYxErHKVSbPlnO
 GB587/EBrM3SorQD4ceEeLIbuBFt4JLgCZT9Q8fSph7rjlr//sYOPlcAa 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RvlLbO826be+hwgQT68lD2P0tn7HD14pZOrB0D0m/53PyGXSRLWptaHa44ncvbJAgVqkL6zw/w
 7OTyuf9UQ59ECqbqSESyVRw5Ih5ClaBR9AFh+TtA/X8N8SJJuiGZ90BG0zedOPcjClkmBckdNd
 fK1g2Dniqyb4V6DKVq5K+Fub0/f2990x2zF/yjVUd2RXPsoPslm5vpkXiLB/pdfaL5EsyN2fqI
 /G/UNlQMch6JI3Kfv3pEbBZLbMNg4N93d/9EC2Jh+lyQUnIFbUCT2GUyw0+XDCICtOmN67zeMW
 xQU=
X-SBRS: 2.7
X-MesageID: 7173807
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="7173807"
Date: Mon, 14 Oct 2019 17:50:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191014165026.GC5743@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011165549.21639-2-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 05/10] libxl: Move
 shadow_memkb and iommu_memkb defaulting into libxl
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NTU6NDRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRm9yIGNhbGxlcnMgd2hpY2ggY2FsbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnksIGFu
ZCByZXF1ZXN0IGFuIG9sZAo+IHByZS00LjEzIGxpYnhsIEFQSSwgYW5kIHdoaWNoIGxlYXZlIG9u
ZSBvZiB0aGVzZSBtZW1rYiBzZXR0aW5ncyB1bnNldCwKPiB3ZSB0YWtlIHNwZWNpYWwgbWVhc3Vy
ZXMgdG8gcHJlc2VydmUgdGhlIG9sZCBiZWhhdmlvdXIuCj4gCj4gVGhpcyBtZWFucyB0aGF0IHRo
ZXkgZG9uJ3QgZ2V0IHRoZSBhZGRpdGlvbmFsIGlvbW11IG1lbW9yeSBhbmQgYXJlIGF0Cj4gcmlz
ayBvZiB0aGUgZG9tYWluIHJ1bm5pbmcgb3V0IG9mIG1lbW9yeSBhcyBhIHJlc3VsdCBvZiBmODlm
NTU1ODI3YTYKPiAicmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1V
IHBhZ2UgdGFibGVzIi4gIEJ1dCB0aGlzCj4gaXMgbm8gd29yc2UgdGhhbiB0aGUgc3RhdGUganVz
dCBhZnRlciBmODlmNTU1ODI3YTYsIHdoaWNoIGFscmVhZHkKPiBicm9rZSBzdWNoIGNhbGxlcnMg
aW4gdGhhdCB3YXkuICBUaGlzIGlzIHBlcmhhcHMganVzdGlmaWFibGUgYmVjYXVzZQo+IG9mIHRo
ZSBBUEkgc3RhYmlsaXR5IHdhcm5pbmcgbmV4dCB0byBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnku
CgpUaGVyZSdzIHByb2JhYmx5IHNvbWV0aGluZyBlbHNlIHRoYXQgaXMgbmVlZGVkIHRvIGJlIGRv
bmUgZm9yIHVzZXIgb2YKdGhlIHByZS00LjEzIEFQSS4gSWYgdGhleSBjYWxsIGxpYnhsX2RvbWFp
bl9uZWVkX21lbW9yeV8weDA0MTIwMCwgdGhlcmUKaXMgbm90aGluZyB0aGF0IHNldCBpb21tdV9t
ZW1rYiwgc28gdGhlIGRlZmF1bHQgdmFsdWUgc3RheXMgYXQgLTEgYW5kCmxpYnhsX2RvbWFpbl9u
ZWVkX21lbW9yeV8weDA0MTIwMCByZXR1cm5zIGEgdmFsdWUgdGhhdCBpcyBsb3dlciB0aGF0CiJ0
YXJnZXRfbWVta2IgKyBzaGFkb3dfbWVta2IiLiBUaGVuLCB3aGVuIGxpYnhsIGNyZWF0ZSB0aGUg
ZG9tYWluLCBpdApzdGlsbCBrZWVwIGlvbW11X21lbWtiPT0tMSwgYmVjYXVzZSB0aGUgb2xkIEFQ
SSBhcyBiZWVuIHVzZWQuCgpJIHRyaWVkIHRvIGhhdmUgeGwgY2FsbCB0aGUgNC4xMiBBUEkgYW5k
IGNyZWF0ZSBhIGd1ZXN0IHdpdGhvdXQKcGFzc3Rocm91Z2gsIGFuZCBRRU1VIGNyYXNoZWQgKGFz
c2VydCgpIGZhaWx1cmUpLgoKU28gbWF5YmUgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRl
ZmF1bHQoKSBzaG91bGQgYWxzbyBzZXQgYSB2YWx1ZQp0byBpb21tdV9tZW1rYiBhcyBpdCBkb2Vz
IGZvciBzaGFkb3dfbWVta2I/IEF0IGxlYXN0LCBzZXQgaW9tbXVfbWVta2I9MAppZiBzdGlsbCB0
aGUgZGVmYXVsdC4KCmlvbW11X21lbWtiIGlzIG5ldyBpbiA0LjEzLCB1c2VyIG9mIHRoZSBwcmUt
NC4xMyBBUEkgd2lsbCBub3Qgc2V0IGl0LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
