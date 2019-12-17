Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6837123393
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 18:31:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihGdl-00073h-BU; Tue, 17 Dec 2019 17:28:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oxhx=2H=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ihGdj-00073a-Mx
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 17:28:07 +0000
X-Inumbo-ID: 964e6c00-20f2-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 964e6c00-20f2-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 17:28:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so12238525wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 09:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
 :content-transfer-encoding;
 bh=vXn2Yu4RkHlP1Gh90RCX44u/DnD2AY3PkGZLCTXZShY=;
 b=cXjCCWzNHoaJgyu5OIAhA2JSISeRLzdsicjh5w4b9kGXxlnUazSpdYDlnZrlOSqKE4
 Ku04u/hnECWcv8Y62FEoFKtozKEyoaUrlIob2NUiMoaDQuy+mQYBNbbQLLaGBX/6O9KM
 pbFLYKyC38pfyCzXVwRPSwRsGTpVPoGxUJhbKQTbFnZMurl84obSvskY5a47FNc769Ap
 uz2SdvgyiFK88ICAM8PCOcgHRVOBNvnyiRZuqtfMJcjCgOEv/69SRvYPtLPsZwWZ4J0v
 BoWDMp/T+459syiNlholtJWR/jErBI1rTo4wYsVMRwAdYWCKbuYQ9xIyZnw46lSWOI3I
 jNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=vXn2Yu4RkHlP1Gh90RCX44u/DnD2AY3PkGZLCTXZShY=;
 b=tLA3ZP1WmfVHv+cMJH00ziZDMccYD31OpVEmm18UEjyeAOhFXbFGV6XFto1L2hZww7
 CKTjBQ7aJbwUsBkozJqNo1uH11cJkTe9Ei7sIx0D5GSrt0TK2L8x999dUoLvu82wNSUG
 VTX2kiAaB8GBZoKpfvWFEZ3myf26Rh0fm9LBhb7QeEk1kEo9GwaTqSH/0dHXd4qRnImX
 +ntLk5Iwweke1B9mUH5QGeBVMPOgTSTltZLlCrzOfF4DvVwOuiMtQlpwdgswRAiiS/if
 J5eggducqb2KC85ZBvfKkC6B3BGQNFJjgpbeSLi3vZndpwHrsWkdaLrdlhEC1ZEsnsej
 jn7w==
X-Gm-Message-State: APjAAAVlE+0HBPX6hHnQby2bIwfAWt5niQ3i4HaZ97RWftD8HamiNj2s
 Eee38NIQogpWOiGVK0oY3Fw=
X-Google-Smtp-Source: APXvYqxWnHbAUaxerL55jC58SIZbNR5PNO5hY231h8MMtPhz29c3VbD89coH273KvyzCzv+FPtZxKQ==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr38050795wrq.176.1576603685895; 
 Tue, 17 Dec 2019 09:28:05 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:2450:10d2:194d:5015:4c4c:42e9:e517])
 by smtp.gmail.com with ESMTPSA id 188sm3875074wmd.1.2019.12.17.09.28.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Dec 2019 09:28:05 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Tue, 17 Dec 2019 18:27:38 +0100
Message-Id: <20191217172738.20787-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
In-Reply-To: <f9a601af-4413-ed1d-f7f4-89343118a2f1@suse.com>
Subject: Re: [Xen-devel] [PATCH v11 2/6] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 SeongJae Park <sjpark@amazon.com>, konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSAxODoxMDoxOSArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE3LjEyLjE5IDE3OjI0LCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gT24gVHVlLCAxNyBEZWMgMjAxOSAxNzoxMzo0MiArMDEwMCAiSsO8cmdlbiBHcm/D
nyIgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+PiBPbiAxNy4xMi4xOSAxNzowNywg
U2VvbmdKYWUgUGFyayB3cm90ZToKPiA+Pj4gRnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFt
YXpvbi5kZT4KPiA+Pj4KPiA+Pj4gJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3
aXRoIGEgZHJpdmVyIGNvZGUgYXMgdGhpcyBjYWxsYmFjawo+ID4+PiB3aWxsIGJlIGNhbGxlZCBm
cm9tIGFueSBtZW1vcnkgcHJlc3N1cmUgZGV0ZWN0ZWQgY29udGV4dC4gIFRvIGRlYWwgd2l0aAo+
ID4+PiB0aGUgY2FzZSwgdGhpcyBjb21taXQgYWRkcyBhIHNwaW5sb2NrIGluIHRoZSAneGVuYnVz
X2RldmljZScuICBXaGVuZXZlcgo+ID4+PiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGlzIGNh
bGxlZCwgdGhlIGxvY2sgb2YgdGhlIGRldmljZSB3aGljaCBwYXNzZWQKPiA+Pj4gdG8gdGhlIGNh
bGxiYWNrIGFzIGl0cyBhcmd1bWVudCBpcyBsb2NrZWQuICBUaHVzLCBkcml2ZXJzIHJlZ2lzdGVy
aW5nCj4gPj4+IHRoZWlyICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgc2hvdWxkIHByb3RlY3Qg
dGhlIGRhdGEgdGhhdCBtaWdodCByYWNlCj4gPj4+IHdpdGggdGhlIGNhbGxiYWNrIHdpdGggdGhl
IGxvY2sgYnkgdGhlbXNlbHZlcy4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgIHwgIDEgKwo+ID4+PiAgICBkcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyB8IDEwICsrKysrKysrLS0KPiA+Pj4gICAgaW5j
bHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+ID4+PiAgICAz
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4+Cj4g
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiA+Pj4gaW5kZXggNWI0NzE4ODlkNzIzLi5i
ODYzOTNmMTcyZTYgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmUuYwo+ID4+PiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiA+
Pj4gQEAgLTQ3Miw2ICs0NzIsNyBAQCBpbnQgeGVuYnVzX3Byb2JlX25vZGUoc3RydWN0IHhlbl9i
dXNfdHlwZSAqYnVzLAo+ID4+PiAgICAJCWdvdG8gZmFpbDsKPiA+Pj4gICAgCj4gPj4+ICAgIAlk
ZXZfc2V0X25hbWUoJnhlbmRldi0+ZGV2LCAiJXMiLCBkZXZuYW1lKTsKPiA+Pj4gKwlzcGluX2xv
Y2tfaW5pdCgmeGVuZGV2LT5yZWNsYWltX2xvY2spOwo+ID4+PiAgICAKPiA+Pj4gICAgCS8qIFJl
Z2lzdGVyIHdpdGggZ2VuZXJpYyBkZXZpY2UgZnJhbWV3b3JrLiAqLwo+ID4+PiAgICAJZXJyID0g
ZGV2aWNlX3JlZ2lzdGVyKCZ4ZW5kZXYtPmRldik7Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4gPj4+IGluZGV4IDdlNzhlYmVmN2M1NC4uNTE2YWE2NGI5
OTY3IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Jh
Y2tlbmQuYwo+ID4+PiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tl
bmQuYwo+ID4+PiBAQCAtMjUxLDEyICsyNTEsMTggQEAgc3RhdGljIGludCBiYWNrZW5kX3Byb2Jl
X2FuZF93YXRjaChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5vdGlmaWVyLAo+ID4+PiAgICBzdGF0
aWMgaW50IGJhY2tlbmRfcmVjbGFpbV9tZW1vcnkoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpk
YXRhKQo+ID4+PiAgICB7Cj4gPj4+ICAgIAljb25zdCBzdHJ1Y3QgeGVuYnVzX2RyaXZlciAqZHJ2
Owo+ID4+PiArCXN0cnVjdCB4ZW5idXNfZGV2aWNlICp4ZGV2Owo+ID4+PiArCXVuc2lnbmVkIGxv
bmcgZmxhZ3M7Cj4gPj4+ICAgIAo+ID4+PiAgICAJaWYgKCFkZXYtPmRyaXZlcikKPiA+Pj4gICAg
CQlyZXR1cm4gMDsKPiA+Pj4gICAgCWRydiA9IHRvX3hlbmJ1c19kcml2ZXIoZGV2LT5kcml2ZXIp
Owo+ID4+PiAtCWlmIChkcnYgJiYgZHJ2LT5yZWNsYWltX21lbW9yeSkKPiA+Pj4gLQkJZHJ2LT5y
ZWNsYWltX21lbW9yeSh0b194ZW5idXNfZGV2aWNlKGRldikpOwo+ID4+PiArCWlmIChkcnYgJiYg
ZHJ2LT5yZWNsYWltX21lbW9yeSkgewo+ID4+PiArCQl4ZGV2ID0gdG9feGVuYnVzX2RldmljZShk
ZXYpOwo+ID4+PiArCQlzcGluX3RyeWxvY2tfaXJxc2F2ZSgmeGRldi0+cmVjbGFpbV9sb2NrLCBm
bGFncyk7Cj4gPj4KPiA+PiBZb3UgbmVlZCBzcGluX2xvY2tfaXJxc2F2ZSgpIGhlcmUuIE9yIG1h
eWJlIHNwaW5fbG9jaygpIHdvdWxkIGJlIGZpbmUsCj4gPj4gdG9vPyBJIGNhbid0IHNlZSBhIHJl
YXNvbiB3aHkgeW91J2Qgd2FudCB0byBkaXNhYmxlIGlycXMgaGVyZS4KPiA+IAo+ID4gSSBuZWVk
ZWQgdG8gZGlhYmxlIGlycSBoZXJlIGFzIHRoaXMgaXMgY2FsbGVkIGZyb20gdGhlIG1lbW9yeSBz
aHJpbmtlciBjb250ZXh0Lgo+IAo+IE9rYXkuCj4gCj4gPiAKPiA+IEFsc28sIHVzZWQgJ3RyeWxv
Y2snIGJlY2F1c2UgdGhlICdwcm9iZSgpJyBhbmQgJ3JlbW92ZSgpJyBjb2RlIG9mIHRoZSBkcml2
ZXIKPiA+IG1pZ2h0IGluY2x1ZGUgbWVtb3J5IGFsbG9jYXRpb24uICBBbmQgdGhlIHhlbi1ibGti
YWNrIGFjdHVhbGx5IGRvZXMuICBJZiB0aGUKPiA+IGFsbG9jYXRpb24gc2hvd3MgYSBtZW1vcnkg
cHJlc3N1cmUgZHVyaW5nIHRoZSBhbGxvY2F0aW9uLCBpdCB3aWxsIHRyaWdnZXIgdGhpcwo+ID4g
c2hyaW5rZXIgY2FsbGJhY2sgYWdhaW4gYW5kIHRoZW4gZGVhZGxvY2suCj4gCj4gSW4gdGhhdCBj
YXNlIHlvdSBuZWVkIHRvIGVpdGhlciByZXR1cm4gd2hlbiB5b3UgZGlkbid0IGdldCB0aGUgbG9j
ayBvcgoKWWVzLCBpdCBzaG91bGQuICBDYW5ub3QgYmVsaWV2ZSBob3cgSSBwb3N0ZWQgdGhpcyBj
b2RlLiAgU2VlbXMgSSBtYWRlIHNvbWUKdGVycmlibGUgbWlzdGFrZSB3aGlsZSBmb3JtYXR0aW5n
IHBhdGNoZXMuICBBbnl3YXksIHdpbGwgcmV0dXJuIGlmIGZhaWwgdG8KYWNxdWlyZSB0aGUgbG9j
aywgaW4gdGhlIG5leHQgdmVyc2lvbi4KCgpUaGFua3MsClNlb25nSmFlIFBhcmsKCj4gCj4gLSB3
aGVuIG9idGFpbmluZyB0aGUgbG9jayBkdXJpbmcgcHJvYmUoKSBhbmQgcmVtb3ZlKCkgc2V0IGEg
dmFyaWFibGUKPiAgICBjb250YWluaW5nIHRoZSBjdXJyZW50IGNwdSBudW1iZXIKPiAtIGFuZCBy
ZXNldCB0aGF0IHRvIGUuZyBOUl9DUFVTIGJlZm9yZSByZWxlYXNpbmcgdGhlIGxvY2sgYWdhaW4K
PiAtIGluIHRoZSBzaHJpbmtlciBjYWxsYmFjayBkbyB0cnlsb2NrLCBhbmQgaWYgeW91IGRpZG4n
dCBnZXQgdGhlIGxvY2sKPiAgICB0ZXN0IHdoZXRoZXIgdGhlIGNwdS12YXJpYWJsZSBhYm92ZSBp
cyBzZXQgdG8geW91ciBjdXJyZW50IGNwdSBhbmQKPiAgICBjb250aW51ZSBvbmx5IGlmIHllczsg
aWYgbm90LCByZWRvIHRoZSB0aGUgdHJ5bG9jawo+IAo+IAo+IEp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
