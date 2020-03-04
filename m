Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202B17919C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:42:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UFH-0006WD-BT; Wed, 04 Mar 2020 13:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FNX+=4V=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1j9Tk7-0003rb-3K
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:07:19 +0000
X-Inumbo-ID: 1202c57c-5e19-11ea-a3ce-12813bfff9fa
Received: from forwardcorp1o.mail.yandex.net (unknown [95.108.205.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1202c57c-5e19-11ea-a3ce-12813bfff9fa;
 Wed, 04 Mar 2020 13:07:16 +0000 (UTC)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id C66D32E15B5;
 Wed,  4 Mar 2020 16:07:14 +0300 (MSK)
Received: from sas1-9998cec34266.qloud-c.yandex.net
 (sas1-9998cec34266.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:9998:cec3])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Ozy1oH08C4-77ECqaxH; Wed, 04 Mar 2020 16:07:14 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583327234; bh=Buqm9BU7btNF5ftlu+o2Q8ZAjGnwQ5hYELyGAUYeBH0=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=n3wK1KI85tfhFycwUO1cQ8tecrbNpXxSvCBq+7f6hkbXsr3zupioaSUS6AH4ZhxHG
 jj+cpqRdsukX5aSyyVx5n6DiNRd7Fq9hbL8sOTv8SnGaFPrcX4j6pi2NXBA7sIjQY6
 JAGFEjXC0keTAWvEjMfT1DQqd/blA+R42ljmMxv0=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:b4f7:3f29:4fea:8822])
 by sas1-9998cec34266.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ujb0Gsh6CR-76WO2P6J; Wed, 04 Mar 2020 16:07:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Markus Armbruster <armbru@redhat.com>
Date: Wed,  4 Mar 2020 16:06:52 +0300
Message-Id: <20200304130656.16859-1-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 04 Mar 2020 13:39:29 +0000
Subject: [Xen-devel] [PATCH v2 0/4] Introducing QMP query-netdevs command
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhIG5ldyBRTVAgY29tbWFuZCAicXVlcnktbmV0
ZGV2cyIgdG8gZ2V0CmluZm9ybWF0aW9uIGFib3V0IGN1cnJlbnRseSBhdHRhY2hlZCBuZXR3b3Jr
IGRldmljZXMuCkFsc28sIHNpbmNlIHRoZSAiaW5mb19zdHIiIGZpZWxkIG9mICJOZXRDbGllbnRT
dGF0ZSIgaXMgbm93IGRlcHJlY2F0ZWQsCml0IGhhcyBiZWVuIGNvbXBsZXRlbHkgcmVtb3ZlZC4K
VGhlIEhNUCBjb21tYW5kICJpbmZvIG5ldHdvcmsiIG5vdyBhbHNvIHVzZXMgdGhlIG5ldyBRTVAg
Y29tbWFuZCBpbnNpZGUuCgpVc2FnZSBleGFtcGxlOgoKLT4geyAiZXhlY3V0ZSI6ICJxdWVyeS1u
ZXRkZXZzIiB9CjwtIHsgInJldHVybiI6IFsKICAgICAgICAgewogICAgICAgICAgICAgInBlZXIi
OiAibmV0ZGV2MCIsCiAgICAgICAgICAgICAibmV0ZGV2IjogIm5ldGRldjAiLAogICAgICAgICAg
ICAgInBlcm0tbWFjIjogIjUyOjU0OjAwOjEyOjM0OjU2IgogICAgICAgICAgICAgIm1vZGVsIjog
InZpcnRpby1uZXQtcGNpIiwKICAgICAgICAgICAgICJtYWNhZGRyIjogIjUyOjU0OjAwOjEyOjM0
OjU2IiwKICAgICAgICAgICAgICJxdWV1ZXMtY291bnQiOiAxLAogICAgICAgICAgICAgInR5cGUi
OiAibmljIiwKICAgICAgICAgICAgICJpZCI6ICJuZXQwIgogICAgICAgICB9LAogICAgICAgICB7
CiAgICAgICAgICAgICAicGVlciI6ICJuZXQwIiwKICAgICAgICAgICAgICJpcHY2IjogdHJ1ZSwK
ICAgICAgICAgICAgICJpcHY0IjogdHJ1ZSwKICAgICAgICAgICAgICJob3N0IjogIjEwLjAuMi4y
IiwKICAgICAgICAgICAgICJxdWV1ZXMtY291bnQiOiAxLAogICAgICAgICAgICAgImlwdjYtZG5z
IjogImZlYzA6OjMiLAogICAgICAgICAgICAgImlwdjYtcHJlZml4IjogImZlYzA6OiIsCiAgICAg
ICAgICAgICAibmV0IjogIjEwLjAuMi4wLzI1NS4yNTUuMjU1LjAiLAogICAgICAgICAgICAgImlw
djYtaG9zdCI6ICJmZWMwOjoyIiwKICAgICAgICAgICAgICJ0eXBlIjogInVzZXIiLAogICAgICAg
ICAgICAgImRucyI6ICIxMC4wLjIuMyIsCiAgICAgICAgICAgICAiaG9zdGZ3ZCI6IFsKICAgICAg
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICJzdHIiOiAidGNwOjoyMDAwNC06MjIi
CiAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgXSwKICAgICAgICAgICAgICJpcHY2LXBy
ZWZpeGxlbiI6IDY0LAogICAgICAgICAgICAgImlkIjogIm5ldGRldjAiLAogICAgICAgICAgICAg
InJlc3RyaWN0IjogZmFsc2UKICAgICAgICAgfQogICAgIF0KICAgfQoKdjItPnYxOgotIFJld3Jp
dGUgSE1QICJpbmZvIG5ldHdvcmsiIHRvIGdldCBpbmZvcm1hdGlvbiBmcm9tIHJlc3VsdHMgb2Yg
UU1QIGNvbW1hbmQuCi0gUmVtb3ZlIG9ic29sZXRlIGZpZWxkICJpbmZvX3N0ciIgZnJvbSAiTmV0
Q2xpZW50U3RhdGUiLgoKQWxleGV5IEtpcmlsbG92ICg0KToKICBxYXBpOiBuZXQ6IEFkZCBxdWVy
eS1uZXRkZXZzIGNvbW1hbmQKICB0ZXN0czogQWRkIHRlc3RzIGZvciBxdWVyeS1uZXRkZXZzIGNv
bW1hbmQKICBobXA6IFVzZSBRTVAgcXVlcnktbmV0ZGV2cyBpbiBobXBfaW5mb19uZXR3b3JrCiAg
bmV0OiBSZW1vdmUgZmllbGQgaW5mb19zdHIgb2YgTmV0Q2xpZW50U3RhdGUKCiBody9uZXQvYWxs
d2lubmVyX2VtYWMuYyAgICAgICAgICB8ICAgMiArLQogaHcvbmV0L2RwODM5M3guYyAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KIGh3L25ldC9lMTAwMC5jICAgICAgICAgICAgICAgICAgIHwgICA0
ICstCiBody9uZXQvZTEwMDBlLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQogaHcvbmV0L2Ux
MDAwZV9jb3JlLmMgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L25ldC9lMTAwMHhfY29tbW9uLmMg
ICAgICAgICAgIHwgICAyICstCiBody9uZXQvZWVwcm8xMDAuYyAgICAgICAgICAgICAgICB8ICAg
NSArLQogaHcvbmV0L2V0cmF4ZnNfZXRoLmMgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L25ldC9m
c2xfZXRzZWMvZXRzZWMuYyAgICAgICAgIHwgICAyICstCiBody9uZXQvZnRnbWFjMTAwLmMgICAg
ICAgICAgICAgICB8ICAgMiArLQogaHcvbmV0L2k4MjU5Ni5jICAgICAgICAgICAgICAgICAgfCAg
IDYgKy0KIGh3L25ldC9pbXhfZmVjLmMgICAgICAgICAgICAgICAgIHwgICAyICstCiBody9uZXQv
bGFuOTExOC5jICAgICAgICAgICAgICAgICB8ICAgNCArLQogaHcvbmV0L21jZl9mZWMuYyAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0KIGh3L25ldC9taWxreW1pc3QtbWluaW1hYzIuYyAgICAgIHwg
ICAyICstCiBody9uZXQvbWlwc25ldC5jICAgICAgICAgICAgICAgICB8ICAgMiArLQogaHcvbmV0
L25lMjAwMC1pc2EuYyAgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L25ldC9uZTIwMDAtcGNpLmMg
ICAgICAgICAgICAgIHwgICAyICstCiBody9uZXQvcGNuZXQuYyAgICAgICAgICAgICAgICAgICB8
ICAgMiArLQogaHcvbmV0L3JvY2tlci9yb2NrZXJfZnAuYyAgICAgICAgfCAgIDQgKy0KIGh3L25l
dC9ydGw4MTM5LmMgICAgICAgICAgICAgICAgIHwgICA2ICstCiBody9uZXQvc21jOTFjMTExLmMg
ICAgICAgICAgICAgICB8ICAgMiArLQogaHcvbmV0L3NwYXByX2xsYW4uYyAgICAgICAgICAgICAg
fCAgIDYgKy0KIGh3L25ldC9zdGVsbGFyaXNfZW5ldC5jICAgICAgICAgIHwgICAyICstCiBody9u
ZXQvc3VuZ2VtLmMgICAgICAgICAgICAgICAgICB8ICAgNCArLQogaHcvbmV0L3N1bmhtZS5jICAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L25ldC90dWxpcC5jICAgICAgICAgICAgICAgICAg
IHwgICAyICstCiBody9uZXQvdmlydGlvLW5ldC5jICAgICAgICAgICAgICB8ICAgOCArLQogaHcv
bmV0L3ZteG5ldDMuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGh3L25ldC94ZW5fbmljLmMg
ICAgICAgICAgICAgICAgIHwgICA0IC0KIGh3L25ldC94Z21hYy5jICAgICAgICAgICAgICAgICAg
IHwgICAyICstCiBody9uZXQveGlsaW54X2F4aWVuZXQuYyAgICAgICAgICB8ICAgMiArLQogaHcv
bmV0L3hpbGlueF9ldGhsaXRlLmMgICAgICAgICAgfCAgIDIgKy0KIGh3L3VzYi9kZXYtbmV0d29y
ay5jICAgICAgICAgICAgIHwgICAyICstCiBpbmNsdWRlL25ldC9uZXQuaCAgICAgICAgICAgICAg
ICB8ICAgNyArLQogbmV0L2NsaWVudHMuaCAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogbmV0
L2h1Yi5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKy0KIG5ldC9odWIuaCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAyICstCiBuZXQvbDJ0cHYzLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAyMCArKy0KIG5ldC9uZXQuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjcyICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0KIG5ldC9uZXRtYXAuYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDEzICsrCiBuZXQvc2xpcnAuYyAgICAgICAgICAgICAgICAgICAgICB8IDEyOCArKysr
KysrKysrKysrKy0KIG5ldC9zb2NrZXQuYyAgICAgICAgICAgICAgICAgICAgIHwgIDkzICsrKysr
KysrLS0tCiBuZXQvdGFwLXdpbjMyLmMgICAgICAgICAgICAgICAgICB8ICAgOSArCiBuZXQvdGFw
LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwNyArKysrKysrKysrLS0KIG5ldC92ZGUuYyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQwICsrKystCiBuZXQvdmhvc3QtdXNlci5jICAgICAg
ICAgICAgICAgICB8ICAyMCArKy0KIHFhcGkvbmV0Lmpzb24gICAgICAgICAgICAgICAgICAgIHwg
IDg5ICsrKysrKysrKysKIHRlc3RzL3F0ZXN0L01ha2VmaWxlLmluY2x1ZGUgICAgIHwgICAyICsK
IHRlc3RzL3F0ZXN0L3Rlc3QtcXVlcnktbmV0ZGV2cy5jIHwgMTIwICsrKysrKysrKysrKysrCiA1
MCBmaWxlcyBjaGFuZ2VkLCA5MTcgaW5zZXJ0aW9ucygrKSwgMTE5IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0L3Rlc3QtcXVlcnktbmV0ZGV2cy5jCgotLSAKMi4x
Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
