Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35491090B9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 16:08:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFvG-0005nq-3I; Mon, 25 Nov 2019 15:05:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQY9=ZR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZFvF-0005nl-Hq
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 15:05:05 +0000
X-Inumbo-ID: f5aebfc0-0f94-11ea-b3bd-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5aebfc0-0f94-11ea-b3bd-bc764e2007e4;
 Mon, 25 Nov 2019 15:05:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so15033575wrl.13
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 07:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x1yEGhxhqm3puCZS1lCaFOaE/1dGDtjqB942kGw2L28=;
 b=Vitd767Xs2VLLPUDF+U6EP5VnytnYnugnbY465mG6/AFFHIGMmsSw34QoeOs2E0A9F
 lUqz0VSLDrlD6Yc+pIvrKNRt1iAxkOjwNtwdUXIJ28tgDKYMcK7eXvgjaXRcXU/zQ3Fm
 jff+BgUXYM9iCVylsdeYl6mAQ5t4LqAZCu/+2gMDRhJbOUinDq+N6j2fT2HcCzHOhQPy
 BhpFuT0Jpgp/w4yYvgLxUUzoS+Njhp6GGShkM/0L1d2tGJOqLKzm7JGfJ1FtCbeq5UUw
 G78wlpV2rQpCg4lcQYLIvewJvAmnrqdMRgQizjGUbG8XJ3RrwgssZdf03fCa7C+Y0HMC
 25og==
X-Gm-Message-State: APjAAAV8EJTJdzZ8ePm4m8a94ghCdSJvfqGnSDuZRUgGCZibBciPUJVo
 SWcWf0dncF3srwmsnKj8qjI=
X-Google-Smtp-Source: APXvYqxTls9mndHx5pVIDr9TR8ksda4ou+OQBOAd0+cMpSXEKVy5du+ogjl5bHlJzYlXZeIuFv2TWw==
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr15413386wrs.46.1574694303416; 
 Mon, 25 Nov 2019 07:05:03 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id x11sm10809809wro.84.2019.11.25.07.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 07:05:02 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
Message-ID: <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
Date: Mon, 25 Nov 2019 15:05:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQW5kcmUpCgpPbiAyMy8xMS8yMDE5IDIwOjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGks
Cj4gCj4gT24gMTUvMTEvMjAxOSAyMDoxMCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+PiBB
bGxvdyB2Z2ljX2dldF9od19pcnFfZGVzYyB0byBiZSBjYWxsZWQgd2l0aCBhIHZjcHUgYXJndW1l
bnQuCj4+Cj4+IFVzZSB2Y3B1IGFyZ3VtZW50IGluIHZnaWNfY29ubmVjdF9od19pcnEuCj4+Cj4+
IHZnaWNfY29ubmVjdF9od19pcnEgaXMgY2FsbGVkIGZvciBQUElzIGFuZCBTUElzLCBub3QgU0dJ
cy4gRW5mb3JjZSB3aXRoCj4+IEFTU0VSVHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQg
SGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPj4KPj4gLS0t
Cj4+IHYzOiBuZXcgcGF0Y2gKPj4KPj4gLS0tCj4+IE5vdGU6IEkgaGF2ZSBvbmx5IG1vZGlmaWVk
IHRoZSBvbGQgdmdpYyB0byBhbGxvdyBkZWxpdmVyeSBvZiBQUElzLgo+IAo+IFRoZSBuZXcgdkdJ
QyBzaG91bGQgYWxzbyBiZSBtb2RpZmllZCB0byBzdXBwb3J0IGRlbGl2ZXJ5IG9mIFBQSXMuCj4g
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMu
Ywo+PiBpbmRleCA4MmY1MjRhMzVjLi5jMzkzM2MyNjg3IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vdmdpYy5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLmMKPj4gQEAgLTQxMCwxMCAr
NDEwLDEwIEBAIHZvaWQgdmdpY19lbmFibGVfaXJxcyhzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3Qg
Cj4+IHIsIGludCBuKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcnFfc2V0X2FmZmlu
aXR5KHAtPmRlc2MsIGNwdW1hc2tfb2Yodl90YXJnZXQtPnByb2Nlc3NvcikpOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmcC0+ZGVzYy0+bG9jaywgZmxh
Z3MpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogVGhlIGlycSBjYW5ub3QgYmUgYSBQUEksIHdlIG9ubHkgc3VwcG9ydCBkZWxp
dmVyeSBvZiBTUElzCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0byBndWVzdHMuCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBUaGUgaXJxIGNhbm5vdCBiZSBhIFNHSSwgd2Ug
b25seSBzdXBwb3J0IGRlbGl2ZXJ5IG9mIFNQSXMKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIGFuZCBQUElzIHRvIGd1ZXN0cy4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
Lwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBU1NFUlQoaXJxID49IDMyKTsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKGlycSA+PSBOUl9TR0lTKTsKPiAKPiBXZSB1c3VhbGx5
IHB1dCBBU1NFUlQoKSBpbiBwbGFjZSB3ZSBrbm93IHRoYXQgY29kZSB3b3VsZG4ndCBiZSBhYmxl
IHRvIAo+IHdvcmsgY29ycmVjdGx5IGlmIHRoZXJlIEFTU0VSVCB3ZXJlIGhpdC4gSW4gdGhpcyBw
YXJ0aWN1bGFyIGNhc2U6Cj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggaXJx
X3R5cGVfc2V0X2J5X2RvbWFpbihkKSApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ2ljX3NldF9pcnFfdHlwZShwLT5kZXNjLCB2Z2ljX2dldF92aXJxX3R5cGUodiwgbiwg
aSkpOwo+IAo+IDEpIFdlIGRvbid0IHdhbnQgdG8gYWxsb3cgYW55IGRvbWFpbiAoaW5jbHVkaW5n
IERvbTApIHRvIG1vZGlmeSB0aGUgCj4gaW50ZXJydXB0IHR5cGUgKGkuZS4gbGV2ZWwvZWRnZSkg
Zm9yIFBQSXMgYXMgdGhpcyBpcyBzaGFyZWQuIFlvdSB3aWxsIAo+IGFsc28gbW9zdCBsaWtlbHkg
bmVlZCB0byBtb2RpZnkgdGhlIGNvdW50ZXJwYXJ0IGluIHNldHVwX2d1ZXN0X2lycSgpLgo+IAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwLT5kZXNjLT5oYW5kbGVyLT5lbmFibGUocC0+
ZGVzYyk7Cj4gCj4gMikgT24gR0lDdjMsIHRoZSByZS1kaXN0cmlidXRvciBvZiB2Q1BVIEEgaXMg
YWNjZXNzaWJsZSBieSB2Q1BVIEIuIFNvIAo+IHZDUFUgQiBjb3VsZCBlbmFibGUgdGhlIFNHSSBm
b3IgdkNQVSBBLiBCdXQgdGhpcyB3b3VsZCBiZSBjYWxsZWQgb24gdGhlIAo+IHdyb25nIHBDUFUg
bGVhZGluZyB0byBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhlIGhhcmR3YXJlIHN0YXRlIG9mIHRo
ZSAKPiBpbnRlcm5hbCB2R0lDIHN0YXRlLgoKSSB0aG91Z2h0IGEgYml0IG1vcmUgb2YgdGhlIGlz
c3VlIG92ZXIgdGhlIHdlZWstZW5kLiBUaGUgY3VycmVudCB2R0lDIGlzIApmYWlybHkgbWVzc3ku
IEkgY2FuIHNlZSB0d28gc29sdXRpb25zIG9uIGhvdyB0byBzb2x2ZSB0aGlzOgogICAgIDEpIFNl
bmQgYW4gSVBJIHRvIHRoZSBwQ1BVIHdoZXJlIHRoZSB2Q1BVIEEgaXMgcnVubmluZyBhbmQgCmRp
c2FibGUvZW5hYmxlIHRoZSBpbnRlcnJ1cHQuIFRoZSBvdGhlciBzaWRlIHdvdWxkIG5lZWQgdG8g
dGhlIHZDUFUgd2FzIAphY3R1YWxseSBydW5uaW5nIHRvIGF2b2lkIGRpc2FibGluZyB0aGUgUFBJ
IGZvciB0aGUgd3JvbmcgcENQVQogICAgIDIpIEtlZXAgdGhlIEhXIGludGVycnVwdCBhbHdheXMg
ZW5hYmxlZAoKV2UgcHJvcGFnYXRlZCB0aGUgZW5hYmxlL2Rpc2FibGUgYmVjYXVzZSBvZiBzb21l
IG1lc3N5IHBhcnQgaW4gdGhlIHZHSUM6CiAgICAgLSB2Z2ljX2luamVjdF9pcnEoKSB3aWxsIG5v
dCBxdWV1ZSBhbnkgcGVuZGluZyBpbnRlcnJ1cHQgaWYgdGhlIAp2Q1BVIGlzIG9mZmxpbmUuIFdo
aWxlIGludGVycnVwdCBjYW5ub3QgYmUgZGVsaXZlcmVkLCB3ZSBzdGlsbCBuZWVkIHRvIAprZWVw
IHRoZW0gcGVuZGluZyBhcyB0aGV5IHdpbGwgbmV2ZXIgb2NjdXIgYWdhaW4gb3RoZXJ3aXNlLiBU
aGlzIGlzIApiZWNhdXNlIHRoZXkgYXJlIGFjdGl2ZSBvbiB0aGUgaG9zdCBzaWRlIGFuZCB0aGUg
Z3Vlc3QgaGFzIG5vIHdheSB0byAKZGVhY3RpdmF0ZSB0aGVtLgogICAgIC0gT3VyIGltcGxlbWVu
dGF0aW9uIG9mIFBTQ0kgQ1BVIHdpbGwgcmVtb3ZlIGFsbCBwZW5kaW5nIGludGVycnVwdHMgCihz
ZWUgdmdpY19jbGVhcl9wZW5kaW5nX2lycXMoKSkuIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgdGhl
IGltcGxpY2F0aW9uIApoZXJlIGJlY2F1c2Ugb2YgdGhlIHByZXZpb3VzLgoKVGhlcmUgYXJlIGEg
cHJvYmFibHkgbW9yZS4gQXNpZGUgdGhlIGlzc3VlcyB3aXRoIGl0LCBJIGRvbid0IHJlYWxseSBz
ZWUgCmdvb2QgYWR2YW50YWdlIHRvIHByb3BhZ2F0ZSB0aGUgaW50ZXJydXB0IHN0YXRlIGFzIHRo
ZSBpbnRlcnJ1cHRzIChQUElzLCAKU1BJcykgaGF2ZSBhY3RpdmUgc3RhdGUuIFNvIHRoZXkgY2Fu
IG9ubHkgYmUgcmVjZWl2ZWQgb25jZSB1bnRpbCB0aGUgCmd1ZXN0IGFjdHVhbGx5IGhhbmRsZXMg
aXQuCgpTbyBteSBwcmVmZXJlbmNlIHdvdWxkIHN0aWxsIGJlIDIpIGJlY2F1c2UgdGhpcyBtYWtl
cyB0aGUgY29kZSBzaW1wbGVyLCAKYXZvaWQgSVBJIGFuZCBvdGhlciBwb3RlbnRpYWwgbG9ja2lu
ZyB0cm91YmxlLgoKT24gYSBzaWRlIG5vdGUsIHRoZXJlIGFyZSBtb3JlIGlzc3VlcyB3aXRoIGVu
YWJsZS9kaXNhYmxlIG9uIHRoZSBjdXJyZW50IAp2R0lDIGFzIGEgcGVuZGluZyBpbnRlcnJ1cHQg
YWxyZWFkeSBpbiB0aGUgTFIgd2lsbCBub3QgZ2V0IGRyb3BwZWQuLi4KCkFsbCBvZiB0aGlzIGlz
IHF1aXRlIG5hc3R5LiBUaGUgc29vbmVyIHRoZSBuZXcgdkdJQyBpcyBmaW5pc2hlZCB0aGUgCnNv
b25lciB3ZSBjYW4ga2lsbCB0aGUgY3VycmVudCBvbmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
