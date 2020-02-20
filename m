Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055F165F3E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:54:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4mEv-0008Rt-Av; Thu, 20 Feb 2020 13:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4mEu-0008Ro-5j
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:51:40 +0000
X-Inumbo-ID: 1dd6acaa-53e8-11ea-8531-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1dd6acaa-53e8-11ea-8531-12813bfff9fa;
 Thu, 20 Feb 2020 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582206698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKb/KEwWUEIPy+OvjYzyLURjPny9rOd900DVmum/ckM=;
 b=Qg1TXxgBCwSHVPXn4oRPFHMhv9gOAc3dZD0+pVilNuuOW+XXtd+JfaO4oOY7Sw62hGmRaB
 B5lDG4wjg3DnBGWhqVcrcYL7io1OEmUWeXihP3v+BzIu+XJ+rJrogzEv3B7vX5+5WhDz32
 ovyAcFr2G8jZk8T66oSsKHmoGM6y640=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-MkVkgwtqN7u1EseWB5OW7w-1; Thu, 20 Feb 2020 08:51:33 -0500
Received: by mail-ed1-f72.google.com with SMTP id g11so2733067edu.10
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rz0vm/fZ0lEcM/XVDnOZIU35A6myDohOkSLNpyLFR0o=;
 b=VG6OGApFTvJqUeTHHp7pi113n1LTTZN+yzhsOzAzkgliMzv4s3JT99/MCs0TAIzjyf
 oVbZDVRtXx1HB7Gu02G+UcidKblKBCfg6RultJEM1f/T7R+tg6pCDXoDimGJA7ImQmw5
 2VU8kjUnhR67LfPBuEfYPNrmXdWR9O6CnnHmYvFtNX9h+ohchm/PNX32KAFSIXgbmdXs
 18jGI88gGMt45GlugWi3oCR8g+uOvM7TzaACNsdYHGMAb5V36hE+64gip5kn7kQzdAPL
 PuuoN1pfNcnhqfO+f4wyT57WyBM6GdWmb8ohMs460YCUARfr7JE6eQkeaUAXf3255PJS
 AcQg==
X-Gm-Message-State: APjAAAVoNNSZOrmYmPoqcfLphBXz6jir+f0N6smQb7YDkAzZS2frHcua
 BuLAM4EqCnAXVDUgb427cjwLRheGYZ+hGMQj2K3SC2LGFPITWJTo4FBagqF6r0ubUkQFhXSBLJX
 im2g0VJS184JcWXR4TvWe8nrONRE=
X-Received: by 2002:aa7:dad0:: with SMTP id x16mr29014888eds.307.1582206692590; 
 Thu, 20 Feb 2020 05:51:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7de7HT0Ttn+wiwPNp6Mm0oh07wL2K+KqpPJUSMIj5PmcHNzjHMG2ot2mUEYIe0pdxZ2904g==
X-Received: by 2002:aa7:dad0:: with SMTP id x16mr29014855eds.307.1582206692375; 
 Thu, 20 Feb 2020 05:51:32 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s12sm118618eja.79.2020.02.20.05.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 05:51:31 -0800 (PST)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-3-philmd@redhat.com>
 <68120807-6f6b-1602-8208-fd76d64e74bc@redhat.com>
 <be623afd-0605-0bdf-daae-f38ba5562012@redhat.com>
Message-ID: <9b8baae3-d4f2-4b7c-604a-5f05d4db1eb2@redhat.com>
Date: Thu, 20 Feb 2020 14:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <be623afd-0605-0bdf-daae-f38ba5562012@redhat.com>
Content-Language: en-US
X-MC-Unique: MkVkgwtqN7u1EseWB5OW7w-1
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

T24gMi8yMC8yMCAyOjQzIFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPiBPbiAy
LzIwLzIwIDI6MTYgUE0sIEVyaWMgQmxha2Ugd3JvdGU6Cj4+IE9uIDIvMjAvMjAgNzowNSBBTSwg
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+PiBTaW5jZSBpdHMgaW50cm9kdWN0aW9u
IGluIGNvbW1pdCBkODZhNzdmOGFiYiwgZG1hX21lbW9yeV9yZWFkKCkKPj4+IGFsd2F5cyBhY2Nl
cHRlZCB2b2lkIHBvaW50ZXIgYXJndW1lbnQuIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkKPj4+IGNh
c3RzLgo+Pj4KPj4+IFRoaXMgY29tbWl0IHdhcyBwcm9kdWNlZCB3aXRoIHRoZSBpbmNsdWRlZCBD
b2NjaW5lbGxlIHNjcmlwdAo+Pj4gc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPgo+Pj4gLS0tCj4+PiDCoCBzY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5j
b2NjaSB8IDE1ICsrKysrKysrKysrKysrKwo+Pj4gwqAgaHcvYXJtL3NtbXUtY29tbW9uLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKy0tCj4+PiDCoCBody9hcm0v
c21tdXYzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTAgKysrKy0tLS0tLQo+Pj4gwqAgaHcvc2Qvc2RoY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTUgKysrKystLS0tLS0tLS0tCj4+PiDCoCA0
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Pj4gwqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2Np
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNv
Y2NpIAo+Pj4gYi9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaQo+Pj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLmEwMDU0ZjAwOWQKPj4+IC0t
LSAvZGV2L251bGwKPj4+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNv
Y2NpCj4+PiBAQCAtMCwwICsxLDE1IEBACj4+PiArLy8gVXNhZ2U6Cj4+PiArLy/CoCBzcGF0Y2gg
LS1zcC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIC0tZGlyIC4g
Cj4+PiAtLWluLXBsYWNlCj4+Cj4+IFRoaXMgY29tbWFuZCBsaW5lIHNob3VsZCBhbHNvIHVzZSAn
LS1tYWNyby1maWxlIAo+PiBzY3JpcHRzL2NvY2NpLW1hY3JvLWZpbGUuaCcgdG8gY292ZXIgbW9y
ZSBvZiB0aGUgY29kZSBiYXNlIChDb2NjaW5lbGxlIAo+PiBza2lwcyBwb3J0aW9ucyBvZiB0aGUg
Y29kZSB0aGF0IHVzZXMgbWFjcm9zIGl0IGRvZXNuJ3QgcmVjb2duaXplKS4KPj4KPj4KPj4+IEBA
IC03MjYsMTMgKzcyNCwxMCBAQCBzdGF0aWMgdm9pZCBnZXRfYWRtYV9kZXNjcmlwdGlvbihTREhD
SVN0YXRlICpzLCAKPj4+IEFETUFEZXNjciAqZHNjcikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiDCoMKgwqDCoMKgIGNhc2UgU0RIQ19D
VFJMX0FETUEyXzY0Ogo+Pj4gLcKgwqDCoMKgwqDCoMKgIGRtYV9tZW1vcnlfcmVhZChzLT5kbWFf
YXMsIGVudHJ5X2FkZHIsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAodWludDhfdCAqKSgmZHNjci0+YXR0ciksIDEpOwo+Pj4gLcKgwqDCoMKgwqDC
oMKgIGRtYV9tZW1vcnlfcmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyAyLAo+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVpbnQ4X3QgKikoJmRz
Y3ItPmxlbmd0aCksIDIpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9tZW1vcnlfcmVhZChzLT5k
bWFfYXMsIGVudHJ5X2FkZHIsICgmZHNjci0+YXR0ciksIDEpOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGRtYV9tZW1vcnlfcmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyAyLCAoJmRzY3ItPmxlbmd0
aCksIDIpOwo+Pgo+PiBUaGUgKCkgYXJvdW5kICZkc2NyLT5sZW5ndGggYXJlIG5vdyBwb2ludGxl
c3MuCj4gCj4gVGhhbmtzIEVyaWMsIHBhdGNoIHVwZGF0ZWQuIFBldGVyIGFyZSB5b3UgT0sgaWYg
SSBjaGFuZ2UgdGhlIGNvY2NpIAo+IGhlYWRlciB1c2luZyAvKiAqLyBhczoKPiAKPiAtLSA+OCAt
LQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaSAK
PiBiL3NjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpCj4gaW5kZXggYTAwNTRm
MDA5ZC4uN2U0MjY4MjI0MCAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19y
d19jb25zdC5jb2NjaQo+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNv
Y2NpCj4gQEAgLTEsNSArMSwxMyBAQAo+IC0vLyBVc2FnZToKPiAtLy/CoCBzcGF0Y2ggLS1zcC1m
aWxlIHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIC0tZGlyIC4gCj4gLS1p
bi1wbGFjZQo+ICsvKgo+ICvCoCBVc2FnZToKPiArCj4gK8KgwqDCoCBzcGF0Y2ggXAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmgg
XAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL2V4
ZWNfcndfY29uc3QuY29jY2kgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLWtlZXAtY29tbWVu
dHMgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLWluLXBsYWNlIFwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLS1kaXIgLgo+ICsqLwo+IAo+ICDCoC8vIFJlbW92ZSB1c2VsZXNzIGNhc3QKPiAg
wqBAQAo+IEBAIC03LDkgKzE1LDkgQEAgZXhwcmVzc2lvbiBFMSwgRTIsIEUzLCBFNDsKPiAgwqB0
eXBlIFQ7Cj4gIMKgQEAKPiAgwqAoCj4gLS0gZG1hX21lbW9yeV9yZWFkKEUxLCBFMiwgKFQgKilF
MywgRTQpCj4gKy0gZG1hX21lbW9yeV9yZWFkKEUxLCBFMiwgKFQgKikoRTMpLCBFNCkKPiAgwqAr
IGRtYV9tZW1vcnlfcmVhZChFMSwgRTIsIEUzLCBFNCkKPiAgwqB8Cj4gLS0gZG1hX21lbW9yeV93
cml0ZShFMSwgRTIsIChUICopRTMsIEU0KQo+ICstIGRtYV9tZW1vcnlfd3JpdGUoRTEsIEUyLCAo
VCAqKShFMyksIEU0KQo+ICDCoCsgZG1hX21lbW9yeV93cml0ZShFMSwgRTIsIEUzLCBFNCkKPiAg
wqApCj4gZGlmZiAtLWdpdCBhL2h3L3NkL3NkaGNpLmMgYi9ody9zZC9zZGhjaS5jCj4gaW5kZXgg
ZDVhYmRhYWQ0MS4uZGU2M2ZmYjAzNyAxMDA2NDQKPiAtLS0gYS9ody9zZC9zZGhjaS5jCj4gKysr
IGIvaHcvc2Qvc2RoY2kuYwo+IEBAIC03MjQsMTAgKzcyNCwxMCBAQCBzdGF0aWMgdm9pZCBnZXRf
YWRtYV9kZXNjcmlwdGlvbihTREhDSVN0YXRlICpzLCAKPiBBRE1BRGVzY3IgKmRzY3IpCj4gIMKg
wqDCoMKgwqDCoMKgwqAgfQo+ICDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ICDCoMKgwqDCoCBj
YXNlIFNESENfQ1RSTF9BRE1BMl82NDoKPiAtwqDCoMKgwqDCoMKgwqAgZG1hX21lbW9yeV9yZWFk
KHMtPmRtYV9hcywgZW50cnlfYWRkciwgKCZkc2NyLT5hdHRyKSwgMSk7Cj4gLcKgwqDCoMKgwqDC
oMKgIGRtYV9tZW1vcnlfcmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyAyLCAoJmRzY3ItPmxl
bmd0aCksIDIpOwo+ICvCoMKgwqDCoMKgwqDCoCBkbWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBl
bnRyeV9hZGRyLCAmZHNjci0+YXR0ciwgMSk7Cj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9tZW1vcnlf
cmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyAyLCAmZHNjci0+bGVuZ3RoLCAyKTsKPiAgwqDC
oMKgwqDCoMKgwqDCoCBkc2NyLT5sZW5ndGggPSBsZTE2X3RvX2NwdShkc2NyLT5sZW5ndGgpOwo+
IC3CoMKgwqDCoMKgwqDCoCBkbWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBlbnRyeV9hZGRyICsg
NCwgKCZkc2NyLT5hZGRyKSwgOCk7Cj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9tZW1vcnlfcmVhZChz
LT5kbWFfYXMsIGVudHJ5X2FkZHIgKyA0LCAmZHNjci0+YWRkciwgOCk7Cj4gIMKgwqDCoMKgwqDC
oMKgwqAgZHNjci0+YWRkciA9IGxlNjRfdG9fY3B1KGRzY3ItPmFkZHIpOwo+ICDCoMKgwqDCoMKg
wqDCoMKgIGRzY3ItPmF0dHIgJj0gKHVpbnQ4X3QpIH4weEMwOwo+ICDCoMKgwqDCoMKgwqDCoMKg
IGRzY3ItPmluY3IgPSAxMjsKPiAtLS0KClNlcmllcyB1cGRhdGVkIGhlcmU6Cmh0dHBzOi8vZ2l0
aHViLmNvbS9waGlsbWQvcWVtdS9jb21taXRzL2V4ZWNfcndfY29uc3RfdjQKClJlbGV2YW50IHNw
YXRjaDoKaHR0cHM6Ly9naXRodWIuY29tL3BoaWxtZC9xZW11L2Jsb2IvZXhlY19yd19jb25zdF92
NC9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaQoKSSB3aWxsIHJlc3BpbiBs
YXRlciB0byBsZXQgcGVvcGxlIHRpbWUgdG8gcmV2aWV3LgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
