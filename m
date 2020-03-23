Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584A18F6EC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 15:29:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGO0g-0005X3-CY; Mon, 23 Mar 2020 14:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGO0f-0005Wy-3r
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 14:24:57 +0000
X-Inumbo-ID: 1196222a-6d12-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1196222a-6d12-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 14:24:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90042AD39;
 Mon, 23 Mar 2020 14:24:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-2-andrew.cooper3@citrix.com>
 <3a2b459d-2d44-55fc-d72f-3f65afaf02af@suse.com>
 <6faad1b9-77cb-75d6-0fa2-6f6901be0922@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <295edeaf-5832-5809-de8a-c105064bf1ff@suse.com>
Date: Mon, 23 Mar 2020 15:24:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6faad1b9-77cb-75d6-0fa2-6f6901be0922@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/7] x86/ucode: Document the behaviour of
 the microcode_ops hooks
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

T24gMjMuMDMuMjAyMCAxNDoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMy8wMy8yMDIw
IDEyOjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjMuMDMuMjAyMCAxMToxNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgK
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKPj4+IEBAIC03LDggKzcs
MTMgQEAKPj4+ICAjaW5jbHVkZSA8cHVibGljL3hlbi5oPgo+Pj4gIAo+Pj4gIHN0cnVjdCBjcHVf
c2lnbmF0dXJlIHsKPj4+ICsgICAgLyogQ1BVIHNpZ25hdHVyZSAoQ1BVSUQuMS5FQVgpLiAgT25s
eSB3cml0dGVuIG9uIEludGVsLiAqLwo+Pj4gICAgICB1bnNpZ25lZCBpbnQgc2lnOwo+Pj4gKwo+
Pj4gKyAgICAvKiBQbGF0Zm9ybSBGbGFncyAob25seSBhY3R1YWxseSAxIGJpdCkuICBPbmx5IGFw
cGxpY2FibGUgdG8gSW50ZWwuICovCj4+PiAgICAgIHVuc2lnbmVkIGludCBwZjsKPj4gVG8gbWUg
Im9ubHkgYWN0dWFsbHkgMSBiaXQiIG1ha2VzIGl0IGFuIGltcGxpY2F0aW9uIHRoYXQgdGhpcyBp
cyB0aGUKPj4gbG93ZXN0IGJpdCAobGlrZSBpbiBhIGJvb2wgcmVwcmVzZW50ZWQgaW4gYSAzMi1i
aXQgbWVtb3J5IGxvY2F0aW9uKS4KPj4gSSBkaWRuJ3QgdGhpbmsgdGhpcyB3YXMgdGhlIGNhc2Ug
dGhvdWdoLCBzbyB1bmxlc3MgSSdtIHdyb25nLCBjb3VsZAo+PiB5b3UgY2xhcmlmeSB0aGlzIGEg
bGl0dGxlPwo+IAo+IFRoZXJlIHdpbGwgYmUgYSBzaW5nbGUgYml0IHdpdGhpbiB0aGUgYm90dG9t
IDggc2V0ICh0aGUgMSA8PAo+IE1TUl9QTEFURk9STV9JRFs1Mjo1MF0pLCBkZXNwaXRlIHRoaXMg
ZmllbGQgYmVpbmcgY2FsbGVkICJQbGF0Zm9ybSBGbGFncyIuCgpUaGF0J3Mgd2hhdCBJIHJlY2Fs
bGVkLiBDb3VsZCBJIHRhbGsgeW91IGludG8Kcy9vbmx5IGFjdHVhbGx5IDEgYml0L29ubHkgYWN0
dWFsbHkgYSBzaW5nbGUgc2V0IGJpdC8gb3Igc29tZSBzdWNoPwpJZiBzbywKQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
