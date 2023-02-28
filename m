Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2526A56C6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 11:31:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503222.775421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxGC-0005tI-Hn; Tue, 28 Feb 2023 10:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503222.775421; Tue, 28 Feb 2023 10:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxGC-0005rA-EL; Tue, 28 Feb 2023 10:31:04 +0000
Received: by outflank-mailman (input) for mailman id 503222;
 Tue, 28 Feb 2023 10:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWxGA-0005r4-VU
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 10:31:03 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id febe4694-b752-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 11:31:00 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id f16so9630224ljq.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 02:31:00 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 b28-20020a05651c033c00b002947028ae7csm1132356ljp.72.2023.02.28.02.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:30:59 -0800 (PST)
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
X-Inumbo-ID: febe4694-b752-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R9s7fnqgePtqWJ7qc7BcwaGOakPxblytLMey93ztBk0=;
        b=XaXKaO41glMOigeY1OIkkBejuQYc6sV9t8ovZgfRVyl3TQvlVEsRZfYGfYHo6u0yqe
         S7L37x0pqKtVf0i+39bploFhMTCCDjGvV6umauFfsusjvGfcNytNlcxWWEcw+cqO7bh5
         0rpHbuwaz0RqythGPRDKlaWEmW5bYbfHqypXc3R8zdMVneUYx+mSvycOwDFZ8ubjfokg
         SFiyLxSd0pJ/lpPnIMTRZ10WtZGbcahV+7aMKTdUBdwpXqAqYz3Lbc8KxPR9aBbhh5Cd
         kPw50wWXDLLv1Z6zdMHQabuzoYRqt8zYEGuUIgAG7xpy2AIHThSMiVd4iFGyPKCN26PG
         i1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9s7fnqgePtqWJ7qc7BcwaGOakPxblytLMey93ztBk0=;
        b=2HhQmvjvyXbseM4N9NRYXxnz2V7lzt42fwSeP3sjKL9C7pSaxgR0iyLWcKXtOXyGpm
         EtmbUU5LXwfB9O8O00d8nE7s0gXMa308sVM49dpbXpnp/ZZOo40RicermsS8b6ML6+bG
         Wz3T/JeWmCoXakzuguCpTM1YMtYSb9hbe9DhBOwVGaQz21KAiGzZHVu+1SEhDrz33gYn
         idjEyQT3ec3MLWMllTFz0Rbba4d9NZmG+zFt4mRd3ZPhtnnK6HwbP7VXau8qPX0ilydU
         D0FLdBFiLz0Nfyz78BuK8WizEn0IEPJsDLM3bQIQWPnf7DICdMVg62A9PVQV/PxEXSnN
         L46g==
X-Gm-Message-State: AO0yUKW3C502ibVB1PC1o7u/Y7Z2PC+FAbGv0WzHasL5TnzrvxcduAdg
	9QxOQ0nYxa+gWpwgsu4q0I4=
X-Google-Smtp-Source: AK7set/OMNpz1pE7SCF9PRP6SmN1T4NKTyBlCrYuvaVsPvFK7ya7hhi8k0HXhCkc4VB6xvn2hsgsDQ==
X-Received: by 2002:a2e:86d9:0:b0:295:a3a9:a3e4 with SMTP id n25-20020a2e86d9000000b00295a3a9a3e4mr737811ljj.45.1677580260151;
        Tue, 28 Feb 2023 02:31:00 -0800 (PST)
Message-ID: <507c5449a56ce5cf5758bef967d511bf545d8405.camel@gmail.com>
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>,  xen-devel@lists.xenproject.org
Date: Tue, 28 Feb 2023 12:30:57 +0200
In-Reply-To: <f052e88e-1c85-3116-b76a-24785b005121@suse.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
	 <f052e88e-1c85-3116-b76a-24785b005121@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTAyLTI3IGF0IDE1OjIzICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNC4wMi4yMDIzIDEyOjMxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2NvbW1vbi9idWcuYwo+ID4gQEAgLTAsMCArMSwxMDkgQEAKPiA+
ICsjaW5jbHVkZSA8eGVuL2J1Zy5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vZGVidWdnZXIuaD4KPiA+
ICsjaW5jbHVkZSA8eGVuL2Vycm5vLmg+Cj4gPiArI2luY2x1ZGUgPHhlbi9rZXJuZWwuaD4KPiA+
ICsjaW5jbHVkZSA8eGVuL2xpdmVwYXRjaC5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vc3RyaW5nLmg+
Cj4gPiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vdmlydHVhbF9y
ZWdpb24uaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ID4gKwo+ID4g
Ky8qIFNldCBkZWZhdWx0IHZhbHVlIGZvciBUUkFQX2ludmFsaWRfb3AgYXMgaXQgaXMgZGVmaW5l
ZCBvbmx5IGZvcgo+ID4gWDg2IG5vdyAqLwo+ID4gKyNpZm5kZWYgVFJBUF9pbnZhbGlkX29wCj4g
PiArI2RlZmluZSBUUkFQX2ludmFsaWRfb3AgMAo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gK2ludCBk
b19idWdfZnJhbWUoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxv
bmcKPiA+IHBjKQo+ID4gK3sKPiA+ICvCoMKgwqAgY29uc3Qgc3RydWN0IGJ1Z19mcmFtZSAqYnVn
ID0gTlVMTDsKPiA+ICvCoMKgwqAgY29uc3Qgc3RydWN0IHZpcnR1YWxfcmVnaW9uICpyZWdpb247
Cj4gPiArwqDCoMKgIGNvbnN0IGNoYXIgKnByZWZpeCA9ICIiLCAqZmlsZW5hbWUsICpwcmVkaWNh
dGU7Cj4gPiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgZml4dXA7Cj4gPiArwqDCoMKgIHVuc2lnbmVk
IGludCBpZCA9IEJVR0ZSQU1FX05SLCBsaW5lbm87Cj4gPiArCj4gPiArwqDCoMKgIHJlZ2lvbiA9
IGZpbmRfdGV4dF9yZWdpb24ocGMpOwo+ID4gK8KgwqDCoCBpZiAoIHJlZ2lvbiApCj4gPiArwqDC
oMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKCBpZCA9IDA7IGlkIDwgQlVHRlJBTUVfTlI7
IGlkKysgKQo+ID4gK8KgwqDCoMKgwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0IHN0cnVjdCBidWdfZnJhbWUgKmI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoIGkg
PSAwLCBiID0gcmVnaW9uLT5mcmFtZVtpZF0uYnVnczsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGkgPCByZWdpb24tPmZyYW1lW2lkXS5uX2J1Z3M7IGIrKywgaSsrICkK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCBidWdfbG9jKGIpID09IHBjICkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJ1ZyA9IGI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBmb3VuZDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgwqDCoMKgIH0KPiA+ICvCoMKgwqAgfQo+
ID4gKwo+ID4gKyBmb3VuZDoKPiA+ICvCoMKgwqAgaWYgKCAhYnVnICkKPiA+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICvCoMKgwqAgaWYgKCBpZCA9PSBCVUdGUkFN
RV9ydW5fZm4gKQo+ID4gK8KgwqDCoCB7Cj4gPiArI2lmZGVmIEJVR19GTl9SRUcKPiA+ICvCoMKg
wqDCoMKgwqDCoCB2b2lkICgqZm4pKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICopID0gKHZv
aWQgKilyZWdzLQo+ID4gPkJVR19GTl9SRUc7Cj4gPiArI2Vsc2UKPiA+ICvCoMKgwqDCoMKgwqDC
oCB2b2lkICgqZm4pKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICopID0gYnVnX3B0cihidWcp
Owo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIGZuKHJlZ3MpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBpZDsKPiA+ICvCoMKgwqAgfQo+ID4gKwo+ID4gK8Kg
wqDCoCAvKiBXQVJOLCBCVUcgb3IgQVNTRVJUOiBkZWNvZGUgdGhlIGZpbGVuYW1lIHBvaW50ZXIg
YW5kIGxpbmUKPiA+IG51bWJlci4gKi8KPiA+ICvCoMKgwqAgZmlsZW5hbWUgPSBidWdfcHRyKGJ1
Zyk7Cj4gPiArwqDCoMKgIGlmICggIWlzX2tlcm5lbChmaWxlbmFtZSkgJiYgIWlzX3BhdGNoKGZp
bGVuYW1lKSApCj4gPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArwqDCoMKg
IGZpeHVwID0gc3RybGVuKGZpbGVuYW1lKTsKPiA+ICvCoMKgwqAgaWYgKCBmaXh1cCA+IDUwICkK
PiA+ICvCoMKgwqAgewo+ID4gK8KgwqDCoMKgwqDCoMKgIGZpbGVuYW1lICs9IGZpeHVwIC0gNDc7
Cj4gPiArwqDCoMKgwqDCoMKgwqAgcHJlZml4ID0gIi4uLiI7Cj4gPiArwqDCoMKgIH0KPiA+ICvC
oMKgwqAgbGluZW5vID0gYnVnX2xpbmUoYnVnKTsKPiA+ICsKPiA+ICvCoMKgwqAgc3dpdGNoICgg
aWQgKQo+ID4gK8KgwqDCoCB7Cj4gPiArwqDCoMKgIGNhc2UgQlVHRlJBTUVfd2FybjoKPiA+ICvC
oMKgwqDCoMKgwqDCoCBwcmludGsoIlhlbiBXQVJOIGF0ICVzJXM6JWRcbiIsIHByZWZpeCwgZmls
ZW5hbWUsIGxpbmVubyk7Cj4gPiArwqDCoMKgwqDCoMKgwqAgc2hvd19leGVjdXRpb25fc3RhdGUo
cmVncyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGlkOwo+ID4gKwo+ID4gK8Kg
wqDCoCBjYXNlIEJVR0ZSQU1FX2J1ZzoKPiA+ICvCoMKgwqDCoMKgwqDCoCBwcmludGsoIlhlbiBC
VUcgYXQgJXMlczolZFxuIiwgcHJlZml4LCBmaWxlbmFtZSwgbGluZW5vKTsKPiA+ICsKPiA+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoIGRlYnVnZ2VyX3RyYXBfZmF0YWwoVFJBUF9pbnZhbGlkX29wLCBy
ZWdzKSApCj4gCj4gVFJBUF9pbnZhbGlkX29wIGlzLCBhcyBzYWlkLCBhYm91dCB0byBkaXNhcHBl
YXIgb24geDg2IGFzIHdlbGwuIEkKPiB0aGluawo+IHRoaXMgY29uc3RydWN0IHdhbnRzIGFic3Ry
YWN0aW5nIGJ5IGFub3RoZXIgYXNtL2J1Zy5oIHByb3ZpZGVkIG1hY3JvCj4gKHRha2luZyBqdXN0
IHJlZ3MpLgo+IApUaGFua3MgZm9yIHRoZSBsaW5rLgoKTmljZSBpZGVhIHRvIGFic3RyYWN0ICdk
ZWJ1Z2dlcl90cmFwX2ZhdGFsKFRSQVBfaW52YWxpZF9vcCwgcmVncyknLgpBY3R1YWxseSB3ZSBo
YXZlIHRvIG9wdGlvbnMgaGVyZToKMS4gQXMgeW91IHByb3Bvc2VkIGFic3RyYWN0IGluIDxhc20v
YnVnLmg+OgogICB4ODY6ICAjZGVmaW5lIERFQlVHX1RSQVBfRkFUQUwocmVncykgZGVidWdnZXJf
dHJhcF9mYXRhbChYODZfRVhDX0dQLApyZWdzKQogICBBUk06ICNkZWZpbmUgREVCVUdfVFJBUF9G
QVRBTChyZWdzKSAwCiAgIFJJU0MtVjogI2RlZmluZSBERUJVR19UUkFQX0ZBVEFMKHJlZ3MpIDAK
ICBGb3IgQVJNIGFuZCBSSVNDLVYgaXQgZG9lc24ndCB1c2Ugc28gd2UgY2FuIHNraXAgdGhlIGNo
ZWNrIGlmICgKREVCVUdfVFJBUF9GQVRBTCApLgoKMi4gQWJzdHJhY3Qgb25seSBUUkFQX2ludmFs
aWRfb3AgaW4gPGFzbS9idWcuaD4KICB4ODY6ICNkZWZpbmUgVFJBUF9pbnZhbHVkX29wIFg4Nl9F
WENfR1AKICBSSVNDLVY6ICNkZWZpbmUgVFJBUF9pbnZhbGlkX29wIDAKICBBUk46ICNkZWZpbmUg
VFJBUF9pbnZhbGlkX29wIDAKICAKICBJIGFtIG5vdCBzdXJlIGlmIHdlIGhhdmUgdG8gcHJvdmlk
ZSByZWFsIGludmFsaWQgb3Bjb2RlcyBmb3IgUklTQy1WCmFuZCBBUk0gYXMgaXQgbG9va3MgbGlr
ZSBkZWJ1Z190cmFwX2ZhdGFsKCkgaXNuJ3QgdXNlZCBpbiBBUk0mUklTQy1WCm5vdy4KCkNvdWxk
IHlvdSBwbGVhc2Ugc3VnZ2VzdCB3aGljaCBvbmUgb3B0aW9uIGlzIGJldHRlcj8KCn4gT2xla3Np
aQoKICAKCj4gSmFuCgo=


