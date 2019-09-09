Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2586ADC81
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 17:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Lww-0001Dg-RC; Mon, 09 Sep 2019 15:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7Lwv-0001Da-3P
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 15:51:29 +0000
X-Inumbo-ID: af377e86-d319-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af377e86-d319-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568044288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ycfzqz35S93BaQErjBwP7w2oj9qOE91COvvGMLxul2U=;
 b=YxAHxczZh3NidZzDBcL1DQrI/cZDu8ywi1Pxdnn27Bt5UbYhQXogShJE
 8/QEQtMU7+A5t2cQ+rvM4Hz6S8fVzo4BX0V7UB0nN3xEQfoIJzfMZ/E77
 lBQmGB76d00/oWMcHfPXxwdLcWQ4qpkF5BdmKO9Z2lexrnxRsXhXO8aBj g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FxI18Hwn9w4BjhnhANnyPFkNF/UiB9+K9etwq3sDYsBgamVVUE6Q8CwvZdy+hHo5r3Myrqbde2
 HCkBAysPKK5IpcXm5wOjhMCeKDoJcWX5pjiL1Eh0E9BTSrhrZQUOpvYt7PkG5bbXxJncJTasHc
 UeepQvlXkpa9i2h8AzLIZyca74bPySVWlyn5Jfrftz1Z4K40vb2FMzjYmQCgVElgb6+g/UsGIx
 nZPuI1OBCXICXSZGquut6FjcLISstkhFVPoSug41VZ07l66XtvB/JfYYWjyH97H4WfmGEPTbj4
 hPA=
X-SBRS: 2.7
X-MesageID: 5329688
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5329688"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 16:51:24 +0100
Message-ID: <20190909155124.19942-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the CPUID.7[0].eax
 levelling MSR
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

N2EwIGlzIGFuIGludGVnZXIgZmllbGQsIG5vdCBhIG1hc2sgLSB0YWtpbmcgdGhlIGxvZ2ljYWwg
YW5kIG9mIHRoZSBoYXJkd2FyZQphbmQgcG9saWN5IHZhbHVlcyByZXN1bHRzIGluIG5vbnNlbnNl
LiAgSW5zdGVhZCwgdGFrZSB0aGUgcG9saWN5IHZhbHVlCmRpcmVjdGx5LgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpFdmVuIFJvbWUgaGFyZHdh
cmUgaGFzIDdbMF0uZWF4IHN0aWxsIGFzIDAsIGFuZCB0aGVyZSBpcyBubyBzZW5zaWJsZSByZWFz
b24gdG8Kc2V0IG1heF9zdWJsZWFmIGhpZ2hlciBhdCB0aGlzIHBvaW50LCBzbyB0aGlzIGlzIG9u
bHkgYSBsYXRlbnQgYnVnIGZvciBub3cuCi0tLQogeGVuL2FyY2gveDg2L2RvbWN0bC5jIHwgMTMg
KysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMgYi94ZW4vYXJjaC94ODYv
ZG9tY3RsLmMKaW5kZXggMWU5OGZjODAwOS4uMzVhZDhjYjUxYyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2RvbWN0bC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwpAQCAtMjE4LDExICsy
MTgsMTYgQEAgc3RhdGljIGludCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFp
biAqZCwKICAgICAgICAgaWYgKCBpc19wdl9kb21haW4oZCkgJiYgKChsZXZlbGxpbmdfY2FwcyAm
IExDQVBfN2FiMCkgPT0gTENBUF83YWIwKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHVpbnQ2
NF90IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzdhYjA7Ci0gICAgICAgICAgICB1aW50MzJf
dCBlYXggPSBjdGwtPmVheDsKLSAgICAgICAgICAgIHVpbnQzMl90IGVieCA9IHAtPmZlYXQuXzdi
MDsKIAotICAgICAgICAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJiAoWDg2X1ZF
TkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSApCi0gICAgICAgICAgICAgICAgbWFzayAmPSAo
KHVpbnQ2NF90KWVheCA8PCAzMikgfCBlYng7CisgICAgICAgICAgICAvKgorICAgICAgICAgICAg
ICogTGVhZiA3WzBdLmVheCBpcyBtYXhfc3VibGVhZiwgbm90IGEgZmVhdHVyZSBtYXNrLiAgVGFr
ZSBpdAorICAgICAgICAgICAgICogd2hvbGVzYWxlIGZyb20gdGhlIHBvbGljeSwgYnV0IGNsYW1w
IHRoZSBmZWF0dXJlcyBpbiA3WzBdLmVieAorICAgICAgICAgICAgICogcGVyIHVzdWFsLgorICAg
ICAgICAgICAgICovCisgICAgICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAm
CisgICAgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkK
KyAgICAgICAgICAgICAgICBtYXNrID0gKCgodWludDY0X3QpcC0+ZmVhdC5tYXhfc3VibGVhZiA8
PCAzMikgfAorICAgICAgICAgICAgICAgICAgICAgICAgKCh1aW50MzJfdCltYXNrIHwgcC0+ZmVh
dC5fN2IwKSk7CiAKICAgICAgICAgICAgIGQtPmFyY2gucHYuY3B1aWRtYXNrcy0+XzdhYjAgPSBt
YXNrOwogICAgICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
