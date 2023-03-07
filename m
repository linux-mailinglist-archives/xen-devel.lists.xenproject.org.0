Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842C6ADD83
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507320.780672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVab-0004ul-5g; Tue, 07 Mar 2023 11:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507320.780672; Tue, 07 Mar 2023 11:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVab-0004rm-2R; Tue, 07 Mar 2023 11:34:41 +0000
Received: by outflank-mailman (input) for mailman id 507320;
 Tue, 07 Mar 2023 11:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZVaZ-0004jv-Ei
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 11:34:39 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b523302-bcdc-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 12:34:38 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id h11so11780100wrm.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 03:34:38 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b002c54fb024b2sm12204662wrj.61.2023.03.07.03.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:34:38 -0800 (PST)
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
X-Inumbo-ID: 0b523302-bcdc-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678188878;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yGZgPJWnH/SnqpV+oOPAmp/KHXkA8IXtpvjGprFRQCk=;
        b=gEdQMkN7L2pdZlkVOmuQz31H0EIoBPOnEPEI1+8h53htCqY2wXBEt8glJwFdDouJAt
         /0qBSff9dZATeHXj18uYFgZzM1MPUU8TKzkyIIPCFmGT+qpkDtrCwzivBA6KIoZFF+On
         PzQWf3ggTfX6uH88nCKEvh0fTRBShY/BvxBxC2J3Ew/sxlE3vERBWheRU6ViMLskhEKe
         EAGD1guw2O6KH7kNdVhoA0ZfV4QS2I8hN2h+7dvvKjnWo9f9GBAjE7oHcmXz0D81xfIr
         O1UwDS1BZPo3FNpLmJVSOF9M5OMz/g39qTcNbLzAnF6mbgo1Mk6BP/t83cy/yy/g5azG
         oI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678188878;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGZgPJWnH/SnqpV+oOPAmp/KHXkA8IXtpvjGprFRQCk=;
        b=thMTVgAmXkell1rWMReL0BVTJ/zHm5HT/4e3SxjuTlf/iO7WMK9kDfgX0BS/ECPIyU
         ybwy7wq75SvQTjqctHa+c7IjBpAH5JguutQ8cKdbr5yD9Jf41xukKycA792UpzSzT+4v
         L+PgKy449fzyZrOkWt4Ipozd9yqAYbnbF0YSXuNWl2I5c3tOeCmFBy5cFthXMZImTu5v
         TB0YxPCEK4Zp3slHHuF8O+Bf21cx3HMrRX8fZ6VI3LH7ZyuvEfAutfpiMQVNN2CoowLb
         NWS4WWrYvduif05l5Z8hJjbwhPRLSwNuVR7S2zFRjanPjpM00i3CljZ0on/edQ9TdkLh
         X3ZQ==
X-Gm-Message-State: AO0yUKXU+7AOthwkW+4B153NkDT7JtATZH0g77E0W8IMsXF0HBxrt8co
	rvXzPTG4SFjNT58tQhVe3fw=
X-Google-Smtp-Source: AK7set/nSTA2iK73p2ozbMhoyvy6ABym1rap3cBPngJIXrOIviS35kJLiKmzgVpZMyUlGg/4jSEnUQ==
X-Received: by 2002:adf:f48f:0:b0:2c7:e05:2d1b with SMTP id l15-20020adff48f000000b002c70e052d1bmr8546148wro.50.1678188878353;
        Tue, 07 Mar 2023 03:34:38 -0800 (PST)
Message-ID: <517032abd06c800be192021e51ec62dc3749dc6f.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 07 Mar 2023 13:34:36 +0200
In-Reply-To: <7c5bcb62-e8fd-1073-155e-da4f05772ad7@suse.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
	 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
	 <7c5bcb62-e8fd-1073-155e-da4f05772ad7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTAzLTA2IGF0IDExOjQxICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwMy4wMy4yMDIzIDExOjM4LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gK2ludCBkb19i
dWdfZnJhbWUoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgcGMpCj4g
PiArewo+ID4gK8KgwqDCoCBjb25zdCBzdHJ1Y3QgYnVnX2ZyYW1lICpidWcgPSBOVUxMOwo+ID4g
K8KgwqDCoCBjb25zdCBzdHJ1Y3QgdmlydHVhbF9yZWdpb24gKnJlZ2lvbjsKPiA+ICvCoMKgwqAg
Y29uc3QgY2hhciAqcHJlZml4ID0gIiIsICpmaWxlbmFtZSwgKnByZWRpY2F0ZTsKPiA+ICvCoMKg
wqAgdW5zaWduZWQgbG9uZyBmaXh1cDsKPiA+ICvCoMKgwqAgdW5zaWduZWQgaW50IGlkID0gQlVH
RlJBTUVfTlIsIGxpbmVubzsKPiA+ICsKPiA+ICvCoMKgwqAgcmVnaW9uID0gZmluZF90ZXh0X3Jl
Z2lvbihwYyk7Cj4gPiArwqDCoMKgIGlmICggIXJlZ2lvbiApCj4gPiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiArwqDCoMKgIGZvciAoIGlkID0gMDsgaWQgPCBCVUdG
UkFNRV9OUjsgaWQrKyApCj4gPiArwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCBz
dHJ1Y3QgYnVnX2ZyYW1lICpiOwo+ID4gK8KgwqDCoMKgwqDCoMKgIHNpemVfdCBpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgIGZvciAoIGkgPSAwLCBiID0gcmVnaW9uLT5mcmFtZVtpZF0uYnVn
czsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSA8IHJlZ2lvbi0+ZnJhbWVb
aWRdLm5fYnVnczsgYisrLCBpKysgKQo+ID4gK8KgwqDCoMKgwqDCoMKgIHsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICggYnVnX2xvYyhiKSA9PSBwYyApCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZyA9IGI7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZm91bmQ7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiArwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoCB9
Cj4gPiArCj4gPiArIGZvdW5kOgo+ID4gK8KgwqDCoCBpZiAoICFidWcgKQo+ID4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gK8KgwqDCoCBpZiAoIGlkID09IEJVR0ZS
QU1FX3J1bl9mbiApCj4gPiArwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCB2b2lkICgqZm4p
KGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICopID0gYnVnX3B0cihidWcpOwo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoMKgIGZuKHJlZ3MpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBpZDsKPiA+ICvCoMKgwqAgfQo+ID4gKwo+ID4gK8KgwqDCoCAvKiBXQVJOLCBCVUcgb3IgQVNT
RVJUOiBkZWNvZGUgdGhlIGZpbGVuYW1lIHBvaW50ZXIgYW5kIGxpbmUKPiA+IG51bWJlci4gKi8K
PiA+ICvCoMKgwqAgZmlsZW5hbWUgPSBidWdfcHRyKGJ1Zyk7Cj4gPiArwqDCoMKgIGlmICggIWlz
X2tlcm5lbChmaWxlbmFtZSkgJiYgIWlzX3BhdGNoKGZpbGVuYW1lKSApCj4gPiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArwqDCoMKgIGZpeHVwID0gc3RybGVuKGZpbGVuYW1l
KTsKPiA+ICvCoMKgwqAgaWYgKCBmaXh1cCA+IDUwICkKPiA+ICvCoMKgwqAgewo+ID4gK8KgwqDC
oMKgwqDCoMKgIGZpbGVuYW1lICs9IGZpeHVwIC0gNDc7Cj4gPiArwqDCoMKgwqDCoMKgwqAgcHJl
Zml4ID0gIi4uLiI7Cj4gPiArwqDCoMKgIH0KPiA+ICvCoMKgwqAgbGluZW5vID0gYnVnX2xpbmUo
YnVnKTsKPiA+ICsKPiA+ICvCoMKgwqAgc3dpdGNoICggaWQgKQo+ID4gK8KgwqDCoCB7Cj4gPiAr
wqDCoMKgIGNhc2UgQlVHRlJBTUVfd2FybjoKPiA+ICvCoMKgwqDCoMKgwqDCoCBwcmludGsoIlhl
biBXQVJOIGF0ICVzJXM6JWRcbiIsIHByZWZpeCwgZmlsZW5hbWUsIGxpbmVubyk7Cj4gPiArwqDC
oMKgwqDCoMKgwqAgc2hvd19leGVjdXRpb25fc3RhdGUocmVncyk7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIGlkOwo+ID4gKwo+ID4gK8KgwqDCoCBjYXNlIEJVR0ZSQU1FX2J1ZzoK
PiA+ICvCoMKgwqDCoMKgwqDCoCBwcmludGsoIlhlbiBCVUcgYXQgJXMlczolZFxuIiwgcHJlZml4
LCBmaWxlbmFtZSwgbGluZW5vKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIEJVR19E
RUJVR0dFUl9UUkFQX0ZBVEFMKHJlZ3MpICkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBpZDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBzaG93X2V4ZWN1dGlvbl9zdGF0ZShy
ZWdzKTsKPiA+ICvCoMKgwqDCoMKgwqDCoCBwYW5pYygiWGVuIEJVRyBhdCAlcyVzOiVkXG4iLCBw
cmVmaXgsIGZpbGVuYW1lLCBsaW5lbm8pOwo+ID4gKwo+ID4gK8KgwqDCoCBjYXNlIEJVR0ZSQU1F
X2Fzc2VydDoKPiA+ICvCoMKgwqDCoMKgwqDCoCAvKiBBU1NFUlQ6IGRlY29kZSB0aGUgcHJlZGlj
YXRlIHN0cmluZyBwb2ludGVyLiAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgIHByZWRpY2F0ZSA9IGJ1
Z19tc2coYnVnKTsKPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiAoICFpc19rZXJuZWwocHJlZGljYXRl
KSAmJiAhaXNfcGF0Y2gocHJlZGljYXRlKSApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
cmVkaWNhdGUgPSAiPHVua25vd24+IjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBwcmludGso
IkFzc2VydGlvbiAnJXMnIGZhaWxlZCBhdCAlcyVzOiVkXG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJlZGljYXRlLCBwcmVmaXgsIGZpbGVuYW1lLCBsaW5lbm8pOwo+ID4g
Kwo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmICggQlVHX0RFQlVHR0VSX1RSQVBfRkFUQUwocmVncykg
KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGlkOwo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgIHNob3dfZXhlY3V0aW9uX3N0YXRlKHJlZ3MpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
IHBhbmljKCJBc3NlcnRpb24gJyVzJyBmYWlsZWQgYXQgJXMlczolZFxuIiwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwcmVkaWNhdGUsIHByZWZpeCwgZmlsZW5hbWUsIGxpbmVubyk7
Cj4gPiArwqDCoMKgIH0KPiA+ICsKPiA+ICvCoMKgwqAgcmV0dXJuIGlkOwo+ID4gK30KPiAKPiBU
aGlzIGZpbmFsICJyZXR1cm4iIGxvb2tzIGxpa2UgYWxtb3N0IGRlYWQgY29kZSAoaXQgaXNuJ3Qg
d2hlbiBhbgo+IHVucmVjb2duaXplZCBpZCBpcyBmb3VuZCkuIE1heSBJIHN1Z2dlc3QgdG8gc3dp
dGNoIGFsbCAicmV0dXJuIGlkIgo+IGluc2lkZSB0aGUgc3dpdGNoKCkgYmxvY2sgdG8ganVzdCAi
YnJlYWsiLCB0byBtYWtlIHRoaXMgZmluYWwKPiAicmV0dXJuIiBiZSAoYSkgdGhlIGNlbnRyYWwg
b25lIGFuZCAoYikgbW9yZSBvYnZpb3VzbHkgYSB1c2VkIHBhdGg/Cj4gClN1cmUgSXQgd2lsbCBi
ZSBtdWNoIGJldHRlci4KCn4gT2xla3NpaQoK


