Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF210D926
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 18:47:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iakJg-0006ml-DJ; Fri, 29 Nov 2019 17:44:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Loh=ZV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iakJf-0006mg-D6
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 17:44:27 +0000
X-Inumbo-ID: e2d0448a-12cf-11ea-a3e7-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2d0448a-12cf-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 17:44:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a15so36152989wrf.9
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 09:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/yS8jPKu5RVfae2prnQ6ZsgpyCchRx/i+jdqMx/EC34=;
 b=Sajw+KZZksTtI9vN4Hs/Z910pQ/GdHei3s+WZ+QKKS+dnueJLX9vmABBh698exnwvz
 6OCER+RWAwwxjVAFLKrT7bExc2kMmQ80lT4QuLqvZbAC83fu/USWAkmXdZhtBgPbOlvB
 bfr9D6gdv2INyebvA4vIfjOBBuL6WP3YDs44+e7DWGs8/MQSGJtx5YLgKfZaMzCAUCwA
 Bn7g8sO14Uxw+MkrAyyccRqihc53xChggSUvQ43+VfQhDvM2zu+y7OoO6zc3cXK3EFtI
 hGSrs/RYR3Ji5nAj8uj09IcapZP3pKaG4nQ13zi2Pf9vNuozMehkfGevWFBWhGWC3gLU
 GZqQ==
X-Gm-Message-State: APjAAAX3wklNdIINniWIZ2i+jC9qW6eb7D3Gf2MX5FhhnELnOdNDzDV5
 pQnDeJMT6e1TciLUuOgXt0k=
X-Google-Smtp-Source: APXvYqzKuliDWSZ0LldiXQCytMoRfYHfWjEaLCEuu9CvUfJx4+uEOqv6PyMraaN3BKJMlwavquOW/w==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr37541739wrn.173.1575049465760; 
 Fri, 29 Nov 2019 09:44:25 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id 11sm15096660wmb.34.2019.11.29.09.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 09:44:25 -0800 (PST)
Date: Fri, 29 Nov 2019 17:44:23 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191129174423.hbzdjtcondvnbts2@debian>
References: <20191129172445.32664-1-pdurrant@amazon.com>
 <20191129173611.skfu63d4kqcysnoi@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129173611.skfu63d4kqcysnoi@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH-for-4.13 v7] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDU6MzY6MTFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwNToyNDo0NVBNICswMDAwLCBQYXVsIER1cnJhbnQg
d3JvdGU6Cj4gPiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
Cj4gPiAKPiA+IFhlbiB1c2VkIHRvIGhhdmUgc2luZ2xlLCBzeXN0ZW0td2lkZSBsaW1pdHMgZm9y
IHRoZSBudW1iZXIgb2YgZ3JhbnQKPiA+IGZyYW1lcyBhbmQgbWFwdHJhY2sgZnJhbWVzIGEgZ3Vl
c3Qgd2FzIGFsbG93ZWQgdG8gY3JlYXRlLiBJbmNyZWFzaW5nCj4gPiBvciBkZWNyZWFzaW5nIHRo
aXMgc2luZ2xlIGxpbWl0IG9uIHRoZSBYZW4gY29tbWFuZC1saW5lIHdvdWxkIGNoYW5nZQo+ID4g
dGhlIGxpbWl0IGZvciBhbGwgZ3Vlc3RzIG9uIHRoZSBzeXN0ZW0uCj4gPiAKPiA+IExhdGVyLCBw
ZXItZG9tYWluIGxpbWl0cyBmb3IgdGhlc2UgdmFsdWVzIHdhcyBjcmVhdGVkLiBUaGUgc3lzdGVt
LXdpZGUKPiA+IGxpbWl0cyBiZWNhbWUgc3RyaWN0IGxpbWl0czogZG9tYWlucyBjb3VsZCBub3Qg
YmUgY3JlYXRlZCB3aXRoIGhpZ2hlcgo+ID4gbGltaXRzLCBidXQgY291bGQgYmUgY3JlYXRlZCB3
aXRoIGxvd2VyIGxpbWl0cy4gSG93ZXZlciwgdGhhdCBjaGFuZ2UKPiA+IGFsc28gaW50cm9kdWNl
ZCBhIHJhbmdlIG9mIGRpZmZlcmVudCAiZGVmYXVsdCIgdmFsdWVzIGludG8gdmFyaW91cwo+ID4g
cGxhY2VzIGluIHRoZSB0b29sc3RhY2s6Cj4gPiAKPiA+IC0gVGhlIHB5dGhvbiBsaWJ4YyBiaW5k
aW5ncyBoYXJkLWNvZGVkIHRoZXNlIHZhbHVlcyB0byAzMiBhbmQgMTAyNCwKPiA+ICAgcmVzcGVj
dGl2ZWx5Cj4gPiAtIFRoZSBsaWJ4bCBkZWZhdWx0IHZhbHVlcyBhcmUgMzIgYW5kIDEwMjQgcmVz
cGVjdGl2ZWx5Lgo+ID4gLSB4bCB3aWxsIHVzZSB0aGUgbGlieGwgZGVmYXVsdCBmb3IgbWFwdHJh
Y2ssIGJ1dCBkb2VzIGl0cyBvd24gZGVmYXVsdAo+ID4gICBjYWxjdWxhdGlvbiBmb3IgZ3JhbnQg
ZnJhbWVzOiBlaXRoZXIgMzIgb3IgNjQsIGJhc2VkIG9uIHRoZSBtYXgKPiA+ICAgcG9zc2libGUg
bWZuLgo+ID4gCj4gPiBUaGVzZSBkZWZhdWx0cyBpbnRlcmFjdCBwb29ybHkgd2l0aCB0aGUgaHlw
ZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQ6Cj4gPiAKPiA+IC0gVGhlIGh5cGVydmlzb3IgY29t
bWFuZC1saW5lIGxpbWl0IGNhbm5vdCBiZSB1c2VkIHRvIHJhaXNlIHRoZSBsaW1pdAo+ID4gICBm
b3IgYWxsIGd1ZXN0cyBhbnltb3JlLCBhcyB0aGUgZGVmYXVsdCBpbiB0aGUgdG9vbHN0YWNrIHdp
bGwKPiA+ICAgZWZmZWN0aXZlbHkgb3ZlcnJpZGUgdGhpcy4KPiA+IC0gSWYgeW91IHVzZSB0aGUg
aHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQgdG8gKnJlZHVjZSogdGhlIGxpbWl0LAo+ID4g
ICB0aGVuIHRoZSAiZGVmYXVsdCIgdmFsdWVzIGdlbmVyYXRlZCBieSB0aGUgdG9vbHN0YWNrIGFy
ZSB0b28gaGlnaCwKPiA+ICAgYW5kIGFsbCBndWVzdCBjcmVhdGlvbnMgd2lsbCBmYWlsLgo+ID4g
Cj4gPiBJbiBvdGhlciB3b3JkcywgdGhlIHRvb2xzdGFjayBkZWZhdWx0cyByZXF1aXJlIGFueSBj
aGFuZ2UgdG8gYmUKPiA+IGVmZmVjdGVkIGJ5IGhhdmluZyB0aGUgYWRtaW4gZXhwbGljaXRseSBz
cGVjaWZ5IGEgbmV3IHZhbHVlIGluIGV2ZXJ5Cj4gPiBndWVzdC4KPiA+IAo+ID4gSW4gb3JkZXIg
dG8gYWRkcmVzcyB0aGlzLCBoYXZlIGdyYW50X3RhYmxlX2luaXQgdHJlYXQgbmVnYXRpdmUgdmFs
dWVzCj4gPiBmb3IgbWF4X2dyYW50X2ZyYW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBhcyBp
bnN0cnVjdGlvbnMgdG8gdXNlIHRoZQo+ID4gc3lzdGVtLXdpZGUgZGVmYXVsdCwgYW5kIGhhdmUg
YWxsIHRoZSBhYm92ZSB0b29sc3RhY2tzIGRlZmF1bHQgdG8gcGFzc2luZwo+ID4gLTEgdW5sZXNz
IGEgZGlmZmVyZW50IHZhbHVlIGlzIGV4cGxpY2l0bHkgY29uZmlndXJlZC4KPiA+IAo+ID4gVGhp
cyByZXN0b3JlcyB0aGUgb2xkIGJlaGF2aW9yIGluIHRoYXQgY2hhbmdpbmcgdGhlIGh5cGVydmlz
b3IgY29tbWFuZC1saW5lCj4gPiBvcHRpb24gY2FuIGNoYW5nZSB0aGUgYmVoYXZpb3IgZm9yIGFs
bCBndWVzdHMsIHdoaWxlIHJldGFpbmluZyB0aGUgYWJpbGl0eQo+ID4gdG8gc2V0IHBlci1ndWVz
dCB2YWx1ZXMuICBJdCBhbHNvIHJlbW92ZXMgdGhlIGJ1ZyB0aGF0IHJlZHVjaW5nIHRoZQo+ID4g
c3lzdGVtLXdpZGUgbWF4IHdpbGwgY2F1c2UgYWxsIGRvbWFpbnMgd2l0aG91dCBleHBsaWNpdCBs
aW1pdHMgdG8gZmFpbC4KPiA+IAo+ID4gTk9URTogLSBUaGUgT2NhbWwgYmluZGluZ3MgcmVxdWly
ZSB0aGUgY2FsbGVyIHRvIGFsd2F5cyBzcGVjaWZ5IGEgdmFsdWUsCj4gPiAgICAgICAgIGFuZCB0
aGUgY29kZSB0byBzdGFydCBhIHhlbnN0b3JlZCBzdHViZG9tYWluIGhhcmQtY29kZXMgdGhlc2Ug
dG8gNAo+ID4gCWFuZCAxMjggcmVzcGVjdGl2ZWx5OyB0aGlzIGJlaGF2b3VyIHdpbGwgbm90IGJl
IG1vZGlmaWVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpJbiB0aGVvcnkgSSBz
aG91bGQgd2FpdCBmb3IgTWFyZWsncyBhY2sgZm9yIGNoYW5nZXMgdG8gcHl0aG9uIGJpbmRpbmcs
CmJ1dCB0aGUgY2hhbmdlcyBhcmUgdHJpdmlhbCB0aGVyZSBzbyBJIHBsYW4gdG8gcHVzaCB0aGlz
IHBhdGNoIGxhdGVyCnRvbmlnaHQgdG8gYm90aCBzdGFnaW5nIGFuZCBzdGFnaW5nLTQuMTMgc28g
dGhhdCBpdCBjYW4gYmUgdGVzdGVkIG92ZXIKdGhlIHdlZWtlbmQuCgpNYXJlaywgSSBhcG9sb2dp
c2UgaW4gYWR2YW5jZSBpbiBjYXNlIHlvdSBkaXNhZ3JlZSB3aXRoIG15IGFzc2Vzc21lbnQuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
