Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D071E44
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 19:59:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpz0S-0002Gg-Dy; Tue, 23 Jul 2019 17:55:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OdSp=VU=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hpz0R-0002GX-8w
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 17:55:19 +0000
X-Inumbo-ID: 08027f5b-ad73-11e9-8980-bc764e045a96
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08027f5b-ad73-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 17:55:18 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so42742289qtn.7
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2019 10:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EP6ZxfwOimcLgrAwlpoi2sMdanVW/IrFHu+wXmIvKr0=;
 b=Vu5geJ4SC9EQiazxCM2rohKL4kTk48+oXZUT/g8HWKyn1Sv/s5IeRyjMGkTgJADLA/
 VymVtrZFDHSwy+cJ04+rlo54+NWVQlGZAUSM6DQlnPSPFhSmS9Pm5dN7R7Xnh0V6YybJ
 5lXYHp9oEs78aHG6DB18an6eczQhLlJN1rnod1/2bRvrNDVxqhnbpXN4xg9HQ8T95HTG
 P1ZJydkZOBdXywnmpAl7cTG0+XpVgPVia1uoSHzbYq8T4crFuTpGIgPFBloOD81k1VpZ
 ABsAc9XI9SJs2qJDVKNN8IFcyw9u5Dla8YJWWOVNfNgt3gk658kzEDHQgw2Ff9Fg6Oy0
 +szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EP6ZxfwOimcLgrAwlpoi2sMdanVW/IrFHu+wXmIvKr0=;
 b=KsHISVJ24bVRkju1nnE/pXBmoYtbmBU03khVx/2kExggd2f6JIRl5+4ouy089snBlh
 FoJ4yj11YKbHkcl3XtKtg1tNuiKuZhHELRq7e/vmHqwZg0EkhrkGI6jWa5Ala6codVCT
 38fNALvBvrqGYBTqTG9SCaZzFKjFGhqG6CiPZB7WK0T4J2vOgTzWSW39y9osDbwHHgox
 vc00E53AGIMNsE3LWRFJtkZF9dxLiwHKL3n2CXuXoNP282FLgKMTig1zwewzmy286aBZ
 Iwtpz/KNp4UfiXXb0Q8ckBkgj9cfqYeXlOaM66tJrXWZw1KrSwTN/9QP3S5YhVJ1GmWK
 nWFQ==
X-Gm-Message-State: APjAAAXp+YU/8wXK4L+FmMq9Z8NgwHZpRigFpZs2GJpeqS25XNJpFBrC
 qSRUFYZATW92voA5U6MCYSnXUDcHEpHi7i2muptXgA==
X-Google-Smtp-Source: APXvYqyNMfr8OsalKPUhyUnXbHUl2suuGnunutesAOqo8qIKmv70uiYJpS9goeaRNHmxyKC35NLddu4QaAYGPw/X+f8=
X-Received: by 2002:a0c:becb:: with SMTP id f11mr43779038qvj.33.1563904517470; 
 Tue, 23 Jul 2019 10:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <MA1PR01MB3851BEA4FBF03BB603B1A971E8F20@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB3851A10D5DE69A99DDB292A0E8C70@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB3851A10D5DE69A99DDB292A0E8C70@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 23 Jul 2019 10:55:06 -0700
Message-ID: <CAMmSBy-uMGqa3SDwhmoutmorsg+KUi8ddr-9r2wRMEyZcpCRGw@mail.gmail.com>
To: Sushant Bhangale <Sushant.Bhangale@ltts.com>
Subject: Re: [Xen-devel] Xen Hypervisor porting on Raspberry Pi 3B+/4
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xenprojecthelp@linuxfoundation.org" <xenprojecthelp@linuxfoundation.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Nikhil Wadke <Nikhil.Wadke@ltts.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Pranav Paralikar <Pranav.Paralikar@ltts.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBYZW4gcnVubmluZyBvbiBSUGksIGJ1dCBJIGhhdmUg
dG8gd29uZGVyOiBpcwppdCBub3cgcG9zc2libGUgdG8gd29ya2Fyb3VuZCBSUGkgbGltaXRhdGlv
bnMgb2YgaG93IEdQVSBib290cz8KICAgaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkub3JnL2ZvcnVt
cy92aWV3dG9waWMucGhwP3Q9MTg3MDg2I3AxMjA2NDg3CgpJIHRob3VnaHQgdGhhdCB0aGlzIGlz
IGNvbXBsZXRlbHkgbG9ja2VkLCBwcm9wcmlldGFyeSBiY20yODM3IGNvZGUKdGhhdCBYZW4gY2Fu
J3QgZG8gbXVjaCBvZiBhbnl0aGluZyBhYm91dC4KClRoYW5rcywKUm9tYW4uCgoKT24gVHVlLCBK
dWwgMjMsIDIwMTkgYXQgMTo1NSBBTSBTdXNoYW50IEJoYW5nYWxlCjxTdXNoYW50LkJoYW5nYWxl
QGx0dHMuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4KPgo+IEF3YWl0ZWQgZm9yIHlvdXIgaW5wdXQu
Cj4KPgo+Cj4gUmVnYXJkcywKPgo+IFN1c2hhbnQKPgo+Cj4KPiBGcm9tOiBTdXNoYW50IEJoYW5n
YWxlCj4gU2VudDogRnJpZGF5LCBKdWx5IDEyLCAyMDE5IDc6NTIgUE0KPiBUbzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IFByYW5hdiBQYXJhbGlrYXIgPFByYW5hdi5QYXJh
bGlrYXJATHR0cy5jb20+OyBOaWtoaWwgV2Fka2UgPE5pa2hpbC5XYWRrZUBMdHRzLmNvbT47IHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbi5ncmFsbEBhcm0uY29tOyBsYXJzLmt1cnRoQGNp
dHJpeC5jb20KPiBTdWJqZWN0OiBYZW4gSHlwZXJ2aXNvciBwb3J0aW5nIG9uIFJhc3BiZXJyeSBQ
aSAzQisvNAo+Cj4KPgo+IEhpLAo+Cj4KPgo+IFdlIGFyZSBwbGFubmluZyB0byBwb3J0IFhlbiBI
eXBlcnZpc29yIG9uIFJhc3BiZXJyeSBQSSAzQisoQTUzIFByb2Nlc3NvcikgT1IgUmFzcGJlcnJ5
IFBJIDQgKEE3MiBQcm9jZXNzb3IpLiBGb3IgdGhpcyBwdXJwb3NlIHdlIGZpbmQgb3V0IHRoZSBi
ZWxvdyB0b29scywKPgo+Cj4KPiBUb29scwo+Cj4gVmVyc2lvbnMKPgo+IFBhdGgKPgo+IENyb3Nz
IENvbXBpbGVyCj4KPiBnY2MtbGluYXJvLWFybS1ub25lLWVhYmktNC45LTIwMTQuMDlfbGludXgK
Pgo+IC4KPgo+IGdjYy1saW5hcm8tNy4yLjEtMjAxNy4xMS14ODZfNjRfYWFyY2g2NC1saW51eC1n
bnUKPgo+IC4KPgo+IGFybS1saW51eC1nbnVlYWJpLWdjYwo+Cj4gLgo+Cj4gQm9vdGxvYWRlcgo+
Cj4gVS1Cb290Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdAo+Cj4gTGludXgg
S2VybmVsCj4KPiB2My4xOC1yYzE1Cj4KPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lr
aS9YZW5fQVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucwo+Cj4gbGludXgtNC4yLnRh
ci54ego+Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y0LngvbGlu
dXgtNC4yLnRhci54ego+Cj4gUm9vdCBGaWxlc3lzdGVtCj4KPiBCdXN5Qm94LTEuMzAuMSBvciBP
bGRlcgo+Cj4gaHR0cHM6Ly9idXN5Ym94Lm5ldC8KPgo+IFhlbiBIeXBlcnZpc29yIFNvdXJjZSBj
b2RlCj4KPiBYZW4gSHlwZXJ2aXNvciAodjQuMTIgU3RhYmxlIHZlcnNpb24pCj4KPiBodHRwczov
L2dpdGh1Yi5jb20vYmtyZXBvL3hlbi5naXQKPgo+IFByb2Nlc3NvciAxCj4KPiBCcm9hZGNvbSBC
Q001ODcxWCAoQTUzKQo+Cj4gUmFzcGJlcnJ5IFBpIDNCIC8gM0IrCj4KPiAgUHJvY2Vzc29yIDIK
Pgo+IEJyb2FkY29tIEJDTTI3MTEgKEE3MikKPgo+IFJhc3BiZXJyeSBQaSA0Cj4KPgo+Cj4gUmVx
dWVzdCB5b3UgdG8gbGV0IHVzIGtub3cgd2hldGhlciBhYm92ZSBzZWxlY3RlZCB0b29scyBpbiB0
aGUgdGFibGUgaXMgT0sgb3IgTk9ULgo+Cj4KPgo+IEFsc28sIGlmIGFueSBkb2N1bWVudCByZWxh
dGVkIHRvIHBvcnRpbmcgb2YgWGVuIGh5cGVydmlzb3Igb24gUmFzcGJlcnJ5IFBJIDNCKyhBNTMg
UHJvY2Vzc29yKSBPUiBSYXNwYmVycnkgUEkgNCAoQTcyIFByb2Nlc3NvcikgaXMgYXZhaWxhYmxl
IHdpdGggeW91LCBwbGVhc2Ugc2hhcmUgdGhlIHNhbWUuCj4KPgo+Cj4gTG9va2luZyBmb3J3YXJk
IGZvciB5b3VyIHJlc3BvbnNlLgo+Cj4KPgo+IFJlZ2FyZHMsCj4KPiBTdXNoYW50IEJoYW5nYWxl
Cj4KPiBTZW5pb3IgRW5naW5lZXIgLSBFRFAKPgo+IEwmVCBURUNITk9MT0dZIFNFUlZJQ0VTIExJ
TUlURUQKPgo+IDh0aCBGbG9vciBCdWlsZGluZyBObywxLAo+Cj4gVGhhbmUgQmVsYXB1ciBSb2Fk
LCBNaW5kc3BhY2UKPgo+IEFpcm9saSwgTmF2aSBNdW1iYWkgOkluZGlhIDQwMDcwOAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4KPgo+
Cj4gVGVsOiArOTEgMjIgIDYxMDUgODI4OSB8IE1vYmlsZTogKzkxIDc2IDIwMzMgMDcwNwo+Cj4g
d3d3Lkx0dHMuY29tCj4KPgo+Cj4gTCZUIFRlY2hub2xvZ3kgU2VydmljZXMgTHRkCj4KPiB3d3cu
TFRUUy5jb20KPgo+IFRoaXMgRW1haWwgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZp
bGVnZWQgaW5mb3JtYXRpb24gZm9yIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgKHMpLiBJZiB5b3Ug
YXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90IHVzZSBvciBkaXNz
ZW1pbmF0ZSB0aGUgaW5mb3JtYXRpb24sIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgaXQg
ZnJvbSB5b3VyIHN5c3RlbS4KPgo+IC0tCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3Vw
IGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byB4ZW5w
cm9qZWN0aGVscCt1bnN1YnNjcmliZUBsaW51eGZvdW5kYXRpb24ub3JnLgo+Cj4gTCZUIFRlY2hu
b2xvZ3kgU2VydmljZXMgTHRkCj4KPiB3d3cuTFRUUy5jb20KPgo+IFRoaXMgRW1haWwgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gZm9yIHRoZSBpbnRl
bmRlZCByZWNpcGllbnQgKHMpLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBwbGVhc2UgZG8gbm90IHVzZSBvciBkaXNzZW1pbmF0ZSB0aGUgaW5mb3JtYXRpb24sIG5vdGlm
eSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgaXQgZnJvbSB5b3VyIHN5c3RlbS4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
