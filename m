Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6F97674C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797324.1207263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnv-0007uu-3O; Thu, 12 Sep 2024 11:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797324.1207263; Thu, 12 Sep 2024 11:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnu-0007s7-Vo; Thu, 12 Sep 2024 11:16:02 +0000
Received: by outflank-mailman (input) for mailman id 797324;
 Thu, 12 Sep 2024 11:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2hp=QK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sohnt-0006KJ-Mh
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:16:01 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63b16317-70f8-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 13:15:59 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f75d044201so8342231fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:15:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75c098e79sm18100541fa.121.2024.09.12.04.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:15:58 -0700 (PDT)
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
X-Inumbo-ID: 63b16317-70f8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726139759; x=1726744559; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k9T+z9wdSxb4Sob0oM0aJRE8hrmE13QhNAPKHGMeCSg=;
        b=i5ipfpf1eWyFyVcBMoKXSVdhubaWahb+05EnC51X26CgCQDfF+rU4QcXMPrrbyOuzh
         apfk89ChEMQxLiqz9XrRx9EeJnscdWctXpvX/50zFJF0ClWdjFzUeukrxavAzcIu4qx3
         tR12MaCSSa57AmuK+xwNSXQnvltK2+N8bGStCEmo6YDwDng/mqBgpDMWmyun7Toc/wyt
         5/fc+FnDyKJTpW+wvMD1cr7U0ekSg1Tu34/JL6eTssUjDy2mE2+89e+JxNcQ6lXQ5NU1
         SlbdY/zGtTjwynVw0LR85tA3c12kbS7aWKFbYgzA4S+amNN2XAO8KJYXJX3B+OrDlJoF
         ZM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139759; x=1726744559;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9T+z9wdSxb4Sob0oM0aJRE8hrmE13QhNAPKHGMeCSg=;
        b=BKYey7yAnGHvEGggai0bWubJKP5FGAj6+Qf+aKHgMQGOKIkdR6hbeTCfgqz1vyTybV
         cyuuoVXP08X5POQHQ61ioNNJKLpKdA+rWeb0HCgs6x27nYz3PJLbDUmreil2PBqcGLkb
         ieP1/sWL5S0s9b4xce+EwRl78EUPJG+Si9obn1CoPmY0D3QUIjK0q9iguW6f7jmBOo/j
         qxaZQh7ka5AGCTKgcN6MVgaCedvO7xwNbHPntth6rGiiBee+yBXyTMaTkhQKHxofMtsp
         sWv2eDe15YaOKyi9qHgRzrtTE17MdTuW1ioUCHzwyegjVhjY2HhXeh5qtXq9xgDxbE5x
         drlw==
X-Forwarded-Encrypted: i=1; AJvYcCW+nsYI10TnOYxdmkR7t5F+T+0RhyCa5fPD4w/M7LPWWxJ1DlPbVnQFz3PqIYweuCzB0K7xk93g9ok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsjDIuDaOkYKboB81EWW4/youYNHSHlq//qPPOpIba0RV3sh0i
	CFZmYl+ZYQIYlYv3YnS3hsH58JmoWDkh1RqmqZ3wNqSVBFr6PRt8
X-Google-Smtp-Source: AGHT+IFaDTzXhvUwuBawXtB63gYoThxNjaRMDaVUMZ6dt3TcA+wqqYZHPpk0leGjx0+f1tOuRHKbZA==
X-Received: by 2002:a05:651c:2108:b0:2ef:2bea:69a with SMTP id 38308e7fff4ca-2f787c1ad4fmr7870701fa.2.1726139758282;
        Thu, 12 Sep 2024 04:15:58 -0700 (PDT)
Message-ID: <b5eb9f937814d9d37db315cea9c53ec1faeb4be7.camel@gmail.com>
Subject: Re: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with
 non-scalar types
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2024 13:15:52 +0200
In-Reply-To: <59d3ef0f-dc1d-4d6e-9e1e-4fb3550113a8@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
	 <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
	 <c571f1d2760ea09b6e9dba41c8d6a056a2b69c23.camel@gmail.com>
	 <20a1a3ae-95c4-4568-9cd3-a4f023940b73@suse.com>
	 <bdbf7bbbdb7ec22b157797fe3c09c13a9829f1d6.camel@gmail.com>
	 <59d3ef0f-dc1d-4d6e-9e1e-4fb3550113a8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTA5LTExIGF0IDEzOjQ5ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxMS4wOS4yMDI0IDEzOjM0LCBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbcKgd3JvdGU6Cj4g
PiBPbiBUdWUsIDIwMjQtMDktMTAgYXQgMTg6MDUgKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPiBPbiAxMC4wOS4yMDI0IDE3OjI4LCBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbcKgd3Jv
dGU6Cj4gPiA+ID4gT24gVHVlLCAyMDI0LTA5LTEwIGF0IDExOjUzICswMjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+ID4gPiA+IE9uIDAyLjA5LjIwMjQgMTk6MDEsIE9sZWtzaWkgS3Vyb2Noa28g
d3JvdGU6Cj4gPiA+ID4gPiA+IEBAIC03Miw3ICs3Miw3IEBAIHN0YXRpYyBhbHdheXNfaW5saW5l
IHZvaWQKPiA+ID4gPiA+ID4gX3dyaXRlX2F0b21pYyh2b2xhdGlsZQo+ID4gPiA+ID4gPiB2b2lk
ICpwLAo+ID4gPiA+ID4gPiDCoCNkZWZpbmUgd3JpdGVfYXRvbWljKHAsIHgpwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+ID4g
PiA+IMKgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiA+ID4gPiA+ID4gwqDCoMKgwqAgdHlwZW9mKCoocCkpIHhfID0gKHgpO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiA+
ID4gPiAtwqDCoMKgIF93cml0ZV9hdG9taWMocCwgeF8sIHNpemVvZigqKHApKSk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiA+ID4gPiArwqDCoMKgIF93cml0ZV9hdG9t
aWMocCwgJnhfLCBzaXplb2YoKihwKSkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiA+ID4gPiA+IMKgfSkKPiA+ID4gPiA+ID4gwqAKPiA+ID4gPiA+ID4gwqBzdGF0aWMgYWx3
YXlzX2lubGluZSB2b2lkIF9hZGRfc2l6ZWQodm9sYXRpbGUgdm9pZCAqcCwKPiA+ID4gPiA+ID4g
QEAgLTgyLDI3ICs4MiwyMyBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkCj4gPiA+ID4gPiA+
IF9hZGRfc2l6ZWQodm9sYXRpbGUKPiA+ID4gPiA+ID4gdm9pZCAqcCwKPiA+ID4gPiA+ID4gwqDC
oMKgwqAgewo+ID4gPiA+ID4gPiDCoMKgwqDCoCBjYXNlIDE6Cj4gPiA+ID4gPiA+IMKgwqDCoMKg
IHsKPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIHZvbGF0aWxlIHVpbnQ4X3QgKnB0ciA9IHA7
Cj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9taWMocHRyLCByZWFkX2F0b21p
YyhwdHIpICsgeCk7Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWJfY3B1KHJlYWRi
X2NwdShwKSArIHgsIHApOwo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4g
PiA+ID4gPiDCoMKgwqDCoCB9Cj4gPiA+ID4gPiA+IMKgwqDCoMKgIGNhc2UgMjoKPiA+ID4gPiA+
ID4gwqDCoMKgwqAgewo+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAgdm9sYXRpbGUgdWludDE2
X3QgKnB0ciA9IHA7Cj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9taWMocHRy
LCByZWFkX2F0b21pYyhwdHIpICsgeCk7Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB3cml0
ZXdfY3B1KHJlYWR3X2NwdShwKSArIHgsIHApOwo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+ID4gPiA+ID4gPiDCoMKgwqDCoCB9Cj4gPiA+ID4gPiA+IMKgwqDCoMKgIGNhc2Ug
NDoKPiA+ID4gPiA+ID4gwqDCoMKgwqAgewo+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAgdm9s
YXRpbGUgdWludDMyX3QgKnB0ciA9IHA7Cj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0
ZV9hdG9taWMocHRyLCByZWFkX2F0b21pYyhwdHIpICsgeCk7Cj4gPiA+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoCB3cml0ZWxfY3B1KHJlYWRsX2NwdShwKSArIHgsIHApOwo+ID4gPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiA+ID4gPiDCoMKgwqDCoCB9Cj4gPiA+ID4gPiA+IMKg
I2lmbmRlZiBDT05GSUdfUklTQ1ZfMzIKPiA+ID4gPiA+ID4gwqDCoMKgwqAgY2FzZSA4Ogo+ID4g
PiA+ID4gPiDCoMKgwqDCoCB7Cj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xhdGlsZSB1
aW50NjRfdCAqcHRyID0gcDsKPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIHdyaXRlX2F0b21p
YyhwdHIsIHJlYWRfYXRvbWljKHB0cikgKyB4KTsKPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
IHdyaXRlcV9jcHUocmVhZHdfY3B1KHApICsgeCwgcCk7Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAgYnJlYWs7Cj4gPiA+ID4gPiA+IMKgwqDCoMKgIH0KPiA+ID4gPiA+ID4gwqAjZW5kaWYK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBw
YXJ0LCBvciBtb3JlIHNwZWNpZmljYWxseQo+ID4gPiA+ID4gdGhlCj4gPiA+ID4gPiByZXNwZWN0
aXZlCj4gPiA+ID4gPiBwYXJ0IG9mIHRoZSBkZXNjcmlwdGlvbi4gSXQgaXMgdGhlIGZpcnN0IHBh
cmFtZXRlciBvZgo+ID4gPiA+ID4gd3JpdGVfYXRvbWljKCkKPiA+ID4gPiA+IHdoaWNoIGlzCj4g
PiA+ID4gPiB2b2xhdGlsZSBxdWFsaWZpZWQuIEFuZCBpdCBpcyB0aGUgZmlyc3QgYXJndW1lbnQg
dGhhdCdzCj4gPiA+ID4gPiB2b2xhdGlsZQo+ID4gPiA+ID4gcXVhbGlmaWVkCj4gPiA+ID4gPiBo
ZXJlLiBJc24ndCB0aGUgcHJvYmxlbSBlbnRpcmVseSB1bnJlbGF0ZWQgdG8gdm9sYXRpbGUtbmVz
cywKPiA+ID4gPiA+IGFuZAo+ID4gPiA+ID4gaW5zdGVhZCBhCj4gPiA+ID4gPiByZXN1bHQgb2Yg
dGhlIG90aGVyIHBhcmFtZXRlciBjaGFuZ2luZyBmcm9tIHNjYWxhciB0byBwb2ludGVyCj4gPiA+
ID4gPiB0eXBlLAo+ID4gPiA+ID4gd2hpY2gKPiA+ID4gPiA+IGRvZXNuJ3QgZml0IHRoZSBhZGRp
dGlvbiBleHByZXNzaW9ucyB5b3UgcGFzcyBpbj8KPiA+ID4gPiBpZiBfYWRkX3NpemVkKCkgaXMg
ZGVmaW5lZCBhcyBpdCB3YXMgYmVmb3JlOgo+ID4gPiA+IMKgwqAgc3RhdGljIGFsd2F5c19pbmxp
bmUgdm9pZCBfYWRkX3NpemVkKHZvbGF0aWxlIHZvaWQgKnAsCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgeCwKPiA+ID4gPiB1bnNpZ25lZAo+ID4gPiA+IGludAo+
ID4gPiA+IMKgwqAgc2l6ZSkKPiA+ID4gPiDCoMKgIHsKPiA+ID4gPiDCoMKgwqDCoMKgwqAgc3dp
dGNoICggc2l6ZSApCj4gPiA+ID4gwqDCoMKgwqDCoMKgIHsKPiA+ID4gPiDCoMKgwqDCoMKgwqAg
Y2FzZSAxOgo+ID4gPiA+IMKgwqDCoMKgwqDCoCB7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdm9sYXRpbGUgdWludDhfdCAqcHRyID0gcDsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB3cml0ZV9hdG9taWMocHRyLCByZWFkX2F0b21pYyhwdHIpICsgeCk7Cj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgIH0KPiA+ID4gPiDCoMKg
IC4uLgo+ID4gPiA+IFRoZW4gd3JpdGVfYXRvbWljKHB0ciwgcmVhZF9hdG9taWMocHRyKSArIHgp
IHdpbGwgYmUgYmUgY2hhbmdlZAo+ID4gPiA+IHRvOgo+ID4gPiA+IMKgwqAgdm9sYXRpbGUgdWlu
dDhfdCB4XyA9ICh4KTsKPiA+ID4gPiDCoMKgIAo+ID4gPiA+IEFuZCB0aGF0IHdpbGwgY2F1c2Ug
YSBjb21waWxlciBlcnJvcjoKPiA+ID4gPiDCoMKgIC4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9h
dG9taWMuaDo3NToyMjogZXJyb3I6IHBhc3NpbmcKPiA+ID4gPiBhcmd1bWVudAo+ID4gPiA+IDIK
PiA+ID4gPiDCoMKgIG9mICdfd3JpdGVfYXRvbWljJyBkaXNjYXJkcyAndm9sYXRpbGUnIHF1YWxp
ZmllciBmcm9tCj4gPiA+ID4gcG9pbnRlcgo+ID4gPiA+IHRhcmdldAo+ID4gPiA+IMKgwqAgdHlw
ZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KPiA+ID4gPiDCoMKgwqDCoMKgIDc1IHzC
oMKgwqDCoCBfd3JpdGVfYXRvbWljKHAsICZ4Xywgc2l6ZW9mKCoocCkpKTsKPiA+ID4gPiBCZWNh
dXNlIGl0IGNhbid0IGNhc3QgJ3ZvbGF0aWxlIHVpbnQ4X3QgKicgdG8gJ3ZvaWQgKic6Cj4gPiA+
ID4gwqDCoCBleHBlY3RlZCAndm9pZCAqJyBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAndm9sYXRp
bGUgdWludDhfdAo+ID4gPiA+IConCj4gPiA+ID4ge2FrYQo+ID4gPiA+IMKgwqAgJ3ZvbGF0aWxl
IHVuc2lnbmVkIGNoYXIgKid9Cj4gPiA+IAo+ID4gPiBPaCwgSSB0aGluayBJIHNlZSBub3cuIFdo
YXQgd2UnZCBsaWtlIHdyaXRlX2F0b21pYygpIHRvIGRlcml2ZSBpcwo+ID4gPiB0aGUKPiA+ID4g
YmFyZQo+ID4gPiAodW5xdWFsaWZpZWQpIHR5cGUgb2YgKnB0ciwgeWV0IGlpcmMgb25seSByZWNl
bnQgY29tcGlsZXJzIGhhdmUgYQo+ID4gPiB3YXkKPiA+ID4gdG8KPiA+ID4gb2J0YWluIHRoYXQu
Cj4gPiBJIGFzc3VtZSB0aGF0IHlvdSBhcmUgc3BlYWtpbmcgYWJvdXQgdHlwZW9mX3VucXVhbCB3
aGljaCByZXF1aXJlcwo+ID4gQzIzCj4gPiAoPykuCj4gCj4gV2hhdCBDIHZlcnNpb24gaXQgcmVx
dWlyZXMgZG9lc24ndCBtYXR0ZXIgbXVjaCBmb3Igb3VyIHB1cnBvc2VzLiBUaGUKPiBxdWVzdGlv
biBpcyBhcyBvZiB3aGljaCBnY2MgLyBjbGFuZyB2ZXJzaW9uIChpZiBhbnkpIHRoaXMgaXMKPiBz
dXBwb3J0ZWQKPiBhcyBhbiBleHRlbnNpb24uCj4gCj4gPiBfX2F1dG9fdHlwZSBzZWVtcyB0byBt
ZSBjYW4gYWxzbyBkcm9wIHZvbGF0aWxlIHF1aWxpZmllciBidXQgaW4gdGhlCj4gPiBkb2NzIEkg
ZG9uJ3Qgc2VlIHRoYXQgaXQgc2hvdWxkIChvciBub3QpIGRpc2NhcmQgcXVhbGlmaWVyLiBDb3Vs
ZAo+ID4gaXQgYmUKPiA+IGFuIG9wdGlvbjoKPiA+IMKgwqAgI2RlZmluZSB3cml0ZV9hdG9taWMo
cCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPiA+IMKgwqAgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiA+IMKgwqDCoMKgwqDCoCBfX2F1dG9fdHlwZSB4XyA9ICh4KTvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwK
PiA+IMKgwqDCoMKgwqDCoCBfd3JpdGVfYXRvbWljKHAsICZ4Xywgc2l6ZW9mKCoocCkpKTvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDCoMKgIH0pCj4gCj4gRm9yIG91ciBw
dXJwb3NlcyBfX2F1dG9fdHlwZSBkb2Vzbid0IHByb3ZpZGUgYWR2YW50YWdlcyBvdmVyCj4gdHlw
ZW9mKCkuCj4gUGx1cywgbW9yZSBpbXBvcnRhbnRseSwgdGhlIHVzZSBhYm92ZSBpcyB3cm9uZywg
anVzdCBsaWtlIHR5cGVvZih4KQo+IHdvdWxkIGFsc28gYmUgd3JvbmcuIEl0IG5lZWRzIHRvIGJl
IHAgdGhhdCB0aGUgdHlwZSBpcyBkZXJpdmVkIGZyb20uCj4gT3RoZXJ3aXNlIGNvbnNpZGVyIHdo
YXQgaGFwcGVucyB3aGVuIHB0ciBpcyB1bnNpZ25lZCBsb25nICogb3IKPiB1bnNpZ25lZCBzaG9y
dCAqIGFuZCB5b3Ugd3JpdGUKPiAKPiDCoMKgwqAgd3JpdGVfYXRvbWljKHB0ciwgMCk7Cj4gCj4g
PiBBbmQgYW5vdGhlciBvcHRpb24gY291bGQgYmUganVzdCBkcm9wIHZvbGF0aWxlIGJ5IGNhc3Rp
bmc6Cj4gPiDCoMKgICNkZWZpbmUgd3JpdGVfYXRvbWljKHAsIHgpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDCoMKgIC4uLgo+
ID4gwqDCoMKgwqDCoMKgIF93cml0ZV9hdG9taWMocCwgKGNvbnN0IHZvaWQgKikmeF8sCj4gPiBz
aXplb2YoKihwKSkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IAo+IFNlZSB3
aGF0IEkgc2FpZCBlYXJsaWVyIGFib3V0IGNhc3RzOiBZb3Ugc2hhbGwgbm90IGNhc3QgYXdheQo+
IHF1YWxpZmllcnMuIEJlc2lkZXMgZG9pbmcgc28gYmVpbmcgYmFkIHByYWN0aWNlLCB5b3UnbGwg
bm90aWNlIHRoZQo+IGxhdGVzdCB3aGVuIFJJU0MtViBjb2RlIGFsc28gYmVjb21lcyBzdWJqZWN0
IHRvIE1pc3JhIGNvbXBsaWFuY2UuCgpUaGVuIHByb2JhYmx5IHRoZSBiZXN0IG9uZSBvcHRpb24g
d2lsbCBiZSB0byB1c2UgdW5pb246CiAgICNkZWZpbmUgd3JpdGVfYXRvbWljKHAsIHgpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgXAogICAoeyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAg
IFwKICAgICAgIHVuaW9uIHsgdHlwZW9mKCoocCkpIHZhbDsgY2hhciBjW3NpemVvZigqKHApKV07
IH0geF8gPSB7IC52YWwgPQogICAoeCkgfTsgIFwKICAgICAgIF93cml0ZV9hdG9taWMocCwgeF8u
Yywgc2l6ZW9mKCoocCkpKTsgICAgICAgICAgICAgICAgICAgICAgICAgIAogICBcCiAgIH0pCiAg
IAp+IE9sZWtzaWkK


