Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C725A140878
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:57:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGY-0004rw-F7; Fri, 17 Jan 2020 10:54:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGW-0004rm-TO
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:12 +0000
X-Inumbo-ID: ad953898-3917-11ea-88b0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad953898-3917-11ea-88b0-12813bfff9fa;
 Fri, 17 Jan 2020 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BaVL54Bogf22hBGa7/sAqmT8wuvNZRQ1/2NJj3UBFd0=;
 b=KAV/BxKfLKTkHA7ctSnpMFWvXBN+bFHq+iL3y/xtbwzxWDRK2UxyKRmv
 YySzaSYcxvo7TCl6Tcv+pRgK/jILPrYPMThR5JbNGUu9B4bbMpomwzEAt
 q1CQXdi3hzAkhyQBGgWewnxSTZ1TeR23rEnZV+nFvkgtzrcAs9+1ycMiA E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CgK8RSRYP93o4sJcM7pfI3F88EkDAWf6XUZ2sXgXh1BlTfIMK0eb2ZRcjF4RVm1ENbtl8zFyxd
 soFOFNcYR8YpKCzxysRK+4ph0X/M3EAXUIpSyVJNQP5vtsdV7KTxBYk70D6vi57SgcHQnjFOpT
 /dTXfOK1WcQ6RejjSeKducrs5KgxVRYPkNOIfRNeGKiCreEso9xvG2AkpAPI1eDVot5TeL80fI
 ZYNGVDeRHwQwCAHbCb2PmuurLQWuF54cf0/6nyAsRIZep1kjKCnPYGp8ArdbxTGMC23FKnBQAU
 kNE=
X-SBRS: 2.7
X-MesageID: 11432449
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432449"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:50 +0000
Message-ID: <20200117105358.607910-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 04/12] xen/build: extract clean target
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
YW4KdGFyZ2V0LCBlc3BlY2lhbGx5IG5vdCB0aGUgQ0ZMQUdTLiBUaGlzIG1ha2UgcnVubmluZyBt
YWtlIGNsZWFuIG11Y2gKZmFzdGVyLgoKVGhpcyBleHRyYWN0IHRoZSBjb2RlIGludG8gYSBkaWZm
ZXJlbnQgTWFrZWZpbGUuIEl0IGRvZXNuJ3Qgd2FudCB0bwppbmNsdWRlIENvbmZpZy5tayBlaXRo
ZXIgc28gdmFyaWFibGVzIERFUFNfUk0gYW5kIERFUFNfSU5DTFVERSBhcmUKZXh0cmFjdGVkIGZy
b20gQ29uZmlnLm1rIGFzIHdlbGwuIERFUFNfSU5DTFVERSBpcyBwdXQgaW50bwpLYnVpbGQuaW5j
bHVkZSBzbyBpdCBjb3VsZCBiZSB1c2UgYnkgb3RoZXIgTWFrZWZpbGVzLgoKVGhpcyBpcyBpbnNw
aXJlZCBieSBLYnVpbGQsIHdpdGggTWFrZWZpbGUuY2xlYW4gcGFydGlhbGx5IGNvcGllZCBmcm9t
CkxpbnV4IHY1LjQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vUnVsZXMubWsgICAgICAgICAgICAgICB8IDEzIC0tLS0t
LS0tLS0tLS0KIHhlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlIHwgIDcgKysrKysrLQogeGVuL3Nj
cmlwdHMvTWFrZWZpbGUuY2xlYW4gfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDMgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL3NjcmlwdHMvTWFrZWZpbGUuY2xlYW4KCmRpZmYgLS1naXQg
YS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggMTIwMzIzNzE3ZDg3Li5kZWFiMGFi
ZDYzZTEgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAgLTk0
LDggKzk0LDYgQEAgTERGTEFHUyArPSAkKExERkxBR1MteSkKIAogaW5jbHVkZSAkKEJBU0VESVIp
L2FyY2gvJChUQVJHRVRfQVJDSCkvUnVsZXMubWsKIAotREVQUyA9IC4qLmQKLQogaW5jbHVkZSBN
YWtlZmlsZQogCiBkZWZpbmUgZ2VuZGVwCkBAIC0xMTMsMTEgKzExMSw2IEBAIF9fc3ViZGlyLXkJ
Oj0gJChmaWx0ZXIgJS8sICQob2JqLXkpKQogc3ViZGlyLXkJKz0gJChfX3N1YmRpci15KQogb2Jq
LXkJCTo9ICQocGF0c3Vic3QgJS8sICUvYnVpbHRfaW4ubywgJChvYmoteSkpCiAKLXN1YmRpci1u
IDo9ICQoc3ViZGlyLW4pICQoc3ViZGlyLSkgXAotCQkkKGZpbHRlciAlLywgJChvYmotbikgJChv
YmotKSkKLQotc3ViZGlyLWFsbCA6PSAkKHN1YmRpci15KSAkKHN1YmRpci1uKQotCiAkKGZpbHRl
ciAlLmluaXQubywkKG9iai15KSAkKG9iai1iaW4teSkgJChleHRyYS15KSk6IENGTEFHUyArPSAt
RElOSVRfU0VDVElPTlNfT05MWQogCiBpZmVxICgkKENPTkZJR19DT1ZFUkFHRSkseSkKQEAgLTE4
MSwxMiArMTc0LDYgQEAgRk9SQ0U6CiAlL2J1aWx0X2luX2Jpbi5vOiBGT1JDRQogCSQoTUFLRSkg
LWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyAkKiBidWlsdF9pbl9iaW4ubwogCi0uUEhPTlk6IGNs
ZWFuCi1jbGVhbjo6ICQoYWRkcHJlZml4IF9jbGVhbl8sICQoc3ViZGlyLWFsbCkpCi0Jcm0gLWYg
Ki5vIC4qLm8udG1wICp+IGNvcmUgJChERVBTX1JNKQotX2NsZWFuXyUvOiBGT1JDRQotCSQoTUFL
RSkgJChjbGVhbikgJCoKLQogU1JDUEFUSCA6PSAkKHBhdHN1YnN0ICQoQkFTRURJUikvJSwlLCQo
Q1VSRElSKSkKIAogJS5vOiAlLmMgTWFrZWZpbGUKZGlmZiAtLWdpdCBhL3hlbi9zY3JpcHRzL0ti
dWlsZC5pbmNsdWRlIGIveGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUKaW5kZXggMjQ2NWNjNDA2
MGMzLi42YTliMGMzOWRhNTMgMTAwNjQ0Ci0tLSBhL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRl
CisrKyBiL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCkBAIC0yLDYgKzIsMTEgQEAKICMjIyMK
ICMga2J1aWxkOiBHZW5lcmljIGRlZmluaXRpb25zCiAKKyMjIworIyBkZXBlbmRlbmNpZXMKK0RF
UFMgPSAuKi5kCitERVBTX0lOQ0xVREUgPSAkKGFkZHN1ZmZpeCAuZDIsICQoYmFzZW5hbWUgJCh3
aWxkY2FyZCAkKERFUFMpKSkpCisKICMgY2MtaWZ2ZXJzaW9uCiAjIFVzYWdlOiAgRVhUUkFfQ0ZM
QUdTICs9ICQoY2FsbCBjYy1pZnZlcnNpb24sIC1sdCwgMDQwMiwgLU8xKQogY2MtaWZ2ZXJzaW9u
ID0gJChzaGVsbCBbICQoQ09ORklHX0dDQ19WRVJTSU9OKTAgJCgxKSAkKDIpMDAwIF0gJiYgZWNo
byAkKDMpIHx8IGVjaG8gJCg0KSkKQEAgLTksNCArMTQsNCBAQCBjYy1pZnZlcnNpb24gPSAkKHNo
ZWxsIFsgJChDT05GSUdfR0NDX1ZFUlNJT04pMCAkKDEpICQoMikwMDAgXSAmJiBlY2hvICQoMykg
fHwgZQogIyBTaG9ydGhhbmQgZm9yICQoTUFLRSkgY2xlYW4KICMgVXNhZ2U6CiAjICQoTUFLRSkg
JChjbGVhbikgZGlyCi1jbGVhbiA6PSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIGNsZWFuIC1DCitj
bGVhbiA6PSAtZiAkKEJBU0VESVIpL3NjcmlwdHMvTWFrZWZpbGUuY2xlYW4gY2xlYW4gLUMKZGlm
ZiAtLWdpdCBhL3hlbi9zY3JpcHRzL01ha2VmaWxlLmNsZWFuIGIveGVuL3NjcmlwdHMvTWFrZWZp
bGUuY2xlYW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zMWNmMmI1
OTU5NGUKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vc2NyaXB0cy9NYWtlZmlsZS5jbGVhbgpAQCAt
MCwwICsxLDMzIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisjID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09CisjIENsZWFuaW5nIHVwCisjID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisKK2NsZWFu
OjoKKworaW5jbHVkZSAkKEJBU0VESVIpL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUKKworaW5jbHVk
ZSBNYWtlZmlsZQorCisjIEZpZ3VyZSBvdXQgd2hhdCB3ZSBuZWVkIHRvIGJ1aWxkIGZyb20gdGhl
IHZhcmlvdXMgdmFyaWFibGVzCisjID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CitfX3N1YmRpci15CTo9ICQo
ZmlsdGVyICUvLCAkKG9iai15KSkKK3N1YmRpci15CSs9ICQoX19zdWJkaXIteSkKK3N1YmRpci1u
IDo9ICQoc3ViZGlyLW4pICQoc3ViZGlyLSkgXAorCQkkKGZpbHRlciAlLywgJChvYmotbikgJChv
YmotKSkKK3N1YmRpci1hbGwgOj0gJChzdWJkaXIteSkgJChzdWJkaXItbikKKworREVQU19STSA9
ICQoREVQUykgJChERVBTX0lOQ0xVREUpCisuUEhPTlk6IGNsZWFuCitjbGVhbjo6ICQoYWRkcHJl
Zml4IF9jbGVhbl8sICQoc3ViZGlyLWFsbCkpCisJcm0gLWYgKi5vIC4qLm8udG1wICp+IGNvcmUg
JChERVBTX1JNKQorCisjIERlc2NlbmRpbmcKKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK19jbGVh
bl8lLzogRk9SQ0UKKwkkKE1BS0UpICQoY2xlYW4pICQqCisKKyMgRm9yY2UgZXhlY3V0aW9uIG9m
IHBhdHRlcm4gcnVsZXMgKGZvciB3aGljaCBQSE9OWSBjYW5ub3QgYmUgZGlyZWN0bHkgdXNlZCku
CisuUEhPTlk6IEZPUkNFCitGT1JDRToKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
