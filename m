Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA761457D6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:28:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGwl-0006zO-JG; Wed, 22 Jan 2020 14:25:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdgK=3L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuGwj-0006zH-OM
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:25:29 +0000
X-Inumbo-ID: 09a87226-3d23-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09a87226-3d23-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 14:25:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so7018463ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FO6JOXa4lXfiz9HzVjIMG2U3TGJjIsLe9UQLQ+pn6Iw=;
 b=EC1SUyfdM/wqRwXbK3Sp/ShbOC0rkDV5RFeOYICLOqDOa3YNJp0NrPMH2/AiAf6EVc
 xlvMle8ArTSaUtchffDaDOMbonOAvpdh/n1I7k6B7je3Ae+fNnE3eMgbkc69qewA70XP
 o+wPOJnK/lVcOdAJxC6abWz0o6EySonLeAqnY2P56lquCeLljg1pYI0dNqrjq7Ju9aUH
 ZbEcBVVtXiJqZA6ORzM2mDQc1ziQ3wZ0x7GayRBRysfTchtC7gJ1uCZ3OrjLQ8WLzLm9
 9Uhim6QT5Jgg+a1NHt7x8hyH+sfsDVOU/a12yq7lV2fCcFvfTBXdeI/Cw79lyvvyWAHS
 r7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FO6JOXa4lXfiz9HzVjIMG2U3TGJjIsLe9UQLQ+pn6Iw=;
 b=L4fMlbSySTd3YdT1Q+u4uhFV6QTkwk35cAPRlgET/xbug/qfj+CU2O1d9FUkJJ436x
 5ucbSwrgz4NcJp86H76h2NWdRT+/vvAVoYwfV+7p3/z4CJeukmTQ+kHtQ1L1shhqgZR3
 5r9yJy/+7X+7Oh1XI+VmoGeAwVuGZ9NrmyGvKWwxavvOCmpHS+WPSpCwd1TskSvqsPk8
 FJC0xkrvovMQFqtNu8Qozh6AfwXMlWIOHkIhexBxNNKRB/F17XnaFarjyN8mdPq0wsZV
 dqWqdwO+2POIfNjrYdqFhVU7pGYHL5VOQJmhfnHfuFwq2JVvqkC8gkdorj00Zq/FtVh3
 OeGA==
X-Gm-Message-State: APjAAAWxCDG6nFprMRGdR2YaJfTZzskbtpwarPYuJJES3kzYW5j+Nfdy
 G0Twr+ISl8LmozUtuN3FlkqH/SqMFzl0vZiBIms=
X-Google-Smtp-Source: APXvYqw1Lf/wI8Fq612OaZ3gDVLx2Pd91mCBJjJxs+QrTDv3lqW3Tg52WvkFZxJJoJR9XVgeXzzz5RVfKpzmmOHqXwk=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr19757930ljj.102.1579703127669; 
 Wed, 22 Jan 2020 06:25:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <27770209c1e2984cda8b9893ed6313fb2bdf30a6.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpv--A2zUieSAY47L9dppsP43rd=zrJdVB_Rxps3CWTnqQ@mail.gmail.com>
 <20200121211835.GQ1314@mail-itl>
In-Reply-To: <20200121211835.GQ1314@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Jan 2020 09:25:16 -0500
Message-ID: <CAKf6xpsgGY3dFNokZ_o34BpOB-wz2FBp3OJtS6-uW24_==+MNQ@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 05/16] libxl: Handle Linux stubdomain
 specific QEMU options.
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Eric Shelton <eshelton@pobox.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNDoxOCBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBK
YW4gMjAsIDIwMjAgYXQgMDI6MjQ6MThQTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDk6NDIgUE0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpCj4gPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEZyb206IEVyaWMgU2hlbHRvbiA8ZXNoZWx0b25AcG9ib3guY29tPgo+ID4gPgo+ID4gPiBU
aGlzIHBhdGNoIGNyZWF0ZXMgYW4gYXBwcm9wcmlhdGUgY29tbWFuZCBsaW5lIGZvciB0aGUgUUVN
VSBpbnN0YW5jZQo+ID4gPiBydW5uaW5nIGluIGEgTGludXgtYmFzZWQgc3R1YmRvbWFpbi4KPiA+
ID4KPiA+ID4gTk9URTogYSBudW1iZXIgb2YgaXRlbXMgYXJlIG5vdCBjdXJyZW50bHkgaW1wbGVt
ZW50ZWQgZm9yIExpbnV4LWJhc2VkCj4gPiA+IHN0dWJkb21haW5zLCBzdWNoIGFzOgo+ID4gPiAt
IHNhdmUvcmVzdG9yZQo+ID4gPiAtIFFNUCBzb2NrZXQKPiA+ID4gLSBncmFwaGljcyBvdXRwdXQg
KGUuZy4sIFZOQykKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBTaGVsdG9uIDxlc2hl
bHRvbkBwb2JveC5jb20+Cj4gPiA+Cj4gPiA+IFNpbW9uOgo+ID4gPiAgKiBmaXggZGlzayBwYXRo
Cj4gPiA+ICAqIGZpeCBjZHJvbSBwYXRoIGFuZCAiZm9ybWF0Igo+ID4gPiAgKiBwYXNzIGRvd25z
Y3JpcHQgZm9yIG5ldHdvcmsgaW50ZXJmYWNlcwo+ID4KPiA+IFNpbmNlIHRoaXMgaXMgaGVyZS4u
Lgo+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0
aGluZ3NsYWIuY29tPgo+ID4gPiBbZHJvcCBRdWJlcy1zcGVjaWZpYyBwYXJ0c10KPiA+Cj4gPiAu
Li5tYXliZSBtZW50aW9uIGRyb3BwaW5nIGRvd25zY3JpcHQgaGVyZT8gIE90aGVyd2lzZSB0aGUg
Y29tbWl0Cj4gPiBtZXNzYWdlIGFuZCBjb250ZW50cyBkb24ndCBtYXRjaC4KPgo+IEFoLCBpbmRl
ZWQuCj4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiA+ID4gLS0tCj4gPgo+ID4gPHNu
aXA+Cj4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiBpbmRleCAxNDJiOTYwLi5hNmQ0MGI3IDEw
MDY0NAo+ID4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiArKysgYi90
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiBAQCAtMTY5LDYgKzE2OSwzMSBAQCBpbnQg
bGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKPiA+ID4g
ICAgICAgICAgfQo+ID4gPiAgICAgIH0KPiA+ID4KPiA+ID4gKyAgICBpZiAoYl9pbmZvLT50eXBl
ID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTSAmJgo+ID4gPiArICAgICAgICBsaWJ4bF9kZWZib29s
X3ZhbChiX2luZm8tPmRldmljZV9tb2RlbF9zdHViZG9tYWluKSkgewo+ID4gPiArICAgICAgICBp
ZiAoIWJfaW5mby0+c3R1YmRvbWFpbl9rZXJuZWwpIHsKPiA+ID4gKyAgICAgICAgICAgIHN3aXRj
aCAoYl9pbmZvLT5kZXZpY2VfbW9kZWxfdmVyc2lvbikgewo+ID4gPiArICAgICAgICAgICAgICAg
IGNhc2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU5fVFJBRElUSU9OQUw6Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgIGJfaW5mby0+c3R1YmRvbWFpbl9rZXJuZWwgPQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2Fic19wYXRoKE5PR0MsICJpb2VtdS1z
dHViZG9tLmd6IiwgbGlieGxfX3hlbmZpcm13YXJlZGlyX3BhdGgoKSk7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgIGJfaW5mby0+c3R1YmRvbWFpbl9yYW1kaXNrID0gTlVMTDsKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBMSUJY
TF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTjoKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgYl9pbmZvLT5zdHViZG9tYWluX2tlcm5lbCA9Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICBsaWJ4bF9fYWJzX3BhdGgoTk9HQywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInN0dWJkb20tbGludXgta2VybmVsIiwKPiA+Cj4gPiBOb3QgdG8gYmlrZXNoZWQs
IGJ1dCB0aGlzIGNhbWUgdXAgaW4gYSBjb252ZXJzYXRpb24gYSBsaXR0bGUgd2hpbGUKPiA+IGFn
by4gIFN0dWJkb20gaXMgYSBnZW5lcmljIG5hbWUsIGFuZCB0aGlzIGNvZGUgaXMgZm9yIGEgZGV2
aWNlIG1vZGVsLgo+ID4gU28gc29tZSBjb21iaW5hdGlvbiBvZiBxZW11eywtZG19eywtbGludXh9
LWtlcm5lbCBzZWVtcyBtb3JlCj4gPiBkZXNjcmlwdGl2ZS4KPgo+IE1pbmlvcy1iYXNlZCB1c2Ug
aW9lbXUtc3R1YmRvbSwgc28gbWF5YmUKPiBpb2VtdS1zdHViZG9tLWxpbnV4LXtrZXJuZWwscm9v
dGZzfT8KCkkgdGhpbmsgaW9lbXUgaXMgdGhlIG5hbWUgb2YgdGhlIGxlZ2FjeSBmb3JrIG9mIHFl
bXUuICBMaW51eCBzdHViZG9tcwphcmUgcnVubmluZyBjbG9zZSB0byB1cHN0cmVhbSBxZW11LCBz
byB0aGF0J3Mgd2h5IEkgc3VnZ2VzdGVkIHRoYXQKbmFtZS4gIEJ1dCBpb2VtdSBkb2VzIG1hdGNo
IE1pbmktb3MsIGFuZCBjb252ZXkgdGhlIHB1cnBvc2Ugb2YgdGhlCnN0dWJkb20sIHNvIGl0IHdv
cmtzIGZyb20gdGhlIHBlcnNwZWN0aXZlLiAgSSBsZWF2ZSB0aGUgbmFtZSB1cCB0bwp5b3UuCgo+
ID4gSGF2aW5nIHNhaWQgdGhhdCwgSSdtIGZpbmUgd2l0aCBpdCBhcyBpcyBzaW5jZSBJIGRvbid0
IGltYWdpbmUgbW9yZQo+ID4gc3R1YmRvbXMgc2hvd2luZyB1cC4KPiA+Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX194ZW5maXJtd2FyZWRpcl9wYXRoKCkpOwo+
ID4gPiArICAgICAgICAgICAgICAgICAgICBiX2luZm8tPnN0dWJkb21haW5fcmFtZGlzayA9Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fYWJzX3BhdGgoTk9HQywKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInN0dWJkb20tbGludXgtcm9vdGZzIiwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX3hlbmZpcm13YXJl
ZGlyX3BhdGgoKSk7CgpJIHNldCBzdHViZG9tYWluX3JhbWRpc2ssIGJ1dCBub3Qgc3R1YmRvbWFp
bl9rZXJuZWwsIGFuZCB0aGUgcmFtZGlzawpvcHRpb24gd2Fzbid0IGhvbm9yZWQuICBUaGlzIGFz
c2lnbm1lbnQgbmVlZHMgdG8gYmUgdW5kZXIgJ2lmCighYl9pbmZvLT5zdHViZG9tYWluX3JhbWRp
c2spIHsnCgo+ID4gPiArICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gKyAgICAgICAg
ICAgICAgICBkZWZhdWx0Ogo+ID4gPiArICAgICAgICAgICAgICAgICAgICBhYm9ydCgpOwo+ID4K
PiA+IENhbiB3ZSByZXR1cm4gYW4gZXJyb3IgaW5zdGVhZD8KPgo+IEZvciBpbnZhbGlkIGVudW0g
dmFsdWU/CgpPa2F5LCB0aGF0IHVzZSBtYWtlcyBzZW5zZS4gIEl0IHdhcyBhIHJlZmxleGl2ZSBy
ZXNwb25zZSB0byBzZWVpbmcKYWJvcnQgaW4gYSBsaWJyYXJ5LgoKUmVnYXJkcywKSmFzb24KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
