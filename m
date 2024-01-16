Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2AF82EEC8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 13:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667743.1039301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPiLc-0007Eb-Hc; Tue, 16 Jan 2024 12:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667743.1039301; Tue, 16 Jan 2024 12:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPiLc-0007Bn-Ey; Tue, 16 Jan 2024 12:15:16 +0000
Received: by outflank-mailman (input) for mailman id 667743;
 Tue, 16 Jan 2024 12:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvQ1=I2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPiLb-0007Be-6q
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 12:15:15 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e708698e-b468-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 13:15:14 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so9499810e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 04:15:14 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k7-20020ac24f07000000b0050e2167b30bsm1747885lfr.126.2024.01.16.04.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 04:15:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e708698e-b468-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705407314; x=1706012114; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VFSZkGrdyEjxd61iF2x+3wNW950ZESzCvEripApZt3M=;
        b=gfoj49rgMcOYykBxoRheHkQ4ssX08xcIA3lovX5Z4agIhAWV2MQ39/1ChB09LduvHz
         dFGXi3brhr1jXMLrh29+Erus7hJ8N4qSdb4imaJ/Dc0DZS9lcnWt6OcBvmRXZBu0iupB
         LK6ozmmVPsHzDWSvqeCKF1r4K7VEgkF2epplDllZ1Ho5xqh9mB5UhnlVO3gmbF7YBQAk
         SPHZjU+jy62uBYO0egVSkJKpQUSwF49RLw/nLOZvRiLl6FBYwXFOIPsbV9XqvK2RQ6M+
         Rr3zck3ED4A3pHpw/Jgo3MaiSzTmO3PyeH4lCdJuNItf1jb1jD0xuNQ0c5m/fSWujma7
         NtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705407314; x=1706012114;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFSZkGrdyEjxd61iF2x+3wNW950ZESzCvEripApZt3M=;
        b=eQ0fTe7Jse/tMPAdLrFVV5MgFCVdpyp3TeSng1Kigr16ae5mfYeFpHN1x3vScD4stF
         oWnwxTPrtE4sC/9Xs/H57Ndj+8tRArq3iv2IIGCJv9gqLbnVvFsK6KzjZZzdPVaOAsoZ
         6sfALSUSMPqR91BRTV9Yj8XXzcJPhetCELIXLrtkz8qfh41/zGENkvluWKaroUsCQKGu
         GHvimvHV52j0+Ag5FUHxfeXJLM1klbUlDHchsv03XwXM6gS71CwE9LXP27vw4XrXHpGA
         CaNmogEaE0Mlcd/PC2XQSiPWChp7kee032oh8vt+XDF0ukdXefP0F+PvQShp0/8ih4zP
         psqg==
X-Gm-Message-State: AOJu0YyZiHSktZb1rd/knGeC+8/fdGHD6Lh6NACmChhG2dknI2UkEZak
	9HJOyzX3W74eDuIuw6gI71A=
X-Google-Smtp-Source: AGHT+IEgRn/EfSS7vH3Hmwb10AiESIz2DiTksYvWvcXUIdrsjQfHu0SxLWg9l1fsMw38gL4Nck/B/Q==
X-Received: by 2002:a19:3852:0:b0:50e:7e1a:6ef4 with SMTP id d18-20020a193852000000b0050e7e1a6ef4mr2602683lfj.102.1705407313365;
        Tue, 16 Jan 2024 04:15:13 -0800 (PST)
Message-ID: <edd226da3423a69447b8083bc0b42f221adc943e.camel@gmail.com>
Subject: Re: [PATCH v5 5/8] RISC-V: annotate entry points with type and size
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bobby
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>
Date: Tue, 16 Jan 2024 14:15:11 +0200
In-Reply-To: <7c57d285-c81d-43d4-93fe-2152ea6ad7f8@suse.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
	 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
	 <7c57d285-c81d-43d4-93fe-2152ea6ad7f8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTAxLTE1IGF0IDE1OjM3ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBV
c2UgdGhlIGdlbmVyaWMgZnJhbWV3b3JrIGluIHhlbi9saW5rYWdlLmguIE5vIGNoYW5nZSBpbiBn
ZW5lcmF0ZWQKPiBjb2RlCj4gZXhjZXB0IG9mIGNvdXJzZSB0aGUgY29udmVydGVkIHN5bWJvbHMg
Y2hhbmdlIHRvIGJlIGhpZGRlbiBvbmVzIGFuZAo+IGdhaW4KPiBhIHZhbGlkIHNpemUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFBy
b2JhYmx5IGNvdW50X2FyZ3NfZXhwKCkgc2hvdWxkIG1vdmUgdG8gbWFjcm9zLmgsIGJ1dCBJIGZp
cnN0IHdhbnRlZAo+IHRvCj4gc2VlIHdoZXRoZXIgYW55b25lIGNhbiBzdWdnZXN0IGFueSBiZXR0
ZXIgYXBwcm9hY2ggZm9yIGNoZWNraW5nCj4gd2hldGhlcgo+IGEgZGVmaW5lZCBtYWNybyBleHBh
bmRzIHRvIG5vdGhpbmcuCj4gLS0tClRoZSBjdXJyZW50IG9uZSBhcHByb2FjaCBsb29rcyBnb29k
IHRvIG1lLgpSZXZpZXdlZC1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0Bn
bWFpbC5jb20+Cgp+IE9sZWtzaWkKCj4gdjU6IFJlLWJhc2UuCj4gdjQ6IEFsc28gZHJvcCAjdW5k
ZWYtcyBmcm9tIGxpbmtlciBzY3JpcHQuCj4gdjM6IE5ldy4KPiAKPiAtLS0gYS94ZW4vYXJjaC9y
aXNjdi9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gvcmlzY3YvZW50cnkuUwo+IEBAIC01LDcgKzUs
NyBAQAo+IMKgI2luY2x1ZGUgPGFzbS90cmFwcy5oPgo+IMKgCj4gwqAvKiBXSVA6IG9ubHkgd29y
a3Mgd2hpbGUgaW50ZXJydXB0aW5nIFhlbiBjb250ZXh0ICovCj4gLUVOVFJZKGhhbmRsZV90cmFw
KQo+ICtGVU5DKGhhbmRsZV90cmFwKQo+IMKgCj4gwqDCoMKgwqAgLyogRXhjZXB0aW9ucyBmcm9t
IHhlbiAqLwo+IMKgc2F2ZV90b19zdGFjazoKPiBAQCAtOTIsMyArOTIsNCBAQCByZXN0b3JlX3Jl
Z2lzdGVyczoKPiDCoMKgwqDCoMKgwqDCoMKgIFJFR19MwqDCoCBzcCwgQ1BVX1VTRVJfUkVHU19T
UChzcCkKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAgc3JldAo+ICtFTkQoaGFuZGxlX3RyYXApCj4g
LS0tIGEveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKPiArKysgYi94ZW4vYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+IEBAIC03LDYgKzcsNyBAQAo+IMKgI2RlZmluZSBfQVNN
X1JJU0NWX0FTTV9ICj4gwqAKPiDCoCNpZmRlZiBfX0FTU0VNQkxZX18KPiArI2luY2x1ZGUgPHhl
bi9saW5rYWdlLmg+Cj4gwqAjZGVmaW5lIF9fQVNNX1NUUih4KQl4Cj4gwqAjZWxzZQo+IMKgI2Rl
ZmluZSBfX0FTTV9TVFIoeCkJI3gKPiAtLS0gYS94ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
b25maWcuaAo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbmZpZy5oCj4gQEAg
LTY5LDEyICs2OSw4IEBACj4gwqAKPiDCoC8qIExpbmthZ2UgZm9yIFJJU0NWICovCj4gwqAjaWZk
ZWYgX19BU1NFTUJMWV9fCj4gLSNkZWZpbmUgQUxJR04gLmFsaWduIDQKPiAtCj4gLSNkZWZpbmUg
RU5UUlkobmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4gLcKgIC5nbG9ibCBuYW1lO8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4g
LcKgIEFMSUdOO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gLcKgIG5hbWU6Cj4gKyNk
ZWZpbmUgQ09ERV9BTElHTiAxNgo+ICsjZGVmaW5lIENPREVfRklMTCAvKiBlbXB0eSAqLwo+IMKg
I2VuZGlmCj4gwqAKPiDCoCNpZmRlZiBDT05GSUdfUklTQ1ZfNjQKPiAtLS0gYS94ZW4vYXJjaC9y
aXNjdi9yaXNjdjY0L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L3Jpc2N2NjQvaGVhZC5T
Cj4gQEAgLTgsNyArOCw3IEBACj4gwqDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIGEwIC0+IGhhcnRf
aWQgKCBib290Y3B1X2lkICkKPiDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgYTEgLT4gZHRiX2Jh
c2UgCj4gwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gLUVOVFJZKHN0YXJ0KQo+ICtGVU5DKHN0YXJ0
KQo+IMKgwqDCoMKgwqDCoMKgwqAgLyogTWFzayBhbGwgaW50ZXJydXB0cyAqLwo+IMKgwqDCoMKg
wqDCoMKgwqAgY3Nyd8KgwqDCoCBDU1JfU0lFLCB6ZXJvCj4gwqAKPiBAQCAtNjAsMTkgKzYwLDIx
IEBAIEVOVFJZKHN0YXJ0KQo+IMKgwqDCoMKgwqDCoMKgwqAgbXbCoMKgwqDCoMKgIGExLCBzMQo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCB0YWlswqDCoMKgIHN0YXJ0X3hlbgo+ICtFTkQoc3RhcnQp
Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgIC5zZWN0aW9uIC50ZXh0LCAiYXgiLCAlcHJvZ2JpdHMK
PiDCoAo+IC1FTlRSWShyZXNldF9zdGFjaykKPiArRlVOQyhyZXNldF9zdGFjaykKPiDCoMKgwqDC
oMKgwqDCoMKgIGxhwqDCoMKgwqDCoCBzcCwgY3B1MF9ib290X3N0YWNrCj4gwqDCoMKgwqDCoMKg
wqDCoCBsacKgwqDCoMKgwqAgdDAsIFNUQUNLX1NJWkUKPiDCoMKgwqDCoMKgwqDCoMKgIGFkZMKg
wqDCoMKgIHNwLCBzcCwgdDAKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAgcmV0Cj4gK0VORChyZXNl
dF9zdGFjaykKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAgLnNlY3Rpb24gLnRleHQuaWRlbnQsICJh
eCIsICVwcm9nYml0cwo+IMKgCj4gLUVOVFJZKHR1cm5fb25fbW11KQo+ICtGVU5DKHR1cm5fb25f
bW11KQo+IMKgwqDCoMKgwqDCoMKgwqAgc2ZlbmNlLnZtYQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oCBsacKgwqDCoMKgwqAgdDAsIFJWX1NUQUdFMV9NT0RFCj4gQEAgLTg0LDMgKzg2LDQgQEAgRU5U
UlkodHVybl9vbl9tbXUpCj4gwqDCoMKgwqDCoMKgwqDCoCBjc3J3wqDCoMKgIENTUl9TQVRQLCB0
MQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCBqcsKgwqDCoMKgwqAgYTAKPiArRU5EKHR1cm5fb25f
bW11KQo+IC0tLSBhL3hlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL3Jp
c2N2L3hlbi5sZHMuUwo+IEBAIC0xLDkgKzEsNiBAQAo+IMKgI2luY2x1ZGUgPHhlbi9saWIuaD4K
PiDCoCNpbmNsdWRlIDx4ZW4veGVuLmxkcy5oPgo+IMKgCj4gLSN1bmRlZiBFTlRSWQo+IC0jdW5k
ZWYgQUxJR04KPiAtCj4gwqBPVVRQVVRfQVJDSChyaXNjdikKPiDCoEVOVFJZKHN0YXJ0KQo+IMKg
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpbmthZ2UuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9saW5rYWdlLmgKPiBAQCAtMzUsMTcgKzM1LDI4IEBACj4gwqAKPiDCoCNkZWZpbmUgRU5EKG5h
bWUpIC5zaXplIG5hbWUsIC4gLSBuYW1lCj4gwqAKPiArLyoKPiArICogQ09ERV9GSUxMIGluIHBh
cnRpY3VsYXIgbWF5IG5lZWQgdG8gZXhwYW5kIHRvIG5vdGhpbmcgKGUuZy4gZm9yCj4gUklTQy1W
KSwgaW4KPiArICogd2hpY2ggY2FzZSB3ZSBhbHNvIG5lZWQgdG8gZ2V0IHJpZCBvZiB0aGUgY29t
bWEgaW4gdGhlIC5iYWxpZ24KPiBkaXJlY3RpdmUuCj4gKyAqLwo+ICsjZGVmaW5lIGNvdW50X2Fy
Z3NfZXhwKGFyZ3MuLi4pIGNvdW50X2FyZ3MoYXJncykKPiArI2lmIGNvdW50X2FyZ3NfZXhwKENP
REVfRklMTCkKPiArIyBkZWZpbmUgRE9fQ09ERV9BTElHTihhbGlnbi4uLikgTEFTVEFSRyhDT0RF
X0FMSUdOLCAjIyBhbGlnbiksCj4gQ09ERV9GSUxMCj4gKyNlbHNlCj4gKyMgZGVmaW5lIERPX0NP
REVfQUxJR04oYWxpZ24uLi4pIExBU1RBUkcoQ09ERV9BTElHTiwgIyMgYWxpZ24pCj4gKyNlbmRp
Zgo+ICsKPiDCoCNkZWZpbmUgRlVOQyhuYW1lLCBhbGlnbi4uLikgXAo+IC3CoMKgwqDCoMKgwqDC
oCBTWU0obmFtZSwgRlVOQywgR0xPQkFMLCBMQVNUQVJHKENPREVfQUxJR04sICMjIGFsaWduKSwK
PiBDT0RFX0ZJTEwpCj4gK8KgwqDCoMKgwqDCoMKgIFNZTShuYW1lLCBGVU5DLCBHTE9CQUwsIERP
X0NPREVfQUxJR04oYWxpZ24pKQo+IMKgI2RlZmluZSBMQUJFTChuYW1lLCBhbGlnbi4uLikgXAo+
IC3CoMKgwqDCoMKgwqDCoCBTWU0obmFtZSwgTk9ORSwgR0xPQkFMLCBMQVNUQVJHKENPREVfQUxJ
R04sICMjIGFsaWduKSwKPiBDT0RFX0ZJTEwpCj4gK8KgwqDCoMKgwqDCoMKgIFNZTShuYW1lLCBO
T05FLCBHTE9CQUwsIERPX0NPREVfQUxJR04oYWxpZ24pKQo+IMKgI2RlZmluZSBEQVRBKG5hbWUs
IGFsaWduLi4uKSBcCj4gwqDCoMKgwqDCoMKgwqDCoCBTWU0obmFtZSwgREFUQSwgR0xPQkFMLCBM
QVNUQVJHKERBVEFfQUxJR04sICMjIGFsaWduKSwKPiBEQVRBX0ZJTEwpCj4gwqAKPiDCoCNkZWZp
bmUgRlVOQ19MT0NBTChuYW1lLCBhbGlnbi4uLikgXAo+IC3CoMKgwqDCoMKgwqDCoCBTWU0obmFt
ZSwgRlVOQywgTE9DQUwsIExBU1RBUkcoQ09ERV9BTElHTiwgIyMgYWxpZ24pLAo+IENPREVfRklM
TCkKPiArwqDCoMKgwqDCoMKgwqAgU1lNKG5hbWUsIEZVTkMsIExPQ0FMLCBET19DT0RFX0FMSUdO
KGFsaWduKSkKPiDCoCNkZWZpbmUgTEFCRUxfTE9DQUwobmFtZSwgYWxpZ24uLi4pIFwKPiAtwqDC
oMKgwqDCoMKgwqAgU1lNKG5hbWUsIE5PTkUsIExPQ0FMLCBMQVNUQVJHKENPREVfQUxJR04sICMj
IGFsaWduKSwKPiBDT0RFX0ZJTEwpCj4gK8KgwqDCoMKgwqDCoMKgIFNZTShuYW1lLCBOT05FLCBM
T0NBTCwgRE9fQ09ERV9BTElHTihhbGlnbikpCj4gwqAjZGVmaW5lIERBVEFfTE9DQUwobmFtZSwg
YWxpZ24uLi4pIFwKPiDCoMKgwqDCoMKgwqDCoMKgIFNZTShuYW1lLCBEQVRBLCBMT0NBTCwgTEFT
VEFSRyhEQVRBX0FMSUdOLCAjIyBhbGlnbiksCj4gREFUQV9GSUxMKQo+IMKgCj4gCgo=


