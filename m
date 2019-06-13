Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87004435D0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:20:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOfQ-00038V-09; Thu, 13 Jun 2019 12:17:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okag=UM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbOfO-00038Q-9C
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:17:18 +0000
X-Inumbo-ID: 2e6df79f-8dd5-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e6df79f-8dd5-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:17:16 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y17so14914186lfe.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Pzm+xqDsTbkamVzCBqfUuKtMohYwdT0+xkMFiILnoQ=;
 b=j9tONMbhxWjn/kLvx3QP0ncGKV4TlWErjeQ8cGPJerX/uYJfoPwAowXaHb+M6O/exP
 ISNJ2f1/GSnKKBof9wf7TOZPOd5eiRaaqkkPeyFLNFJtPkIY50WR2GCVoOxxBdE6QxTo
 yqP2T48DKyEyjpGl8XZY+LzsWJHrZngHpFj/lI+CWUnxdTSQX77XPyLNsTy+LXz8XeeC
 jCQSe7WMV6zGANRfFKhFZbRVKhsuaBaIqEgUJUw04WIVn1vP4IVUNlUsq+jce+WtjLJz
 FTFKFEJOjBB3TKrl7pXAj4cdjeJKh5oZXAUOiR9m6I/5TAlkOhwQi7qT02LBzVaJCxVO
 oWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Pzm+xqDsTbkamVzCBqfUuKtMohYwdT0+xkMFiILnoQ=;
 b=WJAf9awuoIe7EaIh2M5xOLDPYCjhJb4+vgX6gi4xB1vgnqAiMfzEysoiKHkxP+BiQK
 rEykrWO569bHlN+2pqMWE0XOQ1DxLsk5zMFkGu38CSR7mbczm/SHFRmthiofplMe5RS2
 sYTNnuONlILrIAW1oMOHE/qSpDtS5vs6X+pd92l6cis83f7eAYyNk1n3BsBZubbpZM9T
 p5SYAr4gY0Y0c0JtxfL54jPcSk6J2hwGYHAICWXUMf25BBMVAJ1IQw7OIdLnuMmxxp/N
 1BvrUMARaeTraoJDluuD2N5QaNrsr9pbDggV1csffWbXlCCjHBd3xHoQD3PNLrhE1J30
 lWXQ==
X-Gm-Message-State: APjAAAW9ZZczjyNv5ReLSILimXRMblpLWqyClO2l2+6CJCSL4xZ4Mk9l
 h+woEXq2w9cFLt8ilPq5jCU=
X-Google-Smtp-Source: APXvYqwew617QysLQNu9PgvMwiTWeD/hzv9YvFaaG0y14bDQlikUxyS+AzKJ83FN6DKhU7QX8dPMwA==
X-Received: by 2002:a19:6a07:: with SMTP id u7mr43049085lfu.74.1560428235050; 
 Thu, 13 Jun 2019 05:17:15 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 b18sm560670lfi.30.2019.06.13.05.17.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:17:13 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <25ea00e0-c5fc-6606-f3f5-12001675bb60@gmail.com>
 <5D00A97B02000078002374E5@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4f83cfb1-a317-d486-d1e0-2ed15fe1be59@gmail.com>
Date: Thu, 13 Jun 2019 15:17:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D00A97B02000078002374E5@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuLAoKT24gMTIuMDYuMTkgMTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBXZWxsLCBteSBw
b2ludCBoZXJlIGlzIHRvIGxlZnQgaXQgYXMgaXMsIG1heWJlIGFkZCBtb3JlIGRvY3VtZW50YXRp
b24uIElmCj4+IG9uZSBsaWtlcyBzaG9vdGluZyBoaXMgbGVnLCB3ZSBzaG91bGQgb25seSBjYXJl
IGFib3V0IGF2b2lkaW5nIHJpY29jaGV0IGhhcm1zCj4+IGh5cGVydmlzb3Igb3Igb3RoZXIgZ3Vl
c3RzLgo+PiBJZiB5b3UgZGlzYWdyZWUsIHBsZWFzZSBzdWdnZXN0IHlvdXIgaW50ZXJhY3Rpb24g
bW9kZWwsIEknbGwgYmUgaGFwcHkgdG8KPj4gaW1wbGVtZW50IGl0Lgo+IAo+IFdlbGwsIGlmICJt
aXggYXMgeW91IGxpa2UiIGlzIGZpbmUgZm9yIGd1ZXN0cyB0byBmb2xsb3csIHRoZW4gb2theS4g
QnV0Cj4gd2UgbmVlZCB0byBiZSBfcmVhbGx5XyBjZXJ0YWluIHRoZXJlJ3Mgbm8gaXNzdWUgd2l0
aCB0aGlzLgoKSSdtIG5vdCBhd2FyZSBhYm91dCBwb3RlbnRpYWwgcHJvYmxlbXMgZnJvbSB0aGUg
Z3Vlc3Qgc2lkZS4gRG8geW91IGhhdmUgYW55IGlkZWFzIGFib3V0IGl0PwoKPiBSZWxheGluZwo+
IHRoZSBpbnRlcmZhY2UgaXMgYWx3YXlzIHBvc3NpYmxlLCB3aGlsZSB0aWdodGVuaW5nIGFuIGlu
dGVyZmFjZSBpcwo+IGFsbW9zdCBhbHdheXMgYXQgbGVhc3QgYSBwcm9ibGVtLCBpZiBwb3NzaWJs
ZSBhdCBhbGwuCgpUcnVlLgoKCj4+PiBJbiBhIHByaW9yIHZlcnNpb24geW91IGRpZCB0aGUgbWVj
aGFuaWNhbCBwYXJ0IG9mIGFkanVzdGluZyB0aGUgVkEtYmFzZWQKPj4+IGNvZGUgaW4gYSBwcmVy
ZXEgcGF0Y2gsIGFpZGluZyByZXZpZXcuIElzIHRoZXJlIGEgcGFydGljdWxhciByZWFzb24geW91
Cj4+PiBmb2xkZWQgZXZlcnl0aGluZyBpbnRvIG9uZSBwYXRjaCBub3c/Cj4+Cj4+IEkgc2lsZW50
bHkgZm9sbG93ZWQgc3VnZ2VzdGlvbiBmcm9tIEdlb3JnZSBbMV0uIEFueSBvYmplY3Rpb25zPwo+
IAo+IEhtbSwgSSBjYW4ndCByZWFkIHRoaXMgaW50byBHZW9yZ2UncyBzdWdnZXN0aW9uLiBBaXVp
IGhlIGRpZCBzdWdnZXN0Cj4gbm90IHRvIHNwbGl0IHRoZSBkZWZpbml0aW9uIG9mIHRoZSBuZXcg
aW50ZXJmYWNlIGZyb20gaXRzIGltcGxlbWVudGF0aW9uLgo+IEJ1dCB0aGF0IGRvZXNuJ3QgbmVj
ZXNzYXJpbHkgbWVhbiB0byBzcXVhc2ggX2V2ZXJ5dGhpbmdfIGluIG9uZQo+IHBhdGNoLgoKT0su
Ckl0IGxvb2tzIHRoYXQgd2hhdCB5b3Ugc2FpZCBmaXJzdGx5IGlzIGNsb3NlciB0byBWMSBvZiB0
aGlzIHN0dWZmLiBXaWxsIGtlZXAgdGhpcyBpbiBtaW5kIGZvciB0aGUgbmV4dCB2ZXJzaW9uLgoK
Cj4gV2VsbCwgSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UncmUgYWZ0ZXIu
IE9mIGNvdXJzZQo+IGNvbXBhdCBtb2RlIGd1ZXN0cyBuZWVkIHRvIGNvbnRpbnVlIHRvIGJlIHN1
cHBvcnRlZCwgYW5kIHRoZQo+IG5ldyBpbnRlcmZhY2Ugd291bGQgYWxzbyBiZXR0ZXIgYmUgYXZh
aWxhYmxlIHRvIHRoZW0uIEFuZCBpdCBpcwo+IGEgZmFjdCB0aGF0IHRoZWlyIHJ1bnN0YXRlIGFy
ZWEgbGF5b3V0IGRpZmZlcnMgZnJvbSB0aGF0IG9mIDY0LWJpdAo+IGd1ZXN0cy4KCk9LLgoKPj4+
PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oCj4+Pj4gQEAgLTE2MywxNyArMTYzLDMxIEBAIHN0cnVjdCB2Y3B1Cj4+Pj4gICAg
ICAgIHZvaWQgICAgICAgICAgICAqc2NoZWRfcHJpdjsgICAgLyogc2NoZWR1bGVyLXNwZWNpZmlj
IGRhdGEgKi8KPj4+PiAgICAKPj4+PiAgICAgICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyBy
dW5zdGF0ZTsKPj4+PiArCj4+Pj4gKyAgICBlbnVtIHsKPj4+PiArICAgICAgICBSVU5TVEFURV9O
T05FID0gMCwKPj4+PiArICAgICAgICBSVU5TVEFURV9QQUREUiA9IDEsCj4+Pj4gKyAgICAgICAg
UlVOU1RBVEVfVkFERFIgPSAyLAo+Pj4+ICsgICAgfSBydW5zdGF0ZV9ndWVzdF90eXBlOwo+Pj4+
ICsKPj4+PiArICAgIHVuc2lnbmVkIGxvbmcgcnVuc3RhdGVfaW5fdXNlOwo+Pj4KPj4+IFdoeSAi
dW5zaWduZWQgbG9uZyI/IElzbid0IGEgYm9vbCBhbGwgeW91IG5lZWQ/Cj4+Cj4+IEJvb2wgc2hv
dWxkIGJlIGVub3VnaC4gQnV0IGl0IHNlZW1zIHdlIHdpbGwgaGF2ZSBhIGxvY2sgaGVyZS4KPj4K
Pj4+IEFsc28gdGhlc2Ugd291bGQgbm93IGFsbCB3YW50IHRvIGJlIGdyb3VwZWQgaW4gYSBzdWIt
c3RydWN0dXJlIG5hbWVkCj4+PiAicnVuc3RhdGUiLCByYXRoZXIgdGhhbiBoYXZpbmcgInJ1bnN0
YXRlXyIgcHJlZml4ZXMuCj4+Cj4+IE1lbWJlciBgcnVuc3RhdGVgIGhhcyBhbHJlYWR5IGEgdHlw
ZSBvZiBgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mb2Agd2hpY2ggaXMKPj4gYW4gaW50ZXJmYWNl
IHR5cGUuCj4+IGBydW5zdGF0ZV9ndWVzdGAgaXMgYSB1bmlvbi4gSSdkIG5vdCBsaWtlIG1vdmlu
ZyBgcnVuc3RhdGVfZ3Vlc3RgIHVuaW9uIGludG8KPj4gYW5vdGhlciBzdWJzdHJ1Y3R1cmUuIEJl
Y2F1c2Ugd2Ugd291bGQgaGF2ZSBsb25nIGxpbmVzIGxpa2UKPj4gYHYtPnN0cnVjdC5ydW5zdGF0
ZV9ndWVzdC52aXJ0LnAtPnN0YXRlX2VudHJ5X3RpbWVgLgo+IAo+IFlvdSBkaWRuJ3QgZ2V0IG15
IHBvaW50IHRoZW46IFdoYXQgSSdtIGFmdGVyIGlzCj4gCj4gICAgICBzdHJ1Y3Qgewo+ICAgICAg
ICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gaW5mbzsKPiAgICAgICAgICBlbnVtIHsKPiAg
ICAgICAgICAgICAgUlVOU1RBVEVfTk9ORSwKPiAgICAgICAgICAgICAgUlVOU1RBVEVfUEFERFIs
Cj4gICAgICAgICAgICAgIFJVTlNUQVRFX1ZBRERSLAo+ICAgICAgICAgIH0gZ3Vlc3RfdHlwZTsK
PiAgICAgICAgICBib29sIGluX3VzZTsKPiAgICAgIH0gcnVuc3RhdGU7CgpEaWQgeW91IG1pc3Mg
cnVuc3RhdGVfZ3Vlc3QgYXMgYSBtZW1iZXIgb2YgdGhhdCBzdHJ1Y3Q/CgotLSAKU2luY2VyZWx5
LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
