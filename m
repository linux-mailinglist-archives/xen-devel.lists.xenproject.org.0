Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF40973BE5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 17:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795812.1205293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2nA-0004zy-Jj; Tue, 10 Sep 2024 15:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795812.1205293; Tue, 10 Sep 2024 15:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2nA-0004yS-G4; Tue, 10 Sep 2024 15:28:32 +0000
Received: by outflank-mailman (input) for mailman id 795812;
 Tue, 10 Sep 2024 15:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nZKp=QI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1so2n9-0004yM-76
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 15:28:31 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55113223-6f89-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 17:28:30 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso859079e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 08:28:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903f28sm1226501e87.229.2024.09.10.08.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 08:28:28 -0700 (PDT)
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
X-Inumbo-ID: 55113223-6f89-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725982109; x=1726586909; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UGYhIpF5oA8jIsdLsCYWHhcThpRU/pS9UqbF1Zo1IMk=;
        b=b9YqFkwsQVIAtDg5qvWQa3mDaBfB1RbF+LgJrrsw5sCLrp1kbPGBe1lXyAJgUqc0fI
         IEdhbmNjWnaDfdRXUgmDCkhxJchxY4p0b/7K2DYc2eeWA7WK6AlSlYo+676DYdexfvmO
         4BCCBN04JjQvWNZ1FZ2BarTXCSNRf3OTpHwnXOk3LxNdbYBcJwD+51Mg6TKLHJMNZoDs
         fwJI/LC8rTGR+Cd2tGIiCmdUGNuzkTPL4gA0gjhSMv2CVDH6YP2OIBZ94tbQ6cIX1KSX
         vRHpVrgFBEO1rdxFYRjR+o/l+agwj1Rybch31R0SxbTOYTBBJnctwLKW4lCdCC0GiKsl
         h8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725982109; x=1726586909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGYhIpF5oA8jIsdLsCYWHhcThpRU/pS9UqbF1Zo1IMk=;
        b=JUyI7g+uYOIz0Aqw/qcnSTJJFxob4wqPdQwn8rzpOpxTbggK5/o3UcVNetLMvPiZHR
         WuE8+Htd3YzKBALZvDpHFB8xyzOvy/AOd7Be2aaZKGAsrnetOFSmbwCauWh6k0dbzekX
         ugC8hVRucmQGQlVY2rv/+pTrFlRP9vZmUIKe59WReJ9DxtyHsChZJT6yEYLfCOicDeSc
         L5I4RghURPA9UYiBu1f1jOpcfCFx6aJEx7jKXaFy2GBDNSbXsldk3WS6vv1exn0ccRDm
         ggy+p/Ob3rgWoH0as8Twny5NqDhE1+fDrsV7Tlg0BbbSuDzPJj8R3aCBAUOj2He30nJb
         RDTg==
X-Forwarded-Encrypted: i=1; AJvYcCXv8PCYF07y/fM7/TgjyI+o4rEZDzHuDswJzX1m9Afn7vnEy0/GFajAszNjvOkprEsO5upZ5dYP9aY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzV2oqoAIN+Q1jQZsFvGjvkiCWOJNngJII3ArAk6YNBNteytZeC
	5MrAPxvsENokajRxUnKRAWqQBh6Q1reWnjJ38pd0vRaHd+KX186s
X-Google-Smtp-Source: AGHT+IFDSlrwKnaMw4H9BMQDZiwaPQq2aEEHh3uAkTmY3eAfcESbgObmwQZEmyGqCMVaIhikQ2N4sw==
X-Received: by 2002:a05:6512:3983:b0:535:63a9:9d8c with SMTP id 2adb3069b0e04-536587aaf1amr9719268e87.17.1725982108659;
        Tue, 10 Sep 2024 08:28:28 -0700 (PDT)
Message-ID: <c571f1d2760ea09b6e9dba41c8d6a056a2b69c23.camel@gmail.com>
Subject: Re: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with
 non-scalar types
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 10 Sep 2024 17:28:27 +0200
In-Reply-To: <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
	 <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTA5LTEwIGF0IDExOjUzICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwMi4wOS4yMDI0IDE5OjAxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIGEveGVu
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmgKPiA+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2F0b21pYy5oCj4gPiBAQCAtNTQsMTYgKzU0LDE2IEBAIHN0YXRpYyBhbHdh
eXNfaW5saW5lIHZvaWQKPiA+IHJlYWRfYXRvbWljX3NpemUoY29uc3Qgdm9sYXRpbGUgdm9pZCAq
cCwKPiA+IMKgfSkKPiA+IMKgCj4gPiDCoHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX3dyaXRl
X2F0b21pYyh2b2xhdGlsZSB2b2lkICpwLAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIHgsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKngsCj4gCj4gUG9p
bnRlci10by1jb25zdCBwbGVhc2UsIHRvIGZ1cnRoZXIgYWlkIGluIGVhc2lseSByZWNvZ25pemlu
ZyB3aGljaAo+IHBhcmFtZXRlciBpcyB3aGF0LiBBZnRlciBhbGwgLi4uCj4gCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiA+IMKgewo+ID4gwqDCoMKgwqAg
c3dpdGNoICggc2l6ZSApCj4gPiDCoMKgwqDCoCB7Cj4gPiAtwqDCoMKgIGNhc2UgMTogd3JpdGVi
X2NwdSh4LCBwKTsgYnJlYWs7Cj4gPiAtwqDCoMKgIGNhc2UgMjogd3JpdGV3X2NwdSh4LCBwKTsg
YnJlYWs7Cj4gPiAtwqDCoMKgIGNhc2UgNDogd3JpdGVsX2NwdSh4LCBwKTsgYnJlYWs7Cj4gCj4g
Li4uIHVuaGVscGZ1bGx5IGVub3VnaCBwYXJhbWV0ZXJzIGFyZSB0aGVuIHN3YXBwZWQsIGp1c3Qg
dG8gY29uZnVzZQo+IHRoaW5ncy4KSWYgaXQgd291bGQgYmUgYmV0dGVyIHRvIGtlZXAgJ3Vuc2ln
bmVkIGxvbmcnIGFzIHRoZSB0eXBlIG9mIHgsIHRoZW4sCmlmIEkgYW0gbm90IG1pc3Rha2VuLCB3
cml0ZV9hdG9taWMoKSBzaG91bGQgYmUgdXBkYXRlZCBpbiB0aGUgZm9sbG93aW5nCndheToKICAg
I2RlZmluZSB3cml0ZV9hdG9taWMocCwgeCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogICAgICAgdHlwZW9mKCoocCkpIHhfID0gKHgpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKICAgICAgIF93cml0ZV9hdG9taWMocCwgKih1bnNpZ25lZCBsb25nICopJnhfLCBz
aXplb2YoKihwKSkpOyAgICAgICAgICAgIAogICBcCiAgIH0pCkhvd2V2ZXIsIEkgYW0gbm90IHN1
cmUgaWYgaXQgaXMgc2FmZSB3aGVuIHggaXMgYSAyLWJ5dGUgdmFsdWUgKGZvcgpleGFtcGxlKSB0
aGF0IGl0IHdpbGwgcmVhZCBtb3JlIHRoYW4gMiBieXRlcyBiZWZvcmUgcGFzc2luZyB0aGUgdmFs
dWUKdG8gdGhlIF93cml0ZV9hdG9taWMoKSBmdW5jdGlvbi4KCj4gCj4gPiArwqDCoMKgIGNhc2Ug
MTogd3JpdGViX2NwdSgqKHVpbnQ4X3QgKil4LCBwKTsgYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2Ug
Mjogd3JpdGV3X2NwdSgqKHVpbnQxNl90ICopeCwgcCk7IGJyZWFrOwo+ID4gK8KgwqDCoCBjYXNl
IDQ6IHdyaXRlbF9jcHUoKih1aW50MzJfdCAqKXgsIHApOyBicmVhazsKPiA+IMKgI2lmbmRlZiBD
T05GSUdfUklTQ1ZfMzIKPiA+IC3CoMKgwqAgY2FzZSA4OiB3cml0ZXFfY3B1KHgsIHApOyBicmVh
azsKPiA+ICvCoMKgwqAgY2FzZSA4OiB3cml0ZXFfY3B1KCoodWludDY0X3QgKil4LCBwKTsgYnJl
YWs7Cj4gCj4gV2l0aCBjb25zdCBhZGRlZCB0byB0aGUgcGFyYW1ldGVyLCBwbGVhc2UgZnVydGhl
ciBtYWtlIHN1cmUgdG8gdGhlbgo+IG5vdAo+IGNhc3QgdGhhdCBhd2F5IGFnYWluLgo+IAo+ID4g
QEAgLTcyLDcgKzcyLDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBfd3JpdGVfYXRvbWlj
KHZvbGF0aWxlCj4gPiB2b2lkICpwLAo+ID4gwqAjZGVmaW5lIHdyaXRlX2F0b21pYyhwLCB4KcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
XAo+ID4gwqAoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+ID4gwqDCoMKgwqAgdHlwZW9mKCoocCkpIHhfID0gKHgpO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gLcKgwqDCoCBf
d3JpdGVfYXRvbWljKHAsIHhfLCBzaXplb2YoKihwKSkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgX3dyaXRlX2F0b21pYyhwLCAmeF8sIHNpemVvZigqKHAp
KSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+IMKgfSkKPiA+IMKgCj4gPiDC
oHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX2FkZF9zaXplZCh2b2xhdGlsZSB2b2lkICpwLAo+
ID4gQEAgLTgyLDI3ICs4MiwyMyBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIF9hZGRfc2l6
ZWQodm9sYXRpbGUKPiA+IHZvaWQgKnAsCj4gPiDCoMKgwqDCoCB7Cj4gPiDCoMKgwqDCoCBjYXNl
IDE6Cj4gPiDCoMKgwqDCoCB7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgdm9sYXRpbGUgdWludDhfdCAq
cHRyID0gcDsKPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9taWMocHRyLCByZWFkX2F0b21p
YyhwdHIpICsgeCk7Cj4gPiArwqDCoMKgwqDCoMKgwqAgd3JpdGViX2NwdShyZWFkYl9jcHUocCkg
KyB4LCBwKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiDCoMKgwqDCoCB9Cj4gPiDC
oMKgwqDCoCBjYXNlIDI6Cj4gPiDCoMKgwqDCoCB7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgdm9sYXRp
bGUgdWludDE2X3QgKnB0ciA9IHA7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgd3JpdGVfYXRvbWljKHB0
ciwgcmVhZF9hdG9taWMocHRyKSArIHgpOwo+ID4gK8KgwqDCoMKgwqDCoMKgIHdyaXRld19jcHUo
cmVhZHdfY3B1KHApICsgeCwgcCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gwqDC
oMKgwqAgfQo+ID4gwqDCoMKgwqAgY2FzZSA0Ogo+ID4gwqDCoMKgwqAgewo+ID4gLcKgwqDCoMKg
wqDCoMKgIHZvbGF0aWxlIHVpbnQzMl90ICpwdHIgPSBwOwo+ID4gLcKgwqDCoMKgwqDCoMKgIHdy
aXRlX2F0b21pYyhwdHIsIHJlYWRfYXRvbWljKHB0cikgKyB4KTsKPiA+ICvCoMKgwqDCoMKgwqDC
oCB3cml0ZWxfY3B1KHJlYWRsX2NwdShwKSArIHgsIHApOwo+ID4gwqDCoMKgwqDCoMKgwqDCoCBi
cmVhazsKPiA+IMKgwqDCoMKgIH0KPiA+IMKgI2lmbmRlZiBDT05GSUdfUklTQ1ZfMzIKPiA+IMKg
wqDCoMKgIGNhc2UgODoKPiA+IMKgwqDCoMKgIHsKPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xhdGls
ZSB1aW50NjRfdCAqcHRyID0gcDsKPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9taWMocHRy
LCByZWFkX2F0b21pYyhwdHIpICsgeCk7Cj4gPiArwqDCoMKgwqDCoMKgwqAgd3JpdGVxX2NwdShy
ZWFkd19jcHUocCkgKyB4LCBwKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiDCoMKg
wqDCoCB9Cj4gPiDCoCNlbmRpZgo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kIHRo
aXMgcGFydCwgb3IgbW9yZSBzcGVjaWZpY2FsbHkgdGhlCj4gcmVzcGVjdGl2ZQo+IHBhcnQgb2Yg
dGhlIGRlc2NyaXB0aW9uLiBJdCBpcyB0aGUgZmlyc3QgcGFyYW1ldGVyIG9mIHdyaXRlX2F0b21p
YygpCj4gd2hpY2ggaXMKPiB2b2xhdGlsZSBxdWFsaWZpZWQuIEFuZCBpdCBpcyB0aGUgZmlyc3Qg
YXJndW1lbnQgdGhhdCdzIHZvbGF0aWxlCj4gcXVhbGlmaWVkCj4gaGVyZS4gSXNuJ3QgdGhlIHBy
b2JsZW0gZW50aXJlbHkgdW5yZWxhdGVkIHRvIHZvbGF0aWxlLW5lc3MsIGFuZAo+IGluc3RlYWQg
YQo+IHJlc3VsdCBvZiB0aGUgb3RoZXIgcGFyYW1ldGVyIGNoYW5naW5nIGZyb20gc2NhbGFyIHRv
IHBvaW50ZXIgdHlwZSwKPiB3aGljaAo+IGRvZXNuJ3QgZml0IHRoZSBhZGRpdGlvbiBleHByZXNz
aW9ucyB5b3UgcGFzcyBpbj8KaWYgX2FkZF9zaXplZCgpIGlzIGRlZmluZWQgYXMgaXQgd2FzIGJl
Zm9yZToKICAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBfYWRkX3NpemVkKHZvbGF0aWxlIHZv
aWQgKnAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIHgsIHVuc2lnbmVkIGludAogICBzaXplKQogICB7CiAgICAgICBzd2l0Y2ggKCBzaXplICkK
ICAgICAgIHsKICAgICAgIGNhc2UgMToKICAgICAgIHsKICAgICAgICAgICB2b2xhdGlsZSB1aW50
OF90ICpwdHIgPSBwOwogICAgICAgICAgIHdyaXRlX2F0b21pYyhwdHIsIHJlYWRfYXRvbWljKHB0
cikgKyB4KTsKICAgICAgICAgICBicmVhazsKICAgICAgIH0KICAgLi4uClRoZW4gd3JpdGVfYXRv
bWljKHB0ciwgcmVhZF9hdG9taWMocHRyKSArIHgpIHdpbGwgYmUgYmUgY2hhbmdlZCB0bzoKICAg
dm9sYXRpbGUgdWludDhfdCB4XyA9ICh4KTsKICAgCkFuZCB0aGF0IHdpbGwgY2F1c2UgYSBjb21w
aWxlciBlcnJvcjoKICAgLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F0b21pYy5oOjc1OjIyOiBl
cnJvcjogcGFzc2luZyBhcmd1bWVudCAyCiAgIG9mICdfd3JpdGVfYXRvbWljJyBkaXNjYXJkcyAn
dm9sYXRpbGUnIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0CiAgIHR5cGUgWy1XZXJyb3I9
ZGlzY2FyZGVkLXF1YWxpZmllcnNdCiAgICAgIDc1IHwgICAgIF93cml0ZV9hdG9taWMocCwgJnhf
LCBzaXplb2YoKihwKSkpOwpCZWNhdXNlIGl0IGNhbid0IGNhc3QgJ3ZvbGF0aWxlIHVpbnQ4X3Qg
KicgdG8gJ3ZvaWQgKic6CiAgIGV4cGVjdGVkICd2b2lkIConIGJ1dCBhcmd1bWVudCBpcyBvZiB0
eXBlICd2b2xhdGlsZSB1aW50OF90IConIHtha2EKICAgJ3ZvbGF0aWxlIHVuc2lnbmVkIGNoYXIg
Kid9Cgo+IAo+IEFsc28geW91IHN1cmVseSBtZWFuIHJlYWRxX2NwdSgpIGluIHRoZSA4LWJ5dGUg
Y2FzZS4KWWVzLCB0aGFua3MgZm9yIGZpbmRpbmcgdGhhdC4KCn4gT2xla3NpaQoK


