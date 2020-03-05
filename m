Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661E17A767
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 15:28:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9rRx-0000yX-F7; Thu, 05 Mar 2020 14:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z1IC=4W=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1j9rRw-0000yN-Gr
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 14:26:08 +0000
X-Inumbo-ID: 3f8ee1ae-5eed-11ea-b52f-bc764e2007e4
Received: from forwardcorp1j.mail.yandex.net (unknown [5.45.199.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f8ee1ae-5eed-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 14:26:06 +0000 (UTC)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7F6512E150E;
 Thu,  5 Mar 2020 17:26:04 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lmIY5ZYDjo-Q1JafvBO; Thu, 05 Mar 2020 17:26:04 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583418364; bh=Srk5hoK6N/ILVxS/BdFaqyldfaW+4xH22sDBZLRIUKo=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=xfMj54YtmzrxGsfNyyBmS+T5yHIheJNguvkvQ+6fVi+x9J5uRgkr8o+MXC/FnKe6/
 y3jm1ZRS9qO7WrzEJD1zj2t0cqyolQYpvpb3/otn2Enfs4T5XR535sC116wgUCoB22
 Sy7l+SaqRqXg7XOzxH43Q6v2df+z92YsAgl2xg8w=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp1j.mail.yandex.net (localhost [::1])
 by mxbackcorp1j.mail.yandex.net with LMTP id 2XQNYKuRZl-2ePGDZXI
 for <lekiravi@yandex-team.ru>; Thu, 05 Mar 2020 17:25:51 +0300
Received: by sas2-b8502101ee6d.qloud-c.yandex.net with HTTP;
 Thu, 05 Mar 2020 17:25:50 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <87y2sff1qo.fsf@dusky.pond.sub.org>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
 <87y2sff1qo.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 05 Mar 2020 17:26:00 +0300
Message-Id: <1041781583412683@myt4-457577cc370d.qloud-c.yandex.net>
Subject: Re: [Xen-devel] [PATCH v2 1/4] qapi: net: Add query-netdevs command
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
 Beniamino Galvani <b.galvani@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <huth@tuxfamily.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgowNS4wMy4yMDIwLCAxNTowMywgIk1hcmt1cyBBcm1icnVzdGVyIiA8YXJtYnJ1QHJlZGhhdC5j
b20+Ogo+IEFsZXhleSBLaXJpbGxvdiA8bGVraXJhdmlAeWFuZGV4LXRlYW0ucnU+IHdyaXRlczoK
Pgo+PiDCoEFkZCBhIHFtcCBjb21tYW5kIHRoYXQgcHJvdmlkZXMgaW5mb3JtYXRpb24gYWJvdXQg
Y3VycmVudGx5IGF0dGFjaGVkCj4+IMKgbmV0d29yayBkZXZpY2VzIGFuZCB0aGVpciBjb25maWd1
cmF0aW9uLgo+Cj4gQ2xvc2VzIGEgZ2FwIGluIFFNUDsgYXBwcmVjaWF0ZWQhCj4KPj4gwqBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4ZXkgS2lyaWxsb3YgPGxla2lyYXZpQHlhbmRleC10ZWFtLnJ1Pgo+Cj4g
Wy4uLl0KPj4gwqBkaWZmIC0tZ2l0IGEvcWFwaS9uZXQuanNvbiBiL3FhcGkvbmV0Lmpzb24KPj4g
wqBpbmRleCAxY2I5YTdkNzgyLi40ZjMyOWExZGUwIDEwMDY0NAo+PiDCoC0tLSBhL3FhcGkvbmV0
Lmpzb24KPj4gwqArKysgYi9xYXBpL25ldC5qc29uCj4+IMKgQEAgLTc1MCwzICs3NTAsOTIgQEAK
Pj4gwqDCoCMjCj4+IMKgwqB7ICdldmVudCc6ICdGQUlMT1ZFUl9ORUdPVElBVEVEJywKPj4gwqDC
oMKgwqAnZGF0YSc6IHsnZGV2aWNlLWlkJzogJ3N0cid9IH0KPj4gwqArCj4+IMKgKyMjCj4+IMKg
KyMgQE5ldGRldkluZm86Cj4+IMKgKyMKPj4gwqArIyBDb25maWd1cmF0aW9uIG9mIGEgbmV0d29y
ayBkZXZpY2UuCj4+IMKgKyMKPj4gwqArIyBAaWQ6IERldmljZSBpZGVudGlmaWVyLgo+PiDCoCsj
Cj4+IMKgKyMgQHR5cGU6IFNwZWNpZnkgdGhlIGRyaXZlciB1c2VkIGZvciBpbnRlcnByZXRpbmcg
cmVtYWluaW5nIGFyZ3VtZW50cy4KPj4gwqArIwo+PiDCoCsjIEBwZWVyOiBDb25uZWN0ZWQgbmV0
d29yayBkZXZpY2UuCj4KPiBAcGVlciBpcyBvcHRpb25hbC4gSSBhc3N1bWUgaXRzIHByZXNlbnQg
d2hlbiB0aGUgZGV2aWNlIGlzIGNvbm5lY3RlZAo+IChmcm9udGVuZCB0byBiYWNrZW5kIG9yIHZp
Y2UgdmVyc2EpLiBDb3JyZWN0Pwo+CgpZZXMsIHRoaXMgZmllbGQgc3RvcmVzIGNvbm5lY3RlZCBm
cm9udGVuZC9iYWNrZW5kIGRldmljZSBAaWQuCgo+PiDCoCsjCj4+IMKgKyMgQHF1ZXVlcy1jb3Vu
dDogTnVtYmVyIG9mIHF1ZXVlcy4KPgo+IFdlIHVzZSBwbGFpbiBAcXVldWVzIGVsc2V3aGVyZSBp
biB0aGUgc2NoZW1hLgo+CgpJdCBjYW4gY29uZmxpY3Qgd2l0aCBmaWVsZHMgaW5zaWRlIE5ldGRl
dipPcHRpb25zLCBpc24ndCBpdD8KCj4+IMKgKyMKPj4gwqArIyBAaHViOiBodWJpZCBvZiBodWIs
IGlmIGNvbm5lY3RlZCB0by4KPgo+IEhvdyBAaHViIGlzIHJlbGF0ZWQgdG8gQHBlZXIgaXMgbm90
IHF1aXRlIG9idmlvdXMgdG8gbWUuIENhbiB5b3UgZ2l2ZQo+IGFuIGV4YW1wbGUgd2hlcmUgQGh1
YiBpcyBwcmVzZW50Pwo+CgpOZXRkZXZIdWJQb3J0T3B0aW9ucyBoYXMgYW4gb3B0aW9uIEBodWJp
ZC4gQGh1YiBnaXZlcyB0aGF0IGlkLCBpZgpuZXRkZXYgaXMgY29ubmVjdGVkIHRvIHRoZSBodWIg
dmlhIGh1YnBvcnQuIEFzIGV4YW1wbGU6CgpITVA6CgpodWIgMAogXCBodWIwcG9ydDE6IHNvY2tl
dC4wOiBpbmRleD0wLHR5cGU9c29ja2V0LAogXCBodWIwcG9ydDA6IHZpcnRpby1uZXQtcGNpLjA6
IGluZGV4PTAsdHlwZT1uaWMsbW9kZWw9dmlydGlvLW5ldC1wY2ksbWFjYWRkcj01Mjo1NDowMDox
MjozNDo1NgoKUU1QOgoKWwogIHsKICAgICJwZWVyIjogImh1YjBwb3J0MCIsCiAgICAibmV0ZGV2
IjogImh1YjBwb3J0MCIsCiAgICAiaHViIjogMCwKICAgICJtb2RlbCI6ICJ2aXJ0aW8tbmV0LXBj
aSIsCiAgICAibWFjYWRkciI6ICI1Mjo1NDowMDoxMjozNDo1NiIsCiAgICAidHlwZSI6ICJuaWMi
LAogICAgInF1ZXVlcy1jb3VudCI6IDEsCiAgICAiaWQiOiAidmlydGlvLW5ldC1wY2kuMCIKICB9
LAogIHsKICAgICJwZWVyIjogImh1YjBwb3J0MSIsCiAgICAibGlzdGVuIjogIjEyNy4wLjAuMTo5
MCIsCiAgICAiaHViIjogMCwKICAgICJ0eXBlIjogInNvY2tldCIsCiAgICAicXVldWVzLWNvdW50
IjogMSwKICAgICJpZCI6ICJzb2NrZXQuMCIKICB9LAogIHsKICAgICJwZWVyIjogInNvY2tldC4w
IiwKICAgICJuZXRkZXYiOiAic29ja2V0LjAiLAogICAgImh1YiI6IDAsCiAgICAiaHViaWQiOiAw
LAogICAgInR5cGUiOiAiaHVicG9ydCIsCiAgICAicXVldWVzLWNvdW50IjogMSwKICAgICJpZCI6
ICJodWIwcG9ydDEiCiAgfSwKICB7CiAgICAicGVlciI6ICJ2aXJ0aW8tbmV0LXBjaS4wIiwKICAg
ICJuZXRkZXYiOiAidmlydGlvLW5ldC1wY2kuMCIsCiAgICAiaHViIjogMCwKICAgICJodWJpZCI6
IDAsCiAgICAidHlwZSI6ICJodWJwb3J0IiwKICAgICJxdWV1ZXMtY291bnQiOiAxLAogICAgImlk
IjogImh1YjBwb3J0MCIKICB9Cl0KCj4+IMKgKyMKPj4gwqArIyBAcGVybS1tYWM6IE9yaWdpbmFs
IE1BQyBhZGRyZXNzLgo+Cj4gV2hhdCBkb2VzICJwZXJtLSIgbWVhbj8KPgo+IEl0J3Mgb3B0aW9u
YWwuIFdoZW4gZXhhY3RseSBpcyBpdCBwcmVzZW50Pwo+CgpAcGVybS1tYWMgaXMgdGhlIHBlcm1h
bmVudCAob3JpZ2luYWwpIE1BQyBhZGRyZXNzLiBJdCBvbmx5IHVzZWQKZm9yIG5pYywgYmVjYXVz
ZSBtb3N0IG9mIG5pYyByZWFsaXphdGlvbnMgY2FuIGNoYW5nZSBNQUMgYXQKcnVudGltZSBhbmQv
b3IgcmVzZXQgaXQgdG8gZGVmYXVsdCAocGVybWFuZW50KSB2YWx1ZS4KCj4+IMKgKyMKPj4gwqAr
IyBTaW5jZTogNS4wCj4+IMKgKyMjCj4+IMKgK3sgJ3VuaW9uJzogJ05ldGRldkluZm8nLAo+PiDC
oCsgJ2Jhc2UnOiB7ICdpZCc6ICdzdHInLAo+PiDCoCsgJ3R5cGUnOiAnTmV0Q2xpZW50RHJpdmVy
JywKPj4gwqArICcqcGVlcic6ICdzdHInLAo+PiDCoCsgJ3F1ZXVlcy1jb3VudCc6ICdpbnQnLAo+
PiDCoCsgJypodWInOiAnaW50JywKPj4gwqArICcqcGVybS1tYWMnOiAnc3RyJyB9LAo+PiDCoCsg
J2Rpc2NyaW1pbmF0b3InOiAndHlwZScsCj4+IMKgKyAnZGF0YSc6IHsKPj4gwqArICduaWMnOiAn
TmV0TGVnYWN5TmljT3B0aW9ucycsCj4+IMKgKyAndXNlcic6ICdOZXRkZXZVc2VyT3B0aW9ucycs
Cj4+IMKgKyAndGFwJzogJ05ldGRldlRhcE9wdGlvbnMnLAo+PiDCoCsgJ2wydHB2Myc6ICdOZXRk
ZXZMMlRQdjNPcHRpb25zJywKPj4gwqArICdzb2NrZXQnOiAnTmV0ZGV2U29ja2V0T3B0aW9ucycs
Cj4+IMKgKyAndmRlJzogJ05ldGRldlZkZU9wdGlvbnMnLAo+PiDCoCsgJ2JyaWRnZSc6ICdOZXRk
ZXZCcmlkZ2VPcHRpb25zJywKPj4gwqArICdodWJwb3J0JzogJ05ldGRldkh1YlBvcnRPcHRpb25z
JywKPj4gwqArICduZXRtYXAnOiAnTmV0ZGV2TmV0bWFwT3B0aW9ucycsCj4+IMKgKyAndmhvc3Qt
dXNlcic6ICdOZXRkZXZWaG9zdFVzZXJPcHRpb25zJyB9IH0KPgo+IFRoaXMgaXMgYSBjb3B5IG9m
IHVuaW9uICdOZXRkZXYnIHdpdGggYSBmZXcgYWRkaXRpb25hbCBjb21tb24gbWVtYmVycwo+IChA
cGVlciwgQHF1ZXVlcy1jb3VudCwgQGh1YiwgQHBlcm0tbWFjKS4gSSBjYW4ndCBzZWUgaG93IHRv
IGF2b2lkIHRoZQo+IGR1cGxpY2F0aW9uIHdpdGhvdXQgYWRkaW5nIG5lc3Rpbmcgb24gdGhlIHdp
cmUuCj4KPj4gwqArCj4+IMKgKyMjCj4+IMKgKyMgQHF1ZXJ5LW5ldGRldnM6Cj4+IMKgKyMKPj4g
wqArIyBHZXQgYSBsaXN0IG9mIEBOZXRkZXZJbmZvIGZvciBhbGwgdmlydHVhbCBuZXR3b3JrIGRl
dmljZXMuCj4+IMKgKyMKPj4gwqArIyBSZXR1cm5zOiBhIGxpc3Qgb2YgQE5ldGRldkluZm8gZGVz
Y3JpYmluZyBlYWNoIHZpcnR1YWwgbmV0d29yayBkZXZpY2UuCj4+IMKgKyMKPj4gwqArIyBTaW5j
ZTogNS4wCj4+IMKgKyMKPj4gwqArIyBFeGFtcGxlOgo+PiDCoCsjCj4+IMKgKyMgLT4geyAiZXhl
Y3V0ZSI6ICJxdWVyeS1uZXRkZXZzIiB9Cj4+IMKgKyMgPC0geyAicmV0dXJuIjogWwo+PiDCoCsj
IHsKPj4gwqArIyAicGVlciI6ICJuZXRkZXYwIiwKPj4gwqArIyAibmV0ZGV2IjogIm5ldGRldjAi
LAo+PiDCoCsjICJwZXJtLW1hYyI6ICI1Mjo1NDowMDoxMjozNDo1NiIKPj4gwqArIyAibW9kZWwi
OiAidmlydGlvLW5ldC1wY2kiLAo+PiDCoCsjICJtYWNhZGRyIjogIjUyOjU0OjAwOjEyOjM0OjU2
IiwKPj4gwqArIyAicXVldWVzLWNvdW50IjogMSwKPj4gwqArIyAidHlwZSI6ICJuaWMiLAo+PiDC
oCsjICJpZCI6ICJuZXQwIgo+PiDCoCsjIH0sCj4+IMKgKyMgewo+PiDCoCsjICJwZWVyIjogIm5l
dDAiLAo+PiDCoCsjICJpcHY2IjogdHJ1ZSwKPj4gwqArIyAiaXB2NCI6IHRydWUsCj4+IMKgKyMg
Imhvc3QiOiAiMTAuMC4yLjIiLAo+PiDCoCsjICJxdWV1ZXMtY291bnQiOiAxLAo+PiDCoCsjICJp
cHY2LWRucyI6ICJmZWMwOjozIiwKPj4gwqArIyAiaXB2Ni1wcmVmaXgiOiAiZmVjMDo6IiwKPj4g
wqArIyAibmV0IjogIjEwLjAuMi4wLzI1NS4yNTUuMjU1LjAiLAo+PiDCoCsjICJpcHY2LWhvc3Qi
OiAiZmVjMDo6MiIsCj4+IMKgKyMgInR5cGUiOiAidXNlciIsCj4+IMKgKyMgImRucyI6ICIxMC4w
LjIuMyIsCj4+IMKgKyMgImhvc3Rmd2QiOiBbCj4+IMKgKyMgewo+PiDCoCsjICJzdHIiOiAidGNw
OjoyMDAwNC06MjIiCj4+IMKgKyMgfQo+PiDCoCsjIF0sCj4+IMKgKyMgImlwdjYtcHJlZml4bGVu
IjogNjQsCj4+IMKgKyMgImlkIjogIm5ldGRldjAiLAo+PiDCoCsjICJyZXN0cmljdCI6IGZhbHNl
Cj4+IMKgKyMgfQo+PiDCoCsjIF0KPj4gwqArIyB9Cj4+IMKgKyMKPj4gwqArIyMKPj4gwqAreyAn
Y29tbWFuZCc6ICdxdWVyeS1uZXRkZXZzJywgJ3JldHVybnMnOiBbJ05ldGRldkluZm8nXSB9Cj4K
PiBMaWtlIEhNUCAiaW5mbyBuZXR3b3JrIiBhbmQgLW5ldCwgdGhpcyBtaXhlcyBmcm9udGVuZHMg
KCJ0eXBlIjogIm5pYyIpCj4gYW5kIGJhY2tlbmRzLiBVbmxpa2UgcXVlcnktY2hhcmRldiBhbmQg
cXVlcnktYmxvY2suIEhtbS4KPgo+IEEgbG9uZyB0aW1lIGFnbywgYWxsIHdlIGhhZCB3YXMgLW5l
dDogIi1uZXQgbmljIiBmb3IgY29uZmlndXJpbmcKPiBmcm9udGVuZHMsICItbmV0IG5vbmUiIGZv
ciBzdXBwcmVzc2luZyBhIGRlZmF1bHQgZnJvbnRlbmQgKyBiYWNrZW5kLCBhbmQKPiAiLW5ldCBh
bnl0aGluZy1lbHNlIiBmb3IgY29uZmlndXJpbmcgYmFja2VuZHMuICJpbmZvIG5ldHdvcmsiIHNo
b3dlZAo+IHRoZSBzdHVmZiBzZXQgdXAgd2l0aCAtbmV0Lgo+Cj4gSW4gdjAuMTIsIHdlIGdvdCAt
ZGV2aWNlIGZvciBjb25maWd1cmluZyBmcm9udGVuZHMsIGFuZCAtbmV0ZGV2IGZvcgo+IGJhY2tl
bmRzLiAtbmV0ZGV2IGlzIGxpa2UgLW5ldCBsZXNzICJub25lIiwgIm5pYyIsIGFuZCB0aGUgaHVi
Cj4gd2VpcmRuZXNzLiAiaW5mbyBuZXR3b3JrIiB3YXMgZXh0ZW5kZWQgdG8gYWxzbyBzaG93IGFs
bCB0aGlzLgo+Cj4gSW4gdjIuMTIsIHdlIGdvdCAtbmljLCByZXBsYWNpbmcgLW5ldCBuaWMuCj4K
PiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCAtbmV0IGlzIGp1c3QgZm9yIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkKPiBub3cuCj4KPiBXaGF0J3MgdGhlIHVzZSBjYXNlIGZvciBxdWVyeS1u
ZXR3b3JrcyByZXBvcnRpbmcgZnJvbnRlbmRzPwoKSW4gbXkgdmlzaW9uLCBuZXcgUU1QIGNvbW1h
bmQgaXMgdGhlIHJlcGxhY2VtZW50IGZvciBvbGQKSE1QIGNvbW1hbmQuIEl0IG11c3QgcHJvdmlk
ZSBpbmZvcm1hdGlvbiBhYm91dCBhbGwKbmV0d29yayBkZXZpY2VzLCBtYWlubHkgZm9yIHJlY3Jl
YXRlIHNpbWlsYXIgbmV0IHRvcG9sb2d5LgpDdXJyZW50bHksIHRoZXJlIGFyZSBubyBkaWZmZXJy
ZW5jZSBiZXR3ZWVuIGZyb250ZWQgYW5kCmJhY2tlbmQgZGV2aWNlcyBpbiBjb250ZXh0IG9mIG15
IGNvbW1hbmQsIGJlY2F1c2UKYWxsIG9mIHRoZW0gdXNlIHRoZSBzYW1lIGludGVyZmFjZSBpbiBO
ZXRDbGllbnRTdGF0ZS4KCj4KCi0twqAKQWxleGV5IEtpcmlsbG92CllhbmRleC5DbG91ZAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
