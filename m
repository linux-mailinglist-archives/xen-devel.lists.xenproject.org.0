Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB1FCECA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 20:34:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVKrO-0004n8-7v; Thu, 14 Nov 2019 19:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNlm=ZG=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1iVKrM-0004mx-Qd
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 19:32:52 +0000
X-Inumbo-ID: 7e636ce0-0715-11ea-b678-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7e636ce0-0715-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 19:32:51 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>, "Julien Grall
 <julien.grall@arm.com>Stefano Stabellini" <sstabellini@kernel.org>
Message-ID: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
Date: Thu, 14 Nov 2019 14:33:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [172.27.13.171]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] arm/vtimer: Physical timer emulation and the physical
 counter
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpJJ20gd29ya2luZyBvbiBhIHBvcnQgb2YgYSBSVE9TIChSVEVNUykgdG8gWGVuIG9u
IEFSTSwgYW5kIGNhbWUgYWNyb3NzIGFuCmludGVyZXN0aW5nIGZpbmRpbmcgaW4gaG93IFhlbiBl
bXVsYXRlcyB0aGUgcGh5c2ljYWwgdGltZXIgb24gQVJNLgoKSW4gdGVzdGluZyBkaWZmZXJlbnQg
Y29uZmlndXJhdGlvbnMgb2YgdGhlIHBvcnQsIEkgaGF2ZSB0aGUgUlRPUyBjb25maWd1cmVkIHRv
CnVzZSB0aGUgQVJNIGdlbmVyaWMgcGh5c2ljYWwgdGltZXIuIFRoZSBkcml2ZXIgb3BlcmF0ZXMg
dGhlIHBoeXNpY2FsIHRpbWVyIGluCnRoZSAiQ29tcGFyZVZpZXciIG1vZGUsIHdoZXJlIHRoZSB0
aW1lciBjb25kaXRpb24gaXMgbWV0IHdoZW4gdGhlIHBoeXNpY2FsCmNvdW50ZXIgcmVhY2hlcyB0
aGUgcHJvZ3JhbW1lZCBDb21wYXJlVmFsdWUuCgpUaGUgZHJpdmVyIGluaXRpYWxpemVzIHRoZSBw
aHlzaWNhbCB0aW1lciBieSBmaXJzdCByZWFkaW5nIHRoZSBwaHlzaWNhbCBjb3VudGVyCnJlZ2lz
dGVyIENOVFBDVCwgYWRkaW5nIHRoZSBzeXN0aWNrIGludGVydmFsLCBhbmQgdGhlbiB3cml0aW5n
IHRoZSByZXN1bHQgdG8gdGhlCkNvbXBhcmVWYWx1ZSByZWdpc3RlciBDTlRQX0NWQUwuIFRoaXMg
YXBwZWFycyB0byBiZSB2YWxpZCBiZWhhdmlvciBiYXNlZCBvbiBteQp1bmRlcnN0YW5kaW5nIG9m
IHRoZSBBUk1WOCBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCwgc2luY2UgdGhlIHBoeXNp
Y2FsCnRpbWVyICJvZmZzZXQiIGlzIHNwZWNpZmllZCB0byBiZSB6ZXJvLgoKWGVuIHdpbGwgdHJh
cCBhY2Nlc3NlcyB0byB0aGUgcGh5c2ljYWwgdGltZXIgcmVnaXN0ZXJzIC0gQ05UUF9DVEwsIENO
VFBfQ1ZBTCwKYW5kIENOVFBfVFZBTCwgd2hpY2ggaGFwcGVucyBpbiB4ZW4vYXJjaC9hcm0vdnRp
bWVyLmMuIFhlbiB3aWxsIGFkZCBvciByZW1vdmUgYW4Kb2Zmc2V0IHBoeXNfdGltZXJfYmFzZS5v
ZmZzZXQgd2hlbiByZWFkaW5nIG9yIHdyaXRpbmcgdG8gdGhlIENOVFBfQ1ZBTC9DTlRQX1RWQUwK
cmVnaXN0ZXJzLiBUaGlzIG9mZnNldCBpcyBkZXRlcm1pbmVkIHdoZW4gdGhlIHZ0aW1lciBpcyBp
bml0aWFsaXplZCBvbiBndWVzdApjcmVhdGlvbi4KCkhvd2V2ZXIsIFhlbiBkb2VzIG5vdCB0cmFw
IGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgY291bnRlciByZWdpc3RlciBDTlRQQ1QuIFRoaXMKbWVh
bnMgdGhlIGd1ZXN0IGhhcyBkaXJlY3QgYWNjZXNzIHRvIHRoZSByZWdpc3Rlci4gSXQgYWxzbyBt
ZWFucyB0aGUgb2Zmc2V0IGlzCm5vdCBhcHBsaWVkIGhlcmUuIEkgYmVsaWV2ZSB0aGlzIGlzIGEg
cHJvYmxlbSwgYmVjYXVzZSB0aGUgcGh5c2ljYWwgdGltZXIgaXMgbm8KbG9uZ2VyIGNvbnNpc3Rl
bnQgd2l0aCB0aGUgcGh5c2ljYWwgY291bnRlciBmcm9tIHRoZSBndWVzdCdzIHBlcnNwZWN0aXZl
IC0gdGhlcmUKaXMgYSBub24temVybywgdW5rbm93biBvZmZzZXQgYmV0d2VlbiB0aGUgdHdvLgoK
VGhpcyB3YXMgYSBwcm9ibGVtIGZvciB0aGUgUlRPUywgc2luY2UgaXQgd2FzIHJlYWRpbmcgdGhl
IHBoeXNpY2FsIGNvdW50ZXIKcmVnaXN0ZXIgKFhlbiBkb2VzIG5vdCBhcHBseSBhbiBvZmZzZXQp
LCBhZGRpbmcgc29tZSBpbnRlcnZhbCwgYW5kIHRoZW4gc2V0dGluZwp0aGUgQ29tcGFyZVZhbHVl
IHJlZ2lzdGVyIChYZW4gYXBwbGllcyB0aGUgb2Zmc2V0KSwgcmVzdWx0aW5nIGluIGEgbG9uZyBk
ZWxheQpiZWZvcmUgdGhlIHRpbWVyIGV4cGlyZXMuCgpJIHdhcyBhYmxlIHRvIGZpeCB0aGlzIGJ5
IGFkZGluZyBjb2RlIGluIFhlbiB0byB0cmFwIGFjY2VzcyB0byBDTlRQQ1QgYW5kCmFwcGx5aW5n
IHRoZSBvZmZzZXQgLSBJIGNhbiBzdWJtaXQgdGhlIHBhdGNoIGlmIHRoZXJlIGlzIGludGVyZXN0
LiBIb3dldmVyLCBJCndhcyBjdXJpb3VzIGlmIHRoZXJlIHdhcyBhbiByZWFzb24gZm9yIG5vdCB0
cmFwcGluZy8gZW11bGF0aW5nIGFjY2VzcyB0byB0aGUKcGh5c2ljYWwgY291bnRlciByZWdpc3Rl
ciBhbmQgYXBwbHlpbmcgdGhlIG9mZnNldD8KClNpbmNlcmVseSwKSmVmZiBLdWJhc2NpawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
