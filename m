Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F328217F78F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:39:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBe83-00076f-Gk; Tue, 10 Mar 2020 12:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBe82-00076Z-2y
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:36:58 +0000
X-Inumbo-ID: d4514908-62cb-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4514908-62cb-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 12:36:57 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g19so16077019eds.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 05:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=ReuzulIP7OqEAIetNuSGSOl0HPVwJ6AQwcFqSaKu2hk=;
 b=UeM6dvK88DMNp+A4YaLhdF0ifLbF5757Dmz0SsqQApZkP8x67GhVCynSIQ9TOAIRiF
 zhh+F9G2nF27Y2ZbrZyAO2Rb/D4sfHQCAE+A++ypTpAJ+z4ZJy6pJRe4qBCQJ17HUSdp
 GAfMX/s5j3TaaRVjtNYAPq07zwb6M4QLXThc8hJh/79gcCBBj3yaMIomsbHZAehCu58x
 1iGEQB9KlkTjJWWykcRDr9vtw7J3d5hzU9Pl7hTiRlyGERdXwhvlnZ5+0EqtZ8wz9aXI
 7Im+qRQvJWMeCB9G87ejxAsUQzJ2VWDWKI4DWL4Icgvvy8260BK0vENFx+/ceOLwXIAe
 iXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=ReuzulIP7OqEAIetNuSGSOl0HPVwJ6AQwcFqSaKu2hk=;
 b=cjDH9b9Ofom8B9r2CmTnCWofos8AD6QacdHsAzR0AITlHDjn7zR/OC8Ud6sl2can6U
 6RWBUkGGiqZ5VCEWz+0SQ3kEq9az/oX8WpNJFl8iENOYyx8pq1tIcsvpgjX9gUox5qY8
 bRLCMneALgUe3i9+KGZqwzh574YtJWQVbFNuYGV/MA2tCn6dthMFEXTZ29TMHsornUmk
 3NISLxsOHZtf57ZCSc+YfqtnGp4NJNLIw5t+0Ip/gQ/zY2xRqAmjsOfH8Z21o1RCciwY
 oLWYtHoxw5dMHZEVbAELtf+7wbfNeqi0x3PAdAyuB/DHZvSR2vmJSORwYimfb/m/IauS
 FRKQ==
X-Gm-Message-State: ANhLgQ3oSq6E7I7hi9e9xKYncJAHb1AHDBQah8muTSClsvzQPqE+F05i
 jq9WVMRV5vvl3i66Bg2IGZg=
X-Google-Smtp-Source: ADFU+vsO+WbUb3JXpfKe6zqqYiECY4qPMEYpRyueG8oTwfQYOUElcXCFSFNeyfyG4bdZA8APirIXew==
X-Received: by 2002:a17:906:3449:: with SMTP id
 d9mr19600357ejb.163.1583843816380; 
 Tue, 10 Mar 2020 05:36:56 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id o88sm4125107eda.41.2020.03.10.05.36.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 05:36:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
 <e46984e6-9b86-dfb5-9b2b-7772fb700352@suse.com>
In-Reply-To: <e46984e6-9b86-dfb5-9b2b-7772fb700352@suse.com>
Date: Tue, 10 Mar 2020 12:36:55 -0000
Message-ID: <001001d5f6d8$957be030$c073a090$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIK2yJyYyCu4hvzDwRQ39T9TXjhmgIXPdL9AaPqNSQB+GBh3aeqXe5g
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v4] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Varad Gautam' <vrd@amazon.de>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Julien Grall' <julien@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDExOjIzCj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdWYXJhZCBHYXV0YW0nIDx2
cmRAYW1hem9uLmRlPjsgJ0p1bGllbiBHcmFsbCcgPGp1bGllbkB4ZW4ub3JnPjsKPiAnUm9nZXIg
UGF1IE1vbm7DqScgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgJ0FuZHJldyBDb29wZXInIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjRdIHg4NjogaXJx
OiBEbyBub3QgQlVHX09OIG11bHRpcGxlIHVuYmluZCBjYWxscyBmb3Igc2hhcmVkIHBpcnFzCj4g
Cj4gT24gMDkuMDMuMjAyMCAxODo0NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+ID4+IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMTY6MjkKPiA+Pgo+ID4+IE9uIDA2LjAzLjIw
MjAgMTc6MDIsIHBhdWxAeGVuLm9yZyB3cm90ZToKPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2ly
cS5jCj4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ID4+PiBAQCAtMTY4MCw5ICsxNjgw
LDIzIEBAIHN0YXRpYyBpcnFfZ3Vlc3RfYWN0aW9uX3QgKl9fcGlycV9ndWVzdF91bmJpbmQoCj4g
Pj4+Cj4gPj4+ICAgICAgQlVHX09OKCEoZGVzYy0+c3RhdHVzICYgSVJRX0dVRVNUKSk7Cj4gPj4+
Cj4gPj4+IC0gICAgZm9yICggaSA9IDA7IChpIDwgYWN0aW9uLT5ucl9ndWVzdHMpICYmIChhY3Rp
b24tPmd1ZXN0W2ldICE9IGQpOyBpKysgKQo+ID4+PiAtICAgICAgICBjb250aW51ZTsKPiA+Pj4g
LSAgICBCVUdfT04oaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7Cj4gPj4+ICsgICAgZm9yICggaSA9
IDA7IGkgPCBhY3Rpb24tPm5yX2d1ZXN0czsgaSsrICkKPiA+Pj4gKyAgICAgICAgaWYgKCBhY3Rp
b24tPmd1ZXN0W2ldID09IGQgKQo+ID4+PiArICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICsKPiA+
Pj4gKyAgICBpZiAoIGkgPT0gYWN0aW9uLT5ucl9ndWVzdHMgKSAvKiBObyBtYXRjaGluZyBlbnRy
eSAqLwo+ID4+PiArICAgIHsKPiA+Pj4gKyAgICAgICAgLyoKPiA+Pj4gKyAgICAgICAgICogSW4g
Y2FzZSB0aGUgcGlycSB3YXMgc2hhcmVkLCB1bmJvdW5kIGZvciB0aGlzIGRvbWFpbiBpbiBhbiBl
YXJsaWVyCj4gPj4+ICsgICAgICAgICAqIGNhbGwsIGJ1dCBzdGlsbCBleGlzdGVkIG9uIHRoZSBk
b21haW4ncyBwaXJxX3RyZWUsIHdlIHN0aWxsIHJlYWNoCj4gPj4+ICsgICAgICAgICAqIGhlcmUg
aWYgdGhlcmUgYXJlIGFueSBsYXRlciB1bmJpbmQgY2FsbHMgb24gdGhlIHNhbWUgcGlycS4gUmV0
dXJuCj4gPj4+ICsgICAgICAgICAqIGlmIHN1Y2ggYW4gdW5iaW5kIGhhcHBlbnMuCj4gPj4+ICsg
ICAgICAgICAqLwo+ID4+PiArICAgICAgICBBU1NFUlQoYWN0aW9uLT5zaGFyZWFibGUpOwo+ID4+
PiArICAgICAgICByZXR1cm4gTlVMTDsKPiA+Pj4gKyAgICB9Cj4gPj4+ICsKPiA+Pj4gKyAgICBB
U1NFUlQoYWN0aW9uLT5ucl9ndWVzdHMgPiAwKTsKPiA+Pgo+ID4+IFRoaXMgc2VlbXMgcG9pbnRs
ZXNzIHRvIGhhdmUgaGVyZSAtIHYzIGhhZCBpdCBpbnNpZGUgdGhlIGlmKCksCj4gPj4gd2hlcmUg
aXQgd291bGQgYWN0dWFsbHkgZ3VhcmQgYWdhaW5zdCBjb21pbmcgaGVyZSB3aXRoIG5yX2d1ZXN0
cwo+ID4+IGVxdWFsIHRvIHplcm8uCj4gPgo+ID4gV2h5LiBUaGUgY29kZSBqdXN0IGFmdGVyIHRo
aXMgZGVjcmVtZW50cyBucl9ndWVzdHMgc28gaXQgc2VlbXMKPiA+IGxpa2UgZW50aXJlbHkgdGhl
IHJpZ2h0IHBvaW50IHRvIGhhdmUgdGhlIEFTU0VSVC4gSSBjYW4gbWFrZSBpdAo+ID4gQVNTRVJU
ID49IDAsIGlmIHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4KPiAKPiBUaGVyZSdzIG5vIHdheSB0byBj
b21lIGhlcmUgd2hlbiBucl9ndWVzdHMgPT0gMC4gVGhpcyBpcyBiZWNhdXNlCj4gaW4gdGhpcyBj
YXNlIHRoZSBsb29wIHdpbGwgYmUgZXhpdGVkIHdpdGggaSBiZWluZyB6ZXJvLCBhbmQgaGVuY2UK
PiB0aGUgZWFybGllciBpZigpJ3MgYm9keSB3aWxsIGJlIGVudGVyZWQuCgpPaywgeWVzLCB0aGF0
J3MgdHJ1ZS4KCj4gCj4gKEFuZCBubywgPj0gMCB3b3VsZG4ndCBtYWtlIHNlbnNlIHRvIG1lIC0g
aXQgd291bGQgbWVhbiB3ZSBtaWdodAo+IGhhdmUgYSBjb3VudCBvZiAtMSBhZnRlciB0aGUgZGVj
cmVtZW50LikKPiAKPiA+PiB2MyBhbHNvIHVzZWQgaWYoKSBhbmQgQlVHKCkgaW5zdGVhZCBvZiBB
U1NFUlQoKQo+ID4+IGluc2lkZSB0aGlzIGlmKCksIHdoaWNoIHRvIG1lIHdvdWxkIHNlZW0gbW9y
ZSBpbiBsaW5lIHdpdGggb3VyCj4gPj4gY3VycmVudCAuL0NPRElOR19TVFlMRSBndWlkZWxpbmVz
IG9mIGhhbmRsaW5nIHVuZXhwZWN0ZWQKPiA+PiBjb25kaXRpb25zLiBDb3VsZCB5b3UgY2xhcmlm
eSB3aHkgeW91IHN3aXRjaGVkIHRoaW5ncz8KPiA+Pgo+ID4KPiA+IEJlY2F1c2UgSSBkb24ndCB0
aGluayB0aGVyZSBpcyBuZWVkIHRvIGtpbGwgdGhlIGhvc3QgaW4gYQo+ID4gbm9uLWRlYnVnIGNv
bnRleHQgaWYgd2UgaGl0IHRoaXMgY29uZGl0aW9uOyBpdCBpcyBlbnRpcmVseQo+ID4gc3Vydml2
YWJsZSBhcyBmYXIgYXMgSSBjYW4gdGVsbCBzbyBhIEJVR19PTigpIGRpZCBub3Qgc2VlbQo+ID4g
YXBwcm9wcmlhdGUuCj4gCj4gSXQnbGwgbWVhbiB3ZSBoYXZlIGEgbm9uLXNoYXJhYmxlIElSUSBp
biBhIHBsYWNlIHdoZXJlIHRoaXMgaXMKPiBub3Qgc3VwcG9zZWQgdG8gaGFwcGVuLiBIb3cgY2Fu
IHdlIGJlIHN1cmUgdGhlIHN5c3RlbSBpcyBpbiBhCj4gc3RhdGUgYWxsb3dpbmcgdG8gc2FmZWx5
IGNvbnRpbnVlPyBUbyBtZSwgaWYgc2hhcmVhYmxlIC8gbm9uLQo+IHNoYXJlYWJsZSBpcyBvZiBh
bnkgY29uY2VybiBoZXJlLCB0aGVuIGl0IG91Z2h0IHRvIGJlIEJVRygpLgo+IElmIGl0J3Mgbm90
LCB0aGVuIHRoZSBBU1NFUlQoKSBvdWdodCB0byBiZSBkcm9wcGVkIGFzIHdlbGwuCgpPaywgSSds
bCBjb252ZXJ0IGJhY2sgdG8gYSBCVUcoKS4KCiAgUGF1bAoKPiAKPiBKYW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
