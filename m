Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274210CA06
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:01:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKKt-00038D-HY; Thu, 28 Nov 2019 13:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaKKs-000386-K8
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:59:58 +0000
X-Inumbo-ID: 5c86518c-11e7-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c86518c-11e7-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 13:59:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F586AD75;
 Thu, 28 Nov 2019 13:59:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <197dd3da-2844-6d41-c7f3-7e5d01c99fa5@citrix.com>
 <457a1616-f2ce-d1b1-94eb-7531f38f2800@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a77adf97-f8a9-628b-4f3b-4b098fabcd59@suse.com>
Date: Thu, 28 Nov 2019 15:00:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <457a1616-f2ce-d1b1-94eb-7531f38f2800@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/IRQ: make internally used IRQs also
 honor the pending EOI stack
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, WeiLiu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNDo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8xMS8yMDE5
IDEyOjEwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOC8xMS8yMDE5IDExOjAzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IE5vdGVzOgo+Pj4KPj4+IC0gSW4gcHJpbmNpcGxlIHdlIGNvdWxk
IGdldCBhd2F5IHdpdGhvdXQgdGhlIGNoZWNrX2VvaV9kZWZlcnJhbCBmbGFnLgo+Pj4gICBJJ3Zl
IGludHJvZHVjZWQgaXQganVzdCB0byBtYWtlIHN1cmUgdGhlcmUncyBhcyBsaXR0bGUgY2hhbmdl
IGFzCj4+PiAgIHBvc3NpYmxlIHRvIHVuYWZmZWN0ZWQgcGF0aHMuCj4+PiAtIFNpbWlsYXJseSB0
aGUgY3B1X2hhc19wZW5kaW5nX2FwaWNfZW9pKCkgY2hlY2sgaW4gZG9fSVJRKCkgaXNuJ3QKPj4+
ICAgc3RyaWN0bHkgbmVjZXNzYXJ5Lgo+PiBJIGRvbid0IHRoaW5rIHRoZSBjcHVfaGFzX3BlbmRp
bmdfYXBpY19lb2koKSBjaGVjayBpcyBuZWNlc3NhcnkuwqAgSXQgaXMKPj4gY2hlY2tlZCBhdCB0
aGUgaGVhZCBvZiBlbmRfbm9ubWFza2FibGVfaXJxKCkgYXMgd2VsbC4KPj4KPj4gU2ltaWxhcmx5
LCBJJ20gbm90IHN1cmUgdGhhdCBjaGVja19lb2lfZGVmZXJyYWwgaXMgc29tZXRoaW5nIHRoYXQg
d2UnZAo+PiB3YW50IHRvIGludHJvZHVjZS4KPj4KPj4gSSdsbCBkcm9wIGJvdGggb2YgdGhlc2Ug
YW5kIHRlc3QsIHNlZWluZyBhcyBJIGhhdmUgYSByZXBybyBvZiB0aGUgcHJvYmxlbS4KPiAKPiBE
cm9wcGluZyBjcHVfaGFzX3BlbmRpbmdfYXBpY19lb2koKSB3YXNuJ3QgcG9zc2libGUgaW4gYSB0
cml2aWFsIHdheSAoc28KPiBJIGRpZG4ndCksIGFuZCBkcm9wcGluZyBqdXN0IGNoZWNrX2VvaV9k
ZWZlcnJhbCBvbiBpdHMgb3duIGRlZmluaXRlbHkKPiBicmVha3MgdGhpbmdzLgo+IAo+IEdpdmVu
IHRoZSA0LjEzIHRpbWVsaW5lLCBsZXRzIGdvIHdpdGggaXQgaW4gdGhpcyBmb3JtLCBzZWVpbmcg
YXMgaXQgaXMKPiB0aGUgdmVyc2lvbiB3aGljaCBoYWQgYWxsIG9mIGxhc3QgbmlnaHQncyB3b3J0
aCBvZiB0ZXN0aW5nLgo+IAo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+IFRlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClRoYW5rcyEgSSd2ZSB0YWtlbiBub3RlIHRvIHByb2R1Y2UgYSBwYXRjaCAo
aWYgcG9zc2libGUgYXQgYWxsLCBnaXZlbgp0aGUgcmVzdWx0cyBvZiB5b3VyIGF0dGVtcHQpIHRv
IHJlbW92ZSB0aGUgZXh0cmEgcGllY2VzIGFnYWluLCBpZGVhbGx5CnRvIGdvIGluIHByZXR0eSBz
b29uIGFmdGVyIHRoZSBicmFuY2hpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
