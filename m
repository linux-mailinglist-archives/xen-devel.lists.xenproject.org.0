Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E24165F0D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:45:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4m6t-0007TD-9h; Thu, 20 Feb 2020 13:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4m6r-0007Sg-Oy
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:43:21 +0000
X-Inumbo-ID: f51218f1-53e6-11ea-852d-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f51218f1-53e6-11ea-852d-12813bfff9fa;
 Thu, 20 Feb 2020 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582206201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjau6JGSO0QGhqCAN+BhmqgUJTWy1BfBWHq4HdLQIkY=;
 b=VVJgvneSg4Nxpox4rq/R2XutdXfeDBXQmFfNDaCnPtlhthtkfm6QFTWcHMmlkIcddq7vaO
 piW9MdTaM3oy3W0+OcHQUza5XdAznLCCfvV5ASxJ6eVQ/pc+l+BHQXW8cdNiO0CqYythkF
 84ECtwifRQcwWUo010+djRG9t1iQpM0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-EeuwIh7pNy6Oz5fsnY2hKA-1; Thu, 20 Feb 2020 08:43:16 -0500
Received: by mail-ed1-f70.google.com with SMTP id g11so2716739edu.10
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qD/X+uvdAqiN2J4VmO38lFHYqqOLuyZd9jk531i2vDc=;
 b=Ga7Us0N5nNJsgsOQEC6dK7jTKHsBBOQ0t7FesrEgnQY/+rK2eahBNoC20KwOMB7H4J
 oy7sIBruZ3CUlUAmbFXUSFtbiD4hEaVZZDYEDwhSgDeKE2wGj9OA2ZhoW3ElAhpGc1GV
 prYX4NEhrb/bRpa1LfdOc5ygepY608q2R9ol4yVyU5O97t9ubCCMrnkysGRdiyr536kk
 3bq1T4FK1ssfCID+XKTQtIZn3S8M8mTPtFg8zIet2lyegf2hKaioehgUqctBlkypnNHJ
 Z2EeqcxauCIS6PZmDrmDEcDyMaBeqC9FuKmd/cyV5K83/VD3kJMw/qRWS4xU28dznHpY
 ZKFw==
X-Gm-Message-State: APjAAAXF9kWP2HPUnSb4Ol4NBr50jSa/1g9+SeXJzXwGyyWs9gkQAfat
 6+brm760IAZ60mK1rshZ/xW2bfuGxVDci1PA3z5x+5SOaX9m8NDBX3OHsk5hwqfgVlP9NeXaAf/
 M3dfi907qad3ul+AcKSHm0SGukrI=
X-Received: by 2002:a17:906:af66:: with SMTP id
 os6mr30252258ejb.87.1582206195524; 
 Thu, 20 Feb 2020 05:43:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqy55S2TatA0f5hb66822wtWUhbSwpaXzdFOBOyYbycw17FXpGy5g+OlIEm49yhVSCxJsxpX7A==
X-Received: by 2002:a17:906:af66:: with SMTP id
 os6mr30252228ejb.87.1582206195221; 
 Thu, 20 Feb 2020 05:43:15 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id ks2sm125224ejb.82.2020.02.20.05.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 05:43:14 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-3-philmd@redhat.com>
 <68120807-6f6b-1602-8208-fd76d64e74bc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <be623afd-0605-0bdf-daae-f38ba5562012@redhat.com>
Date: Thu, 20 Feb 2020 14:43:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <68120807-6f6b-1602-8208-fd76d64e74bc@redhat.com>
Content-Language: en-US
X-MC-Unique: EeuwIh7pNy6Oz5fsnY2hKA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v3 02/20] hw: Remove unnecessary cast when
 calling dma_memory_read()
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8yMC8yMCAyOjE2IFBNLCBFcmljIEJsYWtlIHdyb3RlOgo+IE9uIDIvMjAvMjAgNzowNSBB
TSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+IFNpbmNlIGl0cyBpbnRyb2R1Y3Rp
b24gaW4gY29tbWl0IGQ4NmE3N2Y4YWJiLCBkbWFfbWVtb3J5X3JlYWQoKQo+PiBhbHdheXMgYWNj
ZXB0ZWQgdm9pZCBwb2ludGVyIGFyZ3VtZW50LiBSZW1vdmUgdGhlIHVubmVjZXNzYXJ5Cj4+IGNh
c3RzLgo+Pgo+PiBUaGlzIGNvbW1pdCB3YXMgcHJvZHVjZWQgd2l0aCB0aGUgaW5jbHVkZWQgQ29j
Y2luZWxsZSBzY3JpcHQKPj4gc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNv
bT4KPj4gLS0tCj4+IMKgIHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIHwg
MTUgKysrKysrKysrKysrKysrCj4+IMKgIGh3L2FybS9zbW11LWNvbW1vbi5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICstLQo+PiDCoCBody9hcm0vc21tdXYzLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAgKysrKy0t
LS0tLQo+PiDCoCBody9zZC9zZGhjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxNSArKysrKy0tLS0tLS0tLS0KPj4gwqAgNCBmaWxlcyBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpCj4+Cj4+IGRpZmYg
LS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaSAKPj4gYi9zY3Jp
cHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5hMDA1NGYwMDlkCj4+IC0tLSAvZGV2L251bGwKPj4gKysr
IGIvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kKPj4gQEAgLTAsMCArMSwx
NSBAQAo+PiArLy8gVXNhZ2U6Cj4+ICsvL8KgIHNwYXRjaCAtLXNwLWZpbGUgc2NyaXB0cy9jb2Nj
aW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kgLS1kaXIgLiAKPj4gLS1pbi1wbGFjZQo+IAo+IFRo
aXMgY29tbWFuZCBsaW5lIHNob3VsZCBhbHNvIHVzZSAnLS1tYWNyby1maWxlIAo+IHNjcmlwdHMv
Y29jY2ktbWFjcm8tZmlsZS5oJyB0byBjb3ZlciBtb3JlIG9mIHRoZSBjb2RlIGJhc2UgKENvY2Np
bmVsbGUgCj4gc2tpcHMgcG9ydGlvbnMgb2YgdGhlIGNvZGUgdGhhdCB1c2VzIG1hY3JvcyBpdCBk
b2Vzbid0IHJlY29nbml6ZSkuCj4gCj4gCj4+IEBAIC03MjYsMTMgKzcyNCwxMCBAQCBzdGF0aWMg
dm9pZCBnZXRfYWRtYV9kZXNjcmlwdGlvbihTREhDSVN0YXRlICpzLCAKPj4gQURNQURlc2NyICpk
c2NyKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4+IMKgwqDCoMKgwqAgY2FzZSBTREhDX0NUUkxfQURNQTJfNjQ6Cj4+IC3CoMKgwqDCoMKgwqDC
oCBkbWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBlbnRyeV9hZGRyLAo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodWludDhfdCAqKSgmZHNjci0+YXR0
ciksIDEpOwo+PiAtwqDCoMKgwqDCoMKgwqAgZG1hX21lbW9yeV9yZWFkKHMtPmRtYV9hcywgZW50
cnlfYWRkciArIDIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICh1aW50OF90ICopKCZkc2NyLT5sZW5ndGgpLCAyKTsKPj4gK8KgwqDCoMKgwqDCoMKg
IGRtYV9tZW1vcnlfcmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIsICgmZHNjci0+YXR0ciksIDEp
Owo+PiArwqDCoMKgwqDCoMKgwqAgZG1hX21lbW9yeV9yZWFkKHMtPmRtYV9hcywgZW50cnlfYWRk
ciArIDIsICgmZHNjci0+bGVuZ3RoKSwgMik7Cj4gCj4gVGhlICgpIGFyb3VuZCAmZHNjci0+bGVu
Z3RoIGFyZSBub3cgcG9pbnRsZXNzLgoKVGhhbmtzIEVyaWMsIHBhdGNoIHVwZGF0ZWQuIFBldGVy
IGFyZSB5b3UgT0sgaWYgSSBjaGFuZ2UgdGhlIGNvY2NpIApoZWFkZXIgdXNpbmcgLyogKi8gYXM6
CgotLSA+OCAtLQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3Qu
Y29jY2kgCmIvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kKaW5kZXggYTAw
NTRmMDA5ZC4uN2U0MjY4MjI0MCAxMDA2NDQKLS0tIGEvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNf
cndfY29uc3QuY29jY2kKKysrIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29j
Y2kKQEAgLTEsNSArMSwxMyBAQAotLy8gVXNhZ2U6Ci0vLyAgc3BhdGNoIC0tc3AtZmlsZSBzY3Jp
cHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaSAtLWRpciAuIAotLWluLXBsYWNlCisv
KgorICBVc2FnZToKKworICAgIHNwYXRjaCBcCisgICAgICAgICAgIC0tbWFjcm8tZmlsZSBzY3Jp
cHRzL2NvY2NpLW1hY3JvLWZpbGUuaCBcCisgICAgICAgICAgIC0tc3AtZmlsZSBzY3JpcHRzL2Nv
Y2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaSBcCisgICAgICAgICAgIC0ta2VlcC1jb21tZW50
cyBcCisgICAgICAgICAgIC0taW4tcGxhY2UgXAorICAgICAgICAgICAtLWRpciAuCisqLwoKICAv
LyBSZW1vdmUgdXNlbGVzcyBjYXN0CiAgQEAKQEAgLTcsOSArMTUsOSBAQCBleHByZXNzaW9uIEUx
LCBFMiwgRTMsIEU0OwogIHR5cGUgVDsKICBAQAogICgKLS0gZG1hX21lbW9yeV9yZWFkKEUxLCBF
MiwgKFQgKilFMywgRTQpCistIGRtYV9tZW1vcnlfcmVhZChFMSwgRTIsIChUICopKEUzKSwgRTQp
CiAgKyBkbWFfbWVtb3J5X3JlYWQoRTEsIEUyLCBFMywgRTQpCiAgfAotLSBkbWFfbWVtb3J5X3dy
aXRlKEUxLCBFMiwgKFQgKilFMywgRTQpCistIGRtYV9tZW1vcnlfd3JpdGUoRTEsIEUyLCAoVCAq
KShFMyksIEU0KQogICsgZG1hX21lbW9yeV93cml0ZShFMSwgRTIsIEUzLCBFNCkKICApCmRpZmYg
LS1naXQgYS9ody9zZC9zZGhjaS5jIGIvaHcvc2Qvc2RoY2kuYwppbmRleCBkNWFiZGFhZDQxLi5k
ZTYzZmZiMDM3IDEwMDY0NAotLS0gYS9ody9zZC9zZGhjaS5jCisrKyBiL2h3L3NkL3NkaGNpLmMK
QEAgLTcyNCwxMCArNzI0LDEwIEBAIHN0YXRpYyB2b2lkIGdldF9hZG1hX2Rlc2NyaXB0aW9uKFNE
SENJU3RhdGUgKnMsIApBRE1BRGVzY3IgKmRzY3IpCiAgICAgICAgICB9CiAgICAgICAgICBicmVh
azsKICAgICAgY2FzZSBTREhDX0NUUkxfQURNQTJfNjQ6Ci0gICAgICAgIGRtYV9tZW1vcnlfcmVh
ZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIsICgmZHNjci0+YXR0ciksIDEpOwotICAgICAgICBkbWFf
bWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBlbnRyeV9hZGRyICsgMiwgKCZkc2NyLT5sZW5ndGgpLCAy
KTsKKyAgICAgICAgZG1hX21lbW9yeV9yZWFkKHMtPmRtYV9hcywgZW50cnlfYWRkciwgJmRzY3It
PmF0dHIsIDEpOworICAgICAgICBkbWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBlbnRyeV9hZGRy
ICsgMiwgJmRzY3ItPmxlbmd0aCwgMik7CiAgICAgICAgICBkc2NyLT5sZW5ndGggPSBsZTE2X3Rv
X2NwdShkc2NyLT5sZW5ndGgpOwotICAgICAgICBkbWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBl
bnRyeV9hZGRyICsgNCwgKCZkc2NyLT5hZGRyKSwgOCk7CisgICAgICAgIGRtYV9tZW1vcnlfcmVh
ZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyA0LCAmZHNjci0+YWRkciwgOCk7CiAgICAgICAgICBk
c2NyLT5hZGRyID0gbGU2NF90b19jcHUoZHNjci0+YWRkcik7CiAgICAgICAgICBkc2NyLT5hdHRy
ICY9ICh1aW50OF90KSB+MHhDMDsKICAgICAgICAgIGRzY3ItPmluY3IgPSAxMjsKLS0tCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
