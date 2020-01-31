Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826914ED23
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:21:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWCa-0003CS-8Y; Fri, 31 Jan 2020 13:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixWCZ-0003CN-Ki
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:19:15 +0000
X-Inumbo-ID: 46ba346e-442c-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46ba346e-442c-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 13:19:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5C42ACD7;
 Fri, 31 Jan 2020 13:19:13 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-6-liuwe@microsoft.com>
 <20200130003047.pg3dxgy4vtqjhayo@debian>
 <20200131131215.bc7daxfbasudiwbi@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <debd27c2-e2ba-a887-01f7-ec1e0455fc2a@suse.com>
Date: Fri, 31 Jan 2020 14:19:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131131215.bc7daxfbasudiwbi@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 05/12] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxNDoxMiwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAxMjozMDo0N0FNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBXZWQsIEphbiAyOSwg
MjAyMCBhdCAwODoyMDoyN1BNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4gIAo+Pj4gK3ZvaWQg
X19zZXRfZml4bWFwX3goCj4+PiArICAgIGVudW0gZml4ZWRfYWRkcmVzc2VzX3ggaWR4LCB1bnNp
Z25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBmbGFncykKPj4+ICt7Cj4+PiArICAgIEJVR19P
TihpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzX3ggfHwgaWR4IDw9IEZJWF9YX1JFU0VS
VkVEKTsKPj4+ICsgICAgbWFwX3BhZ2VzX3RvX3hlbihfX2ZpeF94X3RvX3ZpcnQoaWR4KSwgX21m
bihtZm4pLCAxLCBmbGFncyk7Cj4+PiArCj4+PiArICAgIC8qIEdlbmVyYXRlIGEgc3ltYm9sIHRv
IGJlIHVzZWQgaW4gbGlua2VyIHNjcmlwdCAqLwo+Pj4gKyAgICBhc20gKCAiLmVxdSBGSVhBRERS
X1hfU0laRSwgJWMwOyAuZ2xvYmFsIEZJWEFERFJfWF9TSVpFIgo+Pj4gKyAgICAgICAgICA6OiAi
aSIgKF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nlc194IDw8IFBBR0VfU0hJRlQpICk7Cj4+Cj4+IFRo
ZSAoX19lbmQgPDwgU0hJRlQpIHBhcnQgY2FuIGJlIHJlcGxhY2VkIHdpdGggRklYQUREUl9YX1NJ
WkUgKHRoZSBtYWNybwo+PiBkZWZpbmVkIGluIGZpeG1hcC5oKSBkaXJlY3RseS4KPiAKPiBJIGFs
c28gZGlzY292ZXIgdGhhdCB0aGlzIHNuaXBwZXQgdG8gZ2VuZXJhdGUgc3ltYm9sIHNob3VsZCBi
ZSBtb3ZlZAo+IGVsc2Ugd2hlcmUgYmVjYXVzZSBpZiBIeXBlci1WIHN1cHBvcnQgaXMgY29tcGls
ZWQgb3V0LCB0aGlzIGZ1bmN0aW9uIGhhcwo+IG5vIHVzZXIuIFRoYXQgY2F1c2VzIGl0IHRvIGJl
IERDRSdkLiBGSVhBRERSX1hfU0laRSB3b3VsZCBiZSBnb25lIGFuZAo+IGxpbmtpbmcgd291bGQg
ZmFpbC4KPiAKPiBJIGhhdmUgbW92ZWQgdGhpcyB0byBhcmNoX2luaXRfbWVtb3J5LiBJdHMgc3Rv
cmFnZSB3aWxsIGJlIHJlY2xhaW1lZAo+IGR1cmluZyBydW50aW1lLCBidXQgdGhpcyBzeW1ib2wg
aXMgbm90IHVzZWQgYW55d2hlcmUgZWxzZSBpbiBjb2RlLCBzbyB3ZQo+IHNob3VsZCBiZSBmaW5l
LgoKU3RvcmFnZT8gVGhpcyBpcyBhIGNvbnN0YW50LCBpLmUuIGp1c3QgYSBzeW1ib2wgd2l0aG91
dCBhbnkKc3RvcmFnZS4gVGhlcmVmb3JlIGFuIF9faW5pdCBmdW5jdGlvbiBpcyBhIHZlcnkgZ29v
ZCBwbGFjZSB0bwpwdXQgaXQuIEl0IGNvdWxkIGFsc28gbGl2ZSBvdXRzaWRlIG9mIGFueSBmdW5j
dGlvbiwgaWYgb25seQpmaWxlIHNjb3BlIGFzbSgpLXMgZmluYWxseSBwZXJtaXR0ZWQgW2NlcnRh
aW5dIGlucHV0cy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
