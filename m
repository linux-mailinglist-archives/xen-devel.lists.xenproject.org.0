Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A8109131
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 16:46:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZGWX-0001Jw-6L; Mon, 25 Nov 2019 15:43:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8wrE=ZR=gmail.com=2rushikeshj@srs-us1.protection.inumbo.net>)
 id 1iZGWV-0001Jr-Tz
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 15:43:35 +0000
X-Inumbo-ID: 56d5b8a8-0f9a-11ea-b4d1-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56d5b8a8-0f9a-11ea-b4d1-bc764e2007e4;
 Mon, 25 Nov 2019 15:43:35 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a24so13172534edt.0
 for <xen-devel@lists.xen.org>; Mon, 25 Nov 2019 07:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aRh5apT1NxfatCk1mlQkX9u4b3/tjNZQhntusUj/NvM=;
 b=oo2pGLRxHhAwon/EXLMpSg8N1g3vfAR/ELdabRRlU321tR27RSnCgQNnnZUOvwJwuD
 JrTdDuCyPUeihPYZUjjwP04fahjwTaFI7dNr6cSUJjkk41BQ/mHvj/05uzRzBTnXDozF
 vr8L2q5P+FKwMn7g7HroLhk0ZUJEMtwlF8bCgfkGHvXNGeY5rPUDuVZX/8WtwoWA8LhT
 5cFtlcC/aSA+TqG/+/YcqwP+uCHaAHy0vCSsPiVM+Veq1aqNmaw3Z/ehxzQQOTA2ASYP
 tnxnQckWwlraagIA5UstjLj5aApCJC7ccS0JY9bl3WaMLOli1hxoCceEdspq6N2GWdpb
 sbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aRh5apT1NxfatCk1mlQkX9u4b3/tjNZQhntusUj/NvM=;
 b=No50RbmhL3Ep0YwOw/EC6hFJ23ipXcDdoCHh0OCyqywUI3ohEkAZwKWyUiXPdY50Gt
 0Zw04i9NNaYlnTinS97TnVRCjdpMzLnPFbJVkdSfQqFeWNS3QxEYWvwEyP5SNigprCXN
 OWbDl33/mlW0Aq8CNYiEq436PlM4cXmhJxLauj+Eecilv2nEzRS/dUfOiXOYgq5JJ5wE
 uCi1y8UFDFPhdusKi3taVn2U7AHTsTYlIy66vj4BCG0cZEuWMMn+pe1P4bru+IOC760g
 gay7uenbwODTZi/dBuqzBhbj9RZsUi/5x/eKHcsuJzIU6CvcuyIc+YXdjrEIfWNQenh1
 bIjg==
X-Gm-Message-State: APjAAAUIz5A/XXIIz5sw3338iKp63+VTu728WNIRtn3vigEPDO8fRbXT
 HQFvry7ZSsZIbnBtd2aH+uAUJ/dYsw1xDZIFQRw=
X-Google-Smtp-Source: APXvYqwJYrDcC58aeCxvw6S+hAWB2IWErMovV02p5uY+Ax6ANJ81W7cnQMOwb/P48b1MtNfolyKGgUuLtVGz689SCW4=
X-Received: by 2002:a05:6402:1296:: with SMTP id
 w22mr14221069edv.65.1574696614060; 
 Mon, 25 Nov 2019 07:43:34 -0800 (PST)
MIME-Version: 1.0
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
 <005596b6-9228-801b-300a-57807a96d051@suse.com>
 <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
 <20191123042906.GA79247@mattapan.m5p.com>
 <bd02527e-9a8e-3a66-bdd6-13d200dacb3b@suse.com>
In-Reply-To: <bd02527e-9a8e-3a66-bdd6-13d200dacb3b@suse.com>
From: Rishi <2rushikeshj@gmail.com>
Date: Mon, 25 Nov 2019 21:13:22 +0530
Message-ID: <CAO9XypXvpA3306ULTNaYG_-VoBnyf_Noackp9bv_PkoRygDYXg@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Jan Beulich <jbeulich@suse.com>, Elliott Mitchell <ehem+xen@m5p.com>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTo1NSBQTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjMuMTEuMTkgMDU6MjksIEVsbGlvdHQgTWl0Y2hlbGwgd3Jv
dGU6Cj4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwNDo0NjoyMVBNICswMTAwLCBKPz9yZ2Vu
IEdybz8/IHdyb3RlOgo+ID4+IE9uIDIxLjExLjE5IDE2OjM2LCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+Pj4gT24gMjEuMTEuMjAxOSAxNToyNCwgSj8/cmdlbiBHcm8/PyB3cm90ZToKPiA+Pj4+IFNv
OiBubywganVzdCBnaXZpbmcgZG9tMCBhY2Nlc3MgdG8gdGhlIG1hbmFnZW1lbnQgaGFyZHdhcmUg
aXNuJ3QgZ29pbmcKPiA+Pj4+IHRvIGZseS4gWW91IG5lZWQgdG8gaGF2ZSBhIHByb3BlciB2aXJ0
dWFsaXphdGlvbiBsYXllciBmb3IgdGhhdCBwdXJwb3NlLgo+ID4+Pgo+ID4+PiBPciwgbGlrZSBJ
IGhhZCBkb25lIGluIG91ciBYZW5vTGludXggZm9yd2FyZCBwb3J0LCB5b3UgbmVlZCB0bwo+ID4+
PiBnbyB0aHJvdWdoIGhvb3BzIHRvIG1ha2UgdGhlIGNvcmV0ZW1wIGRyaXZlciBhY3R1YWxseSB1
bmRlcnN0YW5kCj4gPj4+IHRoZSBlbnZpcm9ubWVudCBpdCdzIHJ1bm5pbmcgaW4uCj4gPj4KPiA+
PiBUaGlzIHdpbGwgc3RpbGwgbm90IGd1YXJhbnRlZSB5b3UnbGwgYmUgYWJsZSB0byByZWFjaCBh
bGwgcGh5c2ljYWwKPiA+PiBjcHVzLiBJSVJDIHlvdSBwaW5uZWQgdGhlIHZjcHUgdG8gdGhlIHJl
c3BlY3RpdmUgcGh5c2ljYWwgY3B1IGZvcgo+ID4+IHBlcmZvcm1pbmcgaXRzIGR1dHksIGJ1dCB3
aXRoIGNwdXBvb2xzIHRoaXMgbWlnaHQgbm90IGJlIHBvc3NpYmxlIGZvcgo+ID4+IGFsbCBwaHlz
aWNhbCBjcHVzIGluIHRoZSBzeXN0ZW0uCj4gPgo+ID4gU2ltaWxhciB0byB0aGUgaXNzdWUgb2Yg
TUNFIHN1cHBvcnQsIG1pZ2h0IGl0IGluc3RlYWQgYmUgYmV0dGVyIHRvIGhhdmUKPiA+ICpsZXNz
KiB2aXJ0dWFsaXphdGlvbiBoZXJlIGluc3RlYWQgb2YgbW9yZT8gIFRoZSBvcmlnaW5hbCBpZGVh
IGJlaGluZCBYZW4KPiA+IHdhcyB0byBsZWF2ZSB0aGUgaGFyZCB0byB2aXJ0dWFsaXplIGJpdHMg
dmlzaWJsZSBhbmQgd29yayB3aXRoIERvbWFpbiAwLgo+ID4KPiA+IE1pZ2h0IGl0IGJlIGJldHRl
ciB0byBleHBvc2UgdGhpcyBmdW5jdGlvbmFsaXR5IHRvIERvbWFpbiAwLCB0aGVuCj4gPiBpbnRl
cmNlcHQgdGhlIGtlcm5lbCBjYWxscz8gIEp1c3QgbmVlZHMgMSB2Y3B1IHdoaWNoIGNhbiBiZSBz
Y2hlZHVsZWQgb24KPiA+IGFueSBwcm9jZXNzb3IgYW5kIHRoYXQgY2FuIGJlIG1vdmVkIGFyb3Vu
ZCB0byByZXRyaWV2ZSB0aGUgZGF0YS4gIFRoaXMKPiA+IHdheSBYZW4gd291bGRuJ3QgbmVlZCBh
IHByb3BlciBkcml2ZXIgZm9yIHRoZSBtYW5hZ2VtZW50IGhhcmR3YXJlLgo+Cj4gSW4gY2FzZSBk
b20wIGlzIHRvIGhhbmRsZSB0aGlzIHRoZW4gaXQgd291bGQgYmUgbXVjaCBlYXNpZXIgdG8gaGF2
ZSBhCj4gd2F5IGZvciBkb20wIHRvIHNwZWNpZnkgd2hpY2ggcGh5c2ljYWwgY3B1IHRoZSBkYXRh
IHNob3VsZCBiZSByZXRyaWV2ZWQKPiBmcm9tLiBGb3JjaW5nIGEgZG9tMCB2Y3B1IHRvIHJ1biBv
biBhIHNwZWNpZmljIHBoeXNpY2FsIGNwdSB3b3VsZCBuZWVkCj4gYSBtYWpvciByZXdvcmsgb2Yg
dGhlIFhlbiBzY2hlZHVsaW5nIChlc3BlY2lhbGx5IHJlZ2FyZGluZyBjcHVwb29scywgbGV0Cj4g
YWxvbmUgY29yZSBzY2hlZHVsaW5nKS4KPgo+Cj4gSnVlcmdlbgoKV2hpbGUgbW9kaWZ5aW5nIGNv
cmV0ZW1wIGRyaXZlciwgZm9sbG93aW5nIENQVSBmbGFncyBjYW1lIGFjcm9zcwpYODZfRkVBVFVS
RV9EVEhFUk0KWDg2X0ZFQVRVUkVfUFRTCgpOZWVkIHRvIHJlcGxhY2UvZ2V0IHRoZXNlIHZpYSBY
ZW4gaHlwZXJjYWxsLiBUaGlzIG9ubHkgZGV0ZWN0cyBpZgpEVEhFUk0gYW5kIFBUUyBzdXBwb3J0
IGlzIHByZXNlbnQuIEN1cnJlbnRseSBieXBhc3NpbmcgdGhlbSBpbiBjb2RlCmFuZCB3aWxsIHdh
aXQgZm9yIGEgcHJvcGVyIEVBWCBleHBvc3VyZS4KCk5leHQgaXMgdGhlIE1TUiByZWFkIGZvciBh
Y3R1YWwgdGVtcGVyYXR1cmUgdmFsdWVzLiBDdXJyZW50bHkKcmRtc3Jfc2FmZV9vbl9jcHUgaXMg
YmVpbmcgdXNlZCwgZG9lcyBpdCBhbHJlYWR5IGdldCBjb252ZXJ0ZWQgdG8gYQpIeXBlcmNhbGwg
dG8gYmUgYWJsZSB0byBkZXRlY3QgdmFsdWVzPwpXaGlsZSB0cmFjaW5nIHRoZSBmdW5jdGlvbiBj
YWxscyBmcm9tIGNvZGUsIHJkbXNyX3NhZmVfb25fY3B1KCkgLT4KcmRtc3Jfc2FmZSgpIC0+IG5h
dGl2ZV9yZWFkX21zcl9zYWZlKCkgLT4gYXNtIHZvbGF0aWxlKCkgY29tZXMgdXAuCkkgY2FuIHNl
ZSB4ZW5fcmVhZF9tc3Jfc2FmZSgpIGJ1dCBub3Qgc3VyZSBpZiB0aGlzIG9yIGl0cyBhbnkgb3Ro
ZXIKdmFyaWFudCBjYW4gYmUgY2FsbGVkLgoKSSBoYXZlbid0IGdvbmUgaW50byBkZXB0aCBvZiB0
aGlzIGFuZCB3b3VsZCBhcHByZWNpYXRlIHBvaW50ZXJzIHRvCnVuZGVyc3RhbmQgbW9yZS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
