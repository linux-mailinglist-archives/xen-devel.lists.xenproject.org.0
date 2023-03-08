Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB006B1066
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 18:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508127.782462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZxtd-0006wH-7q; Wed, 08 Mar 2023 17:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508127.782462; Wed, 08 Mar 2023 17:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZxtd-0006t6-4E; Wed, 08 Mar 2023 17:48:13 +0000
Received: by outflank-mailman (input) for mailman id 508127;
 Wed, 08 Mar 2023 17:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Glg8=7A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZxtc-0006sy-0w
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 17:48:12 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646b55bb-bdd9-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 18:48:11 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so1887490wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 09:48:11 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 q20-20020a1cf314000000b003db06224953sm65014wmq.41.2023.03.08.09.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 09:48:10 -0800 (PST)
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
X-Inumbo-ID: 646b55bb-bdd9-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678297690;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uEDnfJFtND58FaMjhatv8NcXVtY3kozL4EmvBYGpkIA=;
        b=Xvw1sJQ258vghNH92L46F6vXZzy1FAeqfOAcwsVroBVgEinW7tHJAsPzJPi8/EKdQI
         QspSCjLoxUNK8HsYis8XMqaZoO+dsqmp45qE+xvyGljfQwwNfUlMNVGfACPX1kPkWvQl
         njwFVmatQzOi8Eg6jOKQPfMMKuin5omTfXYwcD7yZqVfBSU1FLqYIg5t2MnGs4pfLyDE
         z7MbYyiNsoNts6ckAiZwOv+fN+BAe+lsJHW2Xc0+TQflPlYS2dHq3PSzrwGQSRjHd5Rq
         F+FQLLT39EmdEjmm+aCDz2Rvo22SEu9pMwzPu9P5IyBzhxNTC0OOxew9QxwZjG5wAGZV
         LBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678297690;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEDnfJFtND58FaMjhatv8NcXVtY3kozL4EmvBYGpkIA=;
        b=G2KvA3z1wCDjjGUKrbCAMM905H5EselsOGuR0oHpLEz8YZE8JZb8Sxir6j0imZ4UFb
         vlCxt1zPI/bh21ICfyPZwWfBAc0EFe55ypY9qbiXGq+VEs8HLFQ0iMJy/hr3PuopdYa8
         Vrx5w0ZncIlLUi05NR6kghgRVt79nXZV5R+lAdruRWZZqt0DOM8Ryv+eebM1Bz62Pcmm
         1tnt717JeSyyHc3FleE4jvP7fEl29MB1cstYb+UPTVH12U65GFpfZWYCBrYJePUeDlcT
         tKEjCDOtmWZiHRDdQTh/Uhar+Z+bRI3iJSGFP2TDFOBjtizuXRyjdyAvegmFx5EEdtGK
         3ilA==
X-Gm-Message-State: AO0yUKUwx3BPdo3SSOz5kNiIOerC1V9wcYIi+fS7fY1zQY2t+PgHgwxo
	E6XMLKMlPLijwjFKk8FcKh4=
X-Google-Smtp-Source: AK7set/mVrGxWjOZaqKuyfFvuiS3/elV6Ztj5apHlEypx4hpuAq7W/eNzmXxXH8sOs61oevWUL6Gzw==
X-Received: by 2002:a05:600c:3111:b0:3eb:399d:ab24 with SMTP id g17-20020a05600c311100b003eb399dab24mr15723063wmo.28.1678297690384;
        Wed, 08 Mar 2023 09:48:10 -0800 (PST)
Message-ID: <21bb8cfd68b9b48ab180b852d9b730300d3ad283.camel@gmail.com>
Subject: Re: [PATCH v6 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Wed, 08 Mar 2023 19:48:08 +0200
In-Reply-To: <aa8cf64e-e5b1-6c13-7b30-e409a0460e3c@suse.com>
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
	 <abf50a37913608c3403c6e7e56c9fdba6f3ef643.1678202233.git.oleksii.kurochko@gmail.com>
	 <aa8cf64e-e5b1-6c13-7b30-e409a0460e3c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

T24gV2VkLCAyMDIzLTAzLTA4IGF0IDE2OjMzICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwNy4wMy4yMDIzIDE2OjUwLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gQEAgLTExNjYs
MTIgKzExNjcsOSBAQCB2b2lkIGNwdWlkX2h5cGVydmlzb3JfbGVhdmVzKGNvbnN0IHN0cnVjdAo+
ID4gdmNwdSAqdiwgdWludDMyX3QgbGVhZiwKPiA+IMKgCj4gPiDCoHZvaWQgZG9faW52YWxpZF9v
cChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiA+IMKgewo+ID4gLcKgwqDCoCBjb25zdCBz
dHJ1Y3QgYnVnX2ZyYW1lICpidWcgPSBOVUxMOwo+ID4gwqDCoMKgwqAgdTggYnVnX2luc25bMl07
Cj4gPiAtwqDCoMKgIGNvbnN0IGNoYXIgKnByZWZpeCA9ICIiLCAqZmlsZW5hbWUsICpwcmVkaWNh
dGUsICplaXAgPSAoY2hhcgo+ID4gKilyZWdzLT5yaXA7Cj4gPiAtwqDCoMKgIHVuc2lnbmVkIGxv
bmcgZml4dXA7Cj4gPiAtwqDCoMKgIGludCBpZCA9IC0xLCBsaW5lbm87Cj4gPiAtwqDCoMKgIGNv
bnN0IHN0cnVjdCB2aXJ0dWFsX3JlZ2lvbiAqcmVnaW9uOwo+ID4gK8KgwqDCoCB2b2lkICplaXAg
PSAodm9pZCAqKXJlZ3MtPnJpcDsKPiAKPiBBcyBzYWlkIGVsc2V3aGVyZSBhbHJlYWR5OiAiY29u
c3QiIHBsZWFzZSB3aGVuZXZlciBwb3NzaWJsZS4gVGhlIG1vcmUKPiB0aGF0Cj4gdGhlIHZhcmlh
YmxlIHdhcyBwb2ludGVyLXRvLWNvbnN0IGJlZm9yZS4KU3VyZSwgSSB3aWxsIGNoYW5nZSBpdCB0
aGFuIHRvOgogY29uc3Qgdm9pZCAqZWlwID0gKGNvbnN0IHZvaWQgKilyZWdzLT5yaXA7Cj4gCj4g
PiBAQCAtMTE4NSw4MyArMTE4MywyMCBAQCB2b2lkIGRvX2ludmFsaWRfb3Aoc3RydWN0IGNwdV91
c2VyX3JlZ3MKPiA+ICpyZWdzKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNtcChidWdfaW5z
biwgIlx4Zlx4YiIsIHNpemVvZihidWdfaW5zbikpICkKPiA+IMKgwqDCoMKgwqDCoMKgwqAgZ290
byBkaWU7Cj4gPiDCoAo+ID4gLcKgwqDCoCByZWdpb24gPSBmaW5kX3RleHRfcmVnaW9uKHJlZ3Mt
PnJpcCk7Cj4gPiAtwqDCoMKgIGlmICggcmVnaW9uICkKPiA+IC3CoMKgwqAgewo+ID4gLcKgwqDC
oMKgwqDCoMKgIGZvciAoIGlkID0gMDsgaWQgPCBCVUdGUkFNRV9OUjsgaWQrKyApCj4gPiAtwqDC
oMKgwqDCoMKgwqAgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGJ1
Z19mcmFtZSAqYjsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBpOwo+
ID4gLQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yICggaSA9IDAsIGIgPSByZWdpb24t
PmZyYW1lW2lkXS5idWdzOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aSA8IHJlZ2lvbi0+ZnJhbWVbaWRdLm5fYnVnczsgYisrLCBpKysgKQo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGJ1
Z19sb2MoYikgPT0gZWlwICkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgewo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZyA9IGI7Cj4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmb3VuZDsKPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+ID4gLcKgwqDCoMKgwqDCoMKgIH0KPiA+IC3CoMKgwqAgfQo+ID4gLQo+ID4gLSBmb3Vu
ZDoKPiA+IC3CoMKgwqAgaWYgKCAhYnVnICkKPiA+ICvCoMKgwqAgaWQgPSBkb19idWdfZnJhbWUo
cmVncywgcmVncy0+cmlwKTsKPiA+ICvCoMKgwqAgaWYgKCBpZCA8IDAgKQo+ID4gwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGRpZTsKPiA+IC3CoMKgwqAgZWlwICs9IHNpemVvZihidWdfaW5zbik7Cj4g
PiAtwqDCoMKgIGlmICggaWQgPT0gQlVHRlJBTUVfcnVuX2ZuICkKPiA+IC3CoMKgwqAgewo+ID4g
LcKgwqDCoMKgwqDCoMKgIHZvaWQgKCpmbikoc3RydWN0IGNwdV91c2VyX3JlZ3MgKikgPSBidWdf
cHRyKGJ1Zyk7Cj4gPiAtCj4gPiAtwqDCoMKgwqDCoMKgwqAgZm4ocmVncyk7Cj4gPiAtwqDCoMKg
wqDCoMKgwqAgZml4dXBfZXhjZXB0aW9uX3JldHVybihyZWdzLCAodW5zaWduZWQgbG9uZyllaXAp
Owo+ID4gLcKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiA+IC3CoMKgwqAgfQo+ID4gwqAKPiA+IC3C
oMKgwqAgLyogV0FSTiwgQlVHIG9yIEFTU0VSVDogZGVjb2RlIHRoZSBmaWxlbmFtZSBwb2ludGVy
IGFuZCBsaW5lCj4gPiBudW1iZXIuICovCj4gPiAtwqDCoMKgIGZpbGVuYW1lID0gYnVnX3B0cihi
dWcpOwo+ID4gLcKgwqDCoCBpZiAoICFpc19rZXJuZWwoZmlsZW5hbWUpICYmICFpc19wYXRjaChm
aWxlbmFtZSkgKQo+ID4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gZGllOwo+ID4gLcKgwqDCoCBmaXh1
cCA9IHN0cmxlbihmaWxlbmFtZSk7Cj4gPiAtwqDCoMKgIGlmICggZml4dXAgPiA1MCApCj4gPiAt
wqDCoMKgIHsKPiA+IC3CoMKgwqDCoMKgwqDCoCBmaWxlbmFtZSArPSBmaXh1cCAtIDQ3Owo+ID4g
LcKgwqDCoMKgwqDCoMKgIHByZWZpeCA9ICIuLi4iOwo+ID4gLcKgwqDCoCB9Cj4gPiAtwqDCoMKg
IGxpbmVubyA9IGJ1Z19saW5lKGJ1Zyk7Cj4gPiArwqDCoMKgIGVpcCA9ICh1bnNpZ25lZCBjaGFy
ICopZWlwICsgc2l6ZW9mKGJ1Z19pbnNuKTsKPiAKPiBXaHkgZG9uJ3QgeW91IGtlZXAgdGhlIG9y
aWdpbmFsCj4gCj4gwqDCoMKgIGVpcCArPSBzaXplb2YoYnVnX2luc24pOwo+IAo+ID8gQXMgYWxz
byBzYWlkIGJlZm9yZSB3ZSB1c2UgdGhlIEdOVSBleHRlbnNpb24gb2YgYXJpdGhtZXRpYyBvbgo+
IHBvaW50ZXJzCj4gdG8gdm9pZCBwcmV0dHkgZXh0ZW5zaXZlbHkgZWxzZXdoZXJlOyB0aGVyZSdz
IG5vIHJlYXNvbiBhdCBhbGwgdG8KPiBpbnRyb2R1Y2UgYW4gdW5uZWNlc3NhcnkgYW5kIHF1ZXN0
aW9uYWJsZSBjYXN0IGhlcmUuCkp1c3QgbWlzc2VkIHRoYXQgZHVyaW5nIHJlYmFzZS4gKCBJIGV4
cGVyaW1lbnRlZCB3aXRoIHRoZSBicmFuY2ggYW5kCnJlY2VpdmVkIGNvbmZsaWN0cyB0aGF0IHdl
cmUgcmVzb2x2ZWQgaW5jb3JyZWN0bHkgKQoKSSB3aWxsIHVwZGF0ZSB0aGF0LiBUaGFua3MKCj4g
Cj4gV2l0aCB0aGVzZSBhZGp1c3RtZW50cyBhbmQgd2l0aCB0aGUgcmUtYmFzaW5nIG92ZXIgdGhl
IGNoYW5nZXMKPiByZXF1ZXN0ZWQKPiB0byBwYXRjaCAyCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBKYW4KCn4gT2xla3NpaQoK


