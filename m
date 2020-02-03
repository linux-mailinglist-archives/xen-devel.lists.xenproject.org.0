Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7931A150FAC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 19:35:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iygVp-0004Ay-1K; Mon, 03 Feb 2020 18:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIUd=3X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iygVn-0004At-Gr
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 18:31:55 +0000
X-Inumbo-ID: 73bdcb2c-46b3-11ea-a933-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73bdcb2c-46b3-11ea-a933-bc764e2007e4;
 Mon, 03 Feb 2020 18:31:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so19576878wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 10:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=alg4+CDV6CfsXO37Sm7O7/R7iTJ+JgIpXWZHCRsullU=;
 b=WBeDI9gFXm1b1h7TUbmMVLZGse7ERwAieCLIlZtGfk41gbCl8roAdsfMCCQGT5+YYh
 vFG3T7m8rNKD8i+sUOuQG1V2VAgnTHLKxIHOjSIcYSoTAU/dADOvgE1AbmG0cgPN7w0I
 2IvSQTjSboGqNpc1tIOmB1Oi8jAEYVL8i8BWEgcx5/wMdNsYfgCisvxqXLaXE0BDuMLX
 9Tt/Xwa0j1zNiCrmbTfhD2ukALIMx8AHT4KHd2lZkjW09/g3shn7Xz2C0Vf6n9uzO3w9
 63Abt07GurKX3dwv9it0zyznxGPTO5R3wrpoD6QGdUEY764VwaYxExW++zaELNHUxDSl
 Ep8Q==
X-Gm-Message-State: APjAAAWseDWwj+xeHllE27K1nVuPz2IAIEaVgVBPZO8AHEyqyIBXh9h0
 FE+wGptRvQiJinM/UHRv1cE=
X-Google-Smtp-Source: APXvYqyqfZe+uyVi35XBoOTSPaomJA/lzJUx5JxLjPZJKTLQ+D9qhuy8f491O9LA6mXLaP8hqynAcw==
X-Received: by 2002:adf:f084:: with SMTP id n4mr8912217wro.200.1580754714002; 
 Mon, 03 Feb 2020 10:31:54 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id m3sm26980199wrs.53.2020.02.03.10.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 10:31:52 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200203165812.21089-1-julien@xen.org>
 <c39dd542-1748-066e-399f-dc110ac11e19@citrix.com>
 <53769c85-cc65-55ad-3538-339f51243079@xen.org>
 <52e15a69-3882-695a-2153-3ec1da6869b1@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <78b64ea3-f9f4-cd34-9f05-e71ea355d1db@xen.org>
Date: Mon, 3 Feb 2020 18:31:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <52e15a69-3882-695a-2153-3ec1da6869b1@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of
 the P2M
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wMi8yMDIwIDE3OjM3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDIvMy8yMCA1
OjIyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAwMy8wMi8yMDIwIDE3
OjEwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gMi8zLzIwIDQ6NTggUE0sIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+
Pj4+Cj4+Pj4gSXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHdoeSB0aGUgc2xvdCAwIG9mIGVhY2gg
cDJtIHNob3VsZCBiZSBwb3B1bGF0ZWQKPj4+PiB3aXRoIGVtcHR5IHBhZ2UtdGFibGVzLiBUaGUg
Y29tbWl0IGludHJvZHVjaW5nIGl0IDc1OWFmOGUzODAwICJbSFZNXQo+Pj4+IEZpeCA2NC1iaXQg
SFZNIGRvbWFpbiBjcmVhdGlvbi4iIGRvZXMgbm90IGNvbnRhaW4gbWVhbmluZ2Z1bAo+Pj4+IGV4
cGxhbmF0aW9uIGV4Y2VwdCB0aGF0IGl0IHdhcyBuZWNlc3NhcnkgZm9yIHNoYWRvdy4KPj4+Cj4+
PiBUaW0sIGFueSBpZGVhcyBoZXJlPwo+Pj4KPj4+PiBBcyB3ZSBkb24ndCBzZWVtIHRvIGhhdmUg
YSBnb29kIGV4cGxhbmF0aW9uIHdoeSB0aGlzIGlzIHRoZXJlLCBkcm9wIHRoZQo+Pj4+IGNvZGUg
Y29tcGxldGVseS4KPj4+Pgo+Pj4+IFRoaXMgd2FzIHRlc3RlZCBieSBzdWNjZXNzZnVsbHkgYm9v
dGluZyBhIEhWTSB3aXRoIHNoYWRvdyBlbmFibGVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4+Pgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4g
SSBkb24ndCBrbm93IGZvciBzdXJlIGlmIHRoaXMgaXMgZ29pbmcgdG8gYnJlYWsgYSBzZXR1cC4g
SSBoYXZlIHRyaWVkCj4+Pj4gSFZNIGd1ZXN0IHdpdGggaGFwPXswLCAxfSB3aXRob3V0IGFueSB0
cm91YmxlLiBJIGFtIGhhcHB5IHRvIHRyeSBtb3JlCj4+Pj4gc2V0dXAgaWYgeW91IGhhdmUgYW55
IGluIG1pbmQuCj4+Pj4KPj4+PiBJZiB0aGlzIGJyZWFrIGEgc2V0dXAsIHRoZW4gcGxlYXNlIGRl
c2NyaWJlIHRoZSBzZXR1cCBhbmQgSSB3aWxsIHNlbmQgYQo+Pj4+IGRvY3VtZW50YXRpb24gcGF0
Y2ggaW5zdGVhZC4KPj4+Cj4+PiBUaGlzIGlzIGEgc29tZXdoYXQgcmlza3kgc3RyYXRlZ3kuwqAg
T3RoZXIgdGhhbiBjb2RlIGNsZWFuLXVwLCBpcyB0aGVyZQo+Pj4gYW55IGFkdmFudGFnZSB0byBy
ZW1vdmluZyB0aGlzIGNvZGUgYXQgdGhlIG1vbWVudD8KPj4KPj4gSWYgVGltIGRvZXNuJ3QgaGF2
ZSBhbiBleHBsYW5hdGlvbiwgdGhlbiB3ZSBoYXZlIHR3byBzb2x1dGlvbnM6Cj4+ICDCoMKgIDEp
IENoZWNraW4gdGhlIGNvZGUgYW5kIHNlZSBpZiB0aGF0IGJyZWFrcwo+PiAgwqDCoCAyKSBLZWVw
IGNvZGUgd2UgaGF2ZSBubyBjbHVlIHdoeSBpdCBpcyB0aGVyZQo+IAo+IEl0IGlzIHByb2JhYmx5
IGVhcmx5IGVub3VnaCBpbiB0aGUgZGV2IGN5Y2xlIHRvIGRvIHRoaXMuCiA+Cj4gQWxzbywgaXQn
cyBub3QgY2xlYXIgdG8gbWUgd2hhdCBraW5kIG9mIGJ1ZyB0aGUgY29kZSB5b3UncmUgZGVsZXRp
bmcKPiB3b3VsZCBmaXguICBJZiB5b3UgcmVhZCBhIG5vdC1wcmVzZW50IGVudHJ5LCB5b3Ugc2hv
dWxkIGdldCBJTlZBTElEX01GTgo+IGFueXdheS4gIFVubGVzcyB5b3Ugd2VyZSBjYWxsaW5nIHAy
bV9nZXRfZW50cnlfcXVlcnkoKSwgd2hpY2ggSSdtIHByZXR0eQo+IHN1cmUgaGFkbid0IGJlZW4g
aW50cm9kdWNlZCBhdCB0aGlzIHBvaW50LgoKSSBjYW4ndCBmaW5kIHRoaXMgZnVuY3Rpb24geW91
IG1lbnRpb24gaW4gc3RhZ2luZy4gV2FzIGl0IHJlbW92ZWQgcmVjZW50bHk/CgpUaGUgY29kZSBp
cyBhbGxvY2F0aW5nIGFsbCBwYWdlLXRhYmxlcyBmb3IgX2dmbigwKS4gSSB3b3VsZCBub3QgZXhw
ZWN0IAp0aGUgY29tbW9uIGNvZGUgdG8gY2FyZSB3aGV0aGVyIGEgdGFibGUgaXMgYWxsb2NhdGVk
IG9yIG5vdC4gU28gdGhpcyAKd291bGQgc3VnZ2VzdCB0aGF0IGFuIGludGVybmFsIGltcGxlbWVu
dGF0aW9uIChvZiB0aGUgc2hhZG93PykgaXMgCnJlbHlpbmcgb24gdGhpcy4KCkhvd2V2ZXIsIEkg
Y2FuJ3QgZmluZCBhbnl0aGluZyBvYnZpb3VzIHN1Z2dlc3RpbmcgdGhhdCBpcyBuZWNlc3Nhcnku
IElmIAp0aGVyZSB3YXMgYW55dGhpbmcsIEkgd291bGQgZXhwZWN0IHRvIGhhcHBlbiBkdXJpbmcg
ZG9tYWluIGNyZWF0aW9uLCBhcyAKbmVpdGhlciBYZW4gbm9yIGEgZ3Vlc3QgY291bGQgcmVseSBv
biB0aGlzICh0aGVyZSBhcmUgd2F5IHRvIG1ha2UgdGhvc2UgCnBhZ2VzIGRpc2FwcGVhciB3aXRo
IHRoZSBNRU1PUlkgb3AgaHlwZXJjYWxsKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
