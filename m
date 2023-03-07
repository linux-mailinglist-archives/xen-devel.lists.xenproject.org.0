Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690F6AE09D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507380.780791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXQD-0007S8-Pi; Tue, 07 Mar 2023 13:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507380.780791; Tue, 07 Mar 2023 13:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXQD-0007Qs-MJ; Tue, 07 Mar 2023 13:32:05 +0000
Received: by outflank-mailman (input) for mailman id 507380;
 Tue, 07 Mar 2023 13:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZXQC-0007Qm-44
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:32:04 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714af29a-bcec-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 14:32:02 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id p26so7755619wmc.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:32:01 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c308900b003dfe5190376sm12858099wmn.35.2023.03.07.05.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:32:01 -0800 (PST)
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
X-Inumbo-ID: 714af29a-bcec-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678195921;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TsSHmCWbay6Nebh30sKWsmQisQs5TxAvCURqm6DNZX8=;
        b=i4iqhrVOLTdzE4bve5mMBhHN4Z1HM0RYavpBMnStzEdea6BbYvZP8KCj4kWZzWuNno
         KU7jYH0LXvwHx3DcFk4gN9t1H9qiWwti5MwfAfmi4QqvqC0dKAyG3segSXRuegDV/i6A
         paB3yPhVTAuNQXaf2lgxjfW/yBXKZ1m5L8jiRvACJWngG010Y81e7UxQa+/p5RCwPMaB
         JmopZaZeUsm72Awe2+W7ok3a6+L004vQ2a7H4bAUo83aefuQIUhUMq6r5jhyR8VbtjaD
         fmJJtId7bUcKQwrm6ERulaxcaoxegmepXQnLSMtTcblHzF68wCwmJNYs0hxLbUJa+Zsi
         r9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195921;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsSHmCWbay6Nebh30sKWsmQisQs5TxAvCURqm6DNZX8=;
        b=uV0GqZBpI40kZyDaB4xeTSuX9SDEZQ8IvGMTkoBkvEyIezfjTWd6sG/uJ9KK3fMf/f
         YzBYbf9GQA2ie8hOKCGJT2jncYsYvSPqAG2l5cpab2uC2rpJTrqlm1iVqdZWztLFHNfT
         TwDi4iCwGr7obQy0Dsd0keSiq9UH1BKE0qUl2Us7ruDeSSZrcDPTBDo2s7CChBTfCSqu
         PXpBRl57Or+gfqLlap+6YYfa5SLd00As4MctjLjepKdqvFA8Go6bfVaJX9D+KVgHeD6M
         1XIjvBiZD4GIUDjxfUMTSfshD8zu1b6eXLc38bj+HoRUafMlmAVNlDG1Wsgj0vH20D1e
         NTCw==
X-Gm-Message-State: AO0yUKXneyiv5Seu9PWS/5LtPoAhFAJDJkG7Olp/YwSl46nol7hfGDrn
	asgEzhpoy0/k8gq1dresQp0=
X-Google-Smtp-Source: AK7set/oDq8oX621h7mUBzsWYcIxAcmfWLOj1R39cIleun2OcWVDl21LAlMZeasNjVv/pTubLYqiDQ==
X-Received: by 2002:a05:600c:1d22:b0:3eb:2708:86ce with SMTP id l34-20020a05600c1d2200b003eb270886cemr13154221wms.31.1678195921374;
        Tue, 07 Mar 2023 05:32:01 -0800 (PST)
Message-ID: <3d6d2a4f89744e8b6814e668244fe8058df04d64.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 07 Mar 2023 15:31:59 +0200
In-Reply-To: <7be952d9-efea-23ec-0c5f-cfce03bee6a0@suse.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
	 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
	 <91343570-3532-521f-9bfe-3a68902426d0@suse.com>
	 <17d7dc28a767ec9012d4a7ac3d337c4b9c34d98e.camel@gmail.com>
	 <46e7e298e52afcee46bb7fd52ddd181227356c98.camel@gmail.com>
	 <7be952d9-efea-23ec-0c5f-cfce03bee6a0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

T24gVHVlLCAyMDIzLTAzLTA3IGF0IDE0OjE2ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwNy4wMy4yMDIzIDE0OjEzLCBPbGVrc2lpIHdyb3RlOgo+ID4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gPiArI2RlZmluZSBCVUdfRlJBTUUodHlwZSwgbGluZSwgcHRyLCBzZWNvbmRfZnJhbWUs
IG1zZykgZG8KPiA+ID4gPiA+ID4gPiB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiA+ID4gPiA+ID4gPiArwqDCoMKgIEJVSUxEX0JVR19PTigobGluZSkgPj4gKEJVR19M
SU5FX0xPX1dJRFRIICsKPiA+ID4gPiA+ID4gPiBCVUdfTElORV9ISV9XSURUSCkpO8KgwqDCoMKg
wqDCoMKgwqAgXAo+ID4gPiA+ID4gPiA+ICvCoMKgwqAgQlVJTERfQlVHX09OKCh0eXBlKSA+PQo+
ID4gPiA+ID4gPiA+IEJVR0ZSQU1FX05SKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiA+ID4gPiA+
ICvCoMKgwqAgYXNtIHZvbGF0aWxlICgKPiA+ID4gPiA+ID4gPiBfQVNNX0JVR0ZSQU1FX1RFWFQo
c2Vjb25kX2ZyYW1lKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgCj4gPiA+ID4gPiA+ID4gXAo+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgOjogX0FTTV9CVUdGUkFNRV9JTkZPKHR5cGUsIGxpbmUsCj4gPiA+
ID4gPiA+ID4gcHRyLAo+ID4gPiA+ID4gPiA+IG1zZykKPiA+ID4gPiA+ID4gPiApO8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+ID4gPiA+ID4gPiA+ICt9IHdoaWxlICgwKQo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBJc24ndCB0aGlzIHRpZWQgdG8gQlVHX0ZSQU1FX1NUUlVDVCBiZWluZyBkZWZpbmVk
IChvciBub3QpPwo+ID4gPiA+ID4gQXQKPiA+ID4gPiA+IGxlYXN0Cj4gPiA+ID4gPiB0aGUgMXN0
IEJVSUxEX0JVR19PTigpIGxvb2tzIHByb2JsZW1hdGljIGlmIGFuIGFyY2ggd2Fzbid0IHRvCj4g
PiA+ID4gPiB1c2UKPiA+ID4gPiA+IHRoZSBnZW5lcmljIHN0cnVjdDogV2l0aCBob3cgeW91IGhh
dmUgdGhpbmdzIHJpZ2h0IG5vdwo+ID4gPiA+ID4gQlVHX0xJTkVfe0xPLEhJfV9XSURUSCBtYXkg
bm90IGJlIGRlZmluZWQsIGFuZCB0aGUgY2hlY2sKPiA+ID4gPiA+IHdvdWxkCj4gPiA+ID4gPiBh
bHNvCj4gPiA+ID4gPiBiZSBhdCByaXNrIG9mIGNhdXNpbmcgZmFsc2UgcG9zaXRpdmVzLiBQZXJo
YXBzIGl0J3MKPiA+ID4gPiA+IGFwcHJvcHJpYXRlCj4gPiA+ID4gPiB0bwo+ID4gPiA+ID4gaGF2
ZSBhIHNlcGFyYXRlICNpZmRlZiAoaW5jbCB0aGUgZGlzdGluY3QgaWRlbnRpZmllciB1c2VkKSwK
PiA+ID4gPiA+IGJ1dAo+ID4gPiA+ID4gdGhhdAo+ID4gPiA+ID4gZmlyc3QgQlVJTERfQlVHX09O
KCkgbmVlZHMgYWJzdHJhY3Rpbmcgb3V0Lgo+ID4gPiBNaXNzZWQgdGhhdC4gVGhhbmtzLgo+ID4g
PiBJJ2xsIGludHJvZHVjZSB0aGF0IGEgc2VwYXJhdGUgI2lmZGVmIGJlZm9yZSBCVUdfRlJBTUU6
Cj4gPiA+IAo+ID4gPiAjaWZuZGVmIEJVSUxEX0JVR19PTl9MSU5FX1dJRFRICj4gPiA+ICNkZWZp
bmUgQlVJTERfQlVHX09OX0xJTkVfV0lEVEggXAo+ID4gPiDCoMKgwqDCoMKgwqDCoCBCVUlMRF9C
VUdfT04oKGxpbmUpID4+IChCVUdfTElORV9MT19XSURUSCArCj4gPiA+IEJVR19MSU5FX0hJX1dJ
RFRIKSkKPiA+ID4gI2VuZGlmCj4gPiBJIHRoaW5rIGV2ZW4gYmV0dGVyIHdpbGwgYmUgdG8gZG8g
aW4gdGhlIGZvbGxvd2luZyB3YXk6Cj4gPiAKPiA+ICNpZm5kZWYgTElORV9XSURUSAo+ID4gI2Rl
ZmluZSBMSU5FX1dJRFRIIChCVUdfTElORV9MT19XSURUSCArIEJVR19MSU5FX0hJX1dJRFRIKQo+
ID4gI2VuZGlmCj4gPiAKPiA+ICNkZWZpbmUgQlVHX0ZSQU1FKHR5cGUsIGxpbmUsIHB0ciwgc2Vj
b25kX2ZyYW1lLCBtc2cpIGRvCj4gPiB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiA+IFwKPiA+
IMKgwqDCoCBCVUlMRF9CVUdfT04oKGxpbmUpID4+Cj4gPiBMSU5FX1dJRFRIKTvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gPiBc
Cj4gPiDCoMKgwqAgQlVJTERfQlVHX09OKCh0eXBlKSA+PQo+ID4gQlVHRlJBTUVfTlIpO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4g
PiBcCj4gPiDCoMKgwqAgYXNtIHZvbGF0aWxlICgKPiA+IF9BU01fQlVHRlJBTUVfVEVYVChzZWNv
bmRfZnJhbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+ID4gXAo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDo6IF9BU01fQlVHRlJBTUVfSU5G
Tyh0eXBlLCBsaW5lLCBwdHIsIG1zZykKPiA+ICk7wqDCoMKgwqAgCj4gPiBcCj4gPiB9IHdoaWxl
IChmYWxzZSkKPiAKPiBOb3Qgc3VyZSAtIHRoYXQnbGwgc3RpbGwgcmVxdWlyZSBhcmNoZXMgdG8g
ZGVmaW5lIExJTkVfV0lEVEguIFdoYXQKPiBpZiB0aGV5IHN0b3JlIHRoZSBsaW5lIG51bWJlciBp
biBhIDMyLWJpdCBmaWVsZD8gVGhlbiBkZWZpbmluZwo+IExJTkVfV0lEVEggdG8gMzIgd291bGQg
eWllbGQgdW5kZWZpbmVkIGJlaGF2aW9yIGhlcmUuCj4gCkl0IG1pZ2h0IGJlIGFuIGlzc3VlLgoK
VGhhbiBpdCB3aWxsIGJlIGJldHRlciB0byBoYXZlIGZ1bmN0aW9uLWxpa2UgbWFjcm9zIG1lbnRp
b25lZCBpbgpwcmV2aW91cyBlLW1haWwuCgpUaGFua3MKCn4gT2xla3NpaQo=


