Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C521B173398
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:18:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bkA-000710-IJ; Fri, 28 Feb 2020 09:15:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7bk9-00070v-8z
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:15:37 +0000
X-Inumbo-ID: e0e9ea9a-5a0a-11ea-9c17-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0e9ea9a-5a0a-11ea-9c17-bc764e2007e4;
 Fri, 28 Feb 2020 09:15:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED073B292;
 Fri, 28 Feb 2020 09:15:34 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200228071922.3983-1-jgross@suse.com>
 <e9dd548a-9a32-3d45-3daf-30f080df0b74@suse.com>
 <47ddfaf8-273c-ab52-866d-52d0ca5f3aee@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfd112a4-04fc-8beb-a74c-89db85057906@suse.com>
Date: Fri, 28 Feb 2020 10:15:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <47ddfaf8-273c-ab52-866d-52d0ca5f3aee@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: make sure stop_machine_run() is
 always called in a tasklet
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAwOTo1OCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOC4wMi4yMCAw
OToyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjAyLjIwMjAgMDg6MTksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBXaXRoIGNvcmUgc2NoZWR1bGluZyBhY3RpdmUgaXQgaXMgbWFuZGF0
b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8KPj4+IGJlIGNhbGxlZCBpbiBpZGxlIGNvbnRl
eHQgb25seSAoc28gZWl0aGVyIGR1cmluZyBib290IG9yIGluIGEgdGFza2xldCksCj4+PiBhcyBv
dGhlcndpc2UgYSBzY2hlZHVsaW5nIGRlYWRsb2NrIHdvdWxkIG9jY3VyOiBzdG9wX21hY2hpbmVf
cnVuKCkKPj4+IGRvZXMgYSBjcHUgcmVuZGV6dm91cyBieSBhY3RpdmF0aW5nIGEgdGFza2xldCBv
biBhbGwgb3RoZXIgY3B1cy4gSW4KPj4+IGNhc2Ugc3RvcF9tYWNoaW5lX3J1bigpIHdhcyBub3Qg
Y2FsbGVkIGluIGFuIGlkbGUgdmNwdSBpdCB3b3VsZCBibG9jawo+Pj4gc2NoZWR1bGluZyB0aGUg
aWRsZSB2Y3B1IG9uIGl0cyBzaWJsaW5ncyB3aXRoIGNvcmUgc2NoZWR1bGluZyBiZWluZwo+Pj4g
YWN0aXZlLCByZXN1bHRpbmcgaW4gYSBoYW5nLgo+Pj4KPj4+IFB1dCBhIEJVR19PTigpIGludG8g
c3RvcF9tYWNoaW5lX3J1bigpIHRvIHRlc3QgZm9yIGJlaW5nIGNhbGxlZCBpbiBhbgo+Pj4gaWRs
ZSB2Y3B1IG9ubHkgYW5kIGFkYXB0IHRoZSBtaXNzaW5nIGNhbGwgc2l0ZSAodWNvZGUgbG9hZGlu
ZykgdG8gdXNlIGEKPj4+IHRhc2tsZXQgZm9yIGNhbGxpbmcgc3RvcF9tYWNoaW5lX3J1bigpLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+
IC0tLQo+Pj4gVjI6Cj4+PiAtIHJlcGhyYXNlIGNvbW1pdCBtZXNzYWdlIChKdWxpZW4gR3JhbGwp
Cj4+PiAtLS0KPj4+ICAgeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICB8IDU0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgIHhlbi9jb21tb24vc3Rv
cF9tYWNoaW5lLmMgfCAgMSArCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCj4+Cj4+IFRoZXJlJ3Mgbm8gbWVudGlvbiBhbnl3aGVyZSBvZiBh
IGNvbm5lY3Rpb24gdG8geW91ciBSQ1Ugc2VyaWVzLAo+PiBub3IgdG8gcmN1X2JhcnJpZXIoKS4g
WWV0IHRoZSBjaGFuZ2UgcHV0cyBhIG5ldyByZXN0cmljdGlvbiBhbHNvCj4+IG9uIGl0cyB1c2Us
IGFuZCBpaXJjIHRoaXMgd2FzIG1lbnRpb25lZCBpbiBwcmlvciBkaXNjdXNzaW9uLiBEaWQKPj4g
SSBtaXNzIGFueXRoaW5nPwo+IAo+IEJhc2ljYWxseSB0aGlzIHBhdGNoIG1ha2VzIHRoZSByZXN0
cmljdGlvbiBleHBsaWNpdC4gV2l0aG91dCB0aGUgcGF0Y2gKPiBzdG9wX21hY2hpbmVfcnVuKCkg
YmVpbmcgY2FsbGVkIG91dHNpZGUgb2YgYSB0YXNrbGV0IHdvdWxkIGp1c3QgaGFuZwo+IHdpdGgg
Y29yZSBzY2hlZHVsaW5nIGJlaW5nIGFjdGl2ZS4gTm93IGl0IHdpbGwgY2F0Y2ggdGhvc2Ugdmlv
bGF0aW9ucwo+IGVhcmx5IGV2ZW4gd2l0aCBjb3JlIHNjaGVkdWxpbmcgaW5hY3RpdmUuCj4gCj4g
Tm90ZSB0aGF0IGN1cnJlbnRseSB0aGVyZSBhcmUgbm8gdmlvbGF0aW9ucyBvZiB0aGlzIHJlc3Ry
aWN0aW9uIGFueXdoZXJlCj4gaW4gdGhlIGh5cGVydmlzb3Igb3RoZXIgdGhhbiB0aGUgb25lIGFk
ZHJlc3NlZCBieSB0aGlzIHBhdGNoLgoKV2VsbCwgdGhlcmUgaXMgYSBjb25uZWN0aW9uIHRvIGNv
cmUgc2NoZWR1bGluZy4gV2l0aG91dCBpdCwgaS5lLgpwcmlvciB0byA0LjEzLCB0aGVyZSB3YXMg
bm8gcmVzdHJpY3Rpb24gb24gdGhlIHBsYWNlbWVudCBvZgpyY3VfYmFycmllcigpIGludm9jYXRp
b25zLiBBY2NvcmRpbmcgdG8gd2hhdCB5b3Ugc2F5IGFib3ZlLCB0aGUKcmVzdHJpY3Rpb24gd2Fz
IGltcGxpY2l0bHkgaW50cm9kdWNlZCB3aXRoIGNvcmUgc2NoZWR1bGluZy4gSXQKc2hvdWxkIGlt
byBiZSBtYWRlIGV4cGxpY2l0IGJ5IGF0dGFjaGluZyBhIGNvbW1lbnQsIHdoaWNoIHdvdWxkCihh
Z2FpbiBpbW8pIGJlc3QgYmUgZG9uZSBoZXJlIGJlY2F1c2Ugbm93IHlvdSBhbHNvIG1ha2UgdGhp
cwpjYXNlIGNyYXNoIHdpdGhvdXQgY29yZSBzY2hlZHVsaW5nIGluIHVzZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
