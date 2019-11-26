Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C2109FBA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbMA-0005Jo-QQ; Tue, 26 Nov 2019 13:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFuF=ZS=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZbM9-0005Jj-UI
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:58:17 +0000
X-Inumbo-ID: cb6ddb2c-1054-11ea-a3a2-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb6ddb2c-1054-11ea-a3a2-12813bfff9fa;
 Tue, 26 Nov 2019 13:58:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z19so3432286wmk.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 05:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W+ozjnByI0QGye/C7b5rvOgcAGUhNfJUqP/YDulklZ0=;
 b=Z49DB8e5we9jSD55N8uB+DTYRDziuMRePisAmiE01PYHAhOtIdQuf58t8+svSXlg9o
 pgo5xiP9WdPh8RoPMKovh/Bk7oOWeXxHUnYTdg3sYNsRtceAPeaPNWoECU8Oz862CktI
 rp/LBX8BaY0tufFNmX6Wx5axbIg6HpYkrz22IKaL71utU1OaASL6zsFKO3xf2s+aOuVR
 9ww6o3XKqNQTottGLCnIuADVFVftucTbQK3k17KIggGUrbHafsjpWfcwKzfsHiiUSQga
 jAeEbts2XV8//PzaXvxUVbCy+m0nAta2plqVmj9duM8yjMywyNaQituqYkiEMToMD7Nd
 FMuQ==
X-Gm-Message-State: APjAAAU6NdMF8Y524cTX5CS/kejfJ2l+1MaJdKZuuGyr3i/L3Et900tE
 uQqzKfR/mfvsY5mn9IZvfME=
X-Google-Smtp-Source: APXvYqxWzZ/VokNQkZnEXDkhBWa452jXvqUvKCMU46IpmCCiFUHosc2cGRn1razPJmc723RJ8Lr8aQ==
X-Received: by 2002:a1c:7507:: with SMTP id o7mr4250591wmc.163.1574776696054; 
 Tue, 26 Nov 2019 05:58:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id w11sm16184449wra.83.2019.11.26.05.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 05:58:15 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
 <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
 <alpine.DEB.2.21.1911251716500.8205@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <95bfb95f-701e-c1d8-4996-3e0fda030afc@xen.org>
Date: Tue, 26 Nov 2019 13:58:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911251716500.8205@sstabellini-ThinkPad-T480s>
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
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8xMS8yMDE5IDAxOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAyNSBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAoKyBBbmRyZSkKPj4KPj4g
T24gMjMvMTEvMjAxOSAyMDozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4g
T24gMTUvMTEvMjAxOSAyMDoxMCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+Pj4+IEFsbG93
IHZnaWNfZ2V0X2h3X2lycV9kZXNjIHRvIGJlIGNhbGxlZCB3aXRoIGEgdmNwdSBhcmd1bWVudC4K
Pj4+Pgo+Pj4+IFVzZSB2Y3B1IGFyZ3VtZW50IGluIHZnaWNfY29ubmVjdF9od19pcnEuCj4+Pj4K
Pj4+PiB2Z2ljX2Nvbm5lY3RfaHdfaXJxIGlzIGNhbGxlZCBmb3IgUFBJcyBhbmQgU1BJcywgbm90
IFNHSXMuIEVuZm9yY2Ugd2l0aAo+Pj4+IEFTU0VSVHMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+
Cj4+Pj4KPj4+PiAtLS0KPj4+PiB2MzogbmV3IHBhdGNoCj4+Pj4KPj4+PiAtLS0KPj4+PiBOb3Rl
OiBJIGhhdmUgb25seSBtb2RpZmllZCB0aGUgb2xkIHZnaWMgdG8gYWxsb3cgZGVsaXZlcnkgb2Yg
UFBJcy4KPj4+Cj4+PiBUaGUgbmV3IHZHSUMgc2hvdWxkIGFsc28gYmUgbW9kaWZpZWQgdG8gc3Vw
cG9ydCBkZWxpdmVyeSBvZiBQUElzLgo+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLmMKPj4+PiBpbmRleCA4MmY1MjRhMzVjLi5jMzkz
M2MyNjg3IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMKPj4+PiArKysgYi94
ZW4vYXJjaC9hcm0vdmdpYy5jCj4+Pj4gQEAgLTQxMCwxMCArNDEwLDEwIEBAIHZvaWQgdmdpY19l
bmFibGVfaXJxcyhzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgciwKPj4+PiBpbnQgbikKPj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXJxX3NldF9hZmZpbml0eShwLT5kZXNjLCBjcHVt
YXNrX29mKHZfdGFyZ2V0LT5wcm9jZXNzb3IpKTsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJnAtPmRlc2MtPmxvY2ssIGZsYWdzKTsKPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogVGhlIGlycSBjYW5ub3QgYmUgYSBQUEksIHdlIG9ubHkgc3VwcG9ydCBkZWxpdmVyeSBvZiBT
UElzCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRvIGd1ZXN0cy4KPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVGhlIGlycSBjYW5ub3QgYmUgYSBTR0ksIHdlIG9ubHkg
c3VwcG9ydCBkZWxpdmVyeSBvZiBTUElzCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IGFuZCBQUElzIHRvIGd1ZXN0cy4KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
Lwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVChpcnEgPj0gMzIpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVChpcnEgPj0gTlJfU0dJUyk7Cj4+Pgo+Pj4gV2Ug
dXN1YWxseSBwdXQgQVNTRVJUKCkgaW4gcGxhY2Ugd2Uga25vdyB0aGF0IGNvZGUgd291bGRuJ3Qg
YmUgYWJsZSB0byB3b3JrCj4+PiBjb3JyZWN0bHkgaWYgdGhlcmUgQVNTRVJUIHdlcmUgaGl0LiBJ
biB0aGlzIHBhcnRpY3VsYXIgY2FzZToKPj4+Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICggaXJxX3R5cGVfc2V0X2J5X2RvbWFpbihkKSApCj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2ljX3NldF9pcnFfdHlwZShwLT5kZXNjLCB2Z2ljX2dldF92
aXJxX3R5cGUodiwgbiwgaSkpOwo+Pj4KPj4+IDEpIFdlIGRvbid0IHdhbnQgdG8gYWxsb3cgYW55
IGRvbWFpbiAoaW5jbHVkaW5nIERvbTApIHRvIG1vZGlmeSB0aGUKPj4+IGludGVycnVwdCB0eXBl
IChpLmUuIGxldmVsL2VkZ2UpIGZvciBQUElzIGFzIHRoaXMgaXMgc2hhcmVkLiBZb3Ugd2lsbCBh
bHNvCj4+PiBtb3N0IGxpa2VseSBuZWVkIHRvIG1vZGlmeSB0aGUgY291bnRlcnBhcnQgaW4gc2V0
dXBfZ3Vlc3RfaXJxKCkuCj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwLT5k
ZXNjLT5oYW5kbGVyLT5lbmFibGUocC0+ZGVzYyk7Cj4+Pgo+Pj4gMikgT24gR0lDdjMsIHRoZSBy
ZS1kaXN0cmlidXRvciBvZiB2Q1BVIEEgaXMgYWNjZXNzaWJsZSBieSB2Q1BVIEIuIFNvIHZDUFUg
Qgo+Pj4gY291bGQgZW5hYmxlIHRoZSBTR0kgZm9yIHZDUFUgQS4gQnV0IHRoaXMgd291bGQgYmUg
Y2FsbGVkIG9uIHRoZSB3cm9uZyBwQ1BVCj4+PiBsZWFkaW5nIHRvIGluY29uc2lzdGVuY3kgYmV0
d2VlbiB0aGUgaGFyZHdhcmUgc3RhdGUgb2YgdGhlIGludGVybmFsIHZHSUMKPj4+IHN0YXRlLgo+
IAo+IElzIGl0IGFjdHVhbGx5IG1lYW50IHRvIHdvcmsgZnJvbSBhIEdJQyBzcGVjaWZpY2F0aW9u
IHBlcnNwZWN0aXZlPyBJdAo+IHNvdW5kcyAid3JvbmciIHNvbWVob3cgdG8gbWUsIGJ1dCBJIHdl
bnQgdGhyb3VnaCB0aGUgc3BlYyBhbmQgaXQgZG9lc24ndAo+IHNheSBleHBsaWNpdGx5IHRoYXQg
Y3B1QiBjb3VsZG4ndCBlbmFibGUgYSBTR0kvUFBJIG9mIGNwdUEuIEkgYW0gc3RpbGwKPiBhIGJp
dCBzaG9ja2VkIGJ5IHRoaXMgcmV2ZWxhdGlvbi4KClRvIGJlIGhvbmVzdCwgSSBjYW4gc2VlIHJl
YXNvbiB0byBhbGxvdyB0aGlzIGJ1dCB0aGlzIGlzIGEgZGlmZmVyZW50IApzdWJqZWN0LgoKSW4g
dGhpcyBjYXNlIHRoZSByZS1kaXN0cmlidXRvciBpcyBwZXItQ1BVIGFuZCBjYW4gYWNjZXNzaWJs
ZSBieSBhbnkgCkNQVS4gRm9yIGluc3RhbmNlLCBMaW51eCB3aWxsIGFjY2VzcyBpdCB0byBmaW5k
IHRoZSByZS1kaXN0cmlidXRvciAKYXNzb2NpYXRlZCB0byBhIGdpdmVuIENQVSBhdCBib290LgoK
RldJVywgdGhlIHZHSUMgaW1wbGVtZW50YXRpb24gaW4gS1ZNIGhhbmRsZXMgaXQgdGhlIHNhbWUg
d2F5LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
