Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055817919B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:42:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UFH-0006WP-Tu; Wed, 04 Mar 2020 13:39:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FNX+=4V=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1j9TkH-0003sU-8K
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:07:29 +0000
X-Inumbo-ID: 16f03344-5e19-11ea-8eb5-bc764e2007e4
Received: from forwardcorp1j.mail.yandex.net (unknown [5.45.199.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16f03344-5e19-11ea-8eb5-bc764e2007e4;
 Wed, 04 Mar 2020 13:07:24 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id E6B6B2E1695;
 Wed,  4 Mar 2020 16:07:22 +0300 (MSK)
Received: from sas1-9998cec34266.qloud-c.yandex.net
 (sas1-9998cec34266.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:9998:cec3])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 fDcZyQkbLf-7JJKZglc; Wed, 04 Mar 2020 16:07:22 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583327242; bh=RzA7COy6OjGENVG5q5PdG3mDLFc4iPpo75ImpI9/idQ=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=InvlNaS+6VR8q2ihOkE87gsAyKN7LhYTRQObXdwhw7Zc39oH3dBVLg1PkzoD/5Iox
 vh7w995083AolKuaLn3q1GpsyysEnHLG2OLsBtnFS8alONLPesN/dQ7rIZA+K2jHsb
 JemjMrst8VWPU1Y0q5zVcEzSdnyOG+Osf3rwfgbE=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:b4f7:3f29:4fea:8822])
 by sas1-9998cec34266.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ujb0Gsh6CR-7IWOaIsp; Wed, 04 Mar 2020 16:07:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Markus Armbruster <armbru@redhat.com>
Date: Wed,  4 Mar 2020 16:06:54 +0300
Message-Id: <20200304130656.16859-3-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304130656.16859-1-lekiravi@yandex-team.ru>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
X-Mailman-Approved-At: Wed, 04 Mar 2020 13:39:29 +0000
Subject: [Xen-devel] [PATCH v2 2/4] tests: Add tests for query-netdevs
 command
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 yc-core@yandex-team.ru, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Alexey Kirillov <lekiravi@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQWxleGV5IEtpcmlsbG92IDxsZWtpcmF2aUB5YW5kZXgtdGVhbS5ydT4K
LS0tCiB0ZXN0cy9xdGVzdC9NYWtlZmlsZS5pbmNsdWRlICAgICB8ICAgMiArCiB0ZXN0cy9xdGVz
dC90ZXN0LXF1ZXJ5LW5ldGRldnMuYyB8IDEyMCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgdGVzdHMvcXRlc3QvdGVzdC1xdWVyeS1uZXRkZXZzLmMKCmRpZmYgLS1naXQgYS90ZXN0cy9x
dGVzdC9NYWtlZmlsZS5pbmNsdWRlIGIvdGVzdHMvcXRlc3QvTWFrZWZpbGUuaW5jbHVkZQppbmRl
eCBlNzY5YzFhZDcwLi42OTI0ODQzZWY5IDEwMDY0NAotLS0gYS90ZXN0cy9xdGVzdC9NYWtlZmls
ZS5pbmNsdWRlCisrKyBiL3Rlc3RzL3F0ZXN0L01ha2VmaWxlLmluY2x1ZGUKQEAgLTksNiArOSw3
IEBAIGNoZWNrLXF0ZXN0LWdlbmVyaWMteSArPSBxbXAtY21kLXRlc3QKIGNoZWNrLXF0ZXN0LWdl
bmVyaWMteSArPSBxb20tdGVzdAogY2hlY2stcXRlc3QtZ2VuZXJpYy0kKENPTkZJR19NT0RVTEVT
KSArPSBtb2R1bGVzLXRlc3QKIGNoZWNrLXF0ZXN0LWdlbmVyaWMteSArPSB0ZXN0LWhtcAorY2hl
Y2stcXRlc3QtZ2VuZXJpYy0kKENPTkZJR19TTElSUCkgKz0gdGVzdC1xdWVyeS1uZXRkZXZzCiAK
IGNoZWNrLXF0ZXN0LXBjaS0kKENPTkZJR19SVEw4MTM5X1BDSSkgKz0gcnRsODEzOS10ZXN0CiBj
aGVjay1xdGVzdC1wY2ktJChDT05GSUdfVkdBKSArPSBkaXNwbGF5LXZnYS10ZXN0CkBAIC0zMDMs
NiArMzA0LDcgQEAgdGVzdHMvcXRlc3QvdHBtLWNyYi10ZXN0JChFWEVTVUYpOiB0ZXN0cy9xdGVz
dC90cG0tY3JiLXRlc3QubyB0ZXN0cy9xdGVzdC90cG0tZW0KIHRlc3RzL3F0ZXN0L3RwbS10aXMt
c3d0cG0tdGVzdCQoRVhFU1VGKTogdGVzdHMvcXRlc3QvdHBtLXRpcy1zd3RwbS10ZXN0Lm8gdGVz
dHMvcXRlc3QvdHBtLWVtdS5vIFwKIAl0ZXN0cy9xdGVzdC90cG0tdXRpbC5vIHRlc3RzL3F0ZXN0
L3RwbS10ZXN0cy5vICQodGVzdC1pby1vYmoteSkKIHRlc3RzL3F0ZXN0L3RwbS10aXMtdGVzdCQo
RVhFU1VGKTogdGVzdHMvcXRlc3QvdHBtLXRpcy10ZXN0Lm8gdGVzdHMvcXRlc3QvdHBtLWVtdS5v
ICQodGVzdC1pby1vYmoteSkKK3Rlc3RzL3F0ZXN0L3Rlc3QtcXVlcnktbmV0ZGV2cyQoRVhFU1VG
KTogdGVzdHMvcXRlc3QvdGVzdC1xdWVyeS1uZXRkZXZzLm8KIAogIyBRVGVzdCBydWxlcwogCmRp
ZmYgLS1naXQgYS90ZXN0cy9xdGVzdC90ZXN0LXF1ZXJ5LW5ldGRldnMuYyBiL3Rlc3RzL3F0ZXN0
L3Rlc3QtcXVlcnktbmV0ZGV2cy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmUwNzczNThhNTAKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0cy9xdGVzdC90ZXN0LXF1ZXJ5
LW5ldGRldnMuYwpAQCAtMCwwICsxLDEyMCBAQAorLyoKKyAqIFFUZXN0IHRlc3RjYXNlIGZvciB0
aGUgcXVlcnktbmV0ZGV2cworICoKKyAqIENvcHlyaWdodCBZYW5kZXggTi5WLiwgMjAxOQorICoK
KyAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEws
IHZlcnNpb24gMiBvciBsYXRlci4KKyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3At
bGV2ZWwgZGlyZWN0b3J5LgorICoKKyAqLworCisjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorCisj
aW5jbHVkZSAibGlicXRlc3QuaCIKKyNpbmNsdWRlICJxYXBpL3FtcC9xZGljdC5oIgorI2luY2x1
ZGUgInFhcGkvcW1wL3FsaXN0LmgiCisKKy8qCisgKiBFdmVudHMgY2FuIGdldCBpbiB0aGUgd2F5
IG9mIHJlc3BvbnNlcyB3ZSBhcmUgYWN0dWFsbHkgd2FpdGluZyBmb3IuCisgKi8KK0dDQ19GTVRf
QVRUUigyLCAzKQorc3RhdGljIFFPYmplY3QgKndhaXRfY29tbWFuZChRVGVzdFN0YXRlICp3aG8s
IGNvbnN0IGNoYXIgKmNvbW1hbmQsIC4uLikKK3sKKyAgICB2YV9saXN0IGFwOworICAgIFFEaWN0
ICpyZXNwb25zZTsKKyAgICBRT2JqZWN0ICpyZXN1bHQ7CisKKyAgICB2YV9zdGFydChhcCwgY29t
bWFuZCk7CisgICAgcXRlc3RfcW1wX3ZzZW5kKHdobywgY29tbWFuZCwgYXApOworICAgIHZhX2Vu
ZChhcCk7CisKKyAgICByZXNwb25zZSA9IHF0ZXN0X3FtcF9yZWNlaXZlKHdobyk7CisKKyAgICBy
ZXN1bHQgPSBxZGljdF9nZXQocmVzcG9uc2UsICJyZXR1cm4iKTsKKyAgICBnX2Fzc2VydChyZXN1
bHQpOworICAgIHFvYmplY3RfcmVmKHJlc3VsdCk7CisgICAgcW9iamVjdF91bnJlZihyZXNwb25z
ZSk7CisKKyAgICByZXR1cm4gcmVzdWx0OworfQorCitzdGF0aWMgdm9pZCBxbXBfcXVlcnlfbmV0
ZGV2c19ub19lcnJvcihRVGVzdFN0YXRlICpxdHMsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplX3QgbmV0ZGV2c19jb3VudCkKK3sKKyAgICBRT2JqZWN0ICpyZXNw
OworICAgIFFMaXN0ICpuZXRkZXZzOworCisgICAgcmVzcCA9IHdhaXRfY29tbWFuZChxdHMsICJ7
J2V4ZWN1dGUnOiAncXVlcnktbmV0ZGV2cyd9Iik7CisKKyAgICBuZXRkZXZzID0gcW9iamVjdF90
byhRTGlzdCwgcmVzcCk7CisgICAgZ19hc3NlcnQobmV0ZGV2cyk7CisgICAgZ19hc3NlcnQocWxp
c3Rfc2l6ZShuZXRkZXZzKSA9PSBuZXRkZXZzX2NvdW50KTsKKworICAgIHFvYmplY3RfdW5yZWYo
cmVzcCk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfcXVlcnlfbmV0ZGV2cyh2b2lkKQoreworICAg
IGNvbnN0IGNoYXIgKmFyY2ggPSBxdGVzdF9nZXRfYXJjaCgpOworICAgIHNpemVfdCBjb3JyZWN0
aW9uID0gMDsKKyAgICBRT2JqZWN0ICpyZXNwOworICAgIFFUZXN0U3RhdGUgKnN0YXRlOworCisg
ICAgLyogQXJjaHMgd2hpY2ggc3RpbGwgaGF2ZSBhIG5ldGRldiBkZXNwaXRlIG9mIC1ub2RlZmF1
bHRzICovCisgICAgaWYgKGdfc3RyX2VxdWFsKGFyY2gsICJjcmlzIikgfHwKKyAgICAgICAgZ19z
dHJfZXF1YWwoYXJjaCwgIm1pY3JvYmxhemUiKSB8fAorICAgICAgICBnX3N0cl9lcXVhbChhcmNo
LCAibWljcm9ibGF6ZWVsIikgfHwKKyAgICAgICAgZ19zdHJfZXF1YWwoYXJjaCwgInNwYXJjIikp
IHsKKyAgICAgICAgY29ycmVjdGlvbiA9IDE7CisgICAgfQorCisgICAgaWYgKGdfc3RyX2VxdWFs
KGFyY2gsICJhcm0iKSB8fAorICAgICAgICBnX3N0cl9lcXVhbChhcmNoLCAiYWFyY2g2NCIpKSB7
CisgICAgICAgIHN0YXRlID0gcXRlc3RfaW5pdCgKKyAgICAgICAgICAgICItbm9kZWZhdWx0cyAi
CisgICAgICAgICAgICAiLU0gdmlydCAiCisgICAgICAgICAgICAiLW5ldGRldiB1c2VyLGlkPXNs
aXJwMCIpOworICAgIH0gZWxzZSBpZiAoZ19zdHJfZXF1YWwoYXJjaCwgInRyaWNvcmUiKSkgewor
ICAgICAgICBzdGF0ZSA9IHF0ZXN0X2luaXQoCisgICAgICAgICAgICAiLW5vZGVmYXVsdHMgIgor
ICAgICAgICAgICAgIi1NIHRyaWNvcmVfdGVzdGJvYXJkICIKKyAgICAgICAgICAgICItbmV0ZGV2
IHVzZXIsaWQ9c2xpcnAwIik7CisgICAgfSBlbHNlIHsKKyAgICAgICAgc3RhdGUgPSBxdGVzdF9p
bml0KAorICAgICAgICAgICAgIi1ub2RlZmF1bHRzICIKKyAgICAgICAgICAgICItbmV0ZGV2IHVz
ZXIsaWQ9c2xpcnAwIik7CisgICAgfQorICAgIGdfYXNzZXJ0KHN0YXRlKTsKKworICAgIHFtcF9x
dWVyeV9uZXRkZXZzX25vX2Vycm9yKHN0YXRlLCAxICsgY29ycmVjdGlvbik7CisKKyAgICByZXNw
ID0gd2FpdF9jb21tYW5kKHN0YXRlLAorICAgICAgICAieydleGVjdXRlJzogJ25ldGRldl9hZGQn
LCAnYXJndW1lbnRzJzogeyIKKyAgICAgICAgIiAnaWQnOiAnc2xpcnAxJywiCisgICAgICAgICIg
J3R5cGUnOiAndXNlcid9fSIpOworICAgIHFvYmplY3RfdW5yZWYocmVzcCk7CisKKyAgICBxbXBf
cXVlcnlfbmV0ZGV2c19ub19lcnJvcihzdGF0ZSwgMiArIGNvcnJlY3Rpb24pOworCisgICAgcmVz
cCA9IHdhaXRfY29tbWFuZChzdGF0ZSwKKyAgICAgICAgInsnZXhlY3V0ZSc6ICduZXRkZXZfZGVs
JywgJ2FyZ3VtZW50cyc6IHsiCisgICAgICAgICIgJ2lkJzogJ3NsaXJwMSd9fSIpOworICAgIHFv
YmplY3RfdW5yZWYocmVzcCk7CisKKyAgICBxbXBfcXVlcnlfbmV0ZGV2c19ub19lcnJvcihzdGF0
ZSwgMSArIGNvcnJlY3Rpb24pOworCisgICAgcXRlc3RfcXVpdChzdGF0ZSk7Cit9CisKK2ludCBt
YWluKGludCBhcmdjLCBjaGFyICoqYXJndikKK3sKKyAgICBpbnQgcmV0ID0gMDsKKyAgICBnX3Rl
c3RfaW5pdCgmYXJnYywgJmFyZ3YsIE5VTEwpOworCisgICAgcXRlc3RfYWRkX2Z1bmMoIi9uZXQv
cWFwaS9xdWVyeV9uZXRkZXZzIiwKKyAgICAgICAgdGVzdF9xdWVyeV9uZXRkZXZzKTsKKworICAg
IHJldCA9IGdfdGVzdF9ydW4oKTsKKworICAgIHJldHVybiByZXQ7Cit9Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
