Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086D410A003
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:13:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbY1-0007Jj-F1; Tue, 26 Nov 2019 14:10:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kHA=ZS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iZbY0-0007Je-5M
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:10:32 +0000
X-Inumbo-ID: 8107d252-1056-11ea-a55d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8107d252-1056-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574777431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rozP+RvCpkce/D+oXSm5flKUYG5+LbGOFvbfKj1eeqQ=;
 b=VZdwRVe/pu0t1vSaEubfTgZSUa4scXw9yICtNyKBpsA/igxq1ed2ffcO
 wGBAkf7sd8bKreEdRS1cK4w4sgJoM/hN4unZfd6OPhKzGIEC41rXZNAJv
 DHivm968TrOyAp6E1xYHREUAoec+ljOzJF80VN+l6qPSf/BhumcF4mFhp Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PW5idyfQMIY2el5zjFHcUMJAlfWE9+NDA7MxGpXSmPYVcBtc/c6lONY+JPsgJyj9crRjcoTxxT
 SQpflQl8zDQlrKN0dmZW8Td7cCDGgiq8/6+02uXkp5NbRPYbZTDfYUGo86/WtNuv8zAq+pVY7V
 zkA/korr23pk/bIYYPPqB6tgXGtBjPAtrPYmXYO5aCS/7sIJ0j4ITXXsU3LYpuKT3HYiaL7mee
 S/osFdIu39Dn3nPy4SVbmmpYhadHuVdijydP01HNH9K3x1SQjIgh0IyfWqRWDNtQypcGaFCI++
 +zI=
X-SBRS: 2.7
X-MesageID: 8970960
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8970960"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 14:10:26 +0000
Message-ID: <20191126141026.2858622-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable state
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlc2V0cyAzMTlmOWEwYmE5ICgicGFzc3Rocm91Z2g6IHF1YXJhbnRpbmUgUENJIGRldmlj
ZXMiKSBhbmQKYmEyYWIwMGJiYiAoIklPTU1VOiBkZWZhdWx0IHRvIGFsd2F5cyBxdWFyYW50aW5p
bmcgUENJIGRldmljZXMiKQppbnRyb2R1Y2VkIFBDSSBkZXZpY2UgInF1YXJhbnRpbmUiIGJlaGF2
aW9yLCBidXQgZGlkIG5vdCBkb2N1bWVudCBob3cKdGhlIHBjaS1hc3NpZ25hYmxlLWFkZCBhbmQg
LXJlbW92ZSBmdW5jdGlvbnMgYWN0IGluIHJlZ2FyZCB0byB0aGlzLgpSZWN0aWZ5IHRoaXMuCgpT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0t
LQpSZWxlYXNlIGp1c3RpZmljYXRpb246IFRoaXMgYnJpbmdzIGRvY3VtZW50YXRpb24gaW50byBs
aW5lIHdpdGggdGhlCmFjdHVhbCBjb2RlIHRoYXQgd2lsbCBiZSByZWxlYXNlZC4KCkNDOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIGRvY3MvbWFuL3hsLjEucG9kLmluIHwgMjcgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kb2NzL21hbi94bC4xLnBvZC5pbiBiL2RvY3MvbWFuL3hsLjEucG9kLmluCmlu
ZGV4IDIzMDNiODFlNGYuLjM3MmMyMjkyNDQgMTAwNjQ0Ci0tLSBhL2RvY3MvbWFuL3hsLjEucG9k
LmluCisrKyBiL2RvY3MvbWFuL3hsLjEucG9kLmluCkBAIC0xNTg5LDEwICsxNTg5LDEyIEBAIGJh
Y2tlbmQgZHJpdmVyIGluIGRvbWFpbiAwIHJhdGhlciB0aGFuIGEgcmVhbCBkcml2ZXIuCiA9aXRl
bSBCPHBjaS1hc3NpZ25hYmxlLWFkZD4gSTxCREY+CiAKIE1ha2UgdGhlIGRldmljZSBhdCBQQ0kg
QnVzL0RldmljZS9GdW5jdGlvbiBCREYgYXNzaWduYWJsZSB0byBndWVzdHMuCi1UaGlzIHdpbGwg
YmluZCB0aGUgZGV2aWNlIHRvIHRoZSBwY2liYWNrIGRyaXZlci4gIElmIGl0IGlzIGFscmVhZHkK
LWJvdW5kIHRvIGEgZHJpdmVyLCBpdCB3aWxsIGZpcnN0IGJlIHVuYm91bmQsIGFuZCB0aGUgb3Jp
Z2luYWwgZHJpdmVyCi1zdG9yZWQgc28gdGhhdCBpdCBjYW4gYmUgcmUtYm91bmQgdG8gdGhlIHNh
bWUgZHJpdmVyIGxhdGVyIGlmIGRlc2lyZWQuCi1JZiB0aGUgZGV2aWNlIGlzIGFscmVhZHkgYm91
bmQsIGl0IHdpbGwgcmV0dXJuIHN1Y2Nlc3MuCitUaGlzIHdpbGwgYmluZCB0aGUgZGV2aWNlIHRv
IHRoZSBwY2liYWNrIGRyaXZlciBhbmQgYXNzaWduIGl0IHRvIHRoZQorInF1YXJhbnRpbmUgZG9t
YWluIi4gIElmIGl0IGlzIGFscmVhZHkgYm91bmQgdG8gYSBkcml2ZXIsIGl0IHdpbGwKK2ZpcnN0
IGJlIHVuYm91bmQsIGFuZCB0aGUgb3JpZ2luYWwgZHJpdmVyIHN0b3JlZCBzbyB0aGF0IGl0IGNh
biBiZQorcmUtYm91bmQgdG8gdGhlIHNhbWUgZHJpdmVyIGxhdGVyIGlmIGRlc2lyZWQuICBJZiB0
aGUgZGV2aWNlIGlzCithbHJlYWR5IGJvdW5kLCBpdCB3aWxsIGFzc2lnbiBpdCB0byB0aGUgcXVh
cmFudGluZSBkb21haW4gYW5kIHJldHVybgorc3VjY2Vzcy4KIAogQ0FVVElPTjogVGhpcyB3aWxs
IG1ha2UgdGhlIGRldmljZSB1bnVzYWJsZSBieSBEb21haW4gMCB1bnRpbCBpdCBpcwogcmV0dXJu
ZWQgd2l0aCBwY2ktYXNzaWduYWJsZS1yZW1vdmUuICBDYXJlIHNob3VsZCB0aGVyZWZvcmUgYmUg
dGFrZW4KQEAgLTE2MDIsMTEgKzE2MDQsMTggQEAgYmVpbmcgdXNlZC4KIAogPWl0ZW0gQjxwY2kt
YXNzaWduYWJsZS1yZW1vdmU+IFtJPC1yPl0gSTxCREY+CiAKLU1ha2UgdGhlIGRldmljZSBhdCBQ
Q0kgQnVzL0RldmljZS9GdW5jdGlvbiBCREYgbm90IGFzc2lnbmFibGUgdG8gZ3Vlc3RzLiAgVGhp
cwotd2lsbCBhdCBsZWFzdCB1bmJpbmQgdGhlIGRldmljZSBmcm9tIHBjaWJhY2suICBJZiB0aGUg
LXIgb3B0aW9uIGlzIHNwZWNpZmllZCwKLWl0IHdpbGwgYWxzbyBhdHRlbXB0IHRvIHJlLWJpbmQg
dGhlIGRldmljZSB0byBpdHMgb3JpZ2luYWwgZHJpdmVyLCBtYWtpbmcgaXQKLXVzYWJsZSBieSBE
b21haW4gMCBhZ2Fpbi4gIElmIHRoZSBkZXZpY2UgaXMgbm90IGJvdW5kIHRvIHBjaWJhY2ssIGl0
IHdpbGwKLXJldHVybiBzdWNjZXNzLgorTWFrZSB0aGUgZGV2aWNlIGF0IFBDSSBCdXMvRGV2aWNl
L0Z1bmN0aW9uIEJERiBub3QgYXNzaWduYWJsZSB0bworZ3Vlc3RzLiAgVGhpcyB3aWxsIGF0IGxl
YXN0IHVuYmluZCB0aGUgZGV2aWNlIGZyb20gcGNpYmFjaywgYW5kCityZS1hc3NpZ24gaXQgZnJv
bSB0aGUgInF1YXJhbnRpbmUgZG9tYWluIiBiYWNrIHRvIGRvbWFpbiAwLiAgSWYgdGhlIC1yCitv
cHRpb24gaXMgc3BlY2lmaWVkLCBpdCB3aWxsIGFsc28gYXR0ZW1wdCB0byByZS1iaW5kIHRoZSBk
ZXZpY2UgdG8gaXRzCitvcmlnaW5hbCBkcml2ZXIsIG1ha2luZyBpdCB1c2FibGUgYnkgRG9tYWlu
IDAgYWdhaW4uICBJZiB0aGUgZGV2aWNlIGlzCitub3QgYm91bmQgdG8gcGNpYmFjaywgaXQgd2ls
bCByZXR1cm4gc3VjY2Vzcy4KKworTm90ZSB0aGF0IHRoaXMgZnVuY3Rpb25hbGl0eSB3aWxsIHdv
cmsgZXZlbiBmb3IgZGV2aWNlcyB3aGljaCB3ZXJlIG5vdAorbWFkZSBhc3NpZ25hYmxlIGJ5IEI8
cGNpLWFzc2lnbmFibGUtYWRkPi4gIFRoaXMgY2FuIGJlIHVzZWQgdG8gYWxsb3cKK2RvbTAgdG8g
YWNjZXNzIGRldmljZXMgd2hpY2ggd2VyZSBhdXRvbWF0aWNhbGx5IHF1YXJhbnRpbmVkIGJ5IFhl
bgorYWZ0ZXIgZG9tYWluIGRlc3RydWN0aW9uIGFzIGEgcmVzdWx0IG9mIFhlbidzIEI8aW9tbXU9
cXVhcmFudGluZT4KK2NvbW1hbmQtbGluZSBkZWZhdWx0LgogCiA9aXRlbSBCPHBjaS1hdHRhY2g+
IEk8ZG9tYWluLWlkPiBJPEJERj4KIAotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
