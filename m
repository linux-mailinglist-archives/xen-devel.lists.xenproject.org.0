Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F49D115DE4
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 19:21:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ideex-00083R-81; Sat, 07 Dec 2019 18:18:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ideew-00083M-3y
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 18:18:26 +0000
X-Inumbo-ID: f1f0d8d6-191d-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1f0d8d6-191d-11ea-88e7-bc764e2007e4;
 Sat, 07 Dec 2019 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575742699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XlUQvWE3vE1jIDqriJtcbUN+LOYEupLYEpdkKyvokek=;
 b=UXgiI1OttBe28v6sxJttDOOo7WO2EusVUu3m/61kpD3tb0roy5i3tBke
 nEka7bMiAXrVY+IFatkw4tWd98cO0PYJltAE1w4VRD/+YmEHsF2SHwLPq
 bKAjD2M3aMHS+4MVOyii8YxfmlLyrrYAgd34Wa1j6i+iDrLAh0wMaOsnE I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NyOsnJ7IflihsN/aJ5YxAqdAefA2y9paSYd0mInEqik9pyjrJNq3N8T+6ZZt7358GQ0RzFWXwo
 jgtAeFpSNNkpLYF+oI7eYexz+anjmDtXGxAEz8noM2CSOfLHXmnJpKPVX0aSui1FovZbKq/GuY
 inzAcZhRmY6gBVk2L1YegIKAR3dDzYeHhCbAMuyZfOMbZoYinpUEN3jMiskOywU3avfPb/EEOD
 fvtZhNZ6YuoW9atcIB3+teTom4If5vvBqHsTeznTIo3xO/uozhuXfx3RgQ3t7uU/IGyt2AKSpW
 1PM=
X-SBRS: 2.7
X-MesageID: 9705752
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9705752"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 18:18:12 +0000
Message-ID: <20191207181813.30176-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207181813.30176-1-andrew.cooper3@citrix.com>
References: <20191207181813.30176-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/3] xen/banner: Drop the fig-to-oct.py script
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNjcmlwdCBpcyA2NjQgcmF0aGVyIHRoYW4gNzc1LCBzbyB0aGUgYmFubmVyIGNvbnZlcnNp
b24gZG9lc24ndCBhY3R1YWxseQp3b3JrIGlmICQoUFlUSE9OKSBpcyBlbXB0eToKCiAgL2Jpbi9z
aDogdG9vbHMvZmlnLXRvLW9jdC5weTogUGVybWlzc2lvbiBkZW5pZWQKICBtYWtlWzNdOiAqKiog
W2luY2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI2CiAgbWFrZVszXTogTGVhdmluZyBkaXJl
Y3RvcnkgYC9idWlsZHMveGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuL3hlbicKCkZpeGlu
ZyB0aGlzIGlzIGVhc3ksIGJ1dCB1c2luZyBweXRob24gaGVyZSBpcyB3YXN0ZWZ1bC4gIGNvbXBp
bGUuaCBkb2Vzbid0Cm5lZWQgWEVOX0JBTk5FUiByZW5kZXJpbmcgaW4gb2N0YWwsIGFuZCB0ZXh0
IGlzIG11Y2ggbW9yZSBzaW1wbGUgdG8gaGFuZGxlLgpSZXBsYWNlIGZpZy10by1vY3QucHkgd2l0
aCBhIHNlZCBvbmVsaW5lci4KCldoaWxlIGNoYW5naW5nIHRoaXMgbG9naWMsIHRha2UgdGhlIG9w
cG9ydHVuaXR5IHRvIG9wdGltaXNlIHRoZSBiYW5uZXIKc3BhY2UgKGFuZCB0aW1lIG9uIHRoZSBz
ZXJpYWwgcG9ydCkgYnkgZHJvcHBpbmcgdHJhaWxpbmcgd2hpdGVzcGFjZSwgd2hpY2ggaXMKODQg
Y2hhcmFjdGVycyBmb3IgY3VycmVudCBzdGFnaW5nLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDQzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKdjI6CiAqIE5ldwoKU3BvdHRlZCBieSBHaXRsYWIgQ0ksIGNhdXNlZCBi
eSBgd2hpY2hgIG5vdCBiZWluZyBwcmVzZW50IGluIHNvbWUgb2YgdGhlCkNlbnRPUyBjb250YWlu
ZXJzLiAgV2hpbGUgdGhpcyBpcyBtb3JlIG9mIGEgY29udGFpbmVyIGJ1ZyB0aGFuIGFueXRoaW5n
IGVsc2UsCml0IGRvZXMgaGlnaGxpZ2h0IHRoYXQgdGhlIGJ1aWxkIG91Z2h0IHRvIGNvcGUuCi0t
LQogeGVuL01ha2VmaWxlICAgICAgICAgICAgfCAgNSArKysrLQogeGVuL3Rvb2xzL2ZpZy10by1v
Y3QucHkgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4vdG9vbHMvZmln
LXRvLW9jdC5weQoKZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQppbmRl
eCA5OTcwMWUzMTY1Li4xM2FlMWI2MDExIDEwMDY0NAotLS0gYS94ZW4vTWFrZWZpbGUKKysrIGIv
eGVuL01ha2VmaWxlCkBAIC0xNjMsNiArMTYzLDkgQEAgZGVsZXRlLXVuZnJlc2gtZmlsZXM6CiAJ
QG12IC1mICRALnRtcCAkQAogCiAjIGNvbXBpbGUuaCBjb250YWlucyBkeW5hbWljIGJ1aWxkIGlu
Zm8uIFJlYnVpbHQgb24gZXZlcnkgJ21ha2UnIGludm9jYXRpb24uCisjCisjIEZvciAuYmFubmVy
IHNlZC1hcnksIHN0cmlwIHRyYWlsaW5nIHdoaXRlc3BhY2UsIGVzY2FwZSBiYWNrc2xhc2hlcywg
YW5kIHdyYXAKKyMgZWFjaCBsaW5lIGluICciLi4uXG4iIFwnIHRvIGJlY29tZSBhIHZhbGlkIEMg
c3RyaW5nCiBpbmNsdWRlL3hlbi9jb21waWxlLmg6IGluY2x1ZGUveGVuL2NvbXBpbGUuaC5pbiAu
YmFubmVyCiAJQHNlZCAtZSAncy9AQGRhdGVAQC8kKFhFTl9CVUlMRF9EQVRFKS9nJyBcCiAJICAg
IC1lICdzL0BAdGltZUBALyQoWEVOX0JVSUxEX1RJTUUpL2cnIFwKQEAgLTE3Niw3ICsxNzksNyBA
QCBpbmNsdWRlL3hlbi9jb21waWxlLmg6IGluY2x1ZGUveGVuL2NvbXBpbGUuaC5pbiAuYmFubmVy
CiAJICAgIC1lICdzIUBAY2hhbmdlc2V0QEAhJChzaGVsbCB0b29scy9zY212ZXJzaW9uICQoWEVO
X1JPT1QpIHx8IGVjaG8gInVuYXZhaWxhYmxlIikhZycgXAogCSAgICA8IGluY2x1ZGUveGVuL2Nv
bXBpbGUuaC5pbiA+ICRALm5ldwogCUBjYXQgLmJhbm5lcgotCUAkKFBZVEhPTikgdG9vbHMvZmln
LXRvLW9jdC5weSA8IC5iYW5uZXIgPj4gJEAubmV3CisJQHNlZCAtZSAnc19bIF0qJCRfXycgLWUg
J3NfXFxfXFxcXF9nJyAtZSAnc19cKC4qXClfIlwxXFxuIiBcXF8nIDwgLmJhbm5lciA+PiAkQC5u
ZXcKIAlAbXYgLWYgJEAubmV3ICRACiAKIGluY2x1ZGUvYXNtLSQoVEFSR0VUX0FSQ0gpL2FzbS1v
ZmZzZXRzLmg6IGFyY2gvJChUQVJHRVRfQVJDSCkvYXNtLW9mZnNldHMucwpkaWZmIC0tZ2l0IGEv
eGVuL3Rvb2xzL2ZpZy10by1vY3QucHkgYi94ZW4vdG9vbHMvZmlnLXRvLW9jdC5weQpkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZGI0ZmQzMjE1OS4uMDAwMDAwMDAwMAotLS0gYS94ZW4v
dG9vbHMvZmlnLXRvLW9jdC5weQorKysgL2Rldi9udWxsCkBAIC0xLDE4ICswLDAgQEAKLSMhL3Vz
ci9iaW4vZW52IHB5dGhvbgotaW1wb3J0IHN5cwotCi1jaGFyc19wZXJfbGluZSA9IDE4Ci1jaGFy
c19zb19mYXIgPSAwCi0KLXN5cy5zdGRvdXQud3JpdGUoJyInKQotCi1mb3IgY2hhciBpbiBzeXMu
c3RkaW4ucmVhZCgpOgotCi0gICAgc3lzLnN0ZG91dC53cml0ZSgiXFwlMDNvIiAlIG9yZChjaGFy
KSkKLSAgICBjaGFyc19zb19mYXIgPSBjaGFyc19zb19mYXIgKyAxCi0KLSAgICBpZiBjaGFyc19z
b19mYXIgPT0gY2hhcnNfcGVyX2xpbmU6Ci0gICAgICAgIGNoYXJzX3NvX2ZhciA9IDAKLSAgICAg
ICAgc3lzLnN0ZG91dC53cml0ZSgnIiBcXFxuIicpCi0KLXN5cy5zdGRvdXQud3JpdGUoJyJcbicp
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
