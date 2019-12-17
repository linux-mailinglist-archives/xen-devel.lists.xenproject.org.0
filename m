Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53F122971
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:04:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihAZO-00087N-I0; Tue, 17 Dec 2019 10:59:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9l2e=2H=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihAZM-00087F-BP
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 10:59:12 +0000
X-Inumbo-ID: 3f188488-20bc-11ea-8e9d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f188488-20bc-11ea-8e9d-12813bfff9fa;
 Tue, 17 Dec 2019 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576580347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XxPk4DO2eSwzHsmnEYEkv5cmAkOZVzyc+zyg72XuUo=;
 b=RXD6w0PcVXbWa7S5KVrw0Dt7AnE6KdTF3aWCX17mcXW7FJg181tG8TER
 LedAtX4tZnEdBbb6E4+Zc6zSLE1+CvT3QwrIrw++pNbvAsVPykBJKyjzM
 BqR/dfPFnkLQlqowwsxTw2Vw/qFqeX3jaJt7nj6gjNWvTvqin5c8L0YFR g=;
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
IronPort-SDR: zN8uTkGzg8jeJGR8tKD3P+mip2OSNLoBQLGUDtnMpFoQn24wET5Bf/Ko1pCj47SBbrDxowBAyo
 cb3aC7b7lcdviL9gGJ615HCwGhIRcQyxmOaqYCFMGbJYrAg1JvbB6vXPYps0WtwFM2Bnku2yoO
 1F/4rr4zL8JoSEa/55MY09r6RrrrfXq/pRsFnD7BDSDI9ws0sIopQse9JUoL3HkJHImeCL+LIp
 N1vsQzQlBmHt8yQ7E5/UFQOFqtgwHvakfd3xaOuMyaNBOSHyH1rkx5C5AyfV5gjASOK30Z+P/B
 A8E=
X-SBRS: 2.7
X-MesageID: 10211656
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10211656"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 10:58:58 +0000
Message-ID: <20191217105901.68158-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191217105901.68158-1-anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 3/6] xen: Import cc-ifversion from Kbuild
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
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCiBDb25maWcu
bWsgICAgICAgICAgICAgICAgICAgIHwgNSAtLS0tLQogeGVuL1J1bGVzLm1rICAgICAgICAgICAg
ICAgICB8IDEgKwogeGVuL2NvbW1vbi9jb3ZlcmFnZS9NYWtlZmlsZSB8IDggKysrKy0tLS0KIHhl
bi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlICAgfCA3ICsrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
c2NyaXB0cy9LYnVpbGQuaW5jbHVkZQoKZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5t
awppbmRleCAzNWQ2NmU1ZTEyMWEuLjY1NjQ5ZDYxMjJkMSAxMDA2NDQKLS0tIGEvQ29uZmlnLm1r
CisrKyBiL0NvbmZpZy5tawpAQCAtMTIxLDExICsxMjEsNiBAQCBkZWZpbmUgY2MtdmVyLWNoZWNr
LWNsb3N1cmUKICAgICBlbmRpZgogZW5kZWYKIAotIyBjYy1pZnZlcnNpb246IENoZWNrIGNvbXBp
bGVyIHZlcnNpb24gYW5kIHRha2UgYnJhbmNoIGFjY29yZGluZ2x5Ci0jIFVzYWdlICQoY2FsbCBj
Yy1pZnZlcnNpb24sbHQsMHgwNDA3MDAsc3RyaW5nX2lmX3ksc3RyaW5nX2lmX24pCi1jYy1pZnZl
cnNpb24gPSAkKHNoZWxsIFsgJChjYWxsIGNjLXZlciwkKENDKSwkKDEpLCQoMikpID0gInkiIF0g
XAotCQkJCSYmIGVjaG8gJCgzKSB8fCBlY2hvICQoNCkpCi0KICMgUmVxdWlyZSBHQ0MgdjQuMSsK
IGNoZWNrLSQoZ2NjKSA9ICQoY2FsbCBjYy12ZXItY2hlY2ssQ0MsMHgwNDAxMDAsIlhlbiByZXF1
aXJlcyBhdCBsZWFzdCBnY2MtNC4xIikKICQoZXZhbCAkKGNoZWNrLXkpKQpkaWZmIC0tZ2l0IGEv
eGVuL1J1bGVzLm1rIGIveGVuL1J1bGVzLm1rCmluZGV4IDVhYmE4NDFiMGE5NS4uZDA1M2RiZDI2
NTI2IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC0yLDYg
KzIsNyBAQAogLWluY2x1ZGUgJChCQVNFRElSKS9pbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYKIAog
aW5jbHVkZSAkKFhFTl9ST09UKS9Db25maWcubWsKK2luY2x1ZGUgJChCQVNFRElSKS9zY3JpcHRz
L0tidWlsZC5pbmNsdWRlCiAKIAogaWZuZXEgKCQob3JpZ2luIGNyYXNoX2RlYnVnKSx1bmRlZmlu
ZWQpCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NvdmVyYWdlL01ha2VmaWxlIGIveGVuL2NvbW1v
bi9jb3ZlcmFnZS9NYWtlZmlsZQppbmRleCA0NmM3OGQxMDg2ZDYuLmI1MDllNTFmOTYwYiAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9jb3ZlcmFnZS9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2Nv
dmVyYWdlL01ha2VmaWxlCkBAIC0xLDEwICsxLDEwIEBACiBvYmoteSArPSBjb3ZlcmFnZS5vCiBp
Zm5lcSAoJChjbGFuZykseSkKIG9iai15ICs9IGdjb3ZfYmFzZS5vIGdjb3Yubwotb2JqLXkgKz0g
JChjYWxsIGNjLWlmdmVyc2lvbixsdCwweDA0MDcwMCwgXAotCQlnY2NfM180Lm8sICQoY2FsbCBj
Yy1pZnZlcnNpb24sbHQsMHgwNDA5MDAsIFwKLQkJZ2NjXzRfNy5vLCAkKGNhbGwgY2MtaWZ2ZXJz
aW9uLGx0LDB4MDUwMDAwLCBcCi0JCWdjY180XzkubywgJChjYWxsIGNjLWlmdmVyc2lvbixsdCww
eDA3MDAwMCwgXAorb2JqLXkgKz0gJChjYWxsIGNjLWlmdmVyc2lvbiwtbHQsMDQwNywgXAorCQln
Y2NfM180Lm8sICQoY2FsbCBjYy1pZnZlcnNpb24sLWx0LDA0MDksIFwKKwkJZ2NjXzRfNy5vLCAk
KGNhbGwgY2MtaWZ2ZXJzaW9uLC1sdCwwNTAwLCBcCisJCWdjY180XzkubywgJChjYWxsIGNjLWlm
dmVyc2lvbiwtbHQsMDcwMCwgXAogCQlnY2NfNS5vLCBnY2NfNy5vKSkpKQogZWxzZQogb2JqLXkg
Kz0gbGx2bS5vCmRpZmYgLS1naXQgYS94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSBiL3hlbi9z
Y3JpcHRzL0tidWlsZC5pbmNsdWRlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uYTVjNDYyZmQ5Nzc3Ci0tLSAvZGV2L251bGwKKysrIGIveGVuL3NjcmlwdHMvS2J1aWxk
LmluY2x1ZGUKQEAgLTAsMCArMSw3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCisjIyMjCisjIGtidWlsZDogR2VuZXJpYyBkZWZpbml0aW9ucworCisjIGNjLWlmdmVyc2lv
bgorIyBVc2FnZTogIEVYVFJBX0NGTEFHUyArPSAkKGNhbGwgY2MtaWZ2ZXJzaW9uLCAtbHQsIDA0
MDIsIC1PMSkKK2NjLWlmdmVyc2lvbiA9ICQoc2hlbGwgWyAkKENPTkZJR19HQ0NfVkVSU0lPTikw
ICQoMSkgJCgyKTAwMCBdICYmIGVjaG8gJCgzKSB8fCBlY2hvICQoNCkpCi0tIApBbnRob255IFBF
UkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
