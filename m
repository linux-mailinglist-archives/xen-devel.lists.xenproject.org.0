Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6E17BDFC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:16:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACnV-0002Ej-9V; Fri, 06 Mar 2020 13:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jACnU-0002Ee-2N
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:13:48 +0000
X-Inumbo-ID: 4ff4f906-5fac-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ff4f906-5fac-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:13:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a13so2450285edu.7
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=GVu6yV/WO1NPRMFFbpDT+aceKDpTnI+K5f/cQ5VCSEU=;
 b=FhpaP7mzYTB7b2ysS5uS2ziX+ja489ypqPP2lEGgG3KLTi640OaSZpUuOKY+YZZ4sc
 XcyFhFhLTviGKDSk82uLz/CS3bUN5X9cDZfWsiRgWbfq1rRcv3x8Os77Of1x5uSGoQAZ
 wlJCl1+AvOqENgWAa6Jcw3twJvxu3/Gsp45oPx/yKF+VmklRHZsk5/QnQP+kBIhXYKdU
 Cmh8kUivQsPW9Bhtz0/FCWbJbYrmsPExYBvazH2ynAqjc61bx+IokhHUPPmmmtXg+ZNe
 0SFRq44DDBNav0R9i8G5p+fsRwYVBX6vL0w0fgpuvQumIvuUlOasawnpZEuvS5YKLTKU
 bfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=GVu6yV/WO1NPRMFFbpDT+aceKDpTnI+K5f/cQ5VCSEU=;
 b=nvI7UdRGJd84dTcl/wufr3qisn00nRlssYSn4y8RS8ASeXrXqiUMVkEc5/rFtiYVJi
 Tf/MyCEcsA/2IWRJOUOaMcxvseqDlsQjUK4dfHlsUFyF6vJb3KDIbGo66heAD9i/lENc
 WAi6NapWeEkx1raq8COlwTULS7b9JZbaR7ZkUrox4BTWbPkQh2Tu9vgnr6bPeDTwvSdH
 fyy3WTSEMEPyFeM0jiekPVs5J3ZMtlDIZuCX1lqzLcC9GIMJQa+Iuem/F2CKY8/0jRDr
 q1qNJrsnnC+aovIKq09/u8aWAE7tZtlssIa8y6nEsRmqS3ocDMb7t1L37V8PXXNclhc6
 lqzA==
X-Gm-Message-State: ANhLgQ1WRP13yyGpW09JPavppLqRyE0Nj/2PSPoI5htrZ+LTCKj6Mk/x
 FIggKSJaB50YmtzA5O3igq0=
X-Google-Smtp-Source: ADFU+vumU+wC94bECFpXZ0p0H9PYcuv0RDAnaeh0e+4JLbchc80vu2yGqhlE+hNrb0PRdTnxPugX5A==
X-Received: by 2002:a50:f38e:: with SMTP id g14mr3097538edm.168.1583500426506; 
 Fri, 06 Mar 2020 05:13:46 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id cx3sm1240217edb.75.2020.03.06.05.13.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:13:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'David Woodhouse'" <dwmw2@infradead.org>
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
In-Reply-To: <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
Date: Fri, 6 Mar 2020 13:13:44 -0000
Message-ID: <007f01d5f3b9$110d20b0$33276210$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV68GGHAJvfVndcEiEcAXBc0AZ06gtgfgAgAAAk6CADhcm7IAAAGUA
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
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaAo+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MTAKPiBUbzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBp
bmZyYWRlYWQub3JnPjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENj
OiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsgd2xAeGVuLm9yZzsga29u
cmFkLndpbGtAb3JhY2xlLmNvbTsKPiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tOyBpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tOyBnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb207IHhlbi0KPiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgVm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20KPiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvMl0gZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRv
bWhlYXAgcGFnZSBmb3Igc2hhcmVkX2luZm8KPiAKPiBPbiAwNi4wMy4yMDIwIDEzOjU3LCBEYXZp
ZCBXb29kaG91c2Ugd3JvdGU6Cj4gPiBPbiBGcmksIDIwMjAtMDMtMDYgYXQgMTM6MzYgKzAxMDAs
IEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IEFuZCBvZiBjb3Vyc2UgdGhpcyBtZWFucyB5b3UncmUg
aW50ZW5kaW5nIHRvIChhdCBsZWFzdAo+ID4+IHBhcnRpYWxseSkgcmVzdXJyZWN0IHRoZSBkaXN0
aW5jdGlvbiBiZXR3ZWVuIGRvbWhlYXAgYW5kIHhlbmhlYXAsCj4gPj4gd2hpY2ggaXNuJ3Qgc2Fp
ZCBhbnl3aGVyZSBpbiBQYXVsJ3Mgc2VyaWVzLCBJIGRvbid0IHRoaW5rLgo+ID4KPiA+IFJpZ2h0
LiBTZWNyZXQgaGlkaW5nIG1ha2VzIHRoZSBkaXN0aW5jdGlvbiAoeGVuaGVhcCBpcyBtYXBwZWQs
IGRvbWhlYXAKPiA+IGlzIG5vdCkgbW9zdGx5IGdvIGF3YXkuIFdlIGFyZSB0YWxraW5nIGFib3V0
IHJlc3RvcmluZyAqYSogZGlzdGluY3Rpb24KPiA+IGJldHdlZW4gb25lIHR5cGUgb2YgcGFnZSAo
WGVuIGVwaGVtZXJhbCBwYWdlcyB3aGljaCBkb24ndCBuZWVkIHRvIGJlCj4gPiBwcmVzZXJ2ZWQg
b3ZlciBsaXZlIHVwZGF0ZSkgYW5kIGFub3RoZXIgKG11c3QgYmUgcHJlc2VydmVkKSwgYnV0Cj4g
PiB3aGV0aGVyIHRoYXQgc2hvdWxkIHN0aWxsIGJlIGNhbGxlZCAieGVuaGVhcCIgdnMuICJkb21o
ZWFwIiwgZGVzcGl0ZQo+ID4gdGhlIG1hc3NpdmUgcGFyYWxsZWxzLCBpc24ndCBlbnRpcmVseSBj
bGVhci4KPiA+Cj4gPj4gIElmIHRoaXMKPiA+PiBpcyBhIHN1ZmZpY2llbnRseSBjb3JyZWN0IHVu
ZGVyc3RhbmRpbmcgb2YgbWluZSwgdGhlbiBvbiBvbmUgaGFuZAo+ID4+IEkgc3RhcnQgc2VlaW5n
IHRoZSBwb2ludCBvZiB0aGUgY29udmVyc2lvbiBQYXVsIHdhbnRzIHRvIG1ha2UsIGJ1dAo+ID4+
IG90b2ggdGhpcyB0aGVuIGZlZWxzIGEgbGl0dGxlIGxpa2UgbWFraW5nIHRoZSAybmQgc3RlcCBi
ZWZvcmUgdGhlCj4gPj4gMXN0Lgo+ID4KPiA+Cj4gPiBXaGF0IHdvdWxkIHlvdSBzdWdnZXN0IGlz
IHRoZSBmaXJzdCBzdGVwPwo+IAo+IEVzdGFibGlzaGluZyBvZiB3aGF0IHRoZSBuZXcgc2VwYXJh
dGlvbiBydWxlIGFuZCBtZWNoYW5pc20gaXMgZ29pbmcKPiB0byBiZSAobm8gbWF0dGVyIGhvdyB0
aGUgdHdvIHJlc3VsdGluZyBwaWVjZXMgYXJlIGdvaW5nIHRvIGJlCj4gbmFtZWQpLgo+IAoKV291
bGQgeW91IGJlIG9rIHdpdGggYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0PyBNeSBhaW0gaXMgdG8g
bWFrZSB0aGUgc2VwYXJhdGlvbiBhYnVuZGFudGx5IG9idmlvdXMgYnkgZ2V0dGluZyByaWQgb2Yg
c2hhcmVkIHhlbmhlYXAgcGFnZXMgKGZvciBub24tc3lzdGVtIGRvbWFpbnMgYXQgbGVhc3QpIGJ1
dCBJIGNhbid0IGRvIHRoYXQgYmVmb3JlIGNvbnZlcnRpbmcgc2hhcmVkX2luZm8gYW5kIGdyYW50
IHNoYXJlZC9zdGF0dXMgZnJhbWVzIHRvIGRvbWhlYXAuCgogIFBhdWwKCj4gSmFuCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
