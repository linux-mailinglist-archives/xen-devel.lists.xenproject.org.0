Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D038D7DE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 18:18:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxvvp-0005Oz-LE; Wed, 14 Aug 2019 16:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zkAv=WK=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hxvvn-0005Ou-Rg
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 16:15:23 +0000
X-Inumbo-ID: b79bacfc-beae-11e9-87dd-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b79bacfc-beae-11e9-87dd-bc764e2007e4;
 Wed, 14 Aug 2019 16:15:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h13so7554124edq.10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QC0QEkR2NUYXIiutMH4Yjg8oK5Xo7/3TzdtOISTzmnM=;
 b=kE7hMxgvJpDN1TE8GPoSRkiFXeRcqW7gHwvb2gm9FHRyrzez/lVgOFkGHAQWR5IESE
 onC5asNA2pvrfBXTRzHveWUoT8jX0V6QYlnPmf29R91EBzvu+59x/LR3ihuYI+lzsg15
 ZRogkE7r65uin2PL5dw5HzTpmVUrVHKoNa7g19luY7/ZJnqQk5kaB2lw+rYT/0odYihm
 YREGLJygdA0qubMTqEYAYkB24BEYLYV+n2jvKCzEncdYZRHjvLpH62tia6roUUNX5pDW
 OwZ8m3f0pEvWiaaQ77drMS55RxdaY+h7gl4FGrgrbV/6E01EzWgqMxZSwa4vfaGyoNdT
 xTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QC0QEkR2NUYXIiutMH4Yjg8oK5Xo7/3TzdtOISTzmnM=;
 b=H6CJn38sp0HXnkNL4f2cmxYZxwE+fLjAO7EHb43v2bxJ9izkwDRmCey1rJCRau5ytx
 oe4L7bwEBXKZ7f8YkTOENyd31RyOBxvBtlZM1HgbnoYcNWyIxco7yHbnQM8Wj7PkLP0R
 +b51AmvTAszdsFDZ2sTRDzyV0dIwsoPmZmPriyquFzbyMY3p647QHVFNuhqnX2q1pOdP
 G0+SyHXEUPDvGD6fA6O8WXsh2ZuB0sAAySgGDEEo3fSMQKRDeyYIcRKlk6GPDhygxZ1h
 YXpygyc7wMfA6D/VeiOnJ4HN1FVZ3hmzdU4Wpe6MULQ8o+rWG24qGFQ5cnTTL+JU8H2n
 clBw==
X-Gm-Message-State: APjAAAUuQZxG2OgwiEi7i2919q7qIz5M6przSyleN8LplGCO6AQNBgIF
 t4GEvJSXpGIJ12Keasg8sRkRtZ3OSzKqzeKIVmg=
X-Google-Smtp-Source: APXvYqyePpIRKFFekRRjiqwg02ELrW1A65FUMJxI7h8Wd/FIss7bsmpguJgO2N4VBrdey3KfhAICKFIjKcXHbm643ks=
X-Received: by 2002:a50:89b4:: with SMTP id g49mr408812edg.39.1565799322262;
 Wed, 14 Aug 2019 09:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-2-jgross@suse.com>
In-Reply-To: <20190802130730.15942-2-jgross@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 14 Aug 2019 17:15:11 +0100
Message-ID: <CAFLBxZa=ymiPSQP+Z8_3+6UFnt1eu15Wv5Km-xpShwB=Mpx0MA@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/3] xen/sched: populate cpupool0 only after
 all cpus are up
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCAyOjA4IFBNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBXaXRoIGNvcmUgb3Igc29ja2V0IHNjaGVkdWxpbmcgd2UgbmVlZCB0
byBrbm93IHRoZSBudW1iZXIgb2Ygc2libGluZ3MKPiBwZXIgc2NoZWR1bGluZyB1bml0IGJlZm9y
ZSB3ZSBjYW4gc2V0dXAgdGhlIHNjaGVkdWxlciBwcm9wZXJseS4gSW4KPiBvcmRlciB0byBwcmVw
YXJlIHRoYXQgZG8gY3B1cG9vbDAgcG9wdWxhdGlvbiBvbmx5IGFmdGVyIGFsbCBjcHVzIGFyZQo+
IHVwLgo+Cj4gV2l0aCB0aGF0IGluIHBsYWNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gY3JlYXRlIGNw
dXBvb2wwIGVhcmxpZXIsIHNvCj4gZG8gdGhhdCBqdXN0IGJlZm9yZSBhc3NpZ25pbmcgdGhlIGNw
dXMuIEluaXRpYWxpemUgZnJlZSBjcHVzIHdpdGggYWxsCj4gb25saW5lIGNwdXMgYXQgdGhhdCB0
aW1lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gYWRkIHRoZSBjcHUgbm90aWZpZXIKPiBsYXRlLCB0
b28uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4g
LS0tCj4gVjE6IG5ldyBwYXRjaAo+IC0tLQo+ICB4ZW4vY29tbW9uL2NwdXBvb2wuYyB8IDE4ICsr
KysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdXBvb2wuYyBiL3hlbi9j
b21tb24vY3B1cG9vbC5jCj4gaW5kZXggZjkwZTQ5NmVkYS4uY2FlYTViZDhiMyAxMDA2NDQKPiAt
LS0gYS94ZW4vY29tbW9uL2NwdXBvb2wuYwo+ICsrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4g
QEAgLTc2MiwxOCArNzYyLDI4IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgY3B1X25m
YiA9IHsKPiAgICAgIC5ub3RpZmllcl9jYWxsID0gY3B1X2NhbGxiYWNrCj4gIH07Cj4KPiAtc3Rh
dGljIGludCBfX2luaXQgY3B1cG9vbF9wcmVzbXBfaW5pdCh2b2lkKQo+ICtzdGF0aWMgaW50IF9f
aW5pdCBjcHVwb29sX2luaXQodm9pZCkKPiAgewo+ICsgICAgdW5zaWduZWQgaW50IGNwdTsKPiAg
ICAgIGludCBlcnI7Cj4gLSAgICB2b2lkICpjcHUgPSAodm9pZCAqKShsb25nKXNtcF9wcm9jZXNz
b3JfaWQoKTsKPiArCj4gICAgICBjcHVwb29sMCA9IGNwdXBvb2xfY3JlYXRlKDAsIDAsICZlcnIp
Owo+ICAgICAgQlVHX09OKGNwdXBvb2wwID09IE5VTEwpOwo+ICAgICAgY3B1cG9vbF9wdXQoY3B1
cG9vbDApOwo+IC0gICAgY3B1X2NhbGxiYWNrKCZjcHVfbmZiLCBDUFVfT05MSU5FLCBjcHUpOwo+
ICAgICAgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKCZjcHVfbmZiKTsKPiArCj4gKyAgICBzcGluX2xv
Y2soJmNwdXBvb2xfbG9jayk7Cj4gKwo+ICsgICAgY3B1bWFza19jb3B5KCZjcHVwb29sX2ZyZWVf
Y3B1cywgJmNwdV9vbmxpbmVfbWFwKTsKPiArCj4gKyAgICBmb3JfZWFjaF9jcHUgKCBjcHUsICZj
cHVwb29sX2ZyZWVfY3B1cyApCj4gKyAgICAgICAgY3B1cG9vbF9hc3NpZ25fY3B1X2xvY2tlZChj
cHVwb29sMCwgY3B1KTsKPiArCj4gKyAgICBzcGluX3VubG9jaygmY3B1cG9vbF9sb2NrKTsKCkp1
c3QgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0J3MgaGFwcGVuaW5nIGhlcmUgLS0gY3B1
X2NhbGxiYWNrKCkKbm93IHdvbid0IGdldCBjYWxsZWQgd2l0aCBDUFVfT05MSU5FIGVhcmx5IGlu
IHRoZSBib290IHByb2Nlc3M7IGJ1dCBpdAp3aWxsIHN0aWxsIGJlIGNhbGxlZCB3aXRoIENQVV9P
TkxJTkUgaW4gb3RoZXIgY2lyY3Vtc3RhbmNlcyAoZS5nLiwKaG90LXBsdWcgLyBzdXNwZW5kIC8g
d2hhdGV2ZXIpPwoKSWYgbm90LCB0aGVuIGl0J3MgcHJvYmFibHkgYmVzdCB0byByZW1vdmUgQ1BV
X09OTElORSBmcm9tIHRoYXQgc3dpdGNoIHN0YXRlbWVudC4KClNvcnJ5IHRoYXQncyBhbiBvdmVy
bHktYmFzaWMgcXVlc3Rpb247IEkgZG9uJ3QgaGF2ZSBhIGdvb2QgcGljdHVyZSBmb3IKdGhlIGNw
dSBzdGF0ZSBtYWNoaW5lLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
