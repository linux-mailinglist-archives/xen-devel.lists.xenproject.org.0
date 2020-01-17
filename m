Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798851408B0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:13:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPWo-0007x1-TC; Fri, 17 Jan 2020 11:11:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isPWn-0007wD-Hb
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:11:01 +0000
X-Inumbo-ID: 063c6064-391a-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 063c6064-391a-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 11:10:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0FFA0AE41;
 Fri, 17 Jan 2020 11:10:52 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40cafb96-8a5b-025a-c2e5-281e25b1ce97@suse.com>
Date: Fri, 17 Jan 2020 12:10:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/sm{e,
 a}p: do not enable SMEP/SMAP in PV shim by default on AMD
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxNzowMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gRHVlIHRvIEFNRCBh
bmQgSHlnb24gYmVpbmcgdW5hYmxlIHRvIHNlbGVjdGl2ZWx5IHRyYXAgQ1I0IGJpdCBtb2RpZmlj
YXRpb25zCj4gcnVubmluZyAzMi1iaXQgUFYgZ3Vlc3QgaW5zaWRlIFBWIHNoaW0gY29tZXMgd2l0
aCBzaWduaWZpY2FudCBwZXJmb3JtYW5jZQo+IGhpdC4gTW9yZW92ZXIsIGZvciBTTUVQIGluIHBh
cnRpY3VsYXIgZXZlcnkgdGltZSBDUjQuU01FUCBjaGFuZ2VzIG9uIGNvbnRleHQKPiBzd2l0Y2gg
dG8vZnJvbSAzMi1iaXQgUFYgZ3Vlc3QsIGl0IGdldHMgdHJhcHBlZCBieSBMMCBYZW4gd2hpY2gg
dGhlbgo+IHRyaWVzIHRvIHBlcmZvcm0gZ2xvYmFsIFRMQiBpbnZhbGlkYXRpb24gZm9yIFBWIHNo
aW0gZG9tYWluLiBUaGlzIHVzdWFsbHkKPiByZXN1bHRzIGluIGV2ZW50dWFsIGhhbmcgb2YgYSBQ
ViBzaGltIHdpdGggYXQgbGVhc3Qgc2V2ZXJhbCB2Q1BVcy4KPiAKPiBTaW5jZSB0aGUgb3ZlcmFs
bCBzZWN1cml0eSByaXNrIGlzIGdlbmVyYWxseSBsb3dlciBmb3Igc2hpbSBYZW4gYXMgaXQgYmVp
bmcKPiB0aGVyZSBtb3JlIG9mIGEgZGVmZW5zZS1pbi1kZXB0aCBtZWNoYW5pc20sIGNob29zZSB0
byBkaXNhYmxlIFNNRVAvU01BUCBpbgo+IGl0IGJ5IGRlZmF1bHQgb24gQU1EIGFuZCBIeWdvbiB1
bmxlc3MgYSB1c2VyIGNob3NlIG90aGVyd2lzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERy
dXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggdHdvIG1pbm9yIGFkanVzdG1lbnRzICh0d28g
aW5zdGFuY2VzIGVhY2gpOgoKPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5k
b2MKPiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiBAQCAtMTkzNiwx
OSArMTkzNiwyNSBAQCBpcyAxTUIuCj4gICMjIyBzbWFwICh4ODYpCj4gID4gYD0gPGJvb2xlYW4+
IHwgaHZtYAo+ICAKPiAtPiBEZWZhdWx0OiBgdHJ1ZWAKPiArPiBEZWZhdWx0OiBgdHJ1ZWAgdW5s
ZXNzIHJ1bm5pbmcgaW4gcHYtc2hpbSBtb2RlIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZQo+ICAK
PiAgRmxhZyB0byBlbmFibGUgU3VwZXJ2aXNvciBNb2RlIEFjY2VzcyBQcmV2ZW50aW9uCj4gIFVz
ZSBgc21hcD1odm1gIHRvIGFsbG93IFNNQVAgdXNlIGJ5IEhWTSBndWVzdHMgb25seS4KPiAgCj4g
K0luIFBWIHNoaW0gbW9kZSBvbiBBTUQgb3IgSHlnb24gaGFyZHdhcmUgZHVlIHRvIHNpZ25pZmlj
YW50IHBlcmZvbWFuY2UgaW1wYWN0CgpNaXNzaW5nICdyJyBpbiBwZXJmb3JtYW5jZS4KCj4gQEAg
LTE2MTYsNiArMTYxNiwxNCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIG1iaV9wKQo+ICAKPiAgICAgIHNldF9pbl9jcjQoWDg2X0NSNF9PU0ZYU1IgfCBY
ODZfQ1I0X09TWE1NRVhDUFQpOwo+ICAKPiArICAgIC8qIERvIG5vdCBlbmFibGUgU01FUC9TTUFQ
IGluIFBWIHNoaW0gb24gQU1EIGFuZCBIeWdvbiBieSBkZWZhdWx0ICovCj4gKyAgICBpZiAoIG9w
dF9zbWVwID09IC0xICkKPiArICAgICAgICBvcHRfc21lcCA9ICFwdl9zaGltIHx8ICEoYm9vdF9j
cHVfZGF0YS54ODZfdmVuZG9yICYKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
WDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSk7CgpPbmUgc3BhY2UgbWlzc2luZyBv
biB0aGlzIGxpbmUgdG8gY292ZXIgZm9yIHRoZSBzdGlsbCBvcGVuIHBhcmVudGhlc2lzCmZyb20g
dGhlIHByZXZpb3VzIG9uZS4KCkJvdGggY2FuIGJlIGVhc2lseSB0YWtlbiBjYXJlIG9mIHdoaWxl
IGNvbW1pdHRpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
