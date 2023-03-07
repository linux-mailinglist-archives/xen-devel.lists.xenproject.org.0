Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE546ADF27
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 13:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507354.780732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWnW-0008Lf-Eh; Tue, 07 Mar 2023 12:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507354.780732; Tue, 07 Mar 2023 12:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWnW-0008Iq-Bm; Tue, 07 Mar 2023 12:52:06 +0000
Received: by outflank-mailman (input) for mailman id 507354;
 Tue, 07 Mar 2023 12:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZWnV-0008Ik-Cb
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 12:52:05 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db9b5002-bce6-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 13:52:03 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id e13so11975267wro.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 04:52:03 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 h2-20020adffd42000000b002cde626cd96sm12623135wrs.65.2023.03.07.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 04:52:02 -0800 (PST)
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
X-Inumbo-ID: db9b5002-bce6-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678193523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DCmW4Aq/nGt+kwcmzqsNCJKlnkuGs7b19CPu9p4c9cU=;
        b=ZrH3WGvdZrumm7j7/MwdYV0NtpJD5n3+s3BaLYI6WGwOF5YcAS4bKtluGbk6uRd+af
         HQDlbUsUIYoVHhy03TdDOhLwiQTt0eKehyO1k/gYYsnfwF9IfqN37/4M+IS/Eno1z2Jp
         8hx+LxgxZ8q6fBmBiXgFwtwo1LBHMmSJzQSvPGmKlyj5+elTUjoVzbQmvW5fxzz/LJfg
         IZ9BiShLmnm5TJXtGTp2uLPXYr++Q7JHcSldXia6hWKj8ESr0x+GVgil0kMsmD6SKICK
         f4mVUg8PVxGTyEe6GVhGj1ZWg0WKiDZyQTLIls4AaUSZWNNsOTlwdbPVvP8z+J6SQDV3
         f8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678193523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCmW4Aq/nGt+kwcmzqsNCJKlnkuGs7b19CPu9p4c9cU=;
        b=uV7PVnetnlwy4EGjdjzIjaq9IxeUNLemMI7KYv5qY26ClWs7TRqRUIls4i8/9gC/eC
         YRo70wm7PfTrM4ZNDZnLH/ocHdACCZqOHYGmD1ARpluwlmls1FwmSNa6nv9lLT6pJg5C
         fJQgztYETgpQL6sg5Ekl193FH47rbUhyrsr+TJcLuJZgBd+sOj7P5UGtaeWdYrn6EquV
         ydnaPNHzB0va9OfLSmZTESsGlDa30UTi8oqszRKcNooV5ZrIjB8wq3pPtuhlPWwpJ+WW
         phQ4oLjHG+siY4wDiR9aOTXyxzJ6Im5FBdjxJb5JFQLUroWNuFB/zdcuxsbFftyKZDZT
         za+A==
X-Gm-Message-State: AO0yUKXhbvlBALfJtuZzJmqQsTJ6GAD6C5HJq8mrTrPsPwKhwL5oT0EC
	T2pUZDWI8cCPTidEWb6Y4WI=
X-Google-Smtp-Source: AK7set/DvDxt/Pc4G3uc3xzE8iv/wwduEpqDVsYOaFHPukG+Jf61RKCBmyp6nwnqHo+wXPTaXFSTtg==
X-Received: by 2002:adf:de8b:0:b0:2c7:7ac:ca6d with SMTP id w11-20020adfde8b000000b002c707acca6dmr9461354wrl.48.1678193522581;
        Tue, 07 Mar 2023 04:52:02 -0800 (PST)
Message-ID: <e91666a08b6cfc146123e18e634aacd979161b66.camel@gmail.com>
Subject: Re: [PATCH v5 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Tue, 07 Mar 2023 14:52:00 +0200
In-Reply-To: <8a7920d9-9622-195c-2706-2b435c2c856e@suse.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
	 <4a478638449e66a76e1671db38ec29b9e3108201.1677839409.git.oleksii.kurochko@gmail.com>
	 <8a7920d9-9622-195c-2706-2b435c2c856e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTAzLTA2IGF0IDExOjM2ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwMy4wMy4yMDIzIDExOjM4LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHdlcmUgbWFkZToKPiA+ICogTWFrZSBHRU5FUklDX0JVR19GUkFNRSBtYW5k
YXRvcnkgZm9yIFg4Ngo+ID4gKiBVcGRhdGUgYXNtL2J1Zy5oIHVzaW5nIGdlbmVyaWMgaW1wbGVt
ZW50YXRpb24gaW4gPHhlbi9idWcuaD4KPiA+ICogQ2hhbmdlIHByb3RvdHlwZSBvZiBkZWJ1Z2dl
cl90cmFwX2ZhdGFsKCkgaW4gYXNtL2RlYnVnZ2VyLmgKPiA+IMKgIHRvIGFsaWduIGl0IHdpdGgg
Z2VuZXJpYyBwcm90b3R5cGUgaW4gPHhlbi9kZWJ1Z2dlci5oPi4KPiAKPiBJcyB0aGlzIHBhcnQg
b2YgdGhlIGRlc2NyaXB0aW9uIHN0YWxlPyBUaGUgcGF0Y2ggLi4uCkl0IGlzIHN0YWxlLiBVcGRh
dGVkIG5vdy4KPiAKPiA+IC0tLQo+ID4gwqB4ZW4vYXJjaC94ODYvS2NvbmZpZ8KgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxICsKPiA+IMKgeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oIHwg
NzMgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiDCoHhlbi9hcmNoL3g4Ni90cmFw
cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA4MSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+IC0tLS0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNDQg
ZGVsZXRpb25zKC0pCj4gCj4gLi4uIGRvZXNuJ3QgdG91Y2ggYXNtL2RlYnVnZ2VyLmggYXQgYWxs
Lgo+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oCj4gPiArKysgYi94
ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmgKPiA+IEBAIC0xLDc5ICsxLDEyIEBACj4gPiDC
oCNpZm5kZWYgX19YODZfQlVHX0hfXwo+ID4gwqAjZGVmaW5lIF9fWDg2X0JVR19IX18KPiA+IMKg
Cj4gPiAtI2RlZmluZSBCVUdfRElTUF9XSURUSMKgwqDCoCAyNAo+ID4gLSNkZWZpbmUgQlVHX0xJ
TkVfTE9fV0lEVEggKDMxIC0gQlVHX0RJU1BfV0lEVEgpCj4gPiAtI2RlZmluZSBCVUdfTElORV9I
SV9XSURUSCAoMzEgLSBCVUdfRElTUF9XSURUSCkKPiA+ICsjZGVmaW5lIEJVR19ERUJVR0dFUl9U
UkFQX0ZBVEFMKHJlZ3MpCj4gPiBkZWJ1Z2dlcl90cmFwX2ZhdGFsKFg4Nl9FWENfR1AscmVncykK
PiAKPiBBbG9uZyB0aGUgbGluZXMgb2YgYSBjb21tZW50IG9uIGFuIGVhcmxpZXIgcGF0Y2gsIHBs
ZWFzZSBtb3ZlIHRoaXMKPiAuLi4KPiAKPiA+IMKgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiAKPiAu
Li4gaW50byB0aGUgdGh1cyBndWFyZGVkIHNlY3Rpb24uCkJ1dCBpdCB3YXMgZGVmaW5lZCB0aGVy
ZSBiZWZvcmUgdGhlIHBhdGNoIHNlcmllcyBhbmQgdGhlc2UgZGVmaW5pZXMgYXJlCnVzZWQgaW4g
IiNlbHNlIC8qICFfX0FTU0VNQkxZX18gKi8iCj4gCj4gPiBAQCAtMTE2NiwxMiArMTE2Nyw5IEBA
IHZvaWQgY3B1aWRfaHlwZXJ2aXNvcl9sZWF2ZXMoY29uc3Qgc3RydWN0Cj4gPiB2Y3B1ICp2LCB1
aW50MzJfdCBsZWFmLAo+ID4gwqAKPiA+IMKgdm9pZCBkb19pbnZhbGlkX29wKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQo+ID4gwqB7Cj4gPiAtwqDCoMKgIGNvbnN0IHN0cnVjdCBidWdfZnJh
bWUgKmJ1ZyA9IE5VTEw7Cj4gPiDCoMKgwqDCoCB1OCBidWdfaW5zblsyXTsKPiA+IC3CoMKgwqAg
Y29uc3QgY2hhciAqcHJlZml4ID0gIiIsICpmaWxlbmFtZSwgKnByZWRpY2F0ZSwgKmVpcCA9IChj
aGFyCj4gPiAqKXJlZ3MtPnJpcDsKPiA+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyBmaXh1cDsKPiA+
IC3CoMKgwqAgaW50IGlkID0gLTEsIGxpbmVubzsKPiA+IC3CoMKgwqAgY29uc3Qgc3RydWN0IHZp
cnR1YWxfcmVnaW9uICpyZWdpb247Cj4gPiArwqDCoMKgIGNvbnN0IGNoYXIgKmVpcCA9IChjaGFy
ICopcmVncy0+cmlwOwo+IAo+IEkgcmVhbGl6ZSAiY2hhciIgd2FzIHVzZWQgYmVmb3JlLCBidXQg
bm93IHRoYXQgdGhpcyBpcyBhbGwgb24gaXRzCj4gb3duLAo+IGNhbiB0aGlzIGF0IGxlYXN0IGJl
Y29tZSAidW5zaWduZWQgY2hhciIsIGJ1dCB5ZXQgYmV0dGVyICJ2b2lkIj8KSWYgd2UgY2hhbmdl
IGl0IHRvICJ2b2lkIiBzaG91bGRuJ3QgaXQgcmVxdWlyZSBhZGRpdGlvbmFsIGNhc3RzIGhlcmUg
KAp3aGljaCBpcyBub3QgbmljZSApOgogICAgICAgZWlwICs9IHNpemVvZihidWdfaW5zbik7ClBy
b2JhYmx5ICd1bnNnaW5lZCBjaGFyJyB3aWxsIGJlIGJldHRlci4KPiAKPiA+IEBAIC0xMTg1LDgz
ICsxMTgzLDE4IEBAIHZvaWQgZG9faW52YWxpZF9vcChzdHJ1Y3QgY3B1X3VzZXJfcmVncwo+ID4g
KnJlZ3MpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY21wKGJ1Z19pbnNuLCAiXHhmXHhiIiwg
c2l6ZW9mKGJ1Z19pbnNuKSkgKQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGRpZTsKPiA+IMKg
Cj4gPiAtwqDCoMKgIHJlZ2lvbiA9IGZpbmRfdGV4dF9yZWdpb24ocmVncy0+cmlwKTsKPiA+IC3C
oMKgwqAgaWYgKCByZWdpb24gKQo+ID4gLcKgwqDCoCB7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgZm9y
ICggaWQgPSAwOyBpZCA8IEJVR0ZSQU1FX05SOyBpZCsrICkKPiA+IC3CoMKgwqDCoMKgwqDCoCB7
Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgYnVnX2ZyYW1lICpiOwo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGk7Cj4gPiAtCj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKCBpID0gMCwgYiA9IHJlZ2lvbi0+ZnJhbWVbaWRdLmJ1
Z3M7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpIDwgcmVnaW9uLT5m
cmFtZVtpZF0ubl9idWdzOyBiKyssIGkrKyApCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7
Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggYnVnX2xvYyhiKSA9PSBl
aXAgKQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVnID0gYjsKPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGZvdW5kOwo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiAtwqDC
oMKgwqDCoMKgwqAgfQo+ID4gLcKgwqDCoCB9Cj4gPiAtCj4gPiAtIGZvdW5kOgo+ID4gLcKgwqDC
oCBpZiAoICFidWcgKQo+ID4gK8KgwqDCoCBpZCA9IGRvX2J1Z19mcmFtZShyZWdzLCByZWdzLT5y
aXApOwo+ID4gK8KgwqDCoCBpZiAoIGlkIDwgMCApCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
ZGllOwo+ID4gLcKgwqDCoCBlaXAgKz0gc2l6ZW9mKGJ1Z19pbnNuKTsKPiA+IC3CoMKgwqAgaWYg
KCBpZCA9PSBCVUdGUkFNRV9ydW5fZm4gKQo+ID4gLcKgwqDCoCB7Cj4gPiAtwqDCoMKgwqDCoMKg
wqAgdm9pZCAoKmZuKShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqKSA9IGJ1Z19wdHIoYnVnKTsKPiA+
IC0KPiA+IC3CoMKgwqDCoMKgwqDCoCBmbihyZWdzKTsKPiA+IC3CoMKgwqDCoMKgwqDCoCBmaXh1
cF9leGNlcHRpb25fcmV0dXJuKHJlZ3MsICh1bnNpZ25lZCBsb25nKWVpcCk7Cj4gPiAtwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOwo+ID4gLcKgwqDCoCB9Cj4gPiDCoAo+ID4gLcKgwqDCoCAvKiBXQVJO
LCBCVUcgb3IgQVNTRVJUOiBkZWNvZGUgdGhlIGZpbGVuYW1lIHBvaW50ZXIgYW5kIGxpbmUKPiA+
IG51bWJlci4gKi8KPiA+IC3CoMKgwqAgZmlsZW5hbWUgPSBidWdfcHRyKGJ1Zyk7Cj4gPiAtwqDC
oMKgIGlmICggIWlzX2tlcm5lbChmaWxlbmFtZSkgJiYgIWlzX3BhdGNoKGZpbGVuYW1lKSApCj4g
PiAtwqDCoMKgwqDCoMKgwqAgZ290byBkaWU7Cj4gPiAtwqDCoMKgIGZpeHVwID0gc3RybGVuKGZp
bGVuYW1lKTsKPiA+IC3CoMKgwqAgaWYgKCBmaXh1cCA+IDUwICkKPiA+IC3CoMKgwqAgewo+ID4g
LcKgwqDCoMKgwqDCoMKgIGZpbGVuYW1lICs9IGZpeHVwIC0gNDc7Cj4gPiAtwqDCoMKgwqDCoMKg
wqAgcHJlZml4ID0gIi4uLiI7Cj4gPiAtwqDCoMKgIH0KPiA+IC3CoMKgwqAgbGluZW5vID0gYnVn
X2xpbmUoYnVnKTsKPiA+ICvCoMKgwqAgZWlwICs9IHNpemVvZihidWdfaW5zbik7Cj4gPiDCoAo+
ID4gwqDCoMKgwqAgc3dpdGNoICggaWQgKQo+ID4gwqDCoMKgwqAgewo+ID4gK8KgwqDCoCBjYXNl
IEJVR0ZSQU1FX3J1bl9mbjoKPiA+IMKgwqDCoMKgIGNhc2UgQlVHRlJBTUVfd2FybjoKPiA+IC3C
oMKgwqDCoMKgwqDCoCBwcmludGsoIlhlbiBXQVJOIGF0ICVzJXM6JWRcbiIsIHByZWZpeCwgZmls
ZW5hbWUsIGxpbmVubyk7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgc2hvd19leGVjdXRpb25fc3RhdGUo
cmVncyk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIGZpeHVwX2V4Y2VwdGlvbl9yZXR1cm4ocmVncywg
KHVuc2lnbmVkIGxvbmcpZWlwKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+ID4gLQo+
ID4gLcKgwqDCoCBjYXNlIEJVR0ZSQU1FX2J1ZzoKPiA+IC3CoMKgwqDCoMKgwqDCoCBwcmludGso
IlhlbiBCVUcgYXQgJXMlczolZFxuIiwgcHJlZml4LCBmaWxlbmFtZSwgbGluZW5vKTsKPiA+IC0K
PiA+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIGRlYnVnZ2VyX3RyYXBfZmF0YWwoVFJBUF9pbnZhbGlk
X29wLCByZWdzKSApCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4gCj4gVGhp
cyBhbmQgLi4uCj4gCj4gPiAtwqDCoMKgwqDCoMKgwqAgc2hvd19leGVjdXRpb25fc3RhdGUocmVn
cyk7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgcGFuaWMoIlhlbiBCVUcgYXQgJXMlczolZFxuIiwgcHJl
Zml4LCBmaWxlbmFtZSwgbGluZW5vKTsKPiA+IC0KPiA+IC3CoMKgwqAgY2FzZSBCVUdGUkFNRV9h
c3NlcnQ6Cj4gPiAtwqDCoMKgwqDCoMKgwqAgLyogQVNTRVJUOiBkZWNvZGUgdGhlIHByZWRpY2F0
ZSBzdHJpbmcgcG9pbnRlci4gKi8KPiA+IC3CoMKgwqDCoMKgwqDCoCBwcmVkaWNhdGUgPSBidWdf
bXNnKGJ1Zyk7Cj4gPiAtwqDCoMKgwqDCoMKgwqAgaWYgKCAhaXNfa2VybmVsKHByZWRpY2F0ZSkg
JiYgIWlzX3BhdGNoKHByZWRpY2F0ZSkgKQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJl
ZGljYXRlID0gIjx1bmtub3duPiI7Cj4gPiAtCj4gPiAtwqDCoMKgwqDCoMKgwqAgcHJpbnRrKCJB
c3NlcnRpb24gJyVzJyBmYWlsZWQgYXQgJXMlczolZFxuIiwKPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHByZWRpY2F0ZSwgcHJlZml4LCBmaWxlbmFtZSwgbGluZW5vKTsKPiA+IC0K
PiA+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIGRlYnVnZ2VyX3RyYXBfZmF0YWwoVFJBUF9pbnZhbGlk
X29wLCByZWdzKSApCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4gCj4gLi4u
IHRoaXMgcmV0dXJuIGxvb2sgdG8gaGF2ZSBubyBwcm9wZXIgcmVwcmVzZW50YXRpb24gaW4gdGhl
IG5ldwo+IGxvZ2ljOyBib3RoIGNhc2VzIGZhbGwgdGhyb3VnaCB0byAuLi4KPiAKPiA+IC3CoMKg
wqDCoMKgwqDCoCBzaG93X2V4ZWN1dGlvbl9zdGF0ZShyZWdzKTsKPiA+IC3CoMKgwqDCoMKgwqDC
oCBwYW5pYygiQXNzZXJ0aW9uICclcycgZmFpbGVkIGF0ICVzJXM6JWRcbiIsCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJlZGljYXRlLCBwcmVmaXgsIGZpbGVuYW1lLCBsaW5lbm8p
Owo+ID4gwqDCoMKgwqAgfQo+ID4gwqAKPiA+IMKgIGRpZToKPiAKPiAuLi4gaGVyZSBub3csIHdo
aWNoIGlzIGFuIHVud2FudGVkIGZ1bmN0aW9uYWwgY2hhbmdlLgpPaCwgeW91IGFyZSByaWdodC4g
U28gdGhlbiBpbiBjYXNlIHdlIGhhdmUgY29ycmVjdCBpZCBpdCBpcyBuZWVkZWQgdG8KZG8gb25s
eSByZXR1cm46CiAgICBzd2l0Y2ggKCBpZCApCiAgICB7CiAgICBjYXNlIEJVR0ZSQU1FX3J1bl9m
bjoKICAgIGNhc2UgQlVHRlJBTUVfd2FybjoKICAgICAgICBmaXh1cF9leGNlcHRpb25fcmV0dXJu
KHJlZ3MsICh1bnNpZ25lZCBsb25nKWVpcCk7CiAgICAgICAgYnJlYWs7CiAgICB9CgogICAgcmV0
dXJuOwoKClRoYW5rcyBmb3IgZmluZGluZyB0aGF0LgoKfiBPbGVrc2lpCg==


