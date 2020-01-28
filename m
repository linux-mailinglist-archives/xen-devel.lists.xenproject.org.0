Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262914BE67
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:18:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUS0-0004R1-9T; Tue, 28 Jan 2020 17:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f0Vb=3R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwURy-0004Qw-P9
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:14:54 +0000
X-Inumbo-ID: b2c11cfa-41f1-11ea-873d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2c11cfa-41f1-11ea-873d-12813bfff9fa;
 Tue, 28 Jan 2020 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580231694;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kMFMkU7bFWssI/yHI9L+6UfZFRPlStu+Vbem6aRoKi4=;
 b=iAAJSedX5hvp0DUyvS9w+l4+cy2a47tFBzrw4zJdy2DvI9Nwr9u7FUIi
 LQ/ba67OhkZ0S9TRBn9cYxiQcSk37zOoDAMlAmfC6evkoCw+3yrKRYblu
 R/YO/rBucuenDMThzmQXYmQ8/g3IIxVR9yop3KykkoLZw39gBwhz8n1/3 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rwrV2cfkCABH8N01jc3eNjr/f4I9mwxlOZOGjSZ3ZW21KVXKoLJR/EBvKE/mOUs8rXCFHsrOs6
 cGEuX6TKMrH0TUiYNhudrv8fxOpMph3uO6E/K9fxsTLcI65wGeXVK7BpdnxbGu98SumPq/599E
 TMDUvHEiyh6udiLGQSZUHaQoZiRkbbUixaxI7uQn0MsfG9/+uvldTP7CIRlsHoortIahHNdL8q
 a4YLYM/oz2E21OZTQI2trmPzNYm7dml4xNOOSU4enNQQuiaRs2cSPt8u2QscdOmpZUFFlJbRNM
 fuA=
X-SBRS: 2.7
X-MesageID: 11741147
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11741147"
To: Jan Beulich <jbeulich@suse.com>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
 <f7a3e838-39b9-378f-d730-dc32d18e8043@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <28f047db-0609-de96-a80e-46b5646e947f@citrix.com>
Date: Tue, 28 Jan 2020 17:14:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f7a3e838-39b9-378f-d730-dc32d18e8043@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDEvMjAyMCAxMzo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDEuMjAyMCAy
MToyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQ3VycmVudGx5IHdoZW4gYm9vdGluZyBuYXRp
dmUgb24gQU1EIGhhcmR3YXJlLCBjcHVpZG1hc2tfZGVmYXVsdHMuXzFjZCBnZXRzCj4+IGNvbmZp
Z3VyZWQgd2l0aCB0aGUgSFlQRVJWSVNPUiBiaXQgYmVmb3JlIG5hdGl2ZSBDUFVJRCBpcyBzY2Fu
bmVkIGZvciBmZWF0dXJlCj4+IGJpdHMuCj4+Cj4+IFRoaXMgcmVzdWx0cyBpbiBjcHVfaGFzX2h5
cGVydmlzb3IgYmVjb21pbmcgc2V0IGFzIHBhcnQgb2YgaWRlbnRpZnlfY3B1KCksIGFuZAo+PiBl
bmRzIHVwIGFwcGVhcmluZyBpbiB0aGUgcmF3IGFuZCBob3N0IENQVSBwb2xpY2llcy4gIE5vdGhp
bmcgaGFzIHJlYWxseSBjYXJlZAo+PiBpbiB0aGUgcGFzdC4KPj4KPj4gQWx0ZXIgYW1kX2luaXRf
bGV2ZWxsaW5nKCkgdG8gZXhjbHVkZSB0aGUgSFlQRVJWSVNPUiBiaXQgZnJvbQo+PiBjcHVtYXNr
X2RlZmF1bHRzLCBhbmQgdXBkYXRlIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoKSB0byBhbGxv
dyBpdCB0byBiZQo+PiBleHBsaWNpdGx5IGZvcndhcmRlZC4KPj4KPj4gVGhpcyBpbiB0dXJuIGhp
Z2hsaWdodGVkIHRoYXQgZG9tMCBjb25zdHJ1Y3Rpb24gd2FzIGFzeW1ldHJpYyB3aXRoIGRvbVUK
Pj4gY29uc3RydWN0aW9uLCBieSBub3QgaGF2aW5nIGFueSBjYWxscyB0byBkb21haW5fY3B1X3Bv
bGljeV9jaGFuZ2VkKCkuICBFeHRlbmQKPj4gYXJjaF9kb21haW5fY3JlYXRlKCkgdG8gYWx3YXlz
IGNhbGwgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgo+Pgo+PiBSZXBvcnRlZC1ieTogSWdv
ciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBDQzog
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KPj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBDQzog
SWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+Cj4+IFdpdGhvdXQg
dGhpcyBmaXgsIHRoZXJlIGlzIGFwcGFyZW50bHkgYSBwcm9ibGVtIHdpdGggUm9nZXIncyAiW1BB
VENIIHYzIDcvN10KPj4geDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggd2hl
biBhdmFpbGFibGUiIG9uIG5hdGl2ZSBBTUQgaGFyZHdhcmUuCj4+IEkgaGF2ZW4ndCBpbnZlc3Rn
aWF0ZWQgdGhlIGlzc3VlIHdpdGggdGhhdCBwYXRjaCBzcGVjaWZpY2FsbHksIGJlY2F1c2UKPj4g
Y3B1X2hhc19oeXBlcnZpc29yIGJlaW5nIHdyb25nIGlzIG9idmlvdXNseSBhIGJ1Zy4KPj4KPj4g
VGhpcyBpcyBvbmUgb2YgdHdvIHBvc3NpYmxlIGFwcHJvYWNoZXMsIGFuZCBib3RoIGhhdmUgdGhl
aXIgZG93bnNpZGVzLiAgVGhpcwo+PiBvbmUgdGFrZXMgYW4gZXh0cmEgaGl0IG9uIGNvbnRleHQg
c3dpdGNoZXMgYmV0d2VlbiBQViB2Y3B1cyBhbmQgaWRsZS9odm0sIGFzCj4+IHRoZXkgd2lsbCB1
c3VhbGx5IGRpZmZlciBpbiBIWVBFUlZJU09SIGJpdC4KPiBXaHkgd291bGQgdGhleSBkaWZmZXIg
aW4gdGhlIEhZUEVSVklTT1IgYml0PyBNYXliZSBmb3IgaWRsZSAoYWxiZWl0Cj4gb2ZmIHRoZSB0
b3Agb2YgbXkgaGVhZCBJIGNhbid0IHJlY2FsbCB1cyBzcGVjaWFsIGNhc2luZyBpZGxlIHdydAo+
IENQVUlEIGhhbmRsaW5nKSwgYnV0IHdoeSBmb3IgUFYgdnMgSFZNPyBUaGUgaWRsZSBjYXNlLCBp
ZiB0aGVyZSBpcwo+IGFuIGlzc3VlIHdpdGggdGhpcywgY291bGQgYmUgdGFrZW4gY2FyZSBvZiBi
eSBhY3R1YWxseSBzZXR0aW5nIHRoZQo+IGJpdCB0aGVyZSwgYXMgbm8tb25lIHNob3VsZCBjYXJl
IGFib3V0IHdoYXQgaXQncyBzZXQgdG8/CgpkLT5hcmNoLnB2LmNwdWlkbWFza3MgaXMgb25seSBh
bGxvY2F0ZWQgZm9yIFBWIGRvbWFpbnMgKGFuZCBzdGFydHMgYnkKZHVwKClpbmcgdGhlIGRlZmF1
bHQpLgoKV2hlbiBjb250ZXh0IHN3aXRjaGluZyBsZXZlbGxpbmcgTVNScywgYW55IG5vbi1QViBn
dWVzdCB1c2VzCmNwdW1hc2tfZGVmYXVsdC7CoCBUaGlzIGNhcHR1cmVzIGlkbGUgYW5kIEhWTSB2
Y3B1cy4KClRoaXMgaXMgbmVjZXNzYXJ5IGJlY2F1c2UsIGF0IGxlYXN0IGF0IHRoZSB0aW1lIGl0
IHdhcyBpbnRyb2R1Y2VkLAp7cHYsaHZtfV9jcHVpZCgpIGlzc3VlZCBuYXRpdmUgQ1BVSUQgaW5z
dHJ1Y3Rpb25zIHRvIHRoZW4gZmVlZCBkYXRhIGJhY2sKaW50byBndWVzdCBjb250ZXh0LsKgIEl0
cyBwcm9iYWJseSBsZXNzIHJlbGV2YW50IG5vdyB0aGF0IGd1ZXN0X2NwdWlkKCkKZG9lc24ndCBp
c3N1ZSBuYXRpdmUgaW5zdHJ1Y3Rpb25zIGluIHRoZSBnZW5lcmFsIGNhc2UuCgpFaXRoZXIgd2F5
LCBIVk0gZ2FpbmVkIHRoZSBkZWZhdWx0IGxpa2UgaWRsZSwgdG8gY2F1c2UgdGhlIGxhenkKc3dp
dGNoaW5nIGxvZ2ljIHRvIHN3aXRjaCBsZXNzIG9mdGVuLgoKVGhlIHByb2JsZW0gd2UgaGF2ZSBh
ZnRlciB0aGlzIHBhdGNoIGlzIHRoYXQgZGVmYXVsdCBkaWZmZXJzIGZyb20gUFYgaW4KdGhlIEhZ
UEVSVklTT1IgYml0LCB3aGljaCBiYXNpY2FsbHkgZ3VhcmFudGVlcyB0aGF0IHdlIHJld3JpdGUg
dGhlIGxlYWYKMSBsZXZlbGxpbmcgb24gZWFjaCBjb250ZXh0IHN3aXRjaC4KCkhvd2V2ZXIsIGhh
dmluZyBsb29rZWQgYXQgdGhlIG90aGVyIGZlYXR1cmVzIGJpdHMgd2hpY2ggZGlmZmVyIGZvciBQ
ViwKVk1FIGFuZCBQU0UzNiBiZWluZyBoaWRkZW4gbWVhbnMgd2UncmUgYWx3YXlzIHN3aXRjaGlu
ZyBsZWFmIDEgYW55d2F5LApzbyB0aGlzIGNoYW5nZSBmb3IgSFlQRVJWSVNPUiBkb2Vzbid0IG1h
a2UgdGhlIHNpdHVhdGlvbiBhbnkgd29yc2UuCgo+PiBUaGUgb3RoZXIgYXBwcm9hY2ggaXMgdG8g
b3JkZXIgdGhpbmdzIG1vcmUgY2FyZWZ1bGx5IHNvIGxldmVsbGluZyBpcwo+PiBjb25maWd1cmVk
IGFmdGVyIHNjYW5uaW5nIGZvciBjcHVpZCBiaXRzLCBidXQgdGhhdCBoYXMgdGhlIGRvd25zaWRl
IHRoYXQgaXQgaXMKPj4gdmVyeSBlYXN5IHRvIHJlZ3Jlc3MuCj4+Cj4+IFRob3VnaHRzIG9uIHdo
aWNoIGlzIHRoZSBsZWFzdC1iYWQgYXBwcm9hY2ggdG8gdGFrZT8gIEhhdmluZyB3cml0dGVuIHRo
aXMKPj4gcGF0Y2gsIEknbSBub3cgZXJyaW5nIG9uIHRoZSBzaWRlIG9mIGRvaW5nIGl0IHRoZSBv
dGhlciB3YXkuCj4gQmVzaWRlcyB0aGUgbmVlZCBmb3IgbWUgdG8gdW5kZXJzdGFuZCB0aGUgYXNw
ZWN0IGFib3ZlLCBJJ20gYWZyYWlkCj4gdG8ganVkZ2UgSSdkIG5lZWQgdG8gaGF2ZSBhdCBsZWFz
dCBhIHNrZXRjaCBvZiB3aGF0IHRoZSBhbHRlcm5hdGl2ZQo+IHdvdWxkIGxvb2sgbGlrZSwgaW4g
cGFydGljdWxhciB0byBmaWd1cmUgaG93IGZyYWdpbGUgaXQgcmVhbGx5IGlzLgoKSXQgd291bGQg
YmUgYSBzbWFsbCBiaXQgb2YgY2FyZWZ1bCByZW9yZGVyaW5nIGluIGNwdS9hbWQuYwoKVGhlIHRp
cHBpbmcgZmFjdG9yIGlzIHRoYXQsIGV2ZW4gaWYgd2UgYXJyYW5nZSBmb3IgaWRsZSBjb250ZXh0
IG5vdCB0bwpoYXZlIEhZUEVSVklTT1Igc2V0IChhbmQgdGhlcmVmb3JlIGNwdV9oYXNfaHlwZXJ2
aXNvciBlbmRpbmcgdXAgY2xlYXIKd2hlbiBzY2FubmVkKSwgYSByZWd1bGFyIENQVUlEIGluc3Ry
dWN0aW9uIGluIFBWIGNvbnRleHQgd291bGQgc2VlCkhZUEVSVklTT1IgYXMgYSBwcm9wZXJ0eSBv
ZiB2aXJ0dWFsaXNpbmcgdGhpbmdzIHNlbnNpYmx5IGZvciBndWVzdHMuCgpBcyB3ZSBuZWVkIHRv
IGNvcGUgd2l0aCBIWVBFUlZJU09SIGJlaW5nIHZpc2libGUgaW4gc29tZSBjb250ZXh0cywgaXRz
CmJldHRlciB0byBjb25zaWRlciBpdCB1bmlmb3JtbHkgdmlzaWJsZSBhbmQgYnJlYWsgYW55IGtp
bmQgb2Ygbm90aW9uYWwKbGluayBiZXR3ZWVuIGNwdV9oYXNfaHlwZXJ2aXNvciBtYXRjaGluZyB3
aGF0IENQVUlEIHdvdWxkIHNlZSBhcyB0aGUgYml0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
