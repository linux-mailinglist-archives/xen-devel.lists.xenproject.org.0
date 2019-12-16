Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B49120E73
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 16:54:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igseZ-00063r-Kx; Mon, 16 Dec 2019 15:51:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igseY-00063m-B0
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:51:22 +0000
X-Inumbo-ID: e7571afc-201b-11ea-93c6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7571afc-201b-11ea-93c6-12813bfff9fa;
 Mon, 16 Dec 2019 15:51:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 131D7AB7F;
 Mon, 16 Dec 2019 15:51:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191216140227.19234-1-andrew.cooper3@citrix.com>
 <20191216153845.GQ11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9816bcad-8e16-0838-6b6e-6c05c929f3fa@suse.com>
Date: Mon, 16 Dec 2019 16:51:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216153845.GQ11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/pv: Fix `global-pages` to match the
 documentation
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

T24gMTYuMTIuMjAxOSAxNjozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIERl
YyAxNiwgMjAxOSBhdCAwMjowMjoyN1BNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBj
L3MgNWRlOTYxZDljMDkgIng4NjogZG8gbm90IGVuYWJsZSBnbG9iYWwgcGFnZXMgd2hlbiB2aXJ0
dWFsaXplZCBvbiBBTUQgb3IKPj4gSHlnb24gaGFyZHdhcmUiIGluIGZhY3QgZG9lcy4gIEZpeCB0
aGUgY2FsY3VsYXRpb24gaW4gcGdlX2luaXQoKS4KPj4KPj4gV2hpbGUgZml4aW5nIHRoaXMsIGFk
anVzdCB0aGUgY29tbWFuZCBsaW5lIGRvY3VtZW5hdGlvbiwgZmlyc3QgdG8gdXNlIHRoZQo+PiBu
ZXdlciBzdHlsZSwgYW5kIHRvIGV4cGFuZCB0aGUgZGVzY3JpcHRpb24gdG8gZGlzY3VzcyBjYXNl
cyB3aGVyZSB0aGUgb3B0aW9uCj4+IG1pZ2h0IGJlIHVzZWZ1bCB0byB1c2UsIGJ1dCBYZW4gY2Fu
J3QgYWNjb3VudCBmb3IgYnkgZGVmYXVsdC4KPj4KPiAKPiBGaXhlczogNWRlOTYxZDljMDkgKCd4
ODY6IGRvIG5vdCBlbmFibGUgZ2xvYmFsIHBhZ2VzIHdoZW4gdmlydHVhbGl6ZWQgb24gQU1EIG9y
IEh5Z29uIGhhcmR3YXJlJykKPiAKPiBXb3VsZCBiZSBoZWxwZnVsIGZvciBiYWNrcG9ydCByZWFz
b25zIGlmIHNvbWVvbmUgcGlja3MgdXAgdGhlIG90aGVyCj4gY2hhbmdlIChvciBhdCBsZWFzdCBJ
J3ZlIGJlZW4gdHJ5aW5nIHRvIHVzZSBpdCBpbiBvcmRlciB0byBoZWxwCj4gZG93bnN0cmVhbXMg
dGhhdCBtaWdodCBjaGVycnktcGljayBzdHVmZikuCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
