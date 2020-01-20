Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0A142B00
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:39:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itWId-0002YP-OJ; Mon, 20 Jan 2020 12:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itWIc-0002YK-Ow
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:36:58 +0000
X-Inumbo-ID: 8739a76c-3b81-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8739a76c-3b81-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 12:36:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD558AF22;
 Mon, 20 Jan 2020 12:36:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <9f4b57e9-c7a4-78e9-32c1-b25530c550f4@suse.com>
 <20200120120444.GY11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <132e73ad-5f7c-74a0-5e2a-00f807363bb1@suse.com>
Date: Mon, 20 Jan 2020 13:36:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120120444.GY11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/8] x86: determine HAVE_AS_* just once
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxMzowNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEph
biAwNiwgMjAyMCBhdCAwNTozNDo0NVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0t
IGEvQ29uZmlnLm1rCj4+ICsrKyBiL0NvbmZpZy5tawo+PiBAQCAtMTUxLDcgKzE1MSw3IEBAIGVu
ZGlmCj4+ICAjIGFzLWluc246IENoZWNrIHdoZXRoZXIgYXNzZW1ibGVyIHN1cHBvcnRzIGFuIGlu
c3RydWN0aW9uLgo+PiAgIyBVc2FnZTogY2ZsYWdzLXkgKz0gJChjYWxsIGFzLWluc24sQ0MgRkxB
R1MsImluc24iLG9wdGlvbi15ZXMsb3B0aW9uLW5vKQo+PiAgYXMtaW5zbiA9ICQoaWYgJChzaGVs
bCBlY2hvICd2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAkKDIpICk7IH0nIFwKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgfCAkKGZpbHRlci1vdXQgLU0lICUuZCAtaW5jbHVkZSAlL2lu
Y2x1ZGUveGVuL2NvbmZpZy5oLCQoMSkpIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgfCAk
KGZpbHRlci1vdXQgLU0lICUuZCAtaW5jbHVkZSAlL2NvbmZpZy5oLCQoMSkpIFwKPiAKPiBEb24n
dCB5b3UgbmVlZCB0byBmaWx0ZXIgb3V0IC1pbmNsdWRlIHhlbi9jb25maWcuaCBhcyBhZGRlZCB0
byBDTEZBR1MKPiBiZWxvdz8KClRoZSB3aG9sZSBwb2ludCBvZiB0aGUgY2hhbmdlIGlzIHRvIGZp
bHRlciBvdXQgX2JvdGhfIGNvbmZpZy5oIChhcwp3ZWxsIGFzIGFueSBmdXR1cmUgb25lKSAtIHRo
ZSBvbmUgdW5kZXIgaW5jbHVkZS94ZW4vIGFuZCB0aGUgb25lCnVuZGVyIGluY2x1ZGUvZ2VuZXJh
dGVkLy4gSGVuY2UgdGhlIHdpZGVuaW5nIG9mIHdoYXQgdGhlIHBhdHRlcm4Kd291bGQgbWF0Y2gu
Cgo+PiBAQCAtMjQwLDYgKzI0MSw0NSBAQCAkKEJBU0VESVIpL2luY2x1ZGUvYXNtLXg4Ni9hc20t
bWFjcm9zLmg6Cj4+ICAJZWNobyAnI2VuZGlmJyA+PiRALm5ldwo+PiAgCSQoY2FsbCBtb3ZlLWlm
LWNoYW5nZWQsJEAubmV3LCRAKQo+PiAgCj4+ICsjIFRoZXJlIGFyZSBtdWx0aXBsZSBpbnZvY2F0
aW9ucyBvZiB0aGlzIE1ha2VmaWxlLCBvbmUgZWFjaCBmb3IgYXNtLW9mZnNldC5zLAo+PiArIyAk
KFRBUkdFVCksIGJ1aWx0X2luLm8sIGFuZCBzZXZlcmFsIG1vcmUgZnJvbSB0aGUgcnVsZXMgYnVp
bGRpbmcgJChUQVJHRVQpCj4+ICsjIGFuZCAkKFRBUkdFVCkuZWZpLiBUaGUgMm5kIGFuZCAzcmQg
bWF5IHJhY2Ugd2l0aCBvbmUgYW5vdGhlciwgYW5kIHdlIGRvbid0Cj4+ICsjIHdhbnQgdG8gcmUt
Z2VuZXJhdGUgY29uZmlnLmggaW4gdGhhdCBjYXNlIGFueXdheSwgc28gZ3VhcmQgdGhlIGxvZ2lj
Cj4+ICsjIGFjY29yZGluZ2x5LiAoV2UgZG8gd2FudCB0byBoYXZlIHRoZSBGT1JDRSBkZXBlbmRl
bmN5IG9uIHRoZSBydWxlLCB0byBiZQo+PiArIyBzdXJlIHdlIHBpY2sgdXAgY2hhbmdlcyB3aGVu
IHRoZSBjb21waWxlciB1c2VkIGhhcyBjaGFuZ2VkLikKPj4gK2lmZXEgKCQoTUFLRUNNREdPQUxT
KSxhc20tb2Zmc2V0cy5zKQo+PiArCj4+ICthcy1JU0EtbGlzdCA6PSBDTFdCIEVQVCBGU0dTQkFT
RSBJTlZQQ0lEIFJEUkFORCBSRFNFRUQgU1NFNF8yIFZNWCBYU0FWRU9QVAo+PiArCj4+ICtDTFdC
LWluc24JOj0gY2x3YiAoJXJheCkKPj4gK0VQVC1pbnNuCTo9IGludmVwdCAoJXJheCksJXJheAo+
PiArRlNHU0JBU0UtaW5zbgk6PSByZGZzYmFzZSAlcmF4Cj4+ICtJTlZQQ0lELWluc24JOj0gaW52
cGNpZCAoJXJheCksJXJheAo+PiArUkRSQU5ELWluc24JOj0gcmRyYW5kICVlYXgKPj4gK1JEU0VF
RC1pbnNuCTo9IHJkc2VlZCAlZWF4Cj4+ICtTU0U0XzItaW5zbgk6PSBjcmMzMiAlZWF4LCVlYXgK
Pj4gK1ZNWC1pbnNuCTo9IHZtY2FsbAo+PiArWFNBVkVPUFQtaW5zbgk6PSB4c2F2ZW9wdCAoJXJh
eCkKPj4gKwo+PiArYXMtZmVhdHVyZXMtbGlzdCA6PSAkKGFzLUlTQS1saXN0KSBORUdBVElWRV9U
UlVFIE5PUFNfRElSRUNUSVZFCj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhcmVyIHRvIHBs
YWNlIHRoaXMgYmVsb3cgdGhlIE5FR0FUSVZFX1RSVUUgYW5kCj4gTk9QU19ESVJFQ1RJVkUgZGVm
aW5pdGlvbnMgYmVsb3c/IFNvIHRoYXQgYWxsIEZPTy1pbnNuIGFyZSB0b2dldGhlci4KCklmIHlv
dXIgcmVtYXJrIHdhcyBhYm91dCBqdXN0IHRoZSBsYXN0IGxpbmUgLSB5ZXMsIHBlcmhhcHMgKGFu
ZApsb29raW5nIGF0IGl0IGFnYWluIEkgZG9uJ3QgZXZlbiBrbm93IHdoeSBpdCBlbmRlZCB1cCBp
biB0aGUKcGxhY2UgaXQncyBpbiByaWdodCBub3cpLiBCdXQgSSdtIHRvbGQgdGhlIG9yaWdpbmFs
IG1lY2hhbmlzbSBpcwpnb2luZyB0byBiZSByZXBsYWNlZCBub3cgYnkgYSBLY29uZmlnIG9uZSBh
bnl3YXkuIElmIHRoaXMgaXMKZ29pbmcgdG8gaGFwcGVuIHNvb24sIHRoZSBwYXRjaCBoZXJlIHdv
dWxkIGJlIG9mIG5vIGZ1cnRoZXIKaW50ZXJlc3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
