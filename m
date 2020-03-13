Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2948F18439E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:28:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCga7-0002bT-6Q; Fri, 13 Mar 2020 09:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72WQ=46=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jCga5-0002bA-U9
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:26:13 +0000
X-Inumbo-ID: ad032702-650c-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad032702-650c-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 09:26:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h62so10997191edd.12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=O/40puoui5qXCJG5wcGEomfRbiKl8wBvrNKn3SwJFKo=;
 b=EZ0LMMzdsrc9juNxz0ZXJQtxF6eR88bEGrIg049E6GcK9gQZWW7XkPKTZRJpbn1CBz
 hQXANoPC/F2uUAT5z+cVO6Hy4etpfEBNM7Il+iinp9YIY502Tfzni1R0BErbt5b1uxL9
 xrac2kU34kxzbaAlve2rrYmTDCglhOD0ubgnorG+szosti0jSLgMzzr8kRblyR0LuimO
 llOdLmrfbSFtMBXxL1gMnQeRA/lOs8Xq+GwTyrD+hsJF7ODWUsxa9+Kq3Ue8J7WamzCM
 brEU2luaYFSev8x8dpbLcBDf2J1kHtwoUZ/KI5eVlogiBfDYVOuybMFUgbVO3JG1NqnW
 XL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=O/40puoui5qXCJG5wcGEomfRbiKl8wBvrNKn3SwJFKo=;
 b=oKtYXeQlr6npBfU0e7t1PaoYHFqU45sVxHzRtZmmQWbjHXlmYMpvMjj2IpPrnJcUME
 /nqemMDozS2jGQCizCZvO2J+3EL11Hicw2le/ZnMTOdbmnhfdBiIP0x0mYmmM/2lALFV
 GfuQP0OEMBhVEZtkMy1qW6VX1XCnMVkqbykYYzsaa2XguR+VY7A/eZCJaNVTVTA7GtCt
 emeF+FiEQdifY+L6S4d1OY6B5Kz7L12GL953q1y/om6krhsF0qwJtWYYdQ8kUI8ge2k4
 /p3bk6IwEiQD/RVVVVMJaibx0GAN3Kc4gDbJkLOK841eFQhPsqaFDmTEQiNidNVa/895
 GvIw==
X-Gm-Message-State: ANhLgQ3WcD3Z2wuWFUDo9smrFjhu5F0WhlUt+BTt8P6W0OL8ECIumr0j
 KbpsjaFIpQm2YUu40838YOM=
X-Google-Smtp-Source: ADFU+vsVKR4xSpR2bjNGXjHf92sIMKj4a5i03x6O1kKy4NMyxAc+/iWC8gjmaxHgwm4uuUOzTkp0yA==
X-Received: by 2002:a17:906:7f05:: with SMTP id
 d5mr10657041ejr.380.1584091570116; 
 Fri, 13 Mar 2020 02:26:10 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id p24sm1361333edx.34.2020.03.13.02.26.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 02:26:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Tian, Kevin'" <kevin.tian@intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5DEC@SHSMSX104.ccr.corp.intel.com>
 <12464780-0ce3-0331-9f78-b026025607fb@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDA43@SHSMSX104.ccr.corp.intel.com>
 <56483550-a9a0-a214-14d6-9a43a4eece6c@suse.com>
In-Reply-To: <56483550-a9a0-a214-14d6-9a43a4eece6c@suse.com>
Date: Fri, 13 Mar 2020 09:26:09 -0000
Message-ID: <009e01d5f919$6e389c00$4aa9d400$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJZoBACz6CdVNlWCO6Kdq3kziJjnAD2y+VvAzKy8/cB1seppwIqFpj/pv2bkmA=
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: xen-devel@lists.xenproject.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMyBNYXJjaCAyMDIwIDA4OjEwCj4gVG86IFRpYW4sIEtldmlu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJy
YW50Cj4gPHBhdWxAeGVuLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBJT01NVTogbWFr
ZSBETUEgY29udGFpbm1lbnQgb2YgcXVhcmFudGluZWQgZGV2aWNlcyBvcHRpb25hbAo+IAo+IE9u
IDEzLjAzLjIwMjAgMDQ6MDUsIFRpYW4sIEtldmluIHdyb3RlOgo+ID4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxMCwgMjAy
MCA2OjMxIFBNCj4gPj4KPiA+PiBPbiAxMC4wMy4yMDIwIDA2OjMwLCBUaWFuLCBLZXZpbiB3cm90
ZToKPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Pj4+IFNl
bnQ6IE1vbmRheSwgTWFyY2ggOSwgMjAyMCA3OjA5IFBNCj4gPj4+Pgo+ID4+Pj4gQ29udGFpbmlu
ZyBzdGlsbCBpbiBmbGlnaHQgRE1BIHdhcyBpbnRyb2R1Y2VkIHRvIHdvcmsgYXJvdW5kIGNlcnRh
aW4KPiA+Pj4+IGRldmljZXMgLyBzeXN0ZW1zIGhhbmdpbmcgaGFyZCB1cG9uIGhpdHRpbmcgYSAi
bm90LXByZXNlbnQiIElPTU1VIGZhdWx0Lgo+ID4+Pj4gUGFzc2luZyB0aHJvdWdoIChzdWNoKSBk
ZXZpY2VzIChvbiBzdWNoIHN5c3RlbXMpIGlzIGluaGVyZW50bHkgaW5zZWN1cmUKPiA+Pj4+IChh
cyBndWVzdHMgY291bGQgZWFzaWx5IGFycmFuZ2UgZm9yIElPTU1VIGZhdWx0cyBvZiBhbnkga2lu
ZCB0byBvY2N1cikuCj4gPj4+PiBEZWZhdWx0aW5nIHRvIGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5
IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZgo+ID4+IGlzc3Vlcwo+ID4+Pj4gd2l0aCBkZXZpY2Vz
IGNhbiBiZSBjb25zaWRlcmVkIHVuZGVzaXJhYmxlLiBUaGVyZWZvcmUgY29udmVydCB0aGlzIG1v
ZGUKPiA+Pj4+IG9mIG9wZXJhdGlvbiB0byBhbiBvcHRpb25hbCBvbmUsIG5vdCBvbmUgZW5hYmxl
ZCBieSBkZWZhdWx0Lgo+ID4+Pgo+ID4+PiBIZXJlIGlzIGFub3RoZXIgdGhvdWdodC4gVGhlIHdo
b2xlIHBvaW50IG9mIHF1YXJhbnRpbmUgaXMgdG8gY29udGFpbgo+ID4+PiB0aGUgZGV2aWNlIGFm
dGVyIGl0IGlzIGRlYXNzaWduZWQgZnJvbSB1bnRydXN0ZWQgZ3Vlc3QuCj4gPj4KPiA+PiBJJ2Qg
cXVlc3Rpb24gdGhlICJ1bnRydXN0ZWQiIGhlcmUuIEFzc2lnbmluZyBkZXZpY2VzIHRvIHVudHJ1
c3RlZAo+ID4+IGd1ZXN0cyBpcyBwcm9ibGVtYXRpYyBhbnl3YXksIHVubGVzcyB5b3UncmUgdGhl
IGRldmljZSBtYW51ZmFjdHVyZXIKPiA+PiBhbmQgZGV2aWNlIGZpcm13YXJlIHdyaXRlciwgYW5k
IGhlbmNlIHlvdSBjYW4gZ3VhcmFudGVlIHRoZSBkZXZpY2UKPiA+PiB0byBub3Qgb2ZmZXIgYW55
IGJhY2tkb29ycyBvciBhbGlrZS4gVGhlcmVmb3JlIEkgdmlldyBxdWFyYW50aW5pbmcKPiA+Cj4g
PiBBcmVuJ3QgYWxsIGd1ZXN0cyB1bnRydXN0ZWQgZnJvbSBoeXBlcnZpc29yIHAuby52LCB3aGlj
aCBpcyB0aGUgcmVhc29uCj4gPiB3aHkgSU9NTVUgd2FzIGludHJvZHVjZWQgaW4gdGhlIGZpcnN0
IHBsYWNlPwo+IAo+ICJVbnRydXN0ZWQiIGlzIGFsd2F5cyBtZWFudCBmcm9tIHRoZSBwZXJzcGVj
dGl2ZSBvZiB0aGUgaG9zdCBhZG1pbi4KPiAKPiA+IEkgbWF5IG92ZXJsb29rIHRoZSBoaXN0b3J5
IG9mIHF1YXJhbnRpbmUgZmVhdHVyZS4gQmFzZWQgb24gbXkgc3R1ZHkKPiA+IG9mIHF1YXJhbnRp
bmUgcmVsYXRlZCBjaGFuZ2VzLCBsb29rcyBpbml0aWFsbHkgUGF1bCBwb2ludGVkIG91dCBzdWNo
Cj4gPiBwcm9ibGVtIHRoYXQgYSBkZXZpY2UgbWF5IGhhdmUgaW4tZmx5IERNQXMgdG8gdG91Y2gg
ZG9tMCBtZW1vcnkKPiA+IGFmdGVyIGl0IGlzIGRlYXNzaWduZWQuIFRoZW4gaGUgaW50cm9kdWNl
ZCB0aGUgcXVhcmFudGluZSBjb25jZXB0IGJ5Cj4gPiBwdXR0aW5nIGEgcXVhcmFudGluZWQgZGV2
aWNlIGludG8gZG9tX2lvIHcvbyBhbnkgdmFsaWQgbWFwcGluZywKPiA+IHdpdGggYSB3aGl0ZWxp
c3QgYXBwcm9hY2guIFlvdSBsYXRlciBleHRlbmRlZCBhcyBhIGRlZmF1bHQgYmVoYXZpb3IKPiA+
IGZvciBhbGwgUENJIGRldmljZXMuIE5vdyBQYXVsIGZvdW5kIHNvbWUgZGV2aWNlIHdoaWNoIGNh
bm5vdCB0b2xlcmF0ZQo+ID4gcmVhZC1mYXVsdCBhbmQgdGhlbiBjYW1lIHVwIHRoaXMgc2NyYXRj
aC1wYWdlIGlkZWEuCj4gPgo+ID4gTm93IEkgd29uZGVyIHdoeSB3ZSBhcmUgZG9pbmcgc3VjaCBl
eHBsaWNpdCBxdWFyYW50aW5lIGluIHRoZSBmaXJzdAo+ID4gcGxhY2UuIFNob3VsZG4ndCB3ZSBh
bHdheXMgc2VlayByZXNldHRpbmcgdGhlIGRldmljZSB3aGVuIGl0IGlzIGRlYXNzaWduZWQKPiA+
IGZyb20gYSBndWVzdD8gJ3Jlc2V0JyBzaG91bGQgY2FuY2VsL3F1aWVzY2VudCBhbGwgaW4tZmx5
IERNQXMgZm9yIG1vc3QKPiA+IGRldmljZXMgaWYgdGhleSBpbXBsZW1lbnQgJ3Jlc2V0JyBjb3Jy
ZWN0bHkuCj4gCj4gQW5kIHRoZSBpbXBvcnRhbnQgd29yZCBoZXJlIGlzICJzaG91bGQiLiBQYXVs
IGFuZCBjb2xsZWFndWVzIGZvdW5kCj4gaXQgbWF5IG5vdCBkbyBzbyBpbiByZWFsaXR5LgoKWWVh
aC4uLiB3ZSBoYXZlIHRvIGxpdmUgd2l0aCB3aGF0IHdlJ3ZlIGdvdC4gWWVzLCBpdCdzIGJ1Z2d5
IGFzIGhlbGwgYnV0IHdlIGhhdmUgdG8gZG8gb3VyIGJlc3QgdG8gc3RvcCBpdCB3ZWRnaW5nIGhv
c3RzIHdoaWxzdCB0cnlpbmcgdG8gcHJldmVudCBzY3JpYmJsaW5nIG92ZXIgY3JpdGljYWwgcGFy
dHMgb2YgbWVtb3J5LgoKPiAKPiA+IElmIGRvaW5nIHRoYXQgd2F5LCB3ZSBkb24ndAo+ID4gbmVl
ZCBhIHF1YXJhbnRpbmUgb3B0aW9uIGF0IGFsbCwgYW5kIHRoZW4gdGhlIGJvZ3VzIGRldmljZSBp
biBQYXVsJ3MKPiA+IGxhdGVzdCBmaW5kaW5nIGNvdWxkIGJlIGhhbmRsZWQgYnkgYSBzdGFuZGFs
b25lIG9wdGlvbiB3L28gc3RydWdnbGluZwo+ID4gd2hldGhlciAnZnVsbCcgaXMgYSByaWdodCBu
YW1lIHZzLiAnYmFzaWMnLiBvciB3ZSBtYXkgaW50cm9kdWNlIGEgcmVzZXQKPiA+IGZsYWcgd2hl
biBhc3NpZ25pbmcgc3VjaCBkZXZpY2UgdG8gaW5kaWNhdGUgc3VjaCBzcGVjaWFsIHJlcXVpcmVt
ZW50LAo+ID4gc28gYSBzY3JhdGNoIHBhZ2UvZG9tX2lvIGNhbiBiZSBsaW5rZWQgc3BlY2lmaWNh
bGx5IGZvciBzdWNoIGRldmljZQo+ID4gcG9zdCByZXNldCwgYXNzdW1pbmcgaXQgaXMgbm90IGEg
cGxhdGZvcm0tbGV2ZWwgYnVnIGZyb20gUGF1bCdzIHJlc3BvbnNlPwo+IAo+IFdoaWNoIHdvdWxk
IGltcGx5IGhvc3QgYWRtaW5zIHRvIGtub3cgc3VjaCBwcm9wZXJ0aWVzIG9mIHRoZWlyCj4gZGV2
aWNlcywgYW5kIGJldHRlciBfd2l0aG91dF8gZmlyc3QgaGF2aW5nIHJ1biBpbnRvIHByb2JsZW1z
Lgo+IAoKSXQgaXMgYSBkZXZpY2UtbGV2ZWwgYnVnLiBXZSBjb3VsZCwgSSBndWVzcywgaGF2ZSBh
IHBlci1kZXZpY2UgcXVpcmsgdG8gc2F5IHdoZXRoZXIgaXQgc2hvdWxkIGdldCBhIGNvbnRleHQg
ZW50cnkgcG9pbnRpbmcgYXQgYSBzY3JhdGNoIHBhZ2Ugb3Igbm90LgoKICBQYXVsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
