Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C331391AC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 14:03:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqzLE-0003hR-I6; Mon, 13 Jan 2020 13:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iqzLC-0003hM-Fn
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 13:01:10 +0000
X-Inumbo-ID: c3f734b2-3604-11ea-8263-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3f734b2-3604-11ea-8263-12813bfff9fa;
 Mon, 13 Jan 2020 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578920470;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ngkACCPTrWi5McT5n6PAauLZLAB+ALgfEQVDPw6WcrY=;
 b=Su2e4iPGELoWTwm46da+RZIlUY3XW/Mp/aXEHZI7iA3vNvF+POP4ptAT
 /RY1kEcrfJvBIf4RuYRF1L3xQfWIRL916j/yuGWhAlKmvpasKbDuBxV6E
 uy4icJudZdQuglelzNKOAGuDWSTGB+uQwqQeH/hJ0N4xr91j5Dj0eolt4 A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GlauahcLPcHiN+06JBb+FFer7fhPNPvyqF8yyWZbPPRkFWWBNJGIFBvz8S9tRXAkU1/OKSXilb
 N87abC6Y4uVDvvv6XHlqkQvbGa2yqAh/Zy3zCUL8DN5Q89i90pTh+XBvuk5sMsHe51PcK1oND1
 AfmXW8js1o5PHvxveLH0UTha768NDUThPbfKNdX+wVzVxbtMXVjDGi6ILPC+ZeDOAg8q7Y6e89
 y8ulSfoUwjf57z9mM1ueqD6xvKVBchjvg86GkD4dK+2YeTImmj/FVhP+jPxHpCTNTPOadGpw53
 qoo=
X-SBRS: 2.7
X-MesageID: 10820025
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10820025"
To: "Singh, Balbir" <sblbir@amazon.com>, "peterz@infradead.org"
 <peterz@infradead.org>, "Valentin, Eduardo" <eduval@amazon.com>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7bb967ca-2a91-6397-9c0a-6eafd43c83ed@citrix.com>
Date: Mon, 13 Jan 2020 13:01:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC PATCH V2 11/11] x86: tsc: avoid system
 instability in hibernation
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
Cc: "konrad.wilk@oracle.co" <konrad.wilk@oracle.co>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com"
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDEvMjAyMCAxMTo0MywgU2luZ2gsIEJhbGJpciB3cm90ZToKPiBPbiBNb24sIDIwMjAt
MDEtMTMgYXQgMTE6MTYgKzAxMDAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+PiBPbiBGcmksIEph
biAxMCwgMjAyMCBhdCAwNzozNToyMEFNIC0wODAwLCBFZHVhcmRvIFZhbGVudGluIHdyb3RlOgo+
Pj4gSGV5IFBldGVyLAo+Pj4KPj4+IE9uIFdlZCwgSmFuIDA4LCAyMDIwIGF0IDExOjUwOjExQU0g
KzAxMDAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+Pj4+IE9uIFR1ZSwgSmFuIDA3LCAyMDIwIGF0
IDExOjQ1OjI2UE0gKzAwMDAsIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOgo+Pj4+PiBGcm9tOiBFZHVh
cmRvIFZhbGVudGluIDxlZHV2YWxAYW1hem9uLmNvbT4KPj4+Pj4KPj4+Pj4gU3lzdGVtIGluc3Rh
YmlsaXR5IGFyZSBzZWVuIGR1cmluZyByZXN1bWUgZnJvbSBoaWJlcm5hdGlvbiB3aGVuIHN5c3Rl
bQo+Pj4+PiBpcyB1bmRlciBoZWF2eSBDUFUgbG9hZC4gVGhpcyBpcyBkdWUgdG8gdGhlIGxhY2sg
b2YgdXBkYXRlIG9mIHNjaGVkCj4+Pj4+IGNsb2NrIGRhdGEsIGFuZCB0aGUgc2NoZWR1bGVyIHdv
dWxkIHRoZW4gdGhpbmsgdGhhdCBoZWF2eSBDUFUgaG9nCj4+Pj4+IHRhc2tzIG5lZWQgbW9yZSB0
aW1lIGluIENQVSwgY2F1c2luZyB0aGUgc3lzdGVtIHRvIGZyZWV6ZQo+Pj4+PiBkdXJpbmcgdGhl
IHVuZnJlZXppbmcgb2YgdGFza3MuIEZvciBleGFtcGxlLCB0aHJlYWRlZCBpcnFzLAo+Pj4+PiBh
bmQga2VybmVsIHByb2Nlc3NlcyBzZXJ2aWNpbmcgbmV0d29yayBpbnRlcmZhY2UgbWF5IGJlIGRl
bGF5ZWQKPj4+Pj4gZm9yIHNldmVyYWwgdGVucyBvZiBzZWNvbmRzLCBjYXVzaW5nIHRoZSBzeXN0
ZW0gdG8gYmUgdW5yZWFjaGFibGUuCj4+Pj4+IFRoZSBmaXggZm9yIHRoaXMgc2l0dWF0aW9uIGlz
IHRvIG1hcmsgdGhlIHNjaGVkIGNsb2NrIGFzIHVuc3RhYmxlCj4+Pj4+IGFzIGVhcmx5IGFzIHBv
c3NpYmxlIGluIHRoZSByZXN1bWUgcGF0aCwgbGVhdmluZyBpdCB1bnN0YWJsZQo+Pj4+PiBmb3Ig
dGhlIGR1cmF0aW9uIG9mIHRoZSByZXN1bWUgcHJvY2Vzcy4gVGhpcyB3aWxsIGZvcmNlIHRoZQo+
Pj4+PiBzY2hlZHVsZXIgdG8gYXR0ZW1wdCB0byBhbGlnbiB0aGUgc2NoZWQgY2xvY2sgYWNyb3Nz
IENQVXMgdXNpbmcKPj4+Pj4gdGhlIGRlbHRhIHdpdGggdGltZSBvZiBkYXksIHVwZGF0aW5nIHNj
aGVkIGNsb2NrIGRhdGEuIEluIGEgcG9zdAo+Pj4+PiBoaWJlcm5hdGlvbiBldmVudCwgd2UgY2Fu
IHRoZW4gbWFyayB0aGUgc2NoZWQgY2xvY2sgYXMgc3RhYmxlCj4+Pj4+IGFnYWluLCBhdm9pZGlu
ZyB1bm5lY2Vzc2FyeSBzeW5jcyB3aXRoIHRpbWUgb2YgZGF5IG9uIHN5c3RlbXMKPj4+Pj4gaW4g
d2hpY2ggVFNDIGlzIHJlbGlhYmxlLgo+Pj4+IFRoaXMgbWFrZXMgbm8gZnJpZ2dpbmcgc2Vuc2Ug
d2hhdCBzbyBibG9vZHkgZXZlci4gSWYgdGhlIGNsb2NrIGlzCj4+Pj4gc3RhYmxlLCB3ZSBkb24n
dCBjYXJlIGFib3V0IHNjaGVkX2Nsb2NrX2RhdGEuIFdoZW4gaXQgaXMgc3RhYmxlIHlvdSBnZXQK
Pj4+PiBhIGxpbmVhciBmdW5jdGlvbiBvZiB0aGUgVFNDIHdpdGhvdXQgY29tcGxpY2F0ZWQgYml0
cyBvbi4KPj4+Pgo+Pj4+IFdoZW4gaXQgaXMgdW5zdGFibGUsIG9ubHkgdGhlbiBkbyB3ZSBjYXJl
IGFib3V0IHRoZSBzY2hlZF9jbG9ja19kYXRhLgo+Pj4+Cj4+PiBZZWFoLCBtYXliZSB3aGF0IGlz
IG5vdCBjbGVhciBoZXJlIGlzIHRoYXQgd2UgY292ZXJpbmcgZm9yIHNpdHVhdGlvbgo+Pj4gd2hl
cmUgY2xvY2sgc3RhYmlsaXR5IGNoYW5nZXMgb3ZlciB0aW1lLCBlLmcuIGF0IHJlZ3VsYXIgYm9v
dCBjbG9jayBpcwo+Pj4gc3RhYmxlLCBoaWJlcm5hdGlvbiBoYXBwZW5zLCB0aGVuIHJlc3RvcmUg
aGFwcGVucyBpbiBhIG5vbi1zdGFibGUgY2xvY2suCj4+IFN0aWxsIGNvbmZ1c2VkLCB3aG8gbWFy
a3MgdGhlIHRoaW5nIHVuc3RhYmxlPyBUaGUgcGF0Y2ggc2VlbXMgdG8gc3VnZ2VzdAo+PiB5b3Ug
ZG8geW91cnNlbGYsIGJ1dCBpdCBpcyBub3QgYXQgYWxsIGNsZWFyIHdoeS4KPj4KPj4gSWYgVFND
IHJlYWxseSBpcyB1bnN0YWJsZSwgdGhlbiBpdCBuZWVkcyB0byByZW1haW4gdW5zdGFibGUuIElm
IHRoZSBUU0MKPj4gcmVhbGx5IGlzIHN0YWJsZSB0aGVuIHRoZXJlIGlzIG5vIHBvaW50IGluIG1h
cmtpbmcgaXMgdW5zdGFibGUuCj4+Cj4+IEVpdGhlciB3YXkgc29tZXRoaW5nIGlzIG9mZiwgYW5k
IHlvdSdyZSBub3QgdGVsbGluZyBtZSB3aGF0Lgo+Pgo+IEhpLCBQZXRlcgo+Cj4gRm9yIHlvdXIg
b3JpZ2luYWwgY29tbWVudCwganVzdCB3YW50ZWQgdG8gY2xhcmlmeSB0aGUgZm9sbG93aW5nOgo+
Cj4gMS4gQWZ0ZXIgaGliZXJuYXRpb24sIHRoZSBtYWNoaW5lIGNhbiBiZSByZXN1bWVkIG9uIGEg
ZGlmZmVyZW50IGJ1dCBjb21wYXRpYmxlCj4gaG9zdCAodGhlc2UgYXJlIFZNIGltYWdlcyBoaWJl
cm5hdGVkKQo+IDIuIFRoaXMgbWVhbnMgdGhlIGNsb2NrIGJldHdlZW4gaG9zdDEgYW5kIGhvc3Qy
IGNhbi93aWxsIGJlIGRpZmZlcmVudAoKVGhlIGd1ZXN0cyBUU0MgdmFsdWUgaXMgcGFydCBvZiBh
bGwgc2F2ZS9taWdyYXRlL3Jlc3VtZSBzdGF0ZS7CoCBHaXZlbgp0aGlzIGJ1ZywgSSBwcmVzdW1l
IHlvdSd2ZSBhY3R1YWxseSBkaXNjYXJkZWQgYWxsIHJlZ2lzdGVyIHN0YXRlIG9uCmhpYmVybmF0
ZSwgYW5kIHRoZSBUU0MgaXMgc3RhcnRpbmcgYWdhaW4gZnJvbSAwPwoKVGhlIGZyZXF1ZW5jeSBv
ZiB0aGUgbmV3IFRTQyBtaWdodCB2ZXJ5IGxpa2VseSBiZSBkaWZmZXJlbnQsIGJ1dCB0aGUKc2Nh
bGUvb2Zmc2V0IGluIHRoZSBwYXJhdmlydHVhbCBjbG9jayBpbmZvcm1hdGlvbiBzaG91bGQgbGV0
IExpbnV4J3MKdmlldyBvZiB0aW1lIHN0YXkgY29uc2lzdGVudC4KCj4gSW4geW91ciBjb21tZW50
cyBhcmUgeW91IG1ha2luZyB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBob3N0KHMpIGlzL2FyZSB0
aGUKPiBzYW1lPyBKdXN0IGNoZWNraW5nIHRoZSBhc3N1bXB0aW9ucyBiZWluZyBtYWRlIGFuZCBi
ZWluZyBvbiB0aGUgc2FtZSBwYWdlIHdpdGgKPiB0aGVtLgoKVFNDcyBhcmUgYSBtYXNzaXZlIHNv
dXJjZSBvZiAiZnVuIi7CoCBJJ20gbm90IHN1cnByaXNlZCB0aGF0IHRoZXJlIGFyZQp5ZXQgbW9y
ZSBidWdzIGFyb3VuZC4KCkRvZXMgYW55b25lIGFjdHVhbGx5IGtub3cgd2hhdCBkb2VzL3Nob3Vs
ZCBoYXBwZW4gdG8gdGhlIHJlYWwgVFNDIG9uCm5hdGl2ZSBTND/CoCBUaGUgZGVmYXVsdCBjb3Vy
c2Ugb2YgYWN0aW9uIHNob3VsZCBiZSBmb3IgdmlydHVhbGlzYXRpb24gdG8KZm9sbG93IHN1aXQu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
