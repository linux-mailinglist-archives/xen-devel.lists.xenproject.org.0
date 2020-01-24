Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC0149099
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 23:00:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv6y2-0005V9-JZ; Fri, 24 Jan 2020 21:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3WdY=3N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iv6y1-0005V4-PR
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 21:58:17 +0000
X-Inumbo-ID: 9fd15aa6-3ef4-11ea-80ea-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fd15aa6-3ef4-11ea-80ea-12813bfff9fa;
 Fri, 24 Jan 2020 21:58:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so3820053wrr.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 13:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNwNeSGE3G6tsavsdKCYpsGq+MsngJNgysbp+6RjZd8=;
 b=hCdsvJYN+vA753TPE4CusAwpm0L4uefanl5CK7vPvmb3JJCRygVSAdo9nGLoPIJl7f
 UbgSaL9ZLfSJaqvu2ZiY3LQE191pGbjqJnIr/865mUzgkpriMS0Pdjem+Ti/Rz5k3ODs
 3rXElFB9DTQBX5USzBDpU5rVBt4p6GHQ/QAS1JVcfoitTbGOXY/KWrHerVJyv1j/bRfm
 sA13YOFs4JzHUIAetfgVSO79HlhCoji5jO2uonPrWjPMxUmBRlLLVjCIIcvk4ZlfjPa5
 GsFHrKpClM5BiU7y9emFdGAtvpcHwFE8+gI6FUYUQtyiuyQ6HJG/X8K3bJz0SsI+Cfg+
 PlVA==
X-Gm-Message-State: APjAAAXsHXwZ6KXZhAR0oj3JZnSB/xLF54pwiBpng/G6Q9Rg0/nzhydo
 FHk4MzUulqKnK1Xq6cL7IhU=
X-Google-Smtp-Source: APXvYqxsJDMvKXTigHtxUXQ4dG7qHaxn5GCk0g+m7sUJhCFtrYOoVPL5aWpAJ7NkXxPTUP9r0INP6Q==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr7019333wrr.172.1579903095819; 
 Fri, 24 Jan 2020 13:58:15 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id f1sm9155666wrp.93.2020.01.24.13.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 13:58:15 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
 <20200121150704.126001-2-jeff.kubascik@dornerworks.com>
 <78db27b5-ab04-904a-f2b8-869969fbae21@xen.org>
 <a6a4d197-c511-d7ed-c137-4d5f05f098de@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b2394ca2-60f1-d3ac-f19f-fb8ffbb0e8bd@xen.org>
Date: Fri, 24 Jan 2020 21:58:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a6a4d197-c511-d7ed-c137-4d5f05f098de@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: remove physical timer offset
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC8wMS8yMDIwIDIxOjQzLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IE9uIDEvMjMvMjAy
MCA3OjMyIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyMS8wMS8yMDIw
IDE1OjA3LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+Pj4gVGhlIHBoeXNpY2FsIHRpbWVyIHRyYXBz
IGFwcGx5IGFuIG9mZnNldCBzbyB0aGF0IHRpbWUgc3RhcnRzIGF0IDAgZm9yCj4+PiB0aGUgZ3Vl
c3QuIEhvd2V2ZXIsIHRoaXMgb2Zmc2V0IGlzIG5vdCBjdXJyZW50bHkgYXBwbGllZCB0byB0aGUg
cGh5c2ljYWwKPj4+IGNvdW50ZXIuIFBlciB0aGUgQVJNdjggUmVmZXJlbmNlIE1hbnVhbCAoQVJN
IERESSAwNDg3RS5hKSwgc2VjdGlvbgo+Pj4gRDExLjIuNCBUaW1lcnMsIHRoZSAiT2Zmc2V0IiBi
ZXR3ZWVuIHRoZSBjb3VudGVyIGFuZCB0aW1lciBzaG91bGQgYmUKPj4+IHplcm8gZm9yIGEgcGh5
c2ljYWwgdGltZXIuIFRoaXMgcmVtb3ZlcyB0aGUgb2Zmc2V0IHRvIG1ha2UgdGhlIHRpbWVyIGFu
ZAo+Pj4gY291bnRlciBjb25zaXN0ZW50Lgo+Pj4KPj4+IFRoaXMgYWxzbyBjbGVhbnMgdXAgdGhl
IHBoeXNpY2FsIHRpbWVyIGltcGxlbWVudGF0aW9uIHRvIGJldHRlciBtYXRjaAo+Pj4gdGhlIHZp
cnR1YWwgdGltZXIgLSBib3RoIGN2YWwncyBub3cgaG9sZCB0aGUgaGFyZHdhcmUgdmFsdWUuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3
b3Jrcy5jb20+Cj4+PiAtLS0KPj4+ICAgIHhlbi9hcmNoL2FybS92dGltZXIuYyAgICAgICAgfCAz
NCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4+PiAgICB4ZW4vaW5jbHVkZS9h
c20tYXJtL2RvbWFpbi5oIHwgIDMgLS0tCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vdnRpbWVyLmMgYi94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPj4+IGluZGV4IDI0MGE4NTBiNmUu
LjBjNzhhNjU4NjMgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPj4+ICsr
KyBiL3hlbi9hcmNoL2FybS92dGltZXIuYwo+Pj4gQEAgLTYyLDcgKzYyLDYgQEAgc3RhdGljIHZv
aWQgdmlydF90aW1lcl9leHBpcmVkKHZvaWQgKmRhdGEpCj4+Pgo+Pj4gICAgaW50IGRvbWFpbl92
dGltZXJfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmln
ICpjb25maWcpCj4+PiAgICB7Cj4+PiAtICAgIGQtPmFyY2gucGh5c190aW1lcl9iYXNlLm9mZnNl
dCA9IE5PVygpOwo+Pj4gICAgICAgIGQtPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCA9IFJF
QURfU1lTUkVHNjQoQ05UUENUX0VMMCk7Cj4+PiAgICAgICAgZC0+dGltZV9vZmZzZXQuc2Vjb25k
cyA9IHRpY2tzX3RvX25zKGQtPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAtIGJvb3RfY291
bnQpOwo+Pj4gICAgICAgIGRvX2RpdihkLT50aW1lX29mZnNldC5zZWNvbmRzLCAxMDAwMDAwMDAw
KTsKPj4+IEBAIC0xMDgsNyArMTA3LDYgQEAgaW50IHZjcHVfdnRpbWVyX2luaXQoc3RydWN0IHZj
cHUgKnYpCj4+Pgo+Pj4gICAgICAgIGluaXRfdGltZXIoJnQtPnRpbWVyLCBwaHlzX3RpbWVyX2V4
cGlyZWQsIHQsIHYtPnByb2Nlc3Nvcik7Cj4+PiAgICAgICAgdC0+Y3RsID0gMDsKPj4+IC0gICAg
dC0+Y3ZhbCA9IE5PVygpOwo+Pj4gICAgICAgIHQtPmlycSA9IGQwCj4+PiAgICAgICAgICAgID8g
dGltZXJfZ2V0X2lycShUSU1FUl9QSFlTX05PTlNFQ1VSRV9QUEkpCj4+PiAgICAgICAgICAgIDog
R1VFU1RfVElNRVJfUEhZU19OU19QUEk7Cj4+PiBAQCAtMTY3LDYgKzE2NSw3IEBAIHZvaWQgdmly
dF90aW1lcl9yZXN0b3JlKHN0cnVjdCB2Y3B1ICp2KQo+Pj4gICAgc3RhdGljIGJvb2wgdnRpbWVy
X2NudHBfY3RsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJfdCAqciwgYm9vbCBy
ZWFkKQo+Pj4gICAgewo+Pj4gICAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKPj4+ICsg
ICAgc190aW1lX3QgZXhwaXJlczsKPj4+Cj4+PiAgICAgICAgaWYgKCAhQUNDRVNTX0FMTE9XRUQo
cmVncywgRUwwUFRFTikgKQo+Pj4gICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+PiBAQCAtMTg0
LDggKzE4Myw5IEBAIHN0YXRpYyBib29sIHZ0aW1lcl9jbnRwX2N0bChzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncywgdWludDMyX3QgKnIsIGJvb2wgcmVhZCkKPj4+Cj4+PiAgICAgICAgICAgIGlm
ICggdi0+YXJjaC5waHlzX3RpbWVyLmN0bCAmIENOVHhfQ1RMX0VOQUJMRSApCj4+PiAgICAgICAg
ICAgIHsKPj4+IC0gICAgICAgICAgICBzZXRfdGltZXIoJnYtPmFyY2gucGh5c190aW1lci50aW1l
ciwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgdi0+YXJjaC5waHlzX3RpbWVyLmN2YWwgKyB2
LT5kb21haW4tPmFyY2gucGh5c190aW1lcl9iYXNlLm9mZnNldCk7Cj4+PiArICAgICAgICAgICAg
ZXhwaXJlcyA9IHYtPmFyY2gucGh5c190aW1lci5jdmFsID4gYm9vdF9jb3VudAo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICA/IHRpY2tzX3RvX25zKHYtPmFyY2gucGh5c190aW1lci5jdmFsIC0g
Ym9vdF9jb3VudCkgOiAwOwo+Pj4gKyAgICAgICAgICAgIHNldF90aW1lcigmdi0+YXJjaC5waHlz
X3RpbWVyLnRpbWVyLCBleHBpcmVzKTsKPj4KPj4gV2hpbGUgdGhlIGZhY3RvcmluZyB3YXMgb3B0
aW9uYWwsIG15IHJlcXVlc3Qgb2YgYSBjb21tZW50IHdhc24ndCAoZXZlbgo+PiBpZiBpdCByZXF1
aXJlcyB0byBkdXBsaWNhdGUgMyB0aW1lcykuCj4gCj4gVW5kZXJzdG9vZC4KPiAKPj4gSWYgeW91
IHN1Z2dlc3QgYSBjb21tZW50IGFuZCBhbiB1cGRhdGUgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLCBJ
IGNhbgo+PiBtZXJnZSBpdCBpbiB0aGlzIHBhdGNoIG9uIGNvbW1pdC4KPiAKPiBGb3IgdGhlIGNv
bW1lbnQ6Cj4gCj4gLyogSWYgY3ZhbCBpcyBiZWZvcmUgdGhlIHBvaW50IFhlbiBzdGFydGVkLCBl
eHBpcmUgdGltZXIgaW1tZWRpYXRlbHkgKi8KPiAKPiBGb3IgdGhlIGNvbW1pdCBtZXNzYWdlOgo+
IAo+IEluIHRoZSBjYXNlIHRoZSBndWVzdCBzZXRzIGN2YWwgdG8gYSB0aW1lIGJlZm9yZSBYZW4g
c3RhcnRlZCwgdGhlIGNvcnJlY3QKPiBiZWhhdmlvciBpcyB0byBleHBpcmUgdGhlIHRpbWVyIGlt
bWVkaWF0ZWx5LiBUbyBkbyB0aGlzLCB3ZSBzZXQgdGhlIGV4cGlyZXMKPiBhcmd1bWVudCBvZiBz
ZXRfdGltZXIgdG8gemVyby4KCkl0IGxvb2tzIGdvb2QgdG8gbWUsIEkgd2lsbCBjb21taXQgdGhl
IHNlcmllcyBvbiBNb25kYXkuIFRoYW5rcyEKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
