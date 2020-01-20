Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94444143318
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 21:54:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itdyb-0004IF-Tb; Mon, 20 Jan 2020 20:48:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itdya-0004IA-16
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 20:48:48 +0000
X-Inumbo-ID: 40d4809a-3bc6-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40d4809a-3bc6-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 20:48:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so478265ljh.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F3GOthR5XUHvHHEx/qOYngkqSlYe2kp4X1xDngMsX90=;
 b=Ku+imcM33+Btkoy6o+YwSCN5Ytjf3n9joyl/IHUxKBRZq+RExS7EmK4St8LFLbTYSh
 7kl1fQAa5J3MQqz08lavlDjlywM219U2dsOxpcsGBQIqCCzN3sYrz5+XyVuuvbSPtOhV
 T+w//PyvCmhSsq3QEMWqyFbDIF1VAY/Eu6HdlDsb8m0UmR3RoO2JC0JJ3TEyrJVk5rUz
 0ZQpS9GWFpGYfCq4i6hQDCfQGSXASHj3ITAukexzc/S+g4lFpWtgVMhpck/cOTUzs7Y5
 fCiPSKZTewlqH8xehFGZmigfkVnSlUpMxZahQUYJ8ZBtq7o0AjG91K+NWSzAfIeWAKLJ
 hXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F3GOthR5XUHvHHEx/qOYngkqSlYe2kp4X1xDngMsX90=;
 b=V5CY2bXlzb7ZMdBDMd6PuOpWgukh0qAUHSglT4Zq75V888FKZR+HkOQRroIaz+ncYd
 9bH8aueilGCCtpXtuaU4H7JupQF/a/pwshuB1pihQ2NJXRfzxLOwCHXmt0fR66yH3aZp
 3/X4kia+CRxBUWel5Os6ENIvtawhj5/SHSB4oZHtg1nd4nkTTzTa5KNdnpN6KTGg6HKp
 5Uw01HZ5I7RnZxK284phNwT58asjZ5CdohkmO60/+/Do61y1pDFOuCkub593W3HacRSc
 rj14i5eT3t30KmGPcimE76VRfj82ZsJO2YOI9wIq5US5gRE8Ye1bOvpfjrjqwJIxGHRe
 6y1A==
X-Gm-Message-State: APjAAAVefL7crk/MIYjOo96kofHc6AyftZK5nfYJtgw/2rZqdKb3ZNqL
 YY4eG8wF8054j3duOO7PHMI6aFkh5n+ZKg1zkiM=
X-Google-Smtp-Source: APXvYqxFeDjocDVe22XGeLL7jh9oVZiqbHpZXfLEdYllfwTnVZ0w2SXeJHbGA74tDy36jP+VhQZ1BXe4kYbJ93Cu25g=
X-Received: by 2002:a2e:9cd2:: with SMTP id g18mr12194829ljj.272.1579553326159; 
 Mon, 20 Jan 2020 12:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
In-Reply-To: <20200120171840.GF11756@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 15:48:35 -0500
Message-ID: <CAKf6xptc2QUW4yZ8mk7sj9viZjeXMBKsCbmCUuqXVnm+KZn6Yw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMTI6MTggUE0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDU6MTA6
MzNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAxNy4wMS4yMDIwIDEyOjA4LCBS
b2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiA+IFdoZW4gcGxhY2luZyBtZW1vcnkgQkFScyB3aXRo
IHNpemVzIHNtYWxsZXIgdGhhbiA0SyBtdWx0aXBsZSBtZW1vcnkKPiA+ID4gQkFScyBjYW4gZW5k
IHVwIG1hcHBlZCB0byB0aGUgc2FtZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLCBhbmQgdGh1cwo+
ID4gPiB3b24ndCB3b3JrIGNvcnJlY3RseS4KPiA+Cj4gPiBUaGlua2luZyBhYm91dCBpdCBhZ2Fp
biwgYXJlbid0IHlvdSBmaXhpbmcgb25lIHBvc3NpYmxlIGNhc2UgYnkKPiA+IGJyZWFraW5nIHRo
ZSBvcHBvc2l0ZSBvbmU6IFdoYXQgeW91IGZpeCBpcyB3aGVuIHRoZSB0d28gZGlzdGluY3QKPiA+
IEJBUnMgKG9mIHRoZSBzYW1lIG9yIGRpZmZlcmVudCBkZXZpY2VzKSBtYXAgdG8gZGlzdGluY3Qg
TUZOcwo+ID4gKHdoaWNoIHdvdWxkIGhhdmUgcmVxdWlyZWQgYSBzaW5nbGUgR0ZOIHRvIG1hcCB0
byBib3RoIG9mIHRoZXNlCj4gPiBNRk5zKS4gQnV0IGRvbid0IHlvdSwgYXQgdGhlIHNhbWUgdGlt
ZSwgYnJlYWsgdGhlIGNhc2Ugb2YgdHdvCj4gPiBCQVJzIChwZXJoYXBzLCBidXQgbm90IG5lY2Vz
c2FyaWx5LCBvZiB0aGUgc2FtZSBwaHlzaWNhbCBkZXZpY2UpCj4gPiBtYXBwaW5nIGJvdGggdG8g
dGhlIHNhbWUgTUZOLCBpLmUuIHJlcXVpcmluZyB0byBoYXZlIHR3byBkaXN0aW5jdAo+ID4gR0ZO
cyBtYXAgdG8gb25lIE1GTj8gKEF0IGxlYXN0IGZvciB0aGUgbW9tZW50IEkgY2FuJ3Qgc2VlIGEg
d2F5Cj4gPiBmb3IgaHZtbG9hZGVyIHRvIGRpc3Rpbmd1aXNoIHRoZSB0d28gY2FzZXMuKQo+Cj4g
SU1PIHdlIHNob3VsZCBmb3JjZSBhbGwgQkFScyB0byBiZSBwYWdlLWlzb2xhdGVkIGJ5IGRvbTAg
KHNpbmNlIFhlbgo+IGRvZXNuJ3QgaGF2ZSB0aGUga25vd2xlZGdlIG9mIGRvaW5nIHNvKSwgYnV0
IEkgZG9uJ3Qgc2VlIHRoZSBpc3N1ZQo+IHdpdGggaGF2aW5nIGRpZmZlcmVudCBnZm5zIHBvaW50
aW5nIHRvIHRoZSBzYW1lIG1mbi4gSXMgdGhhdCBhCj4gbGltaXRhdGlvbiBvZiBwYWdpbmc/IEkg
dGhpbmsgeW91IGNhbiBtYXAgYSBncmFudCBtdWx0aXBsZSB0aW1lcyBpbnRvCj4gZGlmZmVyZW50
IGdmbnMsIHdoaWNoIGFjaGlldmVzIHRoZSBzYW1lIEFGQUlDVC4KCkJBUnMgb24gYSBzaGFyZWQg
TUZOIHdvdWxkIGJlIGEgcHJvYmxlbSBzaW5jZSB0aGUgc2Vjb25kIEJBUiB3b3VsZCBiZQphdCBh
biBvZmZzZXQgaW50byB0aGUgcGFnZS4gIE1lYW53aGlsZSB0aGUgZ3Vlc3QncyB2aWV3IG9mIHRo
ZSBCQVIKd291bGQgYmUgYXQgb2Zmc2V0IDAgb2YgdGhlIHBhZ2UuCgpCdXQgSSBhZ3JlZSB3aXRo
IFJvZ2VyIHRoYXQgd2UgYmFzaWNhbGx5IG5lZWQgcGFnZSBhbGlnbm1lbnQgZm9yIGFsbApwYXNz
LXRocm91Z2ggbWVtb3J5IEJBUnMuICBXaXRoIG15IGxpbWl0ZWQgdGVzdCBoYXJkd2FyZSwgYWxs
IHRoZSBQQ0kKbWVtb3J5IEJBUnMgYXJlIHBhZ2UgYWxpZ25lZCBpbiBkb20wLiAgU28gaXQgd2Fz
IG9ubHkgdGhlIGd1ZXN0CmFkZHJlc3NlcyB0aGF0IG5lZWRlZCBhbGlnbm1lbnQuCgpSZWdhcmRz
LApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
