Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94676E5A72
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 14:24:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOL3K-0002yW-Dv; Sat, 26 Oct 2019 12:20:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOL3J-0002yR-0S
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 12:20:17 +0000
X-Inumbo-ID: f7a89e66-f7ea-11e9-94d3-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7a89e66-f7ea-11e9-94d3-12813bfff9fa;
 Sat, 26 Oct 2019 12:20:16 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 85E59859FB
 for <xen-devel@lists.xenproject.org>; Sat, 26 Oct 2019 12:20:15 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id s9so2798301wrw.23
 for <xen-devel@lists.xenproject.org>; Sat, 26 Oct 2019 05:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P79WRKrO53iDbT1Yf/VUXLVKWsDQGmKDqtRB4o0iXfg=;
 b=fJ6sFZbRUv/ynuwbZeLdJQGlcZ/iTnxswInM1n6thuw4WwWby7iTx5BELkZRygHjMg
 JAFKKVnmajrKgFO8iTEeLhPzI3UlScktlt6Gy0a4fMJ+uAmqhAmhcISGSca2sU4TzESk
 5GdA6f+3RfRq8ncWZzmnP78vesCBr11aLpHNl1sZn5TglFhi6tilUSXBWA+M0G7R11hV
 G5l9Zj2o3y1EWBTfuCz5qzfwMCCS6kfg1UHUZToMEGIAlOKN6CJZtvo8xVv6DYdjocLF
 2nl35/UnnJZ7sRQ/SdX6WKBIfEe71UzZ4voKG3pMSnjgWaMQ81hHDxz3wCJtSLYhGlPc
 h0gA==
X-Gm-Message-State: APjAAAWjywlHzrLrC4XNIxxSqNjfuUnF16z1qLaY6QG8uQWyfinbxQv9
 AhfqlVC7QEc4eoueTDbO80VuoVFsgMc/NX/CY70gxXKli2AMteh2ghG5n9KgHTBRm8boHVZKfeL
 lNv45zRzfACo3MqwYLIU++Y1nfdo=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr7153932wmk.123.1572092414298; 
 Sat, 26 Oct 2019 05:20:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuJ/f9ONX2qfY/u1dx6O5YUqz+m/l5HRG42LCVUfxYjQ1FsJbSYGQWLf+EehBmJG/YM2Ds4Q==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr7153907wmk.123.1572092414091; 
 Sat, 26 Oct 2019 05:20:14 -0700 (PDT)
Received: from [192.168.1.33] (62.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.62])
 by smtp.gmail.com with ESMTPSA id y3sm9322335wro.36.2019.10.26.05.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2019 05:20:13 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
Date: Sat, 26 Oct 2019 14:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
Content-Language: en-US
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
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xNC8xOSA0OjIyIFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToK
PiBUaGlzIGlzIGEgZm9sbG93LXVwIG9mIE1hcmt1cydzIGNsZWFudXAgc2VyaWVzOgo+IFRhbWUg
YSBmZXcgInRvdWNoIHRoaXMsIHJlY29tcGlsZSB0aGUgd29ybGQiCj4gaHR0cHM6Ly93d3cubWFp
bC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjM1NzQ4Lmh0bWwKPiAKPiBU
aGlzIHBhcnQgaXMgbW9zdGx5IHJlc3RyaWN0ZWQgdG8gWDg2LCBidXQgc2luY2Ugc29tZSBmaWxl
IGZyb20gdGhlCj4gQWxwaGEvUEEtUklTQyBtYWNoaW5lcyBpbmNsdWRlICJody9pMzg2L3BjLmgi
IEkgaGFkIHRvIGZpeCB0aGVtCj4gdG9vLgo+IAo+IEV2ZW50dWFsbHkgSSdsbCBzdWNjZWVkIGF0
IHJlbW92aW5nIGh3L2kzODYvIGRlcGVuZGVuY3kgb24gbm9uLVg4Ngo+IHBsYXRmb3JtcyAoUXVl
c3QgSSBzdGFydGVkIDIgeWVhcnMgYWdvLi4uKS4KPiAKPiBSZWdhcmRzLAo+IAo+IFBoaWwuCj4g
Cj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgKDIwKToKPiAgICB2bDogQWRkIG1pc3NpbmcgImh3
L2JvYXJkcy5oIiBpbmNsdWRlCj4gICAgaHcvc291dGhicmlkZ2UvaWNoOTogUmVtb3ZlZCB1bnVz
ZWQgaGVhZGVycwo+ICAgIGh3L2lucHV0L3Bja2JkOiBSZW1vdmUgdW51c2VkICJody9pMzg2L3Bj
LmgiIGhlYWRlcgo+ICAgIGh3L2kzODYvaW9hcGljX2ludGVybmFsOiBSZW1vdmUgdW51c2VkICJo
dy9pMzg2L2lvYXBpYy5oIiBoZWFkZXIKPiAgICBody90aW1lcjogUmVtb3ZlIHVudXNlZCAidWkv
Y29uc29sZS5oIiBoZWFkZXIKPiAgICBody91c2IvZGV2LXN0b3JhZ2U6IFJlbW92ZSB1bnVzZWQg
InVpL2NvbnNvbGUuaCIgaGVhZGVyCj4gICAgaHcvaTM4Ni9pbnRlbF9pb21tdTogUmVtb3ZlIHVu
dXNlZCBpbmNsdWRlcwo+ICAgIGh3L3hlbi94ZW5fcHRfbG9hZF9yb206IFJlbW92ZSB1bnVzZWQg
aW5jbHVkZXMKPiAgICBody9hbHBoYS9hbHBoYV9zeXM6IFJlbW92ZSB1bnVzZWQgImh3L2lkZS5o
IiBoZWFkZXIKPiAgICBody9hbHBoYS9kcDI2NDogSW5jbHVkZSAibmV0L25ldC5oIgo+ICAgIGh3
L2hwcGEvbWFjaGluZTogSW5jbHVkZSAibmV0L25ldC5oIgo+ICAgIGh3L2FjcGkvY3B1X2hvdHBs
dWc6IEluY2x1ZGUgImh3L3BjaS9wY2kuaCIKPiAgICBody90aW1lci9ocGV0OiBJbmNsdWRlICJl
eGVjL2FkZHJlc3Mtc3BhY2VzLmgiCj4gICAgaHcvcGNpLWhvc3QvcTM1OiBJbmNsdWRlICJxZW11
L3JhbmdlLmgiCj4gICAgaHcvaTJjL3NtYnVzX2ljaDk6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIK
PiAgICBody9wY2ktaG9zdC9waWl4OiBJbmNsdWRlICJxZW11L3JhbmdlLmgiCj4gICAgaHcvYWNw
aTogSW5jbHVkZSAiaHcvbWVtL252ZGltbS5oIgo+ICAgIGh3L2kzODY6IEluY2x1ZGUgImh3L21l
bS9udmRpbW0uaCIKPiAgICBody9wY2ktaG9zdC9xMzU6IFJlbW92ZSB1bnVzZWQgaW5jbHVkZXMK
PiAgICBody9pMzg2L3BjOiBDbGVhbiB1cCBpbmNsdWRlcwpMYXVyZW50LCBzaW5jZSB0aGlzIHNl
cmllcyBpcyBmdWxseSByZXZpZXdlZCwgY2FuIGl0IGdvIHZpYQp5b3VyIHFlbXUtdHJpdmlhbCB0
cmVlPwoKVGhhbmtzLAoKUGhpbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
