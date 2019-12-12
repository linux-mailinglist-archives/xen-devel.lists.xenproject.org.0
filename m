Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AF111D58D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:30:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTC2-0007EU-8a; Thu, 12 Dec 2019 18:28:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOos=2C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifTC0-0007E4-Fr
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:28:04 +0000
X-Inumbo-ID: 1cdddb96-1d0d-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cdddb96-1d0d-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tohU/VlMD/E9xTRkxkN4w8LGXcp4Wvo28htiAO9tnmI=;
 b=bbuhZtYWojvXcREr+7TmG+Q7JrmufPrPQJGXq6S8cBVQZGUgYLpXivr3
 xUjTGQcPGPlGiao+mIiSeXBHApmOZjWaVMEUzPYmk01i6FP/wc48kQ8A1
 Zyb2HOUTa5YNOItyeeJfg2+Pd/nrXXB+5Szy1Hfop914hL+Fd2DFBYuu9 k=;
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
IronPort-SDR: GzNvWbtQC7eHecGfgsGuNHLYchJWZQaH0DixNmYnebY9ZINBSsc1UFrBvFv9TIcechtepAiLoC
 35Ws5RMCd3wu0sOKiWGsdtkv0CgkIqPAAGqU/MuGyieC5zR4jGGvkD8mateK/S+IJ/HGOT77pf
 obDcKyrserIRImdUhO0n6c0l3l3lptUekQBDfLnc/EKnCh6LGAI/F5GldVv8FQkNDt9tCi9YB0
 ZjQrtcA+hDE40elt3bh5X9Sbg98g91ZnKO6zaXP2W+OmzUYYJ9BdXunrEhV4dj7tovj6z66YqT
 M50=
X-SBRS: 2.7
X-MesageID: 10021230
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10021230"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 18:27:37 +0000
Message-ID: <20191212182740.2190199-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212182740.2190199-1-anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 5/8] xen: Import cc-ifversion from Kbuild
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBpbiBwcmVwYXJhdGlvbiBvZiBpbXBvcnRpbmcgS2J1aWxkIHRvIGJ1aWxkIFhlbi4g
V2Ugd29uJ3QgYmUKYWJsZSB0byBpbmNsdWRlIENvbmZpZy5tayBzbyB3ZSB3aWxsIG5lZWQgYSBy
ZXBsYWNlbWVudCBmb3IgdGhlIG1hY3JvCmBjYy1pZnZlcnNpb24nLgoKVGhpcyBwYXRjaCBpbXBv
cnRzIHBhcnRzIG9mICJzY3JpcHRzL0tidWlsZC5pbmNsdWRlIiBmcm9tIExpbnV4IHY1LjQsCnRo
ZSBtYWNybyBjYy1pZnZlcnNpb24uIEl0IG1ha2VzIHVzZSBvZiBDT05GSUdfR0NDX1ZFUlNJT04g
dGhhdApLY29uZmlnIG5vdyBwcm92aWRlcy4KClNpbmNlIHRoZXkgYXJlIG5vIG90aGVyIHVzZSBv
ZiBYZW4ncyBgY2MtaWZ2ZXJzaW9uJyBtYWNybywgd2UgY2FuCnJlbW92ZSBpdC4KClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIENv
bmZpZy5tayAgICAgICAgICAgICAgICAgICAgfCA1IC0tLS0tCiB4ZW4vUnVsZXMubWsgICAgICAg
ICAgICAgICAgIHwgMSArCiB4ZW4vY29tbW9uL2NvdmVyYWdlL01ha2VmaWxlIHwgOCArKysrLS0t
LQogeGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUgICB8IDcgKysrKysrKwogNCBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCgpkaWZmIC0tZ2l0IGEvQ29uZmlnLm1rIGIvQ29u
ZmlnLm1rCmluZGV4IDM1ZDY2ZTVlMTIxYS4uNjU2NDlkNjEyMmQxIDEwMDY0NAotLS0gYS9Db25m
aWcubWsKKysrIGIvQ29uZmlnLm1rCkBAIC0xMjEsMTEgKzEyMSw2IEBAIGRlZmluZSBjYy12ZXIt
Y2hlY2stY2xvc3VyZQogICAgIGVuZGlmCiBlbmRlZgogCi0jIGNjLWlmdmVyc2lvbjogQ2hlY2sg
Y29tcGlsZXIgdmVyc2lvbiBhbmQgdGFrZSBicmFuY2ggYWNjb3JkaW5nbHkKLSMgVXNhZ2UgJChj
YWxsIGNjLWlmdmVyc2lvbixsdCwweDA0MDcwMCxzdHJpbmdfaWZfeSxzdHJpbmdfaWZfbikKLWNj
LWlmdmVyc2lvbiA9ICQoc2hlbGwgWyAkKGNhbGwgY2MtdmVyLCQoQ0MpLCQoMSksJCgyKSkgPSAi
eSIgXSBcCi0JCQkJJiYgZWNobyAkKDMpIHx8IGVjaG8gJCg0KSkKLQogIyBSZXF1aXJlIEdDQyB2
NC4xKwogY2hlY2stJChnY2MpID0gJChjYWxsIGNjLXZlci1jaGVjayxDQywweDA0MDEwMCwiWGVu
IHJlcXVpcmVzIGF0IGxlYXN0IGdjYy00LjEiKQogJChldmFsICQoY2hlY2steSkpCmRpZmYgLS1n
aXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggNWFiYTg0MWIwYTk1Li5kMDUz
ZGJkMjY1MjYgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAg
LTIsNiArMiw3IEBACiAtaW5jbHVkZSAkKEJBU0VESVIpL2luY2x1ZGUvY29uZmlnL2F1dG8uY29u
ZgogCiBpbmNsdWRlICQoWEVOX1JPT1QpL0NvbmZpZy5taworaW5jbHVkZSAkKEJBU0VESVIpL3Nj
cmlwdHMvS2J1aWxkLmluY2x1ZGUKIAogCiBpZm5lcSAoJChvcmlnaW4gY3Jhc2hfZGVidWcpLHVu
ZGVmaW5lZCkKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY292ZXJhZ2UvTWFrZWZpbGUgYi94ZW4v
Y29tbW9uL2NvdmVyYWdlL01ha2VmaWxlCmluZGV4IDQ2Yzc4ZDEwODZkNi4uYjUwOWU1MWY5NjBi
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NvdmVyYWdlL01ha2VmaWxlCisrKyBiL3hlbi9jb21t
b24vY292ZXJhZ2UvTWFrZWZpbGUKQEAgLTEsMTAgKzEsMTAgQEAKIG9iai15ICs9IGNvdmVyYWdl
Lm8KIGlmbmVxICgkKGNsYW5nKSx5KQogb2JqLXkgKz0gZ2Nvdl9iYXNlLm8gZ2Nvdi5vCi1vYmot
eSArPSAkKGNhbGwgY2MtaWZ2ZXJzaW9uLGx0LDB4MDQwNzAwLCBcCi0JCWdjY18zXzQubywgJChj
YWxsIGNjLWlmdmVyc2lvbixsdCwweDA0MDkwMCwgXAotCQlnY2NfNF83Lm8sICQoY2FsbCBjYy1p
ZnZlcnNpb24sbHQsMHgwNTAwMDAsIFwKLQkJZ2NjXzRfOS5vLCAkKGNhbGwgY2MtaWZ2ZXJzaW9u
LGx0LDB4MDcwMDAwLCBcCitvYmoteSArPSAkKGNhbGwgY2MtaWZ2ZXJzaW9uLC1sdCwwNDA3LCBc
CisJCWdjY18zXzQubywgJChjYWxsIGNjLWlmdmVyc2lvbiwtbHQsMDQwOSwgXAorCQlnY2NfNF83
Lm8sICQoY2FsbCBjYy1pZnZlcnNpb24sLWx0LDA1MDAsIFwKKwkJZ2NjXzRfOS5vLCAkKGNhbGwg
Y2MtaWZ2ZXJzaW9uLC1sdCwwNzAwLCBcCiAJCWdjY181Lm8sIGdjY183Lm8pKSkpCiBlbHNlCiBv
YmoteSArPSBsbHZtLm8KZGlmZiAtLWdpdCBhL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlIGIv
eGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5hNWM0NjJmZDk3NzcKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vc2NyaXB0cy9L
YnVpbGQuaW5jbHVkZQpAQCAtMCwwICsxLDcgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKKyMjIyMKKyMga2J1aWxkOiBHZW5lcmljIGRlZmluaXRpb25zCisKKyMgY2MtaWZ2
ZXJzaW9uCisjIFVzYWdlOiAgRVhUUkFfQ0ZMQUdTICs9ICQoY2FsbCBjYy1pZnZlcnNpb24sIC1s
dCwgMDQwMiwgLU8xKQorY2MtaWZ2ZXJzaW9uID0gJChzaGVsbCBbICQoQ09ORklHX0dDQ19WRVJT
SU9OKTAgJCgxKSAkKDIpMDAwIF0gJiYgZWNobyAkKDMpIHx8IGVjaG8gJCg0KSkKLS0gCkFudGhv
bnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
