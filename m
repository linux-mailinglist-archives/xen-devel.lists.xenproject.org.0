Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB80589D36F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 09:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702167.1097034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru65I-0005yr-0G; Tue, 09 Apr 2024 07:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702167.1097034; Tue, 09 Apr 2024 07:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru65H-0005wn-Ry; Tue, 09 Apr 2024 07:39:59 +0000
Received: by outflank-mailman (input) for mailman id 702167;
 Tue, 09 Apr 2024 07:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDp6=LO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ru65F-0005wg-F2
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 07:39:57 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b5ff187-f644-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 09:39:54 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-516d1c8dc79so5690680e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 00:39:54 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u7-20020ac25bc7000000b00515cd52ff6csm1456889lfn.50.2024.04.09.00.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 00:39:53 -0700 (PDT)
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
X-Inumbo-ID: 5b5ff187-f644-11ee-843a-3f19d20e7db6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712648394; x=1713253194; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j72DCGLNfF0H/6oTHKVj/0hxUVY4aVCkxRHDnoBlo2A=;
        b=MCkMmDA1otkRKghJkOHXZdtgUNzB0lLsezCKKMipuHcCOkSGq6WG6Bl4ezvdM7vtQh
         8D5v/UNROo/CDUnjwj/MLdWUZzrS9ECA30y0snKXO8ZQ+qXeh1i5ZIUrBGLa/sur5B+2
         Id5eQkNoYif0jbyqC8zIWmwfc7mbScZTqjOdRNQGpMkIlVec2fRxVr4rtfdwncqy74Ky
         VdL8Fde5fdAqasGNo6zSncV47PYXF1kM5atxbyv43t7P7shQsnOIB4plwUF4O2sRN2lL
         Avp3C7PMH1PQlNjUKDba7Whubbkq1HIGvct1HeNcxGy/cyk0Awc/do5EeqbcA/797qnq
         V60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712648394; x=1713253194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j72DCGLNfF0H/6oTHKVj/0hxUVY4aVCkxRHDnoBlo2A=;
        b=noQ0wiBq9ThSSqdcpSaRNELsbnJWHrzpvR4lhyxhgD7YvkGwEUoxyeETpuXWaFP1KT
         BPUzoW7g9IqXKJni9sQUMODgzIMIAlC8uJN4irUTciD1EIdYXsSJzIvqG/L3NEv/1aJY
         qUdRsJD4AWv034OBzyBL7OBDYk121pSKdJHPKC0JWSvVxnddTo4GK5s+E2DcElomo0vU
         GYeFqbIIgaU+lbrVtvjPLRo0C7nSIVPd0SEKEefjsdt+jYemFNIZogSxw03efr1uugm3
         cHWsvwdDxzVbYL5vVtSVuSpTD+oaAOOh86sOx0lFWObEBw9GJp4FAiuBG/ZGGaDicQgy
         7img==
X-Forwarded-Encrypted: i=1; AJvYcCXD1KToFkzEWO7bNqVUZTshRV2AR7MgkCoNNI6sSrbnl5WRjplrRYjCTQRQnOO661s4m+cNH8eZxZPMWRJmU898kdKm6v6+BbTSbDAO00w=
X-Gm-Message-State: AOJu0Yy3Q2rEtgH5OmyNps4NbFXrLdG/qpVKxN6vnEuBKv+DhSOsfNAM
	xqnvETJeeYlKdKS+3mvyUk9q5B+peR7DV4IYz46JDW6gQk/DgB1+
X-Google-Smtp-Source: AGHT+IGiLm1EK8hoi3PZmEhXtPrzzdtlQc2ZpuOFwH3CmSH17Mrf3EVoX6JvlzXscwZoBke+j7mD2Q==
X-Received: by 2002:a05:6512:60b:b0:515:af1f:5bab with SMTP id b11-20020a056512060b00b00515af1f5babmr8506892lfe.40.1712648393767;
        Tue, 09 Apr 2024 00:39:53 -0700 (PDT)
Message-ID: <3ac34164e69f1983db3d4a66f62334497384958b.camel@gmail.com>
Subject: Re: [PATCH v7 10/19] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 09 Apr 2024 09:39:52 +0200
In-Reply-To: <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <6a6c4ef8663d9da8c8a2aba4baf0286f31566edf.1712137031.git.oleksii.kurochko@gmail.com>
	 <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTA0LTA4IGF0IDEwOjIzICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwMy4wNC4yMDI0IDEyOjIwLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmgKPiA+IEBA
IC0wLDAgKzEsMjYxIEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLwo+ID4gKy8qCj4gPiArICogVGFrZW4gYW5kIG1vZGlmaWVkIGZyb20gTGludXguCj4g
PiArICoKPiA+ICsgKiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgd2VyZSBkb25lOgo+ID4gKyAqIC0g
KiBhdG9taWMjI3ByZWZpeCMjXyp4Y2hnXyooYXRvbWljIyNwcmVmaXgjI190ICp2LCBjX3Qgbikg
d2VyZQo+ID4gdXBkYXRlZAo+ID4gKyAqwqDCoMKgwqAgdG8gdXNlX18qeGNoZ19nZW5lcmljKCkK
PiA+ICsgKiAtIGRyb3AgY2FzdHMgaW4gd3JpdGVfYXRvbWljKCkgYXMgdGhleSBhcmUgdW5uZWNl
c3NhcnkKPiA+ICsgKiAtIGRyb3AgaW50cm9kdWN0aW9uIG9mIFdSSVRFX09OQ0UoKSBhbmQgUkVB
RF9PTkNFKCkuCj4gPiArICrCoMKgIFhlbiBwcm92aWRlcyBBQ0NFU1NfT05DRSgpCj4gPiArICog
LSByZW1vdmUgemVyby1sZW5ndGggYXJyYXkgYWNjZXNzIGluIHJlYWRfYXRvbWljKCkKPiA+ICsg
KiAtIGRyb3AgZGVmaW5lcyBzaW1pbGFyIHRvIHBhdHRlcm4KPiA+ICsgKsKgwqAgI2RlZmluZSBh
dG9taWNfYWRkX3JldHVybl9yZWxheGVkwqDCoCBhdG9taWNfYWRkX3JldHVybl9yZWxheGVkCj4g
PiArICogLSBtb3ZlIG5vdCBSSVNDLVYgc3BlY2lmaWMgZnVuY3Rpb25zIHRvIGFzbS1nZW5lcmlj
L2F0b21pY3MtCj4gPiBvcHMuaAo+ID4gKyAqIAo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAwNyBS
ZWQgSGF0LCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCj4gPiArICogQ29weXJpZ2h0IChDKSAy
MDEyIFJlZ2VudHMgb2YgdGhlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQo+ID4gKyAqIENvcHly
aWdodCAoQykgMjAxNyBTaUZpdmUKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgVmF0ZXMgU0FT
Cj4gPiArICovCj4gPiArCj4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0FUT01JQ19ICj4gPiArI2Rl
ZmluZSBfQVNNX1JJU0NWX0FUT01JQ19ICj4gPiArCj4gPiArI2luY2x1ZGUgPHhlbi9hdG9taWMu
aD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL2NtcHhjaGcuaD4KPiA+ICsjaW5jbHVkZSA8YXNt
L2ZlbmNlLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9pby5oPgo+ID4gKyNpbmNsdWRlIDxhc20vc3lz
dGVtLmg+Cj4gPiArCj4gPiArdm9pZCBfX2JhZF9hdG9taWNfc2l6ZSh2b2lkKTsKPiA+ICsKPiA+
ICsvKgo+ID4gKyAqIExlZ2FjeSBmcm9tIExpbnV4IGtlcm5lbC4gRm9yIHNvbWUgcmVhc29uIHRo
ZXkgd2FudGVkIHRvIGhhdmUKPiA+IG9yZGVyZWQKPiA+ICsgKiByZWFkL3dyaXRlIGFjY2Vzcy4g
VGhlcmVieSByZWFkKiBpcyB1c2VkIGluc3RlYWQgb2YgcmVhZCpfY3B1KCkKPiA+ICsgKi8KPiA+
ICtzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIHJlYWRfYXRvbWljX3NpemUoY29uc3Qgdm9sYXRp
bGUgdm9pZCAqcCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqcmVzLAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiA+ICt7
Cj4gPiArwqDCoMKgIHN3aXRjaCAoIHNpemUgKQo+ID4gK8KgwqDCoCB7Cj4gPiArwqDCoMKgIGNh
c2UgMTogKih1aW50OF90ICopcmVzID0gcmVhZGIocCk7IGJyZWFrOwo+ID4gK8KgwqDCoCBjYXNl
IDI6ICoodWludDE2X3QgKilyZXMgPSByZWFkdyhwKTsgYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2Ug
NDogKih1aW50MzJfdCAqKXJlcyA9IHJlYWRsKHApOyBicmVhazsKPiA+ICsjaWZuZGVmIENPTkZJ
R19SSVNDVl8zMgo+ID4gK8KgwqDCoCBjYXNlIDg6ICoodWludDMyX3QgKilyZXMgPSByZWFkcShw
KTsgYnJlYWs7Cj4gPiArI2VuZGlmCj4gPiArwqDCoMKgIGRlZmF1bHQ6IF9fYmFkX2F0b21pY19z
aXplKCk7IGJyZWFrOwo+ID4gK8KgwqDCoCB9Cj4gPiArfQo+ID4gKwo+ID4gKyNkZWZpbmUgcmVh
ZF9hdG9taWMocCkgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIHVuaW9uIHsgdHlwZW9mKCoo
cCkpIHZhbDsgY2hhciBjW3NpemVvZigqKHApKV07IH0geF87wqDCoCBcCj4gPiArwqDCoMKgIHJl
YWRfYXRvbWljX3NpemUocCwgeF8uYywgc2l6ZW9mKCoocCkpKTvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB4Xy52YWw7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9KQo+ID4gKwo+ID4gK3N0YXRpYyBhbHdheXNfaW5saW5l
IHZvaWQgX3dyaXRlX2F0b21pYyh2b2xhdGlsZSB2b2lkICpwLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgbG9uZyB4LCB1bnNpZ25lZAo+ID4gaW50IHNpemUpCj4gPiArewo+ID4g
K8KgwqDCoCBzd2l0Y2ggKCBzaXplICkKPiA+ICvCoMKgwqAgewo+ID4gK8KgwqDCoCBjYXNlIDE6
IHdyaXRlYih4LCBwKTsgYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2UgMjogd3JpdGV3KHgsIHApOyBi
cmVhazsKPiA+ICvCoMKgwqAgY2FzZSA0OiB3cml0ZWwoeCwgcCk7IGJyZWFrOwo+ID4gKyNpZm5k
ZWYgQ09ORklHX1JJU0NWXzMyCj4gPiArwqDCoMKgIGNhc2UgODogd3JpdGVxKHgsIHApOyBicmVh
azsKPiA+ICsjZW5kaWYKPiA+ICvCoMKgwqAgZGVmYXVsdDogX19iYWRfYXRvbWljX3NpemUoKTsg
YnJlYWs7Cj4gPiArwqDCoMKgIH0KPiA+ICt9Cj4gPiArCj4gPiArI2RlZmluZSB3cml0ZV9hdG9t
aWMocCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+ICsoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB0eXBlb2YoKihwKSkgeF8gPSAoeCk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiAr
wqDCoMKgIF93cml0ZV9hdG9taWMoKHApLCB4Xywgc2l6ZW9mKCoocCkpKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgeF87wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9KQo+ID4gKwo+ID4gK3N0YXRpYyBhbHdheXNfaW5saW5l
IHZvaWQgX2FkZF9zaXplZCh2b2xhdGlsZSB2b2lkICpwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBsb25nIHgsIHVuc2lnbmVkIGludAo+ID4gc2l6ZSkKPiA+ICt7Cj4gPiArwqDCoMKg
IHN3aXRjaCAoIHNpemUgKQo+ID4gK8KgwqDCoCB7Cj4gPiArwqDCoMKgIGNhc2UgMTogd3JpdGVi
KHJlYWRfYXRvbWljKCh2b2xhdGlsZSB1aW50OF90ICopcCkgKyB4LCBwKTsKPiA+IGJyZWFrOwo+
ID4gK8KgwqDCoCBjYXNlIDI6IHdyaXRldyhyZWFkX2F0b21pYygodm9sYXRpbGUgdWludDE2X3Qg
KilwKSArIHgsIHApOwo+ID4gYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2UgNDogd3JpdGVsKHJlYWRf
YXRvbWljKCh2b2xhdGlsZSB1aW50MzJfdCAqKXApICsgeCwgcCk7Cj4gPiBicmVhazsKPiA+ICsj
aWZuZGVmIENPTkZJR19SSVNDVl8zMgo+ID4gK8KgwqDCoCBjYXNlIDg6IHdyaXRlcShyZWFkX2F0
b21pYygodm9sYXRpbGUgdWludDY0X3QgKilwKSArIHgsIHApOwo+ID4gYnJlYWs7Cj4gPiArI2Vu
ZGlmCj4gCj4gQW55IHBhcnRpY3VsYXIgcmVhc29uIGZvciB1c2luZyByZWFkX2F0b21pYygpIGJ1
dCB3cml0ZXtiLHcsbCxxfSgpCj4gaGVyZT8KVGhlcmUgaXMgbm8gcGFydGljdWxhciByZWFzb24u
IEkgd2lsbCB1c2Ugd3JpdGVfYXRvbWljIGZvciBjb25zaXN0ZW5jeS4KCj4gCj4gPiArwqDCoMKg
IGRlZmF1bHQ6IF9fYmFkX2F0b21pY19zaXplKCk7IGJyZWFrOwo+ID4gK8KgwqDCoCB9Cj4gPiAr
fQo+ID4gKwo+ID4gKyNkZWZpbmUgYWRkX3NpemVkKHAsIHgpwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArKHvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKg
wqAgdHlwZW9mKCoocCkpIHhfID0gKHgpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBfYWRkX3NpemVkKChwKSwg
eF8sIHNpemVvZigqKHApKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4g
PiArfSkKPiA+ICsKPiA+ICsjZGVmaW5lIF9fYXRvbWljX2FjcXVpcmVfZmVuY2UoKSBcCj4gPiAr
wqDCoMKgIGFzbSB2b2xhdGlsZSAoIFJJU0NWX0FDUVVJUkVfQkFSUklFUiAiIiA6OjogIm1lbW9y
eSIgKQo+ID4gKwo+ID4gKyNkZWZpbmUgX19hdG9taWNfcmVsZWFzZV9mZW5jZSgpIFwKPiA+ICvC
oMKgwqAgYXNtIHZvbGF0aWxlICggUklTQ1ZfUkVMRUFTRV9CQVJSSUVSICIiIDo6OiAibWVtb3J5
IiApCj4gCj4gVGhlcmUgaXNuJ3QgYW55IG5lZWQgZm9yIHRoZSAiIiBpbiB0aGVzZSB0d28sIGlz
IHRoZXJlPwpUaGVyZSBpcyBubyByZWFsbHkgbmVlZGVkICIiIGluIHRoaXMgY2FzZS4KPiAKPiA+
ICsvKgo+ID4gKyAqIEZpcnN0LCB0aGUgYXRvbWljIG9wcyB0aGF0IGhhdmUgbm8gb3JkZXJpbmcg
Y29uc3RyYWludHMgYW5kCj4gPiB0aGVyZWZvciBkb24ndAo+ID4gKyAqIGhhdmUgdGhlIEFRIG9y
IFJMIGJpdHMgc2V0LsKgIFRoZXNlIGRvbid0IHJldHVybiBhbnl0aGluZywgc28KPiA+IHRoZXJl
J3Mgb25seQo+ID4gKyAqIG9uZSB2ZXJzaW9uIHRvIHdvcnJ5IGFib3V0Lgo+ID4gKyAqLwo+ID4g
KyNkZWZpbmUgQVRPTUlDX09QKG9wLCBhc21fb3AsIHVuYXJ5X29wLCBhc21fdHlwZSwgY190eXBl
LCBwcmVmaXgpwqAKPiA+IFwKPiA+ICtzdGF0aWMgaW5saW5lwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+ID4gK3ZvaWQgYXRvbWljIyNwcmVmaXgjI18jI29wKGNfdHlwZSBp
LCBhdG9taWMjI3ByZWZpeCMjX3QgKnYpIFwKPiA+ICt7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBhc20gdm9s
YXRpbGUgKMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKgwqDCoMKgICLC
oMKgIGFtbyIgI2FzbV9vcCAiLiIgI2FzbV90eXBlICIgemVybywgJTEsICUwIsKgwqDCoMKgwqAg
XAo+ID4gK8KgwqDCoMKgwqDCoMKgIDogIitBIiAodi0+Y291bnRlcinCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvC
oMKgwqDCoMKgwqDCoCA6ICJyIiAodW5hcnlfb3AgaSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKg
wqDCoMKgIDogIm1lbW9yeSIgKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4g
Kwo+ID4gKy8qCj4gPiArICogT25seSBDT05GSUdfR0VORVJJQ19BVE9NSUM2ND15IHdhcyBwb3J0
ZWQgdG8gWGVuIHRoYXQgaXMgdGhlCj4gPiByZWFzb24gd2h5Cj4gPiArICogbGFzdCBhcmd1bWVu
dCBmb3IgQVRPTUlDX09QIGlzbid0IHVzZWQuCj4gPiArICovCj4gPiArI2RlZmluZSBBVE9NSUNf
T1BTKG9wLCBhc21fb3AsIHVuYXJ5X29wKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCBBVE9NSUNfT1AgKG9wLCBhc21fb3AsIHVuYXJ5
X29wLCB3LCBpbnQswqDCoCApCj4gPiArCj4gPiArQVRPTUlDX09QUyhhZGQsIGFkZCwgKykKPiA+
ICtBVE9NSUNfT1BTKHN1YiwgYWRkLCAtKQo+ID4gK0FUT01JQ19PUFMoYW5kLCBhbmQsICspCj4g
PiArQVRPTUlDX09QUyggb3IswqAgb3IsICspCj4gPiArQVRPTUlDX09QUyh4b3IsIHhvciwgKykK
PiA+ICsKPiA+ICsjdW5kZWYgQVRPTUlDX09QCj4gPiArI3VuZGVmIEFUT01JQ19PUFMKPiA+ICsK
PiA+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvYXRvbWljLW9wcy5oPgo+ID4gKwo+ID4gKy8qCj4g
PiArICogQXRvbWljIG9wcyB0aGF0IGhhdmUgb3JkZXJlZCB2YXJpYW50Lgo+ID4gKyAqIFRoZXJl
J3MgdHdvIGZsYXZvcnMgb2YgdGhlc2U6IHRoZSBhcml0aG1hdGljIG9wcyBoYXZlIGJvdGgKPiA+
IGZldGNoIGFuZCByZXR1cm4KPiA+ICsgKiB2ZXJzaW9ucywgd2hpbGUgdGhlIGxvZ2ljYWwgb3Bz
IG9ubHkgaGF2ZSBmZXRjaCB2ZXJzaW9ucy4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIEFUT01JQ19G
RVRDSF9PUChvcCwgYXNtX29wLCB1bmFyeV9vcCwgYXNtX3R5cGUsIGNfdHlwZSwKPiA+IHByZWZp
eCkgXAo+ID4gK3N0YXRpYwo+ID4gaW5saW5lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICtjX3R5cGUgYXRvbWljIyNwcmVmaXgjI19mZXRj
aF8jI29wKGNfdHlwZSBpLCBhdG9taWMjI3ByZWZpeCMjX3QKPiA+ICp2KSBcCj4gPiAre8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiA+IMKgIFwKPiA+ICvCoMKgwqAgcmVnaXN0ZXIgY190eXBlCj4gPiByZXQ7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBhc20gdm9sYXRpbGUK
PiA+ICjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDC
oMKgwqDCoMKgwqAgIsKgwqAgYW1vIiAjYXNtX29wICIuIiAjYXNtX3R5cGUgIi5hcXJswqAgJTEs
ICUyLAo+ID4gJTAiwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCA6ICIr
QSIgKHYtPmNvdW50ZXIpLCAiPXIiCj4gPiAocmV0KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCA6ICJy
IiAodW5hcnlfb3AKPiA+IGkpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKg
wqDCoMKgwqAgOiAibWVtb3J5Igo+ID4gKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4gPiArwqDCoMKgIHJldHVybgo+ID4gcmV0O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9Cj4gPiArCj4gPiArI2RlZmluZSBBVE9N
SUNfT1BfUkVUVVJOKG9wLCBhc21fb3AsIGNfb3AsIHVuYXJ5X29wLCBhc21fdHlwZSwKPiA+IGNf
dHlwZSwgcHJlZml4KSBcCj4gPiArc3RhdGljCj4gPiBpbmxpbmXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArY190eXBlIGF0
b21pYyMjcHJlZml4IyNfIyNvcCMjX3JldHVybihjX3R5cGUgaSwgYXRvbWljIyNwcmVmaXgjI190
Cj4gPiAqdinCoCBcCj4gPiAre8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IMKgwqDCoMKgwqAgXAo+ID4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBhdG9taWMjI3ByZWZpeCMjX2ZldGNoXyMjb3AoaSwgdikg
Y19vcCAodW5hcnlfb3AKPiA+IGkpO8KgwqDCoMKgIFwKPiAKPiBOaXQ6IFRvbyBkZWVwIGluZGVu
dGF0aW9uLgo+IAo+ID4gK30KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIE9ubHkgQ09ORklHX0dFTkVS
SUNfQVRPTUlDNjQ9eSB3YXMgcG9ydGVkIHRvIFhlbiB0aGF0IGlzIHRoZQo+ID4gcmVhc29uIHdo
eQo+ID4gKyAqIGxhc3QgYXJndW1lbnQgb2YgQVRPTUlDX0ZFVENIX09QLCBBVE9NSUNfT1BfUkVU
VVJOIGlzbid0IHVzZWQuCj4gPiArICovCj4gPiArI2RlZmluZSBBVE9NSUNfT1BTKG9wLCBhc21f
b3AsIGNfb3AsCj4gPiB1bmFyeV9vcCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoMKgwqAgQVRPTUlDX0ZFVENIX09QKCBv
cCwgYXNtX29wLMKgwqDCoMKgwqDCoCB1bmFyeV9vcCwgdywgaW50LMKgwqAKPiA+ICnCoMKgwqDC
oMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoMKgwqAgQVRPTUlDX09QX1JFVFVSTihvcCwgYXNtX29w
LCBjX29wLCB1bmFyeV9vcCwgdywgaW50LMKgwqAgKQo+ID4gKwo+ID4gK0FUT01JQ19PUFMoYWRk
LCBhZGQsICssICspCj4gPiArQVRPTUlDX09QUyhzdWIsIGFkZCwgKywgLSkKPiA+ICsKPiA+ICsj
dW5kZWYgQVRPTUlDX09QUwo+ID4gKwo+ID4gKyNkZWZpbmUgQVRPTUlDX09QUyhvcCwgYXNtX29w
LCB1bmFyeV9vcCkgXAo+ID4gK8KgwqDCoMKgwqDCoMKgIEFUT01JQ19GRVRDSF9PUChvcCwgYXNt
X29wLCB1bmFyeV9vcCwgdywgaW50LMKgwqAgKQo+ID4gKwo+ID4gK0FUT01JQ19PUFMoYW5kLCBh
bmQsICspCj4gPiArQVRPTUlDX09QUyggb3IswqAgb3IsICspCj4gPiArQVRPTUlDX09QUyh4b3Is
IHhvciwgKykKPiAKPiBUaGUgKyBpc24ndCByZWFsbHkgbmVlZGVkIGhlcmUgYXMgYSBtYWNybyBh
cmd1bWVudDsgQVRPTUlDX09QUygpCj4gaXRzZWxmIGNvdWxkCj4gcGFzcyBpdCB0byBBVE9NSUNf
RkVUQ0hfT1AoKS4gSSBhbHNvIHdvbmRlciB3aHkgQVRPTUlDX09QUygpIGhhcyBib3RoCj4gIm9w
IiBhbmQKPiAiYXNtX29wIiwgd2hlbiBib3RoIGFyZSB1bmlmb3JtbHkgdGhlIHNhbWUuCkl0IGlz
IG5lZWRlZCBmb3IgdGhlIGNhc2Ugd2hlbiBzdWIgb3BlcmF0aW9uIGlzIGltcGxlbWVudGVkIHVz
aW5nIGFkZApwbHVzIG5lZ2F0aXZlIG51bWJlcjoKK0FUT01JQ19PUFMoc3ViLCBhZGQsICssIC0p
CgoKPiAKPiA+ICsjdW5kZWYgQVRPTUlDX09QUwo+ID4gKwo+ID4gKyN1bmRlZiBBVE9NSUNfRkVU
Q0hfT1AKPiA+ICsjdW5kZWYgQVRPTUlDX09QX1JFVFVSTgo+ID4gKwo+ID4gKy8qIFRoaXMgaXMg
cmVxdWlyZWQgdG8gcHJvdmlkZSBhIGZ1bGwgYmFycmllciBvbiBzdWNjZXNzLiAqLwo+ID4gK3N0
YXRpYyBpbmxpbmUgaW50IGF0b21pY19hZGRfdW5sZXNzKGF0b21pY190ICp2LCBpbnQgYSwgaW50
IHUpCj4gPiArewo+ID4gK8KgwqDCoCBpbnQgcHJldiwgcmM7Cj4gPiArCj4gPiArwqDCoMKgIGFz
bSB2b2xhdGlsZSAoCj4gPiArwqDCoMKgwqDCoMKgwqAgIjA6IGxyLnfCoMKgwqDCoCAlW3BdLMKg
ICVbY11cbiIKPiA+ICvCoMKgwqDCoMKgwqDCoCAiwqDCoCBiZXHCoMKgwqDCoMKgICVbcF0swqAg
JVt1XSwgMWZcbiIKPiA+ICvCoMKgwqDCoMKgwqDCoCAiwqDCoCBhZGTCoMKgwqDCoMKgICVbcmNd
LCAlW3BdLCAlW2FdXG4iCj4gPiArwqDCoMKgwqDCoMKgwqAgIsKgwqAgc2Mudy5hcXJswqAgJVty
Y10sICVbcmNdLCAlW2NdXG4iCj4gPiArwqDCoMKgwqDCoMKgwqAgIsKgwqAgYm5lesKgwqDCoMKg
ICVbcmNdLCAwYlxuIgo+ID4gK8KgwqDCoMKgwqDCoMKgICIxOlxuIgo+ID4gK8KgwqDCoMKgwqDC
oMKgIDogW3BdICI9JnIiIChwcmV2KSwgW3JjXSAiPSZyIiAocmMpLCBbY10gIitBIiAodi0+Y291
bnRlcikKPiA+ICvCoMKgwqDCoMKgwqDCoCA6IFthXSAiciIgKGEpLCBbdV0gInIiICh1KQo+ID4g
K8KgwqDCoMKgwqDCoMKgIDogIm1lbW9yeSIpOwo+ID4gK8KgwqDCoCByZXR1cm4gcHJldjsKPiA+
ICt9Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSBpbnQgYXRvbWljX3N1Yl9pZl9wb3NpdGl2ZShh
dG9taWNfdCAqdiwgaW50IG9mZnNldCkKPiA+ICt7Cj4gPiArwqDCoMKgIGludCBwcmV2LCByYzsK
PiA+ICsKPiA+ICvCoMKgwqAgYXNtIHZvbGF0aWxlICgKPiA+ICvCoMKgwqDCoMKgwqDCoCAiMDog
bHIud8KgwqDCoMKgICVbcF0swqAgJVtjXVxuIgo+ID4gK8KgwqDCoMKgwqDCoMKgICLCoMKgIHN1
YsKgwqDCoMKgwqAgJVtyY10sICVbcF0sICVbb11cbiIKPiA+ICvCoMKgwqDCoMKgwqDCoCAiwqDC
oCBibHR6wqDCoMKgwqAgJVtyY10sIDFmXG4iCj4gPiArwqDCoMKgwqDCoMKgwqAgIsKgwqAgc2Mu
dy5hcXJswqAgJVtyY10sICVbcmNdLCAlW2NdXG4iCj4gPiArwqDCoMKgwqDCoMKgwqAgIsKgwqAg
Ym5lesKgwqDCoMKgICVbcmNdLCAwYlxuIgo+ID4gK8KgwqDCoMKgwqDCoMKgICIxOlxuIgo+ID4g
K8KgwqDCoMKgwqDCoMKgIDogW3BdICI9JnIiIChwcmV2KSwgW3JjXSAiPSZyIiAocmMpLCBbY10g
IitBIiAodi0+Y291bnRlcikKPiA+ICvCoMKgwqDCoMKgwqDCoCA6IFtvXSAiciIgKG9mZnNldCkK
PiA+ICvCoMKgwqDCoMKgwqDCoCA6ICJtZW1vcnkiICk7Cj4gPiArwqDCoMKgIHJldHVybiBwcmV2
IC0gb2Zmc2V0Owo+ID4gK30KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIGF0b21pY197Y21wLH14Y2hn
IGlzIHJlcXVpcmVkIHRvIGhhdmUgZXhhY3RseSB0aGUgc2FtZSBvcmRlcmluZwo+ID4gc2VtYW50
aWNzIGFzCj4gPiArICoge2NtcCx9eGNoZyBhbmQgdGhlIG9wZXJhdGlvbnMgdGhhdCByZXR1cm4u
Cj4gPiArICovCj4gPiArI2RlZmluZSBBVE9NSUNfT1AoY190LCBwcmVmaXgsIHNpemUpwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICtz
dGF0aWMgaW5saW5lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiArY190IGF0b21pYyMjcHJlZml4IyNfeGNoZyhhdG9taWMjI3ByZWZpeCMjX3QgKnYsIGNf
dCBuKcKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK3vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgcmV0
dXJuIF9feGNoZygmdi0+Y291bnRlciwgbiwgc2l6ZSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArfcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK3N0YXRpYyBp
bmxpbmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICtj
X3QgYXRvbWljIyNwcmVmaXgjI19jbXB4Y2hnKGF0b21pYyMjcHJlZml4IyNfdCAqdiwgY190IG8s
IGNfdCBuKQo+ID4gXAo+ID4gK3vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgcmV0dXJuIF9fY21w
eGNoZygmdi0+Y291bnRlciwgbywgbiwgc2l6ZSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4gPiArfQo+ID4gKwo+ID4gKyNkZWZpbmUgQVRPTUlDX09QUygpIFwKPiA+ICvC
oMKgwqAgQVRPTUlDX09QKGludCzCoMKgICwgNCkKPiAKPiBDYW4ndCB0aGUgdHdvIGlubGluZSBm
dW5jdGlvbnMgdXNlIHNpemVvZigqdiksIHNpemVvZih2LT5jb3VudGVyKSwKPiBzaXplb2YoY190
KSwKPiBvciBzaXplb2YobikgaW5zdGVhZCBvZiBwYXNzaW5nIGEgbGl0ZXJhbCA0IGhlcmU/CkFn
cmVlLCBpdCB3b3VsZCBiZSBiZXR0ZXIuCgpUaGFua3MuCgp+IE9sZWtzaWkK


