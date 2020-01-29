Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F314C815
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 10:30:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwje7-0007Qx-Q5; Wed, 29 Jan 2020 09:28:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/IS=3S=amazon.de=prvs=290504bcf=vrd@srs-us1.protection.inumbo.net>)
 id 1iwje6-0007Qk-Ea
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 09:28:26 +0000
X-Inumbo-ID: b3a587f4-4279-11ea-885e-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3a587f4-4279-11ea-885e-12813bfff9fa;
 Wed, 29 Jan 2020 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1580290107; x=1611826107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xNIgQDpC4hWiI4vjE+YyDKoeJyG8ne9nKinyDj3a61c=;
 b=i7wBOiSUT6EhexKSKIiEIcSXznnkiJ9sMhoDGNFQAOG0BVCC/FB/fVkJ
 7Wi6rSkOUz2rVNfnVGLhrYPwb4jHEqUowZj0gElaf3cF4g2yqeMWiTsS2
 jBm4D6s9sA8pPWmPQO/Bomu15zYTU5TcWd1vcZs1k7/5rdAO3nJBKoxbS 4=;
IronPort-SDR: pPQnSxj0VsfNz90SZVJTDRwlOVCq68ILWm4CH/LYTN1EBvgagdOtASESyVG5e6F4GLkGqT6HJT
 hqA6OuuwAkIw==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="14726706"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 29 Jan 2020 09:28:25 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1466BC5B73; Wed, 29 Jan 2020 09:28:24 +0000 (UTC)
Received: from EX13D22EUA004.ant.amazon.com (10.43.165.129) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 09:28:24 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D22EUA004.ant.amazon.com (10.43.165.129) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 09:28:22 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.33) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 09:28:19 +0000
From: Varad Gautam <vrd@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 10:28:07 +0100
Message-ID: <1580290087-20636-1-git-send-email-vrd@amazon.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WEVOX0RPTUNUTF9kZXN0cm95ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWlu
X2tpbGwgLUVSRVNUQVJUUy4KSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVj
ZWl2ZSBtdWx0aXBsZSBfcGlycV9ndWVzdF91bmJpbmQKY2FsbHMgZm9yIHRoZSBzYW1lIHBpcnEg
ZnJvbSBkb21haW5fa2lsbCwgaWYgdGhlIHBpcnEgaGFzIG5vdCB5ZXQgYmVlbgpyZW1vdmVkIGZy
b20gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgYXM6CiAgZG9tYWluX2tpbGwoKQogICAgLT4gZG9t
YWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkKICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNlcygp
CiAgICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKICAgICAgICAgIC0+IHBpcnFfZ3Vlc3Rf
dW5iaW5kKCkKICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpCgpGb3IgYSBzaGFy
ZWQgcGlycSAobnJfZ3Vlc3RzID4gMSksIHRoZSBmaXJzdCBjYWxsIHdvdWxkIHphcCB0aGUgY3Vy
cmVudApkb21haW4gZnJvbSB0aGUgcGlycSdzIGd1ZXN0c1tdIGxpc3QsIGJ1dCB0aGUgYWN0aW9u
IGhhbmRsZXIgaXMgbmV2ZXIgZnJlZWQKYXMgdGhlcmUgYXJlIG90aGVyIGd1ZXN0cyB1c2luZyB0
aGlzIHBpcnEuIEFzIGEgcmVzdWx0LCBvbiB0aGUgc2Vjb25kIGNhbGwsCl9fcGlycV9ndWVzdF91
bmJpbmQgc2VhcmNoZXMgZm9yIHRoZSBjdXJyZW50IGRvbWFpbiB3aGljaCBoYXMgYmVlbiByZW1v
dmVkCmZyb20gdGhlIGd1ZXN0c1tdIGxpc3QsIGFuZCBoaXRzIGEgQlVHX09OLgoKTWFrZSBfX3Bp
cnFfZ3Vlc3RfdW5iaW5kIHNhZmUgdG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRp
bmcgeGVuCmNvbnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJvdW5k
IGZyb20gdGhpcyBndWVzdC4gVGhlClBJUlEgd2lsbCBiZSBjbGVhbmVkIHVwIGZyb20gdGhlIGRv
bWFpbidzIHBpcnFfdHJlZSBkdXJpbmcgdGhlIGRlc3RydWN0aW9uCmluIGNvbXBsZXRlX2RvbWFp
bl9kZXN0cm95IGFueXdheXMuCgpTaWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6
b24uZGU+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KQ0M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgp2MjogU3BsaXQgdGhlIGNoZWNr
IG9uIGFjdGlvbi0+bnJfZ3Vlc3RzID4gMCBhbmQgbWFrZSBpdCBhbiBBU1NFUlQuCnYzOiBTdHls
ZSBmaXh1cHMuCi0tLQogeGVuL2FyY2gveDg2L2lycS5jIHwgMTUgKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwppbmRleCAzMTBhYzAw
Li40YjE3MmViIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKKysrIGIveGVuL2FyY2gv
eDg2L2lycS5jCkBAIC0xNjgxLDcgKzE2ODEsMjAgQEAgc3RhdGljIGlycV9ndWVzdF9hY3Rpb25f
dCAqX19waXJxX2d1ZXN0X3VuYmluZCgKIAogICAgIGZvciAoIGkgPSAwOyAoaSA8IGFjdGlvbi0+
bnJfZ3Vlc3RzKSAmJiAoYWN0aW9uLT5ndWVzdFtpXSAhPSBkKTsgaSsrICkKICAgICAgICAgY29u
dGludWU7Ci0gICAgQlVHX09OKGkgPT0gYWN0aW9uLT5ucl9ndWVzdHMpOworICAgIGlmICggaSA9
PSBhY3Rpb24tPm5yX2d1ZXN0cyApCisgICAgeworICAgICAgICBBU1NFUlQoYWN0aW9uLT5ucl9n
dWVzdHMgPiAwKTsKKyAgICAgICAgLyoKKyAgICAgICAgICogSW4gY2FzZSB0aGUgcGlycSB3YXMg
c2hhcmVkLCB1bmJvdW5kIGZvciB0aGlzIGRvbWFpbiBpbiBhbiBlYXJsaWVyCisgICAgICAgICAq
IGNhbGwsIGJ1dCBzdGlsbCBleGlzdGVkIG9uIHRoZSBkb21haW4ncyBwaXJxX3RyZWUsIHdlIHN0
aWxsIHJlYWNoCisgICAgICAgICAqIGhlcmUgaWYgdGhlcmUgYXJlIGFueSBsYXRlciB1bmJpbmQg
Y2FsbHMgb24gdGhlIHNhbWUgcGlycS4gUmV0dXJuCisgICAgICAgICAqIGlmIHN1Y2ggYW4gdW5i
aW5kIGhhcHBlbnMuCisgICAgICAgICAqLworICAgICAgICBpZiAoIGFjdGlvbi0+c2hhcmVhYmxl
ICkKKyAgICAgICAgICAgIHJldHVybiBOVUxMOworICAgICAgICBCVUcoKTsKKyAgICB9CisKICAg
ICBtZW1tb3ZlKCZhY3Rpb24tPmd1ZXN0W2ldLCAmYWN0aW9uLT5ndWVzdFtpKzFdLAogICAgICAg
ICAgICAgKGFjdGlvbi0+bnJfZ3Vlc3RzLWktMSkgKiBzaXplb2YoYWN0aW9uLT5ndWVzdFswXSkp
OwogICAgIGFjdGlvbi0+bnJfZ3Vlc3RzLS07Ci0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3Bt
ZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2No
YWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNp
dHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
