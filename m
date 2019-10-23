Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F79E1ED2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:04:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNI8O-0004QF-9r; Wed, 23 Oct 2019 15:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNI8N-0004Q4-NF
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:01:11 +0000
X-Inumbo-ID: f231ce72-f5a5-11e9-9482-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f231ce72-f5a5-11e9-9482-12813bfff9fa;
 Wed, 23 Oct 2019 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571842870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=9Uo+sc1926KOA58X9urPJHNNhEpGo9n1mqvn6D5Q324=;
 b=YAS9C4dOqc78cgfbmCuP4/3PlmzI2wKkQd8Oc53oRtCVrlvSyhw7E0KS
 6t1+9nIDXB173J/wBFz+hnRt3u41YyXtvzJayY70F29dhwRP7P6xJzBmb
 p5vsYBqm4gC0chk5Sdu+iUXhTPqrrt4TipvVBZrm/cuQOktCvC57IGn22 A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y7SJffpRy123FFeo5a8EO6RbtqktZHBOdp+bWWLwxcqqFUQWC3nN/q4wi7q6Q3JJ3c8c5tLnRR
 3SYofZUCqM915B+a9qCzCCAXB5oo7KyFNOPQWOvCSQYjayyOI1XpS90kK0Ae0ELVI3KwUAuCmP
 yXZUOHNa+bZF8xhkQkplC7YzwKCZqDm9RMaEOi35a8f0XZPr7wCjaAb0Qx8u6blRXi+ugrWZ1y
 vXR6uxSnRbx5G7l7Ui1i7/G2HzqvZklBymHh4seYDmvDWdjQBlmZ3+zVvFuCYitYVU80DykY5f
 0yQ=
X-SBRS: 2.7
X-MesageID: 7325176
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7325176"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 16:01:03 +0100
Message-ID: <20191023150103.31562-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023150103.31562-1-ian.jackson@eu.citrix.com>
References: <20191023150103.31562-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/2] make-flight: Drop arm64 with Linux
 before 4.10
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRyaXZlciBmb3IgdGhlIGxheHRvbnMnIG5ldHdvcmsgY2FyZHMgaXMgbm90IGluIDQuNCAo
YW5kIHRoYXQncwpxdWl0ZSBvbGQpLiAgT3VyIFRodW5kZXJYJ3MgbWF5IGV2ZW4gcmVxdWlyZSBz
b21ldGhpbmcgbW9yZSByZWNlbnQgYnV0CndlIHdpbGwgY3Jvc3MgdGhhdCBicmlkZ2Ugd2hlbiB3
ZSBzZWUgaXQuCgpFZmZlY3QgaXMgdG8gZHJvcCB0aGUgZm9sbG93aW5nIGpvYnM6CiAgbGludXgt
NC4xICAqYXJtNjQqCiAgbGludXgtNC40ICAqYXJtNjQqCiAgbGludXgtNC45ICAqYXJtNjQqCihD
aGVja2VkIGJ5IGV5ZWJhbGxpbmcgc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52
YXJzIGRpZmYuKQoKQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1ha2UtZmxpZ2h0
IHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1mbGlnaHQKaW5kZXggZjkwZmU3
N2MuLmJlNjIwYzZkIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9tYWtlLWZsaWdodApA
QCAtMTgzLDcgKzE4Myw3IEBAIGpvYl9jcmVhdGVfdGVzdF9maWx0ZXJfY2FsbGJhY2sgKCkgewog
YXJjaF9icmFuY2hfZmlsdGVyX2NhbGxiYWNrICgpIHsKICAgbG9jYWwgYXJjaD0kMQogICBjYXNl
ICIkYXJjaCIgaW4KLSAgYXJtKikKKyAgYXJtaGYpCiAgICAgICAgIGNhc2UgIiRicmFuY2giIGlu
CiAgICAgICAgIGxpbnV4LTMuMCkgcmV0dXJuIDE7OwogICAgICAgICBsaW51eC0zLjQpIHJldHVy
biAxOzsKQEAgLTE5MSw2ICsxOTEsMTIgQEAgYXJjaF9icmFuY2hfZmlsdGVyX2NhbGxiYWNrICgp
IHsKICAgICAgICAgbGludXgtMy4xNCkgcmV0dXJuIDE7OwogICAgICAgICBlc2FjCiAgICAgICAg
IDs7CisgIGFybTY0KQorICAgICAgICBjYXNlICIkYnJhbmNoIiBpbgorICAgICAgICBsaW51eC0z
LiopIHJldHVybiAxOzsKKyAgICAgICAgbGludXgtNC4/KSByZXR1cm4gMTs7CisgICAgICAgIGVz
YWMKKyAgICAgICAgOzsKICAgZXNhYwogICBjYXNlICIkYXJjaCIgaW4KICAgYXJtKikKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
