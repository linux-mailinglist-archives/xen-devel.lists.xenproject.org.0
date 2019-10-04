Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF5CC18F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGREr-0005zz-JP; Fri, 04 Oct 2019 17:19:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGREq-0005zu-37
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:19:32 +0000
X-Inumbo-ID: 2075f680-e6cb-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2075f680-e6cb-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570209571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gnRnZNuBMVJzv82PkFY8ARtaFV10Y0HzbUsI0UjSxT0=;
 b=dJeu1x9rqliNJVBvv0LvVVPukjhdIP0hbXBpfRH4aTafBimebqFRSEQm
 f7nVF68jp8L6Wq9BR3WHZ3Mz5ufyvskcz/QWNnSyIHE8nt2ZxHo468s6D
 Y1Q/a9bMGo/XawatnWK8PAt+sgPHeCEc9G6tJvwtcyHyEvcOHT7oAhWaI 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Hts0Mswa+C8bqulurgVqV+zfC7g7STtYjB0IR6L/ixtg6jDu7OIF2kY9Ud4ytY0ChhHYUwM91U
 Zubgb04NU3bzs8O3c8hd9v7q3KpNJXpoisCEI45ULaboGnt2wnd2alHnqfahpuq9/QpE8IqTjU
 VfnSGDxWUMlgGisLp6PkLGlWwzopxbbs8Ics081RnIJG2VePlIGXMeSP7r7K3eHs8/0UjrJuTH
 i85sBReYv6cri16N3oq+diMdekeS77OyeP76vPoEZWVt0NIUc2duuSqwaS0COipgOwsp5JOgSu
 Spc=
X-SBRS: 2.7
X-MesageID: 6739708
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,257,1566878400"; 
   d="scan'208";a="6739708"
Date: Fri, 4 Oct 2019 18:19:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191004171928.GO1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-6-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151707.24844-6-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 5/6] libxl: Move shadow_memkb
 and iommu_memkb defaulting into libxl
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDZQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQEAgLTg2Miw2ICs4NjQsMzAgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2Rlc3RydWN0
aW9uX2NiKGxpYnhsX19lZ2MgKmVnYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxpYnhsX19kb21haW5fZGVzdHJveV9zdGF0ZSAqZGRzLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKPiAgCj4gK3N0YXRpYyBfQm9vbCBva190
b19kZWZhdWx0X21lbWtiX2luX2NyZWF0ZShsaWJ4bF9fZ2MgKmdjKQoKSXMgdGhlcmUgYSByZWFz
b24gdG8gdXNlIF9Cb29sIGluc3RlYWQgb2YgYGJvb2wnPyBJdCB3b3VsZCBiZSB0aGUgZmlyc3QK
X0Jvb2wgaW4gbGlieGwuCgo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogVGhpcyBpcyBhIGZ1ZGdl
LiAgV2UgYXJlIHRyeWluZyB0byBmaW5kIHdoZXRoZXIgdGhlIGNhbGxlcgo+ICsgICAgICogY2Fs
bHMgdGhlIG9sZCB2ZXJzaW9uIG9mIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeS4gIElmIHRoZXkg
ZG8KPiArICAgICAqIHRoZW4sIGJlY2F1c2UgaXQgb25seSBnZXRzIHRoZSBiX2luZm8sIGFuZCBi
ZWNhdXNlIGl0IGNhbid0Cj4gKyAgICAgKiB1cGRhdGUgdGhlIGJfaW5mbyAoYmVjYXVzZSBpdCdz
IGNvbnN0KSwgaXQgd2lsbCBiYXNlIGl0cwo+ICsgICAgICogY2FsY3VsYXRpb25zIG9uIGRlZmF1
bHRpbmcgc2hhZG93X21lbWtiIGFuZCBpb21tdV9tZW1rYiB0byAwCj4gKyAgICAgKiBJbiB0aGF0
IGNhc2Ugd2UgcHJvYmFibHkgc2hvdWxkbid0IGRlZmF1bHQgdGhlbSBkaWZmZXJlbnRseQo+ICsg
ICAgICogZHVyaW5nIGxpYnhsX2RvbWFpbl9jcmVhdGUuCj4gKyAgICAgKgo+ICsgICAgICogVGhl
IHJlc3VsdCBpcyB0aGF0IHRoZSBiZWhhdmlvdXIgd2l0aCBvbGQgY2FsbGVycyBpcyB0aGUgc2Ft
ZQo+ICsgICAgICogYXMgaW4gNC4xMzogbm8gYWRkaXRpb25hbCBtZW1vcnkgaXMgYWxsb2NhdGVk
IGZvciBzaGFkb3cgYW5kCj4gKyAgICAgKiBpb21tdSAodW5sZXNzIHRoZSBjYWxsZXIgc2V0IHNo
YWRvd19tZW1rYiwgZWcgZnJvbSBhIGNhbGwgdG8KPiArICAgICAqIGxpYnhsX2dldF9yZXF1aXJl
ZF9zaGFkb3dfbWVtb3J5KS4KPiArICAgICAqLwo+ICsgICAgcmV0dXJuIENUWC0+bGlieGxfZG9t
YWluX25lZWRfbWVtb3J5XzB4MDQxMjAwX2NhbGxlZCAmJgo+ICsgICAgICAgICAgIUNUWC0+bGli
eGxfZG9tYWluX25lZWRfbWVtb3J5X2NhbGxlZDsKCkkgdGhpbmsgdGhlIGxvZ2ljIGhlcmUgaXMg
aW52ZXJ0ZWQuCgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgd2UgaGF2ZToKeGwKICAgIGNhbGxz
IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSgpCiAgICAgICAgbGlieGxfX2RvbWFpbl9jb25maWdf
c2V0ZGVmYXVsdCgpCiAgICAgICAgICAgIGJlY2F1c2Ugc2hhZG93X21lbWtiIGlzIGRlZmF1bHQg
YW5kIHRoYXQgZnVuY3Rpb24gcmV0dXJuIDAKICAgICAgICAgICAgdGhlbiBzaGFkb3dfbWVta2Ig
aXMgc3RpbGwgZGVmYXVsdAogICAgY3JlYXRlX2RvbWFpbigpCiAgICAgICAgbGlieGxfX2RvbWFp
bl9jb25maWdfc2V0ZGVmYXVsdCgpCiAgICAgICAgICAgIHNhbWUgdGhpbmcsIHNoYWRvd19tZW1r
YiBpcyB1bnRvdWNoLCBzbyBzdGlsbCBkZWZhdWx0CiAgICAgICAgICAgIGxpYnhsX19kb21haW5f
YnVpbGRfaW5mb19zZXRkZWZhdWx0KCkKICAgICAgICAgICAgICAgIHNoYWRvd19tZW1rYiBpcyBk
ZWZhdWx0CiAgICAgICAgICAgICAgICAgICAgLT4gc2hhZG93X21lbWtiID0gMAoKVGhpcyBpcyBk
aWZmZXJlbnQgd2hhdCBpcyBleHBlY3RlZCBieSB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gRm9yIHhs
LCBubyBjaGFuZ2UuICBUaGUgY29kZSBtb3ZlcyBmcm9tIHhsIHRvIGxpYnhsLgoKSW5zdGVhZCwg
aWYgeGwgY2FsbHMgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5XzB4MDQxMjAwKCk6CiAgICBjcmVh
dGVfZG9tYWluKCkKICAgICAgICBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KCkKICAg
ICAgICAgICAgaWYgc2hhZG93X21lbWtiIGlzIGRlZmF1bHQ7IG9rX3RvX2RlZmF1bHRfbWVta2Jf
aW5fY3JlYXRlIGlzIDEKICAgICAgICAgICAgICAgIHNvIHNoYWRvd19tZW1rYiBpcyBzZXQgdG8g
YSB2YWx1ZSBkaWZmZXJlbnQgdGhhdCB0aGUgb25lCiAgICAgICAgICAgICAgICBjYWxjdWxhdGVk
IGJ5IG5lZWRfbWVtb3J5XzB4MDQxMDAuCgpPciBkaWQgSSBtaXNzIHNvbWV0aGluZz8KCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
