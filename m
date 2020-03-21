Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B618E526
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2020 23:24:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFmTR-0005Dq-O1; Sat, 21 Mar 2020 22:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6tT=5G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFmTP-0005AG-HQ
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2020 22:20:07 +0000
X-Inumbo-ID: 1e022596-6bc2-11ea-b34e-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e022596-6bc2-11ea-b34e-bc764e2007e4;
 Sat, 21 Mar 2020 22:20:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m17so2946137wrw.11
 for <xen-devel@lists.xenproject.org>; Sat, 21 Mar 2020 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KYeWI3vB5FY5D/kI/7ohNMPnJa3WEi678P5+DoZL33U=;
 b=OqalHIaYwZNm/vSmN2XD5Z0bN3jkwk//3OiPMVFJoY1aWiCb6nL4gfGo+FdnTgOxeK
 dsR2iKq5bAfpuEGBSo/XuoxiAHlCVTRRtleFe/ZfOnTKeoLuvixXurTyFTrm3h0AqwYh
 7gD44Sy3exz1guQN2SBpPDMc8Pm/NRvW2DBfCMO87Gop8x9v3QNcD3B0o9zfn4Ed0/sU
 pLOBIO070nfrwbHeWwHSnLvOkD3Q0obRnvSYplseuwJk3aauh4xcdCnrvNJRlBrD2pmJ
 eQUmBH5VCfMVzL6bLqSfbV1Z43tJQcFI5goXLhTCHaZpdjykycX2zBX2CUJnGfSF1l4+
 I3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KYeWI3vB5FY5D/kI/7ohNMPnJa3WEi678P5+DoZL33U=;
 b=BS0ZnyQA8cpyqZLUJmOg0UAh1Bn8IayM/Mk7dyUjMeqXu53KCB6CeWltkL2fA5dP+O
 dc6aCQa8eistllUauUF2cQanzqC/lKm5bhogOWiz7+76ONhWojjSqqNiGIx28zUda+7m
 Bvf+QHtBU+UY7S1EG5TG1dGJbb1xd6di8yHfVkuelTBz7oPL9t4JtPq6qHZAByBpLI7C
 A2BUQXioqy/0qhftjOcsPomq6bZziJbfCWOeAJ2XjO2FALX2sJiRzZ/lq/GhaKvHbPym
 dvWNbiFhbg9frbrVnC3l28anlyFeonO17Qbymp2yE5oIqG599kv0+oOS6bmI5DABy4A+
 LEgA==
X-Gm-Message-State: ANhLgQ0/YyaAF/Doh/A/wbhr+Qn7R5gAkZzie/11eabPCPFdbXgQ3yG0
 4FJ0JwXt3QwBBr52nNcz9j/8S8t0n2jdHQupQG8=
X-Google-Smtp-Source: ADFU+vuI9FsoxGjda+87Kd/Ov6KpA5zGIsrXt8Q/QRQ/0s3gre26+p0KJHWVS9s5YdNw2KOze2orQFrwi4uUoGC9lsc=
X-Received: by 2002:adf:84a3:: with SMTP id 32mr15177348wrg.378.1584829205533; 
 Sat, 21 Mar 2020 15:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-5-andrew.cooper3@citrix.com>
In-Reply-To: <20200320212453.21685-5-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 21 Mar 2020 22:19:54 +0000
Message-ID: <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Introduce a xmemdup_bytes() helper
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gRnJpLCAyMCBNYXIgMjAyMCBhdCAyMToyNiwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBVc2UgaXQgdG8gc2ltcGxpZnkg
dGhlIHg4NiBtaWNyb2NvZGUgbG9naWMsIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgdG8gZHJvcCB0
aGUKPiAtRU5PTUVNIHByaW50a3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvY3B1L21p
Y3JvY29kZS9hbWQuYyAgIHwgIDkgKystLS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9j
b2RlL2ludGVsLmMgfCAgNyArKy0tLS0tCj4gIHhlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmggICAg
ICAgICAgfCAxMSArKysrKysrKysrKwoKSSBkaWQgbm90aWNlIGEgZmV3IHRpbWVzIGluIHRoZSBw
YXN0IG1vbnRocyB3aGVyZSBvbmx5IHRoZSB4ODYgZm9sa3MKd2hlcmUgQ0NlZCBldmVuIHdoZW4g
dGhlcmUgYXJlIGNoYW5nZXMgaW4gY29tbW9uIGNvZGUuCkV2ZW4gaWYgSSBhbSBtb3N0bHkgbGlr
ZWx5IGdvaW5nIHRvIGJlIGhhcHB5IHdpdGggdGhlIGNoYW5nZXMsIHlvdQpzaG91bGQgYXQgbGVh
c3QgZ2l2ZSB0aGUgb3RoZXIgbWFpbnRhaW5lcnMgYW4gb3Bwb3J0dW5pdHkgdG8Kb2JqZWN0L2Nv
bW1lbnQuCgpNYXkgSSBhc2sgdG8gQ0MgYWxsIHRoZSByZWxldmFudCBtYWludGFpbmVycyBpbiB0
aGUgZnV0dXJlPwpzY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCBzaG91bGQgZG8gdGhlIGpvYiBm
b3IgeW91LgoKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYyBi
L3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2FtZC5jCj4gaW5kZXggMDk5OGEzNmI1Yy4uMTJh
M2I2YjMyYyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2FtZC5jCj4gQEAgLTI5OSwxMSArMjk5
LDEwIEBAIHN0YXRpYyBpbnQgZ2V0X3Vjb2RlX2Zyb21fYnVmZmVyX2FtZCgKPiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiAgICAgIH0KPgo+IC0gICAgbWNfYW1kLT5tcGIgPSB4bWFsbG9jX2J5
dGVzKG1wYnVmLT5sZW4pOwo+ICsgICAgbWNfYW1kLT5tcGIgPSB4bWVtZHVwX2J5dGVzKG1wYnVm
LT5kYXRhLCBtcGJ1Zi0+bGVuKTsKPiAgICAgIGlmICggIW1jX2FtZC0+bXBiICkKPiAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiAgICAgIG1jX2FtZC0+bXBiX3NpemUgPSBtcGJ1Zi0+bGVuOwo+
IC0gICAgbWVtY3B5KG1jX2FtZC0+bXBiLCBtcGJ1Zi0+ZGF0YSwgbXBidWYtPmxlbik7Cj4KPiAg
ICAgIHByX2RlYnVnKCJtaWNyb2NvZGU6IENQVSVkIHNpemUgJXp1LCBibG9jayBzaXplICV1IG9m
ZnNldCAlenUgZXF1aXZJRCAlI3ggcmV2ICUjeFxuIiwKPiAgICAgICAgICAgICAgIHNtcF9wcm9j
ZXNzb3JfaWQoKSwgYnVmc2l6ZSwgbXBidWYtPmxlbiwgKm9mZnNldCwKPiBAQCAtMzM2LDE0ICsz
MzUsMTAgQEAgc3RhdGljIGludCBpbnN0YWxsX2VxdWl2X2NwdV90YWJsZSgKPiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiAgICAgIH0KPgo+IC0gICAgbWNfYW1kLT5lcXVpdl9jcHVfdGFibGUg
PSB4bWFsbG9jX2J5dGVzKG1wYnVmLT5sZW4pOwo+ICsgICAgbWNfYW1kLT5lcXVpdl9jcHVfdGFi
bGUgPSB4bWVtZHVwX2J5dGVzKG1wYnVmLT5kYXRhLCBtcGJ1Zi0+bGVuKTsKPiAgICAgIGlmICgg
IW1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlICkKPiAtICAgIHsKPiAtICAgICAgICBwcmludGsoS0VS
Tl9FUlIgIm1pY3JvY29kZTogQ2Fubm90IGFsbG9jYXRlIG1lbW9yeSBmb3IgZXF1aXZhbGVudCBj
cHUgdGFibGVcbiIpOwo+ICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+IC0gICAgfQo+Cj4gLSAg
ICBtZW1jcHkobWNfYW1kLT5lcXVpdl9jcHVfdGFibGUsIG1wYnVmLT5kYXRhLCBtcGJ1Zi0+bGVu
KTsKPiAgICAgIG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlX3NpemUgPSBtcGJ1Zi0+bGVuOwo+Cj4g
ICAgICByZXR1cm4gMDsKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUv
aW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMKPiBpbmRleCA2YWM1
Zjk4Njk0Li5mMjY1MTFkYTk4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9j
b2RlL2ludGVsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCj4g
QEAgLTMzOSwxMyArMzM5LDEwIEBAIHN0YXRpYyBsb25nIGdldF9uZXh0X3Vjb2RlX2Zyb21fYnVm
ZmVyKHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKiptYywKPiAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiAgICAgIH0KPgo+IC0gICAgKm1jID0geG1hbGxvY19ieXRlcyh0b3RhbF9zaXplKTsKPiAr
ICAgICptYyA9IHhtZW1kdXBfYnl0ZXMobWNfaGVhZGVyLCB0b3RhbF9zaXplKTsKPiAgICAgIGlm
ICggKm1jID09IE5VTEwgKQo+IC0gICAgewo+IC0gICAgICAgIHByaW50ayhLRVJOX0VSUiAibWlj
cm9jb2RlOiBlcnJvciEgQ2FuIG5vdCBhbGxvY2F0ZSBtZW1vcnlcbiIpOwo+ICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+IC0gICAgfQo+IC0gICAgbWVtY3B5KCptYywgKGNvbnN0IHZvaWQgKiko
YnVmICsgb2Zmc2V0KSwgdG90YWxfc2l6ZSk7Cj4gKwo+ICAgICAgcmV0dXJuIG9mZnNldCArIHRv
dGFsX3NpemU7Cj4gIH0KPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5o
IGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAo+IGluZGV4IGY1MTVjZWVlMmEuLjE2OTc5YTEx
N2MgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi94bWFsbG9jLmgKPiBAQCAtNTEsNiArNTEsMTcgQEAKPiAgI2RlZmluZSB4bWFs
bG9jX2J5dGVzKF9ieXRlcykgX3htYWxsb2MoX2J5dGVzLCBTTVBfQ0FDSEVfQllURVMpCj4gICNk
ZWZpbmUgeHphbGxvY19ieXRlcyhfYnl0ZXMpIF94emFsbG9jKF9ieXRlcywgU01QX0NBQ0hFX0JZ
VEVTKQo+Cj4gKy8qIEFsbG9jYXRlIHVudHlwZWQgc3RvcmFnZSBhbmQgY29weWluZyBhbiBleGlz
dGluZyBpbnN0YW5jZS4gKi8KPiArI2RlZmluZSB4bWVtZHVwX2J5dGVzKF9zcmMsIF9ucikgICAg
ICAgICAgICAgICAgXAo+ICsgICAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBucl8gPSAoX25yKTsgICAgICAgICAg
ICAgIFwKPiArICAgICAgICB2b2lkICpkc3RfID0geG1hbGxvY19ieXRlcyhucl8pOyAgICAgICAg
XAoKVGhlIG5yXyB2cyBfbnIgaXMgcmVhbGx5IGNvbmZ1c2luZyB0byByZWFkLiBDb3VsZCB5b3Ug
cmUtaW1wbGVtZW50IHRoZQpmdW5jdGlvbiBhcyBhIHN0YXRpYyBpbmxpbmU/CgpDaGVlcnMsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
