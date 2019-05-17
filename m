Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8F21737
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaM0-0005Bm-LC; Fri, 17 May 2019 10:44:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaLz-0005Bg-Ca
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:44:43 +0000
X-Inumbo-ID: c676a7aa-7890-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c676a7aa-7890-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:44:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:44:40 -0600
Message-Id: <5CDE90950200007800230069@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:44:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 01/15] x86/IRQ: deal with move-in-progress
 state in fixup_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZsYWcgYmVpbmcgc2V0IG1heSBwcmV2ZW50IGFmZmluaXR5IGNoYW5nZXMsIGFzIHRoZXNl
IG9mdGVuIGltcGx5CmFzc2lnbm1lbnQgb2YgYSBuZXcgdmVjdG9yLiBXaGVuIHRoZXJlJ3Mgbm8g
cG9zc2libGUgZGVzdGluYXRpb24gbGVmdApmb3IgdGhlIElSUSwgdGhlIGNsZWFyaW5nIG9mIHRo
ZSBmbGFnIG5lZWRzIHRvIGhhcHBlbiByaWdodCBmcm9tCmZpeHVwX2lycXMoKS4KCkFkZGl0aW9u
YWxseSBfYXNzaWduX2lycV92ZWN0b3IoKSBuZWVkcyB0byBhdm9pZCBzZXR0aW5nIHRoZSBmbGFn
IHdoZW4KdGhlcmUncyBubyBvbmxpbmUgQ1BVIGxlZnQgaW4gd2hhdCBnZXRzIHB1dCBpbnRvIC0+
YXJjaC5vbGRfY3B1X21hc2suClRoZSBvbGQgdmVjdG9yIGNhbiBiZSByZWxlYXNlZCByaWdodCBh
d2F5IGluIHRoaXMgY2FzZS4KCkFsc28gZXh0ZW5kIHRoZSBsb2cgbWVzc2FnZSBhYm91dCBicm9r
ZW4gYWZmaW5pdHkgdG8gaW5jbHVkZSB0aGUgbmV3CmFmZmluaXR5IGFzIHdlbGwsIGFsbG93aW5n
IHRvIG5vdGljZSBpc3N1ZXMgd2l0aCBhZmZpbml0eSBjaGFuZ2VzIG5vdAphY3R1YWxseSBoYXZp
bmcgdGFrZW4gcGxhY2UuIFN3YXAgdGhlIGlmL2Vsc2UtaWYgb3JkZXIgdGhlcmUgYXQgdGhlCnNh
bWUgdGltZSB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiBjb25kaXRpb25zIGNoZWNrZWQuCgpBdCB0
aGUgc2FtZSB0aW1lIHJlcGxhY2UgdHdvIG9wZW4gY29kZWQgaW5zdGFuY2VzIG9mIHRoZSBuZXcg
aGVscGVyCmZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQp2MzogTW92ZSByZWxlYXNlX29sZF92ZWMoKSBmdXJ0aGVyIHVwIChzbyBhIGxhdGVy
IHBhdGNoIHdvbid0IG5lZWQgdG8pLgogICAgUmUtYmFzZS4KdjI6IEFkZC91c2UgdmFsaWRfaXJx
X3ZlY3RvcigpLgp2MWI6IEFsc28gdXBkYXRlIHZlY3Rvcl9pcnFbXSBpbiB0aGUgY29kZSBhZGRl
ZCB0byBmaXh1cF9pcnFzKCkuCgotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2lycS5jCkBAIC05OSw2ICs5OSwyNyBAQCB2b2lkIHVubG9ja192ZWN0b3JfbG9jayh2
b2lkKQogICAgIHNwaW5fdW5sb2NrKCZ2ZWN0b3JfbG9jayk7CiB9CiAKK3N0YXRpYyBpbmxpbmUg
Ym9vbCB2YWxpZF9pcnFfdmVjdG9yKHVuc2lnbmVkIGludCB2ZWN0b3IpCit7CisgICAgcmV0dXJu
IHZlY3RvciA+PSBGSVJTVF9EWU5BTUlDX1ZFQ1RPUiAmJiB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9S
SVRZX1ZFQ1RPUjsKK30KKworc3RhdGljIHZvaWQgcmVsZWFzZV9vbGRfdmVjKHN0cnVjdCBpcnFf
ZGVzYyAqZGVzYykKK3sKKyAgICB1bnNpZ25lZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC5vbGRf
dmVjdG9yOworCisgICAgZGVzYy0+YXJjaC5vbGRfdmVjdG9yID0gSVJRX1ZFQ1RPUl9VTkFTU0lH
TkVEOworICAgIGNwdW1hc2tfY2xlYXIoZGVzYy0+YXJjaC5vbGRfY3B1X21hc2spOworCisgICAg
aWYgKCAhdmFsaWRfaXJxX3ZlY3Rvcih2ZWN0b3IpICkKKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7CisgICAgZWxzZSBpZiAoIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzICkKKyAgICB7Cisg
ICAgICAgIEFTU0VSVCh0ZXN0X2JpdCh2ZWN0b3IsIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzKSk7
CisgICAgICAgIGNsZWFyX2JpdCh2ZWN0b3IsIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzKTsKKyAg
ICB9Cit9CisKIHN0YXRpYyB2b2lkIHRyYWNlX2lycV9tYXNrKHVpbnQzMl90IGV2ZW50LCBpbnQg
aXJxLCBpbnQgdmVjdG9yLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY3B1bWFz
a190ICptYXNrKQogewpAQCAtMjg4LDE0ICszMDksNyBAQCBzdGF0aWMgdm9pZCBfX2NsZWFyX2ly
cV92ZWN0b3IoaW50IGlycSkKICAgICAgICAgcGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW29sZF92
ZWN0b3JdID0gfmlycTsKICAgICB9CiAKLSAgICBkZXNjLT5hcmNoLm9sZF92ZWN0b3IgPSBJUlFf
VkVDVE9SX1VOQVNTSUdORUQ7Ci0gICAgY3B1bWFza19jbGVhcihkZXNjLT5hcmNoLm9sZF9jcHVf
bWFzayk7Ci0KLSAgICBpZiAoIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzICkKLSAgICB7Ci0gICAg
ICAgIEFTU0VSVCh0ZXN0X2JpdChvbGRfdmVjdG9yLCBkZXNjLT5hcmNoLnVzZWRfdmVjdG9ycykp
OwotICAgICAgICBjbGVhcl9iaXQob2xkX3ZlY3RvciwgZGVzYy0+YXJjaC51c2VkX3ZlY3RvcnMp
OwotICAgIH0KKyAgICByZWxlYXNlX29sZF92ZWMoZGVzYyk7CiAKICAgICBkZXNjLT5hcmNoLm1v
dmVfaW5fcHJvZ3Jlc3MgPSAwOwogfQpAQCAtNTIwLDEyICs1MzQsMjEgQEAgbmV4dDoKICAgICAg
ICAgLyogRm91bmQgb25lISAqLwogICAgICAgICBjdXJyZW50X3ZlY3RvciA9IHZlY3RvcjsKICAg
ICAgICAgY3VycmVudF9vZmZzZXQgPSBvZmZzZXQ7Ci0gICAgICAgIGlmIChvbGRfdmVjdG9yID4g
MCkgewotICAgICAgICAgICAgZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzID0gMTsKLSAgICAg
ICAgICAgIGNwdW1hc2tfY29weShkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgZGVzYy0+YXJjaC5j
cHVfbWFzayk7CisKKyAgICAgICAgaWYgKCBvbGRfdmVjdG9yID4gMCApCisgICAgICAgIHsKKyAg
ICAgICAgICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCBkZXNjLT5hcmNo
LmNwdV9tYXNrLAorICAgICAgICAgICAgICAgICAgICAgICAgJmNwdV9vbmxpbmVfbWFwKTsKICAg
ICAgICAgICAgIGRlc2MtPmFyY2gub2xkX3ZlY3RvciA9IGRlc2MtPmFyY2gudmVjdG9yOworICAg
ICAgICAgICAgaWYgKCAhY3B1bWFza19lbXB0eShkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaykgKQor
ICAgICAgICAgICAgICAgIGRlc2MtPmFyY2gubW92ZV9pbl9wcm9ncmVzcyA9IDE7CisgICAgICAg
ICAgICBlbHNlCisgICAgICAgICAgICAgICAgLyogVGhpcyBjYW4gaGFwcGVuIHdoaWxlIG9mZmxp
bmluZyBhIENQVS4gKi8KKyAgICAgICAgICAgICAgICByZWxlYXNlX29sZF92ZWMoZGVzYyk7CiAg
ICAgICAgIH0KKwogICAgICAgICB0cmFjZV9pcnFfbWFzayhUUkNfSFdfSVJRX0FTU0lHTl9WRUNU
T1IsIGlycSwgdmVjdG9yLCAmdG1wX21hc2spOworCiAgICAgICAgIGZvcl9lYWNoX2NwdShuZXdf
Y3B1LCAmdG1wX21hc2spCiAgICAgICAgICAgICBwZXJfY3B1KHZlY3Rvcl9pcnEsIG5ld19jcHUp
W3ZlY3Rvcl0gPSBpcnE7CiAgICAgICAgIGRlc2MtPmFyY2gudmVjdG9yID0gdmVjdG9yOwpAQCAt
Njk0LDE0ICs3MTcsOCBAQCB2b2lkIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0KHN0cnVjdCBj
CiAKICAgICAgICAgaWYgKCBkZXNjLT5hcmNoLm1vdmVfY2xlYW51cF9jb3VudCA9PSAwICkKICAg
ICAgICAgewotICAgICAgICAgICAgZGVzYy0+YXJjaC5vbGRfdmVjdG9yID0gSVJRX1ZFQ1RPUl9V
TkFTU0lHTkVEOwotICAgICAgICAgICAgY3B1bWFza19jbGVhcihkZXNjLT5hcmNoLm9sZF9jcHVf
bWFzayk7Ci0KLSAgICAgICAgICAgIGlmICggZGVzYy0+YXJjaC51c2VkX3ZlY3RvcnMgKQotICAg
ICAgICAgICAgewotICAgICAgICAgICAgICAgIEFTU0VSVCh0ZXN0X2JpdCh2ZWN0b3IsIGRlc2Mt
PmFyY2gudXNlZF92ZWN0b3JzKSk7Ci0gICAgICAgICAgICAgICAgY2xlYXJfYml0KHZlY3Rvciwg
ZGVzYy0+YXJjaC51c2VkX3ZlY3RvcnMpOwotICAgICAgICAgICAgfQorICAgICAgICAgICAgQVNT
RVJUKHZlY3RvciA9PSBkZXNjLT5hcmNoLm9sZF92ZWN0b3IpOworICAgICAgICAgICAgcmVsZWFz
ZV9vbGRfdmVjKGRlc2MpOwogICAgICAgICB9CiB1bmxvY2s6CiAgICAgICAgIHNwaW5fdW5sb2Nr
KCZkZXNjLT5sb2NrKTsKQEAgLTI0MDAsNiArMjQxNywzMyBAQCB2b2lkIGZpeHVwX2lycXMoY29u
c3QgY3B1bWFza190ICptYXNrLCBiCiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQog
CisgICAgICAgIC8qCisgICAgICAgICAqIEluIG9yZGVyIGZvciB0aGUgYWZmaW5pdHkgYWRqdXN0
bWVudCBiZWxvdyB0byBiZSBzdWNjZXNzZnVsLCB3ZQorICAgICAgICAgKiBuZWVkIF9fYXNzaWdu
X2lycV92ZWN0b3IoKSB0byBzdWNjZWVkLiBUaGlzIGluIHBhcnRpY3VsYXIgbWVhbnMKKyAgICAg
ICAgICogY2xlYXJpbmcgZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzIGlmIHRoaXMgd291bGQg
b3RoZXJ3aXNlCisgICAgICAgICAqIHByZXZlbnQgdGhlIGZ1bmN0aW9uIGZyb20gc3VjY2VlZGlu
Zy4gU2luY2UgdGhlcmUncyBubyB3YXkgZm9yIHRoZQorICAgICAgICAgKiBmbGFnIHRvIGdldCBj
bGVhcmVkIGFueW1vcmUgd2hlbiB0aGVyZSdzIG5vIHBvc3NpYmxlIGRlc3RpbmF0aW9uCisgICAg
ICAgICAqIGxlZnQgKHRoZSBvbmx5IHBvc3NpYmlsaXR5IHRoZW4gd291bGQgYmUgdGhlIElSUXMg
ZW5hYmxlZCB3aW5kb3cKKyAgICAgICAgICogYWZ0ZXIgdGhpcyBsb29wKSwgdGhlcmUncyB0aGVu
IGFsc28gbm8gcmFjZSB3aXRoIHVzIGRvaW5nIGl0IGhlcmUuCisgICAgICAgICAqCisgICAgICAg
ICAqIFRoZXJlZm9yZSB0aGUgbG9naWMgaGVyZSBhbmQgdGhlcmUgbmVlZCB0byByZW1haW4gaW4g
c3luYy4KKyAgICAgICAgICovCisgICAgICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dy
ZXNzICYmCisgICAgICAgICAgICAgIWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNrLCBkZXNjLT5hcmNo
LmNwdV9tYXNrKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHU7CisK
KyAgICAgICAgICAgIGNwdW1hc2tfYW5kKCZhZmZpbml0eSwgZGVzYy0+YXJjaC5vbGRfY3B1X21h
c2ssICZjcHVfb25saW5lX21hcCk7CisKKyAgICAgICAgICAgIHNwaW5fbG9jaygmdmVjdG9yX2xv
Y2spOworICAgICAgICAgICAgZm9yX2VhY2hfY3B1KGNwdSwgJmFmZmluaXR5KQorICAgICAgICAg
ICAgICAgIHBlcl9jcHUodmVjdG9yX2lycSwgY3B1KVtkZXNjLT5hcmNoLm9sZF92ZWN0b3JdID0g
fmlycTsKKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZ2ZWN0b3JfbG9jayk7CisKKyAgICAgICAg
ICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsKKyAgICAgICAgICAgIGRlc2MtPmFyY2gubW92ZV9p
bl9wcm9ncmVzcyA9IDA7CisgICAgICAgIH0KKwogICAgICAgICBjcHVtYXNrX2FuZCgmYWZmaW5p
dHksICZhZmZpbml0eSwgbWFzayk7CiAgICAgICAgIGlmICggY3B1bWFza19lbXB0eSgmYWZmaW5p
dHkpICkKICAgICAgICAgewpAQCAtMjQxOCwxNSArMjQ2MiwxOCBAQCB2b2lkIGZpeHVwX2lycXMo
Y29uc3QgY3B1bWFza190ICptYXNrLCBiCiAgICAgICAgIGlmICggZGVzYy0+aGFuZGxlci0+ZW5h
YmxlICkKICAgICAgICAgICAgIGRlc2MtPmhhbmRsZXItPmVuYWJsZShkZXNjKTsKIAorICAgICAg
ICBjcHVtYXNrX2NvcHkoJmFmZmluaXR5LCBkZXNjLT5hZmZpbml0eSk7CisKICAgICAgICAgc3Bp
bl91bmxvY2soJmRlc2MtPmxvY2spOwogCiAgICAgICAgIGlmICggIXZlcmJvc2UgKQogICAgICAg
ICAgICAgY29udGludWU7CiAKLSAgICAgICAgaWYgKCBicmVha19hZmZpbml0eSAmJiBzZXRfYWZm
aW5pdHkgKQotICAgICAgICAgICAgcHJpbnRrKCJCcm9rZSBhZmZpbml0eSBmb3IgaXJxICVpXG4i
LCBpcnEpOwotICAgICAgICBlbHNlIGlmICggIXNldF9hZmZpbml0eSApCi0gICAgICAgICAgICBw
cmludGsoIkNhbm5vdCBzZXQgYWZmaW5pdHkgZm9yIGlycSAlaVxuIiwgaXJxKTsKKyAgICAgICAg
aWYgKCAhc2V0X2FmZmluaXR5ICkKKyAgICAgICAgICAgIHByaW50aygiQ2Fubm90IHNldCBhZmZp
bml0eSBmb3IgSVJRJXVcbiIsIGlycSk7CisgICAgICAgIGVsc2UgaWYgKCBicmVha19hZmZpbml0
eSApCisgICAgICAgICAgICBwcmludGsoIkJyb2tlIGFmZmluaXR5IGZvciBJUlEldSwgbmV3OiAl
KnBiXG4iLAorICAgICAgICAgICAgICAgICAgIGlycSwgbnJfY3B1X2lkcywgJmFmZmluaXR5KTsK
ICAgICB9CiAKICAgICAvKiBUaGF0IGRvZXNuJ3Qgc2VlbSBzdWZmaWNpZW50LiAgR2l2ZSBpdCAx
bXMuICovCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
