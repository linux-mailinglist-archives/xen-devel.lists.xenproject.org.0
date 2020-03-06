Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744017BF81
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:47:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADHu-0005nJ-5v; Fri, 06 Mar 2020 13:45:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jADHt-0005nD-51
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:45:13 +0000
X-Inumbo-ID: b39d6912-5fb0-11ea-8eb5-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b39d6912-5fb0-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 13:45:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m25so2554860edq.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=YjzgRoKww5KbzL81rDA3eQCwkoHbPjjqs88hXoOwbpE=;
 b=IZbrDFGVlv6j1iyufy41HB597k+ok85auwmz+SeJnCkRakUfZo4iUnqdxVVjSKrDXj
 MdDRvvkOH9lg2nhrCP1DT5K7gKefqX+kbfAYxD4bssnZCCSJcQ5ruQkyWXAWGdrvUU/C
 39fIWq6yqPJ50v8MsOf9cbxQUMzlTHbekIpENtmIt1AnID51x1zwa4jifA4Au9HX6YAH
 bt8hyY4tq7lH8toXO/17sLDewKO7pjQf39QqIBdjgDsIVWIN3y3RgYICzZ3EwyBH0+VI
 4tQpiE4M1SEiFqsni/+YbJMrBFV4nudrRmCCZuo+0lgLrehkSb9YYDM/UOiDnSE5soI+
 IL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=YjzgRoKww5KbzL81rDA3eQCwkoHbPjjqs88hXoOwbpE=;
 b=csVcZnSthPIj3B7sJH6qfVH0LSQuE9dXBqMlgTrp5CvREMwk4l50u7FCCXPG40aQBE
 yGs7DpLyb6C6nY3wG0IeKShgl4Eg5SnQse+7ldEzrUjmELP3Wk98jejenkzz0wML/8kO
 aHRzXwpuNy+I5ruwgbd0utpgwN9U4Je1WuZY9FTsT3SZh2WAHxDpMJTAoRw1BHVJoor1
 ze9xbCi4xbqJIYgYo9HZiekpmEezKYvt15h1O1z/buq0ydFjd1yJ87nYZuv1N1SD3qxt
 2PvJ5pQI/lNLtZUXiw8VQTu3fBaIV6cYOqi9/D6o6Gr1DhNea0LWlMcyumhEjBzFbWje
 3xXA==
X-Gm-Message-State: ANhLgQ3+hvktmw6l6vSzga4D7AKWF/+OPeIUv1DEBGtfTRzJw0MVJkxb
 Cp3vg+OX1IA/8m5T/+drpeU=
X-Google-Smtp-Source: ADFU+vu+jhCUKtM5q15H497Q6CkG1jh6Irzjx+KqZtH/ttDigQRsX1SMsAfOU1rruzMmJDbJ7TpFfw==
X-Received: by 2002:aa7:c44d:: with SMTP id n13mr3248824edr.271.1583502311633; 
 Fri, 06 Mar 2020 05:45:11 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id q20sm404967ejx.5.2020.03.06.05.45.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:45:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Durrant, Paul'" <pdurrant@amazon.co.uk>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-4-pdurrant@amzn.com>
 <7d66a1b0-ca7b-500b-73c4-140ab32f0c4e@suse.com>
 <d49c47b701af4198bdb113dfe11ee08f@EX13D32EUC003.ant.amazon.com>
 <008c1b23-e347-2306-4ca7-e9b84aeabec6@suse.com>
In-Reply-To: <008c1b23-e347-2306-4ca7-e9b84aeabec6@suse.com>
Date: Fri, 6 Mar 2020 13:45:10 -0000
Message-ID: <001101d5f3bd$74b2c8a0$5e1859e0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEyOvZuCAMEJD7nL/4EVPUXX19E4gIr7iFoAd1705gCKV0dEQI1KNI0qT/EnOA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM when constructing dom0
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>, pdurrant@amzn.com,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaAo+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MzkKPiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRA
YW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PjsKPiBwZHVycmFudEBhbXpuLmNvbTsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyAzLzZdIHg4NiAvIHB2
OiBkbyBub3QgdHJlYXQgUEdDX2V4dHJhIHBhZ2VzIGFzIFJBTSB3aGVuCj4gY29uc3RydWN0aW5n
IGRvbTAKPiAKPiBPbiAwNi4wMy4yMDIwIDEzOjAzLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2
ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNo
Cj4gPj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMTo1Ngo+ID4+IFRvOiBwZHVycmFudEBhbXpuLmNv
bQo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jby51az47IFJvZ2VyIFBhdSBNb25uw6kKPiA+PiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENI
IHYzIDMvNl0geDg2IC8gcHY6IGRvIG5vdCB0cmVhdCBQR0NfZXh0cmEgcGFnZXMgYXMgUkFNIHdo
ZW4KPiA+PiBjb25zdHJ1Y3RpbmcgZG9tMAo+ID4+Cj4gPj4gT24gMDUuMDMuMjAyMCAxMzo0NSwg
cGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9kb20w
X2J1aWxkLmMKPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwo+ID4+PiBA
QCAtNzkyLDYgKzc5MiwxMCBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0X3B2KHN0cnVjdCBk
b21haW4gKmQsCj4gPj4+ICAgICAgewo+ID4+PiAgICAgICAgICBtZm4gPSBtZm5feChwYWdlX3Rv
X21mbihwYWdlKSk7Cj4gPj4+ICAgICAgICAgIEJVR19PTihTSEFSRURfTTJQKGdldF9ncGZuX2Zy
b21fbWZuKG1mbikpKTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICBpZiAoIHBhZ2UtPmNvdW50X2lu
Zm8gJiBQR0NfZXh0cmEgKQo+ID4+PiArICAgICAgICAgICAgY29udGludWU7Cj4gPj4KPiA+PiBU
aGlzIHN1cmVseSBpcyBhIHBhdHRlcm4sIGkuZS4gdGhlcmUgYXJlIG1vcmUgc2ltaWxhciBjaGFu
Z2VzIHRvCj4gPj4gbWFrZTogdGJvb3RfZ2VuX2RvbWFpbl9pbnRlZ3JpdHkoKSBlLmcuIGlnbm9y
ZXMgZC0+eGVucGFnZV9saXN0LAo+ID4+IGFuZCBoZW5jZSB3aXRoIHRoZSBnb2FsIG9mIGNvbnZl
cnRpbmcgdGhlIHNoYXJlZCBpbmZvIHBhZ2Ugd291bGQKPiA+PiBhbHNvIHdhbnQgYWRqdXN0bWVu
dC4gRm9yIGR1bXBfbnVtYSgpIGl0IG1heSBiZSBsZXNzIGltcG9ydGFudCwKPiA+PiBidXQgaXQg
d291bGQgc3RpbGwgbG9vayBtb3JlIGNvcnJlY3QgaWYgaXQgdG9vIGdvdCBjaGFuZ2VkLgo+ID4+
IGF1ZGl0X3AybSgpIG1pZ2h0IGFwcGFyZW50bHkgY29tcGxhaW4gYWJvdXQgc3VjaCBwYWdlcyAo
YW5kCj4gPj4gaGVuY2UgbWlnaHQgYmUgYSBwcm9ibGVtIHdpdGggdGhlIG9uZSBQR0NfZXh0cmEg
cGFnZSBWTVggZG9tYWlucwo+ID4+IG5vdyBoYXZlKS4gQW5kIHRoaXMgaXMgb25seSBmcm9tIG1l
IGxvb2tpbmcgYXQKPiA+PiBwYWdlX2xpc3RfZm9yX2VhY2goLi4uLCAmZC0+cGFnZV9saXN0KSBj
b25zdHJ1Y3RzOyB3aG8ga25vd3MKPiA+PiB3aGF0IGVsc2UgdGhlcmUgaXMuCj4gPj4KPiA+Cj4g
PiBUaG9zZSBhcmUgZGVhbHQgd2l0aCBieSB0aGUgaXNfc3BlY2lhbF9wYWdlKCkgcGF0Y2ggbGF0
ZXIgb24gSSB0aGluay4KPiAKPiBIYXZpbmcgYWxyZWFkeSBsb29rZWQgYXQgdGhhdCBwYXRjaCBh
cyB3ZWxsIC0gSSBkb24ndCB0aGluayBzbywgbm8uCj4gVGhhdCBvbmUgb25seSByZXBsYWNlcyB1
c2VzIG9mIGlzX3hlbl9oZWFwX3BhZ2UoKSwgYnV0IGRvZXNuJ3QgYWRkCj4gYW55IGNoZWNrcyB3
aGVyZSBzdWNoIHVzZXMgc2ltcGx5IGFyZW4ndCBuZWVkZWQgYmVjYXVzZSBjb2RlIGlzCj4gbG9v
a2luZyBhdCAtPnBhZ2VfbGlzdCBvbmx5LgoKV2VsbCwgSSBkaWQgc2F5OgoKIkl0IGRpZG4ndCBz
ZWVtIGFwcHJvcHJpYXRlIHRvIHVzZSB0aGF0IG1hY3JvIGhlcmUgdGhvdWdoIHNpbmNlIHdlIGtu
b3cgcGFnZXMgb24gdGhlIHBhZ2UgbGlzdCBjYW5ub3QgYmUgeGVuaGVhcCBwYWdlcy4iCgppLmUu
IGFuIG9wZW4gY29kZWQgY2hlY2sgaGVyZSBzZWVtcyBsaWtlIHRoZSByaWdodCB0aGluZyB0byBk
by4gSWYgSSd2ZSBtaXNzZWQgb3RoZXIgcGxhY2VzIHdoZXJlIEkgbmVlZCB0byBhY2NvdW50IGZv
ciBwYWdlcyB3aGljaCBhcmUgc3BlY2lmaWNhbGx5IFBHQ19leHRyYSBwYWdlcyB0aGVuIEknbGwg
bmVlZCB0byBmaXggdGhlbSBzaW1pbGFybHkuCgogIFBhdWwKCgoKPiAKPiBKYW4KPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
