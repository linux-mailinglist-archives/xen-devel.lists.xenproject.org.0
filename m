Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39626A1856
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 13:23:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3IT3-0001gq-Ku; Thu, 29 Aug 2019 11:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jJ98=WZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i3IT2-0001gl-Be
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 11:19:52 +0000
X-Inumbo-ID: eae0a9f4-ca4e-11e9-8980-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eae0a9f4-ca4e-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 11:19:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f9so2583862ljc.13
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 04:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oQXTWmb3uBjgRzTbr8qUWea8qLxxYRCuZn7g48iIESM=;
 b=fXouWAlFpsdjhM+OmOAv3CA1qdCHLoZpAGDprYMqkcKJW/QZNnmdcwHQPXmDONPljH
 8xCz4gXWTKm3yiNW0aTtTEFrxJhlku/eobS86gWp1ShzAZGxJV2FBeBofZAO4MGr5yZj
 2vV9SPbbpYDJ9DfCtPpmjHpCL3OWOiIipkD0LKQKF90Ue1v4/6kXBQ7Q6Xro0qtzxeLM
 gJ1jTCo7abh4oxU2M9xeugYSKhdtM1ydS1h4n50+78Ln+W/1i/jCSJOssmNCUC0Qw/5s
 qHbRJDO8cbScDketLGdNabQbIAtwJb0WPsRItupDsyFlie4xHTIA15fZ2bvUcgJ6UCfZ
 uojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oQXTWmb3uBjgRzTbr8qUWea8qLxxYRCuZn7g48iIESM=;
 b=hE4gljIniPMouFagHW+Qk2SbLwrYNiI4uOx1VpUrcjhQZrklm32qpidqEwslz6UacA
 Vit/UN+dQHcZN12gRMsk2A/8P9CL91VxRpzVrRJSBlNid5rrThIj9SiM+Ekzr+eXbk69
 Lt0vAY940UhC03L5ot8uH1vw/+XWvuYkivN5s1YyrNEwNMVEwses/YPqwY/re+S2khTJ
 XdLyaSIjSbDjZUKZmXoo5OIvq2Y1gF88vueN5OeKM+B8ykW8rslexCE+JOyVsK3PUmrZ
 bgmaR6qfToX5ndmnxyXKY4Lo7ns50ALiJnvteOxT3Q9DI56j2kOoO2Y/pkoxqBvsLz9u
 fnDQ==
X-Gm-Message-State: APjAAAXo+lmB3Ap1VIiTW6t+X13G/aloHTKAabMIV1Yz3eQXJQu7bwa+
 wgyisbHrSriKmreSHIRoFIE=
X-Google-Smtp-Source: APXvYqwURUwy656REBoot+dfYti8UE3relL/qvZE4LQV0TxonEfL1gb+6p0PTXqVukMwMQBdRc3Kaw==
X-Received: by 2002:a05:651c:1b8:: with SMTP id c24mr485854ljn.2.1567077590338; 
 Thu, 29 Aug 2019 04:19:50 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id h3sm311718ljj.42.2019.08.29.04.19.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 04:19:49 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
Message-ID: <07919647-3696-cfc4-6c09-8aa30b008fa1@gmail.com>
Date: Thu, 29 Aug 2019 14:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksIGFsbAoKCj4gKwo+ICtzdGF0aWMgX19pbml0IGludCBpcG1tdV9pbml0KHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqbm9kZSwgY29uc3Qgdm9pZCAqZGF0YSkKPiArewo+ICsgICAgaW50IHJldDsK
PiArCj4gKyAgICAvKgo+ICsgICAgICogRXZlbiBpZiB0aGUgZGV2aWNlIGNhbid0IGJlIGluaXRp
YWxpemVkLCB3ZSBkb24ndCB3YW50IHRvIGdpdmUKPiArICAgICAqIHRoZSBJUE1NVSBkZXZpY2Ug
dG8gZG9tMC4KPiArICAgICAqLwo+ICsgICAgZHRfZGV2aWNlX3NldF91c2VkX2J5KG5vZGUsIERP
TUlEX1hFTik7Cj4gKwo+ICsgICAgaWYgKCAhaW9tbXVfaGFwX3B0X3NoYXJlICkKPiArICAgIHsK
PiArICAgICAgICBwcmludGtfb25jZShYRU5MT0dfRVJSICJpcG1tdTogUDJNIHRhYmxlIG11c3Qg
YWx3YXlzIGJlIHNoYXJlZCBiZXR3ZWVuIHRoZSBDUFUgYW5kIHRoZSBJUE1NVVxuIik7Cj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCAhaXBtbXVfc3Rh
Z2UyX3N1cHBvcnRlZCgpICkKPiArICAgIHsKPiArICAgICAgICBwcmludGtfb25jZShYRU5MT0df
RVJSICJpcG1tdTogUDJNIHNoYXJpbmcgaXMgbm90IHN1cHBvcnRlZCBpbiBjdXJyZW50IFNvQyBy
ZXZpc2lvblxuIik7Cj4gKyAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKyAgICB9Cj4gKyAgICBl
bHNlCj4gKyAgICB7Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBBcyA0LWxldmVsIHRyYW5z
bGF0aW9uIHRhYmxlIGlzIG5vdCBzdXBwb3J0ZWQgaW4gSVBNTVUsIHdlIG5lZWQKPiArICAgICAg
ICAgKiB0byBjaGVjayBJUEEgc2l6ZSB1c2VkIGZvciBQMk0gdGFibGUgYmVmb3JlaGFuZCB0byBi
ZSBzdXJlIGl0IGlzCj4gKyAgICAgICAgICogMy1sZXZlbCBhbmQgdGhlIElQTU1VIHdpbGwgYmUg
YWJsZSB0byB1c2UgaXQuCj4gKyAgICAgICAgICoKPiArICAgICAgICAgKiBUT0RPOiBGaXJzdCBp
bml0aWFsaXplIHRoZSBJT01NVSBhbmQgZ2F0aGVyIHRoZSByZXF1aXJlbWVudHMgYW5kCj4gKyAg
ICAgICAgICogdGhlbiBpbml0aWFsaXplIHRoZSBQMk0uIEluIHRoZSBQMk0gY29kZSwgdGFrZSBp
bnRvIHRoZSBhY2NvdW50Cj4gKyAgICAgICAgICogdGhlIElPTU1VIHJlcXVpcmVtZW50cyBhbmQg
cmVzdHJpY3QgInBhX3JhbmdlIiBpZiBuZWNlc3NhcnkuCj4gKyAgICAgICAgICovCj4gKyAgICAg
ICAgaWYgKCBJUE1NVV9NQVhfUDJNX0lQQV9CSVRTIDwgcDJtX2lwYV9iaXRzICkKPiArICAgICAg
ICB7Cj4gKyAgICAgICAgICAgIHByaW50a19vbmNlKFhFTkxPR19FUlIgImlwbW11OiBQMk0gSVBB
IHNpemUgaXMgbm90IHN1cHBvcnRlZCAoUDJNPSV1IElQTU1VPSV1KSFcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIHAybV9pcGFfYml0cywgSVBNTVVfTUFYX1AyTV9JUEFfQklUUyk7Cj4g
KyAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsgICAgICAgIH0KCgpUaGVyZSBpcyBhIHBh
dGNoIGluIE1MIHdoaWNoIGlzIGludGVuZGVkIHRvIGFkZHJlc3MgdGhpcyBUT0RPOgoKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21z
ZzAyMjM3Lmh0bWwKCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
