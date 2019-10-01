Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873BC300C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEJK-0004c2-LE; Tue, 01 Oct 2019 09:19:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFEJI-0004br-Er
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:19:08 +0000
X-Inumbo-ID: 84c62eda-e42c-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 84c62eda-e42c-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 09:19:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98545B4BB;
 Tue,  1 Oct 2019 09:19:06 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
Date: Tue, 1 Oct 2019 11:19:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 AndrewCooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMDo1MiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAwOTo0Ngo+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
ZQo+PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGNpdHJpeC5jb20+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBXZWkKPj4gTGl1
IDx3bEB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEz
XSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24KPj4KPj4gT24gMDEuMTAu
MjAxOSAxMDoyOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gTm93IHRoYXQgeGwuY2ZnIGhhcyBh
biBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3MgZm9yIGEKPj4+IGRv
bWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9lZCBkdWUgdG8gdGhlIGNoZWNr
IG9mCj4+PiBpc19pb21tdV9lbmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoKS4K
Pj4+IFRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dkaXJ0eSBmcm9tIGJl
aW5nIGVuYWJsZWQgdW5sZXNzCj4+PiBkZXZpY2VzIGFyZSBhc3NpZ25lZCB0byBhIGRvbWFpbiBh
bmQgdGhhdCBkb21haW4gaXMgc2hhcmluZyBIQVAgbWFwcGluZ3MKPj4+IHdpdGggdGhlIElPTU1V
IChpbiB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1h
eQo+Pj4gY2F1c2UgRE1BIGZhdWx0cykuCj4+Cj4+IEJ1dCB0aGF0J3MgdGFraW5nIGludG8gYWNj
b3VudCBvbmx5IGhhbGYgb2YgdGhlIHJlYXNvbiBvZiB0aGUKPj4gZXhjbHVzaW9uLiBUaGUgb3Ro
ZXIgaGFsZiBpcyB0aGF0IGFzc2lnbmVkIGRldmljZXMgbWF5IGNhdXNlIHBhZ2VzCj4+IHRvIGJl
IGRpcnRpZWQgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBsb2ctZGlydHkgbG9naWMuCj4gCj4gQnV0
IHRoYXQncyBubyByZWFzb24gdG8gdmV0byBsb2dkaXJ0eS4gU29tZSBkZXZpY2VzIGhhdmUgZHJp
dmVycyAoaW4gZG9tMCkKPiB3aGljaCBjYW4gZXh0cmFjdCBETUEgZGlydHlpbmcgaW5mb3JtYXRp
b24gYW5kIHNldCBkaXJ0eSB0cmFja2luZwo+IGluZm9ybWF0aW9uIGFwcHJvcHJpYXRlbHkuCgpJ
dCBzdGlsbCBuZWVkcyBhIHBvc2l0aXZlIGlkZW50aWZpY2F0aW9uIHRoZW46IFN1Y2ggZHJpdmVy
cyBzaG91bGQgdGVsbApYZW4gZm9yIHdoaWNoIHNwZWNpZmljIGRldmljZXMgc3VjaCBpbmZvcm1h
dGlvbiBpcyBnb2luZyB0byBiZSBwcm92aWRlZC4KSSBhbHNvIHdvbmRlciB3aGF0IGludGVyZmFj
ZSBJIHdvdWxkIGhhdmUgZm9yZ290IGFib3V0IHRoYXQgd291bGQgYWxsb3cKc3VjaCBhIGRyaXZl
ciB0byBwcm9wYWdhdGUgZGlydHlpbmcgaW5mb3JtYXRpb24gaW4gdGhlIGZpcnN0IHBsYWNlOgpY
RU5fRE1PUF9tb2RpZmllZF9tZW1vcnkgaXMgZm9yIGVtdWxhdG9ycyBvbmx5IGFpdWksIGFuZCBk
b2VzIG5vdCBwcm92aWRlCmEgbWVhbnMgZm9yIFhlbiB0byBhY3RpdmVseSBxdWVyeSBkaXJ0aWVk
IHN0YXRlIChvciByZXF1ZXN0IHVwZGF0aW5nCnRoZXJlb2YpIG9mIHBhZ2VzIG93bmVkIGJ5IGEg
ZG9tYWluIChhcyB3b3VsZCBiZSBuZWVkZWQgYXQgbGVhc3Qgb24gdGhlClhFTl9ET01DVExfU0hB
RE9XX0xPR0RJUlRZX0ZJTkFMIGludm9jYXRpb24pLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
