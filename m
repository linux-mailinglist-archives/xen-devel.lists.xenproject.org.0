Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1748A6D38A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 20:14:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAsg-00018W-8T; Thu, 18 Jul 2019 18:11:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hoAse-00018R-De
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 18:11:48 +0000
X-Inumbo-ID: 80fffdc6-a987-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80fffdc6-a987-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 18:11:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i21so28293046ljj.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RGIvcnxtWOCezxfSs8dSHNB1dLex0YXAWSD9Nbit5VY=;
 b=YLMhLyr2XxmVgMrqRvSImJVGd+HKsN7HISIJ+Ag5w8lkDLBQyYHRPD7hkeg3xNT2GM
 Z6Eru4mnDIWlYJTsswy+pL9KwHFNvC1p31VSr2q6GfmBwr0CA2C5sL2I3E7F5aJ+UJqL
 8iuqA+gpyfa2gO7ts1nXZnXrAADtZnv06Q6irPhZHcA393TtBCjEcw1yBmLAsvRhPgab
 9NQp25s2jXrSPAbcZiJDrGym96znQXNF2EDczmsMXXtHyk6zIdVu1ulxx9+NSAbcr+k+
 AHw0eW4hI5NagIJ7arCjC2cawiqy2/sZAlsF+lgjTJ1IWNhIPa76ZJM6Pv5KoPWnq8Hp
 jaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RGIvcnxtWOCezxfSs8dSHNB1dLex0YXAWSD9Nbit5VY=;
 b=Cgfl4ZASgWjItIfb2IwpIWA2OodXLKAxyjG3iwBZkauvy5+SU6W32e+NiyrFrhR8Qf
 izk5GwHp4RBMXMbIm19e3sECX6FB+xz5nr7CREl1qqZRM3FbvIKB2wnZoOrIQFaCsZm/
 3Ecr0J4Nl5j8ysym7Xa+WfQD4KgWFIMzlPxY0po1RbyScQdiKbNFYWbovnzuZzFl3+JP
 GmUXBdUmOYvJhAEB3wrK2XVRuOTzc5uH0TXloWCLrY8WgjOeAPOXkiZx2//BAqMEYMUB
 SKYP/L/Xm1J1r7qLor79LlgR754hUaLdUu10iBBHBkeLGs/HjPsGyD8rddbn1v/ULE8C
 16wA==
X-Gm-Message-State: APjAAAUnEYhauwY9ev+EmDReUSbcrWjX7EMv6avicNxFM1R8VcZT/qy2
 qUKKaFrqUasz1KlO5huTp4o=
X-Google-Smtp-Source: APXvYqxBEO3frz1GsQTd9RKp6L0sKjNFPas8LiFMH7J2mKNWFrYg+lYno05LEi7CJEqZc/pwO0dPQw==
X-Received: by 2002:a2e:9951:: with SMTP id r17mr24449427ljj.125.1563473505460; 
 Thu, 18 Jul 2019 11:11:45 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 s26sm5208737ljs.77.2019.07.18.11.11.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 11:11:44 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
 <abf62099-b848-b7ec-b665-52a2dce755b7@suse.com>
 <17c91de8-dbdb-7c56-08e4-a18b900783d3@gmail.com>
 <225f4ccb-d216-98cf-3615-e5196450ea58@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <fc0b01b0-73ce-3f07-9a98-3ef52ebd24f0@gmail.com>
Date: Thu, 18 Jul 2019 21:11:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <225f4ccb-d216-98cf-3615-e5196450ea58@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTguMDcuMTkgMTg6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE4
LjA3LjIwMTkgMTY6MTIsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IFRoZSBzY2VuYXJpbyBpcyBx
dWl0ZSB0cml2aWFsOiBzb21lIHZjcHUgdXB0ZGF0aW5nIGl0cyBydW5zdGF0ZSB2YWx1ZXMKPj4g
KGUuZy4gY29udGV4dCBzd2l0Y2hpbmcpIHdoaWxlIHRob3NlIHZhbHVlcyBhcmUgYmVpbmcgcmVh
ZCBieSBhIGd1ZXN0IHVzaW5nCj4+IG90aGVyIHZjcHUuCj4gCj4gV2VsbCwgdGhhdCdzIChhZmFp
YSkgbm90IGFuIGludGVuZGVkIHVzYWdlIHNjZW5hcmlvLiBUaGF0J3Mgc3BlY2lmaWNhbGx5Cj4g
d2hhdCB0aGUgWEVOX1JVTlNUQVRFX1VQREFURSBmbGFnIHdhcyBpbnRyb2R1Y2VkIGZvcjogVGhp
cyB3YXkgZ3Vlc3RzCj4gY2FuIG5vdGljZSB0aGF0IHRoZXkgc2hvdWxkbid0IHVzZSB0aGUgdmFs
dWVzLCBhcyB0aGV5J3JlIGxpa2VseQo+IGluY29uc2lzdGVudC4gVGhleSdkIHBhdXNlIGZvciBh
IGJyaWVmIG1vbWVudCBhbmQgbWFrZSBhbm90aGVyIGF0dGVtcHQ7Cj4gc2VlIExpbnV4J2VzIHhl
bl9nZXRfcnVuc3RhdGVfc25hcHNob3RfY3B1X2RlbHRhKCkuCgpPSywgSSBkaWQgdGhpcyBwYXRj
aCBhIHdoaWxlIGFnbyBhbmQgd3JvbmdseSByZWNhbGxlZCB0aGUgc2NlbmFyaW8uClRoZSByYWNl
IG9jY3VycyB3aGVuIHNvbWUgdmNwdSB3YXMganVzdCBzY2hlZHVsZWQgb3V0IGluIFJVTlNUQVRF
X2Jsb2NrZWQuIEdvaW5nIGRvd24gYnkgc2NoZWR1bGUgcGF0aCBpdCBlbnRlcnMgYHVwZGF0ZV9y
dW5zdGF0ZV9hcmVhKHByZXYpYCwgYW5kLCBhdCB0aGlzIG1vbWVudCwgaXQgaXMga2lja2VkIGJ5
IGB2Y3B1X3dha2UoKWAgZnJvbSBvdGhlciBQQ1BVLgoKPiBCdXQgbmVpdGhlciBmcm9tIHRoZSBj
b2RlIGNoYW5nZSBub3IgZnJvbSB0aGUgZGVzY3JpcHRpb24gSSB3b3VsZCBoYXZlCj4gaW1wbGll
ZCB0aGF0IGl0J3MgYSBndWVzdCBzaWRlIHByb2JsZW0geW91J3JlIHRyeWluZyB0byBhZGRyZXNz
LiBTbwo+IGZhciBJIHdhcyBhc3N1bWluZyB5b3UgaGFkIGZvdW5kIGEgcmFjZSBpbiBYZW4gaXRz
ZWxmLgoKQXMgSSBkZXNjcmliZSBhYm92ZSB0aGUgcmFjZSBpcyBpbiBYRU4gaXRzZWxmLiBZZXQg
aXQgaGFzIG5vIHByYWN0aWNhbCBpbXBhY3Qgb24gdGhlIHN5c3RlbSBhdCB0aGlzIG1vbWVudC4K
VGhpcyBwYXRjaCBkb2VzIGZpeCB0aGUgcmFjZSBpbiBYRU4sIGJ1dCBicmVha3Mgd2hhdCB3YXMg
Zml4ZWQgYnkgWEVOX1JVTlNUQVRFX1VQREFURS4gU28gSSBoYXZlIHRvIHJlY2FsbCBpdC4KCj4+
PiBDb25zaWRlcmluZyB0aGUgdmFsdWUgb2YgWEVOX1JVTlNUQVRFX1VQREFURSBpdCBtdXN0IGJl
IGEgcmF0aGVyIHJhcmUgcmFjZQo+Pj4gYW55d2F5LCBJIHdvdWxkIGd1ZXNzLgo+Pgo+PiBJJ20g
bm90IHN1cmUgaG93IGRvIHlvdSBsaW5rIHRoZSB2YWx1ZSBvZiBYRU5fUlVOU1RBVEVfVVBEQVRF
IGFuZCB0aGUgaXNzdWUKPj4gb2NjdXJyZW5jZSByYXRlLiBDb3VsZCB5b3UgcGxlYXNlIHByb3Zp
ZGUgbW9yZSBkZXRhaWxzIGFib3V0IHRoZSBpZGVhPwo+IAo+IFRoZSB2YWx1ZSBpcyBodWdlLCBo
ZW5jZSBpdCBiZWluZyB3cm9uZ2x5IHBhcnQgb2YgYSBjYWxjdWxhdGlvbiBvdWdodCB0bwo+IGJl
IGVhc2lseSBub3RpY2VhYmxlIF9pZl8gaXQgb2NjdXJyZWQgb2Z0ZW4gZW5vdWdoLgoKV2VsbCwg
dGhlIGBkZWx0YWAgdmFsdWUgYmVjb21lIG5lZ2F0aXZlLCBzbyBpdCBpcyBub3QgYWNjdW11bGF0
ZWQgaW50byB0aGUgY3VycmVudCBydW5zdGF0ZSB0aW1lIGFuZCB0aGUgbmV3IHJ1bnN0YXRlIGVu
dHJ5IHRpbWUgaXMgbm90IHVwZGF0ZWQuCldoaWxlIHdlIGN1cnJlbnRseSBzZWVpbmcgdGhpcyBl
ZmZlY3QgZm9yIGJsb2NrZWQtdG8tcnVubmFibGUgdHJhbnNpdGlvbiBvbmx5LCBpdCBjYW4gYmUg
aWdub3JlZC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
