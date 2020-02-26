Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C9170246
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:23:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yUq-0001FI-F5; Wed, 26 Feb 2020 15:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5J6w=4O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6yUo-0001Ed-5j
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:21:10 +0000
X-Inumbo-ID: 9d8c7818-58ab-11ea-a490-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d8c7818-58ab-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 15:21:09 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dm3so3392876edb.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CiLtf7b2jQJhhpCJ6dSAmNzdc0Ex0Z4uN+wUf4aLeWo=;
 b=WZMRZhD0gi5ficibPlApljmbWXR5HSXzaA6YTc2/TAnTYHl6KGoyg+lbTpo3iMOgre
 qJsuBtD1byb08HA9wS08pWC4oS8SXGEzq6wkQlzEVW0HAosL5R0RSviKoRvhgTRMz42C
 RXBNiRfz71mDGnBDwf6DsTgMMJ3HwL3qihEFpVEcY5tzAwIlAlzbdYnmPT36k5WDVr5o
 u0DzO6W/9rZ6U02IzPZdCM/LFaxsvLAkZvHdk+8y37WINBcJltiropVh9Zv43pwzbsCk
 AYT30CY92TNLF4GlEs1eydPzzepDW6GNRr45+eAf0jNpBnGjZn90C44TaSoGJj7SeeES
 XBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CiLtf7b2jQJhhpCJ6dSAmNzdc0Ex0Z4uN+wUf4aLeWo=;
 b=tY+aohc0gw+afzxBqNdiswQTWYOD4ehAY0xm4aRQU94fbkQSd9WR/BR5KuJIUSY8pw
 NkY9lVhMDt6IB5/jDoptXVZrAxy/izLdtTDdu8KJ5qkLdDdxtXOQWcVMGkmsb1W2L+wB
 Qz/BqRViDftj8Rjo80ELiONspIXF2H4QO4e3AJGuuoijOC7mKh9oPHGoR2bBQaO6A6vI
 UZBBhmohdCVVc2JmbTGHFAihHMw0QbGtayCYP7gaCp0MBqIf2tWwVK9E6rPQ0pnCh/9K
 AvYuJ2SvxImBtHm/uL0SC/LfqB0w6c7iTL+6F5H8D0b04tjkhC0BZ3oK63Ghnt3Sc/2Q
 1XAQ==
X-Gm-Message-State: APjAAAUPkChelXSjuEBfTLiLK4GEdIrTiOA+XsVkq6Jd5XXwWsCBqZ6q
 9nMV8lGTZzAhqHgtv56kmfHL74SeXWU=
X-Google-Smtp-Source: APXvYqz19Vc+l1u09sgV8pnfnfQYvS0iQS7xTQjaYGruVKHTGUOoM+DBQQfrKZA24+ciyLNnuJwu6g==
X-Received: by 2002:a17:906:15d8:: with SMTP id
 l24mr5171316ejd.170.1582730468500; 
 Wed, 26 Feb 2020 07:21:08 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id q5sm140401edb.70.2020.02.26.07.21.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:21:07 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id m16so3486297wrx.11
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:21:07 -0800 (PST)
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr1101409wrw.182.1582730466869; 
 Wed, 26 Feb 2020 07:21:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <8df741964b56c10ed912f9187dcb31aae7251085.1582658216.git.tamas.lengyel@intel.com>
 <20200226151247.GF24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200226151247.GF24458@Air-de-Roger.citrite.net>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 26 Feb 2020 08:20:30 -0700
X-Gmail-Original-Message-ID: <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
Message-ID: <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v10 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ICsgICAgaWYgKCAocmV0ID0gY3B1cG9vbF9tb3ZlX2RvbWFpbihjZCwgZC0+Y3B1cG9vbCkp
ICkKPiA+ICsgICAgICAgIHJldHVybiByZXQ7Cj4KPiBZb3UgY2FuIGpvaW4gYm90aCBpZnMgaW50
byBhIHNpbmdsZSBvbmUsIHNpbmNlIGJvdGggcmV0dXJuIHJldC4KClN1cmUuCgo+ID4gKwo+ID4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IGNkLT5tYXhfdmNwdXM7IGkrKyApCj4gPiArICAgIHsKPiA+
ICsgICAgICAgIG1mbl90IHZjcHVfaW5mb19tZm47Cj4gPiArCj4gPiArICAgICAgICBpZiAoICFk
LT52Y3B1W2ldIHx8IGNkLT52Y3B1W2ldICkKPiA+ICsgICAgICAgICAgICBjb250aW51ZTsKPiA+
ICsKPiA+ICsgICAgICAgIGlmICggIXZjcHVfY3JlYXRlKGNkLCBpKSApCj4gPiArICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiArICAgICAgICAvKgo+ID4gKyAgICAgICAgICog
TWFwIGluIGEgcGFnZSBmb3IgdGhlIHZjcHVfaW5mbyBpZiB0aGUgZ3Vlc3QgdXNlcyBvbmUgdG8g
dGhlIGV4YWN0Cj4gPiArICAgICAgICAgKiBzYW1lIHNwb3QuCj4gPiArICAgICAgICAgKi8KPiA+
ICsgICAgICAgIHZjcHVfaW5mb19tZm4gPSBkLT52Y3B1W2ldLT52Y3B1X2luZm9fbWZuOwo+ID4g
KyAgICAgICAgaWYgKCAhbWZuX2VxKHZjcHVfaW5mb19tZm4sIElOVkFMSURfTUZOKSApCj4gPiAr
ICAgICAgICB7Cj4gPiArICAgICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiA+ICsg
ICAgICAgICAgICBtZm5fdCBuZXdfbWZuOwo+ID4gKyAgICAgICAgICAgIGdmbl90IGdmbiA9IG1m
bl90b19nZm4oZCwgdmNwdV9pbmZvX21mbik7Cj4gPiArICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBnZm5fbCA9IGdmbl94KGdmbik7Cj4gPiArCj4gPiArICAgICAgICAgICAgaWYgKCAhKHBhZ2Ug
PSBhbGxvY19kb21oZWFwX3BhZ2UoY2QsIDApKSApCj4gPiArICAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgICAgICAgIG5ld19tZm4gPSBwYWdlX3RvX21mbihw
YWdlKTsKPiA+ICsgICAgICAgICAgICBzZXRfZ3Bmbl9mcm9tX21mbihtZm5feChuZXdfbWZuKSwg
Z2ZuX2wpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgIGlmICggIShyZXQgPSBwMm0tPnNldF9lbnRy
eShwMm0sIGdmbiwgbmV3X21mbiwgUEFHRV9PUkRFUl80SywKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3JhbV9ydywgcDJtLT5kZWZhdWx0X2FjY2Vzcywg
LTEpKSApCj4gPiArICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArICAgICAg
ICAgICAgaWYgKCAhKHJldCA9IG1hcF92Y3B1X2luZm8oY2QtPnZjcHVbaV0sIGdmbl9sLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGQtPnZjcHVbaV0tPnZjcHVf
aW5mb19vZmZzZXQpKSApCj4gPiArICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiBJIHRo
aW5rIHlvdSBhbHNvIG5lZWQgdG8gY29weSB0aGUgY29udGVudHMgZnJvbSB0aGUgcGFyZW50IGlu
dG8gdGhvc2UKPiB2Y3B1X2luZm8gYXJlYXMsIG9yIGVsc2UgeW91IG1pZ2h0IGRpc2NhcmQgcGVu
ZGluZyBldmVudCBjaGFubmVscwo+IGNvbnRhaW5lZCBpbiB0aGUgZXZ0Y2huXyogZmllbGRzPyAo
YW5kIHRoZSBtYXNrZWQgY2hhbm5lbHMgaWYgYW55KS4KPgo+IFRoZSBydW50aW1lIGFyZWEgc2hv
dWxkIGJlIGhhbmRsZWQgaW4gYSBzaW1pbGFyIHdheSBBRkFJQ1QgKGFsYmVpdAo+IHRoZXJlJ3Mg
bm8gbmVlZCB0byBjb3B5IHRoZSBwYXJlbnQncyBkYXRhIGluIHRoYXQgY2FzZSksIHNlZQo+IFZD
UFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9tZW1vcnlfYXJlYS4KCldpbGwgZG8uCgoKPiA+ICtzdGF0
aWMgaW50IHBvcHVsYXRlX3NwZWNpYWxfcGFnZXMoc3RydWN0IGRvbWFpbiAqY2QpCj4gPiArewo+
ID4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGNkKTsKPiA+
ICsgICAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBwYXJhbXNbXSA9Cj4gPiArICAgIHsKPiA+
ICsgICAgICAgIEhWTV9QQVJBTV9TVE9SRV9QRk4sCj4gPiArICAgICAgICBIVk1fUEFSQU1fSU9S
RVFfUEZOLAo+ID4gKyAgICAgICAgSFZNX1BBUkFNX0JVRklPUkVRX1BGTiwKPiA+ICsgICAgICAg
IEhWTV9QQVJBTV9DT05TT0xFX1BGTgo+ID4gKyAgICB9Owo+ID4gKyAgICB1bnNpZ25lZCBpbnQg
aTsKPiA+ICsKPiA+ICsgICAgZm9yICggaT0wOyBpPDQ7IGkrKyApCj4KPiBOaXQ6IGNhbiB5b3Ug
cGxlYXNlIGFkZCBzb21lIHNwYWNlcyBhcm91bmQgdGhlIG9wZXJhdG9ycz8KClN1cmUuCgo+Cj4g
PiArICAgIHsKPiA+ICsgICAgICAgIHVpbnQ2NF90IHZhbHVlID0gMDsKPiA+ICsgICAgICAgIG1m
bl90IG5ld19tZm47Cj4gPiArICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwo+ID4gKwo+
ID4gKyAgICAgICAgaWYgKCBodm1fZ2V0X3BhcmFtKGNkLCBwYXJhbXNbaV0sICZ2YWx1ZSkgfHwg
IXZhbHVlICkKPiA+ICsgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsKPiA+ICsgICAgICAgIGlm
ICggIShwYWdlID0gYWxsb2NfZG9taGVhcF9wYWdlKGNkLCAwKSkgKQo+ID4gKyAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgICAgbmV3X21mbiA9IHBhZ2VfdG9fbWZu
KHBhZ2UpOwo+ID4gKyAgICAgICAgc2V0X2dwZm5fZnJvbV9tZm4obWZuX3gobmV3X21mbiksIHZh
bHVlKTsKPiA+ICsKPiA+ICsgICAgICAgIHJldHVybiBwMm0tPnNldF9lbnRyeShwMm0sIF9nZm4o
dmFsdWUpLCBuZXdfbWZuLCBQQUdFX09SREVSXzRLLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHAybV9yYW1fcncsIHAybS0+ZGVmYXVsdF9hY2Nlc3MsIC0xKTsKPgo+IEkgdGhp
bmsgeW91IGFsc28gbmVlZCB0byBjb3B5IHRoZSBjb250ZW50cyBmcm9tIHRoZSBwYXJlbnQgcGFn
ZSBoZXJlLgoKVGhlIHRvb2xzdGFjayBzaW1wbHkgY2xlYXJzIHRoZXNlIHBhZ2VzIGR1cmluZyBy
ZXN0b3JlIHNvIEknbSBub3Qgc3VyZQooc2VlIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X2h2bS5j
O2g9M2Y3ODI0OGYzMmZlYzIzOWRiNzdiMGU0ODNiMDE5NTIxMWU2Yjk3NDtoYj1IRUFEI2w2MSku
CkkgZG9uJ3Qgc2VlIHdoeSB5b3Ugd291bGQgaGF2ZSB0byBjbGVhciB0aGUgcGFnZXMgZmlyc3Qg
aWYgdGhleSBnZXQKb3ZlcndyaXR0ZW4gYnkgc2F2ZWQgdmVyc2lvbnMgbGF0ZXIuIE9yIHRoZXNl
IHBhZ2VzIGFyZSBleHBlY3RlZCB0byBiZQp0b3JuLWRvd24gYnkgdGhlIHNhdmUvcmVzdG9yZSBh
d2FyZSBndWVzdHM/Cgo+ID4gK3N0YXRpYyBpbnQgZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1
Y3QgZG9tYWluICpjZCkKPiA+ICt7Cj4gPiArICAgIGludCByYyA9IC1FQlVTWTsKPiA+ICsKPiA+
ICsgICAgaWYgKCAhY2QtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQgKQo+ID4gKyAgICAgICAgcmV0
dXJuIHJjOwo+ID4gKwo+ID4gKyAgICAvKgo+ID4gKyAgICAgKiBXZSBvbmx5IHdhbnQgdG8gZ2V0
IGFuZCBwYXVzZSB0aGUgcGFyZW50IG9uY2UsIG5vdCBlYWNoIHRpbWUgdGhpcwo+ID4gKyAgICAg
KiBvcGVyYXRpb24gaXMgcmVzdGFydGVkIGR1ZSB0byBwcmVlbXB0aW9uLgo+ID4gKyAgICAgKi8K
PiA+ICsgICAgaWYgKCAhY2QtPnBhcmVudF9wYXVzZWQgKQo+ID4gKyAgICB7Cj4gPiArICAgICAg
ICBpZiAoICFnZXRfZG9tYWluKGQpICkKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAgICBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsKPiA+ICsgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ID4g
KyAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgZG9tYWluX3BhdXNlKGQpOwo+ID4gKyAgICAg
ICAgY2QtPnBhcmVudF9wYXVzZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgY2QtPm1heF9wYWdlcyA9
IGQtPm1heF9wYWdlczsKPiA+ICsgICAgICAgIGNkLT5tYXhfdmNwdXMgPSBkLT5tYXhfdmNwdXM7
Cj4gPiArICAgIH0KPiA+ICsKPiA+ICsgICAgLyogdGhpcyBpcyBwcmVlbXB0aWJsZSBzbyBpdCdz
IHRoZSBmaXJzdCB0byBnZXQgZG9uZSAqLwo+ID4gKyAgICBpZiAoIChyYyA9IGZvcmtfaGFwX2Fs
bG9jYXRpb24oY2QsIGQpKSApCj4gPiArICAgICAgICBnb3RvIGRvbmU7Cj4gPiArCj4gPiArICAg
IGlmICggKHJjID0gYnJpbmdfdXBfdmNwdXMoY2QsIGQpKSApCj4gPiArICAgICAgICBnb3RvIGRv
bmU7Cj4gPiArCj4gPiArICAgIGlmICggKHJjID0gaHZtX2NvcHlfY29udGV4dF9hbmRfcGFyYW1z
KGNkLCBkKSkgKQo+ID4gKyAgICAgICAgZ290byBkb25lOwo+ID4gKwo+ID4gKyAgICBpZiAoIChy
YyA9IHBvcHVsYXRlX3NwZWNpYWxfcGFnZXMoY2QpKSApCj4gPiArICAgICAgICBnb3RvIGRvbmU7
Cj4gPiArCj4gPiArICAgIGZvcmtfdHNjKGNkLCBkKTsKPgo+IEkgdGhpbmsgeW91IG5lZWQgdG8g
Y29weSB0aGUgY29udGVudHMgb2YgdGhlIHNoYXJlZCBpbmZvIHBhZ2UgZnJvbSB0aGUKPiBwYXJl
bnQgaW50byB0aGUgY2hpbGQsIG9yIGVsc2UgeW91IGFyZSBkaXNjYXJkaW5nIGFueSBwZW5kaW5n
IGV2ZW50Cj4gY2hhbm5lbHMuIFlvdSBzaG91bGQgYWxzbyBtYXAgc3VjaCBzaGFyZWQgaW5mbyBw
YWdlIGludG8gdGhlIHNhbWUgZ2ZuCj4gYXMgdGhlIHBhcmVudC4KPgoKSSdsbCBsb29rIGludG8g
aXQsIHRoYW5rcyEKClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
