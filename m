Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E6E18C9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 13:22:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNEfE-00050r-5i; Wed, 23 Oct 2019 11:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sGrY=YQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNEfD-00050m-HB
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 11:18:51 +0000
X-Inumbo-ID: e394571e-f586-11e9-beca-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e394571e-f586-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 11:18:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r19so20799737wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 04:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7ozL69O3FIXZSF1DbRi2xEphV/f1y7aGgXY/CD9QrtI=;
 b=Yc6d6uJI/r9eVeHoRPSlOUGi/8Rc5DwPgMWX93fll8Q8WoAxUMI5YRZGnRnbUUZz6w
 DV49L6aI4yquN47BlbNa1apuLpoC4C/+APvk/CTfY7DjFvnfAf0Q0FSRqqVgB9RendWF
 WfbMCeNKyfuYwZKfh7EIaxCxYL5m+LXK2fa31jhg1UdUoehMFZUlXTk0xn1o1Ut21zkD
 SDHgC2PetfWsSSZ1YJ8HhsgXfQm2IXzLFLEtNTXyfWHTHq+BFvzId2Ktnl51TbOh63va
 ReywZOP0S+5zfA4hsEB2bzEN/y3rCtPDkYXxVNCtYfYZS+cZMbJcSbPSugp/wdjxxtFT
 e/ag==
X-Gm-Message-State: APjAAAWewsgIyHHXbQhLOwVyotE5oz8U6HctJQOBYaBS0trjEEnVLdQm
 WtJrGm2afXZdMODCxLmT3o8=
X-Google-Smtp-Source: APXvYqyFTOE3Qyk/181uFUvw2wpvmn6QdKSiWZmd+Du5Jqp+cBjg4KfOreC3q7GDNNRs1wJ2SpR/uQ==
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr5571837wmf.78.1571829530065;
 Wed, 23 Oct 2019 04:18:50 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id p17sm18046349wrn.4.2019.10.23.04.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 04:18:49 -0700 (PDT)
Date: Wed, 23 Oct 2019 12:18:48 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191023111848.nccqcax4jmbrnl3h@debian>
References: <20191023085739.43585-1-roger.pau@citrix.com>
 <20191023105513.5vli2q4khpbf3gdx@debian>
 <20191023110514.GQ17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023110514.GQ17494@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/tsc: update vcpu time info on
 guest TSC adjustments
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDE6MDU6MTRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMTo1NToxM0FNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6NTc6MzlBTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBJZiBhIEhWTS9QVkggZ3Vlc3Qgd3JpdGVzIHRv
IE1TUl9JQTMyX1RTQ3tfQURKVVNUfSBhbmQgdGh1cyBjaGFuZ2VzCj4gPiA+IHRoZSB2YWx1ZSBv
ZiB0aGUgdGltZSBzdGFtcCBjb3VudGVyIHRoZSB2Y3B1IHRpbWUgaW5mbyBtdXN0IGFsc28gYmUK
PiA+ID4gdXBkYXRlZCwgb3IgdGhlIHRpbWUgY2FsY3VsYXRlZCBieSB0aGUgZ3Vlc3QgdXNpbmcg
dGhlIFhlbiBQViBjbG9jawo+ID4gPiBpbnRlcmZhY2Ugd2lsbCBiZSBza2V3ZWQuCj4gPiA+IAo+
ID4gPiBVcGRhdGUgdGhlIHZjcHUgdGltZSBpbmZvIHdoZW4gdGhlIGd1ZXN0IHdyaXRlcyB0byBl
aXRoZXIgTVNSX0lBMzJfVFNDCj4gPiA+IG9yIE1TUl9JQTMyX1RTQ19BREpVU1QuIFRoaXMgZml4
ZXMgbG9ja3VwcyBzZWVuIHdoZW4gcnVubmluZyB0aGUKPiA+ID4gcHYtc2hpbSBvbiBBTUQgaGFy
ZHdhcmUsIHNpbmNlIHRoZSBzaGltIHdpbGwgYWdncmVzc2l2ZWx5IHRyeSB0byBrZWVwCj4gPiA+
IFRTQ3MgaW4gc3luYyBieSBwZXJpb2RpY2FsbHkgd3JpdGluZyB0byBNU1JfSUEzMl9UU0MgaWYg
dGhlIFRTQyBpcyBub3QKPiA+ID4gcmVsaWFibGUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gLS0tCj4gPiA+
IENjOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgeGVu
L2FyY2gveDg2L2h2bS9odm0uYyB8IDQgKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gPiA+IGluZGV4IDlhY2QzNTljOTkuLmU0YzA0
MjUzMzAgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+ID4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4gPiBAQCAtNDQyLDYgKzQ0Miw4IEBAIHN0YXRp
YyB2b2lkIGh2bV9zZXRfZ3Vlc3RfdHNjX21zcihzdHJ1Y3QgdmNwdSAqdiwgdTY0IGd1ZXN0X3Rz
YykKPiA+ID4gIAo+ID4gPiAgICAgIGh2bV9zZXRfZ3Vlc3RfdHNjKHYsIGd1ZXN0X3RzYyk7Cj4g
PiA+ICAgICAgdi0+YXJjaC5odm0ubXNyX3RzY19hZGp1c3QgKz0gdi0+YXJjaC5odm0uY2FjaGVf
dHNjX29mZnNldCAtIHRzY19vZmZzZXQ7Cj4gPiA+ICsgICAgaWYgKCB2ID09IGN1cnJlbnQgKQo+
ID4gPiArICAgICAgICB1cGRhdGVfdmNwdV9zeXN0ZW1fdGltZSh2KTsKPiA+IAo+ID4gV2h5IG5v
dCBnZXQgcmlkIG9mIHRoZSB0ZXN0IGFuZCBhbHdheXMgY2FsbCB1cGRhdGVfdmNwdV9zeXN0ZW1f
dGltZSh2KT8KPiAKPiBJZiB0aGUgdmNwdSBpcyBub3QgcnVubmluZyB0aGUgdXBkYXRlIHdpbGwg
YmUgZG9uZSBieSB0aGUgc2NoZWR1bGluZwo+IGNvZGUgaW4gc2NoZWR1bGVfdGFpbC4gQ2FsbGlu
ZyB1cGRhdGVfdmNwdV9zeXN0ZW1fdGltZSB1bmNvbmRpdGlvbmFsbHkKPiB3b3VsZCB3b3JrLCBJ
IHdhcyBqdXN0IHRyeWluZyB0byBhdm9pZCB0aGUgb3ZlcmhlYWQgaWYgaXQncyBub3QgcmVhbGx5
Cj4gbmVlZGVkLgo+IAoKRmFpciBlbm91Z2guCgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
