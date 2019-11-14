Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F932FC5A1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 12:46:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVDX3-0007hK-8v; Thu, 14 Nov 2019 11:43:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVDX2-0007hF-3A
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 11:43:24 +0000
X-Inumbo-ID: f4652c40-06d3-11ea-a24a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4652c40-06d3-11ea-a24a-12813bfff9fa;
 Thu, 14 Nov 2019 11:43:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19A45B1EA;
 Thu, 14 Nov 2019 11:43:18 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c46e975b-ef68-f09a-2790-3c4fb503cbf9@suse.com>
 <20191114093820.GB72134@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0bb88b8-2cf6-c631-4f96-a90d921be850@suse.com>
Date: Thu, 14 Nov 2019 12:43:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114093820.GB72134@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: fix clang .macro retention check
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, JulienGrall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxMDozOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBO
b3YgMTMsIDIwMTkgYXQgMDY6MDE6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+PiArKysgYi94ZW4vYXJjaC94ODYvUnVsZXMubWsK
Pj4gQEAgLTgyLDYgKzY0LDYgQEAgJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLCIuaW5j
bHVkZQo+PiAgIyBDaGVjayB3aGV0aGVyIGNsYW5nIGtlZXBzIC5tYWNyby1zIGJldHdlZW4gYXNt
KCktczoKPj4gICMgaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0zNjExMAo+
PiAgJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLFwKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICIubWFjcm8gRk9PXG4uZW5kbVwiKTsgYXNtIHZvbGF0aWxlIChcIi5tYWNybyBGT09cbi5l
bmRtIixcCj4+ICsgICAgICAgICAgICAgICAgICAgICAiLm1hY3JvIEZPT1xuLmVuZG0iJCQoY2xv
c2UpOyBhc20gdm9sYXRpbGUgJCQob3BlbikiLm1hY3JvIEZPT1xuLmVuZG0iLFwKPiAKPiBUaGFu
a3MsIHdoaWxlIGhlcmUgY291bGQgeW91IGFsc28gcmVwbGFjZSB0aGUgJ1xuJyB3aXRoIGEgJzsn
PyAnXG4nCj4gZG9lc24ndCB3b3JrIHByb3Blcmx5IGFuZCBnaXZlcyBtZSB0aGUgZm9sbG93aW5n
IGVycm9yOgo+IAo+IDxzdGRpbj46MTozMjogZXJyb3I6IG1pc3NpbmcgdGVybWluYXRpbmcgJyIn
IGNoYXJhY3RlciBbLVdlcnJvciwtV2ludmFsaWQtcHAtdG9rZW5dCj4gdm9pZCBfKHZvaWQpIHsg
YXNtIHZvbGF0aWxlICggICIubWFjcm8gRk9PCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4KPiA8c3RkaW4+OjE6MzI6IGVycm9yOiBleHBlY3RlZCBzdHJpbmcgbGl0ZXJhbCBpbiAn
YXNtJwo+IDxzdGRpbj46Mzo2OiBlcnJvcjogbWlzc2luZyB0ZXJtaW5hdGluZyAnIicgY2hhcmFj
dGVyIFstV2Vycm9yLC1XaW52YWxpZC1wcC10b2tlbl0KPiAuZW5kbSIgKTsgfQo+ICAgICAgXgo+
IDxzdGRpbj46MzoxMjogZXJyb3I6IGV4cGVjdGVkICcpJwo+IC5lbmRtIiApOyB9Cj4gICAgICAg
ICAgICBeCj4gPHN0ZGluPjoxOjI5OiBub3RlOiB0byBtYXRjaCB0aGlzICcoJwo+IHZvaWQgXyh2
b2lkKSB7IGFzbSB2b2xhdGlsZSAoICAiLm1hY3JvIEZPTwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gPHN0ZGluPjozOjEyOiBlcnJvcjogZXhwZWN0ZWQgJ30nCj4gLmVuZG0iICk7
IH0KPiAgICAgICAgICAgIF4KPiA8c3RkaW4+OjE6MTQ6IG5vdGU6IHRvIG1hdGNoIHRoaXMgJ3sn
Cj4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggICIubWFjcm8gRk9PCj4gICAgICAgICAg
ICAgIF4KClNvIHRoaXMgbXVzdCBiZSB5ZXQgYW5vdGhlciBpc3N1ZSAtIEkgZGlkIHNwZWNpZmlj
YWxseSBsb29rIGF0IHRoZSB3aGF0CmdldHMgaGFuZGVkIHRvIHRoZSBjb21waWxlciwgYW5kIEkg
ZGlkIG5vdCBzZWUgdGhlIGFib3ZlLiBJIHdvbmRlcgp3aGV0aGVyIHRoYXQncyBhbHNvIHJlbGF0
ZWQgdG8gdGhlIFwiIHRoYXQgSSBmb3VuZCBuZWNlc3NhcnkgdG8gZHJvcCAtCndpdGggd2hhdCB5
b3Ugc2F5IEknZCBleHBlY3QgdGhlIHVuLWVzY2FwZWQgZG91YmxlIHF1b3RlcyB3b24ndCB3b3Jr
CmZvciB5b3UuIEkgc3VwcG9zZSB0aG91Z2ggdGhpcyB1bi1lc2NhcGluZyAob3Igbm90KSBoYXBw
ZW5zIGF0IGEgbGV2ZWwKb3RoZXIgdGhhbiB0aGUgY29tcGlsZXIsIGkuZS4gZWl0aGVyIGEgZGlm
ZmVyZW5jZSBpbiBzaGVsbCBvciBpbiBtYWtlCmJlaGF2aW9yLgoKSU9XIEkgZG9uJ3QgdGhpbmsg
anVzdCByZXBsYWNpbmcgXG4gYnkgOyB3aWxsIGRvLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
