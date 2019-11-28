Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16D10CCF1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:42:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMp8-0002Ac-6U; Thu, 28 Nov 2019 16:39:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaMp7-0002AX-3o
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:39:21 +0000
X-Inumbo-ID: a03a72c6-11fd-11ea-a3d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a03a72c6-11fd-11ea-a3d5-12813bfff9fa;
 Thu, 28 Nov 2019 16:39:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF794B19D;
 Thu, 28 Nov 2019 16:39:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191128114414.21716-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c7c842d-66b2-eed0-d381-8d9b28a70665@suse.com>
Date: Thu, 28 Nov 2019 17:39:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128114414.21716-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] x86/svm: Correct vm_event API for
 descriptor accesses
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Adrian Pop <apop@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMjo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgZDBhNjk5YTM4
OWYxICJ4ODYvbW9uaXRvcjogYWRkIHN1cHBvcnQgZm9yIGRlc2NyaXB0b3IgYWNjZXNzIGV2ZW50
cyIKPiBpbnRyb2R1Y2VkIGxvZ2ljIGxvb2tpbmcgZm9yIHdoYXQgYXBwZWFyZWQgdG8gYmUgZXhp
dGluZm8gKG5vdCB0aGF0IHRoaXMKPiBleGlzdHMgaW4gU1ZNIC0gZXhpdGluZm8xIG9yIDIgZG8p
LCBidXQgYWN0dWFsbHkgcGFzc2VkIHRoZSBleGl0IElEVCB2ZWN0b3JpbmcKPiBpbmZvcm1hdGlv
bi4gIFRoZXJlIGlzIG5ldmVyIGFueSBJRFQgdmVjdG9yaW5nIGludm9sdmVkIGluIHRoZXNlIGlu
dGVyY2VwdHMgc28KPiB0aGUgdmFsdWUgcGFzc2VkIGlzIGFsd2F5cyB6ZXJvLgo+IAo+IEluIGZh
Y3QsIFNWTSBkb2Vzbid0IHByb3ZpZGUgYW55IGluZm9ybWF0aW9uLCBldmVuIGluIGV4aXRpbmZv
MSBhbmQgMi4gIE5vdGUKPiB0aGUgZXJyb3IgaW4gdGhlIHB1YmxpYyBBUEkgYW5kIHN0YXRlIHRo
YXQgdGhpcyBmaWVsZCBpcyBhbHdheXMgMCwgYW5kIGRyb3AKPiB0aGUgU1ZNIGxvZ2ljIGluIGh2
bV9tb25pdG9yX2Rlc2NyaXB0b3JfYWNjZXNzKCkuCj4gCj4gSW4gdGhlIFNWTSB2bWV4aXQgaGFu
ZGxlciBpdHNlbGYsIG9wdGltaXNlIHRoZSBzd2l0Y2ggc3RhdGVtZW50IGJ5IG9ic2VydmluZwo+
IHRoYXQgdGhlcmUgaXMgYSBsaW5lYXIgdHJhbnNmb3JtYXRpb24gYmV0d2VlbiB0aGUgU1ZNIGV4
aXRfcmVhc29uIGFuZAo+IFZNX0VWRU5UX0RFU0NfKiB2YWx1ZXMuICAoQmxvYXQtby1tZXRlciBy
ZXBvcnRzIDYwMjggPT4gNTg3NyBmb3IgYSBzYXZpbmcgb2YKPiAxNTEgYnl0ZXMpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpT
Vk0gcGFydCBvZiB0aGUgY2hhbmdlCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
