Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297B10AA61
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 06:46:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZq7a-0006Fe-3y; Wed, 27 Nov 2019 05:44:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZq7Y-0006FZ-5N
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 05:44:12 +0000
X-Inumbo-ID: ef77a3f2-10d8-11ea-a3ac-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef77a3f2-10d8-11ea-a3ac-12813bfff9fa;
 Wed, 27 Nov 2019 05:44:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EAB77AB98;
 Wed, 27 Nov 2019 05:44:09 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
Date: Wed, 27 Nov 2019 06:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: peng.fan@nxp.com, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Alice Guo <alice.guo@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMDE6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyNi8x
MS8yMDE5IDIzOjE3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9uIFR1ZSwgMjYgTm92
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDI2LzExLzIwMTkg
MjA6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiArIEp1ZXJnZW4KPj4+Pgo+Pj4+
IEkgbWlzc2VkIHRoYXQgeW91IHdlcmVuJ3QgaW4gQ0MgdG8gdGhlIG9yaWdpbmFsIHBhdGNoLCBz
b3JyeS4KPj4+PiBJIHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGdvIGluLCBhcyBvdGhlcndpc2Ug
TGludXggNS40IGNvdWxkIHJ1biBpbnRvCj4+Pj4gcHJvYmxlbXMuIEl0IGlzIGFsc28gYSBwcmV0
dHkgc3RyYWlnaHRmb3J3YXJkIDQgbGluZXMgcGF0Y2guCj4+Pgo+Pj4gNS41IChvciA1LjYpIGlz
IG5vdCBnb2luZyB0byBydW4gb24gWGVuIGZvciBvdGhlciByZWFzb25zIChzdGlsbCBpbiB0aGUK
Pj4+IHZHSUMpLi4uIFNvIEkgd291bGQgbm90IHZpZXcgdGhpcyBhcyBjcml0aWNhbC4KPj4KPj4g
NS41IGlzIG5vdCBvdXQgeWV0LCBpbiBmYWN0LCB0aGUgZGV2IHdpbmRvdyBoYXMganVzdCBvcGVu
ZWQuIElzbid0IHlvdXIKPj4gc3RhdGVtZW50IGEgYml0IHByZW1hdHVyZT8KPiAKPiBUaGUgR0lD
djQuMSB3b3JrIFsxXSBpcyBnb2luZyB0byBwcmV2ZW50IExpbnV4IGJvb3Rpbmcgb24gYWxsIGN1
cnJlbnQgCj4gdmVyc2lvbnMgb2YgWGVuLiBXaGlsZSBJIGNhbid0IGNvbmZpcm0gdGhpcyBpcyBn
b2luZyB0byBiZSBtZXJnZWQgaW4gCj4gNS41LCBJIGNhbiB0ZWxsIHlvdSB0aGlzIHdpbGwgYnJl
YWsuCj4gCj4+Cj4+IEluIGFueSBjYXNlLCBldmVuIGlmIHBvdGVudGlhbCBmdXR1cmUgTGludXgg
cmVsZWFzZXMgY291bGQgaGF2ZSBvdGhlcgo+PiBhZGRpdGlvbmFsIGlzc3VlcywgSSBkb24ndCB0
aGluayBpdCBzaG91bGQgY2hhbmdlIG91ciBjdXJyZW50IHZpZXcgb24KPj4gdGhpcyBzcGVjaWZp
YyBpc3N1ZSB3aGljaCBhZmZlY3RzIDUuNCwganVzdCByZWxlYXNlZC4KPiAKPiBUaGUgcGF0Y2gg
aXMgZGVmaW5pdGVseSBub3QgYXMgc3RyYWlnaHRmb3J3YXJkIGFzIHlvdSBtYXkgdGhpbmsuIFBs
ZWFzZSAKPiByZWZlciB0byB0aGUgZGlzY3Vzc2lvbiB3ZSBoYWQgb24gdGhlIGZpcnN0IHZlcnNp
b24uIEkgdm9pY2VkIGNvbmNlcm4gCj4gYWJvdXQgdGhpcyBhcHByb2FjaCBhbmQgZ2F2ZSBwb2lu
dCB3aGF0IGNvdWxkIGdvIHdyb25nIHdpdGggaGFwcGVuLgo+IAo+IFRoaXMgcGF0Y2ggbWF5IGJl
IGJldHRlciB0aGFuIHRoZSBjdXJyZW50IHN0YXRlIChpLmUgY3Jhc2hpbmcpLCBidXQgdGhpcyAK
PiB3YXNuJ3QgdGVzdGVkIGVub3VnaCB0byBjb25maXJtIHRoaXMgaXMgdGhlIGNvcnJlY3QgdGhp
bmdzIHRvIGRvIGFuZCBubyAKPiBvdGhlciBidWcgd2lsbCBhcHBlYXIgKEkgZG9uJ3QgYmVsaWV2
ZSByZWFkaW5nIEkqQUNUSVZFUiB3YXMgZXZlciB0ZXN0ZWQgCj4gYmVmb3JlKS4KPiAKPiBJdCBp
cyBhbiBhbm5veWluZyBidWcsIGJ1dCB0aGlzIGlzIG9ubHkgYWZmZWN0aW5nIDUuNCB3aGljaCBo
YXMganVzdCAKPiBiZWVuIHJlbGVhc2VkLiBJdCBmZWVscyB0byBtZSB0aGlzIGlzIGEgZmFpcmx5
IHJpc2t5IGNob2ljZSB0byBtZXJnZSBpdCAKPiBxdXRpZSBsYXRlIGluIHRoZSByZWxlYXNlIHdp
dGhvdXQgYSBnb29kIGdyYXBzIG9mIHRoZSBwcm9ibGVtIChzZWUgYWJvdmUpLgo+IAo+IFNvIEkg
d291bGQgZGVmaW5pdGx5LCBwcmVmZXIgaWYgdGhpcyBwYXRjaCBpcyBnZXR0aW5nIHRocm91Z2gg
YmFja3BvcnQgCj4gb25jZSB3ZSBnZXQgbW9yZSB0ZXN0aW5nLgo+IAo+IFdlIGNhbiBzdGlsbCBk
b2N1bWVudCB0aGUgYnVnIGluIHRoZSByZWxlYXNlIG5vdGUgYW5kIHBvaW50IHBlb3BsZSB0byAK
PiB0aGUgcGF0Y2guCj4gCj4gQW55d2F5LCB0aGlzIGlzIEp1ZXJnZW4gY2hvaWNlIGhlcmUuIEJ1
dCBhdCBsZWFzdCBub3cgaGUgaGFzIHRoZSBmdWxsIAo+IHBpY3R1cmUuLi4KPiAKPiBDaGVlcnMs
Cj4gCj4gWzFdIGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy84MDA0OTQvCj4gCgpUaGFua3MsIEp1
bGllbiwgZm9yIHNoYXJpbmcgeW91ciBvcGluaW9uLgoKV2l0aCB0aGF0IHN0YXRlbWVudCBJJ2Qg
bGlrZSB0byBkZWZlciB0aGlzIHBhdGNoIHRvIDQuMTQuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
