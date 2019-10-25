Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A395E4AC8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:11:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNyPX-0004TO-KU; Fri, 25 Oct 2019 12:09:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNyPW-0004TJ-6m
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:09:42 +0000
X-Inumbo-ID: 513a04c2-f720-11e9-94c5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 513a04c2-f720-11e9-94c5-12813bfff9fa;
 Fri, 25 Oct 2019 12:09:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27EBEB3BC;
 Fri, 25 Oct 2019 12:09:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dcbb5848-cb9a-8e38-1f6d-9e4d28d88daf@suse.com>
Date: Fri, 25 Oct 2019 14:09:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/7] x86/nospec: Rename and rework
 l1tf-barrier as branch-harden
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBsMXRmLWJhcnJpZXIg
aXMgYW4gaW5hcHByb3ByaWF0ZSBuYW1lLCBhbmQgY2FtZSBhYm91dCBiZWNhdXNlIG9mIHJlc3Ry
aWN0aW9ucwo+IG9uIGNvdWxkIGJlIGRpc2N1c3NlZCBwdWJsaWNseSB3aGVuIHRoZSBwYXRjaGVz
IHdlcmUgcHJvcG9zZWQuCj4gCj4gSW4gcHJhY3RpY2UsIGl0IGlzIGZvciBnZW5lcmFsIFNwZWN0
cmUgdjEgbWl0aWdhdGlvbnMsIGFuZCBpcyBuZWNlc3NhcnkgaW4gYWxsCj4gY2FzZXMuICBBbiBh
ZHZlcnNhcnkgd2hpY2ggY2FuIGNvbnRyb2wgc3BlY3VsYXRpb24gaW4gWGVuIGNhbiBsZWFrIGRh
dGEgaW4KPiBjcm9zcy1jb3JlIChCQ0JTLCBldGMpIG9yIHJlbW90ZSAoTmV0U3BlY3RyZSkgc2Nl
bmFyaW9zIC0gdGhlIHByb2JsZW0gaXMgbm90Cj4gbGltaXRlZCB0byBqdXN0IEwxVEYgd2l0aCBI
VCBhY3RpdmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cgo+IEluIHByaW5jaXBsZSBpdCBzaG91bGQgYmUgdHJpc3RhdGUgYW5kIGJlaW5nIGRpc2Fi
bGVkIGJ5IGRlZmF1bHQgb24gcGFydHMKPiB3aGljaCBkb24ndCBzcGVjdWxhdGUsIGJ1dCBpdCBp
cyB0b28gbGF0ZSBpbiA0LjEzIHRvIG9yZ2FuaXNlIHRoaXMuCgpBbmQgdGhlIGZ1bmRhbWVudGFs
IGlzc3VlIGlzIGNvcnJlY3RseSBjb21waWxpbmcgdGhlIGNvbmRpdGlvbnMgdW5kZXIgd2hpY2gK
dG8gZGVmYXVsdCB0byB0cnVlIGFuZCBmYWxzZSByZXNwZWN0aXZlbHk/IEkgYXNrIGJlY2F1c2Ug
aWYgaXQgd2FzIG5vdCB0aGlzCnRoZW4gSSB3b3VsZG4ndCBzZWUgd2hhdCBoaW5kZXJpbmcgZmFj
dG9yIHRoZXJlIGlzIHRvIG1ha2UgdGhpcyB0cmlzdGF0ZQpyaWdodCBhd2F5LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
