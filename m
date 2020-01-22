Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA87B1458FE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:50:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuIEW-0006jo-5d; Wed, 22 Jan 2020 15:47:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuIEU-0006ji-IF
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:47:54 +0000
X-Inumbo-ID: 8d2434ea-3d2e-11ea-bc8d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d2434ea-3d2e-11ea-bc8d-12813bfff9fa;
 Wed, 22 Jan 2020 15:47:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFC8CAC44;
 Wed, 22 Jan 2020 15:47:52 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-2-pdurrant@amazon.com>
 <e9f7ef14-2dc5-4a40-1a3c-aca2aac3b90a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d5ac1c9-fdb9-d04d-9d32-041632a30ba4@suse.com>
Date: Wed, 22 Jan 2020 16:48:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e9f7ef14-2dc5-4a40-1a3c-aca2aac3b90a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86 / vmx: make apic_access_mfn
 type-safe
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxNTowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMS8wMS8yMDIw
IDEyOjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IFVzZSBtZm5fdCByYXRoZXIgdGhhbiB1bnNp
Z25lZCBsb25nIGFuZCBjaGFuZ2UgcHJldmlvdXMgdGVzdHMgYWdhaW5zdCAwIHRvCj4+IHRlc3Rz
IGFnYWluc3QgSU5WQUxJRF9NRk4gKGFsc28gaW50cm9kdWNpbmcgaW5pdGlhbGl6YXRpb24gdG8g
dGhhdCB2YWx1ZSkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4KPiAKPiBJJ20gYWZyYWlkIHRoaXMgYnJlYWtzIHRoZSBpZGVtcG90ZW5jeSBv
ZiB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpLAo+IHdoaWNoIGdldHMgaW4gdGhlIHdheSBvZiBk
b21haW4vdmNwdSBjcmVhdGUvZGVzdHJveSBjbGVhbnVwLgo+IAo+IEl0cyBmaW5lIHRvIHVzZSAw
IGFzIHRoZSBzZW50aW5lbC4KCkFuZCB3aXRoIHRoaXMgYWRqdXN0bWVudApSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
