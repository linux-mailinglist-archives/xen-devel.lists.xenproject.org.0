Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1DC2634
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 21:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF19d-0004zh-CD; Mon, 30 Sep 2019 19:16:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iF19b-0004zc-VE
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 19:16:15 +0000
X-Inumbo-ID: c546a4d8-e3b6-11e9-bf31-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id c546a4d8-e3b6-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569870974;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kT5v3qDwEDFIK1RRLCLUYHKPs1WhmHSG4FkUXw03/lc=;
 b=ExveGWeMz7sgV27yM5VIHkTITip09Hkm8PPJ9em4z+zOfYpZLis2vGGZ
 HsNJ17Rpb9k0UdDbW/mjm6Ypthg6cZJFsshCvkahksdn+/Eu6eR37Y4qo
 IKPcRrcOlC9Lr0FKSZbOzcZAH/n34EBb5wqK55YgHziotrino2gNzsM5V Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MMbKhWUDOiDVTA1uXK2Pv0AOdgvGEhMmArHmap58hex2+IPpR+aBJPwFcGIPhmsP1Nu7om3vqA
 YpYVhgnigwvuGqeJep7w+ql5+xvKXYAdWryAUqUIUfljwTRKXmuypk5QjKbHba0izbVXDjEE4h
 qWcvB/kYFm3bCN+pmMHNB2wd8qOereHUJbRAy+ISbqHZUar80BTMF9vc4Rj0uTd8pBeqvWXZYo
 iwW9Mz/Of8muE0CPhWzOBvW+NtD43SWKJp8EWuQBukp5I6LX3ZkMI+jVlTIBUwFi8nBSs9zwij
 Fgg=
X-SBRS: 2.7
X-MesageID: 6513078
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6513078"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 20:16:10 +0100
Message-ID: <20190930191610.27545-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be always_inline
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgaW4gcGFydGljdWxhciBoYXMgYSBoYWJpdCBvZiBvdXQtb2YtbGluaW5nIHRoZXNlIGFu
ZCBjcmVhdGluZyBtdWx0aXBsZQpsb2NhbCBjb3BpZXMgb2YgX21mbigpIGFuZCBtZm5feCgpLCBl
dGMuICBPdmVycmlkZSB0aGlzIGJlaGF2aW91ci4KCkFkanVzdCBib29sX3QgdG8gYm9vbCBmb3Ig
dGhlICpfZXEoKSBoZWxwZXJzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4K
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpTcG90dGVkIHdoaWxlIGxvb2tpbmcgYXQg
dGhlIGNvZGUgZ2VuZXJhdGlvbiBvZiBldmFsdXRlX25vc3BlYygpCgpTZW1pLVJGQyBmb3ItNC4x
My4gIE5vdGhpbmcgKGN1cnJlbnRseSB1bi1icm9rZW4pIHdpbGwgYnJlYWsgd2l0aG91dCB0aGlz
LCBidXQKaXQgaXMgYSBzdGVwIG9uIHRoZSB3YXkgdG8gYmVpbmcgYWJsZSB0byB1c2UgQ2xhbmcg
YW5kIExpdmVwYXRjaCBpbgpjb21iaW5hdGlvbi4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUu
aCAgICB8ICA0ICsrLS0KIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAgICAgIHwgMTYgKysrKysrKyst
LS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL3R5cGVzYWZlLmggfCAgOCArKysrLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCmluZGV4
IDk3NGJkM2ZmZTguLmM3N2I4YzFhMjIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCkBAIC00MiwxMiArNDIsMTIgQEAgVFlQ
RV9TQUZFKHVpbnQ2NF90LCBkZm4pOwogI3VuZGVmIGRmbl94CiAjZW5kaWYKIAotc3RhdGljIGlu
bGluZSBkZm5fdCBkZm5fYWRkKGRmbl90IGRmbiwgdW5zaWduZWQgbG9uZyBpKQorc3RhdGljIGFs
d2F5c19pbmxpbmUgZGZuX3QgZGZuX2FkZChkZm5fdCBkZm4sIHVuc2lnbmVkIGxvbmcgaSkKIHsK
ICAgICByZXR1cm4gX2RmbihkZm5feChkZm4pICsgaSk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgYm9v
bF90IGRmbl9lcShkZm5fdCB4LCBkZm5fdCB5KQorc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBk
Zm5fZXEoZGZuX3QgeCwgZGZuX3QgeSkKIHsKICAgICByZXR1cm4gZGZuX3goeCkgPT0gZGZuX3go
eSk7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9pbmNsdWRlL3hl
bi9tbS5oCmluZGV4IDhkMGRkZmI2MGMuLjU2MTdlY2M2MDcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCkBAIC03NywyMiArNzcsMjIg
QEAgVFlQRV9TQUZFKHVuc2lnbmVkIGxvbmcsIG1mbik7CiAjdW5kZWYgbWZuX3gKICNlbmRpZgog
Ci1zdGF0aWMgaW5saW5lIG1mbl90IG1mbl9hZGQobWZuX3QgbWZuLCB1bnNpZ25lZCBsb25nIGkp
CitzdGF0aWMgYWx3YXlzX2lubGluZSBtZm5fdCBtZm5fYWRkKG1mbl90IG1mbiwgdW5zaWduZWQg
bG9uZyBpKQogewogICAgIHJldHVybiBfbWZuKG1mbl94KG1mbikgKyBpKTsKIH0KIAotc3RhdGlj
IGlubGluZSBtZm5fdCBtZm5fbWF4KG1mbl90IHgsIG1mbl90IHkpCitzdGF0aWMgYWx3YXlzX2lu
bGluZSBtZm5fdCBtZm5fbWF4KG1mbl90IHgsIG1mbl90IHkpCiB7CiAgICAgcmV0dXJuIF9tZm4o
bWF4KG1mbl94KHgpLCBtZm5feCh5KSkpOwogfQogCi1zdGF0aWMgaW5saW5lIG1mbl90IG1mbl9t
aW4obWZuX3QgeCwgbWZuX3QgeSkKK3N0YXRpYyBhbHdheXNfaW5saW5lIG1mbl90IG1mbl9taW4o
bWZuX3QgeCwgbWZuX3QgeSkKIHsKICAgICByZXR1cm4gX21mbihtaW4obWZuX3goeCksIG1mbl94
KHkpKSk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgYm9vbF90IG1mbl9lcShtZm5fdCB4LCBtZm5fdCB5
KQorc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBtZm5fZXEobWZuX3QgeCwgbWZuX3QgeSkKIHsK
ICAgICByZXR1cm4gbWZuX3goeCkgPT0gbWZuX3goeSk7CiB9CkBAIC0xMTUsMjIgKzExNSwyMiBA
QCBUWVBFX1NBRkUodW5zaWduZWQgbG9uZywgZ2ZuKTsKICN1bmRlZiBnZm5feAogI2VuZGlmCiAK
LXN0YXRpYyBpbmxpbmUgZ2ZuX3QgZ2ZuX2FkZChnZm5fdCBnZm4sIHVuc2lnbmVkIGxvbmcgaSkK
K3N0YXRpYyBhbHdheXNfaW5saW5lIGdmbl90IGdmbl9hZGQoZ2ZuX3QgZ2ZuLCB1bnNpZ25lZCBs
b25nIGkpCiB7CiAgICAgcmV0dXJuIF9nZm4oZ2ZuX3goZ2ZuKSArIGkpOwogfQogCi1zdGF0aWMg
aW5saW5lIGdmbl90IGdmbl9tYXgoZ2ZuX3QgeCwgZ2ZuX3QgeSkKK3N0YXRpYyBhbHdheXNfaW5s
aW5lIGdmbl90IGdmbl9tYXgoZ2ZuX3QgeCwgZ2ZuX3QgeSkKIHsKICAgICByZXR1cm4gX2dmbiht
YXgoZ2ZuX3goeCksIGdmbl94KHkpKSk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgZ2ZuX3QgZ2ZuX21p
bihnZm5fdCB4LCBnZm5fdCB5KQorc3RhdGljIGFsd2F5c19pbmxpbmUgZ2ZuX3QgZ2ZuX21pbihn
Zm5fdCB4LCBnZm5fdCB5KQogewogICAgIHJldHVybiBfZ2ZuKG1pbihnZm5feCh4KSwgZ2ZuX3go
eSkpKTsKIH0KIAotc3RhdGljIGlubGluZSBib29sX3QgZ2ZuX2VxKGdmbl90IHgsIGdmbl90IHkp
CitzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGdmbl9lcShnZm5fdCB4LCBnZm5fdCB5KQogewog
ICAgIHJldHVybiBnZm5feCh4KSA9PSBnZm5feCh5KTsKIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi90eXBlc2FmZS5oIGIveGVuL2luY2x1ZGUveGVuL3R5cGVzYWZlLmgKaW5kZXggN2Vj
ZDNiNGE4ZC4uZjI0MjUwMDA2MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3R5cGVzYWZl
LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3R5cGVzYWZlLmgKQEAgLTIxLDE1ICsyMSwxNSBAQAog
CiAjZGVmaW5lIFRZUEVfU0FGRShfdHlwZSwgX25hbWUpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAgICAgdHlwZWRlZiBzdHJ1Y3QgeyBfdHlwZSBfbmFtZTsgfSBf
bmFtZSMjX3Q7ICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgc3RhdGljIGlubGluZSBf
bmFtZSMjX3QgXyMjX25hbWUoX3R5cGUgbikgeyByZXR1cm4gKF9uYW1lIyNfdCkgeyBuIH07IH0g
XAotICAgIHN0YXRpYyBpbmxpbmUgX3R5cGUgX25hbWUjI194KF9uYW1lIyNfdCBuKSB7IHJldHVy
biBuLl9uYW1lOyB9CisgICAgc3RhdGljIGFsd2F5c19pbmxpbmUgX25hbWUjI190IF8jI19uYW1l
KF90eXBlIG4pIHsgcmV0dXJuIChfbmFtZSMjX3QpIHsgbiB9OyB9IFwKKyAgICBzdGF0aWMgYWx3
YXlzX2lubGluZSBfdHlwZSBfbmFtZSMjX3goX25hbWUjI190IG4pIHsgcmV0dXJuIG4uX25hbWU7
IH0KIAogI2Vsc2UKIAogI2RlZmluZSBUWVBFX1NBRkUoX3R5cGUsIF9uYW1lKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIHR5cGVkZWYgX3R5cGUgX25hbWUj
I190OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgIHN0
YXRpYyBpbmxpbmUgX25hbWUjI190IF8jI19uYW1lKF90eXBlIG4pIHsgcmV0dXJuIG47IH0gICAg
ICAgICAgICAgXAotICAgIHN0YXRpYyBpbmxpbmUgX3R5cGUgX25hbWUjI194KF9uYW1lIyNfdCBu
KSB7IHJldHVybiBuOyB9CisgICAgc3RhdGljIGFsd2F5c19pbmxpbmUgX25hbWUjI190IF8jI19u
YW1lKF90eXBlIG4pIHsgcmV0dXJuIG47IH0gICAgICBcCisgICAgc3RhdGljIGFsd2F5c19pbmxp
bmUgX3R5cGUgX25hbWUjI194KF9uYW1lIyNfdCBuKSB7IHJldHVybiBuOyB9CiAKICNlbmRpZgog
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
