Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FF510A7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 17:36:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfQy0-00024X-9Y; Mon, 24 Jun 2019 15:33:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EXrY=UX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hfQxz-00024D-35
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 15:33:11 +0000
X-Inumbo-ID: 5e75be73-9695-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5e75be73-9695-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 15:33:09 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DtRLvqc0OQttJbGxfrj2CMu3fCO0USvAN3kY8b2v+tCf975QkKMKnJE+tZweePJZvR6fLSO/VB
 Tfu7LGadR4xMXIg5ZLlfUsOo+YJ789K7tTy5qCfGamVQ/L2NEJ4gu9oLfC/YcllM0OlXFZ5Wbw
 jzlUYU9KlM2Us6DiTgRJFGpNAPnxxu81Dl5bGxZbABVFZc9dBjS19HfZJCFororxxITS6tKLfE
 vW7BOsRreuN1vaM/gCl24H6K8lWmdphl+ub1aiXMmYRiHnhZUmLW2n0+WU3E0VZHraDtpj9ZJY
 O5k=
X-SBRS: 2.7
X-MesageID: 2148095
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2148095"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 24 Jun 2019 16:32:50 +0100
Message-ID: <20190624153257.20163-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624153257.20163-1-anthony.perard@citrix.com>
References: <20190624153257.20163-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 1/8] xen-block: support feature-large-sector-size
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCkEgcmVjZW50IFhl
biBjb21taXQgWzFdIGNsYXJpZmllZCB0aGUgc2VtYW50aWNzIG9mIHNlY3RvciBiYXNlZCBxdWFu
dGl0aWVzCnVzZWQgaW4gdGhlIGJsa2lmIHByb3RvY29sIHN1Y2ggdGhhdCBpdCBpcyBub3cgc2Fm
ZSB0byBjcmVhdGUgYSB4ZW4tYmxvY2sKZGV2aWNlIHdpdGggYSBsb2dpY2FsX2Jsb2NrX3NpemUg
IT0gNTEyLCBhcyBsb25nIGFzIHRoZSBkZXZpY2Ugb25seQpjb25uZWN0cyB0byBhIGZyb250ZW5k
IGFkdmVydGl6aW5nICdmZWF0dXJlLWxhcmdlLWJsb2NrLXNpemUnLgoKVGhpcyBwYXRjaCBtb2Rp
ZmllcyB4ZW4tYmxvY2sgYWNjb3JkaW5nbHkuIEl0IGFsc28gdXNlcyBhIHN0YWNrIHZhcmlhYmxl
CmZvciB0aGUgQmxvY2tCYWNrZW5kIGluIHhlbl9ibG9ja19yZWFsaXplKCkgdG8gYXZvaWQgcmVw
ZWF0ZWQgZGVyZWZlcmVuY2luZwpvZiB0aGUgQmxvY2tDb25mIHBvaW50ZXIsIGFuZCBjaGFuZ2Vz
IHRoZSBwYXJhbWV0ZXJzIG9mCnhlbl9ibG9ja19kYXRhcGxhbmVfY3JlYXRlKCkgc28gdGhhdCB0
aGUgQmxvY2tCYWNrZW5kIHBvaW50ZXIgYW5kIHNlY3RvcgpzaXplIGFyZSBwYXNzZWQgZXhwaWNp
dGx5IHJhdGhlciB0aGFuIGltcGxpY2l0bHkgdmlhIHRoZSBCbG9ja0NvbmYuCgpUaGVzZSBtb2Rp
ZmljYXRpb25zIGhhdmUgYmVlbiB0ZXN0ZWQgYWdhaW5zdCBhIHJlY2VudCBXaW5kb3dzIFBWIFhF
TlZCRApkcml2ZXIgWzJdIHVzaW5nIGEgeGVuLWRpc2sgZGV2aWNlIHdpdGggYSA0a0IgbG9naWNh
bCBibG9jayBzaXplLgoKWzFdIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5n
aXQ7YT1jb21taXQ7aD02N2UxYzA1MGUzNmIyYzk5MDBjY2E4MzYxOGU1NjE4OWVmZmJhZDk4Clsy
XSBodHRwczovL3dpbnB2ZHJ2YnVpbGQueGVucHJvamVjdC5vcmc6ODA4MC9qb2IvWEVOVkJELW1h
c3Rlci8xMjYKClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KTWVzc2FnZS1JZDogPDIwMTkwNDA5MTY0MDM4LjI1NDg0LTEtcGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+CltFZGl0ZWQgZXJyb3IgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogaHcvYmxvY2svZGF0YXBsYW5l
L3hlbi1ibG9jay5jIHwgMjUgKysrKysrKysrKysrLS0tLS0tLS0tLQogaHcvYmxvY2svZGF0YXBs
YW5lL3hlbi1ibG9jay5oIHwgIDMgKystCiBody9ibG9jay94ZW4tYmxvY2suYyAgICAgICAgICAg
fCAzOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQs
IDQwIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2Jsb2Nr
L2RhdGFwbGFuZS94ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suYwpp
bmRleCBmN2FkNDUyYmJkLi42ZGE1Yzc3ZmJiIDEwMDY0NAotLS0gYS9ody9ibG9jay9kYXRhcGxh
bmUveGVuLWJsb2NrLmMKKysrIGIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jCkBAIC01
OCw2ICs1OCw3IEBAIHN0cnVjdCBYZW5CbG9ja0RhdGFQbGFuZSB7CiAgICAgaW50IHJlcXVlc3Rz
X2luZmxpZ2h0OwogICAgIHVuc2lnbmVkIGludCBtYXhfcmVxdWVzdHM7CiAgICAgQmxvY2tCYWNr
ZW5kICpibGs7CisgICAgdW5zaWduZWQgaW50IHNlY3Rvcl9zaXplOwogICAgIFFFTVVCSCAqYmg7
CiAgICAgSU9UaHJlYWQgKmlvdGhyZWFkOwogICAgIEFpb0NvbnRleHQgKmN0eDsKQEAgLTE2Nyw3
ICsxNjgsNyBAQCBzdGF0aWMgaW50IHhlbl9ibG9ja19wYXJzZV9yZXF1ZXN0KFhlbkJsb2NrUmVx
dWVzdCAqcmVxdWVzdCkKICAgICAgICAgZ290byBlcnI7CiAgICAgfQogCi0gICAgcmVxdWVzdC0+
c3RhcnQgPSByZXF1ZXN0LT5yZXEuc2VjdG9yX251bWJlciAqIFhFTl9CTEtJRl9TRUNUT1JfU0la
RTsKKyAgICByZXF1ZXN0LT5zdGFydCA9IHJlcXVlc3QtPnJlcS5zZWN0b3JfbnVtYmVyICogZGF0
YXBsYW5lLT5zZWN0b3Jfc2l6ZTsKICAgICBmb3IgKGkgPSAwOyBpIDwgcmVxdWVzdC0+cmVxLm5y
X3NlZ21lbnRzOyBpKyspIHsKICAgICAgICAgaWYgKGkgPT0gQkxLSUZfTUFYX1NFR01FTlRTX1BF
Ul9SRVFVRVNUKSB7CiAgICAgICAgICAgICBlcnJvcl9yZXBvcnQoImVycm9yOiBucl9zZWdtZW50
cyB0b28gYmlnIik7CkBAIC0xNzcsMTQgKzE3OCwxNCBAQCBzdGF0aWMgaW50IHhlbl9ibG9ja19w
YXJzZV9yZXF1ZXN0KFhlbkJsb2NrUmVxdWVzdCAqcmVxdWVzdCkKICAgICAgICAgICAgIGVycm9y
X3JlcG9ydCgiZXJyb3I6IGZpcnN0ID4gbGFzdCBzZWN0b3IiKTsKICAgICAgICAgICAgIGdvdG8g
ZXJyOwogICAgICAgICB9Ci0gICAgICAgIGlmIChyZXF1ZXN0LT5yZXEuc2VnW2ldLmxhc3Rfc2Vj
dCAqIFhFTl9CTEtJRl9TRUNUT1JfU0laRSA+PQorICAgICAgICBpZiAocmVxdWVzdC0+cmVxLnNl
Z1tpXS5sYXN0X3NlY3QgKiBkYXRhcGxhbmUtPnNlY3Rvcl9zaXplID49CiAgICAgICAgICAgICBY
Q19QQUdFX1NJWkUpIHsKICAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiZXJyb3I6IHBhZ2UgY3Jv
c3NpbmciKTsKICAgICAgICAgICAgIGdvdG8gZXJyOwogICAgICAgICB9CiAKICAgICAgICAgbGVu
ID0gKHJlcXVlc3QtPnJlcS5zZWdbaV0ubGFzdF9zZWN0IC0KLSAgICAgICAgICAgICAgIHJlcXVl
c3QtPnJlcS5zZWdbaV0uZmlyc3Rfc2VjdCArIDEpICogWEVOX0JMS0lGX1NFQ1RPUl9TSVpFOwor
ICAgICAgICAgICAgICAgcmVxdWVzdC0+cmVxLnNlZ1tpXS5maXJzdF9zZWN0ICsgMSkgKiBkYXRh
cGxhbmUtPnNlY3Rvcl9zaXplOwogICAgICAgICByZXF1ZXN0LT5zaXplICs9IGxlbjsKICAgICB9
CiAgICAgaWYgKHJlcXVlc3QtPnN0YXJ0ICsgcmVxdWVzdC0+c2l6ZSA+IGJsa19nZXRsZW5ndGgo
ZGF0YXBsYW5lLT5ibGspKSB7CkBAIC0yMTgsMTcgKzIxOSwxNyBAQCBzdGF0aWMgaW50IHhlbl9i
bG9ja19jb3B5X3JlcXVlc3QoWGVuQmxvY2tSZXF1ZXN0ICpyZXF1ZXN0KQogICAgICAgICBpZiAo
dG9fZG9tYWluKSB7CiAgICAgICAgICAgICBzZWdzW2ldLmRlc3QuZm9yZWlnbi5yZWYgPSByZXF1
ZXN0LT5yZXEuc2VnW2ldLmdyZWY7CiAgICAgICAgICAgICBzZWdzW2ldLmRlc3QuZm9yZWlnbi5v
ZmZzZXQgPSByZXF1ZXN0LT5yZXEuc2VnW2ldLmZpcnN0X3NlY3QgKgotICAgICAgICAgICAgICAg
IFhFTl9CTEtJRl9TRUNUT1JfU0laRTsKKyAgICAgICAgICAgICAgICBkYXRhcGxhbmUtPnNlY3Rv
cl9zaXplOwogICAgICAgICAgICAgc2Vnc1tpXS5zb3VyY2UudmlydCA9IHZpcnQ7CiAgICAgICAg
IH0gZWxzZSB7CiAgICAgICAgICAgICBzZWdzW2ldLnNvdXJjZS5mb3JlaWduLnJlZiA9IHJlcXVl
c3QtPnJlcS5zZWdbaV0uZ3JlZjsKICAgICAgICAgICAgIHNlZ3NbaV0uc291cmNlLmZvcmVpZ24u
b2Zmc2V0ID0gcmVxdWVzdC0+cmVxLnNlZ1tpXS5maXJzdF9zZWN0ICoKLSAgICAgICAgICAgICAg
ICBYRU5fQkxLSUZfU0VDVE9SX1NJWkU7CisgICAgICAgICAgICAgICAgZGF0YXBsYW5lLT5zZWN0
b3Jfc2l6ZTsKICAgICAgICAgICAgIHNlZ3NbaV0uZGVzdC52aXJ0ID0gdmlydDsKICAgICAgICAg
fQogICAgICAgICBzZWdzW2ldLmxlbiA9IChyZXF1ZXN0LT5yZXEuc2VnW2ldLmxhc3Rfc2VjdCAt
CiAgICAgICAgICAgICAgICAgICAgICAgIHJlcXVlc3QtPnJlcS5zZWdbaV0uZmlyc3Rfc2VjdCAr
IDEpICoKLSAgICAgICAgICAgICAgICAgICAgICBYRU5fQkxLSUZfU0VDVE9SX1NJWkU7CisgICAg
ICAgICAgICAgICAgICAgICAgZGF0YXBsYW5lLT5zZWN0b3Jfc2l6ZTsKICAgICAgICAgdmlydCAr
PSBzZWdzW2ldLmxlbjsKICAgICB9CiAKQEAgLTMzNiwxMiArMzM3LDEyIEBAIHN0YXRpYyBib29s
IHhlbl9ibG9ja19zcGxpdF9kaXNjYXJkKFhlbkJsb2NrUmVxdWVzdCAqcmVxdWVzdCwKIAogICAg
IC8qIFdyYXAgYXJvdW5kLCBvciBvdmVyZmxvd2luZyBieXRlIGxpbWl0PyAqLwogICAgIGlmIChz
ZWNfc3RhcnQgKyBzZWNfY291bnQgPCBzZWNfY291bnQgfHwKLSAgICAgICAgc2VjX3N0YXJ0ICsg
c2VjX2NvdW50ID4gSU5UNjRfTUFYIC8gWEVOX0JMS0lGX1NFQ1RPUl9TSVpFKSB7CisgICAgICAg
IHNlY19zdGFydCArIHNlY19jb3VudCA+IElOVDY0X01BWCAvIGRhdGFwbGFuZS0+c2VjdG9yX3Np
emUpIHsKICAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgIH0KIAotICAgIGJ5dGVfb2Zmc2V0ID0g
c2VjX3N0YXJ0ICogWEVOX0JMS0lGX1NFQ1RPUl9TSVpFOwotICAgIGJ5dGVfcmVtYWluaW5nID0g
c2VjX2NvdW50ICogWEVOX0JMS0lGX1NFQ1RPUl9TSVpFOworICAgIGJ5dGVfb2Zmc2V0ID0gc2Vj
X3N0YXJ0ICogZGF0YXBsYW5lLT5zZWN0b3Jfc2l6ZTsKKyAgICBieXRlX3JlbWFpbmluZyA9IHNl
Y19jb3VudCAqIGRhdGFwbGFuZS0+c2VjdG9yX3NpemU7CiAKICAgICBkbyB7CiAgICAgICAgIGJ5
dGVfY2h1bmsgPSBieXRlX3JlbWFpbmluZyA+IEJEUlZfUkVRVUVTVF9NQVhfQllURVMgPwpAQCAt
NjI1LDEzICs2MjYsMTUgQEAgc3RhdGljIHZvaWQgeGVuX2Jsb2NrX2RhdGFwbGFuZV9ldmVudCh2
b2lkICpvcGFxdWUpCiB9CiAKIFhlbkJsb2NrRGF0YVBsYW5lICp4ZW5fYmxvY2tfZGF0YXBsYW5l
X2NyZWF0ZShYZW5EZXZpY2UgKnhlbmRldiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBCbG9ja0NvbmYgKmNvbmYsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQmxvY2tCYWNrZW5kICpibGssCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHNlY3Rvcl9zaXpl
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPVGhyZWFk
ICppb3RocmVhZCkKIHsKICAgICBYZW5CbG9ja0RhdGFQbGFuZSAqZGF0YXBsYW5lID0gZ19uZXcw
KFhlbkJsb2NrRGF0YVBsYW5lLCAxKTsKIAogICAgIGRhdGFwbGFuZS0+eGVuZGV2ID0geGVuZGV2
OwotICAgIGRhdGFwbGFuZS0+YmxrID0gY29uZi0+YmxrOworICAgIGRhdGFwbGFuZS0+YmxrID0g
YmxrOworICAgIGRhdGFwbGFuZS0+c2VjdG9yX3NpemUgPSBzZWN0b3Jfc2l6ZTsKIAogICAgIFFM
SVNUX0lOSVQoJmRhdGFwbGFuZS0+aW5mbGlnaHQpOwogICAgIFFMSVNUX0lOSVQoJmRhdGFwbGFu
ZS0+ZnJlZWxpc3QpOwpkaWZmIC0tZ2l0IGEvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5o
IGIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5oCmluZGV4IGQ2ZmE2ZDI2ZGQuLjc2ZGNk
NTFjM2QgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suaAorKysgYi9o
dy9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmgKQEAgLTE1LDcgKzE1LDggQEAKIHR5cGVkZWYg
c3RydWN0IFhlbkJsb2NrRGF0YVBsYW5lIFhlbkJsb2NrRGF0YVBsYW5lOwogCiBYZW5CbG9ja0Rh
dGFQbGFuZSAqeGVuX2Jsb2NrX2RhdGFwbGFuZV9jcmVhdGUoWGVuRGV2aWNlICp4ZW5kZXYsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQmxvY2tDb25mICpj
b25mLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJsb2Nr
QmFja2VuZCAqYmxrLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBzZWN0b3Jfc2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJT1RocmVhZCAqaW90aHJlYWQpOwogdm9pZCB4ZW5fYmxvY2tf
ZGF0YXBsYW5lX2Rlc3Ryb3koWGVuQmxvY2tEYXRhUGxhbmUgKmRhdGFwbGFuZSk7CiB2b2lkIHhl
bl9ibG9ja19kYXRhcGxhbmVfc3RhcnQoWGVuQmxvY2tEYXRhUGxhbmUgKmRhdGFwbGFuZSwKZGlm
ZiAtLWdpdCBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jIGIvaHcvYmxvY2sveGVuLWJsb2NrLmMKaW5k
ZXggNGRlNTM3YWVmNC4uOGYyMjRlZjgxZCAxMDA2NDQKLS0tIGEvaHcvYmxvY2sveGVuLWJsb2Nr
LmMKKysrIGIvaHcvYmxvY2sveGVuLWJsb2NrLmMKQEAgLTUyLDExICs1MiwyNSBAQCBzdGF0aWMg
dm9pZCB4ZW5fYmxvY2tfY29ubmVjdChYZW5EZXZpY2UgKnhlbmRldiwgRXJyb3IgKiplcnJwKQog
ICAgIFhlbkJsb2NrRGV2aWNlICpibG9ja2RldiA9IFhFTl9CTE9DS19ERVZJQ0UoeGVuZGV2KTsK
ICAgICBjb25zdCBjaGFyICp0eXBlID0gb2JqZWN0X2dldF90eXBlbmFtZShPQkpFQ1QoYmxvY2tk
ZXYpKTsKICAgICBYZW5CbG9ja1ZkZXYgKnZkZXYgPSAmYmxvY2tkZXYtPnByb3BzLnZkZXY7Cisg
ICAgQmxvY2tDb25mICpjb25mID0gJmJsb2NrZGV2LT5wcm9wcy5jb25mOworICAgIHVuc2lnbmVk
IGludCBmZWF0dXJlX2xhcmdlX3NlY3Rvcl9zaXplOwogICAgIHVuc2lnbmVkIGludCBvcmRlciwg
bnJfcmluZ19yZWYsICpyaW5nX3JlZiwgZXZlbnRfY2hhbm5lbCwgcHJvdG9jb2w7CiAgICAgY2hh
ciAqc3RyOwogCiAgICAgdHJhY2VfeGVuX2Jsb2NrX2Nvbm5lY3QodHlwZSwgdmRldi0+ZGlzaywg
dmRldi0+cGFydGl0aW9uKTsKIAorICAgIGlmICh4ZW5fZGV2aWNlX2Zyb250ZW5kX3NjYW5mKHhl
bmRldiwgImZlYXR1cmUtbGFyZ2Utc2VjdG9yLXNpemUiLCAiJXUiLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZmZWF0dXJlX2xhcmdlX3NlY3Rvcl9zaXplKSAhPSAxKSB7Cisg
ICAgICAgIGZlYXR1cmVfbGFyZ2Vfc2VjdG9yX3NpemUgPSAwOworICAgIH0KKworICAgIGlmIChm
ZWF0dXJlX2xhcmdlX3NlY3Rvcl9zaXplICE9IDEgJiYKKyAgICAgICAgY29uZi0+bG9naWNhbF9i
bG9ja19zaXplICE9IFhFTl9CTEtJRl9TRUNUT1JfU0laRSkgeworICAgICAgICBlcnJvcl9zZXRn
KGVycnAsICJsb2dpY2FsX2Jsb2NrX3NpemUgIT0gJXUgbm90IHN1cHBvcnRlZCBieSBmcm9udGVu
ZCIsCisgICAgICAgICAgICAgICAgICAgWEVOX0JMS0lGX1NFQ1RPUl9TSVpFKTsKKyAgICAgICAg
cmV0dXJuOworICAgIH0KKwogICAgIGlmICh4ZW5fZGV2aWNlX2Zyb250ZW5kX3NjYW5mKHhlbmRl
diwgInJpbmctcGFnZS1vcmRlciIsICIldSIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJm9yZGVyKSAhPSAxKSB7CiAgICAgICAgIG5yX3JpbmdfcmVmID0gMTsKQEAgLTE1MCw3
ICsxNjQsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfc2V0X3NpemUoWGVuQmxvY2tEZXZpY2Ug
KmJsb2NrZGV2KQogICAgIGNvbnN0IGNoYXIgKnR5cGUgPSBvYmplY3RfZ2V0X3R5cGVuYW1lKE9C
SkVDVChibG9ja2RldikpOwogICAgIFhlbkJsb2NrVmRldiAqdmRldiA9ICZibG9ja2Rldi0+cHJv
cHMudmRldjsKICAgICBCbG9ja0NvbmYgKmNvbmYgPSAmYmxvY2tkZXYtPnByb3BzLmNvbmY7Ci0g
ICAgaW50NjRfdCBzZWN0b3JzID0gYmxrX2dldGxlbmd0aChjb25mLT5ibGspIC8gWEVOX0JMS0lG
X1NFQ1RPUl9TSVpFOworICAgIGludDY0X3Qgc2VjdG9ycyA9IGJsa19nZXRsZW5ndGgoY29uZi0+
YmxrKSAvIGNvbmYtPmxvZ2ljYWxfYmxvY2tfc2l6ZTsKICAgICBYZW5EZXZpY2UgKnhlbmRldiA9
IFhFTl9ERVZJQ0UoYmxvY2tkZXYpOwogCiAgICAgdHJhY2VfeGVuX2Jsb2NrX3NpemUodHlwZSwg
dmRldi0+ZGlzaywgdmRldi0+cGFydGl0aW9uLCBzZWN0b3JzKTsKQEAgLTE4NSw2ICsxOTksNyBA
QCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfcmVhbGl6ZShYZW5EZXZpY2UgKnhlbmRldiwgRXJyb3Ig
KiplcnJwKQogICAgIGNvbnN0IGNoYXIgKnR5cGUgPSBvYmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVD
VChibG9ja2RldikpOwogICAgIFhlbkJsb2NrVmRldiAqdmRldiA9ICZibG9ja2Rldi0+cHJvcHMu
dmRldjsKICAgICBCbG9ja0NvbmYgKmNvbmYgPSAmYmxvY2tkZXYtPnByb3BzLmNvbmY7CisgICAg
QmxvY2tCYWNrZW5kICpibGsgPSBjb25mLT5ibGs7CiAgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5V
TEw7CiAKICAgICBpZiAodmRldi0+dHlwZSA9PSBYRU5fQkxPQ0tfVkRFVl9UWVBFX0lOVkFMSUQp
IHsKQEAgLTIwNiw4ICsyMjEsOCBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfcmVhbGl6ZShYZW5E
ZXZpY2UgKnhlbmRldiwgRXJyb3IgKiplcnJwKQogICAgICAqIFRoZSBibGtpZiBwcm90b2NvbCBk
b2VzIG5vdCBkZWFsIHdpdGggcmVtb3ZhYmxlIG1lZGlhLCBzbyBpdCBtdXN0CiAgICAgICogYWx3
YXlzIGJlIHByZXNlbnQsIGV2ZW4gZm9yIENEUm9tIGRldmljZXMuCiAgICAgICovCi0gICAgYXNz
ZXJ0KGNvbmYtPmJsayk7Ci0gICAgaWYgKCFibGtfaXNfaW5zZXJ0ZWQoY29uZi0+YmxrKSkgewor
ICAgIGFzc2VydChibGspOworICAgIGlmICghYmxrX2lzX2luc2VydGVkKGJsaykpIHsKICAgICAg
ICAgZXJyb3Jfc2V0ZyhlcnJwLCAiZGV2aWNlIG5lZWRzIG1lZGlhLCBidXQgZHJpdmUgaXMgZW1w
dHkiKTsKICAgICAgICAgcmV0dXJuOwogICAgIH0KQEAgLTIyNCwyNiArMjM5LDIwIEBAIHN0YXRp
YyB2b2lkIHhlbl9ibG9ja19yZWFsaXplKFhlbkRldmljZSAqeGVuZGV2LCBFcnJvciAqKmVycnAp
CiAKICAgICBibGtjb25mX2Jsb2Nrc2l6ZXMoY29uZik7CiAKLSAgICBpZiAoY29uZi0+bG9naWNh
bF9ibG9ja19zaXplICE9IFhFTl9CTEtJRl9TRUNUT1JfU0laRSkgewotICAgICAgICBlcnJvcl9z
ZXRnKGVycnAsICJsb2dpY2FsX2Jsb2NrX3NpemUgIT0gJXUgbm90IHN1cHBvcnRlZCIsCi0gICAg
ICAgICAgICAgICAgICAgWEVOX0JMS0lGX1NFQ1RPUl9TSVpFKTsKLSAgICAgICAgcmV0dXJuOwot
ICAgIH0KLQogICAgIGlmIChjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUgPiBjb25mLT5waHlzaWNh
bF9ibG9ja19zaXplKSB7CiAgICAgICAgIGVycm9yX3NldGcoCiAgICAgICAgICAgICBlcnJwLCAi
bG9naWNhbF9ibG9ja19zaXplID4gcGh5c2ljYWxfYmxvY2tfc2l6ZSBub3Qgc3VwcG9ydGVkIik7
CiAgICAgICAgIHJldHVybjsKICAgICB9CiAKLSAgICBibGtfc2V0X2Rldl9vcHMoY29uZi0+Ymxr
LCAmeGVuX2Jsb2NrX2Rldl9vcHMsIGJsb2NrZGV2KTsKLSAgICBibGtfc2V0X2d1ZXN0X2Jsb2Nr
X3NpemUoY29uZi0+YmxrLCBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUpOworICAgIGJsa19zZXRf
ZGV2X29wcyhibGssICZ4ZW5fYmxvY2tfZGV2X29wcywgYmxvY2tkZXYpOworICAgIGJsa19zZXRf
Z3Vlc3RfYmxvY2tfc2l6ZShibGssIGNvbmYtPmxvZ2ljYWxfYmxvY2tfc2l6ZSk7CiAKICAgICBp
ZiAoY29uZi0+ZGlzY2FyZF9ncmFudWxhcml0eSA9PSAtMSkgewogICAgICAgICBjb25mLT5kaXNj
YXJkX2dyYW51bGFyaXR5ID0gY29uZi0+cGh5c2ljYWxfYmxvY2tfc2l6ZTsKICAgICB9CiAKLSAg
ICBpZiAoYmxrX2dldF9mbGFncyhjb25mLT5ibGspICYgQkRSVl9PX1VOTUFQKSB7CisgICAgaWYg
KGJsa19nZXRfZmxhZ3MoYmxrKSAmIEJEUlZfT19VTk1BUCkgewogICAgICAgICB4ZW5fZGV2aWNl
X2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgImZlYXR1cmUtZGlzY2FyZCIsICIldSIsIDEpOwogICAg
ICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgImRpc2NhcmQtZ3JhbnVsYXJp
dHkiLCAiJXUiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmYtPmRpc2Nh
cmRfZ3JhbnVsYXJpdHkpOwpAQCAtMjYwLDEyICsyNjksMTMgQEAgc3RhdGljIHZvaWQgeGVuX2Js
b2NrX3JlYWxpemUoWGVuRGV2aWNlICp4ZW5kZXYsIEVycm9yICoqZXJycCkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBibG9ja2Rldi0+ZGV2aWNlX3R5cGUpOwogCiAgICAgeGVuX2Rl
dmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJzZWN0b3Itc2l6ZSIsICIldSIsCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBYRU5fQkxLSUZfU0VDVE9SX1NJWkUpOworICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uZi0+bG9naWNhbF9ibG9ja19zaXplKTsKIAogICAgIHhl
bl9ibG9ja19zZXRfc2l6ZShibG9ja2Rldik7CiAKICAgICBibG9ja2Rldi0+ZGF0YXBsYW5lID0K
LSAgICAgICAgeGVuX2Jsb2NrX2RhdGFwbGFuZV9jcmVhdGUoeGVuZGV2LCBjb25mLCBibG9ja2Rl
di0+cHJvcHMuaW90aHJlYWQpOworICAgICAgICB4ZW5fYmxvY2tfZGF0YXBsYW5lX2NyZWF0ZSh4
ZW5kZXYsIGJsaywgY29uZi0+bG9naWNhbF9ibG9ja19zaXplLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBibG9ja2Rldi0+cHJvcHMuaW90aHJlYWQpOwogfQogCiBzdGF0aWMg
dm9pZCB4ZW5fYmxvY2tfZnJvbnRlbmRfY2hhbmdlZChYZW5EZXZpY2UgKnhlbmRldiwKLS0gCkFu
dGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
