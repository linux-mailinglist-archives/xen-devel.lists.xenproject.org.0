Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684214589A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:26:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHqQ-0004f4-II; Wed, 22 Jan 2020 15:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuHqO-0004ez-KZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:23:00 +0000
X-Inumbo-ID: 11e62977-3d2b-11ea-bc75-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11e62977-3d2b-11ea-bc75-12813bfff9fa;
 Wed, 22 Jan 2020 15:22:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5CACCB029;
 Wed, 22 Jan 2020 15:22:57 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <17ea032201adfecdb5dedc3a0b9667eccdf7f118.1579628566.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6cb72a36-d9af-5b96-76df-2c6746dfa245@suse.com>
Date: Wed, 22 Jan 2020 16:23:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <17ea032201adfecdb5dedc3a0b9667eccdf7f118.1579628566.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 03/18] x86/p2m: Allow
 p2m_get_page_from_gfn to return shared entries
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRoZSBvd25lciBk
b21haW4gb2Ygc2hhcmVkIHBhZ2VzIGlzIGRvbV9jb3csIHVzZSB0aGF0IGZvciBnZXRfcGFnZQo+
IG90aGVyd2lzZSB0aGUgZnVuY3Rpb24gZmFpbHMgdG8gcmV0dXJuIHRoZSBjb3JyZWN0IHBhZ2Uu
CgpJIHRoaW5rIHRoaXMgZGVzY3JpcHRpb24gbmVlZHMgaW1wcm92ZW1lbnQ6IFRoZSBmdW5jdGlv
biBkb2VzIHRoZQpzcGVjaWFsIHNoYXJlZCBwYWdlIGRhbmNlIGluIG9uZSBwbGFjZSAob24gdGhl
ICJmYXN0IHBhdGgiKQphbHJlYWR5LiBUaGlzIHdhbnRzIG1lbnRpb25pbmcsIGVpdGhlciBiZWNh
dXNlIGl0IHdhcyBhIG1pc3Rha2UKdG8gaGF2ZSBpdCBqdXN0IHRoZXJlLCBvciBiZWNhdXNlIGEg
bmV3IG5lZWQgaGFzIGFwcGVhcmVkIHRvIGFsc28KaGF2ZSBpdCBvbiB0aGUgInNsb3cgcGF0aCIu
Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYwo+IEBAIC01OTQsNyArNTk0LDEwIEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFn
ZV9mcm9tX2dmbigKPiAgICAgIGlmICggcDJtX2lzX3JhbSgqdCkgJiYgbWZuX3ZhbGlkKG1mbikg
KQo+ICAgICAgewo+ICAgICAgICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwo+IC0gICAgICAg
IGlmICggIWdldF9wYWdlKHBhZ2UsIHAybS0+ZG9tYWluKSApCj4gKyAgICAgICAgaWYgKCAhZ2V0
X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICYmCj4gKyAgICAgICAgICAgICAvKiBQYWdlIGNvdWxk
IGJlIHNoYXJlZCAqLwo+ICsgICAgICAgICAgICAgKCFkb21fY293IHx8ICFwMm1faXNfc2hhcmVk
KCp0KSB8fAo+ICsgICAgICAgICAgICAgICFnZXRfcGFnZShwYWdlLCBkb21fY293KSkgKQoKV2hp
bGUgdGhlcmUgbWF5IGJlIGEgcmVhc29uIHdoeSBvbiB0aGUgZmFzdCBwYXRoIHR3byBnZXRfcGFn
ZSgpCmludm9jYXRpb25zIGFyZSBiZSBuZWNlc3NhcnksIGNvdWxkbid0IHlvdSBnZXQgYXdheSB3
aXRoIGp1c3QKb25lCgogICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsICFkb21fY293IHx8ICFw
Mm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogZG9tX2NvdykgKQoKYXQgbGVhc3Qg
aGVyZT8gSXQncyBhbHNvIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2h5IGhlcmUgYW5kCnRoZXJl
IHdlIG5lZWQgIiFkb21fY293IHx8ICFwMm1faXNfc2hhcmVkKCp0KSIgLSB3b3VsZG4ndApwMm1f
aXNfc2hhcmVkKCkgcmV0dXJuIGNvbnNpc3RlbnRseSAiZmFsc2UiIHdoZW4gIWRvbV9jb3cgPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
