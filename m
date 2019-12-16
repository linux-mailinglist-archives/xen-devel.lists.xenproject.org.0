Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA09120671
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:56:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpso-0006ch-NZ; Mon, 16 Dec 2019 12:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rm1U=2G=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1igpsm-0006cc-HZ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:53:52 +0000
X-Inumbo-ID: 16e378d8-2003-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16e378d8-2003-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576500823;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=U4xYyv7ScWl0HIyn7n7ch+DOSmkwpKNrhc3Q6d85qBk=;
 b=S7Eexb0GahZSlzCcwHIMuo+IKXnJZHCehOnFJktcUQh7i2tUUF+is7I2
 9gaq7aTDX31FoJ/y4Jk/ZNvse8Qn1iJcQ+uSyM0D4JtqWATNDNx4nHSYB
 j7/BOnO6WiaHaLQrDd58TMxhe5a/AjMX5exrWJLyxO9lO3EogEp7OK4VY Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7Lw/5S9FQFjMtdZxXfhTqypCy9MsElz0To7urfKFir9KRj/FpxBKk7YZvd/QN7wijGzHtq8Trs
 v9/Bk+brycRIbyCMD0qR8AQKBGGZBm4tJ5T2Ov3lpqTdexhzYDYS5pnNClMOA07DjEuk4eX8Wi
 xj9k0ccM0NfwOUTWc7M++DwKee/eHgaJvGcPJywzuZLHxAT64gGzXPtLqRXvkIefFoE4z4WCL2
 9ggDJct2KNcl+Nlo1G6WDla35fI+LHm8MmSMsM7gDeE1yfK4picxtKvXrgkr+RsWpwPmjgUOL0
 xCc=
X-SBRS: 2.7
X-MesageID: 9853242
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; 
   d="scan'208";a="9853242"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
 <20191216100058.GM11756@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <65efcbf8-e9f9-385c-903d-895f21d08132@citrix.com>
Date: Mon, 16 Dec 2019 12:53:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216100058.GM11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMTIvMjAxOSAxMDowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIERl
YyAxMywgMjAxOSBhdCAxMDo0ODowMlBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
Tm93IHRoYXQgdnRzY19sYXN0IGlzIHRoZSBvbmx5IGVudGl0eSBwcm90ZWN0ZWQgYnkgdnRzY19s
b2NrIHdlIGNhbgo+PiBzaW1wbHkgdXBkYXRlIGl0IHVzaW5nIGEgc2luZ2xlIGF0b21pYyBvcGVy
YXRpb24gYW5kIGRyb3AgdGhlIHNwaW5sb2NrCj4+IGVudGlyZWx5LiBUaGlzIGlzIGV4dHJlbWVs
eSBpbXBvcnRhbnQgZm9yIHRoZSBjYXNlIG9mIHJ1bm5pbmcgbmVzdGVkCj4+IChlLmcuIHNoaW0g
aW5zdGFuY2Ugd2l0aCBsb3RzIG9mIHZDUFVzIGFzc2lnbmVkKSBzaW5jZSBpZiBwcmVlbXB0aW9u
Cj4+IGhhcHBlbnMgc29tZXdoZXJlIGluc2lkZSB0aGUgY3JpdGljYWwgc2VjdGlvbiB0aGF0IHdv
dWxkIGltbWVkaWF0ZWx5Cj4+IG1lYW4gdGhhdCBvdGhlciB2Q1BVIHN0b3AgcHJvZ3Jlc3Npbmcg
KGFuZCBwcm9iYWJseSBiZWluZyBwcmVlbXB0ZWQKPj4gYXMgd2VsbCkgd2FpdGluZyBmb3IgdGhl
IHNwaW5sb2NrIHRvIGJlIGZyZWVkLgo+Pgo+PiBUaGlzIGZpeGVzIGNvbnN0YW50IHNoaW0gZ3Vl
c3QgYm9vdCBsb2NrdXBzIHdpdGggfjMyIHZDUFVzIGlmIHRoZXJlIGlzCj4+IHZDUFUgb3ZlcmNv
bW1pdCBwcmVzZW50ICh3aGljaCBpbmNyZWFzZXMgdGhlIGxpa2VsaWhvb2Qgb2YgcHJlZW1wdGlv
bikuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgo+PiAtLS0KPj4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgfCAgMSAt
Cj4+ICB4ZW4vYXJjaC94ODYvdGltZS5jICAgICAgICAgIHwgMTYgKysrKysrLS0tLS0tLS0tLQo+
PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCB8ICAxIC0KPj4gIDMgZmlsZXMgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+PiBpbmRleCBiZWQx
OWZjLi45NDUzMWJlIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4gKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IEBAIC01MzksNyArNTM5LDYgQEAgaW50IGFyY2hf
ZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAo+PiAgICAgIElOSVRfUEFHRV9MSVNUX0hF
QUQoJmQtPmFyY2gucmVsbWVtX2xpc3QpOwo+PiAgCj4+ICAgICAgc3Bpbl9sb2NrX2luaXQoJmQt
PmFyY2guZTgyMF9sb2NrKTsKPj4gLSAgICBzcGluX2xvY2tfaW5pdCgmZC0+YXJjaC52dHNjX2xv
Y2spOwo+PiAgCj4+ICAgICAgLyogTWluaW1hbCBpbml0aWFsaXNhdGlvbiBmb3IgdGhlIGlkbGUg
ZG9tYWluLiAqLwo+PiAgICAgIGlmICggdW5saWtlbHkoaXNfaWRsZV9kb21haW4oZCkpICkKPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4+
IGluZGV4IDIxNjE2OWEuLjIwMjQ0NmYgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1l
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+PiBAQCAtMjEzMCwxOSArMjEzMCwxNSBA
QCB1NjQgZ3RzY190b19ndGltZShzdHJ1Y3QgZG9tYWluICpkLCB1NjQgdHNjKQo+PiAgCj4+ICB1
aW50NjRfdCBwdl9zb2Z0X3JkdHNjKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncykKPj4gIHsKPj4gLSAgICBzX3RpbWVfdCBub3cgPSBnZXRfc190
aW1lKCk7Cj4+ICsgICAgc190aW1lX3Qgb2xkLCBuZXcsIG5vdyA9IGdldF9zX3RpbWUoKTsKPj4g
ICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+PiAgCj4+IC0gICAgc3Bpbl9sb2Nr
KCZkLT5hcmNoLnZ0c2NfbG9jayk7Cj4+IC0KPj4gLSAgICBpZiAoIChpbnQ2NF90KShub3cgLSBk
LT5hcmNoLnZ0c2NfbGFzdCkgPiAwICkKPj4gLSAgICAgICAgZC0+YXJjaC52dHNjX2xhc3QgPSBu
b3c7Cj4+IC0gICAgZWxzZQo+PiAtICAgICAgICBub3cgPSArK2QtPmFyY2gudnRzY19sYXN0Owo+
PiAtCj4+IC0gICAgc3Bpbl91bmxvY2soJmQtPmFyY2gudnRzY19sb2NrKTsKPj4gKyAgICBkbyB7
Cj4+ICsgICAgICAgIG9sZCA9IGQtPmFyY2gudnRzY19sYXN0Owo+PiArICAgICAgICBuZXcgPSAo
aW50NjRfdCkobm93IC0gZC0+YXJjaC52dHNjX2xhc3QpID4gMCA/IG5vdyA6IG9sZCArIDE7Cj4g
Cj4gV2h5IGRvIHlvdSBuZWVkIHRvIGRvIHRoaXMgc3VidHJhY3Rpb24/IElzbid0IGl0IGVhc2ll
ciB0byBqdXN0IGRvOgo+IAo+IG5ldyA9IG5vdyA+IGQtPmFyY2gudnRzY19sYXN0ID8gbm93IDog
b2xkICsgMTsKPiAKPiBUaGF0IGF2b2lkcyB0aGUgY2FzdCBhbmQgdGhlIHN1YnRyYWN0aW9uLgoK
SSdtIGFmcmFpZCBJIGZlbGwgaW50byB0aGUgc2FtZSB0cmFwIGFzIEphbi4gR2l2ZW4gdGhleSBh
cmUgYm90aCBzaWduZWQgd2lsbApjaGFuZ2UgaW4gdjIuCgo+PiArICAgIH0gd2hpbGUgKCBjbXB4
Y2hnKCZkLT5hcmNoLnZ0c2NfbGFzdCwgb2xkLCBuZXcpICE9IG9sZCApOwo+IAo+IEknbSBub3Qg
c3VyZSBpZiB0aGUgZm9sbG93aW5nIHdvdWxkIGJlIHNsaWdodGx5IGJldHRlciBwZXJmb3JtYW5j
ZQo+IHdpc2U6Cj4gCj4gZG8gewo+ICAgICBvbGQgPSBkLT5hcmNoLnZ0c2NfbGFzdDsKPiAgICAg
aWYgKCBkLT5hcmNoLnZ0c2NfbGFzdCA+PSBub3cgKQo+ICAgICB7Cj4gICAgICAgICBuZXcgPSBh
dG9taWNfaW5jX3JldHVybigmZC0+YXJjaC52dHNjX2xhc3QpOwo+ICAgICAgICAgYnJlYWs7Cj4g
ICAgIH0KPiAgICAgZWxzZQo+ICAgICAgICAgbmV3ID0gbm93Owo+IH0gd2hpbGUgKCBjbXB4Y2hn
KCZkLT5hcmNoLnZ0c2NfbGFzdCwgb2xkLCBuZXcpICE9IG9sZCApOwo+IAo+IEluIGFueSBjYXNl
IEknbSBmaW5lIHdpdGggeW91ciB2ZXJzaW9uIHVzaW5nIGNtcHhjaGcgZXhjbHVzaXZlbHkuCgpU
aGF0IGNvdWxkIGJlIG1hcmdpbmFsbHkgYmV0dGVyIChrbm93aW5nIHRoYXQgYXRvbWljIGluY3Jl
bWVudCB1c3VhbGx5IHBlcmZvcm1zCmJldHRlciB0aGFuIGNtcHhjaGcpIGJ1dCBpdCB0b29rIG1l
IHNvbWUgdGltZSB0byB3b3JrIG91dCB0aGVyZSBpcyBubyBoaWRkZW4KcmFjZSBoZXJlLiBJJ2Qg
cmVxdWVzdCBhIHRoaXJkIG9waW5pb24gb24gdGhlIG1hdHRlciBpZiBpdCdzIHdvcnRoIGNoYW5n
aW5nLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
