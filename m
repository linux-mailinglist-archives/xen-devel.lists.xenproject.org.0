Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D071329FA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:24:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqgN-0008Ac-CY; Tue, 07 Jan 2020 15:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioqgM-0008AX-BL
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 15:22:10 +0000
X-Inumbo-ID: 73c3f89c-3161-11ea-bf56-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73c3f89c-3161-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 15:22:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C129BB204;
 Tue,  7 Jan 2020 15:22:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <145d6e59-b50e-b617-cbb5-48ebed002c23@suse.com>
Date: Tue, 7 Jan 2020 16:21:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106155423.9508-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/6] x86/boot: Map the trampoline as
 read-only
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgZWM5MmZjZDFk
MDgsIHdoaWNoIGNhdXNlZCB0aGUgdHJhbXBvbGluZSBHRFQgQWNjZXNzIGJpdHMgdG8gYmUgc2V0
LAo+IHJlbW92ZWQgdGhlIGZpbmFsIHdyaXRlcyB3aGljaCBvY2N1cnJlZCBiZXR3ZWVuIGVuYWJs
aW5nIHBhZ2luZyBhbmQgc3dpdGNoaW5nCj4gdG8gdGhlIGhpZ2ggbWFwcGluZ3MuICBUaGVyZSBk
b24ndCBwbGF1c2libHkgbmVlZCB0byBiZSBhbnkgbWVtb3J5IHdyaXRlcyBpbgo+IGZldyBpbnN0
cnVjdGlvbnMgaXMgdGFrZXMgdG8gcGVyZm9ybSB0aGlzIHRyYW5zaXRpb24uCj4gCj4gQXMgYSBj
b25zZXF1ZW5jZSwgd2UgY2FuIHJlbW92ZSB0aGUgUldYIG1hcHBpbmcgb2YgdGhlIHRyYW1wb2xp
bmUuICBJdCBpcyBSWAo+IHZpYSBpdHMgaWRlbnRpdHkgbWFwcGluZyBiZWxvdyAxTSwgYW5kIFJX
IHZpYSB0aGUgZGlyZWN0bWFwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKPiBUaGlzIHByb2JhYmx5IHdhbnRzIGJhY2twb3J0aW5nLCBhbG9uZ3Np
ZGUgZWM5MmZjZDFkMDggaWYgaXQgaGFzbid0IHlldC4KClRoaXMgaXMganVzdCBjbGVhbnVwLCBs
YXJnZWx5IGNvc21ldGljIGluIG5hdHVyZS4gSXQgY291bGQgYmUgYXJndWVkCnRoYXQgb25jZSB0
aGUgZGlyZWN0bWFwIGhhcyBkaXNhcHBlYXJlZCB0aGlzIGNhbiBzZXJ2ZSBhcyBhZGRpdGlvbmFs
CnByb29mIHRoYXQgdGhlIHRyYW1wb2xpbmUgcmFuZ2UgaGFzIG5vIChpbnRlbmRlZCkgd3JpdGFi
bGUgbWFwcGluZ3MKYW55bW9yZSwgYnV0IHByaW9yIHRvIHRoYXQgcG9pbnQgSSBkb24ndCBzZWUg
bXVjaCBmdXJ0aGVyIGJlbmVmaXQuCkNvdWxkIHlvdSBleHBhbmQgb24gdGhlIHJlYXNvbnMgd2h5
IHlvdSBzZWUgYm90aCBhcyBiYWNrcG9ydGluZwpjYW5kaWRhdGVzPwoKCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
