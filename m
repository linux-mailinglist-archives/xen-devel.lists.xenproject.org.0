Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE87C9EB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 19:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hss2Y-0005Cp-Rr; Wed, 31 Jul 2019 17:05:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7/lg=V4=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hss2X-0005Ck-E5
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 17:05:25 +0000
X-Inumbo-ID: 6258c004-b3b5-11e9-8980-bc764e045a96
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6258c004-b3b5-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 17:05:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so61585269wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GGQXo9zviPu6d8LkBatn9yDxXxq0kt0UaMmzic3iB6U=;
 b=B3kQy/feOaXBucjGlQtwmMsqdSGOsbmFVCG5E0NrEjj2iEHH2PhwNX+fngtAeHeVpj
 bLdDAMAnDibBMo5pg6YFpkHDcMfadO10LgCFQiXZhVTuVRFYTszqX5U0SfetTyBUnog2
 IOSiHZgTu2Gx/2Y/7YCBXCqUztLyLDxN59aw53OIaRBQVt4LYTfnXzSF5aqh715fqpkc
 fvIw+n3kZEN7yIV3pYhAW/SM/0dViVuHN9YdCCemRo843HNSNeYXWXehik5vc/5JjvoA
 XNVAJx5+jLCJSlHUESh8xT6gT4Dz+YOKSVSoPxS+lRGC5t568+QY11v0AUPVbTUdEEiX
 FGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GGQXo9zviPu6d8LkBatn9yDxXxq0kt0UaMmzic3iB6U=;
 b=qEmA7XZG6qZmoV/MWJ2fKRxqmKWcRXeOOxRNSRoQY2h4OI1anHqhY/mlvzXpPZC3mI
 19pir59Oe9J/veQ+LWye/R918fMeLH+hujUgWUeS4ssFLaBzdfjZbOt6rDh7KIBy6TrQ
 J7tuiHhhiQt0iuNdgMTYTJ8RssblEP1iT5eYdlkX2FoQSeNzofqy4Pm1jg/rEYhb+2oP
 Kp9RejNGoA5KqHvs1+B8F4Tf7SS+FXWnazUwC3Q8eAXEYFBq6lrsMPBnbV4HwNBAmDOu
 XrK5cceZtXAEGRiAbkYRWxltbjgNWp/uBZ+m2MUhbdjRCKHRLluMAHiQxXpJuarqwVK0
 8qdQ==
X-Gm-Message-State: APjAAAWZg29bL10rMyAFPhw8UXW3ePTPibgP0kfmns23IUWBvtsGBKgU
 Pwd0tLBBW0PgSIIYQUtSC/I=
X-Google-Smtp-Source: APXvYqw6MlZpoOPN/ZmBDKXyLOrqgBelYyrbWPIS8zqhw31qXzpUGT+WWLVYpM+pqVDrPsaB5xLslA==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr103548917wmk.147.1564592722051; 
 Wed, 31 Jul 2019 10:05:22 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:10bb:ca7d:8e54:3e74?
 ([2a02:c7f:ac18:da00:10bb:ca7d:8e54:3e74])
 by smtp.gmail.com with ESMTPSA id n3sm60199967wrt.31.2019.07.31.10.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 10:05:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <CAOcoXZY5Kwtuy9nLxaxw5FLd0jSmjuvZfNc3SYyuKVP7HtG2tg@mail.gmail.com>
Date: Wed, 31 Jul 2019 18:05:20 +0100
Message-Id: <FA7398EE-7206-40B7-9AAD-D0D6155C5DE4@gmail.com>
References: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
 <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
 <CAOcoXZY5Kwtuy9nLxaxw5FLd0jSmjuvZfNc3SYyuKVP7HtG2tg@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDMxIEp1bCAyMDE5LCBhdCAxNzo1NCwgVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4u
MTlAZ21haWwuY29tPiB3cm90ZToKPiAKPiBIaSBBbGwsCj4gCj4gT24gV2VkLCBKdWwgMzEsIDIw
MTkgYXQgNzo0NSBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cm90ZToKPj4gCj4+IE9uIDMxLzA3LzIwMTkgMTc6MjQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3Rl
Ogo+Pj4gVGhlcmUgYXJlIGNvZGluZyBzdHlsZSBydWxlcyB0aGF0IGFyZSB3aWRlbHkgYWNjZXB0
ZWQgYnkgY29tbXVuaXR5LAo+Pj4gYnV0IG5ld2VyIHdlcmUgZm9ybWFsaXplZCBpbiB0aGUgZG9j
dW1lbnQuIE5vdGFibGUgZXhhbXBsZSBpcyB0aGUKPj4+IHF1ZXN0aW9uIG9uIGhvdyBmdW5jdGlv
biBhcmd1bWVudHMgYW5kIHBhcmFtZXRlcnMgc2hvdWxkIGJlIGluZGVudGVkCj4+PiB3aGVuIHRo
ZXkgZG8gbm90IGZpdCBpbnRvIG9uZSBsaW5lLgo+Pj4gCj4+PiBUaGlzIHF1ZXN0aW9uIHdhcyBy
YWlzZWQgbXVsdGlwbGUgdGltZXMgbGF0ZWx5LCBtb3N0bHkgYmVjYXVzZSBvZgo+Pj4gb25nb2lu
ZyBlZmZvcnRzIHRvIGNyZWF0ZSBYZW4gY29kaW5nIHN0eWxlIGZvcm1hdHRpbmcgdG9vbCBhbmQg
YmVjYXVzZQo+Pj4gb2YgbmV3IGNvbW11bml0eSBtZW1iZXJzLCB3aG8gYXJlIG5vdCBhd2FyZSBv
ZiBzdWNoIHVud3JpdHRlbiBydWxlcy4KPj4+IAo+Pj4gQWN0dWFsbHksIHRoaXMgcnVsZSBpcyBh
bHJlYWR5IGltcGxpY2l0bHkgZGVmaW5lZCBpbiB0aGUgZG9jdW1lbnQgYnkKPj4+IGRlZmluaW5n
IGVtYWNzIGNvZGluZyBzdHlsZTogJ2MtZmlsZS1zdHlsZTogIkJTRCInLiBJbiB0aGlzIG1vZGUg
ZW1hY3MKPj4+IGxpbmVzIHVwIGZ1bmN0aW9uIGFyZ3VtZW50cyB1bmRlciB0aGUgZmlyc3QgYXJn
dW1lbnQuIE5hdHVyYWxseSwgbW9zdAo+Pj4gb2YgWGVuIGNvZGUgaXMgd3JpdHRlbiBpbiB0aGlz
IHN0eWxlLgo+Pj4gCj4+PiBTbywgbGV0cyBzdGF0ZSB0aGUgb2J2aW91cyBhbmQgZml4IHRoaXMg
cnVsZSBleHBsaWNpdGx5Lgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1
ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4+PiAtLS0KPj4+IENPRElOR19TVFlMRSB8
IDE0ICsrKysrKysrKysrKysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+
Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvQ09ESU5HX1NUWUxFIGIvQ09ESU5HX1NUWUxFCj4+PiBpbmRl
eCA2Y2M1Yjc3NGNmLi42NDc5MjE1YTE1IDEwMDY0NAo+Pj4gLS0tIGEvQ09ESU5HX1NUWUxFCj4+
PiArKysgYi9DT0RJTkdfU1RZTEUKPj4+IEBAIC01Myw2ICs1MywyMCBAQCBMaW5lIExlbmd0aAo+
Pj4gTGluZXMgc2hvdWxkIGJlIGxlc3MgdGhhbiA4MCBjaGFyYWN0ZXJzIGluIGxlbmd0aC4gIExv
bmcgbGluZXMgc2hvdWxkCj4+PiBiZSBzcGxpdCBhdCBzZW5zaWJsZSBwbGFjZXMgYW5kIHRoZSB0
cmFpbGluZyBwb3J0aW9ucyBpbmRlbnRlZC4KPj4+IAo+Pj4gK0ZvciBtdWx0aWxpbmUgZnVuY3Rp
b24gZGVjbGFyYXRpb24gYW5kIGNhbGwgZWFjaCBuZXcgbGluZSBzaG91bGQgYmUKPj4+ICthbGln
bmVkIHdpdGggdGhlIGZpcnN0IHRoZSBwYXJhbWV0ZXIgb3IgYXJndW1lbnQuIGUuZy46Cj4+PiAr
Cj4+PiArdm9pZCBteV9mdW5jdGlvbl93aXRoX2xvbmdfbmFtZShzdHJ1Y3QgbGVuZ3RoeV9zdHJ1
Y3RfbmFtZSAqc3RydWN0MSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lICpzdHJ1Y3QyLAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUgKnN0cnVjdDMpOwo+Pj4g
Kwo+Pj4gK29yCj4+PiArCj4+PiArZnVuY3Rpb25fd2l0aF9zb19tYW55X3BhcmFtcyh3b3JkeV9w
YXJhbWV0ZXIxLCB3b3JkeV9wYXJhbWV0ZXIyLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgd29yZHlfcGFyYW1ldGVyMywgd29yZHlfcGFyYW1ldGVyNCk7Cj4+PiArCj4+PiArVGhl
IHNhbWUgYXBwbGllcyBmb3IgbWFjcm9zLgo+PiAKPj4gRm9yIHZlcnkgd29yZHkgZnVuY3Rpb25z
LCBvciBvbmVzIHdpdGggc2lsbHkgcXVhbnRpdGllcyBvZiBwYXJhbWV0ZXJzLAo+PiB0aGUgZm9s
bG93aW5nIGlzIGFsc28gYWNjZXB0YWJsZQo+PiAKPj4gdm9pZCBteV9mdW5jdGlvbl93aXRoX2xv
bmdfYW5kX3NpbGx5X25hbWUoCj4+ICAgIHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lICpzdHJ1
Y3QxLCB1bnNpZ25lZCBpbnQgd29tYmxlLCB1bnNpZ25lZAo+PiBpbnQgd2hhdHNpdCwKPj4gICAg
c3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUgKnN0cnVjdDIsIGJvb2wgeWVzLCBib29sIG5vLCBi
b29sIG1heWJlLAo+PiAgICBib29sIGZpbGVfbm90X2ZvdW5kLCBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1
Y3RfbmFtZSAqc3RydWN0Mywgc3RydWN0Cj4+IGxlbmd0aHlfc3RydWN0X25hbWUgKnN0cnVjdDQp
Owo+PiAKPj4gd2hpY2ggeW91IHdpbGwgZmluZCBpbiBhIGZldyBwbGFjZXMgdGhyb3VnaG91dCB0
aGUgY29kZSwgYmVjYXVzZSB0aGUKPj4gYWJvdmUgZG9lc24ndCB3YXN0ZSBlbm91Z2ggdmVydGlj
YWwgc3BhY2UgdG8gZml0IHNldmVyYWwgZnVuY3Rpb25zIGluLAo+PiBhbmQgcHVzaCBhbGwgdGhl
IHJlbGV2YW50IGRldGFpbHMgdG8gdGhlIFJIUy4KPj4gCj4+IFBlciB0aGUgYWJvdmUgcnVsZXMs
IHRoZSByZXN1bHQgd291bGQgYmUgdGhpczoKPj4gCj4+IHZvaWQgbXlfZnVuY3Rpb25fd2l0aF9s
b25nX2FuZF9zaWxseV9uYW1lKHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lCj4+ICpzdHJ1Y3Qx
LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCB3b21ibGUsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IHdoYXRzaXQsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUKPj4gKnN0cnVjdDIsCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB5ZXMsIGJvb2wgbm8sIGJvb2wg
bWF5YmUsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBm
aWxlX25vdF9mb3VuZCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZQo+PiAqc3RydWN0MywKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZQo+
PiAqc3RydWN0NCk7Cj4+IAo+PiBPZiBjb3Vyc2UsIHRoaXMgaXMgYWxzbyBhIHNpZ24gdGhhdCBt
YXliZSB0aGUgZnVuY3Rpb24gc2lnbmF0dXJlIHdhbnRzCj4+IGNoYW5naW5nIGFueXdheSwgYnV0
IHRoYXQgbWF5IG5vdCBiZSBwb3NzaWJsZS9zZW5zaWJsZSBhdCB0aGUgdGltZS4KPj4gCj4+IEFz
IHdpdGggZXZlcnl0aGluZywgdGhlIGNvZGluZyBzdHlsZSBpcyBhIHNldCBvZiBndWlkZWxpbmVz
IHdoaWNoIGFyZQo+PiBhcHBsaWNhYmxlIHRvIDk4JSBvZiBjYXNlcywgYnV0IHRoZXJlIGFyZSBj
YXNlcyB3aGVyZSBhcmVuJ3QKPj4gYXBwcm9wcmlhdGUsIGFuZCBjb21tb24gc2Vuc2UgaXMgdGhl
IG9ubHkgcmVhc29uYWJsZSBkZWNpZGluZyBmYWN0b3IuCj4gCj4gSXQgbWlnaHQgYmUgaGFyZCB0
byBhdXRvbWF0ZSAnY29tbW9uIHNlbnNlJyBjYXNlcy4gSXQgc2VlbXMgaXQgd291bGQKPiBiZSBl
YXNpZXIgdG8gZmluZCBhIHNvbHV0aW9uIG9uIGhvdyB0byBhdm9pZCBzdWNoICdjb21tb24gc2Vu
c2UnCj4gY2FzZXMuCj4gCj4gT25lIG1vcmUgb3BlbiBwb2ludCB3aXRoIHRoaXMgcnVsZSBpcyBo
b3cgdG8gZm9ybWF0IHRoZSBuZXh0IGNhc2Ugd2hlcmU6Cj4gbGVuKHJldHVybiB0eXBlIHN0cmlu
ZykrbGVuKGZ1bmN0aW9uIG5hbWUpK2xlbihhbnkgb2YgcGFyYW1ldGVyKSA+IDc5Cj4gCj4gRm9y
IGV4YW1wbGU6Cj4gK3NvbWVfbG9uZ19yZXR1cm5fdHlwZSAgbXlfZnVuY3Rpb25fd2l0aF9sb25n
X25hbWUoc3RydWN0Cj4gbGVuZ3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0MSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0
MiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1
Y3RfbmFtZSAqc3RydWN0Myk7Cj4gCj4gVGhhbmtzCgpVbHRpbWF0ZWx5IHdlIGhhdmUgdG8gbWFr
ZSBzb21lIHRyYWRlLW9mZnMgYXMgdG8gd2hhdCBpcyBtb3JlIGltcG9ydGFudDoKYSkgYXV0b21h
dGljIHN0eWxlIGNoZWNraW5nIC0gd2hpY2ggbWVhbnMgImNvbW1vbiBzZW5zZSIgY2FuJ3QgYmUg
Zm9ybWFsaXNlZCBhbmQgdGhlcmUgd2lsbCBiZSBib3VuZGFyeSBjYXNlcyBsaWtlIHRoZSBhYm92
ZQpiKSByZWNsYWltaW5nIGNvZGUgcmV2aWV3IGJhbmR3aWR0aCB0aHJvdWdoIGF1dG9tYXRpb24g
b3IgZ29pbmcgZm9yIGEgbGFib3VyIGludGVuc2l2ZSBtYW51YWwgYXBwcm9hY2gKCkkgc3VnZ2Vz
dCB3ZSBkaXNjdXNzIGluIHRvbW9ycm93J3MgY29tbXVuaXR5IGNhbGwgaG93IHRvIGFwcHJvYWNo
IHRoaXMuCkkgdGhpbmsgdGhlIG1vc3QgaW1wb3J0YW50IGZpcnN0IHN0ZXAgaXMgdG8gaGF2ZSBh
IGdvb2QgdmlldyBvbiB0aGUga2luZCBvZiBib3VuZGFyeSBjYXNlcyB0aGF0IHdlIG1heSBmYWNl
CgpMYXJzIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
