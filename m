Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BE16FE10
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v43-00030X-P2; Wed, 26 Feb 2020 11:41:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v41-0002z9-IQ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:17 +0000
X-Inumbo-ID: e60f9efe-588c-11ea-8cb6-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e60f9efe-588c-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FkubFNLMShkHJbU1MWkUBhmuCcJJA2wzYifkrSoaNbA=;
 b=cKbTtrBt1ZATl4iDtDD80QZRc8SzXv2hwOAWuNaLeYq7d5P34Tw3rrtf
 uDC+dmib6Y/7xN3n70GCVQpfl6peS5qr22Sj3zmqCBYuwkid3st1U6dV3
 nQutzAiHcovGxUsi1EhO7XZ+K1W5Lg3F8ugPxCBaJuyXvU9I55DLvxgMd o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4wB0MgZvYFSxrHh9eAwNjclA1Vu+nC96Jy4WgtjVnvMstUaIg8ilO5d3dXOv2AMxfAMtr/qXxs
 jj5E61tb8U9edrN3XEu9f3sfq964VtzP4B9g5O0aZNWs+Yd0EvTYNESzd7v82uHKwZIhnAinAh
 wRSmETeTpn7YEgaIEVtgxa1VcGy90FQFGD5/rlZbojaJlCIwktuDxHM0cHd96n08vK+Fxa2hzF
 9oCtiCJFm2Foxv9cDZtShYhpbMJFuK/rgKUSvynIFiPpK1mqoDcLNHcGoP/SBCH5rmdn0MqvsJ
 jZU=
X-SBRS: 2.7
X-MesageID: 13038475
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13038475"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:44 +0000
Message-ID: <20200226113355.2532224-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 12/23] xen/build: Move as-option-add to
 xen/
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

T25seSB4ZW4vIHVzZXMgYXMtb3B0aW9uLWFkZCBhbmQgYXMtaW5zbiwgc28gdGhlcmUgYXJlbid0
IG5lZWRlZCBpbgpDb25maWcubWsuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBuZXcgcGF0
Y2gKCiBDb25maWcubWsgICAgICAgICAgICAgICAgICB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tCiB4
ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSB8IDE3ICsrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L0NvbmZpZy5tayBiL0NvbmZpZy5tawppbmRleCA2NTY0OWQ2MTIyZDEuLmRjNmU3ZDAzZGZmZSAx
MDA2NDQKLS0tIGEvQ29uZmlnLm1rCisrKyBiL0NvbmZpZy5tawpAQCAtMTQzLDIzICsxNDMsNiBA
QCBpZm5kZWYgWEVOX0hBU19DSEVDS1BPTElDWQogICAgIGV4cG9ydCBYRU5fSEFTX0NIRUNLUE9M
SUNZCiBlbmRpZgogCi0jIGFzLWluc246IENoZWNrIHdoZXRoZXIgYXNzZW1ibGVyIHN1cHBvcnRz
IGFuIGluc3RydWN0aW9uLgotIyBVc2FnZTogY2ZsYWdzLXkgKz0gJChjYWxsIGFzLWluc24sQ0Mg
RkxBR1MsImluc24iLG9wdGlvbi15ZXMsb3B0aW9uLW5vKQotYXMtaW5zbiA9ICQoaWYgJChzaGVs
bCBlY2hvICd2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAkKDIpICk7IH0nIFwKLSAgICAg
ICAgICAgICAgICAgICAgICAgfCAkKGZpbHRlci1vdXQgLU0lICUuZCAtaW5jbHVkZSAlL2luY2x1
ZGUveGVuL2NvbmZpZy5oLCQoMSkpIFwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1j
IC14IGMgLW8gL2Rldi9udWxsIC0gMj4mMSksJCg0KSwkKDMpKQotCi0jIGFzLW9wdGlvbi1hZGQ6
IENvbmRpdGlvbmFsbHkgYWRkIG9wdGlvbnMgdG8gZmxhZ3MKLSMgVXNhZ2U6ICQoY2FsbCBhcy1v
cHRpb24tYWRkLENGTEFHUyxDQywiaW5zbiIsb3B0aW9uLXllcyxvcHRpb24tbm8pCi1hcy1vcHRp
b24tYWRkID0gJChldmFsICQoY2FsbCBhcy1vcHRpb24tYWRkLWNsb3N1cmUsJCgxKSwkKDIpLCQo
MyksJCg0KSwkKDUpKSkKLWRlZmluZSBhcy1vcHRpb24tYWRkLWNsb3N1cmUKLSAgICBpZmVxICgk
JChjYWxsIGFzLWluc24sJCQoJCgyKSkgJCQoJCgxKSksJCgzKSx5LG4pLHkpCi0gICAgICAgICQo
MSkgKz0gJCg0KQotICAgIGVsc2UKLSAgICAgICAgJCgxKSArPSAkKDUpCi0gICAgZW5kaWYKLWVu
ZGVmCi0KIGRlZmluZSBidWlsZG1ha2V2YXJzMnNoZWxsdmFycwogICAgIGV4cG9ydCBQUkVGSVg9
IiQocHJlZml4KSI7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgZXhwb3J0IFhFTl9TQ1JJUFRfRElSPSIkKFhFTl9TQ1JJUFRfRElSKSI7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKZGlmZiAtLWdpdCBhL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNs
dWRlIGIveGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUKaW5kZXggNmE5YjBjMzlkYTUzLi44MDZj
Njg4MjRlZDUgMTAwNjQ0Ci0tLSBhL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCisrKyBiL3hl
bi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCkBAIC03LDYgKzcsMjMgQEAKIERFUFMgPSAuKi5kCiBE
RVBTX0lOQ0xVREUgPSAkKGFkZHN1ZmZpeCAuZDIsICQoYmFzZW5hbWUgJCh3aWxkY2FyZCAkKERF
UFMpKSkpCiAKKyMgYXMtaW5zbjogQ2hlY2sgd2hldGhlciBhc3NlbWJsZXIgc3VwcG9ydHMgYW4g
aW5zdHJ1Y3Rpb24uCisjIFVzYWdlOiBjZmxhZ3MteSArPSAkKGNhbGwgYXMtaW5zbixDQyBGTEFH
UywiaW5zbiIsb3B0aW9uLXllcyxvcHRpb24tbm8pCithcy1pbnNuID0gJChpZiAkKHNoZWxsIGVj
aG8gJ3ZvaWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAoICQoMikgKTsgfScgXAorICAgICAgICAg
ICAgICAgICAgICAgICB8ICQoZmlsdGVyLW91dCAtTSUgJS5kIC1pbmNsdWRlICUvaW5jbHVkZS94
ZW4vY29uZmlnLmgsJCgxKSkgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLWMgLXgg
YyAtbyAvZGV2L251bGwgLSAyPiYxKSwkKDQpLCQoMykpCisKKyMgYXMtb3B0aW9uLWFkZDogQ29u
ZGl0aW9uYWxseSBhZGQgb3B0aW9ucyB0byBmbGFncworIyBVc2FnZTogJChjYWxsIGFzLW9wdGlv
bi1hZGQsQ0ZMQUdTLENDLCJpbnNuIixvcHRpb24teWVzLG9wdGlvbi1ubykKK2FzLW9wdGlvbi1h
ZGQgPSAkKGV2YWwgJChjYWxsIGFzLW9wdGlvbi1hZGQtY2xvc3VyZSwkKDEpLCQoMiksJCgzKSwk
KDQpLCQoNSkpKQorZGVmaW5lIGFzLW9wdGlvbi1hZGQtY2xvc3VyZQorICAgIGlmZXEgKCQkKGNh
bGwgYXMtaW5zbiwkJCgkKDIpKSAkJCgkKDEpKSwkKDMpLHksbikseSkKKyAgICAgICAgJCgxKSAr
PSAkKDQpCisgICAgZWxzZQorICAgICAgICAkKDEpICs9ICQoNSkKKyAgICBlbmRpZgorZW5kZWYK
KwogIyBjYy1pZnZlcnNpb24KICMgVXNhZ2U6ICBFWFRSQV9DRkxBR1MgKz0gJChjYWxsIGNjLWlm
dmVyc2lvbiwgLWx0LCAwNDAyLCAtTzEpCiBjYy1pZnZlcnNpb24gPSAkKHNoZWxsIFsgJChDT05G
SUdfR0NDX1ZFUlNJT04pMCAkKDEpICQoMikwMDAgXSAmJiBlY2hvICQoMykgfHwgZWNobyAkKDQp
KQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
