Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144EC7B992
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 08:20:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hshtn-0003EA-3G; Wed, 31 Jul 2019 06:15:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GJXX=V4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hshtl-0003E0-Es
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 06:15:41 +0000
X-Inumbo-ID: 9da61eb1-b35a-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9da61eb1-b35a-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 06:15:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05D0CAD1E;
 Wed, 31 Jul 2019 06:15:37 +0000 (UTC)
To: Souptick Joarder <jrdr.linux@gmail.com>, marmarek@invisiblethingslab.com, 
 sstabellini@kernel.org, boris.ostrovsky@oracle.com
References: <1564511696-4044-1-git-send-email-jrdr.linux@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <436440f5-0031-5ad5-4a22-2acf218ad727@suse.com>
Date: Wed, 31 Jul 2019 08:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564511696-4044-1-git-send-email-jrdr.linux@gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen/gntdev.c: Replace vm_map_pages() with
 vm_map_pages_zero()
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
Cc: gregkh@linuxfoundation.org, linux@armlinux.org.uk, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, akpm@linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMTkgMjA6MzQsIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gJ2NvbW1pdCBkZjli
ZGUwMTVhNzIgKCJ4ZW4vZ250ZGV2LmM6IGNvbnZlcnQgdG8gdXNlIHZtX21hcF9wYWdlcygpIikn
Cj4gYnJlYWtzIGdudGRldiBkcml2ZXIuIElmIHZtYS0+dm1fcGdvZmYgPiAwLCB2bV9tYXBfcGFn
ZXMoKQo+IHdpbGw6Cj4gICAtIHVzZSBtYXAtPnBhZ2VzIHN0YXJ0aW5nIGF0IHZtYS0+dm1fcGdv
ZmYgaW5zdGVhZCBvZiAwCj4gICAtIHZlcmlmeSBtYXAtPmNvdW50IGFnYWluc3Qgdm1hX3BhZ2Vz
KCkrdm1hLT52bV9wZ29mZiBpbnN0ZWFkIG9mIGp1c3QKPiAgICAgdm1hX3BhZ2VzKCkuCj4gCj4g
SW4gcHJhY3RpY2UsIHRoaXMgYnJlYWtzIHVzaW5nIGEgc2luZ2xlIGdudGRldiBGRCBmb3IgbWFw
cGluZyBtdWx0aXBsZQo+IGdyYW50cy4KPiAKPiByZWxldmFudCBzdHJhY2Ugb3V0cHV0Ogo+IFtw
aWQgICA4NTddIGlvY3RsKDcsIElPQ1RMX0dOVERFVl9NQVBfR1JBTlRfUkVGLCAweDdmZmQzNDA3
YjZkMCkgPSAwCj4gW3BpZCAgIDg1N10gbW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9X
UklURSwgTUFQX1NIQVJFRCwgNywgMCkgPQo+IDB4Nzc3ZjEyMTFiMDAwCj4gW3BpZCAgIDg1N10g
aW9jdGwoNywgSU9DVExfR05UREVWX1NFVF9VTk1BUF9OT1RJRlksIDB4N2ZmZDM0MDdiNzEwKSA9
IDAKPiBbcGlkICAgODU3XSBpb2N0bCg3LCBJT0NUTF9HTlRERVZfTUFQX0dSQU5UX1JFRiwgMHg3
ZmZkMzQwN2I2ZDApID0gMAo+IFtwaWQgICA4NTddIG1tYXAoTlVMTCwgNDA5NiwgUFJPVF9SRUFE
fFBST1RfV1JJVEUsIE1BUF9TSEFSRUQsIDcsCj4gMHgxMDAwKSA9IC0xIEVOWElPIChObyBzdWNo
IGRldmljZSBvciBhZGRyZXNzKQo+IAo+IGRldGFpbHMgaGVyZToKPiBodHRwczovL2dpdGh1Yi5j
b20vUXViZXNPUy9xdWJlcy1pc3N1ZXMvaXNzdWVzLzUxOTkKPiAKPiBUaGUgcmVhc29uIGlzIC0+
ICggY29weWluZyBNYXJlaydzIHdvcmQgZnJvbSBkaXNjdXNzaW9uKQo+IAo+IHZtYS0+dm1fcGdv
ZmYgaXMgdXNlZCBhcyBpbmRleCBwYXNzZWQgdG8gZ250ZGV2X2ZpbmRfbWFwX2luZGV4LiBJdCdz
Cj4gYmFzaWNhbGx5IHVzaW5nIHRoaXMgcGFyYW1ldGVyIGZvciAid2hpY2ggZ3JhbnQgcmVmZXJl
bmNlIHRvIG1hcCIuCj4gbWFwIHN0cnVjdCByZXR1cm5lZCBieSBnbnRkZXZfZmluZF9tYXBfaW5k
ZXgoKSBkZXNjcmliZXMganVzdCB0aGUgcGFnZXMKPiB0byBiZSBtYXBwZWQuIFNwZWNpZmljYWxs
eSBtYXAtPnBhZ2VzWzBdIHNob3VsZCBiZSBtYXBwZWQgYXQKPiB2bWEtPnZtX3N0YXJ0LCBub3Qg
dm1hLT52bV9zdGFydCt2bWEtPnZtX3Bnb2ZmKlBBR0VfU0laRS4KPiAKPiBXaGVuIHRyeWluZyB0
byBtYXAgZ3JhbnQgd2l0aCBpbmRleCAoYWthIHZtYS0+dm1fcGdvZmYpID4gMSwKPiBfX3ZtX21h
cF9wYWdlcygpIHdpbGwgcmVmdXNlIHRvIG1hcCBpdCBiZWNhdXNlIGl0IHdpbGwgZXhwZWN0IG1h
cC0+Y291bnQKPiB0byBiZSBhdCBsZWFzdCB2bWFfcGFnZXModm1hKSt2bWEtPnZtX3Bnb2ZmLCB3
aGlsZSBpdCBpcyBleGFjdGx5Cj4gdm1hX3BhZ2VzKHZtYSkuCj4gCj4gQ29udmVydGluZyB2bV9t
YXBfcGFnZXMoKSB0byB1c2Ugdm1fbWFwX3BhZ2VzX3plcm8oKSB3aWxsIGZpeCB0aGUKPiBwcm9i
bGVtLgo+IAo+IE1hcmVrIGhhcyB0ZXN0ZWQgYW5kIGNvbmZpcm1lZCB0aGUgc2FtZS4KPiAKPiBS
ZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2li
bGV0aGluZ3NsYWIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIu
bGludXhAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgoKUHVzaGVkIHRvIHhlbi90aXAuZ2l0
IGZvci1saW51cy01LjNhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
