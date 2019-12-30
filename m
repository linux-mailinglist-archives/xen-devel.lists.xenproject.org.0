Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C156E12D348
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 19:18:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilza2-0005wt-L3; Mon, 30 Dec 2019 18:15:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zwGu=2U=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ilza1-0005wo-9o
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 18:15:49 +0000
X-Inumbo-ID: 62d0b566-2b30-11ea-a914-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d0b566-2b30-11ea-a914-bc764e2007e4;
 Mon, 30 Dec 2019 18:15:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577729740; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=jMFCELH+3VX0KcoJd0RiDDHq0P1lA1orNr14DB5RpO0=;
 b=ThC8L/NfQ5+5YLtRHhsK2uazzUz0iDwNTXljP0iU5QGSb3aZet/kbGByhvwqta6Cz80PRJsw
 1I1dvQzEvls1A1u2T1lSSEGgBaBKXMHLwvPZB3MLOz+C9nRdZLDubFfBU2RHqdOl/CHSAZg2
 VwafMK9kTWwBw7c7KaKFAaNzN5k=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mxa.mailgun.org with ESMTP id 5e0a3ecb.7f8b45f2e0f0-smtp-out-n01;
 Mon, 30 Dec 2019 18:15:39 -0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id m24so208713wmc.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 10:15:39 -0800 (PST)
X-Gm-Message-State: APjAAAVEA4euhUXnml14xFx9v/JUwAr1nOsTkypPdwX4YWEMvFFtKxIm
 p3Y8Z/hyna7TOCCeiKEArCDE7JKgnhQ+bUaq4kk=
X-Google-Smtp-Source: APXvYqzSuU6KsGxhjuhhjqn/IqeCl4HB6GKvyTn/av6YJClAzeDc78VJ66zNMYW2MCnxpw6AiC9bZFbIxZMx1PVKQdM=
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr250919wmc.168.1577729738603; 
 Mon, 30 Dec 2019 10:15:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
In-Reply-To: <20191230175900.GF11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 30 Dec 2019 11:15:02 -0700
X-Gmail-Original-Message-ID: <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
Message-ID: <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Julien Grall <julien@xen.org>, Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMTA6NTkgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDg6NTg6
MDFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gVGh1LCBEZWMgMTksIDIw
MTkgYXQgMjo0OCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDExOjQwOjM3QU0gLTA4MDAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gPiBUaGUgZm9sbG93aW5nIHNlcmllcyBpbXBs
ZW1lbnRzIFZNIGZvcmtpbmcgZm9yIEludGVsIEhWTSBndWVzdHMgdG8gYWxsb3cgZm9yCj4gPiA+
ID4gdGhlIGZhc3QgY3JlYXRpb24gb2YgaWRlbnRpY2FsIFZNcyB3aXRob3V0IHRoZSBhc3Nvc2Np
YXRlZCBoaWdoIHN0YXJ0dXAgY29zdHMKPiA+ID4gPiBvZiBib290aW5nIG9yIHJlc3RvcmluZyB0
aGUgVk0gZnJvbSBhIHNhdmVmaWxlLgo+ID4gPiA+Cj4gPiA+ID4gSklSQSBpc3N1ZTogaHR0cHM6
Ly94ZW5wcm9qZWN0LmF0bGFzc2lhbi5uZXQvYnJvd3NlL1hFTi04OQo+ID4gPiA+Cj4gPiA+ID4g
VGhlIG1haW4gZGVzaWduIGdvYWwgd2l0aCB0aGlzIHNlcmllcyBoYXMgYmVlbiB0byByZWR1Y2Ug
dGhlIHRpbWUgb2YgY3JlYXRpbmcKPiA+ID4gPiB0aGUgVk0gZm9yayBhcyBtdWNoIGFzIHBvc3Np
YmxlLiBUbyBhY2hpZXZlIHRoaXMgdGhlIFZNIGZvcmtpbmcgcHJvY2VzcyBpcwo+ID4gPiA+IHNw
bGl0IGludG8gdHdvIHN0ZXBzOgo+ID4gPiA+ICAgICAxKSBmb3JraW5nIHRoZSBWTSBvbiB0aGUg
aHlwZXJ2aXNvciBzaWRlOwo+ID4gPiA+ICAgICAyKSBzdGFydGluZyBRRU1VIHRvIGhhbmRsZSB0
aGUgYmFja2VkIGZvciBlbXVsYXRlZCBkZXZpY2VzLgo+ID4gPiA+Cj4gPiA+ID4gU3RlcCAxKSBp
bnZvbHZlcyBjcmVhdGluZyBhIFZNIHVzaW5nIHRoZSBuZXcgInhsIGZvcmstdm0iIGNvbW1hbmQu
IFRoZQo+ID4gPiA+IHBhcmVudCBWTSBpcyBleHBlY3RlZCB0byByZW1haW4gcGF1c2VkIGFmdGVy
IGZvcmtzIGFyZSBjcmVhdGVkIGZyb20gaXQgKHdoaWNoCj4gPiA+ID4gaXMgZGlmZmVyZW50IHRo
ZW4gd2hhdCBwcm9jZXNzIGZvcmtpbmcgbm9ybWFsbHkgZW50YWlscykuIER1cmluZyB0aGlzIGZv
cmtpbmcKPiA+ID4gICAgICAgICAgICAgICAgXiB0aGFuCj4gPiA+ID4gb3BlcmF0aW9uIHRoZSBI
Vk0gY29udGV4dCBhbmQgVk0gc2V0dGluZ3MgYXJlIGNvcGllZCBvdmVyIHRvIHRoZSBuZXcgZm9y
a2VkIFZNLgo+ID4gPiA+IFRoaXMgb3BlcmF0aW9uIGlzIGZhc3QgYW5kIGl0IGFsbG93cyB0aGUg
Zm9ya2VkIFZNIHRvIGJlIHVucGF1c2VkIGFuZCB0byBiZQo+ID4gPiA+IG1vbml0b3JlZCBhbmQg
YWNjZXNzZWQgdmlhIFZNSS4gTm90ZSBob3dldmVyIHRoYXQgd2l0aG91dCBpdHMgZGV2aWNlIG1v
ZGVsCj4gPiA+ID4gcnVubmluZyAoZGVwZW5kaW5nIG9uIHdoYXQgaXMgZXhlY3V0aW5nIGluIHRo
ZSBWTSkgaXQgaXMgYm91bmQgdG8KPiA+ID4gPiBtaXNiZWhhdmUvY3Jhc2ggd2hlbiBpdHMgdHJ5
aW5nIHRvIGFjY2VzcyBkZXZpY2VzIHRoYXQgd291bGQgYmUgZW11bGF0ZWQgYnkKPiA+ID4gPiBR
RU1VLiBXZSBhbnRpY2lwYXRlIHRoYXQgZm9yIGNlcnRhaW4gdXNlLWNhc2VzIHRoaXMgd291bGQg
YmUgYW4gYWNjZXB0YWJsZQo+ID4gPiA+IHNpdHVhdGlvbiwgaW4gY2FzZSBmb3IgZXhhbXBsZSB3
aGVuIGZ1enppbmcgaXMgcGVyZm9ybWVkIG9mIGNvZGUgc2VnbWVudHMgdGhhdAo+ID4gPiA+IGRv
bid0IGFjY2VzcyBzdWNoIGRldmljZXMuCj4gPiA+ID4KPiA+ID4gPiBTdGVwIDIpIGludm9sdmVz
IGxhdW5jaGluZyBRRU1VIHRvIHN1cHBvcnQgdGhlIGZvcmtlZCBWTSwgd2hpY2ggcmVxdWlyZXMg
dGhlCj4gPiA+ID4gUUVNVSBYZW4gc2F2ZWZpbGUgdG8gYmUgZ2VuZXJhdGVkIG1hbnVhbGx5IGZy
b20gdGhlIHBhcmVudCBWTS4gVGhpcyBjYW4gYmUKPiA+ID4gPiBhY2NvbXBsaXNoZWQgc2ltcGx5
IGJ5IGNvbm5lY3RpbmcgdG8gaXRzIFFNUCBzb2NrZXQgYW5kIGlzc3VpbmcgdGhlCj4gPiA+ID4g
Inhlbi1zYXZlLWRldmljZXMtc3RhdGUiIGNvbW1hbmQgYXMgZG9jdW1lbnRlZCBieSBRRU1VOgo+
ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvYmxvYi9tYXN0ZXIvZG9jcy94ZW4t
c2F2ZS1kZXZpY2VzLXN0YXRlLnR4dAo+ID4gPiA+IE9uY2UgdGhlIFFFTVUgWGVuIHNhdmVmaWxl
IGlzIGdlbmVyYXRlZCB0aGUgbmV3ICJ4bCBmb3JrLWxhdW5jaC1kbSIgY29tbWFuZCBpcwo+ID4g
PiA+IHVzZWQgdG8gbGF1bmNoIFFFTVUgYW5kIGxvYWQgdGhlIHNwZWNpZmllZCBzYXZlZmlsZSBm
b3IgaXQuCj4gPiA+Cj4gPiA+IElNTyBoYXZpbmcgdHdvIGRpZmZlcmVudCBjb21tYW5kcyBpcyBj
b25mdXNpbmcgZm9yIHRoZSBlbmQgdXNlciwgSQo+ID4gPiB3b3VsZCByYXRoZXIgaGF2ZSBzb21l
dGhpbmcgbGlrZToKPiA+ID4KPiA+ID4geGwgZm9yay12bSBbLWRdIC4uLgo+ID4gPgo+ID4gPiBX
aGVyZSAnLWQnIHdvdWxkIHByZXZlbnQgZm9ya2luZyBhbnkgdXNlci1zcGFjZSBlbXVsYXRvcnMu
IEkgZG9uJ3QKPiA+ID4gdGhpbmtzIHRoZXJlJ3MgYSBuZWVkIGZvciBhIHNlcGFyYXRlIGNvbW1h
bmQgdG8gZm9yayB0aGUgdW5kZXJseWluZwo+ID4gPiB1c2VyLXNwYWNlIGVtdWxhdG9ycy4KPiA+
Cj4gPiBLZWVwaW5nIGl0IGFzIHR3byBjb21tYW5kcyBhbGxvd3MgeW91IHRvIHN0YXJ0IHVwIHRo
ZSBmb3JrIGFuZCBsZXQgaXQKPiA+IHJ1biBpbW1lZGlhdGVseSBhbmQgb25seSBzdGFydCB1cCBR
RU1VIHdoZW4geW91IG5vdGljZSBpdCBpcyBuZWVkZWQuCj4gPiBUaGUgaWRlYSBiZWluZyB0aGF0
IHlvdSBjYW4gbW9uaXRvciB0aGUga2VybmVsIGFuZCBzZWUgd2hlbiBpdCB0cmllcwo+ID4gdG8g
ZG8gc29tZSBJL08gdGhhdCB3b3VsZCByZXF1aXJlIHRoZSBRRU1VIGJhY2tlbmQuIElmIHlvdSBj
b21iaW5lIHRoZQo+ID4gY29tbWFuZHMgdGhhdCBvcHRpb24gZ29lcyBhd2F5Lgo+Cj4gSSdtIG5v
dCBzdXJlIEkgc2VlIHdoeSwgeW91IGNvdWxkIHN0aWxsIHByb3ZpZGUgYSBgeGwgZm9yay12bSBb
LWNdCj4gLi4uYCB0aGF0IHdvdWxkIGp1c3QgbHVuY2ggYSBRRU1VIGluc3RhbmNlLiBFbmQgdXNl
cnMgdXNpbmcgeGwgaGF2ZQo+IEFGQUlDVCBubyB3YXkgdG8gdGVsbCB3aGV0aGVyIG9yIHdoZW4g
YSBRRU1VIGlzIG5lZWRlZCBvciBub3QsIGFuZAo+IGhlbmNlIHRoZSBkZWZhdWx0IGJlaGF2aW9y
IHNob3VsZCBiZSBhIGZ1bGx5IGZ1bmN0aW9uYWwgb25lLgo+Cj4gSU1PIEkgdGhpbmsgZm9yay12
bSB3aXRob3V0IGFueSBvcHRpb25zIHNob3VsZCBkbyBhIGNvbXBsZXRlIGZvcmsgb2YgYQo+IFZN
LCByYXRoZXIgdGhhbiBhIHBhcnRpYWwgb25lIHdpdGhvdXQgYSBkZXZpY2UgbW9kZWwgY2xvbmUu
CgpJIHVuZGVyc3RhbmQgeW91ciBwb2ludCBidXQgaW1wbGVtZW50aW5nIHRoYXQgaXMgb3V0c2lk
ZSB0aGUgc2NvcGUgb2YKd2hhdCB3ZSBhcmUgZG9pbmcgcmlnaHQgbm93LiBUaGVyZSBhcmUgYSBs
b3QgbW9yZSBzdGVwcyBpbnZvbHZlZCBpZgp5b3Ugd2FudCB0byBjcmVhdGUgYSBmdWxseSBmdW5j
dGlvbmFsIFZNIGZvcmsgd2l0aCBRRU1VLCBmb3IgZXhhbXBsZQp5b3UgYWxzbyBoYXZlIHRvIGNy
ZWF0ZSBhIHNlcGFyYXRlIGRpc2sgc28geW91IGRvbid0IGNsb2JiZXIgdGhlCnBhcmVudCBWTSdz
IGRpc2suIEFsc28sIHNhdmluZyB0aGUgUUVNVSBkZXZpY2Ugc3RhdGUgaXMgY3VycmVudGx5Cmhh
cmQtd2lyZWQgaW50byB0aGUgc2F2ZS9taWdyYXRpb24gb3BlcmF0aW9uLCBzbyBjaGFuZ2luZyB0
aGF0CnBsdW1iaW5nIGluIGxpYnhsIGlzIHF1aXRlIGludm9sdmVkLiBJIGFjdHVhbGx5IGZvdW5k
IGl0IHdheSBlYXNpZXIgdG8KanVzdCB3cml0ZSBhIHNjcmlwdCB0aGF0IGNvbm5lY3RzIHRvIHRo
ZSBzb2NrZXQgYW5kIHNhdmVzIGl0IHRvIGEKdGFyZ2V0IGZpbGUgdGhlbiBnb2luZyB0aHJvdWdo
IHRoZSBwYWluIG9mIGFkanVzdGluZyBsaWJ4bC4gU28gd2hpbGUKdGhpcyBjb3VsZCBiZSBpbXBs
ZW1lbnRlZCBhdCB0aGlzIHRpbWUgaXQgd29uJ3QgYmUuCgpUYW1hcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
