Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70080487A6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:43:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctky-0008M6-Qm; Mon, 17 Jun 2019 15:41:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JT4l=UQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hctkw-0008LU-Va
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:41:15 +0000
X-Inumbo-ID: 561209d7-9116-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 561209d7-9116-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 15:41:13 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m8p7QSPWyD6XAlP0UCvQs8rrSZpRFRITJnOmdhyixFTQF+HI+KTQhyUcxt3Wzbd7aww30IHafu
 PM5jGuamTqsXMfNgjC99ipQShn66hGYE8f+KNXYQGtgGZVaRFmHSrH+ae4Dre9+jkV9DC+LWt6
 JrBm9ctvIIWM+cZRKH8V2TqzoaUlO2KVzqrzfkOrO+e/KOBKtTkpsyAQ1v0P/qHm02McQ3MEwM
 Nhx3hbhykEwGGG6ukfgPV9rLzbAfAVcMH5YwFtVkW2x9S/i9zwxBEBNmVfaxHfFd31t0mJLB6N
 9Lc=
X-SBRS: 2.7
X-MesageID: 1846122
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1846122"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 17 Jun 2019 16:41:05 +0100
Message-ID: <20190617154105.32323-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617154105.32323-1-anthony.perard@citrix.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] xen: Avoid VLA
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXZvaWQgdXNpbmcgYSB2YXJpYWJsZSBsZW5ndGggYXJyYXkuCgpTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIFdh
cyBzdWdnZXN0ZWQgYnkgUGV0ZXIgaGVyZToKICAgIDxDQUZFQWNBODgrQTJvQ2tRbnhLREVkcG1m
Q1pTbVB6V01CZzAxd0REVjY4Yk1ab1k1SmdAbWFpbC5nbWFpbC5jb20+CiAgICAic2hvdWxkIHdl
IHRyeSB0byBzdG9wIHVzaW5nIHZhcmlhYmxlIGxlbmd0aCBhcnJheXM/IgoKIGh3L2kzODYveGVu
L3hlbi1odm0uYyB8IDExICsrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1odm0uYyBi
L2h3L2kzODYveGVuL3hlbi1odm0uYwppbmRleCA3MjVmOWMyMjc4Li4xMGQ3M2I1NWI0IDEwMDY0
NAotLS0gYS9ody9pMzg2L3hlbi94ZW4taHZtLmMKKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5j
CkBAIC02MTUsNyArNjE1LDggQEAgc3RhdGljIHZvaWQgeGVuX3N5bmNfZGlydHlfYml0bWFwKFhl
bklPU3RhdGUgKnN0YXRlLAogewogICAgIGh3YWRkciBucGFnZXMgPSBzaXplID4+IFRBUkdFVF9Q
QUdFX0JJVFM7CiAgICAgY29uc3QgaW50IHdpZHRoID0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICog
ODsKLSAgICB1bnNpZ25lZCBsb25nIGJpdG1hcFtESVZfUk9VTkRfVVAobnBhZ2VzLCB3aWR0aCld
OworICAgIHVuc2lnbmVkIGxvbmcgKmJpdG1hcCA9IE5VTEw7CisgICAgc2l6ZV90IGJpdG1hcF9z
aXplID0gRElWX1JPVU5EX1VQKG5wYWdlcywgd2lkdGgpOwogICAgIGludCByYywgaSwgajsKICAg
ICBjb25zdCBYZW5QaHlzbWFwICpwaHlzbWFwID0gTlVMTDsKIApAQCAtNjMyLDYgKzYzMyw4IEBA
IHN0YXRpYyB2b2lkIHhlbl9zeW5jX2RpcnR5X2JpdG1hcChYZW5JT1N0YXRlICpzdGF0ZSwKICAg
ICAgICAgcmV0dXJuOwogICAgIH0KIAorICAgIGJpdG1hcCA9IGdfbmV3MCh1bnNpZ25lZCBsb25n
LCBiaXRtYXBfc2l6ZSk7CisKICAgICByYyA9IHhlbl90cmFja19kaXJ0eV92cmFtKHhlbl9kb21p
ZCwgc3RhcnRfYWRkciA+PiBUQVJHRVRfUEFHRV9CSVRTLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbnBhZ2VzLCBiaXRtYXApOwogICAgIGlmIChyYyA8IDApIHsKQEAgLTY0NCwxMCAr
NjQ3LDEwIEBAIHN0YXRpYyB2b2lkIHhlbl9zeW5jX2RpcnR5X2JpdG1hcChYZW5JT1N0YXRlICpz
dGF0ZSwKICAgICAgICAgICAgICAgICAgICAgIiwgMHgiIFRBUkdFVF9GTVRfcGx4ICIpOiAlc1xu
IiwKICAgICAgICAgICAgICAgICAgICAgc3RhcnRfYWRkciwgc3RhcnRfYWRkciArIHNpemUsIHN0
cmVycm9yKGVycm5vKSk7CiAgICAgICAgIH0KLSAgICAgICAgcmV0dXJuOworICAgICAgICBnb3Rv
IG91dDsKICAgICB9CiAKLSAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShiaXRtYXApOyBp
KyspIHsKKyAgICBmb3IgKGkgPSAwOyBpIDwgYml0bWFwX3NpemU7IGkrKykgewogICAgICAgICB1
bnNpZ25lZCBsb25nIG1hcCA9IGJpdG1hcFtpXTsKICAgICAgICAgd2hpbGUgKG1hcCAhPSAwKSB7
CiAgICAgICAgICAgICBqID0gY3R6bChtYXApOwpAQCAtNjU3LDYgKzY2MCw4IEBAIHN0YXRpYyB2
b2lkIHhlbl9zeW5jX2RpcnR5X2JpdG1hcChYZW5JT1N0YXRlICpzdGF0ZSwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFRBUkdFVF9QQUdFX1NJWkUpOwogICAgICAgICB9Owog
ICAgIH0KK291dDoKKyAgICBnX2ZyZWUoYml0bWFwKTsKIH0KIAogc3RhdGljIHZvaWQgeGVuX2xv
Z19zdGFydChNZW1vcnlMaXN0ZW5lciAqbGlzdGVuZXIsCi0tIApBbnRob255IFBFUkFSRAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
