Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D389D0DBD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 13:34:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIA9w-0007fk-BB; Wed, 09 Oct 2019 11:29:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LyQK=YC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIA9v-0007fb-66
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:29:35 +0000
X-Inumbo-ID: 114d8bc6-ea88-11e9-97ee-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 114d8bc6-ea88-11e9-97ee-12813bfff9fa;
 Wed, 09 Oct 2019 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570620575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WMbhB7vDsu3iaW6CKRnmjnVVc7JxRIeUXnjnNbbhAZg=;
 b=IgMEmifojMO48DOS3xv7GP33BuNZAfIc54M517SxDrjW9uqgaonqvVt+
 YyXfypLLjCSTqLVIjjac6S1SfAy8CzHtS8XvGHU1yGBcB5A3YQSjixsFX
 yjBY4KHHlO2geSGTSNz3T107hNpuw1O0iLqh8qdl/03QrcSlv8U8DZoaQ w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5xGCWlJUj6WqS+lKPWzBM3YX3xseJlk7Hup0x6n96XEJseCCVYya2aTB5lBreBgnDYkpDP3ST0
 oi9HrNZq9SNjZZvQNl8SG0YugDz+qM87ku09lYw5w0S8TJivSbkGTvSm2crqsBgWNXH6Kot6Da
 VpaW6DMFfQGF5FKo2zsQNKQK7ydbeqRE6bYQBdwAxrN3EiW5kT5jyjvTsMNiLk+kx5wqDy1+XI
 UXVfIrOmXO+3/XI96UcaKGEpDpSFK6z5SjOuD45iB6dn/BId4/TMAlLUMoVt/dFpUVxt/UplkY
 P+k=
X-SBRS: 2.7
X-MesageID: 6654017
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,273,1566878400"; 
   d="scan'208";a="6654017"
Date: Wed, 9 Oct 2019 13:29:27 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009112927.GC1389@Air-de-Roger.citrite.net>
References: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
 <67e9bc2c-82dc-5fd7-9b8c-29d564a30ddb@suse.com>
 <20191009101116.GA1389@Air-de-Roger.citrite.net>
 <dd2b5da6-e1fc-a490-9276-8ad44721fa9e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd2b5da6-e1fc-a490-9276-8ad44721fa9e@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] HPET interrupt remapping during boot
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTI6NDE6MDVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTAuMjAxOSAxMjoxMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBB
bmQgaXQgZG9lcyBwcmludCB0aGUgZm9sbG93aW5nIHdoZW4gc2V0dGluZyB1cCB0aGUgaW9tbXU6
Cj4gPiAKPiA+IChYRU4pIGlvYXBpYyAwIHBpbiAwIG5vdCBtYXNrZWQKPiA+IChYRU4pIHZlYz0w
MCBkZWxpdmVyeT1FeElOVCBkZXN0PVAgc3RhdHVzPTAgcG9sYXJpdHk9MCBpcnI9MCB0cmlnPUUg
bWFzaz0wIGRlc3RfaWQ6MDAwMTAwMDAKPiA+IAo+ID4gSSB3b25kZXIsIHNob3VsZG4ndCBhbGwg
cGlucyBvZiBhbGwgdGhlIGlvLWFwaWNzIGJlIG1hc2tlZCBhdCBib290Pwo+IAo+IEkgdGhpbmsg
eW91IG1pZ2h0IGdldCBkaWZmZXJlbnQgYW5zd2VycyBoZXJlIGRlcGVuZGluZyBvbiB3aGV0aGVy
Cj4geW91IGFzayBmaXJtd2FyZSBvciBPUyBwZW9wbGUuIEluIGZhY3QgdGhlcmUgYXJlIGNhc2Vz
IHdoZXJlIHRoZQo+IElPLUFQSUMgbmVlZHMgdG8gYmUgbGVmdCBpbiB0aGlzIHN0YXRlLCBJIHRo
aW5rLCBidXQgc3VjaCB3b3VsZAo+IGxpa2VseSBuZWVkIHByb3Blcmx5IHJlZmxlY3RpbmcgaW4g
QUNQSSB0YWJsZXMgKGFsYmVpdCBJIGRvbid0Cj4ga25vdy9yZWNhbGwgaG93IHRoaXMgd291bGQg
YmUgZG9uZTsgbG9va2luZyBhdCB0aGUgY29kZSApLiBUaGlzIGdvZXMgYmFjayB0byB0aW1lcwo+
IHdoZW4gSU8tQVBJQ3Mgd2VyZSBuZXcgYW5kIE9TZXMgd291bGQgbm90IGV2ZW4ga25vdyBhYm91
dCB0aGVtLAo+IHlldCB0aGV5IHdvdWxkbid0IGdldCBhbnkgaW50ZXJydXB0cyB0byB3b3JrIGlm
IGZpZGRsaW5nIHdpdGgKPiBvbmx5IHRoZSBQSUMgKHNpdHRpbmcgYmVoaW5kIElPLUFQSUMgcGlu
IDApLgo+IAo+IFNlZSBlbmFibGVfSU9fQVBJQygpLCB3aGVyZSB3ZSBhY3R1YWxseSB1c2UgdGhp
cyBwcm9wZXJ0eSB0bwo+IGRldGVybWluZSB0aGUgcGluIGJlaGluZCB3aGljaCB0aGUgODI1OSBz
aXRzLgo+IAo+IEkndmUgc2VlbiBxdWl0ZSBtYW55IHN5c3RlbXMgd2hlcmUgaW4gdGhlIEJJT1Mg
c2V0dXAgeW91IGhhdmUgYW4KPiBvcHRpb24gdG8gc2VsZWN0IHdoZXRoZXIgeW91IGhhdmUgYW4g
IkFDUEkgT1MiICh3b3JkaW5nIG9mIGNvdXJzZQo+IHZhcmllcykuIEkndmUgbmV2ZXIgY2hlY2tl
ZCB3aGV0aGVyIHRoaXMgbWF5IGUuZy4gcmVmbGVjdCBpdHNlbGYKPiBpbiB0aGUgaGFuZG92ZXIg
c3RhdGUgb2YgdGhlIEdTSSAwIFJURS4KPiAKPiBJbiB5b3VyIHRlc3RpbmcgcGF0Y2gsIGNvdWxk
IHlvdSBhbHNvIGxvZyB0aGUgUElDIG1hc2sgYnl0ZXM/Cj4gVGhlcmUgb3VnaHQgdG8gYmUgYXQg
bGVhc3Qgb25lIHVubWFza2VkOyBvciB3YWl0IC0gdGhlcmUgYWN0dWFsbHkKPiBpcyBhIHNwdXJp
b3VzIGludGVycnVwdCB0aGVyZSAocmlnaHQgYmVmb3JlIElPTU1VIGluaXRpYWxpemF0aW9uKToK
PiAKPiAoWEVOKSBzcHVyaW91cyA4MjU5QSBpbnRlcnJ1cHQ6IElSUTcuCgpTbyBJJ3ZlIGFkZGVk
IGEgbG9nIG9mIHRoZSBQSUMgbWFza3MganVzdCBiZWZvcmUgY2hlY2tpbmcgdGhlIGlvYXBpYwpt
YXNrczoKCihYRU4pIDgyNTlBLTEgbWFzazogZmUgODI1OUEtMiBtYXNrOiBmZgoKQUZBSUNUIElS
UTcgc2VlbXMgdG8gYmUgdW5tYXNrZWQ/IFNvcnJ5IG15IGtub3dsZWRnZSBvZiBQSUNzIGlzIHF1
aXRlCmxpbWl0ZWQgc2luY2UgSSd2ZSBuZXZlciBoYWQgdG8gZGVhbCB3aXRoIHRoZW0uCgpUaGUg
bGluZSBJJ3ZlIGFkZGVkIGlzOgoKcHJpbnRrKCI4MjU5QS0xIG1hc2s6ICV4IDgyNTlBLTIgbWFz
azogJXhcbiIsIGluYigweDIxKSwgaW5iKDB4QTEpKTsKCkkgd29uZGVyIHdoeSBkb2VzIFhlbiBl
dmVuIGhhcyBhbnkgY29kZSB0byBkZWFsIHdpdGggdGhlIFBJQ3MsCnNob3VsZG4ndCB3ZSByZWx5
IG9uIGlvLWFwaWNzIG9ubHkgZm9yIGxlZ2FjeSBkZWxpdmVyeT8KCj4gSGVuY2UgSSB3b25kZXIg
aWYgdGhlcmUncyBub3QgcG9zc2libHkgYSAybmQgb25lIG9uY2UgdGhlIElPTU1VCj4gaGFzIGJl
ZW4gc2V0IHVwLgoKUmlnaHQsIHRoZW4gSSBndWVzcyB3ZSBlaXRoZXIgbWFzayBhbGwgdGhlIGlv
LWFwaWMgcGlucyBvciB3ZSBzZXR1cApwcm9wZXIgcmVtYXBwaW5nIGVudHJpZXMgZm9yIG5vbi1t
YXNrZWQgcGlucz8gKGluIG9yZGVyIHRvIGF2b2lkIGlvbW11CmZhdWx0cykKClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
