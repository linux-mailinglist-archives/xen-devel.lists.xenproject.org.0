Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03EE17DCDA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:00:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBF9U-0005Zd-9y; Mon, 09 Mar 2020 09:56:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8soW=42=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jBF9S-0005ZX-Ac
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 09:56:46 +0000
X-Inumbo-ID: 487fdea6-61ec-11ea-90c4-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 487fdea6-61ec-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583747804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koAb9PYd9YWAGXJam266Ct9s9rRn4z7yL9fRUPmjug0=;
 b=BVvxLRwDvjJPzriTrj56y6+btl3ka/UofPmuCWOM0OnssEHGEy6gYF3eBfN/2wRendXGeQ
 TWtFG+sCMr8D90fxJe3wDSkRVOpIGArTHGxG+Z2CgC9Hh7dYR66IOQgSj94dmvSSW0ianb
 Q+dDVonB8gPh5oBZaIDNnDykhqib69c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-OI3xzYGpPXWUCrpAwLPqNA-1; Mon, 09 Mar 2020 05:56:41 -0400
X-MC-Unique: OI3xzYGpPXWUCrpAwLPqNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47C28800D4E;
 Mon,  9 Mar 2020 09:56:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C28AF9051C;
 Mon,  9 Mar 2020 09:56:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5310111386A6; Mon,  9 Mar 2020 10:56:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
Date: Mon, 09 Mar 2020 10:56:31 +0100
In-Reply-To: <20200306051536.27803-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 6 Mar 2020 08:15:28 +0300")
Message-ID: <87lfo997hs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v8 02/10] scripts: add coccinelle script to
 use auto propagated errp
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VnZ2VzdAoKICAgIHNjcmlwdHM6IENvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBhdXRvLXByb3Bh
Z2F0ZWQgZXJycAoKb3IKCiAgICBzY3JpcHRzOiBDb2NjaW5lbGxlIHNjcmlwdCB0byB1c2UgRVJS
UF9BVVRPX1BST1BBR0FURSgpCgpWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50
c292QHZpcnR1b3p6by5jb20+IHdyaXRlczoKCj4gU2NyaXB0IGFkZHMgRVJSUF9BVVRPX1BST1BB
R0FURSBtYWNybyBpbnZvY2F0aW9uIHdoZXJlIGFwcHJvcHJpYXRlIGFuZAo+IGRvZXMgY29ycmVz
cG9uZGluZyBjaGFuZ2VzIGluIGNvZGUgKGxvb2sgZm9yIGRldGFpbHMgaW4KPiBpbmNsdWRlL3Fh
cGkvZXJyb3IuaCkKPgo+IFVzYWdlIGV4YW1wbGU6Cj4gc3BhdGNoIC0tc3AtZmlsZSBzY3JpcHRz
L2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgXAo+ICAtLW1hY3JvLWZpbGUg
c2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggLS1pbi1wbGFjZSAtLW5vLXNob3ctZGlmZiBcCj4g
IGJsb2NrZGV2LW5iZC5jIHFlbXUtbmJkLmMge2Jsb2NrL25iZCosbmJkLyosaW5jbHVkZS9ibG9j
ay9uYmQqfS5baGNdCgpTdWdnZXN0IEZJTEVTLi4uIGluc3RlYWQgb2YgYSBzcGVjaWZpYyBzZXQg
b2YgZmlsZXMuCgo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkg
PHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KPiAtLS0KPgo+IENjOiBFcmljIEJsYWtlIDxlYmxh
a2VAcmVkaGF0LmNvbT4KPiBDYzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KPiBDYzog
TWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiBDYzogR3JlZyBLdXJ6IDxncm91Z0BrYW9k
Lm9yZz4KPiBDYzogQ2hyaXN0aWFuIFNjaG9lbmViZWNrIDxxZW11X29zc0BjcnVkZWJ5dGUuY29t
Pgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6
IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IENjOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiBDYzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPgo+IENjOiAiUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kiIDxwaGlsbWRAcmVkaGF0LmNv
bT4KPiBDYzogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiBDYzogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gQ2M6IFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGlu
dXguaWJtLmNvbT4KPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgo+
IENjOiBNaWNoYWVsIFJvdGggPG1kcm90aEBsaW51eC52bmV0LmlibS5jb20+Cj4gQ2M6IHFlbXUt
YmxvY2tAbm9uZ251Lm9yZwo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmcKPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4KPiAgaW5jbHVkZS9xYXBpL2Vycm9yLmggICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAzICsKPiAgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJv
cGFnYXRlZC1lcnJwLmNvY2NpIHwgMjMxICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIzNCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3JpcHRzL2Nv
Y2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPgo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3FhcGkvZXJyb3IuaCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gaW5kZXggYmI5YmNmMDJm
Yi4uZmJmYzZmMWMwYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+ICsrKyBi
L2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gQEAgLTIxMSw2ICsyMTEsOSBAQAo+ICAgKiAgICAgICAg
IH0KPiAgICogICAgICAgICAuLi4KPiAgICogICAgIH0KPiArICoKPiArICogRm9yIG1hc3MgY29u
dmVyc2lvbiB1c2Ugc2NyaXB0CgptYXNzLWNvbnZlcnNpb24gKHdlJ3JlIG5vdCBjb252ZXJ0aW5n
IG1hc3MsIHdlJ3JlIGNvbnZlcnRpbmcgZW4gbWFzc2UpCgo+ICsgKiAgIHNjcmlwdHMvY29jY2lu
ZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQo+ICAgKi8KPiAgCj4gICNpZm5kZWYgRVJS
T1JfSAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVy
cnAuY29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmJmZjI3NGJkNmQKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1l
cnJwLmNvY2NpCgpQcmVmYWNlIHRvIG15IHJldmlldyBvZiB0aGlzIHNjcmlwdDogbWF5IGFpbSBp
c24ndCB0byBtYWtlIGl0CmJ1bGxldC1wcm9vZi4gIEkgd2FudCB0byAoMSkgbWFrZSBpdCBnb29k
IGVub3VnaCAoZXhwbGFpbmVkIGluIGEKamlmZmllKSwgYW5kICgyKSBhdXRvbWF0aWNhbGx5IGlk
ZW50aWZ5IHRoZSBzcG90cyB3aGVyZSBpdCBzdGlsbCBpc24ndApvYnZpb3VzbHkgc2FmZSBmb3Ig
bWFudWFsIHJldmlldy4KClRoZSBsYXR0ZXIgbWF5IGludm9sdmUgYWRkaXRpb25hbCBzY3JpcHRp
bmcuICBUaGF0J3Mgb2theS4KClRoZSBzY3JpcHQgaXMgZ29vZCBlbm91Z2ggd2hlbiB0aGUgbnVt
YmVyIG9mIHBvc3NpYmx5IHVuc2FmZSBzcG90cyBpcwpsb3cgZW5vdWdoIGZvciBjYXJlZnVsIG1h
bnVhbCByZXZpZXcuCgpXaGVuIEkgYXNrIGZvciBpbXByb3ZlbWVudHMgdGhhdCwgaW4geW91ciBv
cGluaW9uLCBnbyBiZXlvbmQgImdvb2QKZW5vdWdoIiwgcGxlYXNlIHB1c2ggYmFjay4gIEknbSBz
dXJlIHdlIGNhbiB3b3JrIGl0IG91dCB0b2dldGhlci4KCj4gQEAgLTAsMCArMSwyMzEgQEAKPiAr
Ly8gVXNlIEVSUlBfQVVUT19QUk9QQUdBVEUgKHNlZSBpbmNsdWRlL3FhcGkvZXJyb3IuaCkKPiAr
Ly8KPiArLy8gQ29weXJpZ2h0IChjKSAyMDIwIFZpcnR1b3p6byBJbnRlcm5hdGlvbmFsIEdtYkgu
Cj4gKy8vCj4gKy8vIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Cj4gKy8vIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4gKy8vIHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9y
Cj4gKy8vIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gKy8vCj4gKy8vIFRo
aXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNl
ZnVsLAo+ICsvLyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1w
bGllZCB3YXJyYW50eSBvZgo+ICsvLyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4gKy8vIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuCj4gKy8vCj4gKy8vIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gKy8vIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+Lgo+ICsvLwo+ICsvLyBVc2FnZSBleGFtcGxlOgo+ICsvLyBzcGF0Y2ggLS1zcC1maWxlIHNj
cmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaSBcCj4gKy8vICAtLW1h
Y3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggLS1pbi1wbGFjZSAtLW5vLXNob3ct
ZGlmZiBcCj4gKy8vICAtLW1heC13aWR0aCA4MCBibG9ja2Rldi1uYmQuYyBxZW11LW5iZC5jIFwK
CllvdSBoYXZlIC0tbWF4LXdpZHRoIDgwIGhlcmUsIGJ1dCBub3QgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLiAgRGVmYXVsdApzZWVtcyB0byBiZSA3OC4gIEFueSBwYXJ0aWN1bGFyIHJlYXNvbiB0byBj
aGFuZ2UgaXQgdG8gODA/Cgo+ICsvLyAge2Jsb2NrL25iZCosbmJkLyosaW5jbHVkZS9ibG9jay9u
YmQqfS5baGNdCj4gKwo+ICsvLyBTd2l0Y2ggdW51c3VhbCAoRXJyb3IgKiopIHBhcmFtZXRlciBu
YW1lcyB0byBlcnJwCgpMZXQncyBkcm9wIHRoZSBwYXJlbnRoZXNpcyBhcm91bmQgRXJyb3IgKioK
Cj4gKy8vICh0aGlzIGlzIG5lY2Vzc2FyeSB0byB1c2UgRVJSUF9BVVRPX1BST1BBR0FURSkuCgpQ
ZXJoYXBzIEVSUlBfQVVUT19QUk9QQUdBVEUoKSBzaG91bGQgYmUgRVJSUF9BVVRPX1BST1BBR0FU
RShlcnJwKSB0bwptYWtlIHRoZSBmYWN0IHdlJ3JlIG1lc3Npbmcgd2l0aCBAZXJycCBtb3JlIG9i
dmlvdXMuICBUb28gbGF0ZTsgSQpzaG91bGRuJ3Qgcm9jayB0aGUgYm9hdCB0aGF0IG11Y2ggbm93
LgoKPiArLy8KPiArLy8gRGlzYWJsZSBvcHRpb25hbF9xdWFsaWZpZXIgdG8gc2tpcCBmdW5jdGlv
bnMgd2l0aCAiRXJyb3IgKmNvbnN0ICplcnJwIgo+ICsvLyBwYXJhbWV0ZXIuCj4gKy8vCj4gKy8v
IFNraXAgZnVuY3Rpb25zIHdpdGggImFzc2VydChfZXJycCAmJiAqX2VycnApIiBzdGF0ZW1lbnQs
IGFzIHRoZXkgaGF2ZQo+ICsvLyBub24gZ2VuZXJpYyBzZW1hbnRpY3MgYW5kIG1heSBoYXZlIHVu
dXN1YWwgRXJyb3IgKiogYXJndW1lbnQgbmFtZSBmb3IgcHVycG9zZQoKbm9uLWdlbmVyaWMKCmZv
ciBhIHB1cnBvc2UKCldyYXAgY29tbWVudCBsaW5lcyBhcm91bmQgY29sdW1uIDcwLCBwbGVhc2Uu
ICBJdCdzIGVhc2llciB0byByZWFkLgoKTWF5YmUKCiAgIC8vIFNraXAgZnVuY3Rpb25zIHdpdGgg
ImFzc2VydChfZXJycCAmJiAqX2VycnApIiBzdGF0ZW1lbnQsIGJlY2F1c2UgdGhhdAogICAvLyBz
aWduYWxzIHVudXN1YWwgc2VtYW50aWNzLCBhbmQgdGhlIHBhcmFtZXRlciBuYW1lIG1heSB3ZWxs
IHNlcnZlIGEKICAgLy8gcHVycG9zZS4KCj4gKy8vIChsaWtlIG5iZF9pdGVyX2NoYW5uZWxfZXJy
b3IoKSkuCj4gKy8vCj4gKy8vIFNraXAgdXRpbC9lcnJvci5jIHRvIG5vdCB0b3VjaCwgZm9yIGV4
YW1wbGUsIGVycm9yX3Byb3BhZ2F0ZSBhbmQKPiArLy8gZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQo
KS4KCmVycm9yX3Byb3BhZ2F0ZSgpCgpJIG11Y2ggYXBwcmVjaWF0ZSB5b3VyIG1ldGljdWxvdXMg
ZXhwbGFuYXRpb24gb2Ygd2hhdCB5b3Ugc2tpcCBhbmQgd2h5LgoKPiArQCBkZXBlbmRzIG9uICEo
ZmlsZSBpbiAidXRpbC9lcnJvci5jIikgZGlzYWJsZSBvcHRpb25hbF9xdWFsaWZpZXJACj4gK2lk
ZW50aWZpZXIgZm47Cj4gK2lkZW50aWZpZXIgX2VycnAgIT0gZXJycDsKPiArQEAKPiArCj4gKyBm
biguLi4sCj4gKy0gICBFcnJvciAqKl9lcnJwCj4gKysgICBFcnJvciAqKmVycnAKPiArICAgICwu
Li4pCj4gKyB7Cj4gKygKPiArICAgICAuLi4gd2hlbiAhPSBhc3NlcnQoX2VycnAgJiYgKl9lcnJw
KQo+ICsmCj4gKyAgICAgPC4uLgo+ICstICAgIF9lcnJwCj4gKysgICAgZXJycAo+ICsgICAgIC4u
Lj4KPiArKQo+ICsgfQoKVGhpcyBydWxlIGlzIHJlcXVpcmVkIHRvIG1ha2UgdGhlIGFjdHVhbCB0
cmFuc2Zvcm1hdGlvbnMgKGJlbG93KSB3b3JrCmV2ZW4gZm9yIHBhcmFtZXRlcnMgd2l0aCBuYW1l
cyBvdGhlciB0aGFuIEBlcnJwLiAgSSBiZWxpZXZlIGl0J3Mgbm90CnVzZWQgaW4gdGhpcyBzZXJp
ZXMuICBJbiBmYWN0LCBJIGNhbid0IHNlZSBhIHVzZSBmb3IgaXQgaW4gdGhlIGVudGlyZQp0cmVl
IHJpZ2h0IG5vdy4gIE9rYXkgYW55d2F5LgoKPiArCj4gKy8vIEFkZCBpbnZvY2F0aW9uIG9mIEVS
UlBfQVVUT19QUk9QQUdBVEUgdG8gZXJycC1mdW5jdGlvbnMgd2hlcmUgbmVjZXNzYXJ5Cj4gKy8v
Cj4gKy8vIE5vdGUsIHRoYXQgd2l0aG91dCAid2hlbiBhbnkiIGZpbmFsICIuLi4iIG1heSBub3Qg
d2FudCB0byBtYWNoIHNvbWV0aGluZwoKcy9maW5hbCAiLi4uIiBtYXkgbm90IG1hY2gvdGhlIGZp
bmFsICIuLi4iIGRvZXMgbm90IG1hdGNoLwoKPiArLy8gbWF0Y2hlZCBieSBwcmV2aW91cyBwYXR0
ZXJuLCBpLmUuIHRoZSBydWxlIHdpbGwgbm90IG1hdGNoIGRvdWJsZQo+ICsvLyBlcnJvcl9wcmVw
ZW5kIGluIGNvbnRyb2wgZmxvdyBsaWtlIGluIHZmaW9fc2V0X2lycV9zaWduYWxpbmcoKS4KCkNh
bid0IHNheSBJIGZ1bGx5IHVuZGVyc3RhbmQgQ29jY2luZWxsZSB0aGVyZS4gIEkgZmlndXJlIHlv
dSBjYW1lIHRvCnRoaXMga25vd2xlZGdlIHRoZSBoYXJkIHdheS4KCj4gKy8vCj4gKy8vIE5vdGUs
ICJleGlzdHMiIHNheXMgdGhhdCB3ZSB3YW50IGFwcGx5IHJ1bGUgZXZlbiBpZiBpdCBtYXRjaGVz
IG5vdCBvbgo+ICsvLyBhbGwgcG9zc2libGUgY29udHJvbCBmbG93cyAob3RoZXJ3aXNlLCBpdCB3
aWxsIG5vdCBtYXRjaCBzdGFuZGFyZCBwYXR0ZXJuCj4gKy8vIHdoZW4gZXJyb3JfcHJvcGFnYXRl
KCkgY2FsbCBpcyBpbiBpZiBicmFuY2gpLgoKTGVhcm5lZCBzb21ldGhpbmcgbmV3LiAgRXhhbXBs
ZToga3ZtX3NldF9rdm1fc2hhZG93X21lbSgpLgoKU3BlbGxpbmcgaXQgImV4aXN0cyBkaXNhYmxl
IG9wdGlvbmFsX3F1YWxpZmllciIgd291bGQgYXZvaWQgZ2l2aW5nCnJlYWRlcnMgdGhlIGlkZWEg
d2UncmUgZGlzYWJsaW5nICJleGlzdHMiLCBidXQgQ29jY2luZWxsZSBkb2Vzbid0IGxldAp1cy4g
IE9oIHdlbGwuCgo+ICtAIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0c0AKPiAraWRl
bnRpZmllciBmbiwgbG9jYWxfZXJyLCBlcnJwOwoKSSBiZWxpZXZlIHRoaXMgY2F1c2VzCgogICAg
d2FybmluZzogbGluZSA5ODogZXJycCwgcHJldmlvdXNseSBkZWNsYXJlZCBhcyBhIG1ldGF2YXJp
YWJsZSwgaXMgdXNlZCBhcyBhbiBpZGVudGlmaWVyCiAgICB3YXJuaW5nOiBsaW5lIDEwNDogZXJy
cCwgcHJldmlvdXNseSBkZWNsYXJlZCBhcyBhIG1ldGF2YXJpYWJsZSwgaXMgdXNlZCBhcyBhbiBp
ZGVudGlmaWVyCiAgICB3YXJuaW5nOiBsaW5lIDEwNjogZXJycCwgcHJldmlvdXNseSBkZWNsYXJl
ZCBhcyBhIG1ldGF2YXJpYWJsZSwgaXMgdXNlZCBhcyBhbiBpZGVudGlmaWVyCiAgICB3YXJuaW5n
OiBsaW5lIDEzMTogZXJycCwgcHJldmlvdXNseSBkZWNsYXJlZCBhcyBhIG1ldGF2YXJpYWJsZSwg
aXMgdXNlZCBhcyBhbiBpZGVudGlmaWVyCiAgICB3YXJuaW5nOiBsaW5lIDE5MjogZXJycCwgcHJl
dmlvdXNseSBkZWNsYXJlZCBhcyBhIG1ldGF2YXJpYWJsZSwgaXMgdXNlZCBhcyBhbiBpZGVudGlm
aWVyCiAgICB3YXJuaW5nOiBsaW5lIDE5NTogZXJycCwgcHJldmlvdXNseSBkZWNsYXJlZCBhcyBh
IG1ldGF2YXJpYWJsZSwgaXMgdXNlZCBhcyBhbiBpZGVudGlmaWVyCiAgICB3YXJuaW5nOiBsaW5l
IDIyODogZXJycCwgcHJldmlvdXNseSBkZWNsYXJlZCBhcyBhIG1ldGF2YXJpYWJsZSwgaXMgdXNl
ZCBhcyBhbiBpZGVudGlmaWVyCgpNYWtpbmcgQGVycnAgc3ltYm9sIGluc3RlYWQgb2YgaWRlbnRp
ZmllciBzaG91bGQgZml4IHRoaXMuCgo+ICtAQAo+ICsKPiArIGZuKC4uLiwgRXJyb3IgKiplcnJw
LCAuLi4pCj4gKyB7Cj4gKysgICBFUlJQX0FVVE9fUFJPUEFHQVRFKCk7Cj4gKyAgICAuLi4gIHdo
ZW4gIT0gRVJSUF9BVVRPX1BST1BBR0FURSgpOwo+ICsoCj4gKyAgICBlcnJvcl9hcHBlbmRfaGlu
dChlcnJwLCAuLi4pOwo+ICt8Cj4gKyAgICBlcnJvcl9wcmVwZW5kKGVycnAsIC4uLik7Cj4gK3wK
PiArICAgIGVycm9yX3ZwcmVwZW5kKGVycnAsIC4uLik7Cj4gK3wKPiArICAgIEVycm9yICpsb2Nh
bF9lcnIgPSBOVUxMOwo+ICsgICAgLi4uCj4gKygKPiArICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVw
ZW5kKGVycnAsIGxvY2FsX2VyciwgLi4uKTsKPiArfAo+ICsgICAgZXJyb3JfcHJvcGFnYXRlKGVy
cnAsIGxvY2FsX2Vycik7Cj4gKykKPiArKQo+ICsgICAgLi4uIHdoZW4gYW55Cj4gKyB9Cj4gKwo+
ICsKPiArLy8gTWF0Y2ggc2NlbmFyaW9zIHdpdGggcHJvcGFnYXRpb24gb2YgbG9jYWwgZXJyb3Ig
dG8gZXJycC4KPiArQHJ1bGUxIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0c0AKPiAr
aWRlbnRpZmllciBmbiwgbG9jYWxfZXJyOwo+ICtzeW1ib2wgZXJycDsKPiArQEAKPiArCj4gKyBm
biguLi4sIEVycm9yICoqZXJycCwgLi4uKQo+ICsgewo+ICsgICAgIC4uLgo+ICsgICAgIEVycm9y
ICpsb2NhbF9lcnIgPSBOVUxMOwo+ICsgICAgIC4uLgo+ICsoCj4gKyAgICBlcnJvcl9wcm9wYWdh
dGVfcHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsIC4uLik7Cj4gK3wKPiArICAgIGVycm9yX3Byb3Bh
Z2F0ZShlcnJwLCBsb2NhbF9lcnIpOwo+ICspCgpJbmRlbnRhdGlvbiBvZmYgYnkgb25lLgoKPiAr
ICAgICAuLi4KPiArIH0KPiArCj4gKy8vIENvbnZlcnQgc3BlY2lhbCBjYXNlIHdpdGggZ290byBp
biBzZXBhcmF0ZS4KCnMvaW4gc2VwYXJhdGUvc2VwYXJhdGVseS8KCj4gKy8vIFdlIGNhbiBwcm9i
YWJseSBtZXJnZSB0aGlzIGludG8gdGhlIGZvbGxvd2luZyBodW5rIHdpdGggaGVscCBvZiAoIHwg
KQo+ICsvLyBvcGVyYXRvciwgYnV0IGl0IHNpZ25pZmljYW50bHkgcmVkdWNlIHBlcmZvcm1hbmNl
IG9uIGJsb2NrLmMgcGFyc2luZyAob3IgaXQKCnMvcmVkdWNlL3JlZHVjZXMvCgo+ICsvLyBoYW5n
cywgSSBkb24ndCBrbm93KQoKU291bmRzIGxpa2UgeW91IHRyaWVkIHRvIG1lcmdlIHRoaXMgaW50
byB0aGUgZm9sbG93aW5nIGh1bmssIGJ1dCB0aGVuCnNwYXRjaCB0b29rIHNvIGxvbmcgb24gYmxv
Y2suYyB0aGF0IHlvdSBraWxsZWQgaXQuICBDb3JyZWN0PwoKPiArLy8KPiArLy8gTm90ZSBpbnRl
cmVzdGluZyB0aGluZzogaWYgd2UgZG9uJ3QgZG8gaXQgaGVyZSwgYW5kIHRyeSB0byBmaXh1cCAi
b3V0OiB9Igo+ICsvLyB0aGluZ3MgbGF0ZXIgYWZ0ZXIgYWxsIHRyYW5zZm9ybWF0aW9ucyAodGhl
IHJ1bGUgd2lsbCBiZSB0aGUgc2FtZSwganVzdAo+ICsvLyB3aXRob3V0IGVycm9yX3Byb3BhZ2F0
ZSgpIGNhbGwpLCBjb2NjaW5lbGxlIGZhaWxzIHRvIG1hdGNoIHRoaXMgIm91dDogfSIuCgpXZWly
ZCwgYnV0IG5vdCB3b3J0aCBmdXJ0aGVyIGludmVzdGlnYXRpb24uCgo+ICtAQAo+ICtpZGVudGlm
aWVyIHJ1bGUxLmZuLCBydWxlMS5sb2NhbF9lcnIsIG91dDsKPiArc3ltYm9sIGVycnA7Cj4gK0BA
Cj4gKwo+ICsgZm4oLi4uKQo+ICsgewo+ICsgICAgIDwuLi4KPiArLSAgICBnb3RvIG91dDsKPiAr
KyAgICByZXR1cm47Cj4gKyAgICAgLi4uPgo+ICstIG91dDoKPiArLSAgICBlcnJvcl9wcm9wYWdh
dGUoZXJycCwgbG9jYWxfZXJyKTsKCllvdSBuZWdsZWN0IHRvIG1hdGNoIGVycm9yX3Byb3BhZ2F0
ZV9wcmVwZW5kKCkuICBPa2F5LCBiZWNhdXNlICgxKSB0aGF0CnBhdHRlcm4gZG9lc24ndCBvY2N1
ciBpbiB0aGUgdHJlZSByaWdodCBub3csIGFuZCAoMikgaWYgaXQgZ2V0cyBhZGRlZCwKZ2NjIHdp
bGwgY29tcGxhaW4uCgo+ICsgfQo+ICsKPiArLy8gQ29udmVydCBtb3N0IG9mIGxvY2FsX2VyciBy
ZWxhdGVkIHN0YWZmLgoKcy9zdGFmZi9zdHVmZi8KCj4gKy8vCj4gKy8vIE5vdGUsIHRoYXQgd2Ug
dXBkYXRlIGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBtYXRjaGVkIGJ5IHJ1bGUxIGZ1bmN0aW9uIG5h
bWUKPiArLy8gYW5kIGxvY2FsX2VyciBuYW1lLiBXZSBtYXkgbWF0Y2ggc29tZXRoaW5nIG5vdCBy
ZWxhdGVkIHRvIHRoZSBwYXR0ZXJuCj4gKy8vIG1hdGNoZWQgYnkgcnVsZTEuIEZvciBleGFtcGxl
LCBsb2NhbF9lcnIgbWF5IGJlIGRlZmluZWQgd2l0aCB0aGUgc2FtZSBuYW1lCj4gKy8vIGluIGRp
ZmZlcmVudCBibG9ja3MgaW5zaWRlIG9uZSBmdW5jdGlvbiwgYW5kIGluIG9uZSBibG9jayBmb2xs
b3cgdGhlCj4gKy8vIHByb3BhZ2F0aW9uIHBhdHRlcm4gYW5kIGluIG90aGVyIGJsb2NrIGRvZXNu
J3QuIE9yIHdlIG1heSBoYXZlIHNldmVyYWwKPiArLy8gZnVuY3Rpb25zIHdpdGggdGhlIHNhbWUg
bmFtZSAoZm9yIGRpZmZlcmVudCBjb25maWd1cmF0aW9ucykuCgpDb250ZXh0OiBydWxlMSBtYXRj
aGVzIGZ1bmN0aW9ucyB0aGF0IGhhdmUgYWxsIHRocmVlIG9mCgoqIGFuIEVycm9yICoqZXJycCBw
YXJhbWV0ZXIKCiogYW4gRXJyb3IgKmxvY2FsX2VyciA9IE5VTEwgdmFyaWFibGUgZGVjbGFyYXRp
b24KCiogYW4gZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycikgb3IgZXJyb3JfcHJvcGFn
YXRlX3ByZXBlbmQoZXJycCwKICBsb2NhbF9lcnIsIC4uLikgZXhwcmVzc2lvbiwgd2hlcmUgQGVy
cnAgaXMgdGhlIHBhcmFtZXRlciBhbmQKICBAbG9jYWxfZXJyIGlzIHRoZSB2YXJpYWJsZS4KCklm
IEkgdW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5LCB5b3UncmUgcG9pbnRpbmcgb3V0IHR3byBwb3Rl
bnRpYWwgaXNzdWVzOgoKMS4gVGhpcyBydWxlIGNhbiBtYXRjaCBmdW5jdGlvbnMgcnVsZTEgZG9l
cyBub3QgbWF0Y2ggaWYgdGhlcmUgaXMKYW5vdGhlciBmdW5jdGlvbiB3aXRoIHRoZSBzYW1lIG5h
bWUgdGhhdCBydWxlMSBkb2VzIG1hdGNoLgoKMi4gVGhpcyBydWxlIG1hdGNoZXMgaW4gdGhlIGVu
dGlyZSBmdW5jdGlvbiBtYXRjaGVkIGJ5IHJ1bGUxLCBldmVuIHdoZW4KcGFydHMgb2YgdGhhdCBm
dW5jdGlvbiB1c2UgYSBkaWZmZXJlbnQgQGVycnAgb3IgQGxvY2FsX2Vyci4KCkkgZmlndXJlIHRo
ZXNlIGFwcGx5IHRvIGFsbCBydWxlcyB3aXRoIGlkZW50aWZpZXIgcnVsZTEuZm4sIG5vdCBqdXN0
CnRoaXMgb25lLiAgQ29ycmVjdD8KClJlZ2FyZGluZyAxLiAgVGhlcmUgbXVzdCBiZSBhIGJldHRl
ciB3YXkgdG8gY2hhaW4gcnVsZXMgdG9nZXRoZXIsIGJ1dCBJCmRvbid0IGtub3cgaXQuICBDYW4g
d2UgbWFrZSBDb2NjaW5lbGxlIGF0IGxlYXN0IHdhcm4gdXMgd2hlbiBpdCBjb252ZXJ0cwptdWx0
aXBsZSBmdW5jdGlvbnMgd2l0aCB0aGUgc2FtZSBuYW1lPyAgV2hhdCBhYm91dCB0aGlzOgoKICAg
QGluaXRpYWxpemU6cHl0aG9uQAogICBAQAogICBmbnByZXYgPSB7fQoKICAgZGVmIHByKGZuLCBw
KToKICAgICAgIHByaW50KCIjIyMgJXM6JXM6ICVzKCkiICUgKHBbMF0uZmlsZSwgcFswXS5saW5l
LCBmbikpCgogICBAckAKICAgaWRlbnRpZmllciBydWxlMS5mbjsKICAgcG9zaXRpb24gcDsKICAg
QEAKICAgIGZuKC4uLilAcAogICAgewogICAgICAgIC4uLgogICAgfQogICBAc2NyaXB0OnB5dGhv
bkAKICAgICAgIGZuIDw8IHJ1bGUxLmZuOwogICAgICAgcCA8PCByLnA7CiAgIEBACiAgIGlmIGZu
IG5vdCBpbiBmbnByZXY6CiAgICAgICBmbnByZXZbZm5dID0gcAogICBlbHNlOgogICAgICAgaWYg
Zm5wcmV2W2ZuXToKICAgICAgICAgICBwcihmbiwgZm5wcmV2W2ZuXSkKICAgICAgICAgICBmbnBy
ZXZbZm5dID0gTm9uZQogICAgICAgcHIoZm4sIHApCgpGb3IgZWFjaCBmdW5jdGlvbiBAZm4gbWF0
Y2hlZCBieSBydWxlMSwgZm5jbnRbZm5dIGlzIGFuIHVwcGVyIGxpbWl0IG9mCnRoZSBudW1iZXIg
b2YgZnVuY3Rpb25zIHdpdGggdGhlIHNhbWUgbmFtZSB3ZSB0b3VjaC4gIElmIGl0J3MgbW9yZSB0
aGFuCm9uZSwgd2UgcHJpbnQuCgpSZXBvcnRzIGFib3V0IGEgZG96ZW4gZnVuY3Rpb24gbmFtZXMg
Zm9yIHRoZSB3aG9sZSB0cmVlIGluIG15IHRlc3RpbmcuCkluc3BlY3RpbmcgdGhlIGNoYW5nZXMg
dG8gdGhlbSBtYW51YWxseSBpcyBmZWFzaWJsZS4gIE5vbmUgb2YgdGhlbSBhcmUKaW4gZmlsZXMg
dG91Y2hlZCBieSB0aGlzIHNlcmllcy4KClRoZSBsaW5lIHByaW50ZWQgZm9yIHRoZSBmaXJzdCBt
YXRjaCBpcyBwcmV0dHkgdXNlbGVzcyBmb3IgbWU6IGl0IHBvaW50cwp0byBhIENvY2NpbmVsbGUg
dGVtcG9yYXJ5IGZpbGUgKnNocnVnKi4KClJlZ2FyZGluZyAyLiAgU2hhZG93aW5nIEBlcnJwIG9y
IEBsb2NhbF9lcnIgd291bGQgYmUgaW4gYmFkIHRhc3RlLCBhbmQgSQpzdXJlIGhvcGUgd2UgZG9u
J3QgZG8gdGhhdC4gIE11bHRpcGxlIEBsb2NhbF9lcnIgdmFyaWFibGVzLi4uIGhtbS4KUGVyaGFw
cyB3ZSBjb3VsZCBhZ2FpbiBjb25jb2N0IHNvbWUgc2NyaXB0IHJ1bGVzIHRvIGxlYWQgdXMgdG8g
c3BvdHMgdG8KY2hlY2sgbWFudWFsbHkuICBTZWUgYmVsb3cgZm9yIG15IGF0dGVtcHQuCgpXaGF0
J3MgdGhlIHdvcnN0IHRoYXQgY291bGQgaGFwcGVuIGlmIHdlIGJsaW5kbHkgY29udmVydGVkIHN1
Y2ggY29kZT8KVGhlIGFuc3dlciB0byB0aGF0IHF1ZXN0aW9uIHRlbGxzIHVzIGhvdyBoYXJkIHRv
IHdvcmsgb24gZmluZGluZyBhbmQKY2hlY2tpbmcgdGhlc2UgZ3V5cy4KCj4gKy8vCj4gKy8vIE5v
dGUgYWxzbyB0aGF0IGVycnAtY2xlYW5pbmcgZnVuY3Rpb25zCj4gKy8vICAgZXJyb3JfZnJlZV9l
cnJwCj4gKy8vICAgZXJyb3JfcmVwb3J0X2VycnAKPiArLy8gICBlcnJvcl9yZXBvcnRmX2VycnAK
PiArLy8gICB3YXJuX3JlcG9ydF9lcnJwCj4gKy8vICAgd2Fybl9yZXBvcnRmX2VycnAKPiArLy8g
YXJlIG5vdCB5ZXQgaW1wbGVtZW50ZWQuIFRoZXkgbXVzdCBjYWxsIGNvcnJlc3BvbmRpbmcgRXJy
b3IqIC0gZnJlZWluZwo+ICsvLyBmdW5jdGlvbiBhbmQgdGhlbiBzZXQgKmVycnAgdG8gTlVMTCwg
dG8gYXZvaWQgZnVydGhlciBwcm9wYWdhdGlvbiB0bwo+ICsvLyBvcmlnaW5hbCBlcnJwIChjb25z
aWRlciBFUlJQX0FVVE9fUFJPUEFHQVRFIGluIHVzZSkuCj4gKy8vIEZvciBleGFtcGxlLCBlcnJv
cl9mcmVlX2VycnAgbWF5IGxvb2sgbGlrZSB0aGlzOgo+ICsvLwo+ICsvLyAgICB2b2lkIGVycm9y
X2ZyZWVfZXJycChFcnJvciAqKmVycnApCj4gKy8vICAgIHsKPiArLy8gICAgICAgIGVycm9yX2Zy
ZWUoKmVycnApOwo+ICsvLyAgICAgICAgKmVycnAgPSBOVUxMOwo+ICsvLyAgICB9Cj4gK0AgZXhp
c3RzQAo+ICtpZGVudGlmaWVyIHJ1bGUxLmZuLCBydWxlMS5sb2NhbF9lcnI7Cj4gK2V4cHJlc3Np
b24gbGlzdCBhcmdzOwo+ICtzeW1ib2wgZXJycDsKPiArQEAKPiArCj4gKyBmbiguLi4pCj4gKyB7
Cj4gKyAgICAgPC4uLgo+ICsoCgpFYWNoIG9mIHRoZSBmb2xsb3dpbmcgcGF0dGVybnMgYXBwbGll
cyBhbnl3aGVyZSBpbiB0aGUgZnVuY3Rpb24uCgpGaXJzdCBwYXR0ZXJuOiBkZWxldGUgQGxvY2Fs
X2VycgoKPiArLSAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKCkNvbW1vbiBjYXNlOiBvY2N1
cnMganVzdCBvbmNlLCBub3QgbmVzdGVkLiAgQW55dGhpbmcgZWxzZSBpcyBzdXNwaWNpb3VzLgoK
Qm90aCBjYW4gYmUgZGV0ZWN0ZWQgaW4gdGhlIHJlc3VsdGluZyBwYXRjaGVzIHdpdGggYSBiaXQg
b2YgQVdLCndpemFyZHJ5OgoKICAgICQgZ2l0LWRpZmYgLVUwIG1hc3Rlci4ucmV2aWV3LWVycm9y
LXY4IHwgYXdrICcvXkBAIC8geyBjdHggPSAkNTsgZm9yIChpID0gNjsgaSA8PSBORjsgaSsrKSBj
dHggPSBjdHggIiAiICRpOyBpZiAoY3R4ICE9IG9jdHgpIHsgb2N0eCA9IGN0eDsgbiA9IDAgfSB9
IC9eLSAqRXJyb3IgKlwqICpbQS1aYS16MC05X10rICo9ICpOVUxMOy8geyBpZiAoaW5kZXgoJDAs
ICJFIikgPiA2KSBwcmludCAibmVzdGVkXG4gICAgIiBjdHg7IGlmIChuKSBwcmludCAibW9yZSB0
aGFuIG9uZVxuICAgICIgY3R4OyBuKysgfScKICAgIG5lc3RlZAogICAgICAgIHN0YXRpYyB2b2lk
IHhlbl9ibG9ja19kcml2ZV9kZXN0cm95KFhlbkJsb2NrRHJpdmUgKmRyaXZlLCBFcnJvciAqKmVy
cnApCiAgICBuZXN0ZWQKICAgICAgICBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfZGV2aWNlX2Rlc3Ry
b3koWGVuQmFja2VuZEluc3RhbmNlICpiYWNrZW5kLAogICAgbmVzdGVkCiAgICAgICAgc3RhdGlj
IHZvaWQgeGVuX2Jsb2NrX2RldmljZV9kZXN0cm95KFhlbkJhY2tlbmRJbnN0YW5jZSAqYmFja2Vu
ZCwKICAgIG1vcmUgdGhhbiBvbmUKICAgICAgICBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfZGV2aWNl
X2Rlc3Ryb3koWGVuQmFja2VuZEluc3RhbmNlICpiYWNrZW5kLAoKT2guCgp4ZW5fYmxvY2tfZHJp
dmVfZGVzdHJveSgpIG5lc3RzIGl0cyBFcnJvciAqbG9jYWxfZXJyIGluIGEgY29uZGl0aW9uYWwu
Cgp4ZW5fYmxvY2tfZGV2aWNlX2Rlc3Ryb3koKSBoYXMgbXVsdGlwbGUgRXJyb3IgKmxvY2FsX2Vy
ci4KCkluIGJvdGggY2FzZXMsIG1hbnVhbCByZXZpZXcgaXMgcmVxdWlyZWQgdG8gZW5zdXJlIHRo
ZSBjb252ZXJzaW9uIGlzCm9rYXkuICBJIGJlbGlldmUgaXQgaXMuCgpOb3RlIHRoYXQgdGhlIEFX
SyBzY3JpcHQgcmVsaWVzIG9uIGRpZmYgc2hvd2luZyB0aGUgZnVuY3Rpb24gbmFtZSBpbiBAQAps
aW5lcywgd2hpY2ggZG9lc24ndCBhbHdheXMgd29yayBkdWUgdG8gb3VyIGNvZGluZyBzdHlsZS4K
CkZvciB0aGUgd2hvbGUgdHJlZSwgSSBnZXQgc29tZSAzMCBzcG90cy4gIEZlYXNpYmxlLgoKPiAr
fAoKU2Vjb25kIHBhdHRlcm46IGNsZWFyIEBlcnJwIGFmdGVyIGZyZWVpbmcgaXQKCj4gKwo+ICsv
LyBDb252ZXJ0IGVycm9yIGNsZWFyaW5nIGZ1bmN0aW9ucwoKU3VnZ2VzdDogRW5zdXJlIEBsb2Nh
bF9lcnIgaXMgY2xlYXJlZCBvbiBmcmVlCgo+ICsoCj4gKy0gICAgZXJyb3JfZnJlZShsb2NhbF9l
cnIpOwo+ICsrICAgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsKPiArfAo+ICstICAgIGVycm9yX3Jl
cG9ydF9lcnIobG9jYWxfZXJyKTsKPiArKyAgICBlcnJvcl9yZXBvcnRfZXJycChlcnJwKTsKPiAr
fAo+ICstICAgIGVycm9yX3JlcG9ydGZfZXJyKGxvY2FsX2VyciwgYXJncyk7Cj4gKysgICAgZXJy
b3JfcmVwb3J0Zl9lcnJwKGVycnAsIGFyZ3MpOwo+ICt8Cj4gKy0gICAgd2Fybl9yZXBvcnRfZXJy
KGxvY2FsX2Vycik7Cj4gKysgICAgd2Fybl9yZXBvcnRfZXJycChlcnJwKTsKPiArfAo+ICstICAg
IHdhcm5fcmVwb3J0Zl9lcnIobG9jYWxfZXJyLCBhcmdzKTsKPiArKyAgICB3YXJuX3JlcG9ydGZf
ZXJycChlcnJwLCBhcmdzKTsKPiArKQoKQXMgeW91IG1lbnRpb24gYWJvdmUsIHRoZXNlIGd1eXMg
ZG9uJ3QgZXhpc3QsIHlldC4gIEJ1aWxkcyBhbnl3YXksCmJlY2F1c2UgdGhpcyBwYXJ0IG9mIHRo
ZSBydWxlIGlzIG5vdCB1c2VkIGluIHRoaXMgcGF0Y2ggc2VyaWVzLiAgWW91CmRvbid0IHdhbnQg
dG8gb21pdCBpdCwgYmVjYXVzZSB0aGVuIHRoZSBzY3JpcHQgYmVjb21lcyB1bnNhZmUgdG8gdXNl
LgoKV2UgY291bGQgYWxzbyBvcGVuLWNvZGU6CgogICAvLyBDb252ZXJ0IGVycm9yIGNsZWFyaW5n
IGZ1bmN0aW9ucwogICAoCiAgIC0gICAgZXJyb3JfZnJlZShsb2NhbF9lcnIpOwogICArICAgIGVy
cm9yX2ZyZWUoKmVycnApOwogICArICAgICplcnJwID0gTlVMTDsKICAgfAogICAuLi4gYW5kIHNv
IGZvcnRoIC4uLgogICApCgpNYXR0ZXIgb2YgdGFzdGUuICBXaGF0ZXZlciBpcyBlYXNpZXIgdG8g
ZXhwbGFpbiBpbiB0aGUgY29tbWVudHMuICBTaW5jZQp5b3UgYWxyZWFkeSB3cm90ZSBvbmUuLi4K
CldlIHRhbGtlZCBhYm91dCBleHRlbmRpbmcgdGhpcyBzZXJpZXMgc2xpZ2h0bHkgc28gdGhlc2Ug
Z3V5cyBhcmUgdXNlZC4KSSBtYXkgc3RpbGwgbG9vayBpbnRvIHRoYXQuCgo+ICs/LSAgICBsb2Nh
bF9lcnIgPSBOVUxMOwo+ICsKClRoZSBuZXcgaGVscGVycyBjbGVhciBAbG9jYWxfZXJyLiAgQXNz
aWdubWVudCBub3cgcmVkdW5kYW50LCBkZWxldGUuCk9rYXkuCgo+ICt8CgpUaGlyZCBhbmQgZm91
cnRoIHBhdHRlcm46IGRlbGV0ZSBlcnJvcl9wcm9wYWdhdGUoKQoKPiArLSAgICBlcnJvcl9wcm9w
YWdhdGVfcHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsIGFyZ3MpOwo+ICsrICAgIGVycm9yX3ByZXBl
bmQoZXJycCwgYXJncyk7Cj4gK3wKPiArLSAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxf
ZXJyKTsKPiArfAoKRmlmdGggcGF0dGVybjogdXNlIEBlcnJwIGRpcmVjdGx5Cgo+ICstICAgICZs
b2NhbF9lcnIKPiArKyAgICBlcnJwCj4gKykKPiArICAgICAuLi4+Cj4gKyB9Cj4gKwo+ICsvLyBD
b252ZXJ0IHJlbWFpbmluZyBsb2NhbF9lcnIgdXNhZ2UuIEl0IHNob3VsZCBiZSBkaWZmZXJlbnQg
a2luZHMgb2YgZXJyb3IKPiArLy8gY2hlY2tpbmcgaW4gaWYgb3BlcmF0b3JzLiBXZSBjYW4ndCBt
ZXJnZSB0aGlzIGludG8gcHJldmlvdXMgaHVuaywgYXMgdGhpcwoKSW4gaWYgY29uZGl0aW9uYWxz
LCBJIHN1cHBvc2UuICBJdCdzIHRoZSBjYXNlIGZvciB0aGlzIHBhdGNoLiAgSWYgSQphcHBseSB0
aGUgc2NyaXB0IHRvIHRoZSB3aG9sZSB0cmVlLCB0aGUgcnVsZSBnZXRzIGFsc28gYXBwbGllZCBp
biBvdGhlcgpjb250ZXh0cy4gIFRoZSBzZW50ZW5jZSBtaWdodCBtaXNsZWFkIGFzIG11Y2ggYXMg
aXQgaGVscHMuICBLZWVwIGl0IG9yCmRlbGV0ZSBpdD8KCj4gKy8vIGNvbmZsaWN0cyB3aXRoIG90
aGVyIHN1YnN0aXR1dGlvbnMgaW4gaXQgKGF0IGxlYXN0IHdpdGggIi0gbG9jYWxfZXJyID0gTlVM
TCIpLgo+ICtAQAo+ICtpZGVudGlmaWVyIHJ1bGUxLmZuLCBydWxlMS5sb2NhbF9lcnI7Cj4gK3N5
bWJvbCBlcnJwOwo+ICtAQAo+ICsKPiArIGZuKC4uLikKPiArIHsKPiArICAgICA8Li4uCj4gKy0g
ICAgbG9jYWxfZXJyCj4gKysgICAgKmVycnAKPiArICAgICAuLi4+Cj4gKyB9Cj4gKwo+ICsvLyBB
bHdheXMgdXNlIHRoZSBzYW1lIHBhdHRlciBmb3IgY2hlY2tpbmcgZXJyb3IKCnMvcGF0dGVyL3Bh
dHRlcm4vCgo+ICtAQAo+ICtpZGVudGlmaWVyIHJ1bGUxLmZuOwo+ICtzeW1ib2wgZXJycDsKPiAr
QEAKPiArCj4gKyBmbiguLi4pCj4gKyB7Cj4gKyAgICAgPC4uLgo+ICstICAgICplcnJwICE9IE5V
TEwKPiArKyAgICAqZXJycAo+ICsgICAgIC4uLj4KPiArIH0KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
