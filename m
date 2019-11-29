Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAD10D596
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:18:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafBF-0004FZ-Dy; Fri, 29 Nov 2019 12:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iafBE-0004FR-Du
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:15:24 +0000
X-Inumbo-ID: eb5b4eac-12a1-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb5b4eac-12a1-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 12:15:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B6BFB3D4;
 Fri, 29 Nov 2019 12:15:23 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <24033.2082.127306.518557@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d3e940b-5e09-285c-cd8e-c0847b7e205f@suse.com>
Date: Fri, 29 Nov 2019 13:15:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24033.2082.127306.518557@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 AndrewCooper <Andrew.Cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMjo1OSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2ggd3Jp
dGVzICgiW1BBVENIXSBjb25zb2xlOiBhdm9pZCBidWZmZXIgb3ZlcmZsb3cgaW4gZ3Vlc3RfY29u
c29sZV93cml0ZSgpIik6Cj4+IFRoZSBzd2l0Y2ggb2YgZ3Vlc3RfY29uc29sZV93cml0ZSgpJ3Mg
c2Vjb25kIHBhcmFtZXRlciBmcm9tIHBsYWluIHRvCj4+IHVuc2lnbmVkIGludCBoYXMgY2F1c2Vk
IHRoZSBmdW5jdGlvbidzIG1haW4gbG9vcCBoZWFkZXIgdG8gbm8gbG9uZ2VyCj4+IGd1YXJkIHRo
ZSBtaW5fdCgpIHVzZSB3aXRoaW4gdGhlIGZ1bmN0aW9uIGFnYWluc3QgZWZmZWN0aXZlbHkgbmVn
YXRpdmUKPj4gdmFsdWVzLCBkdWUgdG8gdGhlIGNhc3RzIGhpZGRlbiBpbnNpZGUgdGhlIG1hY3Jv
LiBSZXBsYWNlIGJ5IGEgcGxhaW4KPj4gbWluKCksIGNvbnZlcnRpbmcgb25lIG9mIHRoZSBhcmd1
bWVudHMgc3VpdGFibHkgd2l0aG91dCBpbnZvbHZpbmcgYW55Cj4+IGNhc3QuCj4+Cj4+IEZpeGVz
OiBlYTYwMWVjOTk5NWIgKCJ4ZW4vY29uc29sZTogUmV3b3JrIEhZUEVSQ0FMTF9jb25zb2xlX2lv
IGludGVyZmFjZSIpCj4+IFJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1bmRlbCA8aXZhbnNwcnVu
ZGVsQGlvYWN0aXZlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IGVhNjAxZWM5OTk1YiBpbmNsdWRlZCB0aGlzIGh1bms6Cj4gCj4gICAg
ICAgIGNhc2UgQ09OU09MRUlPX3JlYWQ6Cj4gICArICAgICAgICAvKgo+ICAgKyAgICAgICAgICog
VGhlIHJldHVybiB2YWx1ZSBpcyBlaXRoZXIgdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIHJlYWQg
b3IKPiAgICsgICAgICAgICAqIGEgbmVnYXRpdmUgdmFsdWUgaW4gY2FzZSBvZiBlcnJvci4gU28g
d2UgbmVlZCB0byBwcmV2ZW50Cj4gICArICAgICAgICAgKiBvdmVybGFwIGJldHdlZW4gdGhlIHR3
byBzZXRzLgo+ICAgKyAgICAgICAgICovCj4gICArICAgICAgICByYyA9IC1FMkJJRzsKPiAgICsg
ICAgICAgIGlmICggY291bnQgPiBJTlRfTUFYICkKPiAgICsgICAgICAgICAgICBicmVhazsKPiAK
PiBNYXliZSBpdCB3b3VsZCBiZSBnb29kIHRvIG1vdmUgdGhhdCBvdXRzaWRlIHRoZSBzd2l0Y2gg
c28gdGhhdCBpdAo+IGFmZmVjdHMgQ09OU09MRUlPX3dyaXRlIHRvbyA/CgpBbmQgYW55IGZ1dHVy
ZSBzdWJvcHM/IEFuZCBsaW1pdCBvdXRwdXQgbW9yZSB0aGFuIG5lY2Vzc2FyeSAobm90CnRoYXQg
SSB0aGluayBhbnlvbmUgd2lsbCB3YW50IHRvIHB1c2ggbW9yZSB0aGFuIDJHIGF0IGEgdGltZQp0
aHJvdWdoIHRoaXMgaW50ZXJmYWNlLCBidXQgYW55d2F5KT8KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
