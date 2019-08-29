Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5945A1B29
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 15:15:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3KEa-0003JR-SP; Thu, 29 Aug 2019 13:13:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3KEZ-0003JM-PU
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:13:03 +0000
X-Inumbo-ID: bac35ef0-ca5e-11e9-ae67-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bac35ef0-ca5e-11e9-ae67-12813bfff9fa;
 Thu, 29 Aug 2019 13:13:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 926BBAEFF;
 Thu, 29 Aug 2019 13:13:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <f42b05e7-22de-64b0-0486-c087bde57747@suse.com>
 <95c5ada0-5b77-072f-7ad5-c78c20c3f760@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d96c8af0-f70f-03ad-c058-c1f46114846a@suse.com>
Date: Thu, 29 Aug 2019 15:13:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95c5ada0-5b77-072f-7ad5-c78c20c3f760@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: properly gate clearing of PKU feature
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMjo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wOC8yMDE5
IDEwOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gc2V0dXBfY2xlYXJfY3B1X2NhcCgpIGlzIF9f
aW5pdCBhbmQgaGVuY2UgbWF5IG5vdCBiZSBjYWxsZWQgcG9zdC1ib290Lgo+PiBOb3RlIHRoYXQg
b3B0X3BrdSBuZXZlcnRoZWxlc3MgaXMgbm90IGdldHRpbmcgX19pbml0ZGF0YSBhZGRlZCAtIHNl
ZQo+PiBlLmcuIGNvbW1pdCA0M2ZhOTVhZTZhICgibW06IG1ha2Ugb3B0X2Jvb3RzY3J1YiBub24t
aW5pdCIpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gCj4gSG93ZXZlciwgSSdtIHRlbXB0ZWQgdG8gc3VnZ2VzdCB0aGF0IHRoaXMgbG9naWMg
ZGlzYXBwZWFycyBlbnRpcmVseS7CoAo+IEdpdmVuIHRoYXQgd2UgZG9uJ3Qgc3VwcG9ydCBpdCBm
b3IgUFYgZ3Vlc3RzLCBhbmQgY2FuJ3Qgd2l0aG91dCB0YWtpbmcgYQo+IENSNCB3cml0ZSBvbiB0
b2dnbGVfa2VybmVsX21vZGUoKSwgYWxsIHRoaXMgYWN0dWFsbHkgY29udHJvbHMgaXMgd2hldGhl
cgo+IHRoZSBiaXQgZmluZHMgaXRzIHdheSBpbnRvIHRoZSBIVk0gbWF4IHBvbGljeS4KCldlbGws
IGlmIHlvdSBtZWFuIHJlcGxhY2luZyBvcHRfcGt1IGJ5IGFuIGFkZGl0aW9uIHRvCnBhcnNlX3hl
bl9jcHVpZCgpLCB0aGVuIEknbGwgYmUgaGFwcHkgdG8gZG8gdGhhdCBhcyBhIGZvbGxvdy1vbi4K
SWYgdGhlcmUgaXMgYW5vdGhlciBkaXJlY3Rpb24geW91J3ZlIGJlZW4gY29uc2lkZXJpbmcsIHRo
ZW4KeW91J2QgaGF2ZSB0byBhdCBsZWFzdCBvdXRsaW5lIGl0LgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
