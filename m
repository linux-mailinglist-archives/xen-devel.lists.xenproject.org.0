Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578A1156BEC
	for <lists+xen-devel@lfdr.de>; Sun,  9 Feb 2020 19:02:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0qs8-0003W1-D9; Sun, 09 Feb 2020 17:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=umcO=35=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j0qs7-0003Vw-4u
 for xen-devel@lists.xenproject.org; Sun, 09 Feb 2020 17:59:55 +0000
X-Inumbo-ID: f9561f4e-4b65-11ea-b2cb-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9561f4e-4b65-11ea-b2cb-bc764e2007e4;
 Sun, 09 Feb 2020 17:59:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a6so1354676wme.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Feb 2020 09:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6fie44eFGCtrQ2ljvQciOBwqxDIRSbpOl+z33z3gAuY=;
 b=DOGltTX0BpSCHdHIrlODoskjVHCrBKINGkS3+/FwzNzD9MKmfDzNwBBmvV25TfZ+ZB
 y5mg7sRT1rjT4qAq0n/01E3MIYkeN0cdZ8dqdInR52h8i3lElq1MfYq6OHfShWTot2Tu
 9H+XvZRmZ//gFzY4fzFLF4rYH6uzRmsN3bujyMgB69SFFN9/aBEkNmLTMBMKwIFnaJ8w
 sHSXsiZtVBaTu+tEmjW9tFpApJaQ9LTmrJyGde74/Fx69Dm45ixya8KDLnQq0/igbDKk
 6bOoXXHyfgQyzIsDy319aD1Z+wKXmX0nXy9uGxL+nJtgfW4kHtPCFIS3CEGhls46POal
 Uc5A==
X-Gm-Message-State: APjAAAUdd82PIhL5NDZYIlafRKXFo0Ki3E7tR6jjY4D9C8upEBgO3L8Y
 NVx2A2MAc4kpFCHTyBBWfDc=
X-Google-Smtp-Source: APXvYqwd/0QQWtJKpvKwSeVReV6SYlO4RN2JLVA9B9StDMy+bm/GCCtDxVi+fvLA79LSeQmOvfBBCQ==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr10996146wmi.10.1581271193098; 
 Sun, 09 Feb 2020 09:59:53 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id y185sm12545912wmg.2.2020.02.09.09.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2020 09:59:52 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, Jan Beulich <jbeulich@suse.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-1-dwmw2@infradead.org>
 <28e1dfce-b4c5-7c73-0574-48fc4179443e@xen.org>
 <d0072bd4be2151e1ad768f948f541694bb062d94.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <087ba1dc-8838-91f3-058c-28e6b798fd85@xen.org>
Date: Sun, 9 Feb 2020 17:59:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d0072bd4be2151e1ad768f948f541694bb062d94.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state
 bits
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOS8wMi8yMDIwIDEzOjIyLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gT24gRnJpLCAy
MDIwLTAyLTA3IGF0IDIwOjI3ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENvdWxkIHlv
dSBwbGVhc2Ugc2VuZCB0aGUgc2VyaWVzIGluIGEgc2VwYXJhdGUgdGhyZWFkPyBTbyB3ZSBkb24n
dCBtaXgKPj4gdGhlIHR3byBkaXNjdXNzaW9ucyAoaS5lIG1lcmdlIGFuZCBmcmVlIG9uIGJvb3Qg
YWxsb2NhdGVkIHBhZ2UpIHRvZ2V0aGVyLgo+IAo+IFdlbGwsIHRoZXkncmUgYWxsIHBhcnQgb2Yg
dGhlIHNhbWUgbWVzcywgcmVhbGx5LgoKU2VuZGluZyBhIHNlcmllcyBpbiB0aGUgbWlkZGxlIG9m
IGFub3RoZXIgc2VyaWVzIGlzIGFsd2F5cyBtb3JlIApkaWZmaWN1bHQgdG8gdHJhY2sgOikuIFRo
ZSBtb3JlIGlmIHRoZXkgYXJlIGhhbmRsZWQgYnkgdHdvIGRpZmZlcmVudCAKcGVyc29uLi4uCgo+
IAo+IFRoZXJlIGFyZSBjYXNlcyB3aGVyZSBwYWdlcyBlbmQgdXAgaW4gZnJlZV9oZWFwX3BhZ2Vz
KCkgd2hpY2ggd2VyZQo+IG5ldmVyIHZldHRlZCBieSBpbml0X2hlYXBfcGFnZXMoKS4gV2hpbGUg
dGhhdCBub3JtYWxseSB3b3JrcyBqdXN0IGZpbmUKPiDigJQgdG8gdGhlIGV4dGVudCB0aGF0IHdl
J3ZlIG5ldmVyIHJlYWxseSBjYXJlZCDigJQgdGhlIGhhY2sgZXhjbHVkaW5nIE1GTjAKPiBpcyBv
bmUgb2YgdGhlIHRoaW5ncyB0aGF0IGdldHMgJ21pc3NlZCcgZm9yIHN1Y2ggcGFnZXMuCj4gCj4g
SSB3YXMgb25seSBsb29raW5nIGF0IHRoaXMgYmVjYXVzZSB0aGUgZWFybHkgdm1hcCBzdXBwb3J0
IG1ha2VzIGl0IGEKPiB0aW55IGJpdCBtb3JlIGxpa2VseSB0aGF0IHNvbWUgcGFnZXMgd2lsbCBi
ZSBmcmVlZCB0aGF0IHdheSBhZnRlciBiZWluZwo+IGdpdmVuIG91dCBieSB0aGUgYm9vdCBhbGxv
Y2F0b3IsIGJ1dCB0aGVyZSB3ZXJlIHBsZW50eSBvZiByZWFzb25zIGl0Cj4gbWlnaHQgaGFwcGVu
IGFscmVhZHkuCj4gCj4gVGhlc2UgcGF0Y2hlcyBiYXNpY2FsbHkgbGVnaXRpbWlzZSB0aGF0IOKA
lCB3ZSBtYWtlIGl0IE9LIGZvcgo+IGZyZWVfaGVhcF9wYWdlcygpIHRvIGJlIGdpdmVuIGEgcmFu
Z2Ugd2hpY2ggd2FzIG5ldmVyIGluIHRoZSBoZWFwIGluCj4gdGhlIGZpcnN0IHBsYWNlLiBBbmQg
aW4gc28gZG9pbmcsIHdlIGZpeCB0aGUgTUZOMC96b25lIG1lcmdlIHRyaWNrIGV2ZW4KPiB3aGVu
IChmb3IgZXhhbXBsZSkgTUZOMCB3YXMgcGFydCBvZiB0aGUgZG9tMCBpbml0cmFtZnMgYW5kIGFz
c2lnbmVkCj4gZGlyZWN0bHksIGJ1dCBnZXRzIGZyZWVkIHVwIGxhdGVyLgo+IAo+IEJ1dCBzdXJl
LCBoYXZpbmcgZmFpbGVkIHRvIGVsaWNpdCBhbnkgc2NyZWFtcyBvZiAiZG9uJ3QgZG8gaXQgbGlr
ZQo+IHRoYXQiLCBJJ2xsIGZpeCB1cCB0aGUgdGhpbmdzIHlvdSBwb2ludGVkIG91dCBhbmQgSSds
bCByZXBvc3QgaXQgYXMKPiBwYXJ0IG9mIHRoZSBzZXJpZXMgY29udGFpbmluZyB0aGUgZWFybHkg
dm1hcCgpIHN1cHBvcnQsIHNpbmNlIHRoYXQncwo+IHdoeSBJJ20gd29ya2luZyBvbiBpdC4KPiAK
PiBBbHRob3VnaCBhdCB0aGlzIHBvaW50IEknbSBoYWxmIHRlbXB0ZWQgdG8gZGVjbGFyZSB0aGF0
IHRoZXJlIGFyZSAqc28qCj4gbWFueSB3YXlzIHRoaXMgY2FuIGhhcHBlbiBhbHJlYWR5LCB0aGF0
IHRoZSB0aW55IGxpdHRsZSBiaXQgdGhhdCBpdCdzCj4gbWFkZSBtb3JlIGxpa2VseSBieSB0aGUg
ZWFybHkgdm1hcCgpIHN1cHBvcnQgaXMgYmFzaWNhbGx5IGluIHRoZSBub2lzZS4KPiAKPiBJbiB0
aGF0IGNhc2Ugd2UgY2FuIHNlcGFyYXRlIHRoZXNlIHBhdGNoZXMgb3V0IGFzIGFuIGluZGVwZW5k
ZW50IGZpeAo+IHJhdGhlciB0aGFuIGEgZGVwZW5kZW5jeSBvZiBlYXJseSB2bWFwLgoKSSBoYWRu
J3QgcmVhbGl6ZSBob3cgbWVzc3kgaXQgd2FzIGJlY2F1c2UgSSBoYWQgQXJtIGluIG1pbmQgYW5k
IHdhc24ndCAKZXhwZWN0ZWQgeDg2IHRvIGFidXNlIHNvIG11Y2ggdGhlIGludGVyZmFjZS4KCkZv
ciB4ODYsIEkgYWdyZWUgdGhhdCB0aGlzIGlzIG5vaXNlIGFzIHRoZXkgYXJlIGFidXNpbmcgdGhl
IGludGVyZmFjZSAKcHJldHR5IG11Y2ggZXZlcnl3aGVyZS4KCkhvd2V2ZXIsIG9uIEFybSB0aGVy
ZSBpcyBvbmx5IG9uZSBwbGFjZSB0aGF0IGlzIGFidXNpbmcgdGhlIGludGVyZmFjZS4gCkl0IGlz
IGluIHRoZSBBQ1BJIGNvZGUsIGFsdGhvdWdoIEkgdGhpbmsgaXQgd2lsbCBiZSBqdXN0IGEgbGVh
ayBnaXZlbiAKdGhlIGltcGxlbWVudGF0aW9uIG9mIGFjcGlfb3NfZnJlZV9tZW1vcnkoKS4gQXMg
d2UgZG9uJ3QgZnJlZSAKcGFnZS10YWJsZXMgeWV0IG9uIEFybSwgdGhlIGludHJvZHVjdGlvbiBv
ZiB0aGUgZWFybHkgdm1hcCB3b3VsZCBub3QgCmludHJvZHVjZSBhbnkgbW9yZSBhYnVzZSBvbiBB
cm0uCgpJdCB3b3VsZCBvYnZpb3VzbHkgbmljZSB0byBmaXggaXQsIGJ1dCBhcyB5b3Ugc2FpZCB0
aGlzIGlzIG5vaXNlIG9uIHg4Ni4gClNvIHRoYXQncyByZWFsbHkgdXAgdG8gdGhlIHg4NiBmb2xr
cyAoQW5kcmV3LCBHZW9yZ2UsIEphbikgdG8gc2VlIAp3aGV0aGVyIHlldCBhbm90aGVyIGFidXNl
IGlzIG9rIGZvciB0aGVtIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
