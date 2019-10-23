Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE34E1565
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 11:09:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNCYg-0006S6-4V; Wed, 23 Oct 2019 09:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xbdR=YQ=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iNCYe-0006Rv-O5
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 09:03:56 +0000
X-Inumbo-ID: 0a924618-f574-11e9-bbab-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a924618-f574-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 09:03:55 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y22so12523980pfr.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yo/CBmarzhASNwnxV4HwkTiKpVYPdkAcKMgGkl2ofzI=;
 b=j88sKTJQRKoewAEzpo5WpqF7SxfStfB4IVT8c2EZL9otfvzl6VRRMrnjyxQ4Lp6tGX
 Jd5M2Zzxe/CMJ8v6dh6TjSqLLf2g1dgSsY1xj4GGWOYavRfZMHt6uyjmgI9R6SzQBf55
 M1w/N0siIb4NB07GW8DzXXX+AcPHSIHtPXbHSKiqEDlVS1WZhbgKkKH9TciJq0N5Gs62
 od06DkEW1NasoXtxlzQ1HLkp/q7b/78RgAVZSzTBDd43MIGWgow8ScilG+1G5xeIcEl/
 n6x1DIcbyR4EXOB5XCbdUHkLNyH+sNbT/QxAwbcco2TnAvHs5fkqUDtr9yuX0OucOMDF
 p5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yo/CBmarzhASNwnxV4HwkTiKpVYPdkAcKMgGkl2ofzI=;
 b=kXCykucx1Nd/Bs9dpa2Rjfy9UdzWTrfrYEl8G59fn8NrhIiNhXvoJICC1L8P2vbk1v
 8PwBpO9o3BRHejcM4AF+9q7JXT5VQDJ/79VWkQEnhTgIvhL+JzXY+aEntaNK5Ajkt7rB
 iCgOcJ43GM6Ka24SbNCP+oTa296HNU0nhwt+8GWwDgjr/zObGnSdVU2M5zpznrwP/p+v
 p/ih9zW/pM7fjmHTwC39ROzSByl15G8IwTDh0fpZ9uHgjLRdD9lASlaYRreRzrKkLfIo
 XVej/HV+WIuTZ5SozLsYVCnqRx0IVzD1WgQp+AId5o353W3mejXPUlkUaRHBSIcpD/lk
 PTBg==
X-Gm-Message-State: APjAAAUo2dAioCP62cPQAy+N5AikeJ512bm1bbXu+oKFJxlbdkvCPVJm
 wKDVNTDSk5ymyXXty9WzBh//jgI0TLz5q10eMdNHWCA4dMdMDg==
X-Google-Smtp-Source: APXvYqzCXAPEDzirj9gklFf5Mbc9MwCsim8WgObx+N5taq2z0BIkUCDRL4AMhdp2tvt6Anv93qr6KPANcM2nbDg9xJU=
X-Received: by 2002:a17:90a:e001:: with SMTP id
 u1mr10238189pjy.102.1571821434288; 
 Wed, 23 Oct 2019 02:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-9-liuwe@microsoft.com>
In-Reply-To: <20191021155718.28653-9-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 23 Oct 2019 10:03:43 +0100
Message-ID: <CACCGGhAbawhxSWHbewiDH+ypWREd4Td0OZk5CHFekMofnjT64w@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH for-next v3 8/9] x86: be more verbose when
 running on a hypervisor
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMSBPY3QgMjAxOSBhdCAxNzowMCwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3
ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKPiAtLS0KPiBWMzogQWRkcmVzcyBS
b2dlcidzIGNvbW1lbnQsIGFkZCBBU1NFUlRzCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnZpc29yLmMgICAgICAgIHwgNiArKysrKysKPiAgeGVuL2FyY2gveDg2L3NldHVwLmMgICAg
ICAgICAgICAgICAgICAgfCA2ICsrKysrLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaCB8IDMgKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZp
c29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gaW5kZXggMzNiZjFhNzY5
ZC4uYTY2NmFkOTUyNiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNv
ci5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IEBAIC00Niw2ICs0
NiwxMiBAQCBib29sIGh5cGVydmlzb3JfcHJvYmUodm9pZCkKPiAgICAgIHJldHVybiBmYWxzZTsK
PiAgfQo+Cj4gK2NvbnN0IGNoYXIgKmh5cGVydmlzb3JfbmFtZSh2b2lkKQo+ICt7Cj4gKyAgICBB
U1NFUlQoaG9wcyk7Cj4gKyAgICByZXR1cm4gaG9wcy0+bmFtZTsKPiArfQo+ICsKPiAgdm9pZCBo
eXBlcnZpc29yX3NldHVwKHZvaWQpCj4gIHsKPiAgICAgIGlmICggaG9wcyAmJiBob3BzLT5zZXR1
cCApCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3Nl
dHVwLmMKPiBpbmRleCAwZWUxMWIxNWE2Li5jZjVhN2I4ZTFlIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiBAQCAtNjg5LDYg
KzY4OSw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcg
bWJpX3ApCj4gICAgICBpbnQgaSwgaiwgZTgyMF93YXJuID0gMCwgYnl0ZXMgPSAwOwo+ICAgICAg
Ym9vbCBhY3BpX2Jvb3RfdGFibGVfaW5pdF9kb25lID0gZmFsc2UsIHJlbG9jYXRlZCA9IGZhbHNl
Owo+ICAgICAgaW50IHJldDsKPiArICAgIGJvb2wgcnVubmluZ19vbl9oeXBlcnZpc29yOwo+ICAg
ICAgc3RydWN0IG5zMTY1NTBfZGVmYXVsdHMgbnMxNjU1MCA9IHsKPiAgICAgICAgICAuZGF0YV9i
aXRzID0gOCwKPiAgICAgICAgICAucGFyaXR5ICAgID0gJ24nLAo+IEBAIC03NjMsNyArNzY0LDcg
QEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkK
PiAgICAgICAqIGFsbG9jaW5nIGFueSB4ZW5oZWFwIHN0cnVjdHVyZXMgd2FudGVkIGluIGxvd2Vy
IG1lbW9yeS4gKi8KPiAgICAgIGtleGVjX2Vhcmx5X2NhbGN1bGF0aW9ucygpOwo+Cj4gLSAgICBo
eXBlcnZpc29yX3Byb2JlKCk7Cj4gKyAgICBydW5uaW5nX29uX2h5cGVydmlzb3IgPSBoeXBlcnZp
c29yX3Byb2JlKCk7Cj4KPiAgICAgIHBhcnNlX3ZpZGVvX2luZm8oKTsKPgo+IEBAIC03ODksNiAr
NzkwLDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBt
YmlfcCkKPgo+ICAgICAgcHJpbnRrKCJYZW4gaW1hZ2UgbG9hZCBiYXNlIGFkZHJlc3M6ICUjbHhc
biIsIHhlbl9waHlzX3N0YXJ0KTsKPgo+ICsgICAgaWYgKCBydW5uaW5nX29uX2h5cGVydmlzb3Ig
KQo+ICsgICAgICAgIHByaW50aygiUnVubmluZyBvbiAlc1xuIiwgaHlwZXJ2aXNvcl9uYW1lKCkp
Owo+ICsKPiAgI2lmZGVmIENPTkZJR19WSURFTwo+ICAgICAgcHJpbnRrKCJWaWRlbyBpbmZvcm1h
dGlvbjpcbiIpOwo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2aXNvci5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKPiBpbmRl
eCAzODM0NGUyZTg5Li5iNTgzNzIyZjVkIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnZpc29yLmgKPiBAQCAtMzYsMTUgKzM2LDE4IEBAIGJvb2wgaHlwZXJ2aXNvcl9wcm9iZSh2
b2lkKTsKPiAgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwo+ICB2b2lkIGh5cGVydmlzb3Jf
YXBfc2V0dXAodm9pZCk7Cj4gIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7Cj4gK2NvbnN0
IGNoYXIgKmh5cGVydmlzb3JfbmFtZSh2b2lkKTsKPgo+ICAjZWxzZQo+Cj4gKyNpbmNsdWRlIDx4
ZW4vbGliLmg+Cj4gICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPgo+ICBzdGF0aWMgaW5saW5lIGJv
b2wgaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+ICBzdGF0aWMgaW5s
aW5lIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKSB7fQo+ICBzdGF0aWMgaW5saW5lIHZvaWQg
aHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7fQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2
aXNvcl9yZXN1bWUodm9pZCkge30KPiArc3RhdGljIGlubGluZSBjaGFyICpoeXBlcnZpc29yX25h
bWUodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgcmV0dXJuIE5VTEw7IH0KPgo+ICAjZW5k
aWYgIC8qIENPTkZJR19HVUVTVCAqLwo+Cj4gLS0KPiAyLjIwLjEKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
