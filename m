Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570D1644A8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:52:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4On8-0002Tu-GR; Wed, 19 Feb 2020 12:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4On6-0002To-TR
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:49:24 +0000
X-Inumbo-ID: 410642f8-5316-11ea-834d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 410642f8-5316-11ea-834d-12813bfff9fa;
 Wed, 19 Feb 2020 12:49:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B50CAFAA;
 Wed, 19 Feb 2020 12:49:22 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <6d0074de-972a-317c-9df6-f4ece26febf4@suse.com>
 <06b8eb42-09e0-2607-36fc-b551f45e4fdf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f65a3f96-0b67-a0c6-85ec-a9c06f237458@suse.com>
Date: Wed, 19 Feb 2020 13:49:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <06b8eb42-09e0-2607-36fc-b551f45e4fdf@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] sysctl: use xmalloc_array() for
 XEN_SYSCTL_page_offline_op
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuLAoKT24gMTguMDIuMjAyMCAxNzo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAx
OC8wMi8yMDIwIDE2OjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhpcyBpcyBtb3JlIHJvYnVz
dCB0aGFuIHRoZSByYXcgeG1hbGxvY19ieXRlcygpLgo+Pgo+PiBBbHNvIGFkZCBhIHNhbml0eSBj
aGVjayBvbiB0aGUgaW5wdXQgcGFnZSByYW5nZSwgdG8gYXZvaWQgcmV0dXJuaW5nCj4+IHRoZSBs
ZXNzIGFwcGxpY2FibGUgLUVOT01FTSBpbiBzdWNoIGNhc2VzIChhbmQgdHJ5aW5nIHRoZSBhbGxv
Y2F0aW9uIGluCj4+IHRoZSBmaXJzdCBwbGFjZSkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkkgbm90aWNlIHlvdSd2ZSBjb21taXR0ZWQgdGhp
cywgYnV0IHNvbWVob3cgeW91J3ZlIGxvc3QgQW5kcmV3J3MKYWNrLiBJIGRvbid0IHRoaW5rIGl0
IHdhcyBpbnRlbmRlZCBieSB0aGUgcmVjZW50IGNoZWNrLWluIHBvbGljeQpjaGFuZ2UgZm9yIGNv
bW1pdHMgdG8gZ28gaW4gd2l0aG91dCBzdWl0YWJsZSBhY2tzIChpaXJjIEkgZGlkCm5vdGljZSBh
IGZldyBvdGhlcnMgcmVjZW50bHkgYXMgd2VsbCwgYWxiZWl0IG5vdCBvbmVzIGNvbW1pdHRlZApi
eSB5b3UpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
