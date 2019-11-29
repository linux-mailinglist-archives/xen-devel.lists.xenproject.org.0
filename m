Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5C610D76A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:48:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahWH-00043K-Uj; Fri, 29 Nov 2019 14:45:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iahWG-00043E-Pc
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:45:16 +0000
X-Inumbo-ID: db074744-12b6-11ea-a3e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db074744-12b6-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 14:45:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F0C4B178;
 Fri, 29 Nov 2019 14:45:15 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <20191129143509.26528-1-andrew.cooper3@citrix.com>
 <84fc3671-3cde-869b-495b-505c90544132@suse.com>
Message-ID: <40eefd78-26f0-9294-0c61-26679b890533@suse.com>
Date: Fri, 29 Nov 2019 15:45:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <84fc3671-3cde-869b-495b-505c90544132@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH XTF] CONSOLEIO_write stack overflow PoC
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxNTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAx
NTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQ2xhc3NpZnkgaXQgYXMgYW4gWFNBIHRlc3Qg
KHdoaWNoIGFyZ3VhYmx5IG91Z2h0IHRvIGJlIG5hbWVkICdzZWN1cml0eScpLAo+PiBkZXNwaXRl
IG5vIFhTQSBiZWluZyBpc3N1ZXMuCj4gCj4gTml0OiBpc3N1ZWQKPiAKPj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBGV0lXCj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIGEgcmVt
YXJrIGFuZCBhIHF1ZXN0aW9uOgo+IAo+PiAtLS0gYS9kb2NzL2FsbC10ZXN0cy5kb3gKPj4gKysr
IGIvZG9jcy9hbGwtdGVzdHMuZG94Cj4+IEBAIC0xNDMsNiArMTQzLDggQEAgWFNBLTI5MyAtIFNl
ZSBAcmVmIHRlc3QtcHYtZnNnc2Jhc2UuCj4+ICBAc3VicGFnZSB0ZXN0LXhzYS0yOTggLSBtaXNz
aW5nIGRlc2NyaXB0b3IgdGFibGUgbGltaXQgY2hlY2tpbmcgaW4geDg2IFBWCj4+ICBlbXVsYXRp
b24uCj4+ICAKPj4gK0BzdWJwYWdlIHRlc3QteHNhLWNvbnNvbGVpby13cml0ZSAtIENPTlNPTEVJ
T193cml0ZSBzdGFjayBvdmVyZmxvdwo+PiArCj4+ICAKPj4gIEBzZWN0aW9uIGluZGV4LXV0aWxp
dHkgVXRpbGl0aWVzCj4gCj4gRG8geW91IHJlYWxseSB3YW50IHR3byBzdWNjZXNzaXZlIGJsYW5r
IGxpbmVzIHRoZXJlPwo+IAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3Rlc3RzL3hzYS1jb25z
b2xlaW8td3JpdGUvbWFpbi5jCj4+IEBAIC0wLDAgKzEsNjkgQEAKPj4gKy8qKgo+PiArICogQGZp
bGUgdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9tYWluLmMKPj4gKyAqIEByZWYgdGVzdC14c2Et
Y29uc29sZWlvLXdyaXRlCj4+ICsgKgo+PiArICogVGhpcyBpc3N1ZSB3YXMgZGlzY292ZXJlZCBi
ZWZvcmUgaXQgbWFkZSBpdCBpbnRvIGFueSByZWxlYXNlZCB2ZXJzaW9uIG9mCj4+ICsgKiBYZW4u
ICBUaGVyZWZvcmUsIG5vIFhTQSBvciBDVkUgd2FzIGlzc3VlZC4KPj4gKyAqCj4+ICsgKiBBIGJ1
Z2ZpeCBpbiBYZW4gNC4xMyBhbHRlcmVkIENPTlNPTEVJT193cml0ZSB0byB0b2xlcmF0ZSBwYXNz
aW5nIE5VTAo+PiArICogY2hhcmFjdGVycyBpbnRhY3QsIGFzIHRoaXMgaXMgYSByZXF1aXJlbWVu
dCBmb3IgdmFyaW91cyBUVFkgc2V0dXBzLgo+PiArICoKPj4gKyAqIEEgc2lnbmVkLW5lc3MgaXNz
dWUgd2l0aCB0aGUgbGVuZ3RoIGNhbGN1bGF0aW9uIGxlYWQgdG8gYSBjYXNlIHdoZXJlIFhlbgo+
PiArICogd2lsbCBjb3B5IGJldHdlZW4gMiBhbmQgNEcgb2YgZ3Vlc3QgcHJvdmlkZWQgZGF0YSBp
bnRvIGEgMTI4IGJ5dGUgb2JqZWN0IG9uCj4+ICsgKiB0aGUgc3RhY2suCj4+ICsgKgo+PiArICog
QHNlZSB0ZXN0cy94c2EtY29uc29sZWlvLXdyaXRlL21haW4uYwo+PiArICovCj4+ICsjaW5jbHVk
ZSA8eHRmLmg+Cj4+ICsKPj4gK2NvbnN0IGNoYXIgdGVzdF90aXRsZVtdID0gIkNPTlNPTEVJT193
cml0ZSBzdGFjayBvdmVyZmxvdyBQb0MiOwo+PiArCj4+ICt1aW50OF90IHplcm9fcGFnZVtQQUdF
X1NJWkVdIF9fcGFnZV9hbGlnbmVkX2JzczsKPj4gKwo+PiArLyogSGF2ZSB0aGUgYXNzZW1ibGVy
IGJ1aWxkIGFuIEwxL0wyIHBhaXIgbWFwcGluZyB6ZXJvX3BhZ2VbXSBtYW55IHRpbWVzLiAqLwo+
PiArYXNtICgiLnNlY3Rpb24gXCIuZGF0YS5wYWdlX2FsaWduZWRcIiwgXCJhd1wiOyIKPj4gKyAg
ICAgIi5hbGlnbiA0MDk2OyIKPj4gKwo+PiArICAgICAibDF0OiIKPj4gKyAgICAgIi5yZXB0IDUx
MjsiCj4+ICsgICAgICIubG9uZyB6ZXJvX3BhZ2UgKyAiU1RSKFBGX1NZTShBRCwgUCkpIiwgMDsi
Cj4gCj4gVGhlcmUgYmVpbmcgbm8gZnVydGhlciAocnVudGltZSkgYWRqdXN0bWVudCB0byB0aGlz
IGFuZCAuLi4KPiAKPj4gKyAgICAgIi5lbmRyOyIKPj4gKyAgICAgIi5zaXplIGwxdCwgLiAtIGwx
dDsiCj4+ICsgICAgICIudHlwZSBsMXQsIEBvYmplY3Q7Igo+PiArCj4+ICsgICAgICJsMnQ6Igo+
PiArICAgICAiLnJlcHQgNTEyOyIKPj4gKyAgICAgIi5sb25nIGwxdCArICJTVFIoUEZfU1lNKEFE
LCBQKSkiLCAwOyIKPiAKPiAuLi4gdGhpcywgaXMgaXQgc2V0IGluIHN0b25lIHRoYXQgcGh5cyA9
PSBsaW4gaW4gWFRGIHRlc3RzPyBPcgo+IGRpZCB5b3UgbWVhbiB0aGlzIHRvIGJlIGh2bTMyLCBu
b3QgaHZtMzJwYWU/CgpXZWxsLCB0aGlzIGxhc3QgcGFydCB3YXMgbm9uc2Vuc2UgLSB0aGVyZSB3
b3VsZG4ndCBiZSBhbnkgcGFnZQp0YWJsZXMgaWYgaXQgd2FzIGh2bTMyLiBCdXQgdGhlIHF1ZXN0
aW9uIHJlbWFpbnMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
