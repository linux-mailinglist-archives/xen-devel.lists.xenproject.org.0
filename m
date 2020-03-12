Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D31834E7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPdL-0005DR-Ne; Thu, 12 Mar 2020 15:20:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCPdK-0005DM-6N
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:20:26 +0000
X-Inumbo-ID: fef2e054-6474-11ea-b1b7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fef2e054-6474-11ea-b1b7-12813bfff9fa;
 Thu, 12 Mar 2020 15:20:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DEFE6AC79;
 Thu, 12 Mar 2020 15:20:23 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
 <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
 <20200312105639.GG24458@Air-de-Roger.citrite.net>
 <7c1fea74-15eb-0006-a99c-53fb4c4a676f@suse.com>
 <20200312134435.GJ24458@Air-de-Roger.citrite.net>
 <8593845b-52e1-76c7-5b0e-8a8864fc9856@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9574afe0-93e3-5957-645e-eb3706b24017@suse.com>
Date: Thu, 12 Mar 2020 16:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8593845b-52e1-76c7-5b0e-8a8864fc9856@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMTY6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjAzLjIwMjAgMTQ6
NDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDEy
OjEyOjEyUE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAxMi4wMy4yMCAxMTo1
NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+PiBPbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAw
OTo1OTo0OEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTEuMDMuMjAyMCAx
OTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+IFNwZWNpZmljYWxseSwgdGhpcyBpcyBh
IHN3aXRjaCBmcm9tIGFuIEhWTSB2Y3B1LCB0byBhIFBWIHZjcHUsIHdoZXJlIHRoZQo+Pj4+Pj4g
bWFwY2FjaGUgY29kZSB0cmllcyB0byBhY2Nlc3MgdGhlIHBlci1kb21haW4gbWFwcGluZ3Mgb24g
dGhlIEhWTSBtb25pdG9yCj4+Pj4+PiB0YWJsZS7CoCBJdCBlbmRzIHVwIHRyeWluZyB0byByZWN1
cnNpdmVseSBhY3F1aXJlIHRoZSBtYXBjYWNoZSBsb2NrIHdoaWxlCj4+Pj4+PiB0cnlpbmcgdG8g
d2FsayAlY3IyIHRvIGlkZW50aWZ5IHRoZSBzb3VyY2Ugb2YgdGhlIGZhdWx0Lgo+Pj4+Pj4KPj4+
Pj4+IEZvciBudm14LT5tc3JfbWVyZ2VkLCB0aGlzIG5lZWRzIHRvIGVpdGhlciBiZSBhIHhlbmhl
YXAgcGFnZSwgb3IgYQo+Pj4+Pj4gZ2xvYmFsbHkgbWFwcGVkIGRvbWhlYXAgcGFnZS7CoCBJJ2xs
IGRyYWZ0IGEgcGF0Y2ggaW4gYSBtb21lbnQuCj4+Pj4+Pgo+Pj4+Pj4gRm9yIG1hcF9kb21haW5f
cGFnZSgpLCBpcyB0aGVyZSBhbnl0aGluZyB3ZSBjYW4gcmF0aW9uYWxseSBkbyB0byBhc3NlcnQK
Pj4+Pj4+IHRoYXQgaXQgaXNuJ3QgY2FsbGVkIGluIHRoZSBtaWRkbGUgb2YgYSBjb250ZXh0IHN3
aXRjaD/CoCBUaGlzIGlzIHRoZQo+Pj4+Pj4ga2luZCBvZiB0aGluZyB3aGljaCBuZWVkcyB0byBi
bG93IHVwIHJlbGlhYmx5IGluIGEgZGVidWcgYnVpbGQuCj4+Pj4+Cj4+Pj4+IFdlbGwsIGl0J3Mg
bm90IGluaGVyZW50bHkgdW5zYWZlIHRvIGRvLCBpdCdzIGp1c3QgdGhhdAo+Pj4+PiBtYXBjYWNo
ZV9jdXJyZW50X3ZjcHUoKSB3b3VsZCBuZWVkIHRvIGF2b2lkIHVzaW5nIGN1cnJlbnQgZnJvbQo+
Pj4+PiBjb250ZXh0X3N3aXRjaCgpJ3MgY2FsbCB0byBzZXRfY3VycmVudCgpIHRocm91Z2ggdG8K
Pj4+Pj4gX19jb250ZXh0X3N3aXRjaCgpJ3MgY2FsbCB0byB3cml0ZV9wdGJhc2UoKS4gQSBwb3Nz
aWJsZQo+Pj4+PiBkZXRlY3Rpb24gKGlmIHdlIGRvbid0IHdhbnQgdG8gbWFrZSB0aGUgY2FzZSB3
b3JrKSB3b3VsZAo+Pj4+PiBzZWVtIHRvIGJlIEFTU0VSVChjdXJyZW50ID09IHRoaXNfY3B1KGN1
cnJfdmNwdSkpLiBCdXQgb2YgY291cnNlCj4+Pj4+IHRoZXJlJ3MgYWxzbyB0aGlzIGV4dHJhIGxv
Z2ljIGluIG1hcGNhY2hlX2N1cnJlbnRfdmNwdSgpIHRvIGRlYWwKPj4+Pj4gd2l0aCBhIFBWIHZD
UFUgaGF2aW5nIGEgbnVsbCB2LT5hcmNoLmd1ZXN0X3RhYmxlLCB3aGljaCBJJ20gb25jZQo+Pj4+
PiBhZ2FpbiBzdHJ1Z2dsaW5nIHRvIHNlZSB1bmRlciB3aGF0IGNvbmRpdGlvbnMgaXQgbWlnaHQg
aGFwcGVuLgo+Pj4+PiBUaGUgRG9tMCBidWlsZGluZyBjYXNlIGNhbid0IGJlIG1lYW50IHdpdGgg
dGhlcmUgYmVpbmcKPj4+Pj4gbWFwY2FjaGVfb3ZlcnJpZGVfY3VycmVudCgpIG9uIHRoYXQgcGF0
aC4gSSdtIHdvbmRlcmluZyBpZiB0aGUKPj4+Pj4gY29tbWVudCB0aGVyZSBpcyBtaXNsZWFkaW5n
IGFuZCBpdCdzIHJlYWxseSB0byBjb3ZlciB0aGUgY2FzZQo+Pj4+PiB3aGVyZSwgY29taW5nIGZy
b20gYSBQViB2Q1BVLCBjdXJyZW50IHdhcyBhbHJlYWR5IHNldCB0byB0aGUKPj4+Pj4gaWRsZSB2
Q1BVIGJ5IGNvbnRleHRfc3dpdGNoKCkgKHdoaWNoIHdvdWxkIGhhdmUgYSBudWxsCj4+Pj4+IHYt
PmFyY2guZ3Vlc3RfdGFibGUpIC0gSSB3b3VsZG4ndCBjYWxsIHRoaXMgIndlIGFyZSBydW5uaW5n
IGEKPj4+Pj4gcGFyYXZpcnR1YWxpc2VkIGd1ZXN0Ii4gQnV0IGluIHN1Y2ggYSBjYXNlIHRoZSBs
b2dpYyBoZXJlIHdvdWxkCj4+Pj4+IHNpbXBseSBiZSBhICh0b28pIHNwZWNpYWwgY2FzZSBvZiB3
aGF0IHlvdSdyZSBkZXNjcmliaW5nIGFzIHRoZQo+Pj4+PiBpc3N1ZSB3aXRoIG5WTVguCj4+Pj4K
Pj4+PiBMb29raW5nIGF0IHRoZSBjb2RlIGluIGNvbnRleHRfc3dpdGNoIGFuZCBfX2NvbnRleHRf
c3dpdGNoIHdvdWxkIGl0IGJlCj4+Pj4gcG9zc2libGUgdG8gc2V0IGN1cnJlbnQgdG8gdGhlIG5l
eHQgdkNQVSBhZnRlciBhbGwgdGhlIGZyb20gaG9va3MgaGF2ZQo+Pj4+IGJlZW4gY2FsbGVkPwo+
Pj4+Cj4+Pj4gSWU6IHNldF9jdXJyZW50IGNvdWxkIGJlIG1vdmVkIGludG8gX19jb250ZXh0X3N3
aXRjaCBhZnRlciB0aGUgY2FsbCB0bwo+Pj4+IHBkLT5hcmNoLmN0eHRfc3dpdGNoLT5mcm9tKHAp
Lgo+Pj4KPj4+IE5vLCB3b3VsZG4ndCB3b3JrLiBXaGVuIHN3aXRjaGluZyB0byBpZGxlIF9fY29u
dGV4dF9zd2l0Y2goKSBpcyBub3JtYWxseQo+Pj4gbm90IGNhbGxlZCBpbiBvcmRlciB0byBhdm9p
ZCBzd2l0Y2hpbmcgdGhlIGFkZHJlc3Mgc3BhY2UgaW4gY2FzZSB0aGUKPj4+IHNhbWUgdmNwdSB3
aWxsIGJlIHNjaGVkdWxlZCBhZ2FpbiBhZnRlciBpZGxlLiBUaGlzIGlzIHRoZSByZWFzb24gd2h5
Cj4+PiBjdXJyZW50IGFuZCBjdXJyX3ZjcHUgY2FuIGJlIGRpZmZlcmVudC4KPj4KPj4gU2luY2Ug
dGhlIGlkbGUgdkNQVSBjb250ZXh0IHN3aXRjaCBpcyBhbHJlYWR5IGEgc3BlY2lhbCBjYXNlIHdl
IGNvdWxkCj4+IG1heWJlIHBsYWNlIHRoZSBjYWxsIHRvIHNldF9jdXJyZW50IGluIHN1Y2ggc3Bl
Y2lhbCBoYW5kbGluZywgd2hpbGUKPj4gbGVhdmluZyB0aGUgY2FsbCBmb3IgdGhlIHJlc3Qgb2Yg
dkNQVXMgaW4gX19jb250ZXh0X3N3aXRjaCBhZnRlciB0aGUKPj4gLT5mcm9tIGhvb2tzIGhhdmUg
YmVlbiBleGVjdXRlZD8KPj4KPj4+PiBJJ20gYWxzbyBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBjb250ZXh0X3N3aXRjaAo+Pj4+IGFuZCBfX2NvbnRleHRfc3dp
dGNoLCBhbmQgaG93IGFyZSBjYWxsZXJzIHN1cHBvc2VkIHRvIHVzZSB0aGVtLgo+Pgo+PiBKYW4g
cG9pbnRzIG91dCB0aGF0IF9fY29udGV4dF9zd2l0Y2ggc2lnbmFscyBhIHBlbmRpbmcgY29udGV4
dCBzd2l0Y2gsCj4+IGluIHdoaWNoIGNhc2UgbXkgcHJvcG9zYWwgdG8gdXNlIHNldF9jdXJyZW50
IG1pZ2h0IG5vdCBiZSBzdWl0YWJsZSwgYXMKPj4gd2Ugd291bGQgYmUgY2hhbmdpbmcgY3VycmVu
dCB3aXRob3V0IGFjdHVhbGx5IGRvaW5nIHRoZSBjb250ZXh0Cj4+IHN3aXRjaD8KPj4KPj4gSSBh
bHNvIHdvbmRlciB3aHkgX19jb250ZXh0X3N3aXRjaCB0aGVuIG5lZWRzIHRvIGNhbGwgdGhlIC0+
ZnJvbSBob29rCj4+IGp1c3QgdG8gc2lnbmFsIGEgcGVuZGluZyBjb250ZXh0IHN3aXRjaC4gSXQg
c2VlbXMgbGlrZQo+PiBfX2NvbnRleHRfc3dpdGNoIGRvZXMgYSBsb3Qgb2Ygd29yayBqdXN0IHRv
IHNpZ25hbCBhIGNvbnRleHQgc3dpdGNoLAo+PiB3aGljaCB3aWxsIHRoZW4gYmUgcmVkb25lIHdo
ZW4gY29udGV4dF9zd2l0Y2ggaXMgYWN0dWFsbHkgY2FsbGVkPwo+IAo+IFdlbGwsICJzaWduYWwi
IHdhcyBwZXJoYXBzIG5vdCB0aGUgYmVzdCBjaG9pY2Ugb2YgYSB3b3JkLgoKQmFzaWNhbGx5IHlv
dSBjYW4gc2F5IHRoYXQgY29udGV4dF9zd2l0Y2goKSBpcyBzd2l0Y2hpbmcgdmNwdXMgbG9naWNh
bGx5CihYZW4gaW50ZXJuYWwgYm9va2tlZXBpbmcpLCB3aGlsZSBfX2NvbnRleHRfc3dpdGNoKCkg
aXMgc3dpdGNoaW5nIHRoZQpydW50aW1lIGVudmlyb25tZW50IChhZGRyZXNzIHNwYWNlLCBHRFQg
c2V0dGluZ3MsIGNyNCwgLi4uKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
