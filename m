Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A718CF88
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 14:55:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFI3Y-0004oC-2Q; Fri, 20 Mar 2020 13:51:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFI3X-0004o6-4S
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:51:23 +0000
X-Inumbo-ID: e1c1bf09-6ab1-11ea-bd75-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1c1bf09-6ab1-11ea-bd75-12813bfff9fa;
 Fri, 20 Mar 2020 13:51:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4284AB1EB;
 Fri, 20 Mar 2020 13:51:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2acabccd-da3b-9e22-8f27-41ab1b3cde8a@suse.com>
Date: Fri, 20 Mar 2020 14:51:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319152622.31758-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86/ucode: Alter ops->free_patch() to
 free the entire patch
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

T24gMTkuMDMuMjAyMCAxNjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZGF0YSBsYXlv
dXQgZm9yIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggaXMgZXh0cmVtZWx5IHBvb3IsIGFuZAo+IHVu
bmVjZXNzYXJpbHkgY29tcGxpY2F0ZWQuICBBbG1vc3QgYWxsIG9mIGl0IGlzIG9wYXF1ZSB0byBj
b3JlLmMsIHdpdGggdGhlCj4gZXhjZXB0aW9uIG9mIGZyZWVfcGF0Y2goKS4KPiAKPiBNb3ZlIHRo
ZSByZXNwb25zaWJpbGl0eSBmb3IgZnJlZWluZyB0aGUgcGF0Y2ggaW50byB0aGUgZnJlZV9wYXRj
aCgpIGhvb2ssCj4gd2hpY2ggd2lsbCBhbGxvdyBlYWNoIGRyaXZlciB0byBkbyBhIGJldHRlciBq
b2IuCgpCdXQgdGhhdCB3cmFwcGVyIHN0cnVjdHVyZSBpcyBzb21ldGhpbmcgY29tbW9uLCBpLmUu
IHRvIGJlCmFsbG9jYXRlZCBhcyB3ZWxsIGFzIHRvIGJlIGZyZWVkIChwcmVmZXJhYmx5KSBieSBj
b21tb24gY29kZS4KV2UgZGlkIHNwZWNpZmljYWxseSBtb3ZlIHRoZXJlIGR1cmluZyByZXZpZXcg
b2YgdGhlIG1vc3QKcmVjZW50IHJlLXdvcmsuCgpIb3dldmVyLCBoYXZpbmcgdGFrZW4gYSBsb29r
IGFsc28gYXQgdGhlIG5leHQgcGF0Y2ggSSB3b25kZXIKd2h5IHlvdSBldmVuIHJldGFpbiB0aGF0
IHdyYXBwZXIgc3RydWN0dXJlIGNvbnRhaW5pbmcganVzdAphIHNpbmdsZSBwb2ludGVyPyBXaHkg
Y2FuJ3Qgd2hhdCBpcyBub3cKc3RydWN0IG1pY3JvY29kZV97YW1kLGludGVsfSBiZWNvbWUgc3Ry
dWN0IG1pY3JvY29kZV9wYXRjaCwKd2l0aCAtIGFzIHlvdSBzYXkgdGhlcmUgLSBkaWZmZXJlbnQg
cGVyLXZlbmRvciBsYXlvdXQgd2hpY2gKaXMgb3BhcXVlIHRvIGNvbW1vbiBjb2RlPwoKPiBUYWtl
IHRoZSBvcHBvcnR1bml0eSB0byBtYWtlIHRoZSBob29rcyBpZGVtcG90ZW50LgoKSSdtIGhhdmlu
ZyBkaWZmaWN1bHR5IHNlZWluZyB3aGF0IHBhcnQgb2YgdGhlIHBhdGNoIHRoaXMgaXMKYWJvdXQu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
