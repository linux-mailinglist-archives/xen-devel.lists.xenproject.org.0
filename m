Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C651779AE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j98yU-0001N9-PB; Tue, 03 Mar 2020 14:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j98yT-0001N2-J9
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:56:45 +0000
X-Inumbo-ID: 325215f4-5d5f-11ea-8efe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 325215f4-5d5f-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 14:56:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AED40B31D;
 Tue,  3 Mar 2020 14:56:42 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
 <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
 <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
 <bd5988b9966b403991f4059216bfb93e@EX13D32EUC003.ant.amazon.com>
 <e98154a1-425d-028c-bb93-42fa7d6aa75e@suse.com>
 <43df2a9116d2448592b27dff7f4792d8@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a881e4b3-0cc5-31e9-83f8-31084ba7f66f@suse.com>
Date: Tue, 3 Mar 2020 15:56:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <43df2a9116d2448592b27dff7f4792d8@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
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
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxNTo0NCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAwMyBNYXJjaCAyMDIwIDE0OjM0Cj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY28udWs+Cj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFu
ZHJldyBDb29wZXIKPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaQo+PiBMaXUgPHdsQHhlbi5vcmc+OyBQYXVs
IER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF1bUEFUQ0gg
djUgMS80XSB4ODYvSFZNOiBjYW5jZWwgZW11bGF0aW9uIHdoZW4KPj4gcmVnaXN0ZXIgc3RhdGUg
Z290IGFsdGVyZWQKPj4KPj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QKPj4gY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cKPj4g
dGhlIGNvbnRlbnQgaXMgc2FmZS4KPj4KPj4KPj4KPj4gT24gMDMuMDMuMjAyMCAxNToyNSwgRHVy
cmFudCwgUGF1bCB3cm90ZToKPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+PiBTZW50OiAwMyBNYXJjaCAy
MDIwIDE0OjIxCj4+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4K
Pj4+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyCj4+
Pj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT47Cj4+IFdlaQo+Pj4+IExpdSA8d2xAeGVuLm9yZz47IFBhdWwgRHVycmFu
dCA8cGF1bEB4ZW4ub3JnPgo+Pj4+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdW1hlbi1kZXZlbF0g
W1BBVENIIHY1IDEvNF0geDg2L0hWTTogY2FuY2VsCj4+Pj4gZW11bGF0aW9uIHdoZW4gcmVnaXN0
ZXIgc3RhdGUgZ290IGFsdGVyZWQKPj4+Pgo+Pj4+IE9uIDAzLjAzLjIwMjAgMTQ6MTYsIER1cnJh
bnQsIFBhdWwgd3JvdGU6Cj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+Pj4g
RnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4g
T24gQmVoYWxmIE9mCj4+Pj4gSmFuCj4+Pj4+PiBCZXVsaWNoCj4+Pj4+PiBTZW50OiAwMyBNYXJj
aCAyMDIwIDEwOjE3Cj4+Pj4+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+
Pj4+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2Vy
IFBhdSBNb25uw6kKPj4+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhl
bi5vcmc+OyBQYXVsIER1cnJhbnQKPj4+PiA8cGF1bEB4ZW4ub3JnPgo+Pj4+Pj4gU3ViamVjdDog
W0VYVEVSTkFMXVtYZW4tZGV2ZWxdIFtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbAo+PiBl
bXVsYXRpb24KPj4+Pj4+IHdoZW4gcmVnaXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQKPj4+Pj4+Cj4+
Pj4+PiBSZS1leGVjdXRpb24gKGFmdGVyIGhhdmluZyByZWNlaXZlZCBkYXRhIGZyb20gYSBkZXZp
Y2UgbW9kZWwpIHJlbGllcwo+PiBvbgo+Pj4+Pj4gdGhlIHNhbWUgcmVnaXN0ZXIgc3RhdGUgc3Rp
bGwgYmVpbmcgaW4gcGxhY2UgYXMgaXQgd2FzIHdoZW4gdGhlCj4+IHJlcXVlc3QKPj4+Pj4+IHdh
cyBmaXJzdCBzZW50IHRvIHRoZSBkZXZpY2UgbW9kZWwuIFRoZXJlZm9yZSB2Q1BVIHN0YXRlIGNo
YW5nZXMKPj4+Pj4+IGVmZmVjdGVkIGJ5IHJlbW90ZSBzb3VyY2VzIG5lZWQgdG8gcmVzdWx0IGlu
IG5vIGF0dGVtcHQgb2YgcmUtCj4+Pj4gZXhlY3V0aW9uLgo+Pj4+Pj4gSW5zdGVhZCB0aGUgcmV0
dXJuZWQgZGF0YSBpcyB0byBzaW1wbHkgYmUgaWdub3JlZC4KPj4+Pj4+Cj4+Pj4+PiBOb3RlIHRo
YXQgYW55IHN1Y2ggYXN5bmNocm9ub3VzIHN0YXRlIGNoYW5nZXMgaGFwcGVuIHdpdGggdGhlIHZD
UFUgYXQKPj4+Pj4+IGxlYXN0IHBhdXNlZCAocG90ZW50aWFsbHkgZG93biBhbmQvb3Igbm90IG1h
cmtlZCAtPmlzX2luaXRpYWxpc2VkKSwKPj4gc28KPj4+Pj4+IHRoZXJlJ3Mgbm8gaXNzdWUgd2l0
aCBmaWRkbGluZyB3aXRoIHJlZ2lzdGVyIHN0YXRlIGJlaGluZCB0aGUKPj4gYWN0aXZlbHkKPj4+
Pj4+IHJ1bm5pbmcgZW11bGF0b3IncyBiYWNrLiBIZW5jZSB0aGUgbmV3IGZ1bmN0aW9uIGRvZXNu
J3QgbmVlZCB0bwo+Pj4+Pj4gc3luY2hyb25pemUgd2l0aCB0aGUgY29yZSBlbXVsYXRpb24gbG9n
aWMuCj4+Pj4+Pgo+Pj4+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pj4+Pgo+Pj4+PiBOZWVkIHdlIGJlIGNvbmNlcm5lZCB3aXRoIGFueSBw
YWdlLXNwbGl0IEkvTyBoZXJlPyBUaGF0IG1heSBtYW5pZmVzdAo+PiBhcwo+Pj4+PiB0d28gc2Vw
YXJhdGUgZW11bGF0aW9ucyBhbmQgQUZBSUNUIGl0IHdvdWxkIGJlIHBvc3NpYmxlIGZvciBvbmx5
IHRoZQo+Pj4+PiBzZWNvbmQgcGFydCB0byBiZSBhYm9ydGVkIGJ5IHRoaXMgY2hhbmdlLgo+Pj4+
Cj4+Pj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgZS5nLiBJTklUIGlzIHJlY29nbml6ZWQgb25seSBv
biBpbnNuIGJvdW5kYXJpZXMuCj4+Pj4gSS5lLiB0aGlzIG1heSBub3QgYmUgdGhhdCBkaWZmZXJl
bnQgZnJvbSByZWFsIGhhcmR3YXJlIGJlaGF2aW9yLiBfSWZfCj4+Pj4gd2Ugd2VyZSB0byB0YWtl
IGNhcmUgb2YgdGhpcywgaG93IHdvdWxkIHlvdSBlbnZpc2lvbiB1bmRvaW5nIHRoZQo+Pj4+IGZp
cnN0IHBhcnQgb2Ygc3VjaCBhbiBhY2Nlc3MsIG1vc3Qgbm90YWJseSB3aGVuIHRoZSBhY2Nlc3Mg
aGFzIHNpZGUKPj4+PiBlZmZlY3RzPwo+Pj4KPj4+IEkgd2Fzbid0IHRoaW5raW5nIG9mIHVuZG9p
bmcuLi4gSSB3YXMgbW9yZSB0aGlua2luZyB0aGF0IHZjcHVfcGF1c2UoKQo+Pj4gb3VnaHQgdG8g
ZGVmZXIgdW50aWwgYW4gaW4tcHJvZ3Jlc3MgZW11bGF0aW9uIGhhcyBmdWxseSBjb21wbGV0ZWQu
Cj4+Cj4+IEhtbSwgYXQgdGhlIGZpcnN0IGdsYW5jZSB0aGlzIGxvb2tzIHVnbHkvZnJhZ2lsZSB0
byBhcnJhbmdlIGZvci4gSSdtCj4+IGhhdmluZyBhIGhhcmQgdGltZSB0aGlua2luZyBvZiBhIHJv
dWdoIHNrZXRjaCBvZiBob3cgc3VjaCBjb3VsZCBiZQo+PiBtYWRlIHdvcmssIGluIHBhcnRpY3Vs
YXIgd2l0aG91dCBibG9ja2luZyB0aGUgdmNwdV9wYXVzZSgpIGl0c2VsZgo+PiBmb3IgdG9vIGxv
bmcuCj4+Cj4gCj4gSWYgdGhlIHZjcHUgaXMgYXQgdGhlIG1lcmN5IG9mIGFuIGV4dGVybmFsIGVt
dWxhdG9yIGl0IGNvdWxkIHRha2UgYQo+IHdoaWxlLiBJIGNhbid0IHJlYWxseSB0aGluayBvZiBh
IHdheSB0byBhdm9pZCB0aGF0IHRob3VnaC4gTWF5YmUKPiBwYXVzaW5nIGF0IGEgbm9uLWFyY2hp
dGVjdHVyYWwgYm91bmRhcnkgaXMgb2sgaGVyZSB0aG91Z2guCgpXZWxsLCBhdCB0aGUgdmVyeSBs
ZWFzdCBJJ2QgY2FsbCBpdCBnb29kIGVub3VnaCB1bnRpbCB3ZSBjYW4gdGhpbmsKb2YgYSBzZW5z
aWJsZSB3YXkgdG8gZGVhbCB3aXRoIHRoaXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
