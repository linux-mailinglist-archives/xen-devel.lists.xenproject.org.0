Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64712E137F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 09:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNBUa-0005Ev-FK; Wed, 23 Oct 2019 07:55:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xbdR=YQ=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iNBUY-0005Eo-OU
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 07:55:38 +0000
X-Inumbo-ID: 8014c8f2-f56a-11e9-a531-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8014c8f2-f56a-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 07:55:37 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c3so9695839plo.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Aw8JzlR9Ehl8awZpWDxxyNQsvuwpH3nMnwj5xKtpl2M=;
 b=o1pPFLmBaOWdYGg1LpWWqAlCviVPfRybWpeJomyQDzxaGfyTcfXvh3ZMyO1qp6Q+O6
 pOL4sbyge1AEbfboOiTC8nFWuz3z2UBc+H/zX3hW+W6iRsUL6SLh793J8MCJbiz+OaBX
 Uk68B5HaXspGTnjkTaWFRjzBP4xRU9HnCLfRodWYHPZtzs3KbOr8N5sR5397nnkBLE7A
 bElH9pvt8xhnCO9EaK8s/d0bJ8iivmPFcS0iUT3AOz2/H7f1v1PFbVOtvTXfnRjsco+N
 q8FBZTccxeKoeTRbFa1iRs7dXaA5t/ZZpbkxI0j4O69BIonjGgBhfmfqYu6W6r7fOJ/t
 bKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Aw8JzlR9Ehl8awZpWDxxyNQsvuwpH3nMnwj5xKtpl2M=;
 b=j+8+fK7XpEwr+qhmcVdJPT8C93zxRWBpU75lU0FhNj9am/LTNrzQUBS/dOxZr7Xkos
 dAltP0fwa3KAgP/xdMyxDyjQqKxuL57PmMJoKWK3HnLhRNuSPsbdC3ItD6oqNcFyXnOM
 RSbPiHJRdumTvPNxQX2BhMInPMdx8BQmLqJ/+ir4swbhMSjQ7hWVIcbE02+TGrCn7Bai
 +TrXXZ/JLYqihzbPcP97PYbN7Tp/ihYAseu3NIYtN2vLrrFd5YAgjsrSKmeguWSD4uMo
 TWcNB1RdCZKS0YWHukGq8gnpy24mI7sRXB++rWJwVKjKQK8zJkqsGKWO07OXBMBCEbV4
 O4mw==
X-Gm-Message-State: APjAAAVyV+GJXQXBSXwJHPa3JcA8QgXuPpHayWbhL75oN9ReB65rWqeJ
 eBPkz5e+HXh1X8LFgKGb/0ERvhADy561CuIsWB0=
X-Google-Smtp-Source: APXvYqzpdKquKop6h5SEC2A6re4AhkhQkcCYX1QEu5CidAGOkCwJmvcLM4Ie8/FyAGgif5Ki7FhjeuANq063TOsls3Q=
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr8273537plt.148.1571817336223; 
 Wed, 23 Oct 2019 00:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-2-liuwe@microsoft.com>
In-Reply-To: <20191021155718.28653-2-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 23 Oct 2019 08:55:24 +0100
Message-ID: <CACCGGhAk04+HBvCZsahhzEQB8my97=RVLbsxUbPkYRBX_TukVg@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH for-next v3 1/9] x86: introduce CONFIG_GUEST
 and move code
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

T24gTW9uLCAyMSBPY3QgMjAxOSBhdCAxNjo1OSwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBYZW4gaXMgYWJsZSB0byBydW4gYXMgYSBndWVzdCBvbiBYZW4uIFdlIHBsYW4gdG8gbWFr
ZSBpdCBhYmxlIHRvIHJ1bgo+IG9uIEh5cGVyLVYgYXMgd2VsbC4KPgo+IEludHJvZHVjZSBDT05G
SUdfR1VFU1Qgd2hpY2ggaXMgc2V0IHRvIHRydWUgaWYgZWl0aGVyIHJ1bm5pbmcgb24gWGVuCj4g
b3IgSHlwZXItViBpcyBkZXNpcmVkLiBSZXN0cnVjdHVyZSBjb2RlIGhpZXJhcmNoeSBmb3IgbmV3
IGNvZGUgdG8KPiBjb21lLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IFJldmlld2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2Fy
Y2gveDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCj4gIHhlbi9h
cmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgeGVuL2Fy
Y2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgNSArLS0tLQo+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL01ha2VmaWxlICAgICAgICAgICAgICAgfCA0ICsrKysKPiAgeGVu
L2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5TIHwgMAo+ICB4ZW4vYXJj
aC94ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgICAgICAgfCAwCj4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC97ID0+IHhlbn0veGVuLmMgICAgICAgICAgICB8IDAKPiAgNyBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQo+ICByZW5hbWUgeGVuL2FyY2gveDg2L2d1
ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5TICgxMDAlKQo+ICByZW5hbWUgeGVuL2FyY2gv
eDg2L2d1ZXN0L3sgPT4geGVufS9wdmgtYm9vdC5jICgxMDAlKQo+ICByZW5hbWUgeGVuL2FyY2gv
eDg2L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAoMTAwJSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4gaW5kZXggMjhiM2I0NjkyYS4u
ODY3ZGU4NTdlOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9LY29uZmlnCj4gQEAgLTE2MSw4ICsxNjEsMTIgQEAgY29uZmlnIFhFTl9BTElH
Tl8yTQo+Cj4gIGVuZGNob2ljZQo+Cj4gK2NvbmZpZyBHVUVTVAo+ICsgICAgICAgYm9vbAo+ICsK
PiAgY29uZmlnIFhFTl9HVUVTVAo+ICAgICAgICAgZGVmX2Jvb2wgbgo+ICsgICAgICAgc2VsZWN0
IEdVRVNUCj4gICAgICAgICBwcm9tcHQgIlhlbiBHdWVzdCIKPiAgICAgICAgIC0tLWhlbHAtLS0K
PiAgICAgICAgICAgU3VwcG9ydCBmb3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5pbmcg
dW5kZXIgWGVuLgoKVGhpcyB0ZXh0IG5lZWRzIHRvIGJlIG1vZGlmaWVkLiBQZXJoYXBzIGp1c3Qg
c2F5ICd3aGVuIGl0IGlzIHJ1bm5pbmcKaW4gYSB2aXJ0dWFsIG1hY2hpbmUnLiBUaGF0IHNob3Vs
ZCBiZSBmdXR1cmUtcHJvb2YuCgogIFBhdWwKCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9N
YWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+IGluZGV4IDI0NDNmZDJjYzUuLjk5YTEy
ZDAwOTAgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gKysrIGIveGVuL2Fy
Y2gveDg2L01ha2VmaWxlCj4gQEAgLTEsNyArMSw3IEBACj4gIHN1YmRpci15ICs9IGFjcGkKPiAg
c3ViZGlyLXkgKz0gY3B1Cj4gIHN1YmRpci15ICs9IGdlbmFwaWMKPiAtc3ViZGlyLSQoQ09ORklH
X1hFTl9HVUVTVCkgKz0gZ3Vlc3QKPiArc3ViZGlyLSQoQ09ORklHX0dVRVNUKSArPSBndWVzdAo+
ICBzdWJkaXItJChDT05GSUdfSFZNKSArPSBodm0KPiAgc3ViZGlyLXkgKz0gbW0KPiAgc3ViZGly
LSQoQ09ORklHX1hFTk9QUk9GKSArPSBvcHJvZmlsZQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUKPiBpbmRleCAy
NmZiNGIxMDA3Li42ODA2ZjA0OTQ3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9N
YWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQo+IEBAIC0xLDQgKzEg
QEAKPiAtb2JqLXkgKz0gaHlwZXJjYWxsX3BhZ2Uubwo+IC1vYmoteSArPSB4ZW4ubwo+IC0KPiAt
b2JqLWJpbi0kKENPTkZJR19QVkhfR1VFU1QpICs9IHB2aC1ib290LmluaXQubwo+ICtzdWJkaXIt
JChDT05GSUdfWEVOX0dVRVNUKSArPSB4ZW4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjI2ZmI0YjEwMDcKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQo+IEBAIC0wLDAg
KzEsNCBAQAo+ICtvYmoteSArPSBoeXBlcmNhbGxfcGFnZS5vCj4gK29iai15ICs9IHhlbi5vCj4g
Kwo+ICtvYmotYmluLSQoQ09ORklHX1BWSF9HVUVTVCkgKz0gcHZoLWJvb3QuaW5pdC5vCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcmNhbGxfcGFnZS5TIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L3hlbi9oeXBlcmNhbGxfcGFnZS5TCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4g
cmVuYW1lIGZyb20geGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMKPiByZW5hbWUg
dG8geGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9oeXBlcmNhbGxfcGFnZS5TCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9w
dmgtYm9vdC5jCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1lIGZyb20geGVuL2FyY2gv
eDg2L2d1ZXN0L3B2aC1ib290LmMKPiByZW5hbWUgdG8geGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9w
dmgtYm9vdC5jCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUg
ZnJvbSB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKPiByZW5hbWUgdG8geGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi94ZW4uYwo+IC0tCj4gMi4yMC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
