Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59039D5198
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 20:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJLys-0002VH-4G; Sat, 12 Oct 2019 18:19:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMVA=YF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iJLyr-0002VC-1y
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 18:19:05 +0000
X-Inumbo-ID: c50b072e-ed1c-11e9-bbab-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c50b072e-ed1c-11e9-bbab-bc764e2007e4;
 Sat, 12 Oct 2019 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570904344;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lvW8o85sda6RCA9ctUQgVi7PoEtJO0TQjHgTMs6quKw=;
 b=XVm6hhOifC9pW9d3lABQF5kQIk8S+Pj6gOqxkJQWGhRDVBcHtUuC9Ind
 IO8a02tOg7fNrYBSLcvV2A8fg2+CQBWDwXzVjGZmHcA+RdR1bqUsvcDmj
 OwKdi9cVmCYtPOJg4Kyfo6y9/djBggmqXWkTxzqwvsR0FZVQwQEce4und 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pV8DUQ2vnYzohalSNo4X04cWxuV1vSsPNRGLSfaBfiHdysUf5nYsyizjsqhPHKP7tkzX+cmZeh
 AYYP+BSdB23IZ2383TP/yRufODb7O/6DFNle/7CKdzWYwgaFKjXeu0pttHbxsG3OIYZazIaz/b
 3XmEOsI/4skr9M6tuIlu63JeMH2CIWbLi6SnL8CeNOw5rv+gMZRpJVI1g7n8Eqiz4I3T/kYTSc
 RvDEuINGjJ3nM2GST5b15aSdJleEhZfZ17hOdz0GL+Gbq0ks31LLkF4nCoNeYu7nc9bBG4JpSv
 sOA=
X-SBRS: 2.7
X-MesageID: 6887492
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,288,1566878400"; 
   d="scan'208";a="6887492"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 12 Oct 2019 19:18:59 +0100
Message-ID: <20191012181859.11110-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] docs: Extend with details about
 runtime microcode loading
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHhlbi11Y29kZSB1dGlsaXR5IGlzIG5ldyB3aXRoIHRoZSBsYXRlIGxvYWRpbmcgaW1wcm92
ZW1lbnRzIGluIDQuMTMuClVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBzdWl0YWJseS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBU
aW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgpDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgoKRm9yIDQuMTMuICBU
aGlzIGlzIGRvY3VtZW50YXRpb24gY29uY2VybmluZyBuZXcgd29yay4KClRoZSBhZGRpdGlvbnMg
Zm9yIGNob29zaW5nIHRoZSBhcHBsaWNhdGlvbiBwb2xpY3ksIGFuZCBsb2dpYyB0byByZXNjYW4K
Q1BVSUQvTVNScyBhbmQgc3RhcnQgdXNpbmcgdGhlIG5ldyBmdW5jdGlvbmF0bHkgd2lsbCBoYXZl
IHRvIHdhaXQgZm9yIDQuMTQgYXQKdGhpcyBwb2ludC4KCklmIGFueW9uZSBpcyBjdXJpb3VzIGFi
b3V0IHRoZSB3b3JkaW5nIG9mIHRoZSB3YXJuaW5nLCBpdCBzaG91bGQgY29tZSBhcyBubwpzdXJw
cmlzZSB0aGF0IGFuIGluZGl2aWR1YWwgYmxvYiBvZiBtaWNyb2NvZGUgbWlnaHQgY29udGFpbiBt
b3JlIHRoYW4gb25lCnRoaW5nLiAgT24gYW55dGhpbmcgc2VtaS1tb2Rlcm4gc3lzdGVtLCB0aGVy
ZSBpcyBDb3JlIG1pY3JvY29kZSAodGhlIHBpcGVsaW5lCml0c2VsZiksIGFuZCBVbmNvcmUgbWlj
cm9jb2RlICh0aGUgInJlc3QiIG9mIHRoZSBpbnRlZ3JhdGVkIGZ1bmN0aW9uYWxpdHkgb24KdGhl
IGNoaXApLCBhcyB3ZWxsIGFzIG90aGVyIGFuY2lsbGFyeSBwaWVjZXMuCi0tLQogZG9jcy9hZG1p
bi1ndWlkZS9taWNyb2NvZGUtbG9hZGluZy5yc3QgfCAyOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
b2NzL2FkbWluLWd1aWRlL21pY3JvY29kZS1sb2FkaW5nLnJzdCBiL2RvY3MvYWRtaW4tZ3VpZGUv
bWljcm9jb2RlLWxvYWRpbmcucnN0CmluZGV4IDgyNjViOTE3YTkuLmU4M2NhZGQyYzIgMTAwNjQ0
Ci0tLSBhL2RvY3MvYWRtaW4tZ3VpZGUvbWljcm9jb2RlLWxvYWRpbmcucnN0CisrKyBiL2RvY3Mv
YWRtaW4tZ3VpZGUvbWljcm9jb2RlLWxvYWRpbmcucnN0CkBAIC0xMDMsMyArMTAzLDMyIEBAIHdo
aWNoIGNvbnRhaW5zIGNvbnRhaW5zIG9uZSBvZiB0aGVzZSB0d28gZmlsZXM6OgogVGhlIGBgdWNv
ZGU9c2NhbmBgIGNvbW1hbmQgbGluZSBvcHRpb24gd2lsbCBjYXVzZSBYZW4gdG8gc2VhcmNoIHRo
cm91Z2ggYWxsCiBtb2R1bGVzIHRvIGZpbmQgYW55IENQSU8gYXJjaGl2ZXMsIGFuZCBzZWFyY2gg
dGhlIGFyY2hpdmUgZm9yIHRoZSBhcHBsaWNhYmxlCiBmaWxlLiAgWGVuIHdpbGwgc3RvcCBzZWFy
Y2hpbmcgYXQgdGhlIGZpcnN0IG1hdGNoLgorCisKK1J1biB0aW1lIG1pY3JvY29kZSBsb2FkaW5n
CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCisuLiB3YXJuaW5nOjoKKworICAgSWYgYXQg
YWxsIHBvc3NpYmxlLCBtaWNyb2NvZGUgdXBkYXRlcyBzaG91bGQgYmUgZG9uZSBieSBmaXJtd2Fy
ZSB1cGRhdGVzLAorICAgb3IgYXQgYm9vdCB0aW1lLiAgTm90IGFsbCBtaWNyb2NvZGUgdXBkYXRl
cyAob3IgcGFydHMgdGhlcmVvZikgY2FuIGJlCisgICBhcHBsaWVkIGF0IHJ1bnRpbWUuCisKK1Ro
ZSBgYHhlbi11Y29kZWBgIHV0aWxpdHkgY2FuIGJlIHVzZWQgdG8gaW5pdGlhdGUgYSBydW50aW1l
IG1pY3JvY29kZSBsb2FkLgorSXQgd2lsbCBwYXNzIHRoZSBibG9iIHRvIFhlbiwgd2hpY2ggd2ls
bCBjaGVjayB0byBzZWUgd2hldGhlciB0aGUgYmxvYiBpcworY29ycmVjdCBmb3IgdGhlIHByb2Nl
c3NvciwgYW5kIG5ld2VyIHRoYW4gdGhlIHJ1bm5pbmcgbWljcm9jb2RlLgorCitJZiB0aGVzZSBj
aGVja3MgcGFzcywgdGhlIGVudGlyZSBzeXN0ZW0gd2lsbCBiZSByZW5kZXp2b3VzZWQgYW5kIGFu
IHVwZGF0ZQord2lsbCBiZSBpbml0aWF0ZWQgb24gYWxsIENQVXMgaW4gcGFyYWxsZWwuICBBcyB3
aXRoIGJvb3QgdGltZSBsb2FkaW5nLAorZGlhZ25vc3RpY3Mgd2lsbCBiZSBwdXQgb3V0IG9udG8g
dGhlIGNvbnNvbGU6OgorCisgIFtyb290QGhvc3Qgfl0jIHhsIGRtZXNnIHwgZ3JlcCBtaWNyb2Nv
ZGUKKyAgKFhFTikgbWljcm9jb2RlOiBDUFUwIHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAweDFhIHRv
IDB4MjUsIGRhdGUgPSAyMDE4LTA0LTAyCisgIChYRU4pIG1pY3JvY29kZTogQ1BVMiB1cGRhdGVk
IGZyb20gcmV2aXNpb24gMHgxYSB0byAweDI1LCBkYXRlID0gMjAxOC0wNC0wMgorICAoWEVOKSBt
aWNyb2NvZGU6IENQVTQgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MWEgdG8gMHgyNSwgZGF0ZSA9
IDIwMTgtMDQtMDIKKyAgKFhFTikgbWljcm9jb2RlOiBDUFU2IHVwZGF0ZWQgZnJvbSByZXZpc2lv
biAweDFhIHRvIDB4MjUsIGRhdGUgPSAyMDE4LTA0LTAyCisgIChYRU4pIDQgY29yZXMgYXJlIHRv
IHVwZGF0ZSB0aGVpciBtaWNyb2NvZGUKKyAgKFhFTikgbWljcm9jb2RlOiBDUFUwIHVwZGF0ZWQg
ZnJvbSByZXZpc2lvbiAweDI1IHRvIDB4MjcsIGRhdGUgPSAyMDE5LTAyLTI2CisgIChYRU4pIG1p
Y3JvY29kZTogQ1BVNCB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgyNSB0byAweDI3LCBkYXRlID0g
MjAxOS0wMi0yNgorICAoWEVOKSBtaWNyb2NvZGU6IENQVTIgdXBkYXRlZCBmcm9tIHJldmlzaW9u
IDB4MjUgdG8gMHgyNywgZGF0ZSA9IDIwMTktMDItMjYKKyAgKFhFTikgbWljcm9jb2RlOiBDUFU2
IHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAweDI1IHRvIDB4MjcsIGRhdGUgPSAyMDE5LTAyLTI2Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
