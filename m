Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654616FDDF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:36:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uxG-0001BF-1w; Wed, 26 Feb 2020 11:34:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6uxE-0001Ar-Vk
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:17 +0000
X-Inumbo-ID: e2ddc95a-588b-11ea-93fd-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2ddc95a-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JzX7HZJXzphUcMN1byQmSarqS2k5PNItv5nAt1gTphg=;
 b=DJHcEAYB56FRtYPDguuJ1cmWIgC3RL1J3Fi/9jL4CIH3QC126TTOJeOp
 KeKICzzy/JD3Bhp0ja6dmCxSdpDon04/JW3ve50Cd8KgzQN7QzpPO7l3f
 9mWq3HZbm4/a+0UUS9FzlQL5p4DolsPciAnq6OM50t4aPUV4CLar3SkKq 8=;
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
IronPort-SDR: jPVB9Q3X+MDPOYYmBHNjRyNxdlxxGTLohPImXJcT1MppDyL7wppKMOfSlZh9Xx536nCgmSPNNJ
 TNMoDvP8IsfZeUdvZEoi9hKtZS3m5LX+NPlpKp3HPh1XIGBCNHsJbEbGMHxfWNOUt6rz1ENgv8
 n1DE0BcjxEkXIWrU9B4mkpdLTyDcTfv1kCm1th/c1TDmFeH+6pM3Qu79KxvCgHcELThF9GGr4L
 kkn+Bmn+by3BTwwtPf534FAnqldOC3bisFMYfCL0388d09zvqQqKa6CjISvNZm+u6qhnOSzPws
 sLI=
X-SBRS: 2.7
X-MesageID: 13461764
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13461764"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:41 +0000
Message-ID: <20200226113355.2532224-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 09/23] xen/build: extract clean target
 from Rules.mk
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KCk1vc3Qgb2Yg
dGhlIGNvZGUgZXhlY3V0ZWQgYnkgUnVsZXMubWsgaXNuJ3QgbmVjZXNzYXJ5IGZvciB0aGUgY2xl
YW4KdGFyZ2V0LCBlc3BlY2lhbGx5IG5vdCB0aGUgQ0ZMQUdTLiBUaGlzIHBhdGNoIG1ha2VzIHJ1
bm5pbmcgbWFrZSBjbGVhbgptdWNoIGZhc3Rlci4KClRoZSBwYXRjaCBleHRyYWN0IHRoZSBjbGVh
biB0YXJnZXQgaW50byBhIGRpZmZlcmVudCBNYWtlZmlsZSwKTWFrZWZpbGUuY2xlYW4uCgpTaW5j
ZSBNYWtlZmlsZS5jbGVhbiwgZG9lc24ndCB3YW50IHRvIGluY2x1ZGUgQ29uZmlnLm1rLCB3ZSBu
ZWVkIHRvCmRlZmluZSB0aGUgdmFyaWFibGVzIERFUFNfSU5DTFVERSBhbmQgREVQUyBpbiBhIHBs
YWNlIGNvbW1vbiB0bwpSdWxlcy5tayBhbmQgTWFrZWZpbGUuY2xlYW4sIHRoaXMgaXMgS2J1aWxk
LmluY2x1ZGUuIERFUFNfUk0gaXMgb25seQpuZWVkZWQgaW4gTWFrZWZpbGUuY2xlYW4gc28gY2Fu
IGJlIGRlZmluZWQgdGhlcmUuCgpFdmVuIHNvIFJ1bGVzLm1rIGluY2x1ZGVzIENvbmZpZy5taywg
aXQgaW5jbHVkZXMgS2J1aWxkLmluY2x1ZGUgYWZ0ZXIsCnNvIHRoZSBlZmZlY3RpdmUgZGVmaW5p
dGlvbiBvZiBERVBTX0lOQ0xVREUgaXMgInhlbi8iIG9uZSBhbmQgdGhlCnNhbWUgb25lIGFzIHVz
ZWQgYnkgTWFrZWZpbGUuY2xlYW4uCgpUaGlzIGlzIGluc3BpcmVkIGJ5IEtidWlsZCwgd2l0aCBN
YWtlZmlsZS5jbGVhbiBwYXJ0aWFsbHkgY29waWVkIGZyb20KTGludXggdjUuNC4KClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5v
dGVzOgogICAgdjM6CiAgICAtIHJld3JpdGUgb2YgY29tbWl0IG1lc3NhZ2UKICAgIC0gaGF2ZSBv
bmx5IHN1YmRpci1hbGwsIHdpdGhvdXQgaW50ZXJtZWRpYXJlIHZhcmlhYmxlIHN1YmRpci15IGFu
ZAogICAgICBzdWJkaXItbiBpbiBNYWtlZmlsZS5jbGVhbgoKIHhlbi9SdWxlcy5tayAgICAgICAg
ICAgICAgIHwgMTIgLS0tLS0tLS0tLS0tCiB4ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSB8ICA3
ICsrKysrKy0KIHhlbi9zY3JpcHRzL01ha2VmaWxlLmNsZWFuIHwgMzAgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9zY3JpcHRzL01ha2VmaWxlLmNsZWFu
CgpkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1bGVzLm1rCmluZGV4IGUzYjE5MzE5
YjFmNS4uMGMxYTNlZTU5MDVkIDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1
bGVzLm1rCkBAIC0xMDAsOCArMTAwLDYgQEAgU1BFQ0lBTF9EQVRBX1NFQ1RJT05TIDo9IHJvZGF0
YSAkKGZvcmVhY2ggYSwxIDIgNCA4IDE2LCBcCiAKIGluY2x1ZGUgJChCQVNFRElSKS9hcmNoLyQo
VEFSR0VUX0FSQ0gpL1J1bGVzLm1rCiAKLURFUFMgPSAuKi5kCi0KIGluY2x1ZGUgTWFrZWZpbGUK
IAogZGVmaW5lIGdlbmRlcApAQCAtMTE4LDEwICsxMTYsNiBAQCAkKGZvcmVhY2ggbywkKGZpbHRl
ci1vdXQgJS8sJChvYmoteSkgJChvYmotYmluLXkpICQoZXh0cmEteSkpLCQoZXZhbCAkKGNhbGwg
Z2VuZAogc3ViZGlyLXkgOj0gJChzdWJkaXIteSkgJChmaWx0ZXIgJS8sICQob2JqLXkpKQogb2Jq
LXkgICAgOj0gJChwYXRzdWJzdCAlLywgJS9idWlsdF9pbi5vLCAkKG9iai15KSkKIAotc3ViZGly
LW4gICA6PSAkKHN1YmRpci1uKSAkKHN1YmRpci0pICQoZmlsdGVyICUvLCAkKG9iai1uKSAkKG9i
ai0pKQotCi1zdWJkaXItYWxsIDo9ICQoc3ViZGlyLXkpICQoc3ViZGlyLW4pCi0KICQoZmlsdGVy
ICUuaW5pdC5vLCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKTogQ0ZMQUdTICs9IC1E
SU5JVF9TRUNUSU9OU19PTkxZCiAKIGlmZXEgKCQoQ09ORklHX0NPVkVSQUdFKSx5KQpAQCAtMTg1
LDEyICsxNzksNiBAQCBGT1JDRToKICUvYnVpbHRfaW5fYmluLm86IEZPUkNFCiAJJChNQUtFKSAt
ZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DICQqIGJ1aWx0X2luX2Jpbi5vCiAKLS5QSE9OWTogY2xl
YW4KLWNsZWFuOjogJChhZGRwcmVmaXggX2NsZWFuXywgJChzdWJkaXItYWxsKSkKLQlybSAtZiAq
Lm8gLiouby50bXAgKn4gY29yZSAkKERFUFNfUk0pCi1fY2xlYW5fJS86IEZPUkNFCi0JJChNQUtF
KSAkKGNsZWFuKSAkKgotCiBTUkNQQVRIIDo9ICQocGF0c3Vic3QgJChCQVNFRElSKS8lLCUsJChD
VVJESVIpKQogCiAlLm86ICUuYyBNYWtlZmlsZQpkaWZmIC0tZ2l0IGEveGVuL3NjcmlwdHMvS2J1
aWxkLmluY2x1ZGUgYi94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQppbmRleCAyNDY1Y2M0MDYw
YzMuLjZhOWIwYzM5ZGE1MyAxMDA2NDQKLS0tIGEveGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUK
KysrIGIveGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUKQEAgLTIsNiArMiwxMSBAQAogIyMjIwog
IyBrYnVpbGQ6IEdlbmVyaWMgZGVmaW5pdGlvbnMKIAorIyMjCisjIGRlcGVuZGVuY2llcworREVQ
UyA9IC4qLmQKK0RFUFNfSU5DTFVERSA9ICQoYWRkc3VmZml4IC5kMiwgJChiYXNlbmFtZSAkKHdp
bGRjYXJkICQoREVQUykpKSkKKwogIyBjYy1pZnZlcnNpb24KICMgVXNhZ2U6ICBFWFRSQV9DRkxB
R1MgKz0gJChjYWxsIGNjLWlmdmVyc2lvbiwgLWx0LCAwNDAyLCAtTzEpCiBjYy1pZnZlcnNpb24g
PSAkKHNoZWxsIFsgJChDT05GSUdfR0NDX1ZFUlNJT04pMCAkKDEpICQoMikwMDAgXSAmJiBlY2hv
ICQoMykgfHwgZWNobyAkKDQpKQpAQCAtOSw0ICsxNCw0IEBAIGNjLWlmdmVyc2lvbiA9ICQoc2hl
bGwgWyAkKENPTkZJR19HQ0NfVkVSU0lPTikwICQoMSkgJCgyKTAwMCBdICYmIGVjaG8gJCgzKSB8
fCBlCiAjIFNob3J0aGFuZCBmb3IgJChNQUtFKSBjbGVhbgogIyBVc2FnZToKICMgJChNQUtFKSAk
KGNsZWFuKSBkaXIKLWNsZWFuIDo9IC1mICQoQkFTRURJUikvUnVsZXMubWsgY2xlYW4gLUMKK2Ns
ZWFuIDo9IC1mICQoQkFTRURJUikvc2NyaXB0cy9NYWtlZmlsZS5jbGVhbiBjbGVhbiAtQwpkaWZm
IC0tZ2l0IGEveGVuL3NjcmlwdHMvTWFrZWZpbGUuY2xlYW4gYi94ZW4vc2NyaXB0cy9NYWtlZmls
ZS5jbGVhbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjUzMzc5ZTYx
MDJjYwotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmNsZWFuCkBAIC0w
LDAgKzEsMzAgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKyMgPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KKyMgQ2xlYW5pbmcgdXAKKyMgPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKworY2xlYW46
OgorCitpbmNsdWRlICQoQkFTRURJUikvc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQorCitpbmNsdWRl
IE1ha2VmaWxlCisKKyMgRmlndXJlIG91dCB3aGF0IHdlIG5lZWQgdG8gY2xlYW4gZnJvbSB0aGUg
dmFyaW91cyB2YXJpYWJsZXMKKyMgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KK3N1YmRpci1hbGwgOj0gJChz
dWJkaXIteSkgJChzdWJkaXItbikgJChzdWJkaXItKSBcCisgICAgICAgICAgICAgICQoZmlsdGVy
ICUvLCAkKG9iai15KSAkKG9iai1uKSAkKG9iai0pKQorCitERVBTX1JNID0gJChERVBTKSAkKERF
UFNfSU5DTFVERSkKKy5QSE9OWTogY2xlYW4KK2NsZWFuOjogJChhZGRwcmVmaXggX2NsZWFuXywg
JChzdWJkaXItYWxsKSkKKwlybSAtZiAqLm8gLiouby50bXAgKn4gY29yZSAkKERFUFNfUk0pCisK
KyMgRGVzY2VuZGluZworIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworX2NsZWFuXyUvOiBGT1JDRQor
CSQoTUFLRSkgJChjbGVhbikgJCoKKworIyBGb3JjZSBleGVjdXRpb24gb2YgcGF0dGVybiBydWxl
cyAoZm9yIHdoaWNoIFBIT05ZIGNhbm5vdCBiZSBkaXJlY3RseSB1c2VkKS4KKy5QSE9OWTogRk9S
Q0UKK0ZPUkNFOgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
