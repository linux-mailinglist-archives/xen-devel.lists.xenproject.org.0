Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71C11B1C7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 16:33:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if3wE-00020F-9s; Wed, 11 Dec 2019 15:30:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1if3wD-0001rX-18
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 15:30:05 +0000
X-Inumbo-ID: 1ac87a2e-1c2b-11ea-8b7d-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ac87a2e-1c2b-11ea-8b7d-12813bfff9fa;
 Wed, 11 Dec 2019 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576078205; x=1607614205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I98AkRNnVsqEIMz+PpHt6g7o9OQDRo5l2g1aJ7GfB9Q=;
 b=A6xJEUDct9DS9giWVpvLKTFPrAMyEIM73zCGXOUx/ezTay/Y7GcsPhEg
 GiCVMY2UYzILWIz/8MUbzxskqJBnNb/eX2qCYU1MoJwP0L5AzhKygpqyC
 kqGdAxy3RGYAaLeQE6aCEC2RqZA+dqjos+FYnlTJlnGu/Qz7jtosRFTld w=;
IronPort-SDR: IbA0eeW8YkrsZbxF5SNM+6aBwOIGfC6wXuDx2Q/Ksp4NoI47rdXO4mMdPlemRy6g0GNUzFZKi4
 X9weZ9SP2b5g==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8046823"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 11 Dec 2019 15:30:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1055B1A21C8; Wed, 11 Dec 2019 15:30:02 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 15:30:01 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 15:29:59 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 11 Dec 2019 15:29:57 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Wed, 11 Dec 2019 15:29:52 +0000
Message-ID: <20191211152956.5168-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/4] xen-blkback: support live update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggIzEgaXMgY2xlYW4tdXAgZm9yIGFuIGFwcGFyZW50IG1pcy1mZWF0dXJlLgoKUGF1bCBE
dXJyYW50ICg0KToKICB4ZW5idXM6IG1vdmUgeGVuYnVzX2Rldl9zaHV0ZG93bigpIGludG8gZnJv
bnRlbmQgY29kZS4uLgogIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8gY2xv
c2VkCiAgeGVuL2ludGVyZmFjZTogcmUtZGVmaW5lIEZST05UL0JBQ0tfUklOR19BVFRBQ0goKQog
IHhlbi1ibGtiYWNrOiBzdXBwb3J0IGR5bmFtaWMgdW5iaW5kL2JpbmQKCiBkcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jICAgICAgICAgfCA1NiArKysrKysrKysrKysrKystLS0tLS0t
CiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzLmggICAgICAgICAgICAgICAgfCAgMiAtCiBkcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgICAgICAgICAgfCAzNSArKysrLS0tLS0tLS0t
LQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgIHwgIDEgLQogZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jIHwgMjQgKysrKysrKysrLQog
aW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaCAgICAgICAgICAgIHwgMjkgKysrKy0tLS0t
LS0KIGluY2x1ZGUveGVuL3hlbmJ1cy5oICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIDcg
ZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCi0tLQp2MzoK
IC0gT25seSBwYXRjaCAjNCBtb2RpZmllZAoKQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsg
PGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
