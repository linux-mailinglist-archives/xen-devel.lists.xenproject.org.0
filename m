Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9221BAEB
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 18:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQDec-0005Wc-4t; Mon, 13 May 2019 16:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IVRx=TN=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hQDeZ-0005WR-MI
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:18:16 +0000
X-Inumbo-ID: b38ac934-759a-11e9-a943-af707775de2a
Received: from mail1.protonmail.ch (unknown [185.70.40.18])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b38ac934-759a-11e9-a943-af707775de2a;
 Mon, 13 May 2019 16:18:11 +0000 (UTC)
Date: Mon, 13 May 2019 16:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557764290;
 bh=DqkkA6tzTyGj1f/riGxLSVd/EJdFzG/WYjYaOi/I160=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=LDVXHkB/dG6hl4clNLlo8XViDDJuriE/ScH2Vl/dThFwXDbkJg9AzS6mu6alKovCF
 UokMSWdXeY/hM4EAQQ+fCdAfbzxWLhIQ1BpzHyzuKax2fmg0hgeVStiakADfhzJM3U
 UBmQ4dsJYobl1D32LgzDPs40oPd90gSP9EqziSBw=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <BHLEo8qk7hjPZRHdTZsqgFeG6k2VEbu6AtIB-fGhWL3Y01IYvu3rwUWAWgazUqMPUjx6ReFkMbRnF57DigHupbuhtOoq2mYhNbI-XJ352rA=@protonmail.com>
In-Reply-To: <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgdmVuZHJlZGksIG1haSAxMCwgMjAxOSA1OjIxIFBNLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiBhIMOpY3JpdMKgOgoKPiBPbiAxMC8wNS8yMDE5IDE2OjE3LCBN
YXRoaWV1IFRhcnJhbCB3cm90ZToKPgo+ID4gTGUgamV1ZGksIG1haSA5LCAyMDE5IDY6NDIgUE0s
IEFuZHJldyBDb29wZXIgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbSBhIMOpY3JpdMKgOgo+ID4K
PiA+ID4gVGhlcmVmb3JlLCB0aGUgY29uY2x1c2lvbiB0byBkcmF3IGlzIHRoYXQgaXQgaXMgYSBs
b2dpY2FsIGJ1ZyBzb21ld2hlcmUuCj4gPiBUaGUgYnVnIGlzIHN0aWxsIGhlcmUsIHNvIHdlIGNh
biBleGNsdWRlIGEgbWljcm9jb2RlIGlzc3VlLgo+Cj4gR29vZCAtIHRoYXQgaXMgb25lIGZ1cnRo
ZXIgYW5nbGUgZXhjbHVkZWQuwqAgQWx3YXlzIG1ha2Ugc3VyZSB5b3UgYXJlCj4gcnVubmluZyB3
aXRoIHVwLXRvLWRhdGUgbWljcm9jb2RlLCBidXQgaXQgbG9va3MgbGlrZSB3ZSBiYWNrIHRvCj4g
aW52ZXN0aWdhdGluZyBhIGxvZ2ljYWwgYnVnIGluIGxpYnZtaSBvciBYZW4uCgpJIHBsYXllZCB3
aXRoIHRvb2wvdGVzdHMveGVuLWFjY2VzcyB0aGlzIGFmdGVybm9vbi4KClRoZSB0b29sIGlzIHdv
cmtpbmcsIGkgY291bGQgaW50ZXJjZXB0IGJyZWFrcG9pbnRzLCBjcHVpZCwgd3JpdGUgYW5kIGV4
ZWMgbWVtIGFjY2Vzc2VzLCBldGMuLgoKSG93ZXZlciwgdXNpbmcgYWx0cDJtIHJlbGF0ZWQgaW50
ZXJjZXB0cyBsZWFkcyB0byBhIGd1ZXN0IGNyYXNoIHNvbWV0aW1lczoKCldpbmRvd3MgNyB4NjQs
IDQgVkNQVXMKLSBhbHRwMm1fd3JpdGU6IGNyYXNoCi0gYWx0cDJtX2V4ZWM6IGNyYXNoCi0gYWx0
cDJtX3dyaXRlX25vX2dwdDogZnJvemVuCgpXaW5kb3dzIDcgeDY0LCAxIFZDUFUKLSBhbHRwMm1f
d3JpdGU6IGNyYXNoCi0gYWx0cDJtX2V4ZWM6IE9LCi0gYWx0cDJtX3dyaXRlX25vX2dwdDogZnJv
emVuCgoiZnJvemVuIiBtZWFucyB0aGF0IHhlbi1hY2Nlc3MgcmVjZWl2ZXMgVk1JIGV2ZW50cywg
YnVnIHRoZSBndWVzdCBpcyBmcm96ZW4gdW50aWwgSSBkZWNpZGUgdG8gc3RvcCB4ZW4tYWNjZXNz
LgpJJ20gd29uZGVyaW5nIHdoYXQga2luZCBvZiBleGVjIGV2ZW50cyBpdCByZWNlaXZlZCBiZWNh
dXNlIHRoZXkgYXJlIG5vdCB0aGUgc2FtZSwgc28gaXQncyBub3QgbG9vcGluZwpvdmVyIHRoZSBz
YW1lIFJJUCBvdmVyIGFuZCBvdmVyLiAoPykKCkhlcmUgaXMgYW4gZXhhbXBsZSBvdXRwdXQgSSBo
YXZlIHdoZW4gSSBydW4gc3VkbyAuL3hlbi1hY2Nlc3MgPGRvbV9pZD4gYWx0cDJtX3dyaXRlCgou
Li4KR290IGV2ZW50IGZyb20gWGVuClNpbmdsZXN0ZXA6IHJpcD1mZmZmZjgwMDAyNmU2MGRjLCB2
Y3B1IDEsIGFsdHAybSAwCiAgICAgICAgU3dpdGNoaW5nIGFsdHAybSB0byB2aWV3IDEhCkVycm9y
IC0xIGdldHRpbmcgbWVtX2FjY2VzcyBldmVudAoKU2luZ2xlc3RlcDogcmlwPWZmZmZmODAwMDI2
ZTYwNTQsIHZjcHUgMywgYWx0cDJtIDAKICAgICAgICBTd2l0Y2hpbmcgYWx0cDJtIHRvIHZpZXcg
MSEKU2luZ2xlc3RlcDogcmlwPWZmZmZmODAwMDI2ZDY0YzUsIHZjcHUgMCwgYWx0cDJtIDAKICAg
ICAgICBTd2l0Y2hpbmcgYWx0cDJtIHRvIHZpZXcgMSEKeGVuYWNjZXNzIHNodXR0aW5nIGRvd24g
b24gc2lnbmFsIC0xCkdvdCBldmVudCBmcm9tIFhlbgpQQUdFIEFDQ0VTUzogcnctIGZvciBHRk4g
MjFjZWYgKG9mZnNldCAwMDBmYjgpIGdsYSBmZmZmZjg4MDAyMDM5ZmI4ICh2YWxpZDogeTsgZmF1
bHQgaW4gZ3B0OiBuOyBmYXVsdCB3aXRoIGdsYTogeSkgKHZjcHUgMSBbcF0sIGFsdHAybSB2aWV3
IDEpCiAgICAgICAgU3dpdGNoaW5nIGJhY2sgdG8gZGVmYXVsdCB2aWV3IQpQQUdFIEFDQ0VTUzog
cnctIGZvciBHRk4gMWRlYmMgKG9mZnNldCAwMDA0YjApIGdsYSBmZmZmZjg4MDAyMmVkNGIwICh2
YWxpZDogeTsgZmF1bHQgaW4gZ3B0OiBuOyBmYXVsdCB3aXRoIGdsYTogeSkgKHZjcHUgMyBbcF0s
IGFsdHAybSB2aWV3IDEpCiAgICAgICAgU3dpdGNoaW5nIGJhY2sgdG8gZGVmYXVsdCB2aWV3IQpQ
QUdFIEFDQ0VTUzogcnctIGZvciBHRk4gYjlhIChvZmZzZXQgMDAwYWU4KSBnbGEgZmZmZmY4MDAw
MGI5YWFlOCAodmFsaWQ6IHk7IGZhdWx0IGluIGdwdDogbjsgZmF1bHQgd2l0aCBnbGE6IHkpICh2
Y3B1IDAgW3BdLCBhbHRwMm0gdmlldyAxKQogICAgICAgIFN3aXRjaGluZyBiYWNrIHRvIGRlZmF1
bHQgdmlldyEKeGVuYWNjZXNzIHNodXQgZG93biBvbiBzaWduYWwgLTEKeGVuYWNjZXNzIGV4aXQg
Y29kZSAtMQoKQFRhbWFzOiBpZiB5b3UgYWRkZWQgc3VwcG9ydCBmb3IgYWx0cDJtIGluIHhlbi1h
Y2Nlc3MsIGRpZCB5b3UgcmVtZW1iZXIgY3Jhc2hpbmcgeW91ciBndWVzdCA/Ck9yIHdhcyBpdCB3
b3JraW5nIGF0IHRoZSB0aW1lIHlvdSB0ZXN0ZWQgPwoKTWF0aGlldQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
