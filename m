Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD210B2D6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzgw-0002sC-MP; Wed, 27 Nov 2019 15:57:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZzgv-0002s2-Af
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:57:21 +0000
X-Inumbo-ID: 97dfb1c4-112e-11ea-a3b8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97dfb1c4-112e-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 15:57:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA1FAAE44;
 Wed, 27 Nov 2019 15:57:19 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191127154817.12103-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67e0c52f-6faf-675f-f9ef-3d235a6ef6dd@suse.com>
Date: Wed, 27 Nov 2019 16:57:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127154817.12103-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Joe Jin <joe.jin@oracle.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxNjo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
cG9zdGVkIGludGVycnVwdHMgb24gSW50ZWwgaGFyZHdhcmUgaXQncyBwb3NzaWJsZSB0aGF0IHRo
ZQo+IHZDUFUgcmVzdW1lcyBleGVjdXRpb24gd2l0aCBhIHN0YWxlIGxvY2FsIEFQSUMgSVJSIHJl
Z2lzdGVyIGJlY2F1c2UKPiBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdHMgdG8gYmUgaW5qZWN0
ZWQgdmxhcGljX2hhc19wZW5kaW5nX2lycQo+IG1pZ2h0IG5vdCBiZSBjYWxsZWQsIGFuZCB0aHVz
IFBJUiB3b24ndCBiZSBzeW5jZWQgaW50byBJUlIuCj4gCj4gRml4IHRoaXMgYnkgbWFraW5nIHN1
cmUgUElSIGlzIGFsd2F5cyBzeW5jZWQgdG8gSVJSIGluCj4gaHZtX3ZjcHVfaGFzX3BlbmRpbmdf
aXJxIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBpbnRlcnJ1cHRzIGFyZSBwZW5kaW5nLgo+IAo+IFJlcG9y
dGVkLWJ5OiBKb2UgSmluIDxqb2UuamluQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpPbiB0aGUgYXNzdW1wdGlvbiB0
aGF0IHRoaXMgd2lsbCB3b3JrIGZvciBKb2UgYXMgd2VsbCwKQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
