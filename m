Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C814818A8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:00:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubdL-0005C7-Lw; Mon, 05 Aug 2019 11:58:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YqOR=WB=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hubdK-0005C1-DL
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:58:34 +0000
X-Inumbo-ID: 5873116c-b778-11e9-a861-a35b15976920
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5873116c-b778-11e9-a861-a35b15976920;
 Mon, 05 Aug 2019 11:58:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD0F91E2C;
 Mon,  5 Aug 2019 07:58:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Aug 2019 07:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=CpP+jXyBTmqGd87EE+i6YMktL/+
 9k4HJgd3+6RNm4e0=; b=YSU/9sxglEDrFB83JMjF5GYy1tJNN+/Hz/W4eHE00/3
 BS634k/o0H3PihhmK1Zb32wPagLscjViaodRihFhCD4D1Xr/N7OuTcCbHdp+yp2b
 hAxUeUDzLDmXF6HHzXkoD5FwVLNdoR9yahMQJK8k07kLoC38wxuUmJsIv3RETAn+
 H9QPWEjzDXwKE3COFk/KG/iAldsp5igbzyKEg5WxbXcX8X5kFuvu/PL1xdmtAQVA
 k6/bZwVVJezhner1ToP4BbOK8i5i1v19niZKf2QroMLgRxOyNX5VHVmN+VG4udYN
 7snOYX6wZ0gPnEWBvZRAPYH8AoyXgXEdMrsCW5X4p7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CpP+jX
 yBTmqGd87EE+i6YMktL/+9k4HJgd3+6RNm4e0=; b=J/m9KWk/b9cprwIDZ0LVHU
 NSpbZFZBe5Go/FrtVsGyrgXG4cyu/FpCCSn0H0cnNVddaTcdkJ5VHSHSj79LwoZI
 QeRBGmt5qreO1w4HRZ2nIbCfdobl49bQU6qEPYCbFYf/otoStAv03MgCbIZq5mHu
 hpFVmSMg9ic0ilmBUA4sh7VwrzNm+ZkLi9sOZaoNUcVPLCmnRYB6DQ6mOXaNXV3A
 SVichjeuqWc/c9yS0TaGcnxpCMmJ0rhZjUxAdUFTPjxnG+eRpsZewbibfn3sqCU9
 w/BHCyj93gOjODAS4jPgj4VMdzqA6jGvmjVkOn+7XYXDYuJslR7QzaQ0pKJ4xSfg
 ==
X-ME-Sender: <xms:5hlIXcqMVKi6zxTmzvvHuT1PJZQtmmC1XN_iAqPr-G63OXDCke2BOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtjedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlh
 drohhrghenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:5hlIXSMFXTiUORDQChenY9N-xpSnU5cxldhyvUmIPpbStCHRo9JFyw>
 <xmx:5hlIXXry_Fd0KQl8H9WVBkIZjErtgxBhonRW_5eSpbJc85k93DemqQ>
 <xmx:5hlIXTeo0I6vFJ6Ck8XI_Ghi8pANBVVwSRh-EE8pdL-O_Kz3V7axuQ>
 <xmx:5xlIXaPeOx7_ugFSNGIfd6OSrqrUuuHKHqwJUnqN-H8Y3UCQ9ojxlw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id B723E80060;
 Mon,  5 Aug 2019 07:58:29 -0400 (EDT)
Date: Mon, 5 Aug 2019 13:58:24 +0200
From: Greg KH <greg@kroah.com>
To: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <20190805115824.GC8189@kroah.com>
References: <20190802160614.8089-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802160614.8089-1-vbabka@suse.cz>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH STABLE 4.9] x86, mm,
 gup: prevent get_page() race with munmap in paravirt guest
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
Cc: Juergen Gross <jgross@suse.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDY6MDY6MTRQTSArMDIwMCwgVmxhc3RpbWlsIEJhYmth
IHdyb3RlOgo+IFRoZSB4ODYgdmVyc2lvbiBvZiBnZXRfdXNlcl9wYWdlc19mYXN0KCkgcmVsaWVz
IG9uIGRpc2FibGVkIGludGVycnVwdHMgdG8KPiBzeW5jaHJvbml6ZSBndXBfcHRlX3JhbmdlKCkg
YmV0d2VlbiBndXBfZ2V0X3B0ZShwdGVwKTsgYW5kIGdldF9wYWdlKCkgYWdhaW5zdAo+IGEgcGFy
YWxsZWwgbXVubWFwLiBUaGUgbXVubWFwIHNpZGUgbnVsbHMgdGhlIHB0ZSwgdGhlbiBmbHVzaGVz
IFRMQnMsIHRoZW4KPiByZWxlYXNlcyB0aGUgcGFnZS4gQXMgVExCIGZsdXNoIGlzIGRvbmUgc3lu
Y2hyb25vdXNseSB2aWEgSVBJIGRpc2FibGluZwo+IGludGVycnVwdHMgYmxvY2tzIHRoZSBwYWdl
IHJlbGVhc2UsIGFuZCBnZXRfcGFnZSgpLCB3aGljaCBhc3N1bWVzIGV4aXN0aW5nCj4gcmVmZXJl
bmNlIG9uIHBhZ2UsIGlzIHRodXMgc2FmZS4KPiBIb3dldmVyIHdoZW4gVExCIGZsdXNoIGlzIGRv
bmUgYnkgYSBoeXBlcmNhbGwsIGUuZy4gaW4gYSBYZW4gUFYgZ3Vlc3QsIHRoZXJlIGlzCj4gbm8g
YmxvY2tpbmcgdGhhbmtzIHRvIGRpc2FibGVkIGludGVycnVwdHMsIGFuZCBnZXRfcGFnZSgpIGNh
biBzdWNjZWVkIG9uIGEgcGFnZQo+IHRoYXQgd2FzIGFscmVhZHkgZnJlZWQgb3IgZXZlbiByZXVz
ZWQuCj4gCj4gV2UgaGF2ZSByZWNlbnRseSBzZWVuIHRoaXMgaGFwcGVuIHdpdGggb3VyIDQuNCBh
bmQgNC4xMiBiYXNlZCBrZXJuZWxzLCB3aXRoCj4gdXNlcnNwYWNlIChqYXZhKSB0aGF0IGV4aXRz
IGEgdGhyZWFkLCB3aGVyZSBtbV9yZWxlYXNlKCkgcGVyZm9ybXMgYSBmdXRleF93YWtlKCkKPiBv
biB0c2stPmNsZWFyX2NoaWxkX3RpZCwgYW5kIGFub3RoZXIgdGhyZWFkIGluIHBhcmFsbGVsIHVu
bWFwcyB0aGUgcGFnZSB3aGVyZQo+IHRzay0+Y2xlYXJfY2hpbGRfdGlkIHBvaW50cyB0by4gVGhl
IHNwdXJpb3VzIGdldF9wYWdlKCkgc3VjY2VlZHMsIGJ1dCBmdXRleCBjb2RlCj4gaW1tZWRpYXRl
bHkgcmVsZWFzZXMgdGhlIHBhZ2UgYWdhaW4sIHdoaWxlIGl0J3MgYWxyZWFkeSBvbiBhIGZyZWVs
aXN0LiBTeW1wdG9tcwo+IGluY2x1ZGUgYSBiYWQgcGFnZSBzdGF0ZSB3YXJuaW5nLCBnZW5lcmFs
IHByb3RlY3Rpb24gZmF1bHRzIGFjZXNzaW5nIGEgcG9pc29uZWQKPiBsaXN0IHByZXYvbmV4dCBw
b2ludGVyIGluIHRoZSBmcmVlbGlzdCwgb3IgZnJlZSBwYWdlIHBjcGxpc3RzIG9mIHR3byBjcHVz
IGpvaW5lZAo+IHRvZ2V0aGVyIGluIGEgc2luZ2xlIGxpc3QuIE9zY2FyIGhhcyBhbHNvIHJlcHJv
ZHVjZWQgdGhpcyBzY2VuYXJpbywgd2l0aCBhCj4gcGF0Y2ggaW5zZXJ0aW5nIGRlbGF5cyBiZWZv
cmUgdGhlIGdldF9wYWdlKCkgdG8gbWFrZSB0aGUgcmFjZSB3aW5kb3cgbGFyZ2VyLgo+IAo+IEZp
eCB0aGlzIGJ5IHJlbW92aW5nIHRoZSBkZXBlbmRlbmN5IG9uIFRMQiBmbHVzaCBpbnRlcnJ1cHRz
IHRoZSBzYW1lIHdheSBhcyB0aGUKPiBnZW5lcmljIGdldF91c2VyX3BhZ2VzX2Zhc3QoKSBjb2Rl
IGJ5IHVzaW5nIHBhZ2VfY2FjaGVfYWRkX3NwZWN1bGF0aXZlKCkgYW5kCj4gcmV2YWxpZGF0aW5n
IHRoZSBQVEUgY29udGVudHMgYWZ0ZXIgcGlubmluZyB0aGUgcGFnZS4gTWFpbmxpbmUgaXMgc2Fm
ZSBzaW5jZQo+IDQuMTMgd2hlcmUgdGhlIHg4NiBndXAgY29kZSB3YXMgcmVtb3ZlZCBpbiBmYXZv
ciBvZiB0aGUgY29tbW9uIGNvZGUuIEFjY2Vzc2luZwo+IHRoZSBwYWdlIHRhYmxlIGl0c2VsZiBz
YWZlbHkgYWxzbyByZWxpZXMgb24gZGlzYWJsZWQgaW50ZXJydXB0cyBhbmQgVExCIGZsdXNoCj4g
SVBJcyB0aGF0IGRvbid0IGhhcHBlbiB3aXRoIGh5cGVyY2FsbHMsIHdoaWNoIHdhcyBhY2tub3ds
ZWRnZWQgaW4gY29tbWl0Cj4gOWU1MmZjMmI1MGRlICgieDg2L21tOiBFbmFibGUgUkNVIGJhc2Vk
IHBhZ2UgdGFibGUgZnJlZWluZwo+IChDT05GSUdfSEFWRV9SQ1VfVEFCTEVfRlJFRT15KSIpLiBU
aGF0IGNvbW1pdCB3aXRoIGZvbGx1cHMgc2hvdWxkIGFsc28gYmUKPiBiYWNrcG9ydGVkIGZvciBm
dWxsIHNhZmV0eSwgYWx0aG91Z2ggb3VyIHJlcHJvZHVjZXIgZGlkbid0IGhpdCBhIHByb2JsZW0K
PiB3aXRob3V0IHRoYXQgYmFja3BvcnQuCj4gCj4gUmVwcm9kdWNlZC1ieTogT3NjYXIgU2FsdmFk
b3IgPG9zYWx2YWRvckBzdXNlLmRlPgo+IFNpZ25lZC1vZmYtYnk6IFZsYXN0aW1pbCBCYWJrYSA8
dmJhYmthQHN1c2UuY3o+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRl
Pgo+IENjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiBDYzogUGV0ZXIgWmlqbHN0
cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gQ2M6IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogVml0YWx5IEt1em5ldHNvdiA8dmt1em5ldHNAcmVkaGF0LmNvbT4KPiBD
YzogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBC
b3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiBDYzogRGF2ZSBIYW5zZW4gPGRhdmUuaGFu
c2VuQGxpbnV4LmludGVsLmNvbT4KPiBDYzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gCj4gSGksIEknbSBzZW5kaW5nIHRoaXMgc3RhYmxlLW9ubHkgcGF0Y2ggZm9y
IGNvbnNpZGVyYXRpb24gYmVjYXVzZSBpdCdzIHByb2JhYmx5Cj4gdW5yZWFsaXN0aWMgdG8gYmFj
a3BvcnQgdGhlIDQuMTMgc3dpdGNoIHRvIGdlbmVyaWMgR1VQLiBJIGNhbiBsb29rIGF0IDQuNCBh
bmQKPiAzLjE2IGlmIGFjY2VwdGVkLiBUaGUgUkNVIHBhZ2UgdGFibGUgZnJlZWluZyBjb3VsZCBi
ZSBhbHNvIGNvbnNpZGVyZWQuCj4gTm90ZSB0aGUgcGF0Y2ggYWxzbyBpbmNsdWRlcyBwYWdlIHJl
ZmNvdW50IHByb3RlY3Rpb24uIEkgZm91bmQgb3V0IHRoYXQKPiA4ZmRlMTJjYTc5YWYgKCJtbTog
cHJldmVudCBnZXRfdXNlcl9wYWdlcygpIGZyb20gb3ZlcmZsb3dpbmcgcGFnZSByZWZjb3VudCIp
Cj4gYmFja3BvcnQgdG8gNC45IG1pc3NlZCB0aGUgYXJjaC1zcGVjaWZpYyBndXAgaW1wbGVtZW50
YXRpb25zOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjY1MDMyM2YtZGJjOS1mMDY5
LTAwMGItZjZiMGY5NDFhMDY1QHN1c2UuY3ovCgpUaGlzIGxvb2tzIHNhbmUgdG8gbWUsIHRoYW5r
IHlvdSBmb3IgdGhlIGJhY2twb3J0LiAgSSd2ZSBxdWV1ZWQgaXQgdXAKbm93LCBhbmQgaWYgYW55
b25lIGhhcyBhbnkgb2JqZWN0aW9ucywgcGxlYXNlIGxldCBtZSBrbm93LgoKdGhhbmtzLAoKZ3Jl
ZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
