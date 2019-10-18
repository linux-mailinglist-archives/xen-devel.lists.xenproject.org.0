Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353BDC81D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLTqg-0005AX-46; Fri, 18 Oct 2019 15:07:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MKZ=YL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iLTqe-00059w-Hl
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:07:24 +0000
X-Inumbo-ID: efa2e394-f1b8-11e9-8aca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa2e394-f1b8-11e9-8aca-bc764e2007e4;
 Fri, 18 Oct 2019 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571411222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=oQSOfhArtlO3bwUuH/V4jT2AeG2GwRZpRhSiBnBelUo=;
 b=Bg+sy8cqhPtJzeKHHxuUheqpmvtWobv42FFVZvNKYmN+w0+9U40drBGJ
 fx7ncaXEn8bd758ipLgvlSmBenbkpIUffnevyjGd7smbvzWXVX35m1f5H
 GMm1Rvo7nRIuONIdzoXhifmy4yGbX3EUvtzi7pqEytef5vTXrbcJ07Jov A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ma4s4eOZN/gs4ow3XkD9OhGiz5FqU4lnmCXLWsQ4553FHi4H/00QD8fJkQXoZ4tsv3b6O6Tlpx
 bN/Z7Br20pTBvm0NKGIdBU4BEGtBc5Wq/Z57FDam36alCFgMBButwX0hIASL236AVPFkkKdrWb
 BTR/ig7bxYFSOinOdpE57Vl+OeLa+/g7hJIX3vKOxfTbFF11XzShtpiZdnB7i0RLoCowJcaubb
 QJ2piWKdycROMteZSJ/o4VFmlL261CRM+qa6eaonRHuL0s+wJqIBZwXCGj+dcgIQazSnwR/fA6
 u0o=
X-SBRS: 2.7
X-MesageID: 7191967
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7191967"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 18 Oct 2019 16:06:50 +0100
Message-ID: <20191018150653.24862-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v5 07/10] libxl: create:
 setdefault: Make libxl_physinfo info[1]
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
Cc: Paul Durrant <pdurrant@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBUaGlzIHdpbGwgbGV0IHVzIG1ha2UgaXQgaW50byBhIHBv
aW50ZXIgd2l0aG91dAp0ZXh0dWFsIGNoYW5nZSBvdGhlciB0aGFuIHRvIHRoZSBkZWZpbml0aW9u
LgoKV2hpbGUgd2UgYXJlIGhlcmUsIGZpeCBzb21lIHN0eWxlIGVycm9ycyAobWlzc2luZyB7IH0p
LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KdjI6IE5ldyBwYXRjaCBpbiB0aGlz
IHZlcnNpb24gb2YgdGhlIHNlcmllcy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyB8
IDE2ICsrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRleCBlNGRkZmQwNjdmLi5kNjVkZjc5MjRkIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYwpAQCAtMzAsMTAgKzMwLDEwIEBACiBpbnQgbGlieGxfX2RvbWFpbl9jcmVh
dGVfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbyAqY19pbmZvKQogewot
ICAgIGxpYnhsX3BoeXNpbmZvIGluZm87CisgICAgbGlieGxfcGh5c2luZm8gaW5mb1sxXTsKICAg
ICBpbnQgcmM7CiAKLSAgICByYyA9IGxpYnhsX2dldF9waHlzaW5mbyhDVFgsICZpbmZvKTsKKyAg
ICByYyA9IGxpYnhsX2dldF9waHlzaW5mbyhDVFgsIGluZm8pOwogICAgIGlmIChyYykKICAgICAg
ICAgcmV0dXJuIHJjOwogCkBAIC00NSwxMSArNDUsMTEgQEAgaW50IGxpYnhsX19kb21haW5fY3Jl
YXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgIGxpYnhsX19hcmNoX2RvbWFp
bl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGdjLCBjX2luZm8pOwogCiAgICAgaWYgKGNfaW5mby0+
dHlwZSAhPSBMSUJYTF9ET01BSU5fVFlQRV9QVikgewotICAgICAgICBpZiAoaW5mby5jYXBfaGFw
KQorICAgICAgICBpZiAoaW5mby0+Y2FwX2hhcCkgewogICAgICAgICAgICAgbGlieGxfZGVmYm9v
bF9zZXRkZWZhdWx0KCZjX2luZm8tPmhhcCwgdHJ1ZSk7Ci0gICAgICAgIGVsc2UgaWYgKGluZm8u
Y2FwX3NoYWRvdykKKyAgICAgICAgfSBlbHNlIGlmIChpbmZvLT5jYXBfc2hhZG93KSB7CiAgICAg
ICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmNfaW5mby0+aGFwLCBmYWxzZSk7Ci0g
ICAgICAgIGVsc2UgeworICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgTE9HKEVSUk9SLCAi
bmVpdGhlciBoYXAgbm9yIHNoYWRvdyBwYWdpbmcgYXZhaWxhYmxlIik7CiAgICAgICAgICAgICBy
ZXR1cm4gRVJST1JfSU5WQUw7CiAgICAgICAgIH0KQEAgLTYzLDEyICs2MywxMiBAQCBpbnQgbGli
eGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgaWYg
KCFjX2luZm8tPnNzaWRyZWYpCiAgICAgICAgIGNfaW5mby0+c3NpZHJlZiA9IFNFQ0lOSVRTSURf
RE9NVTsKIAotICAgIGlmIChpbmZvLmNhcF9odm1fZGlyZWN0aW8gJiYKKyAgICBpZiAoaW5mby0+
Y2FwX2h2bV9kaXJlY3RpbyAmJgogICAgICAgICAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJY
TF9QQVNTVEhST1VHSF9VTktOT1dOKSkgewogICAgICAgICBjX2luZm8tPnBhc3N0aHJvdWdoID0g
KChjX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHx8Ci0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIWluZm8uY2FwX2lvbW11X2hhcF9wdF9zaGFyZSkgPworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICFpbmZvLT5jYXBfaW9tbXVfaGFwX3B0X3NoYXJlKSA/
CiAgICAgICAgICAgICBMSUJYTF9QQVNTVEhST1VHSF9TWU5DX1BUIDogTElCWExfUEFTU1RIUk9V
R0hfU0hBUkVfUFQ7Ci0gICAgfSBlbHNlIGlmICghaW5mby5jYXBfaHZtX2RpcmVjdGlvKSB7Cisg
ICAgfSBlbHNlIGlmICghaW5mby0+Y2FwX2h2bV9kaXJlY3RpbykgewogICAgICAgICBjX2luZm8t
PnBhc3N0aHJvdWdoID0gTElCWExfUEFTU1RIUk9VR0hfRElTQUJMRUQ7CiAgICAgfQogCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
