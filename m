Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49518B01B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 10:24:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jErMh-00058q-9m; Thu, 19 Mar 2020 09:21:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jErMf-00058l-L7
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:21:21 +0000
X-Inumbo-ID: fe4b017e-69c2-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe4b017e-69c2-11ea-92cf-bc764e2007e4;
 Thu, 19 Mar 2020 09:21:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7781AADBE;
 Thu, 19 Mar 2020 09:21:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02b265af-0b0d-0d8f-ed53-4e27c1d12beb@suse.com>
Date: Thu, 19 Mar 2020 10:21:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318210540.5602-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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

T24gMTguMDMuMjAyMCAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTcGxpdCB0aGUgZXhp
c3RpbmcgYXNtL21pY3JvY29kZS5oIGluIGhhbGYsIGtlZXBpbmcgdGhlIHBlci1jcHUgY3B1X3Np
Zwo+IGF2YWlsYWJsZSB0byBleHRlcm5hbCB1c2VycywgYW5kIG1vdmluZyBldmVyeXRoaW5nIGVs
c2UgaW50byBwcml2YXRlLmgKPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byB0cmltIGFuZCBj
bGVhbiB1cCB0aGUgaW5jbHVkZSBsaXN0cyBmb3IgYWxsIDMgc291cmNlCj4gZmlsZXMsIGFsbCBv
ZiB3aGljaCBpbmNsdWRlIHJhdGhlciBtb3JlIHRoYW4gbmVjZXNzYXJ5Lgo+IAo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgphbGJlaXQgcHJlZmVyYWJseSB3aXRoIC4uLgoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KPiAgeGVuL2FyY2gv
eDg2L21pY3JvY29kZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMyArKwo+ICB4ZW4v
YXJjaC94ODYve21pY3JvY29kZV9hbWQuYyA9PiBtaWNyb2NvZGUvYW1kLmN9ICB8IDEyICsrKyst
LS0tCj4gIHhlbi9hcmNoL3g4Ni97bWljcm9jb2RlLmMgPT4gbWljcm9jb2RlL2NvcmUuY30gICAg
IHwgMTUgKysrLS0tLS0tLQo+ICAuLi4veDg2L3ttaWNyb2NvZGVfaW50ZWwuYyA9PiBtaWNyb2Nv
ZGUvaW50ZWwuY30gICB8ICA5ICsrLS0tLQo+ICAuLi4vbWljcm9jb2RlLmggPT4gYXJjaC94ODYv
bWljcm9jb2RlL3ByaXZhdGUuaH0gICB8IDE5ICsrKystLS0tLS0tLS0KCi4uLiB0aGVzZSBnb2lu
ZyBpbnRvIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlLy4gVGhvdWdodHM/CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
