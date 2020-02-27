Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909CC1718BC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 14:31:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7JDi-0004Bm-NS; Thu, 27 Feb 2020 13:28:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rzP0=4P=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1j7JDg-0004Bh-Go
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 13:28:52 +0000
X-Inumbo-ID: 181f0e06-5965-11ea-b7e8-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 181f0e06-5965-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582810131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cil+S2TI0XenfpWIIHgW3zIl7wCogwPVlPkS1oJPDY=;
 b=iyNjlY7EoBq/ma+A+6Qodz2rf7LPyd73dnecPArgJGyrtrN01uVa8OF/FCr1acHchdAdG3
 1Vue+XxbrjcuooTlfA1aS8YVFR5J5Djz5u2/VY5oTLVfjGgufkYz989uvvQIV1b6Pvx+5q
 oTq65sDWmisNd59lhT0+nejvzgvm5H0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-mNIosJgVP5Cqvjkc_YPYbA-1; Thu, 27 Feb 2020 08:28:44 -0500
X-MC-Unique: mNIosJgVP5Cqvjkc_YPYbA-1
Received: by mail-wr1-f72.google.com with SMTP id p12so457079wrm.13
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fD0MNpuWhab4G9SMLJRbIrZoxFLbb/kORsNGxaBYd4A=;
 b=evXrXLyBeWuN71tnENy7tUZsYeUyUQwDdo6qGyT7QLODfsnsYfNOHyI6WkLtKEZR9S
 ClJOWB1Gc0U9ZnUhutKwcKmRU91RkyQFeiD7OM4WsbJFfzCfSoq3Z2Tl/utzzYhBIhCS
 DPa1mk3tINXrbXaQTSq2hkECNd1Q8LurCGODhBw8sf8yRb9Chc+xErCFFUE2X3UEtCOz
 GGFPpLLRqtt5lFbw32E28hcTSKCy0cOVf9F33Vb/bMcASGCSWCkWzLrYk2efFuiibzAT
 AjH64OAo+zh2NZCmg3bmUjrlHs2QbhcQUmfAQOKVAhNpcZCpKKPr1QCz1hPANF8r7Pa2
 +mnQ==
X-Gm-Message-State: APjAAAXznym536aGmk5s0tdQvB24kRpnG8AIMEEEvho4jCbLRTLkco/p
 lGpLrISOuw72pwtDETbvM5z8qriChcwrQ0Wz+WtAOCuuaxk9C35ui81kJS+L7D+naZX7N0WJj+x
 fiW/YkBo/luGUxMab6TaxD+vBI24=
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5577719wmg.154.1582810123068; 
 Thu, 27 Feb 2020 05:28:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxX9vFksVNpjyfpvF+15trhX7hg8u9UM2U82hQyws3i3YOmakD1qZEDxeGYMrxyXo5pOq/jow==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5577674wmg.154.1582810122767; 
 Thu, 27 Feb 2020 05:28:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:30cb:d037:e500:2b47?
 ([2001:b07:6468:f312:30cb:d037:e500:2b47])
 by smtp.gmail.com with ESMTPSA id z1sm7450624wmf.42.2020.02.27.05.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 05:28:42 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
 <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
 <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
Date: Thu, 27 Feb 2020 14:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 00/20] hw: Clean up hw/i386 headers (and few
 alpha/hppa)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTAvMTkgMTU6MzIsIExhdXJlbnQgVml2aWVyIHdyb3RlOgo+IExlIDI2LzEwLzIwMTkg
w6AgMTQ6MjAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIGEgw6ljcml0wqA6Cj4+IEhpLAo+Pgo+
PiBPbiAxMC8xNC8xOSA0OjIyIFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4+
IFRoaXMgaXMgYSBmb2xsb3ctdXAgb2YgTWFya3VzJ3MgY2xlYW51cCBzZXJpZXM6Cj4+PiBUYW1l
IGEgZmV3ICJ0b3VjaCB0aGlzLCByZWNvbXBpbGUgdGhlIHdvcmxkIgo+Pj4gaHR0cHM6Ly93d3cu
bWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjM1NzQ4Lmh0bWwKPj4+
Cj4+PiBUaGlzIHBhcnQgaXMgbW9zdGx5IHJlc3RyaWN0ZWQgdG8gWDg2LCBidXQgc2luY2Ugc29t
ZSBmaWxlIGZyb20gdGhlCj4+PiBBbHBoYS9QQS1SSVNDIG1hY2hpbmVzIGluY2x1ZGUgImh3L2kz
ODYvcGMuaCIgSSBoYWQgdG8gZml4IHRoZW0KPj4+IHRvby4KPj4+Cj4+PiBFdmVudHVhbGx5IEkn
bGwgc3VjY2VlZCBhdCByZW1vdmluZyBody9pMzg2LyBkZXBlbmRlbmN5IG9uIG5vbi1YODYKPj4+
IHBsYXRmb3JtcyAoUXVlc3QgSSBzdGFydGVkIDIgeWVhcnMgYWdvLi4uKS4KPj4+Cj4+PiBSZWdh
cmRzLAo+Pj4KPj4+IFBoaWwuCj4+Pgo+Pj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgKDIwKToK
Pj4+IMKgwqAgdmw6IEFkZCBtaXNzaW5nICJody9ib2FyZHMuaCIgaW5jbHVkZQo+Pj4gwqDCoCBo
dy9zb3V0aGJyaWRnZS9pY2g5OiBSZW1vdmVkIHVudXNlZCBoZWFkZXJzCj4+PiDCoMKgIGh3L2lu
cHV0L3Bja2JkOiBSZW1vdmUgdW51c2VkICJody9pMzg2L3BjLmgiIGhlYWRlcgo+Pj4gwqDCoCBo
dy9pMzg2L2lvYXBpY19pbnRlcm5hbDogUmVtb3ZlIHVudXNlZCAiaHcvaTM4Ni9pb2FwaWMuaCIg
aGVhZGVyCj4+PiDCoMKgIGh3L3RpbWVyOiBSZW1vdmUgdW51c2VkICJ1aS9jb25zb2xlLmgiIGhl
YWRlcgo+Pj4gwqDCoCBody91c2IvZGV2LXN0b3JhZ2U6IFJlbW92ZSB1bnVzZWQgInVpL2NvbnNv
bGUuaCIgaGVhZGVyCj4+PiDCoMKgIGh3L2kzODYvaW50ZWxfaW9tbXU6IFJlbW92ZSB1bnVzZWQg
aW5jbHVkZXMKPj4+IMKgwqAgaHcveGVuL3hlbl9wdF9sb2FkX3JvbTogUmVtb3ZlIHVudXNlZCBp
bmNsdWRlcwo+Pj4gwqDCoCBody9hbHBoYS9hbHBoYV9zeXM6IFJlbW92ZSB1bnVzZWQgImh3L2lk
ZS5oIiBoZWFkZXIKPj4+IMKgwqAgaHcvYWxwaGEvZHAyNjQ6IEluY2x1ZGUgIm5ldC9uZXQuaCIK
Pj4+IMKgwqAgaHcvaHBwYS9tYWNoaW5lOiBJbmNsdWRlICJuZXQvbmV0LmgiCj4+PiDCoMKgIGh3
L2FjcGkvY3B1X2hvdHBsdWc6IEluY2x1ZGUgImh3L3BjaS9wY2kuaCIKPj4+IMKgwqAgaHcvdGlt
ZXIvaHBldDogSW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5oIgo+Pj4gwqDCoCBody9wY2kt
aG9zdC9xMzU6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIKPj4+IMKgwqAgaHcvaTJjL3NtYnVzX2lj
aDk6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIKPj4+IMKgwqAgaHcvcGNpLWhvc3QvcGlpeDogSW5j
bHVkZSAicWVtdS9yYW5nZS5oIgo+Pj4gwqDCoCBody9hY3BpOiBJbmNsdWRlICJody9tZW0vbnZk
aW1tLmgiCj4+PiDCoMKgIGh3L2kzODY6IEluY2x1ZGUgImh3L21lbS9udmRpbW0uaCIKPj4+IMKg
wqAgaHcvcGNpLWhvc3QvcTM1OiBSZW1vdmUgdW51c2VkIGluY2x1ZGVzCj4+PiDCoMKgIGh3L2kz
ODYvcGM6IENsZWFuIHVwIGluY2x1ZGVzCj4+IExhdXJlbnQsIHNpbmNlIHRoaXMgc2VyaWVzIGlz
IGZ1bGx5IHJldmlld2VkLCBjYW4gaXQgZ28gdmlhCj4+IHlvdXIgcWVtdS10cml2aWFsIHRyZWU/
Cj4gCj4gSSdsbCB0cnkgYnV0IEknbSBub3Qgc3VyZSB0byBoYXZlIHRoZSB0aW1lIHRvIGRvIHRo
YXQgYmVmb3JlIHRoZSBzb2Z0ZnJlZXplLgoKUGluZyA6KQoKUGFvbG8KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
