Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6D13C144
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:42:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhx0-0007Vh-U4; Wed, 15 Jan 2020 12:39:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irhwz-0007Vc-Cc
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:39:09 +0000
X-Inumbo-ID: 041a92e2-3794-11ea-8531-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 041a92e2-3794-11ea-8531-12813bfff9fa;
 Wed, 15 Jan 2020 12:39:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA689AD41;
 Wed, 15 Jan 2020 12:39:04 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <7938484e-14a0-8edf-635b-15b05af6dace@suse.com>
 <6f6064f9-5400-3d85-75c5-b63ca460383d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7951674e-1b8a-03b0-00b9-e7d7fe7eb10c@suse.com>
Date: Wed, 15 Jan 2020 13:39:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6f6064f9-5400-3d85-75c5-b63ca460383d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMzoyOCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTUvMDEvMjAy
MCAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjAxLjIwMjAgMjA6MzYsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gSWYgSVRTQyBpcyBub3QgYXZhaWxhYmxlIG9uIENQVSAoZS5n
IGlmIHJ1bm5pbmcgbmVzdGVkIGFzIFBWIHNoaW0pCj4+PiB0aGVuIFg4Nl9GRUFUVVJFX05PTlNU
T1BfVFNDIGlzIG5vdCBhZHZlcnRpc2VkIGluIGNlcnRhaW4gY2FzZXMsIGkuZS4KPj4+IGFsbCBB
TUQgYW5kIHNvbWUgb2xkIEludGVsIHByb2Nlc3NvcnMuIEluIHdoaWNoIGNhc2UgVFNDIHdvdWxk
IG5lZWQgdG8KPj4+IGJlIHJlc3RvcmVkIG9uIENQVSBmcm9tIHBsYXRmb3JtIHRpbWUgYnkgWGVu
IHVwb24gZXhpdGluZyBkZWVwIEMtc3RhdGVzLgo+Pgo+PiBIb3cgZG9lcyB3YWtpbmcgZnJvbSBk
ZWVwIEMgc3RhdGVzIGNvcnJlc3BvbmQgdG8gdGhlIFBWIHNoaW0/IEkgbm90aWNlCj4+IHRoYXQg
Y3N0YXRlX3Jlc3RvcmVfdHNjKCkgZ2V0cyBjYWxsZWQgaXJyZXNwZWN0aXZlIG9mIHRoZSBDIHN0
YXRlIGJlaW5nCj4+IGV4aXRlZCwgc28gSSB3b25kZXIgd2hldGhlciB0aGVyZSdzIHJvb20gZm9y
IGltcHJvdmVtZW50IHRoZXJlCj4+IGluZGVwZW5kZW50IG9mIHRoZSBpc3N1ZSBhdCBoYW5kLiBB
cyBmYXIgYXMgdGhpcyBjaGFuZ2UgaXMgY29uY2VybmVkLAo+PiBJIHRoaW5rIHlvdSB3YW50IHRv
IGRyb3AgdGhlIG5vdGlvbiBvZiAiZGVlcCIgZnJvbSB0aGUgZGVzY3JpcHRpb24uCj4gCj4gSSdt
IG5vdCBmYW1pbGlhciB3aXRoIHdoYXQgdG8gY2FsbCAiZGVlcCBDLXN0YXRlIiBzbyBmb3IgbWUg
aXQgd2FzIGFueXRoaW5nCj4gaGlnaGVyIHRoYW4gQzEuIElmIHlvdSBwcmVmZXIgImRlZXAiIHRv
IGJlIGRyb3BwZWQgLSBzbyBiZSBpdC4KCiJIaWdoZXIgdGhhbiBDMSIgbWF5IGJlIGZpbmUgKGFs
YmVpdCBJIHZhZ3VlbHkgcmVjYWxsIFRTQyBpc3N1ZXMKc3RhcnRpbmcgd2l0aCBDMyBvbmx5KSwg
YnV0IGF0IGxlYXN0IG13YWl0X2lkbGUoKSBjYWxscyB0aGUKZnVuY3Rpb24gZXZlbiBmb3IgQzEu
IEFzIHRvIHRoZSBQViBzaGltIC0gZG9lcyBpdCBrbm93IGFib3V0IGFueQpDLXN0YXRlcyBhdCBh
bGwgKGJleW9uZCBITFQtaW52b2tlZCBDMSk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
