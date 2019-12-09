Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B8116B49
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:41:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGRu-0001Pd-VF; Mon, 09 Dec 2019 10:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iyN9=Z7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ieGRt-0001PS-FI
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:39:29 +0000
X-Inumbo-ID: 2c994724-1a70-11ea-87bb-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2c994724-1a70-11ea-87bb-12813bfff9fa;
 Mon, 09 Dec 2019 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575887968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WlPLQEtspZUkNR0y4t+3P/dWfqO1encB2iQTeCfS9I=;
 b=D3k2dkxI+jmq/Bk9k+YwVMOk3vD3VjuYiuwvl/KkOnZfa771jS9ZjA6KxvLHCBjvAqqyGU
 hSzTGHyQeAR+sE8yIfDYMPJbtemKgBMZ26CjJr+TwTeARf2RySNSsGrItIqTP3cqZS7uVv
 TrQ3CtpNwEcB7kr2Nwz97sTVLdeFwJU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-iIOvpgH9Mj6kWpOKvNddgw-1; Mon, 09 Dec 2019 05:39:25 -0500
Received: by mail-wr1-f72.google.com with SMTP id v17so7300211wrm.17
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 02:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=37PzRRb96EmE565UKk5K5Sle2KLqEF/Osq1v4/uQF1U=;
 b=a/2WaSLOrjzwbjhBByllMMKW+sA0jnpFPWxrSQqlCEDANwStwwLcLM8DbPQ6HExICM
 TuruLLaR7K142oVJn12vnzCHlWbBOMviQu8KrpxrBwfR5EPCIC66s7BNgeEUQYQzNfyM
 /JcFDZruojedbmuI4SwpKQhbitzQkkJ5t45sG/h/fpcNqkFArZ4xwP5q8jQHOcDh2VdM
 Ce2pOdHn3WV1YQKbdZLbdlPeADB7glptos+b3soT5LOiyC1PpNebvHIaUWTAYErXKYk6
 4+MfjcMWtEJ066RdVve9rNOdL90sC8vvC4RO2YVSeUs40uKCeLn+XNnis4+2iGypcJQy
 ya6w==
X-Gm-Message-State: APjAAAVTTJvK/zYD2Eoo0HDH8X1lZNzdjYiATOIgwdtKVLboZYW54WSv
 O9/pOiUhyAgdO9m9w3KuujPpC4j4j7zftQIuZpjFB385u/Me1XM9Wu/pyZuU3g3/10Y4lpJ9Qhg
 V755CwqVDgVWg2MEzLKFrQ8VqbyE=
X-Received: by 2002:a1c:2e91:: with SMTP id
 u139mr22884104wmu.154.1575887964317; 
 Mon, 09 Dec 2019 02:39:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfP6BHvCad51bpoAe7dzTInHZw6capU81LLD9rqlQDM7kuvwLPfzyGGVsC9nfgYCgVqKFnWw==
X-Received: by 2002:a1c:2e91:: with SMTP id
 u139mr22884071wmu.154.1575887964061; 
 Mon, 09 Dec 2019 02:39:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id v188sm13618269wma.10.2019.12.09.02.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 02:39:23 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b4c7637-ffc1-102e-7f29-2568831eb20c@redhat.com>
Date: Mon, 9 Dec 2019 11:39:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191209095002.32194-7-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: iIOvpgH9Mj6kWpOKvNddgw-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig
 entry to select the IGD Passthrough Host Bridge
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMTkgMTA6NTAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IEFkZCB0
aGUgWEVOX0lHRF9QQVNTVEhST1VHSCBLY29uZmlnIG9wdGlvbi4KPiAKPiBYZW4gYnVpbGQgaGFz
IHRoYXQgb3B0aW9uIHNlbGVjdGVkIGJ5IGRlZmF1bHQuIE5vbi1YZW4gYnVpbGRzIG5vdwo+IGhh
dmUgdG8gc2VsZWN0IHRoaXMgZmVhdHVyZSBtYW51YWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gdjM6IE9u
bHkgZGVmYXVsdCB3aXRoIFhlbiAoQWxleCBXaWxsaWFtc29uKQo+IAo+IEkgZGlkIG5vdCB1c2Vk
ICdkZXBlbmRzIG9uIFhFTicgYXMgc3VnZ2VzdGVkIGJ5IEFsZXggYnV0Cj4gJ2RlZmF1bHQgeSBp
ZiBYRU4nLCBzbyBvbmUgY2FuIGJ1aWxkIFhFTiB3aXRob3V0IHRoaXMgZmVhdHVyZQo+IChmb3Ig
ZXhhbXBsZSwgb24gb3RoZXIgQVJDSCB0aGFuIFg4NikuCj4gLS0tCj4gIGh3L3BjaS1ob3N0L0tj
b25maWcgICAgICAgfCA1ICsrKysrCj4gIGh3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L0tjb25maWcgYi9ody9wY2ktaG9zdC9LY29uZmlnCj4g
aW5kZXggYjBhYTgzNTFjNC4uMjRiYThlYTA0NiAxMDA2NDQKPiAtLS0gYS9ody9wY2ktaG9zdC9L
Y29uZmlnCj4gKysrIGIvaHcvcGNpLWhvc3QvS2NvbmZpZwo+IEBAIC0xLDYgKzEsMTEgQEAKPiAg
Y29uZmlnIFBBTQo+ICAgICAgYm9vbAo+ICAKPiArY29uZmlnIFhFTl9JR0RfUEFTU1RIUk9VR0gK
PiArICAgIGJvb2wKPiArICAgIGRlZmF1bHQgeSBpZiBYRU4KPiArICAgIHNlbGVjdCBQQ0lfSTQ0
MEZYCgpNYXliZSAiZGVwZW5kcyBvbiBQQ0lfSTQ0MEZYIiAoc28gaWYgc29tZWJvZHkgYnVpbGRz
IGEgWGVuK0tWTSwgcTM1LW9ubHkKbWFjaGluZSB0aGV5IGRvbid0IGdldCBJR0QgcGFzc3Rocm91
Z2gpLiAgSSBjYW4gZG8gdGhpcyB3aGVuIGFwcGx5aW5nLgoKUGFvbG8KCj4gKwo+ICBjb25maWcg
UFJFUF9QQ0kKPiAgICAgIGJvb2wKPiAgICAgIHNlbGVjdCBQQ0kKPiBkaWZmIC0tZ2l0IGEvaHcv
cGNpLWhvc3QvTWFrZWZpbGUub2JqcyBiL2h3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMKPiBpbmRl
eCBmYTZkMTU1NmMwLi45YzQ2NmZhYjAxIDEwMDY0NAo+IC0tLSBhL2h3L3BjaS1ob3N0L01ha2Vm
aWxlLm9ianMKPiArKysgYi9ody9wY2ktaG9zdC9NYWtlZmlsZS5vYmpzCj4gQEAgLTE0LDcgKzE0
LDcgQEAgY29tbW9uLW9iai0kKENPTkZJR19WRVJTQVRJTEVfUENJKSArPSB2ZXJzYXRpbGUubwo+
ICBjb21tb24tb2JqLSQoQ09ORklHX1BDSV9TQUJSRSkgKz0gc2FicmUubwo+ICBjb21tb24tb2Jq
LSQoQ09ORklHX0ZVTE9ORykgKz0gYm9uaXRvLm8KPiAgY29tbW9uLW9iai0kKENPTkZJR19QQ0lf
STQ0MEZYKSArPSBpNDQwZngubwo+IC1jb21tb24tb2JqLSQoQ09ORklHX1BDSV9JNDQwRlgpICs9
IHhlbl9pZ2RfcHQubwo+ICtjb21tb24tb2JqLSQoQ09ORklHX1hFTl9JR0RfUEFTU1RIUk9VR0gp
ICs9IHhlbl9pZ2RfcHQubwo+ICBjb21tb24tb2JqLSQoQ09ORklHX1BDSV9FWFBSRVNTX1EzNSkg
Kz0gcTM1Lm8KPiAgY29tbW9uLW9iai0kKENPTkZJR19QQ0lfRVhQUkVTU19HRU5FUklDX0JSSURH
RSkgKz0gZ3BleC5vCj4gIGNvbW1vbi1vYmotJChDT05GSUdfUENJX0VYUFJFU1NfWElMSU5YKSAr
PSB4aWxpbngtcGNpZS5vCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
