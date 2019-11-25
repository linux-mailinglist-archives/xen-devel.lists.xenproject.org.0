Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47C108E5B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 14:01:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZDwC-00011c-Vr; Mon, 25 Nov 2019 12:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RAVF=ZR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZDwB-00011T-Br
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 12:57:55 +0000
X-Inumbo-ID: 320eeee8-0f83-11ea-b08b-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 320eeee8-0f83-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 12:57:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id j18so16143156wmk.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 04:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gd20+kf3hOgWvHX+9gxx9FLK1JoHnxf+24HdySyPvFM=;
 b=JoRnqA96D9bDEddki5sKgh3lZOHg0rnTD+De9zFrgwKts+NlfPFFnTvi8ca2F55BKL
 1WpCNW5Jil6Xox5MeVoFRajX4L4t/hQj6srq71cjMnWsBFfyf67J/Pw2z/a3i2F7oW2i
 OQXs1cNravomtQnl00RslK4BVZ2F6Af4SCoMHNqdMI4OHKssyXnxK7bRRWGkJQ5crumt
 DWUK4SL3NXeLFvD5hlI9ida0/Wu3XLlpVeNoTM4wJHgec+46GVj/qlyFfxnAqtuCNyLL
 RlwH1ncXIvSfFk9LREeTcVtHrgZ5C+Dt7sQTrap/9O26qwAz+k+TA59jKdkGvDj2E2hy
 HnAQ==
X-Gm-Message-State: APjAAAXUEdG2cda0Hqp5GpZfPxs6bbuWuhnBjwp0BbVybmOs3cL4xf/T
 V+9VkRYURqTT5tFBI9bouY8=
X-Google-Smtp-Source: APXvYqziuMboAgL0RMsDdfSo7h+jZ/E2FlP8fEvi2t7RyZCNqPZgm2OJDnCta2x/kBE2Fw1HOPhLEg==
X-Received: by 2002:a1c:de88:: with SMTP id v130mr30110792wmg.89.1574686673995; 
 Mon, 25 Nov 2019 04:57:53 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id v20sm8673565wmj.32.2019.11.25.04.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 04:57:53 -0800 (PST)
Date: Mon, 25 Nov 2019 12:57:51 +0000
From: Wei Liu <wl@xen.org>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20191125125751.bgriplkxu6loqttb@debian>
References: <20191125123923.2000028-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125123923.2000028-1-george.dunlap@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH RFC] x86: Don't increase ApicIdCoreSize past
 7
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
Cc: Juergen Gross <jgross@suse.com>, Steven Haigh <netwiz@crc.id.au>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTI6Mzk6MjNQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBDaGFuZ2VzZXQgY2EyZWVlOTJkZjQ0ICgieDg2LCBodm06IEV4cG9zZSBob3N0IGNv
cmUvSFQgdG9wb2xvZ3kgdG8gSFZNCj4gZ3Vlc3RzIikgYXR0ZW1wdGVkIHRvICJmYWtlIHVwIiBh
IHRvcG9sb2d5IHdoaWNoIHdvdWxkIGluZHVjZSBndWVzdAo+IG9wZXJhdGluZyBzeXN0ZW1zIHRv
IG5vdCB0cmVhdCB2Y3B1cyBhcyBzaWJsaW5nIGh5cGVydGhyZWFkcy4gIFRoaXMKPiBpbnZvbHZl
ZCBhY3R1YWxseSByZXBvcnRpbmcgaHlwZXJ0aHJlYWRpbmcgYXMgYXZhaWxhYmxlLCBidXQgZ2l2
aW5nCj4gdmNwdXMgZXZlcnkgb3RoZXIgQXBpY0lkOyB3aGljaCBpbiB0dXJuIGxlZCB0byBkb3Vi
bGluZyB0aGUgQXBpY0lkcwo+IHBlciBjb3JlIGJ5IGJ1bXBpbmcgdGhlIEFwaWNJZENvcmVTaXpl
IGJ5IG9uZS4gIEluIHBhcnRpY3VsYXIsIFJ5emVuCj4gM3h4eCBzZXJpZXMgcHJvY2Vzc29ycywg
YW5kIHJlcG9ydGVkbHkgRVBZQyAiUm9tZSIgY3B1cyAtLSBoYXZlIGFuCj4gQXBpY0lkQ29yZVNp
emUgb2YgNzsgdGhlICJmYWtlIiB0b3BvbG9neSBpbmNyZWFzZXMgdGhpcyB0byA4Lgo+IAo+IFVu
Zm9ydHVuYXRlbHksIFdpbmRvd3MgcnVubmluZyBvbiBtb2Rlcm4gQU1EIGhhcmR3YXJlIC0tIGlu
Y2x1ZGluZwo+IFJ5emVuIDN4eHggc2VyaWVzIHByb2Nlc3NvcnMsIGFuZCByZXBvcnRlZGx5IEVQ
WUMgIlJvbWUiIGNwdXMgLS0KPiBkb2Vzbid0IHNlZW0gdG8gY29wZSB3aXRoIHRoaXMgdmFsdWUg
YmVpbmcgaGlnaGVyIHRoYW4gNy4gIChMaW51eAo+IGd1ZXN0cyBoYXZlIHNvIGZhciBjb250aW51
ZWQgdG8gY29wZS4pCj4gCj4gQSAicHJvcGVyIiBmaXggaXMgY29tcGxpY2F0ZWQgYW5kIGl0J3Mg
dG9vIGxhdGUgdG8gZml4IGl0IGVpdGhlciBmb3IKPiA0LjEzLCBvciB0byBiYWNrcG9ydCB0byBz
dXBwb3J0ZWQgYnJhbmNoZXMuICBBcyBhIHNob3J0LXRlcm0gZml4LAo+IGxpbWl0IHRoaXMgdmFs
dWUgdG8gNy4KPiAKPiBUaGlzIGRvZXMgbWVhbiB0aGF0IGEgTGludXggZ3Vlc3QsIGJvb3RlZCBv
biBzdWNoIGEgc3lzdGVtIHdpdGhvdXQKPiB0aGlzIGNoYW5nZSwgYW5kIHRoZW4gbWlncmF0aW5n
IHRvIGEgc3lzdGVtIHdpdGggdGhpcyBjaGFuZ2UsIHdpdGgKPiBtb3JlIHRoYW4gNjQgdmNwdXMs
IHdvdWxkIHNlZSBhbiBhcHBhcmVudCB0b3BvbG9neSBjaGFuZ2UuICBUaGlzIGlzIGEKPiBsb3cg
ZW5vdWdoIHJpc2sgaW4gcHJhY3RpY2UgdGhhdCBlbmFibGluZyB0aGlzIGxpbWl0IHVuaWxhdGVy
YWxseSwgdG8KPiBhbGxvdyBvdGhlciBndWVzdHMgdG8gYm9vdCB3aXRob3V0IG1hbnVhbCBpbnRl
cnZlbnRpb24sIGlzIHdvcnRoIGl0Lgo+IAo+IFJlcG9ydGVkLWJ5OiBTdGV2ZW4gSGFpZ2ggPG5l
dHdpekBjcmMuaWQuYXU+Cj4gUmVwb3J0ZWQtYnk6IEFuZHJlYXMgS2luemxlciA8aGZwQHBvc3Rl
by5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+Cj4gLS0tCj4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgo+
IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Q0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgdG9vbHMvbGlieGMv
eGNfY3B1aWRfeDg2LmMgfCA3ICsrKysrKy0KCkkgd2lsbCBkZWZlciB0aGlzIHRvIHg4NiBtYWlu
dGFpbmVycy4KClNlZWluZyB0aGF0IHlvdSBhbHJlYWR5IGhhdmUgYW4gQWNrIGZyb20gSmFuLCBm
ZWVsIGZyZWUgdG8gYWRkIG1pbmUgaWYKbmVjZXNzYXJ5LgoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
