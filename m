Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD73E13FF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 10:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNBs5-0008Sx-Vr; Wed, 23 Oct 2019 08:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xbdR=YQ=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iNBs4-0008So-NS
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 08:19:56 +0000
X-Inumbo-ID: e4f23bee-f56d-11e9-beca-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4f23bee-f56d-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 08:19:55 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e15so11668319pgu.13
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Usq/hwhGp+sLuQNTLLi/8cHLQgDFJmiu0tztUblGPXI=;
 b=vUo6gHnES2jcPMeHZC06Te/IbXNLg9xJfAU53IkQLCnMMyXLyqdR3bAEA5zO+KsskJ
 qNtTXo91L8xpz2RFv+K5N3WKvpOwVOv+dxoTE5zWmJL9alKvbTWzIsV5DS3zKd2p5cbY
 lj1pKHng4MGNZ/q0YuX3d4QvWhKzecj4H76mDVNijhk3NZfLOTVnvK8Gz5JOFaupyRJ3
 L92wkWG81Zmgf0xXiPrnnTzYFPDWZiENDyWILmf9mPFzAhE9yZIOclXAr5uGSF/yqert
 CczXouWvwBwjfYDSG1S8sd7+sIMtb3SNxr50CApFHgea6lqXv9YPzG8nQpiXtpjsZctP
 HJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Usq/hwhGp+sLuQNTLLi/8cHLQgDFJmiu0tztUblGPXI=;
 b=kIWsdn7XxZd+KYVzgJgUDO8tt8WQa9/PbBK3taGm6aF3Tb0/kQ0HY/609uB29m4xig
 nt8hEvt0s083YHa/xsSsdq8vIMHFNckh6hzHSY6R29YaddlorpH3Z/ynAuLp/wbBIBiv
 tkHD7O/0mlaZAH1IkdVFfIXBghnphVsOs/cBAhK0LKGs2WfqlHJiARgejtIV2MCiGlYX
 b/ulScZZHBqzvH31ASWsTHeiy7oPF/3we9+tbPyoJbxNzEODdgypcKZmdCUgb9yruLTj
 8ayfpdhftDpYWLkotR01oeGxPpVz28Bw3+R2rfaOGpJ28pwLDQA5RfkcB1wF+M5bSq4w
 vmeg==
X-Gm-Message-State: APjAAAWXE4XQ1OnRTHPfGhyEBpJQoEcpTfbsQ9NXZENXXW/MLBoWodbL
 zznLw2K1Ddcjsq0eEX0bHboJBFmZIdy0gX7Rem8=
X-Google-Smtp-Source: APXvYqzoUcWCWtkn1IsFrx6OYlXn6099JrZ3n/nZHW1zjH1Hrj8gKwFk9Lr/d7pvew6/N0QR5uIA1zz8XPvK09YRC1k=
X-Received: by 2002:a62:2643:: with SMTP id m64mr8891539pfm.232.1571818794634; 
 Wed, 23 Oct 2019 01:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-6-liuwe@microsoft.com>
In-Reply-To: <20191021155718.28653-6-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 23 Oct 2019 09:19:43 +0100
Message-ID: <CACCGGhC1N-Th-TwjbQEF9AmmuQ=RYuB5hizA8BCSXncP3EF0YA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH for-next v3 5/9] x86: introduce hypervisor
 framework
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

T24gTW9uLCAyMSBPY3QgMjAxOSBhdCAxNzowMSwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBXZSB3aWxsIHNvb24gaW1wbGVtZW50IEh5cGVyLVYgc3VwcG9ydCBmb3IgWGVuLiBBZGQg
YSBmcmFtZXdvcmsgZm9yCj4gdGhhdC4KPgo+IFRoaXMgcmVxdWlyZXMgbW92aW5nIHNvbWUgb2Yg
dGhlIGh5cGVydmlzb3JfKiBmdW5jdGlvbnMgZnJvbSB4ZW4uaCB0bwo+IGh5cGVydmlzb3IuaC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+CgpSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYv
Z3Vlc3QvTWFrZWZpbGUgICAgICAgICAgICB8ICAyICsKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydmlzb3IuYyAgICAgICAgfCA0NSArKysrKysrKysrKysrKysrKysrCj4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QuaCAgICAgICAgICAgIHwgIDEgKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDYxICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggICAgICAgIHwgMTIgLS0tLS0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+Cj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9N
YWtlZmlsZQo+IGluZGV4IDY4MDZmMDQ5NDcuLmY2M2Q2NGJiZWUgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2Vm
aWxlCj4gQEAgLTEgKzEsMyBAQAo+ICtvYmoteSArPSBoeXBlcnZpc29yLm8KPiArCj4gIHN1YmRp
ci0kKENPTkZJR19YRU5fR1VFU1QpICs9IHhlbgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODliOWFlNGRlMAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gQEAgLTAs
MCArMSw0NSBAQAo+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gKyAqIGFyY2gveDg2L2d1ZXN0
L2h5cGVydmlzb3IuYwo+ICsgKgo+ICsgKiBTdXBwb3J0IGZvciBkZXRlY3RpbmcgYW5kIHJ1bm5p
bmcgdW5kZXIgYSBoeXBlcnZpc29yLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+ICsgKiBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxp
c2hlZCBieQo+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhv
cGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZ
OyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+ICsgKiBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZQo+ICsgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6
Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkg
TWljcm9zb2Z0Lgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiArCj4gKyNp
bmNsdWRlIDxhc20vY2FjaGUuaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29yLmg+
Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpob3BzIF9fcmVhZF9tb3N0bHk7
Cj4gKwo+ICtib29sIGh5cGVydmlzb3JfcHJvYmUodm9pZCkKPiArewo+ICsgICAgaWYgKCBob3Bz
ICkKPiArICAgICAgICByZXR1cm4gdHJ1ZTsKPiArCj4gKyAgICByZXR1cm4gZmFsc2U7Cj4gK30K
PiArCj4gKy8qCj4gKyAqIExvY2FsIHZhcmlhYmxlczoKPiArICogbW9kZTogQwo+ICsgKiBjLWZp
bGUtc3R5bGU6ICJCU0QiCj4gKyAqIGMtYmFzaWMtb2Zmc2V0OiA0Cj4gKyAqIHRhYi13aWR0aDog
NAo+ICsgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKPiArICogRW5kOgo+ICsgKi8KPiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC5oCj4gaW5kZXggYTM4YzZiNWIzZi4uOGUxNjcxNjVhZSAxMDA2NDQKPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
LmgKPiBAQCAtMjAsNiArMjAsNyBAQAo+ICAjZGVmaW5lIF9fWDg2X0dVRVNUX0hfXwo+Cj4gICNp
bmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJjYWxsLmg+Cj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlw
ZXJ2aXNvci5oPgo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0L3B2aC1ib290Lmg+Cj4gICNpbmNsdWRl
IDxhc20vZ3Vlc3QveGVuLmg+Cj4gICNpbmNsdWRlIDxhc20vcHYvc2hpbS5oPgo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi4zODM0NGUyZTg5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gQEAgLTAsMCArMSw2MSBAQAo+ICsvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqCj4gKyAqIGFzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gKyAq
Cj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IKPiArICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9u
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4gKyAqIExpY2Vuc2UsIHZlcnNpb24gMiwgYXMg
cHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCj4gKyAqCj4gKyAqIFRo
aXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNl
ZnVsLAo+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1w
bGllZCB3YXJyYW50eSBvZgo+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQo+ICsgKiBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuCj4gKyAqCj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYwo+ICsgKiBMaWNlbnNlIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBNaWNyb3NvZnQuCj4gKyAqLwo+ICsK
PiArI2lmbmRlZiBfX1g4Nl9IWVBFUlZJU09SX0hfXwo+ICsjZGVmaW5lIF9fWDg2X0hZUEVSVklT
T1JfSF9fCj4gKwo+ICsjaWZkZWYgQ09ORklHX0dVRVNUCj4gKwo+ICtzdHJ1Y3QgaHlwZXJ2aXNv
cl9vcHMgewo+ICsgICAgLyogTmFtZSBvZiB0aGUgaHlwZXJ2aXNvciAqLwo+ICsgICAgY29uc3Qg
Y2hhciAqbmFtZTsKPiArICAgIC8qIE1haW4gc2V0dXAgcm91dGluZSAqLwo+ICsgICAgdm9pZCAo
KnNldHVwKSh2b2lkKTsKPiArICAgIC8qIEFQIHNldHVwICovCj4gKyAgICB2b2lkICgqYXBfc2V0
dXApKHZvaWQpOwo+ICsgICAgLyogUmVzdW1lIGZyb20gc3VzcGVuc2lvbiAqLwo+ICsgICAgdm9p
ZCAoKnJlc3VtZSkodm9pZCk7Cj4gK307Cj4gKwo+ICtib29sIGh5cGVydmlzb3JfcHJvYmUodm9p
ZCk7Cj4gK3ZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKPiArdm9pZCBoeXBlcnZpc29yX2Fw
X3NldHVwKHZvaWQpOwo+ICt2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOwo+ICsKPiArI2Vs
c2UKPiArCj4gKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9v
bCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpIHt9Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBo
eXBlcnZpc29yX2FwX3NldHVwKHZvaWQpIHt9Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZp
c29yX3Jlc3VtZSh2b2lkKSB7fQo+ICsKPiArI2VuZGlmICAvKiBDT05GSUdfR1VFU1QgKi8KPiAr
Cj4gKyNlbmRpZiAvKiBfX1g4Nl9IWVBFUlZJU09SX0hfXyAqLwo+ICsKPiArLyoKPiArICogTG9j
YWwgdmFyaWFibGVzOgo+ICsgKiBtb2RlOiBDCj4gKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKPiAr
ICogYy1iYXNpYy1vZmZzZXQ6IDQKPiArICogdGFiLXdpZHRoOiA0Cj4gKyAqIGluZGVudC10YWJz
LW1vZGU6IG5pbAo+ICsgKiBFbmQ6Cj4gKyAqLwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAo+IGlu
ZGV4IGIwMTVlZDE4ODMuLjMxNDVmNzUzNjEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC94ZW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgK
PiBAQCAtMzMsMTEgKzMzLDggQEAgZXh0ZXJuIGJvb2wgcHZfY29uc29sZTsKPiAgZXh0ZXJuIHVp
bnQzMl90IHhlbl9jcHVpZF9iYXNlOwo+Cj4gIHZvaWQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKTsK
PiAtdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwo+IC12b2lkIGh5cGVydmlzb3JfYXBfc2V0
dXAodm9pZCk7Cj4gIGludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4p
Owo+ICBpbnQgaHlwZXJ2aXNvcl9mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbik7Cj4gLXZvaWQg
aHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7Cj4KPiAgREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGlu
dCwgdmNwdV9pZCk7Cj4gIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdmNwdV9pbmZvICosIHZjcHVf
aW5mbyk7Cj4gQEAgLTQ5LDE1ICs0Niw2IEBAIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdmNwdV9p
bmZvICosIHZjcHVfaW5mbyk7Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIHByb2JlX2h5cGVydmlz
b3Iodm9pZCkge30KPgo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lk
KQo+IC17Cj4gLSAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiAtfQo+IC1zdGF0aWMgaW5saW5l
IHZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKQo+IC17Cj4gLSAgICBBU1NFUlRfVU5SRUFD
SEFCTEUoKTsKPiAtfQo+IC0KPiAgI2VuZGlmIC8qIENPTkZJR19YRU5fR1VFU1QgKi8KPiAgI2Vu
ZGlmIC8qIF9fWDg2X0dVRVNUX1hFTl9IX18gKi8KPgo+IC0tCj4gMi4yMC4xCj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1h
aWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
