Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EFA15452E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:44:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhQZ-0004it-NW; Thu, 06 Feb 2020 13:42:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izhQY-0004io-Jo
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:42:42 +0000
X-Inumbo-ID: 8bd667fc-48e6-11ea-841d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bd667fc-48e6-11ea-841d-bc764e2007e4;
 Thu, 06 Feb 2020 13:42:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C189EAAC3;
 Thu,  6 Feb 2020 13:42:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200206132452.11802-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad7cb08e-0b18-a17b-bbe6-13b189a2c76a@suse.com>
Date: Thu, 6 Feb 2020 14:42:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206132452.11802-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/hvm: Fix handling of obsolete HVM_PARAMs
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxNDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbG9jYWwgeGNf
aHZtX3BhcmFtX2RlcHJlY2F0ZWRfY2hlY2soKSBpbiBsaWJ4YyB0cmllcyB0byBndWVzcyBYZW4n
cwo+IGJlaGF2aW91ciBmb3IgdGhlIE1FTU9SWV9FVkVOVCBwYXJhbXMsIGJ1dCBpcyB3cm9uZyBm
b3IgdGhlIGdldCBzaWRlLCB3aGVyZQo+IFhlbiB3b3VsZCByZXR1cm4gMCAod2hpY2ggaXMgYWxz
byBhIGJ1ZykuICBEZWxldGUgdGhlIGhlbHBlci4KPiAKPiBJbiBYZW4sIHBlcmZvcm0gdGhlIGNo
ZWNrcyBpbiBodm1fYWxsb3dfc2V0X3BhcmFtKCksIHJhdGhlciB0aGFuCj4gaHZtX3NldF9wYXJh
bSgpLCBhbmQgYWN0dWFsbHkgaW1wbGVtZW50IGNoZWNrcyBvbiB0aGUgZ2V0IHNpZGUgc28gdGhl
Cj4gaHlwZXJjYWxsIGRvZXNuJ3QgcmV0dXJuIHN1Y2Nlc3NmdWxseSB3aXRoIDAgYXMgYW4gYW5z
d2VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpIeXBlcnZpc29yIHBhcnRzCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CndpdGggb25lIHJlbWFyazoKCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtNDEwNSw4ICs0MTA1LDE0
IEBAIHN0YXRpYyBpbnQgaHZtX2FsbG93X3NldF9wYXJhbShzdHJ1Y3QgZG9tYWluICpkLAo+ICAg
ICAgICAgIGJyZWFrOwo+ICAgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIGFyZSBkZXBy
ZWNhdGVkLiAqLwo+ICAgICAgY2FzZSBIVk1fUEFSQU1fRE1fRE9NQUlOOgo+ICsgICAgY2FzZSBI
Vk1fUEFSQU1fTUVNT1JZX0VWRU5UX0NSMDoKPiArICAgIGNhc2UgSFZNX1BBUkFNX01FTU9SWV9F
VkVOVF9DUjM6Cj4gKyAgICBjYXNlIEhWTV9QQVJBTV9NRU1PUllfRVZFTlRfQ1I0Ogo+ICsgICAg
Y2FzZSBIVk1fUEFSQU1fTUVNT1JZX0VWRU5UX0lOVDM6Cj4gKyAgICBjYXNlIEhWTV9QQVJBTV9N
RU1PUllfRVZFTlRfU0lOR0xFX1NURVA6Cj4gICAgICBjYXNlIEhWTV9QQVJBTV9CVUZJT1JFUV9F
VlRDSE46Cj4gLSAgICAgICAgcmMgPSAtRVBFUk07Cj4gKyAgICBjYXNlIEhWTV9QQVJBTV9NRU1P
UllfRVZFTlRfTVNSOgo+ICsgICAgICAgIHJjID0gLUVJTlZBTDsKPiAgICAgICAgICBicmVhazsK
Ck90aGVyIHRoYW4gaW4gdGhlIGhlYWRlciwgd2hlcmUgc29ydGluZyBieSBudW1lcmljIHZhbHVl
IG1ha2VzCihtb3JlKSBzZW5zZSwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc29ydCBj
YXNlIGxhYmVscwphbHBoYWJldGljYWxseS4gT3RoZXJ3aXNlIHdoZW4gd2FudGluZyB0byBhZGQg
dG8gaXQsIG9uZSBuZWVkcwp0byBnbyBsb29rIHVwIChvciBtZW1vcml6ZSwgZnJvbSBkb2luZyB0
aGUgaGVhZGVyIGZpbGUgY2hhbmdlCmZpcnN0KSB0aGUgaW5zZXJ0aW9uIHBvaW50LgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
