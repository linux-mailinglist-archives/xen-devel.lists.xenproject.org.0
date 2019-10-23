Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813CE1D6A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH4Y-000471-Au; Wed, 23 Oct 2019 13:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNH4W-00046v-Le
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:53:08 +0000
X-Inumbo-ID: 711ece7e-f59c-11e9-947f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 711ece7e-f59c-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:53:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4AECAD26;
 Wed, 23 Oct 2019 13:53:06 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191023121209.4814-1-jgross@suse.com>
 <20191023125548.GS17494@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfab5d16-a997-af54-f571-44242dd3bd83@suse.com>
Date: Wed, 23 Oct 2019 15:53:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023125548.GS17494@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pvhsim: fix cpu onlining
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNDo1NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIE9j
dCAyMywgMjAxOSBhdCAwMjoxMjowOVBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBT
aW5jZSBjb21taXQgOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46IGxldCB2Y3B1X2NyZWF0ZSgpIHNlbGVj
dCBwcm9jZXNzb3IiKQo+PiB0aGUgaW5pdGlhbCBwcm9jZXNzb3IgZm9yIGFsbCBwdi1zaGltIHZj
cHVzIHdpbGwgYmUgMCwgYXMgbm8gb3RoZXIgY3B1cwo+PiBhcmUgb25saW5lIHdoZW4gdGhlIHZj
cHVzIGFyZSBjcmVhdGVkLiBCZWZvcmUgdGhhdCBjb21taXQgdGhlIHZjcHVzCj4+IHdvdWxkIGhh
dmUgcHJvY2Vzc29ycyBzZXQgbm90IGJlaW5nIG9ubGluZSB5ZXQsIHdoaWNoIHdvcmtlZCBqdXN0
IGJ5Cj4+IGNoYW5jZS4KPj4KPj4gV2hlbiB0aGUgcHYtc2hpbSB2Y3B1IGJlY29tZXMgYWN0aXZl
IGl0IHdpbGwgaGF2ZSBhIGhhcmQgYWZmaW5pdHkKPj4gbm90IG1hdGNoaW5nIGl0cyBpbml0aWFs
IHByb2Nlc3NvciBhc3NpZ25tZW50IGxlYWRpbmcgdG8gZmFpbGluZwo+PiBBU1NFUlQoKXMgb3Ig
b3RoZXIgcHJvYmxlbXMgZGVwZW5kaW5nIG9uIHRoZSBzZWxlY3RlZCBzY2hlZHVsZXIuCj4+Cj4+
IEZpeCB0aGF0IGJ5IGRvaW5nIHRoZSBhZmZpbml0eSBzZXR0aW5nIGFmdGVyIG9ubGluaW5nIHRo
ZSBjcHUgYnV0Cj4+IGJlZm9yZSB0YWtpbmcgdGhlIHZjcHUgdXAuIEZvciB2Y3B1IDAgdGhpcyBp
cyBzdGlsbCBpbgo+PiBzY2hlZF9zZXR1cF9kb20wX3ZjcHVzKCksIGZvciB0aGUgb3RoZXIgdmNw
dXMgc2V0dGluZyB0aGUgYWZmaW5pdHkKPj4gdGhlcmUgY2FuIGJlIGRyb3BwZWQuCj4+Cj4+IEZp
eGVzOiA4ZDNjMzI2ZjY3NTZkMSAoInhlbjogbGV0IHZjcHVfY3JlYXRlKCkgc2VsZWN0IHByb2Nl
c3NvciIpCj4+IFJlcG9ydGVkLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJp
eC5jb20+Cj4+IFRlc3RlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXgu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkgaGF2ZSB0byBhZG1p
dCB0aG91Z2ggdGhhdCBJIG1pc3MgYSBjb21tZW50IG9uIHRoZSBwdl9zaGltCmNvbmRpdGlvbmFs
IGluIHNjaGVkdWxlLmMgLSBzdWNoIGEgc3BlY2lhbCBjYXNlIHNob3VsZG4ndApyZWFsbHkgYmUg
dGhlcmUsIGJ1dCBzaW5jZSBpdCdzIG5lZWRlZCBpdCBzaG91bGQgYmUgZXhwbGFpbmVkLgpJIHJl
YWxpemUgdGhvdWdoIHRoYXQgdGhlIHBhdGNoIGhlcmUgb25seSBtb3ZlcyB0aGUgc3BlY2lhbApj
YXNlLCBpLmUuIHRoZSBsYWNrIG9mIGNvbW1lbnQgaXMgcHJlLWV4aXN0aW5nLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
