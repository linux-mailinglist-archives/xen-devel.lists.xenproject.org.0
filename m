Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241114D732
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 09:02:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix4j8-0005Nh-PQ; Thu, 30 Jan 2020 07:59:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix4j7-0005Nc-1A
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 07:59:01 +0000
X-Inumbo-ID: 5e29982b-4336-11ea-8a13-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e29982b-4336-11ea-8a13-12813bfff9fa;
 Thu, 30 Jan 2020 07:58:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A781AE71;
 Thu, 30 Jan 2020 07:58:57 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4c53200e-f571-a3de-cb25-6548a40bbb94@suse.com>
 <20200128135626.GO57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0c5d0d2-052c-64b0-70cc-cf5650220876@suse.com>
Date: Thu, 30 Jan 2020 08:58:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128135626.GO57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/HVM: fix PM timer I/O port range
 version check
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNDo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAyOCwgMjAyMCBhdCAwMjoxNzo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gWE9S
LWluZyB0d28gYXJiaXRyYXJ5IG5vbi1lcXVhbCB2YWx1ZXMgbWF5IHByb2R1Y2UgMSBldmVuIGlm
IGJvdGggdmFsdWVzCj4+IGFyZSBkaWZmZXJlbnQgZnJvbSBib3RoIDAgYW5kIDEgKDIgYW5kIDMg
d291bGQgZml0LCBmb3IgZXhhbXBsZSkuIFVzZSBPUgo+PiBpbnN0ZWFkLCB3aGljaCB0b2dldGhl
ciB3aXRoIHRoZSBlYXJsaWVyIGJhaWxpbmcgdXBvbiBmaW5kaW5nCj4+ICJ2ZXJzaW9uID09IG9s
ZF92ZXJzaW9uIiBhY2hpZXZlcyB0aGUgaW50ZW5kZWQgZWZmZWN0Lgo+Pgo+PiBGaXhlczogZjBh
ZDIxYzQ5OWY3ICgieDg2IGh2bTogSW50cm9kdWNlIHBtdGltZXJfY2hhbmdlX2lvcG9ydCBhbmQg
SFZNX1BBUkFNX0FDUElfSU9QT1JUU19MT0NBVElPTiIpCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIGJ1dCBJIHdpdGhkcmF3IHRoaXMg
cGF0Y2guIFRoZSBjb2RlIGlzIGNvcnJlY3QgYXMgaXMsIGp1c3QKYSBsaXR0bGUgbGVzcyBvYnZp
b3VzbHkgY29ycmVjdCB0aGFuIHdpdGggdGhlIHVzZSBvZiB8LiBBcyBsb25nIGFzCnRoZXJlJ3Mg
bm8gd2F5IGZvciB0aGUgdmFsdWUgc3RvcmVkIGluIFhlbiB0byBiZSBsYXJnZXIgdGhhbiAxLAp0
aGVyZSdzIGFsc28gbm8gd2F5IGZvciBhIGxhcmdlciB2YWx1ZSB0byBwYXNzIHRoZSBjaGVjayBp
bgpxdWVzdGlvbi4KCkluc3RlYWQgSSBub3RpY2UgdGhlIHVwcGVyIDMyIGJpdHMgb2YgdGhlIHZh
bHVlIGFyZSBzaWxlbnRseQppZ25vcmVkLiBJJ2xsIHN1Ym1pdCBhIG5ldyBwYXRjaCBhZGRyZXNz
aW5nIHRoYXQgaW5zdGVhZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
