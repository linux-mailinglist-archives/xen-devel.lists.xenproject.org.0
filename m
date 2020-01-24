Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2014789A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 07:36:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iusVz-0002Ey-LX; Fri, 24 Jan 2020 06:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N1tL=3N=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1iusVy-0002Et-5U
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 06:32:22 +0000
X-Inumbo-ID: 4693cbee-3e73-11ea-b833-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4693cbee-3e73-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 06:32:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w47so743114qtk.4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 22:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YSOjP9t3Qp0ku6Q8pEO918zSn1Ag2RAEJZlCm/7bInY=;
 b=leGy9UEYzaFConSl04EYhM42RL+3biH/D+bA8TOvdqfEaQTb96WtLj3lUwwEC3JmWM
 tlRdJSke1+218ugsYyGxHxcA46pO23GUHrNyOYocpRpI41btP5gqNyNcNLC/jeMMGwkO
 NANwPhkaJoGDSlGBfyAm2uKmw5l2mvMMFKjK+iFXkqxYR06ILnXuYQPploTOkumVxm+3
 a91ELQC2OaR8aT798cQpRaRNBYnMKrPNM3RZbJPNQgfiw2YrQT+kW2WQFoPvf4lDytT7
 DG7+0uPUtltHL8aOba4g9WaNenSWLtVTfMylpAGLOnYWBZPLpUQq3tisqfhxwAqwQg32
 jImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YSOjP9t3Qp0ku6Q8pEO918zSn1Ag2RAEJZlCm/7bInY=;
 b=gPcXmCNwfzeZ3HbpH/ZdyqJpm3wj5f5Xolrs3Tjp4LFV2Yqtq+4Gwh1RPK5CeQN33/
 ++9uIpHgvekkKSksJErvRj/AYEyB/aB29H+GAgSXHqLhDXt+WY+E6PO0ntxIgjgdfii5
 gzrIf0Awi2d+kgnIECBDxl8IeeGzUVnn6+aD/h8/6CbG7F5gjw0eR5d2A4NyS3NVz/xm
 jdaf+IbuFUp0s9yCHPgpkG35XZCm/HL++L40c4gBiADsX+VmYaLUEb/z6akKYn96Xg88
 6NPX2VvWMHIBcYXvbJ+iAmAq3MDbM0Y3VA8OgDIeSvxOeRl+1qKfAaPoZ+O4xAoxlNq5
 uGQA==
X-Gm-Message-State: APjAAAUTyl+Msbg/AYm0/bMctX1taCUqt1I3anmZ2VIvUs3iYFMXDeht
 FYf6eNGRcZgfmxAYIG7hW/0=
X-Google-Smtp-Source: APXvYqyxcO1TUjAkBmEG29KiWggF+dRPMNmxgEld562L3Yy/Dxv5iJ+9K+9XBezDRCLSYNckO8FeRA==
X-Received: by 2002:ac8:5555:: with SMTP id o21mr796978qtr.350.1579847541113; 
 Thu, 23 Jan 2020 22:32:21 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id z6sm2417896qkz.101.2020.01.23.22.32.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 22:32:20 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7C2FC21C28;
 Fri, 24 Jan 2020 01:32:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 24 Jan 2020 01:32:18 -0500
X-ME-Sender: <xms:cY8qXuJ6MmoFxGQbXAkqv2cGIbThPy8yy0e0dg_Bf1qvWxjVUiIX3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdefgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucffohhmrghinh
 epkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpihhnfhhrrgguvggrugdrohhr
 ghenucfkphephedvrdduheehrdduuddurdejudenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
 shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
 hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:cY8qXgJ8JkuuIgtY9MuYYKNswDWHFVOKcFwAWns9buJuaB1ckiSTXQ>
 <xmx:cY8qXlUn48io2mb2PVJsfW9bxgsbtyfocObcKIGhYJsNKZBQRhi-Rg>
 <xmx:cY8qXhkbInfA2b0zRwbYtLa9YS2tz78hxn7ZZ2QfTYDQ3KYty0HhqA>
 <xmx:co8qXpTaafBPT_QxTLx7DvvOo53z1AhGiRqFr3tNpAO8aSOdtAraHz_CBNs>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id D70F6328005A;
 Fri, 24 Jan 2020 01:32:16 -0500 (EST)
Date: Fri, 24 Jan 2020 14:32:15 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <20200124063215.GA93938@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
 <ef6cb7ba-b448-cfa5-abbb-1d99d1396ce5@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef6cb7ba-b448-cfa5-abbb-1d99d1396ce5@arm.com>
Subject: Re: [Xen-devel] [RFC 0/6] vDSO support for Hyper-V guest on ARM64
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
 Michael Kelley <mikelley@microsoft.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmluY2Vuem8sCgpPbiBUaHUsIEphbiAyMywgMjAyMCBhdCAxMDo0ODowN0FNICswMDAwLCBW
aW5jZW56byBGcmFzY2lubyB3cm90ZToKPiBIaSBCb3F1biBGZW5nLAo+IAo+IHNvcnJ5IGZvciB0
aGUgbGF0ZSByZXBseS4KPiAKClRoYXQncyBPSywgdGhhbmtzIGZvciB5b3VyIHJldmlldyA7LSkK
Cj4gT24gMTYvMTIvMjAxOSAwMDoxOSwgQm9xdW4gRmVuZyB3cm90ZToKPiA+IEhpLAo+ID4gCj4g
PiBUaGlzIGlzIHRoZSBSRkMgcGF0Y2hzZXQgZm9yIHZEU08gc3VwcG9ydCBpbiBBUk02NCBIeXBl
ci1WIGd1ZXN0LiBUbwo+ID4gdGVzdCBpdCwgTWljaGFlbCdzIEFSTTY0IHN1cHBvcnQgcGF0Y2hz
ZXQ6Cj4gPiAKPiA+IAlodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzE1
NzAxMjkzNTUtMTYwMDUtMS1naXQtc2VuZC1lbWFpbC1taWtlbGxleUBtaWNyb3NvZnQuY29tLwo+
ID4gCj4gPiBpcyBuZWVkZWQuCj4gPiAKPiA+IFNpbWlsYXIgYXMgeDg2LCBIeXBlci1WIG9uIEFS
TTY0IHVzZSBhIFRTQyBwYWdlIGZvciBndWVzdHMgdG8gcmVhZAo+ID4gdGhlIHZpcnR1YWxpemVk
IGhhcmR3YXJlIHRpbWVyLCB0aGlzIFRTQyBwYWdlIGlzIHJlYWQtb25seSBmb3IgdGhlCj4gPiBn
dWVzdHMsIHNvIGNvdWxkIGJlIHVzZWQgZm9yIHZEU08gZGF0YSBwYWdlLiBBbmQgdGhlIHZEU08g
KHVzZXJzcGFjZSkKPiA+IGNvZGUgY291bGQgdXNlIHRoZSBzYW1lIGNvZGUgZm9yIHRpbWVyIHJl
YWRpbmcgYXMga2VybmVsLCBzaW5jZQo+ID4gdGhleSByZWFkIHRoZSBzYW1lIFRTQyBwYWdlLgo+
ID4gCj4gCj4gSSBoYWQgYSBsb29rIHRvIHlvdXIgcGF0Y2hlcyBhbmQgb3ZlcmFsbCwgSSBjb3Vs
ZCBub3QgdW5kZXJzdGFuZCB3aHkgd2UgY2FuJ3QKPiB1c2UgdGhlIGFyY2hfdGltZXIgdG8gZG8g
dGhlIHNhbWUgdGhpbmdzIHlvdSBhcmUgZG9pbmcgd2l0aCB0aGUgb25lIHlvdQo+IGludHJvZHVj
ZWQgaW4gdGhpcyBzZXJpZXMuIFdoYXQgY29uZnVzZXMgbWUgaXMgdGhhdCBLVk0gd29ya3MganVz
dCBmaW5lIHdpdGggdGhlCj4gYXJjaF90aW1lciB3aGljaCB3YXMgZGVzaWduZWQgd2l0aCB2aXJ0
dWFsaXphdGlvbiBpbiBtaW5kLiBXaHkgZG8gd2UgbmVlZAo+IGFub3RoZXIgb25lPyBDb3VsZCB5
b3UgcGxlYXNlIGV4cGxhaW4/Cj4gCgpQbGVhc2Ugbm90ZSB0aGF0IHRoZSBndWVzdCBWTSBvbiBI
eXBlci1WIGZvciBBUk02NCBkb2Vzbid0IHVzZQphcmNoX3RpbWVyIGFzIHRoZSBjbG9ja3NvdXJj
ZS4gU2VlOgoKCWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMTU3MDEy
OTM1NS0xNjAwNS03LWdpdC1zZW5kLWVtYWlsLW1pa2VsbGV5QG1pY3Jvc29mdC5jb20vCgosICBB
Q1BJX1NJR19HVERUIGlzIHVzZWQgZm9yIHNldHRpbmcgdXAgSHlwZXItViBzeW50aGV0aWMgY2xv
Y2tzb3VyY2UKYW5kIG90aGVyIGluaXRpYWxpemF0aW9uIHdvcmsuCgpTbyBqdXN0IHRvIGJlIGNs
ZWFyLCB5b3VyIHN1Z2dlc3Rpb24gaXMKCjEpIEh5cGVyLVYgZ3Vlc3Qgb24gQVJNNjQgc2hvdWxk
IHVzZSBhcmNoX3RpbWVyIGFzIGNsb2Nrc291cmNlIGFuZCB2RFNPCndpbGwganVzdCB3b3JrLgoK
b3IKCjIpIEV2ZW4gdGhvdWdoIGFyY2hfdGltZXIgaXMgbm90IHVzZWQgYXMgdGhlIGNsb2Nrc291
cmNlLCB3ZSBjYW4gc3RpbGwKdXNlIGl0IGZvciB2RFNPLgoKPwoKUmVnYXJkcywKQm9xdW4KCj4g
PiBUaGlzIHBhdGNoc2V0IHRoZXJlZm9yZSBleHRlbmRzIEFSTTY0J3MgX192c2RvX2luaXQoKSB0
byBhbGxvdyBtdWx0aXBsZQo+ID4gZGF0YSBwYWdlcyBhbmQgaW50cm9kdWNlcyB0aGUgdmNsb2Nr
X21vZGUgY29uY2VwdCBzaW1pbGFyIHRvIHg4NiB0bwo+ID4gYWxsb3cgZGlmZmVyZW50IHBsYXRm
b3JtcyAoYmFyZS1tZXRhbCwgSHlwZXItViwgZXRjLikgdG8gc3dpdGNoIHRvCj4gPiBkaWZmZXJl
bnQgX19hcmNoX2dldF9od19jb3VudGVyKCkgaW1wbGVtZW50YXRpb25zLiBUaGUgcmVzdCBvZiB0
aGlzCj4gPiBwYXRjaHNldCBkb2VzIHRoZSBuZWNlc3Nhcnkgc2V0dXAgZm9yIEh5cGVyLVYgZ3Vl
c3RzOiBtYXBwaW5nIHRzYyBwYWdlLAo+ID4gZW5hYmxpbmcgdXNlcnNwYWNlIHRvIHJlYWQgY250
dmN0LCBldGMuIHRvIGVuYWJsZSB2RFNPLgo+ID4gCj4gPiBUaGlzIHBhdGNoc2V0IGNvbnNpc3Rz
IG9mIDYgcGF0Y2hlczoKPiA+IAo+ID4gcGF0Y2ggIzEgYWxsb3dzIGh2X2dldF9yYXdfdGltZXIo
KSBkZWZpbml0aW9uIHRvIGJlIG92ZXJyaWRkZW4gZm9yCj4gPiB1c2Vyc3BhY2UgYW5kIGtlcm5l
bCB0byBzaGFyZSB0aGUgc2FtZSBodl9yZWFkX3RzY19wYWdlKCkgZGVmaW5pdGlvbi4KPiA+IAo+
ID4gcGF0Y2ggIzIgZXh0ZW5kcyBBUk02NCB0byBzdXBwb3J0IG11bHRpcGxlIHZEU08gZGF0YSBw
YWdlcy4KPiA+IAo+ID4gcGF0Y2ggIzMgaW50cm9kdWNlcyB2Y2xvY2tfbW9kZSBzaW1pbGlhciB0
byB4ODYgdG8gYWxsb3cgZGlmZmVyZW50Cj4gPiBfX2FyY2hfZ2V0X2h3X2NvdW50ZXIoKSBpbXBs
ZW1lbnRhdGlvbnMgZm9yIGRpZmZlcmVudCBjbG9ja3NvdXJjZXMuCj4gPiAKPiA+IHBhdGNoICM0
IG1hcHMgSHlwZXItViBUU0MgcGFnZSBpbnRvIHZEU08gZGF0YSBwYWdlLgo+ID4gCj4gPiBwYXRj
aCAjNSBhbGxvd3MgdXNlcnNwYWNlIHRvIHJlYWQgY250dmN0LCBzbyB0aGF0IHVzZXJzcGFjZSBj
YW4KPiA+IGVmZmljaWVudGx5IHJlYWQgdGhlIGNsb2Nrc291cmNlLgo+ID4gCj4gPiBwYXRjaCAj
NiBlbmFibGVzIHRoZSB2RFNPIGZvciBBUk02NCBIeXBlci1WIGd1ZXN0Lgo+ID4gCj4gPiBUaGUg
d2hvbGUgcGF0Y2hzZXQgaXMgYmFzZWQgb24gdjUuNS1yYzEgcGx1cyBNaWNoYWVsJ3MgQVJNNjQg
c3VwcG9ydAo+ID4gcGF0Y2hzZXQsIGFuZCBJJ3ZlIGRvbmUgYSBmZXcgdGVzdHMgd2l0aDoKPiA+
IAo+ID4gCWh0dHBzOi8vZ2l0aHViLmNvbS9ubHluY2gtbWVudG9yL3Zkc290ZXN0Cj4gPiAKPiA+
IENvbW1lbnRzIGFuZCBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZSEKPiA+IAo+ID4gUmVnYXJkcywK
PiA+IEJvcXVuCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKPiA+IAo+IAo+IC0tIAo+IFJlZ2Fy
ZHMsCj4gVmluY2Vuem8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
