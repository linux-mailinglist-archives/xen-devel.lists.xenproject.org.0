Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5029167ECE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:39:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58U8-00029W-Sd; Fri, 21 Feb 2020 13:36:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j58U7-00029R-OA
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:36:51 +0000
X-Inumbo-ID: 36c1a338-54af-11ea-8660-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36c1a338-54af-11ea-8660-12813bfff9fa;
 Fri, 21 Feb 2020 13:36:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD789B18D;
 Fri, 21 Feb 2020 13:36:49 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
Date: Fri, 21 Feb 2020 14:36:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221091005.GT4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBPbiAyMC8wMi8yMDIwIDE3OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBB
bGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNv
IGxvY2sgaXQgaW4KPj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFsbG93aW5nIHJl
YWQgbG9ja2luZyBhIHJ3bG9jayB0aGF0J3MKPj4+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxl
ciAoaWU6IENQVSkgaW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+Pj4gYWNjZXNzZXMgaXMg
cmVxdWlyZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPj4+Cj4+PiBJbiBv
cmRlciB0byBkbyB0aGlzIHJlc2VydmUgMTRiaXRzIG9mIHRoZSBsb2NrLCB0aGlzIGFsbG93cyB0
byBzdXBwb3J0Cj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3JpdGUgbG9j
ayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4+PiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3Jp
dGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3RoZXIgdG8KPj4+IHNpZ25hbCB0aGUg
bG9jayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3RlIHRoZSB3cml0ZSByZWxhdGVkIGRhdGEK
Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8g
Y2xlYXIgaXQgKGFuZAo+Pj4gdGh1cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0
b21pYyB3cml0ZS4KPj4+Cj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNv
bmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRvCj4+PiA2NTUzNiwgSSB0aGluayB0aGlz
IHNob3VsZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPj4+IGNhbiBi
ZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0Yml0cyBpZiBhbGwgYXJjaGl0ZWN0dXJlcyBzdXBwb3J0
IGF0b21pYwo+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4KPj4gRldJVywgYXJt
MzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9uIDY0LWJpdCBpbnRlZ2Vy
cy4KPj4KPj4+ICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxv
Y2spCj4+PiAgIHsKPj4+IC0gICAgLyoKPj4+IC0gICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBp
cyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4gLSAgICAgKiBPdGhlcndp
c2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2xlYXIgaXQuCj4+PiAt
ICAgICAqLwo+Pj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+
ICsgICAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVh
cmVkIGRpcmVjdGx5LiAqLwo+Pj4gKyAgICBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShh
dG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+ICsgICAgQlVJTERfQlVHX09OKF9RUl9TSElG
VCAhPSAxNik7Cj4+PiArICAgIHdyaXRlX2F0b21pYygodWludDE2X3QgKikmbG9jay0+Y250cywg
MCk7Cj4+Cj4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkg
ZGlyZWN0bHkgaW50byBhIHVpbnQxNl90LiBZb3UKPj4gd291bGQgYXQgbGVhc3Qgd2FudCB0byB1
c2UgJmxvY2stPmNudHMuY291bnRlciBoZXJlLgo+IAo+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBh
Ym91dCB0aGlzIG15c2VsZi4KPiAKPiBXaWxsIHdhaXQgZm9yIG1vcmUgY29tbWVudHMsIG5vdCBz
dXJlIHdoZXRoZXIgdGhpcyBjYW4gYmUgZml4ZWQgdXBvbgo+IGNvbW1pdCBpZiB0aGVyZSBhcmUg
bm8gb3RoZXIgaXNzdWVzLgoKSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVs
ZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxpa2UKdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNh
ZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKZW5kaWFuIHBvcnQgYXR0ZW1w
dCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGNhdXNlCmEgYnVp
bGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlm
IGl0IHdhcwplbmRpYW5uZXNzLXNhZmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
