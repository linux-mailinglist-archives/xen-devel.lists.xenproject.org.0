Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A51658FB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:17:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4gyD-00032B-Vj; Thu, 20 Feb 2020 08:14:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4gyC-000326-Dx
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:14:04 +0000
X-Inumbo-ID: f45d6f6e-53b8-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f45d6f6e-53b8-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 08:14:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D876AF33;
 Thu, 20 Feb 2020 08:14:02 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6700a65f-44eb-401f-755a-ebb5d68b9b21@suse.com>
Date: Thu, 20 Feb 2020 09:13:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213113237.58795-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IE1vc3QgdXNlcnMg
b2YgdGhlIGNwdSBtYXBzIGp1c3QgY2FyZSBhYm91dCB0aGUgbWFwcyBub3QgY2hhbmdpbmcgd2hp
bGUKPiB0aGUgbG9jayBpcyBiZWluZyBoZWxkLCBidXQgZG9uJ3QgYWN0dWFsbHkgbW9kaWZ5IHRo
ZSBtYXBzLgo+IAo+IENvbnZlcnQgdGhlIGxvY2sgaW50byBhIHJ3IGxvY2ssIGFuZCB0YWtlIHRo
ZSBsb2NrIGluIHJlYWQgbW9kZSBpbgo+IGdldF9jcHVfbWFwcyBhbmQgaW4gd3JpdGUgbW9kZSBp
biBjcHVfaG90cGx1Z19iZWdpbi4gVGhpcyB3aWxsIGxvd2VyCj4gdGhlIGNvbnRlbnRpb24gYXJv
dW5kIHRoZSBsb2NrLCBzaW5jZSBwbHVnIGFuZCB1bnBsdWcgb3BlcmF0aW9ucyB0aGF0Cj4gdGFr
ZSB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIGFyZSBub3QgdGhhdCBjb21tb24uCj4gCj4gTm90ZSB0
aGF0IHRoZSByZWFkIGxvY2sgY2FuIGJlIHRha2VuIHJlY3Vyc2l2ZWx5IChhcyBpdCdzIGEgc2hh
cmVkCj4gbG9jayksIGFuZCBoZW5jZSB3aWxsIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhl
IHByZXZpb3VzbHkgdXNlZAo+IHJlY3Vyc2l2ZSBsb2NrLiBBcyBmb3IgdGhlIHdyaXRlIGxvY2ss
IGl0J3Mgb25seSB1c2VkIGJ5IENQVQo+IHBsdWcvdW5wbHVnIG9wZXJhdGlvbnMsIGFuZCB0aGUg
bG9jayBpcyBuZXZlciB0YWtlbiByZWN1cnNpdmVseSBpbgo+IHRoYXQgY2FzZS4KPiAKPiBXaGls
ZSB0aGVyZSBhbHNvIGNoYW5nZSBnZXRfY3B1X21hcHMgcmV0dXJuIHR5cGUgdG8gYm9vbC4KPiAK
PiBSZXBvcnRlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiBTdWdnZXN0ZWQt
YWxzby1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKSSdtIGFmcmFpZCBJIGNh
bid0IHNlZSBob3cgb2ZmbGluaW5nIGEgQ1BVIHdvdWxkIG5vdyB3b3JrLgpDb25kZW5zZWQgdG8g
anVzdCB0aGUgcmVsZXZhbnQgY2FsbHMsIHRoZSBzZXF1ZW5jZSBmcm9tCmNwdV9kb3duKCkgaXMK
CmNwdV9ob3RwbHVnX2JlZ2luKCkgKGkuZS4gbG9jayB0YWtlbiBpbiB3cml0ZSBtb2RlKQpzdG9w
X21hY2hpbmVfcnVuKCkKLT4gZ2V0X2NwdV9tYXBzKCkgKGxvY2sgdW5hdmFpbGFibGUgdG8gcmVh
ZGVycykKCk90aGVyIHRoYW4gcmVjdXJzaXZlIHNwaW4gbG9ja3MsIHJ3IGxvY2tzIGRvbid0IGN1
cnJlbnRseQpoYXZlIGEgY29uY2VwdCBvZiBwZXJtaXR0aW5nIGluIGEgcmVhZGVyIHdoZW4gdGhp
cyBDUFUKYWxyZWFkeSBob2xkcyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlLiBIZW5jZSBJIGNhbid0
IHNlZQpob3cgdGhlIGdldF9jcHVfbWFwcygpIGFib3ZlIHdvdWxkIG5vdyBldmVyIHN1Y2NlZWQu
IEFtIEkKbWlzc2luZyBhbnl0aGluZywgb3IgZG9lcyB0aGUgcGF0Y2ggbmVlZCByZXZlcnRpbmcg
dW50aWwKdGhlIHJlYWRfdHJ5bG9jaygpIGdvdCBlbmhhbmNlZCB0byBjb3BlIHdpdGggdGhpcz8K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
