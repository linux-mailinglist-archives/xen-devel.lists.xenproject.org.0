Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC55017A4E4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:06:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9pDs-0004m2-Ej; Thu, 05 Mar 2020 12:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7+wn=4W=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1j9pDq-0004lx-CR
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:03:26 +0000
X-Inumbo-ID: 5174a8ea-5ed9-11ea-b74d-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5174a8ea-5ed9-11ea-b74d-bc764e2007e4;
 Thu, 05 Mar 2020 12:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583409805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jy5m06Y1gfVleTehqDJPHx/Z3tuSrj2h9J7pHbqABfs=;
 b=Li5Ka4759pxcXXmhGE2pyzk/KP1Qt8+rxqG6AjVBvErYFI9N9BVVynITS4B1Hu8jzZqRCk
 T/dZgoMVLSd/UscwqsQGMNW1xyPG4f2G2CE/17f5wkHwU4+CyYCbviVxyBeS+riDS0z8C0
 zibsEnk7RQ85dqJfyhUm9cVmUm7c4n8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-1xhqVD7RMcOqWdQpop5M7A-1; Thu, 05 Mar 2020 07:03:10 -0500
X-MC-Unique: 1xhqVD7RMcOqWdQpop5M7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BA62184C801;
 Thu,  5 Mar 2020 12:03:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24FBF5C1D8;
 Thu,  5 Mar 2020 12:02:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9952511386A6; Thu,  5 Mar 2020 13:02:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Kirillov <lekiravi@yandex-team.ru>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
Date: Thu, 05 Mar 2020 13:02:55 +0100
In-Reply-To: <20200304130656.16859-2-lekiravi@yandex-team.ru> (Alexey
 Kirillov's message of "Wed, 4 Mar 2020 16:06:53 +0300")
Message-ID: <87y2sff1qo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v2 1/4] qapi: net: Add query-netdevs command
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Eric Blake <eblake@redhat.com>,
 Paul Durrant <paul@xen.org>, Joel Stanley <joel@jms.id.au>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Luigi Rizzo <rizzo@iet.unipi.it>, David Gibson <david@gibson.dropbear.id.au>,
 Thomas Huth <huth@tuxfamily.org>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxleGV5IEtpcmlsbG92IDxsZWtpcmF2aUB5YW5kZXgtdGVhbS5ydT4gd3JpdGVzOgoKPiBBZGQg
YSBxbXAgY29tbWFuZCB0aGF0IHByb3ZpZGVzIGluZm9ybWF0aW9uIGFib3V0IGN1cnJlbnRseSBh
dHRhY2hlZAo+IG5ldHdvcmsgZGV2aWNlcyBhbmQgdGhlaXIgY29uZmlndXJhdGlvbi4KCkNsb3Nl
cyBhIGdhcCBpbiBRTVA7IGFwcHJlY2lhdGVkIQoKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4ZXkgS2ly
aWxsb3YgPGxla2lyYXZpQHlhbmRleC10ZWFtLnJ1PgpbLi4uXQo+IGRpZmYgLS1naXQgYS9xYXBp
L25ldC5qc29uIGIvcWFwaS9uZXQuanNvbgo+IGluZGV4IDFjYjlhN2Q3ODIuLjRmMzI5YTFkZTAg
MTAwNjQ0Cj4gLS0tIGEvcWFwaS9uZXQuanNvbgo+ICsrKyBiL3FhcGkvbmV0Lmpzb24KPiBAQCAt
NzUwLDMgKzc1MCw5MiBAQAo+ICAjIwo+ICB7ICdldmVudCc6ICdGQUlMT1ZFUl9ORUdPVElBVEVE
JywKPiAgICAnZGF0YSc6IHsnZGV2aWNlLWlkJzogJ3N0cid9IH0KPiArCj4gKyMjCj4gKyMgQE5l
dGRldkluZm86Cj4gKyMKPiArIyBDb25maWd1cmF0aW9uIG9mIGEgbmV0d29yayBkZXZpY2UuCj4g
KyMKPiArIyBAaWQ6IERldmljZSBpZGVudGlmaWVyLgo+ICsjCj4gKyMgQHR5cGU6IFNwZWNpZnkg
dGhlIGRyaXZlciB1c2VkIGZvciBpbnRlcnByZXRpbmcgcmVtYWluaW5nIGFyZ3VtZW50cy4KPiAr
Iwo+ICsjIEBwZWVyOiBDb25uZWN0ZWQgbmV0d29yayBkZXZpY2UuCgpAcGVlciBpcyBvcHRpb25h
bC4gIEkgYXNzdW1lIGl0cyBwcmVzZW50IHdoZW4gdGhlIGRldmljZSBpcyBjb25uZWN0ZWQKKGZy
b250ZW5kIHRvIGJhY2tlbmQgb3IgdmljZSB2ZXJzYSkuICBDb3JyZWN0PwoKPiArIwo+ICsjIEBx
dWV1ZXMtY291bnQ6IE51bWJlciBvZiBxdWV1ZXMuCgpXZSB1c2UgcGxhaW4gQHF1ZXVlcyBlbHNl
d2hlcmUgaW4gdGhlIHNjaGVtYS4KCj4gKyMKPiArIyBAaHViOiBodWJpZCBvZiBodWIsIGlmIGNv
bm5lY3RlZCB0by4KCkhvdyBAaHViIGlzIHJlbGF0ZWQgdG8gQHBlZXIgaXMgbm90IHF1aXRlIG9i
dmlvdXMgdG8gbWUuICBDYW4geW91IGdpdmUKYW4gZXhhbXBsZSB3aGVyZSBAaHViIGlzIHByZXNl
bnQ/Cgo+ICsjCj4gKyMgQHBlcm0tbWFjOiBPcmlnaW5hbCBNQUMgYWRkcmVzcy4KCldoYXQgZG9l
cyAicGVybS0iIG1lYW4/CgpJdCdzIG9wdGlvbmFsLiAgV2hlbiBleGFjdGx5IGlzIGl0IHByZXNl
bnQ/Cgo+ICsjCj4gKyMgU2luY2U6IDUuMAo+ICsjIwo+ICt7ICd1bmlvbic6ICdOZXRkZXZJbmZv
JywKPiArICAnYmFzZSc6IHsgJ2lkJzogJ3N0cicsCj4gKyAgICAgICAgICAgICd0eXBlJzogJ05l
dENsaWVudERyaXZlcicsCj4gKyAgICAgICAgICAgICcqcGVlcic6ICdzdHInLAo+ICsgICAgICAg
ICAgICAncXVldWVzLWNvdW50JzogJ2ludCcsCj4gKyAgICAgICAgICAgICcqaHViJzogJ2ludCcs
Cj4gKyAgICAgICAgICAgICcqcGVybS1tYWMnOiAnc3RyJyB9LAo+ICsgICdkaXNjcmltaW5hdG9y
JzogJ3R5cGUnLAo+ICsgICdkYXRhJzogewo+ICsgICAgICAnbmljJzogICAgICAgICdOZXRMZWdh
Y3lOaWNPcHRpb25zJywKPiArICAgICAgJ3VzZXInOiAgICAgICAnTmV0ZGV2VXNlck9wdGlvbnMn
LAo+ICsgICAgICAndGFwJzogICAgICAgICdOZXRkZXZUYXBPcHRpb25zJywKPiArICAgICAgJ2wy
dHB2Myc6ICAgICAnTmV0ZGV2TDJUUHYzT3B0aW9ucycsCj4gKyAgICAgICdzb2NrZXQnOiAgICAg
J05ldGRldlNvY2tldE9wdGlvbnMnLAo+ICsgICAgICAndmRlJzogICAgICAgICdOZXRkZXZWZGVP
cHRpb25zJywKPiArICAgICAgJ2JyaWRnZSc6ICAgICAnTmV0ZGV2QnJpZGdlT3B0aW9ucycsCj4g
KyAgICAgICdodWJwb3J0JzogICAgJ05ldGRldkh1YlBvcnRPcHRpb25zJywKPiArICAgICAgJ25l
dG1hcCc6ICAgICAnTmV0ZGV2TmV0bWFwT3B0aW9ucycsCj4gKyAgICAgICd2aG9zdC11c2VyJzog
J05ldGRldlZob3N0VXNlck9wdGlvbnMnIH0gfQoKVGhpcyBpcyBhIGNvcHkgb2YgdW5pb24gJ05l
dGRldicgd2l0aCBhIGZldyBhZGRpdGlvbmFsIGNvbW1vbiBtZW1iZXJzCihAcGVlciwgQHF1ZXVl
cy1jb3VudCwgQGh1YiwgQHBlcm0tbWFjKS4gIEkgY2FuJ3Qgc2VlIGhvdyB0byBhdm9pZCB0aGUK
ZHVwbGljYXRpb24gd2l0aG91dCBhZGRpbmcgbmVzdGluZyBvbiB0aGUgd2lyZS4KCj4gKwo+ICsj
Iwo+ICsjIEBxdWVyeS1uZXRkZXZzOgo+ICsjCj4gKyMgR2V0IGEgbGlzdCBvZiBATmV0ZGV2SW5m
byBmb3IgYWxsIHZpcnR1YWwgbmV0d29yayBkZXZpY2VzLgo+ICsjCj4gKyMgUmV0dXJuczogYSBs
aXN0IG9mIEBOZXRkZXZJbmZvIGRlc2NyaWJpbmcgZWFjaCB2aXJ0dWFsIG5ldHdvcmsgZGV2aWNl
Lgo+ICsjCj4gKyMgU2luY2U6IDUuMAo+ICsjCj4gKyMgRXhhbXBsZToKPiArIwo+ICsjIC0+IHsg
ImV4ZWN1dGUiOiAicXVlcnktbmV0ZGV2cyIgfQo+ICsjIDwtIHsgInJldHVybiI6IFsKPiArIyAg
ICAgICAgICB7Cj4gKyMgICAgICAgICAgICAgICJwZWVyIjogIm5ldGRldjAiLAo+ICsjICAgICAg
ICAgICAgICAibmV0ZGV2IjogIm5ldGRldjAiLAo+ICsjICAgICAgICAgICAgICAicGVybS1tYWMi
OiAiNTI6NTQ6MDA6MTI6MzQ6NTYiCj4gKyMgICAgICAgICAgICAgICJtb2RlbCI6ICJ2aXJ0aW8t
bmV0LXBjaSIsCj4gKyMgICAgICAgICAgICAgICJtYWNhZGRyIjogIjUyOjU0OjAwOjEyOjM0OjU2
IiwKPiArIyAgICAgICAgICAgICAgInF1ZXVlcy1jb3VudCI6IDEsCj4gKyMgICAgICAgICAgICAg
ICJ0eXBlIjogIm5pYyIsCj4gKyMgICAgICAgICAgICAgICJpZCI6ICJuZXQwIgo+ICsjICAgICAg
ICAgIH0sCj4gKyMgICAgICAgICAgewo+ICsjICAgICAgICAgICAgICAicGVlciI6ICJuZXQwIiwK
PiArIyAgICAgICAgICAgICAgImlwdjYiOiB0cnVlLAo+ICsjICAgICAgICAgICAgICAiaXB2NCI6
IHRydWUsCj4gKyMgICAgICAgICAgICAgICJob3N0IjogIjEwLjAuMi4yIiwKPiArIyAgICAgICAg
ICAgICAgInF1ZXVlcy1jb3VudCI6IDEsCj4gKyMgICAgICAgICAgICAgICJpcHY2LWRucyI6ICJm
ZWMwOjozIiwKPiArIyAgICAgICAgICAgICAgImlwdjYtcHJlZml4IjogImZlYzA6OiIsCj4gKyMg
ICAgICAgICAgICAgICJuZXQiOiAiMTAuMC4yLjAvMjU1LjI1NS4yNTUuMCIsCj4gKyMgICAgICAg
ICAgICAgICJpcHY2LWhvc3QiOiAiZmVjMDo6MiIsCj4gKyMgICAgICAgICAgICAgICJ0eXBlIjog
InVzZXIiLAo+ICsjICAgICAgICAgICAgICAiZG5zIjogIjEwLjAuMi4zIiwKPiArIyAgICAgICAg
ICAgICAgImhvc3Rmd2QiOiBbCj4gKyMgICAgICAgICAgICAgICAgICB7Cj4gKyMgICAgICAgICAg
ICAgICAgICAgICAgInN0ciI6ICJ0Y3A6OjIwMDA0LToyMiIKPiArIyAgICAgICAgICAgICAgICAg
IH0KPiArIyAgICAgICAgICAgICAgXSwKPiArIyAgICAgICAgICAgICAgImlwdjYtcHJlZml4bGVu
IjogNjQsCj4gKyMgICAgICAgICAgICAgICJpZCI6ICJuZXRkZXYwIiwKPiArIyAgICAgICAgICAg
ICAgInJlc3RyaWN0IjogZmFsc2UKPiArIyAgICAgICAgICB9Cj4gKyMgICAgICBdCj4gKyMgICAg
fQo+ICsjCj4gKyMjCj4gK3sgJ2NvbW1hbmQnOiAncXVlcnktbmV0ZGV2cycsICdyZXR1cm5zJzog
WydOZXRkZXZJbmZvJ10gfQoKTGlrZSBITVAgImluZm8gbmV0d29yayIgYW5kIC1uZXQsIHRoaXMg
bWl4ZXMgZnJvbnRlbmRzICgidHlwZSI6ICJuaWMiKQphbmQgYmFja2VuZHMuICBVbmxpa2UgcXVl
cnktY2hhcmRldiBhbmQgcXVlcnktYmxvY2suICBIbW0uCgpBIGxvbmcgdGltZSBhZ28sIGFsbCB3
ZSBoYWQgd2FzIC1uZXQ6ICItbmV0IG5pYyIgZm9yIGNvbmZpZ3VyaW5nCmZyb250ZW5kcywgIi1u
ZXQgbm9uZSIgZm9yIHN1cHByZXNzaW5nIGEgZGVmYXVsdCBmcm9udGVuZCArIGJhY2tlbmQsIGFu
ZAoiLW5ldCBhbnl0aGluZy1lbHNlIiBmb3IgY29uZmlndXJpbmcgYmFja2VuZHMuICAiaW5mbyBu
ZXR3b3JrIiBzaG93ZWQKdGhlIHN0dWZmIHNldCB1cCB3aXRoIC1uZXQuCgpJbiB2MC4xMiwgd2Ug
Z290IC1kZXZpY2UgZm9yIGNvbmZpZ3VyaW5nIGZyb250ZW5kcywgYW5kIC1uZXRkZXYgZm9yCmJh
Y2tlbmRzLiAgLW5ldGRldiBpcyBsaWtlIC1uZXQgbGVzcyAibm9uZSIsICJuaWMiLCBhbmQgdGhl
IGh1Ygp3ZWlyZG5lc3MuICAiaW5mbyBuZXR3b3JrIiB3YXMgZXh0ZW5kZWQgdG8gYWxzbyBzaG93
IGFsbCB0aGlzLgoKSW4gdjIuMTIsIHdlIGdvdCAtbmljLCByZXBsYWNpbmcgLW5ldCBuaWMuCgpV
bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCAtbmV0IGlzIGp1c3QgZm9yIGJhY2t3YXJkIGNv
bXBhdGliaWxpdHkKbm93LgoKV2hhdCdzIHRoZSB1c2UgY2FzZSBmb3IgcXVlcnktbmV0d29ya3Mg
cmVwb3J0aW5nIGZyb250ZW5kcz8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
