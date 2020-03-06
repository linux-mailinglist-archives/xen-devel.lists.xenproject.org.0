Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8817BE65
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:28:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAD08-0003eU-2h; Fri, 06 Mar 2020 13:26:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jAD06-0003eN-NK
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:26:50 +0000
X-Inumbo-ID: 226a85d0-5fae-11ea-90c4-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 226a85d0-5fae-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 13:26:49 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e25so2511745edq.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rMdpSaistRHOoHPPVRrvlAAmtDbZSKcXQbN7fS1EnQI=;
 b=HcTVusbEJjPg4Ik+CEsl9X7dEpAjI4Q/SY25cNlmR7mG/h4YPFSPibsxfy+sJFjrfc
 adNMjkYy8Ea9l6DBQ4KVHKaT/7JcRbi9+1yIOKeibr/ulr9tT4dF4SpQUxwXrqrx6WqI
 gf9BxRoIHAxKy7pQRp3Ln24bAeg/Z50JFvSWekNpylEJ+/cK06NERrE5vCiZN6toJ31X
 0+Tw6fB5SOFo0WU9EUTU4L5BFoWh7uqmk21Ovdpnob6nZ0dRCtsABDW1OJ1pkC0ioefe
 A1zTuo96D82v6FfYW9qLzjO5fl0ck7Oi5lx5/qzaHCCSY5YeNVYg/uOVj9WtvGePmlq+
 ry1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rMdpSaistRHOoHPPVRrvlAAmtDbZSKcXQbN7fS1EnQI=;
 b=is6RRVH0RAK5GoNNM2sFFRcjLF1aoqJpJsn6V/aBKv1OV0aDHSIygg17mlOEChZBG3
 FCmAAcohvsklAId69APX/NiEzXFcDHLk7my/1AmhY8MqPDRnhVG14FCn5tP7SXulcBM4
 OJBdmeTCax00DsD016Xl6AHsRuHEEbKBNHJnTmoVcY2S/9W3QGtFZuG5o7wF/izj3B7c
 oZs++AQqSRKXmxIL6J70SQr0HbXgH0pyg8LfrLF7dTjiqgB5aTqv6IUORszI+J4gtSDx
 Cbz9mkUg3dTGf4Kn78gHB+2IoxEUcuIShM24/Zzdue7NlWvKanN+cG2IvlBNJbtYgmeC
 H0ag==
X-Gm-Message-State: ANhLgQ3vL3wx/jpwiESROd3L/dm1NHk+/NePYjw6hXZjg0DnlN2MQTPT
 z5oDeW4zrXNxAHe3uqEHAlg=
X-Google-Smtp-Source: ADFU+vsu9KI6/BM+uwB+avXc18MLxbNSZsomPwxcTj9JYGAbRziKzUtVjG4lDQx20KR/GnICxzNZMw==
X-Received: by 2002:a50:d849:: with SMTP id v9mr3181975edj.105.1583501209155; 
 Fri, 06 Mar 2020 05:26:49 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id q20sm397742ejx.5.2020.03.06.05.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:26:48 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <007f01d5f3b9$110d20b0$33276210$@xen.org>
 <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
In-Reply-To: <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
Date: Fri, 6 Mar 2020 13:26:47 -0000
Message-ID: <00cc01d5f3ba$e3a89300$aaf9b900$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV68GGHAJvfVndcEiEcAXBc0AZ06gtgfgAgAAAk6CADhr6JoAAAGnw
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaAo+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MjQKPiBUbzogUGF1bCBEdXJyYW50IDx4YWRpbWduaWtA
Z21haWwuY29tPgo+IENjOiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsg
Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb207IHdsQHhlbi5vcmc7Cj4ga29ucmFkLndpbGtAb3Jh
Y2xlLmNvbTsgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbTsKPiBnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb207IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgJ0RhdmlkIFdvb2Rob3VzZScgPGR3bXcyQGluZnJhZGVhZC5vcmc+Cj4gU3ViamVj
dDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzJdIGRvbWFpbjogdXNlIFBHQ19leHRyYSBkb21o
ZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZvCj4gCj4gT24gMDYuMDMuMjAyMCAxNDoxMywgUGF1bCBE
dXJyYW50IHdyb3RlOgo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTog
WGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVo
YWxmIE9mIEphbiBCZXVsaWNoCj4gPj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMzoxMAo+ID4+IFRv
OiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+OyBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+Cj4gPj4gQ2M6IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1
bGllbkB4ZW4ub3JnOyB3bEB4ZW4ub3JnOyBrb25yYWQud2lsa0BvcmFjbGUuY29tOwo+ID4+IGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb207IGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbTsgeGVuLQo+ID4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyBWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVs
XSBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlIGZvciBzaGFy
ZWRfaW5mbwo+ID4+Cj4gPj4gT24gMDYuMDMuMjAyMCAxMzo1NywgRGF2aWQgV29vZGhvdXNlIHdy
b3RlOgo+ID4+PiBPbiBGcmksIDIwMjAtMDMtMDYgYXQgMTM6MzYgKzAxMDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4+Pj4gQW5kIG9mIGNvdXJzZSB0aGlzIG1lYW5zIHlvdSdyZSBpbnRlbmRpbmcg
dG8gKGF0IGxlYXN0Cj4gPj4+PiBwYXJ0aWFsbHkpIHJlc3VycmVjdCB0aGUgZGlzdGluY3Rpb24g
YmV0d2VlbiBkb21oZWFwIGFuZCB4ZW5oZWFwLAo+ID4+Pj4gd2hpY2ggaXNuJ3Qgc2FpZCBhbnl3
aGVyZSBpbiBQYXVsJ3Mgc2VyaWVzLCBJIGRvbid0IHRoaW5rLgo+ID4+Pgo+ID4+PiBSaWdodC4g
U2VjcmV0IGhpZGluZyBtYWtlcyB0aGUgZGlzdGluY3Rpb24gKHhlbmhlYXAgaXMgbWFwcGVkLCBk
b21oZWFwCj4gPj4+IGlzIG5vdCkgbW9zdGx5IGdvIGF3YXkuIFdlIGFyZSB0YWxraW5nIGFib3V0
IHJlc3RvcmluZyAqYSogZGlzdGluY3Rpb24KPiA+Pj4gYmV0d2VlbiBvbmUgdHlwZSBvZiBwYWdl
IChYZW4gZXBoZW1lcmFsIHBhZ2VzIHdoaWNoIGRvbid0IG5lZWQgdG8gYmUKPiA+Pj4gcHJlc2Vy
dmVkIG92ZXIgbGl2ZSB1cGRhdGUpIGFuZCBhbm90aGVyIChtdXN0IGJlIHByZXNlcnZlZCksIGJ1
dAo+ID4+PiB3aGV0aGVyIHRoYXQgc2hvdWxkIHN0aWxsIGJlIGNhbGxlZCAieGVuaGVhcCIgdnMu
ICJkb21oZWFwIiwgZGVzcGl0ZQo+ID4+PiB0aGUgbWFzc2l2ZSBwYXJhbGxlbHMsIGlzbid0IGVu
dGlyZWx5IGNsZWFyLgo+ID4+Pgo+ID4+Pj4gIElmIHRoaXMKPiA+Pj4+IGlzIGEgc3VmZmljaWVu
dGx5IGNvcnJlY3QgdW5kZXJzdGFuZGluZyBvZiBtaW5lLCB0aGVuIG9uIG9uZSBoYW5kCj4gPj4+
PiBJIHN0YXJ0IHNlZWluZyB0aGUgcG9pbnQgb2YgdGhlIGNvbnZlcnNpb24gUGF1bCB3YW50cyB0
byBtYWtlLCBidXQKPiA+Pj4+IG90b2ggdGhpcyB0aGVuIGZlZWxzIGEgbGl0dGxlIGxpa2UgbWFr
aW5nIHRoZSAybmQgc3RlcCBiZWZvcmUgdGhlCj4gPj4+PiAxc3QuCj4gPj4+Cj4gPj4+Cj4gPj4+
IFdoYXQgd291bGQgeW91IHN1Z2dlc3QgaXMgdGhlIGZpcnN0IHN0ZXA/Cj4gPj4KPiA+PiBFc3Rh
Ymxpc2hpbmcgb2Ygd2hhdCB0aGUgbmV3IHNlcGFyYXRpb24gcnVsZSBhbmQgbWVjaGFuaXNtIGlz
IGdvaW5nCj4gPj4gdG8gYmUgKG5vIG1hdHRlciBob3cgdGhlIHR3byByZXN1bHRpbmcgcGllY2Vz
IGFyZSBnb2luZyB0byBiZQo+ID4+IG5hbWVkKS4KPiA+Pgo+ID4KPiA+IFdvdWxkIHlvdSBiZSBv
ayB3aXRoIGEgY29tbWVudCB0byB0aGF0IGVmZmVjdD8KPiAKPiBOb3Qgc3VyZS4gSXQgd291bGQg
Y2VydGFpbmx5IGhlbHAgaWYgdGhlIGNvdmVyIGxldHRlciBhdCBsZWFzdAo+IG1lbnRpb25lZCBv
dGhlciByZWxhdGVkIGFzcGVjdHMgbGlrZSB0aGlzIG9uZS4KPiAKPiA+IE15IGFpbSBpcyB0byBt
YWtlIHRoZSBzZXBhcmF0aW9uIGFidW5kYW50bHkgb2J2aW91cyBieSBnZXR0aW5nIHJpZAo+ID4g
b2Ygc2hhcmVkIHhlbmhlYXAgcGFnZXMgKGZvciBub24tc3lzdGVtIGRvbWFpbnMgYXQgbGVhc3Qp
IGJ1dCBJCj4gPiBjYW4ndCBkbyB0aGF0IGJlZm9yZSBjb252ZXJ0aW5nIHNoYXJlZF9pbmZvIGFu
ZCBncmFudCBzaGFyZWQvc3RhdHVzCj4gPiBmcmFtZXMgdG8gZG9taGVhcC4KPiAKPiBGb2xsb3dp
bmcgRGF2aWQncyB2YXJpb3VzIHJlcGxpZXMgLSBpbnN0ZWFkIG9mIGdvaW5nIHRoaXMgcm91dGUg
b2YKPiByZXBsYWNpbmcgdGhlIHNoYXJpbmcgb2YgeGVuaGVhcCBwYWdlcyBieSBkaWZmZXJlbnQg
bG9naWMsIHRoZQo+IHNhbWUgb3VnaHQgdG8gYmUgYWNoaWV2YWJsZSBieSBtYWtpbmcgdGhlIGJh
Y2tpbmcgYWxsb2NhdGlvbnMgY29tZQo+IGZyb20gdGhlIGNvcnJlY3QgcG9vbD8KPiAKCkkgc3Rp
bGwgcHJlZmVyIHRoZSBzaW1wbGlmaWNhdGlvbiBvZiBub3QgaGF2aW5nIHRvIGNsZWFuIHVwIHRo
ZSBzaGFyZWQgeGVuaGVhcCBwYWdlIGxpc3QgaW4gZG9tYWluX2tpbGwoKSBzbyBJTU8gaXQgaXMg
c3RpbGwgd29ydGggaXQgZm9yIHRoYXQgYWxvbmUuCgogIFBhdWwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
