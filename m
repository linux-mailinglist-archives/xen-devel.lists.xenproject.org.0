Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2066BE57C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 10:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510963.789570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6J4-00050E-O3; Fri, 17 Mar 2023 09:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510963.789570; Fri, 17 Mar 2023 09:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6J4-0004x7-KC; Fri, 17 Mar 2023 09:23:26 +0000
Received: by outflank-mailman (input) for mailman id 510963;
 Fri, 17 Mar 2023 09:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5qW=7J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pd6J3-0004wz-4D
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 09:23:25 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c10021c-c4a5-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 10:23:21 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id fd5so17796397edb.7
 for <xen-devel@lists.xenproject.org>; Fri, 17 Mar 2023 02:23:21 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 s2-20020a1709060c0200b008e385438c76sm750275ejf.55.2023.03.17.02.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 02:23:20 -0700 (PDT)
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
X-Inumbo-ID: 5c10021c-c4a5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679045001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5pQQe85Dkj3Rgwo5PfG3bGHl2UiEiveVmgjvDrmPnzM=;
        b=lZCSTuj7sOMJJY9RiaWqD1Aw+Yvd1TeMBWArFLdBL7ROV+Kh8KnqlHjdOaw3XUuCtd
         SiNVVMo01X8VH9pH8ZWIP1/xBZHFT6kpw10bpeSamI3DUoqa7MS1KZtvRHwvqMJdt3BI
         ICEAvXeNjDKaJeqYQBjbJO6Xk/XDAAu5RlpelBKAKwwNRO63QlCw3xTSuygXccCCUWVz
         cY3AEiYeqEewbzbfPiA/H+591KzYOB5oiydGUhchIYf/ZJx9DSr5sC+oBwLK0idN74z0
         3niRcOSHF7ISwA29dlu49S24w10/4By8IlO+lcKZ+BSEtWatSiG3ts3sm6qVXi7g7vlk
         xBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pQQe85Dkj3Rgwo5PfG3bGHl2UiEiveVmgjvDrmPnzM=;
        b=0kGsuVmpiea1su0eJB1IPq7QgoS9iRNCTWyJ++25dMmUBK3cw17RNilPLpAe1adBlZ
         2X7ZApbE4GIzk+zLXuPfGvM2RkB1YbftweRfyFRxiRQGnkpREgXcnxwLc7V4QYFthMO5
         aUbjnuprrX7mvunvYU/7asVLqMSMWV7x39YILvWZwEoazyA0aXrO6kCz5WITXQC307pk
         df6UyPCguOuQUcpfB1OP6WXx9rxxzM/tspPCSO8IAG4sJXRMR/n7CtaIOvMU6Wzpb4n6
         7GPFGCUcNAX11XDVDif5uk4YNGJL0tszaTuW/Zzsu6Gavloh9tZHQIN2OPnjMAW0d9SI
         guEg==
X-Gm-Message-State: AO0yUKVVGQjsO0tp+pZhxMfJlV3qzT1/nWubePZenVRFUkZBp8GpYBtI
	l+mulM0sVHIjQ6p9Tcruw4o=
X-Google-Smtp-Source: AK7set+jYn54gDzB5iuGnyJt6qI5MhR42CcCOUqWybweDpfjX3MM1fVf1Ns2Cs10ALQZXv5FBW4fxw==
X-Received: by 2002:a17:906:a245:b0:925:1d1d:6825 with SMTP id bi5-20020a170906a24500b009251d1d6825mr13383482ejb.42.1679045000639;
        Fri, 17 Mar 2023 02:23:20 -0700 (PDT)
Message-ID: <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 17 Mar 2023 11:23:18 +0200
In-Reply-To: <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
	 <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTAzLTE2IGF0IDEyOjI2ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxNS4wMy4yMDIzIDE4OjIxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2NvbW1vbi9idWcuYwo+ID4gQEAgLTAsMCArMSwxMDggQEAKPiA+
ICsjaW5jbHVkZSA8eGVuL2J1Zy5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vZGVidWdnZXIuaD4KPiA+
ICsjaW5jbHVkZSA8eGVuL2Vycm5vLmg+Cj4gPiArI2luY2x1ZGUgPHhlbi9rZXJuZWwuaD4KPiA+
ICsjaW5jbHVkZSA8eGVuL2xpdmVwYXRjaC5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vc3RyaW5nLmg+
Cj4gPiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vdmlydHVhbF9y
ZWdpb24uaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+IAo+IEkgYWN0
dWFsbHkgbWVhbnQgdG8gYWxzbyBhc2s6IFdoYXQgaXMgdGhpcyBuZWVkZWQgZm9yPyBHbGFuY2lu
ZyBvdmVyCj4gdGhlCj4gY29kZSAuLi4KPiAKPiA+ICsvKgo+ID4gKyAqIFJldHVybnMgYSBuZWdh
dGl2ZSB2YWx1ZSBpbiBjYXNlIG9mIGFuIGVycm9yIG90aGVyd2lzZQo+ID4gKyAqIEJVR0ZSQU1F
X3tydW5fZm4sIHdhcm4sIGJ1ZywgYXNzZXJ0fQo+ID4gKyAqLwo+ID4gK2ludCBkb19idWdfZnJh
bWUoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgcGMpCj4gPiArewo+
ID4gK8KgwqDCoCBjb25zdCBzdHJ1Y3QgYnVnX2ZyYW1lICpidWcgPSBOVUxMOwo+ID4gK8KgwqDC
oCBjb25zdCBzdHJ1Y3QgdmlydHVhbF9yZWdpb24gKnJlZ2lvbjsKPiA+ICvCoMKgwqAgY29uc3Qg
Y2hhciAqcHJlZml4ID0gIiIsICpmaWxlbmFtZSwgKnByZWRpY2F0ZTsKPiA+ICvCoMKgwqAgdW5z
aWduZWQgbG9uZyBmaXh1cDsKPiA+ICvCoMKgwqAgdW5zaWduZWQgaW50IGlkLCBsaW5lbm87Cj4g
PiArCj4gPiArwqDCoMKgIHJlZ2lvbiA9IGZpbmRfdGV4dF9yZWdpb24ocGMpOwo+ID4gK8KgwqDC
oCBpZiAoICFyZWdpb24gKQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ID4g
Kwo+ID4gK8KgwqDCoCBmb3IgKCBpZCA9IDA7IGlkIDwgQlVHRlJBTUVfTlI7IGlkKysgKQo+ID4g
K8KgwqDCoCB7Cj4gPiArwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGJ1Z19mcmFtZSAqYjsK
PiA+ICvCoMKgwqDCoMKgwqDCoCBzaXplX3QgaTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBm
b3IgKCBpID0gMCwgYiA9IHJlZ2lvbi0+ZnJhbWVbaWRdLmJ1Z3M7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaSA8IHJlZ2lvbi0+ZnJhbWVbaWRdLm5fYnVnczsgYisrLCBpKysgKQo+
ID4gK8KgwqDCoMKgwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggYnVn
X2xvYyhiKSA9PSBwYyApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZyA9IGI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZm91bmQ7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4g
PiArwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoCB9Cj4gPiArCj4gPiArIGZvdW5kOgo+ID4g
K8KgwqDCoCBpZiAoICFidWcgKQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PRU5UOwo+
ID4gKwo+ID4gK8KgwqDCoCBpZiAoIGlkID09IEJVR0ZSQU1FX3J1bl9mbiApCj4gPiArwqDCoMKg
IHsKPiA+ICvCoMKgwqDCoMKgwqDCoCB2b2lkICgqZm4pKHN0cnVjdCBjcHVfdXNlcl9yZWdzICop
ID0gYnVnX3B0cihidWcpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIGZuKHJlZ3MpOwo+ID4g
Kwo+ID4gK8KgwqDCoMKgwqDCoMKgIC8qIFJlLWVuZm9yY2UgY29uc2lzdGVudCB0eXBlcywgYmVj
YXVzZSBvZiB0aGUgY2FzdHMKPiA+IGludm9sdmVkLiAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgIGlm
ICggZmFsc2UgKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnVuX2luX2V4Y2VwdGlvbl9o
YW5kbGVyKGZuKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gaWQ7Cj4gPiArwqDC
oMKgIH0KPiA+ICsKPiA+ICvCoMKgwqAgLyogV0FSTiwgQlVHIG9yIEFTU0VSVDogZGVjb2RlIHRo
ZSBmaWxlbmFtZSBwb2ludGVyIGFuZCBsaW5lCj4gPiBudW1iZXIuICovCj4gPiArwqDCoMKgIGZp
bGVuYW1lID0gYnVnX3B0cihidWcpOwo+ID4gK8KgwqDCoCBpZiAoICFpc19rZXJuZWwoZmlsZW5h
bWUpICYmICFpc19wYXRjaChmaWxlbmFtZSkgKQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+ID4gK8KgwqDCoCBmaXh1cCA9IHN0cmxlbihmaWxlbmFtZSk7Cj4gPiArwqDCoMKg
IGlmICggZml4dXAgPiA1MCApCj4gPiArwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCBmaWxl
bmFtZSArPSBmaXh1cCAtIDQ3Owo+ID4gK8KgwqDCoMKgwqDCoMKgIHByZWZpeCA9ICIuLi4iOwo+
ID4gK8KgwqDCoCB9Cj4gPiArwqDCoMKgIGxpbmVubyA9IGJ1Z19saW5lKGJ1Zyk7Cj4gPiArCj4g
PiArwqDCoMKgIHN3aXRjaCAoIGlkICkKPiA+ICvCoMKgwqAgewo+ID4gK8KgwqDCoCBjYXNlIEJV
R0ZSQU1FX3dhcm46Cj4gPiArwqDCoMKgwqDCoMKgwqAgcHJpbnRrKCJYZW4gV0FSTiBhdCAlcyVz
OiVkXG4iLCBwcmVmaXgsIGZpbGVuYW1lLCBsaW5lbm8pOwo+ID4gK8KgwqDCoMKgwqDCoMKgIHNo
b3dfZXhlY3V0aW9uX3N0YXRlKHJlZ3MpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+ID4gKwo+ID4gK8KgwqDCoCBjYXNlIEJVR0ZSQU1FX2J1ZzoKPiA+ICvCoMKgwqDCoMKgwqDC
oCBwcmludGsoIlhlbiBCVUcgYXQgJXMlczolZFxuIiwgcHJlZml4LCBmaWxlbmFtZSwgbGluZW5v
KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIEJVR19ERUJVR0dFUl9UUkFQX0ZBVEFM
KHJlZ3MpICkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gKwo+ID4gK8Kg
wqDCoMKgwqDCoMKgIHNob3dfZXhlY3V0aW9uX3N0YXRlKHJlZ3MpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgIHBhbmljKCJYZW4gQlVHIGF0ICVzJXM6JWRcbiIsIHByZWZpeCwgZmlsZW5hbWUsIGxpbmVu
byk7Cj4gPiArCj4gPiArwqDCoMKgIGNhc2UgQlVHRlJBTUVfYXNzZXJ0Ogo+ID4gK8KgwqDCoMKg
wqDCoMKgIC8qIEFTU0VSVDogZGVjb2RlIHRoZSBwcmVkaWNhdGUgc3RyaW5nIHBvaW50ZXIuICov
Cj4gPiArwqDCoMKgwqDCoMKgwqAgcHJlZGljYXRlID0gYnVnX21zZyhidWcpOwo+ID4gK8KgwqDC
oMKgwqDCoMKgIGlmICggIWlzX2tlcm5lbChwcmVkaWNhdGUpICYmICFpc19wYXRjaChwcmVkaWNh
dGUpICkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZWRpY2F0ZSA9ICI8dW5rbm93bj4i
Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIHByaW50aygiQXNzZXJ0aW9uICclcycgZmFpbGVk
IGF0ICVzJXM6JWRcbiIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmVkaWNh
dGUsIHByZWZpeCwgZmlsZW5hbWUsIGxpbmVubyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAg
aWYgKCBCVUdfREVCVUdHRVJfVFJBUF9GQVRBTChyZWdzKSApCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBzaG93X2V4ZWN1dGlvbl9z
dGF0ZShyZWdzKTsKPiA+ICvCoMKgwqDCoMKgwqDCoCBwYW5pYygiQXNzZXJ0aW9uICclcycgZmFp
bGVkIGF0ICVzJXM6JWRcbiIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJlZGlj
YXRlLCBwcmVmaXgsIGZpbGVuYW1lLCBsaW5lbm8pOwo+ID4gK8KgwqDCoCB9Cj4gPiArCj4gPiAr
wqDCoMKgIHJldHVybiBpZDsKPiA+ICt9Cj4gCj4gLi4uIEkgY2FuJ3QgcmVhbGx5IHNwb3Qgd2hh
dCBpdCBtaWdodCBiZSB0aGF0IGNvbWVzIGZyb20gdGhhdCBoZWFkZXIuCj4gT2gsIG9uIHRoZSBO
KzFzdCBydW4gSSd2ZSBzcG90dGVkIGl0IC0gaXQncyBzaG93X2V4ZWN1dGlvbl9zdGF0ZSgpLgo+
IFRoZSBkZWNsYXJhdGlvbiBvZiB3aGljaCwgYWxyZWFkeSBiZWluZyB1c2VkIGZyb20gY29tbW9u
IGNvZGUgYWhlYWQKPiBvZiB0aGlzIHNlcmllcywgc2hvdWxkIGltbyBiZSBtb3ZlZCB0byBhIGNv
bW1vbiBoZWFkZXIuIEkgZ3Vlc3MgSSdsbAo+IG1ha2UgeWV0IGFub3RoZXIgcGF0Y2ggLi4uCkFz
IG1lbnRpb25lZCBhYm92ZS4gTm90IG9ubHkgc2hvd19leGVjdXRpb25fc3RhdGUoKSBidXQgYWxz
bwpjcHVfdXNlcl9yZWdzIHN0cnVjdHVyZS4gKCBhdCBsZXN0LCBmb3IgQVJNICYgUklTQ1YgKQoK
fiBPbGVrc2lpCg==


