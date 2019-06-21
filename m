Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E54ED4A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 18:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heMYY-0003pd-GD; Fri, 21 Jun 2019 16:38:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heMYW-0003ox-83
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 16:38:28 +0000
X-Inumbo-ID: fe28a3f0-9442-11e9-aa11-bbb040b173d9
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe28a3f0-9442-11e9-aa11-bbb040b173d9;
 Fri, 21 Jun 2019 16:38:27 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4Pede6atyIAyI48f3TQL0rHV8XjcP/UVhuaByt/P2EN7RHxqZByXgICq8CJsZpFgPQhI8e6Mh/
 tzRVj6jMk1Lh0hV2W0y8GVwGs/A2Gg1LZuXZiEbPsigZMEnbRiRQx+Y+tROEx/9JCJ9jsPHDbg
 oH+qGksyWa/bBFBqAtg/569NCEsusNk9ZTAxHts/OPyAGRs1hJvK3XypozOcNFWlkdSbuQ7ChD
 c3otOxon/q12r75GzwcARgzFpng3In0dgLIiwoz11ZUpGtkvdSQ7ZP+4svCcZTaz3Dd1VFD54e
 HOo=
X-SBRS: 2.7
X-MesageID: 2070542
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,401,1557201600"; 
   d="scan'208";a="2070542"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 18:38:02 +0200
Message-ID: <20190621163802.29808-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190621163802.29808-1-roger.pau@citrix.com>
References: <20190621163802.29808-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/3] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

aWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11
bHRpYm9vdDIpLgpUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29y
cmVjdGx5IGluIHRoZSBvdXRwdXQKYmluYXJ5LgoKTm90ZSB0aGF0IGZvciB0aGUgRUxGIG91dHB1
dCBmb3JtYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1vdmVkIGJlZm9yZQouYnNzIGZvciB0d28g
cmVhc29uczogaW4gb3JkZXIgZm9yIHRoZSByZXN1bHRpbmcgYmluYXJ5IHRvIG5vdCBjb250YWlu
CmFueSBzZWN0aW9uIHdpdGggZGF0YSBhZnRlciAuYnNzLCBzbyB0aGF0IHRoZSBmaWxlIHNpemUg
Y2FuIGJlIHNtYWxsZXIKdGhhbiB0aGUgbG9hZGVkIG1lbW9yeSBzaXplLCBhbmQgYmVjYXVzZSB0
aGUgZGF0YSBpdCBjb250YWlucyBpcwpyZWFkLW9ubHksIHNvIGl0IGJlbG9uZ3Mgd2l0aCB0aGUg
b3RoZXIgc2VjdGlvbnMgY29udGFpbmluZyByZWFkLW9ubHkKZGF0YS4KClNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KY2hhbmdlcyBzaW5jY2Ug
djE6CiAtIE1vdmUgdGhlIC5yZWxvYyBzZWN0aW9uIHBvc2l0aW9uIGluIHRoZSBvdXRwdXQgYmlu
YXJ5IG9ubHkgZm9yIHRoZQogICBFTEYgb3V0cHV0IGZvcm1hdC4KLS0tCiB4ZW4vYXJjaC94ODYv
eGVuLmxkcy5TIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxk
cy5TCmluZGV4IDk4YTk5NDQ0YzIuLjE5YWE0MzMyY2YgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwpAQCAtMTc1LDYgKzE3NSwx
NCBAQCBTRUNUSU9OUwogICB9IDp0ZXh0CiAjZW5kaWYKICNlbmRpZgorCisjaWYgZGVmaW5lZChY
RU5fQlVJTERfRUZJKSAmJiAhZGVmaW5lZChFRkkpCisgIC4gPSBBTElHTig0KTsKKyAgREVDTF9T
RUNUSU9OKC5yZWxvYykgeworICAgICooLnJlbG9jKQorICB9IDp0ZXh0CisjZW5kaWYKKwogICBf
ZXJvZGF0YSA9IC47CiAKICAgLiA9IEFMSUdOKFNFQ1RJT05fQUxJR04pOwotLSAKMi4yMC4xIChB
cHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
