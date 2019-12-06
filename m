Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E2114C57
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 07:27:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1id72H-0008Tj-EY; Fri, 06 Dec 2019 06:24:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Atu=Z4=gmail.com=jeremi.piotrowski@srs-us1.protection.inumbo.net>)
 id 1id72G-0008Te-5D
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 06:24:16 +0000
X-Inumbo-ID: 064c73fe-17f1-11ea-b4e9-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 064c73fe-17f1-11ea-b4e9-bc764e2007e4;
 Fri, 06 Dec 2019 06:24:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so6563655wmc.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 22:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CxaVparXDg6xku+DJSDUFJxfRwAVLF827yN2dyB1OGw=;
 b=iFG+oZ4bNB+DUiou/bVkK6LVy9oxQzjohR4UJ8IrwOfsK0zPZkL526kNtdXHORtIya
 k+E1JiYolBZrXxaF7QFUO+ACl0WJKS8pqSbTZOsevII2sUggNe1RRcgmn4hyRfXxe9Ln
 EqkdZANd1+D/BGWV7x1Fd5MMw5MG6mt39AKERQQDJ09o60oAycnQFEeQ7A1NYXm27ZBw
 tVJLkPvdUryFt10kjJWS6F6RlyOLoxH9PDZiWV6vOcjhugQ3MGbJnXjo5mlvSeWiDkcJ
 8cdSyeDIqyvaGSwC4RIRznDScAzJLsfqWhmy6Ons5I4pe3ZPPuLBam1cx9lupHoFgZkP
 roSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CxaVparXDg6xku+DJSDUFJxfRwAVLF827yN2dyB1OGw=;
 b=Ve85hGm/ut+H1kP5bZE1Ejp9ygJqYIfAlrUcOTvQ71r5+ON2adjfh//2fHHN8i/XKy
 8yVgby8XnVT/LjLYIbysCCjZ3i/tW8RIR+uo4WxCVYZkWlYxBT3qA1Xrx1ULb+w9qLN3
 srkz5ruEbId22geZRHsjUnQWMy/jrCaYovqtALQUG78yk/1ygnWWjCKEBQyp2zVdYJxP
 Uy8+kix4zbxhh+XeR4N64pxICcPp8qqYGbXdHE8i4ZWFuEIfE4PxTdT7gSntJMtlQMyu
 ak1m4ZYMoZGJ79RRqVaZVCtL9eM83TumIovXR63Jrkm1SSv6wXu42vCrhyYzphpDvv8j
 1e6w==
X-Gm-Message-State: APjAAAWet3392GV5SbwEpVxK7rYI7+7B3cgDVXAYsh8hGXIeL5/yvB7o
 Z5KqeYRVh3yGwM44rmfvo6eD1Q6/
X-Google-Smtp-Source: APXvYqyN41Rr95XceNz8pzSo2itdsiBe0DanO4/0DxleWiNw9PqVHhXY6Qah0P8NpNY+FoMCr2TlJw==
X-Received: by 2002:a1c:6086:: with SMTP id u128mr8872390wmb.29.1575613454440; 
 Thu, 05 Dec 2019 22:24:14 -0800 (PST)
Received: from gentoo-tp.home ([2a02:908:1086:7e00:b6c5:9957:10c9:5b67])
 by smtp.gmail.com with ESMTPSA id j184sm2313697wmb.44.2019.12.05.22.24.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2019 22:24:13 -0800 (PST)
Date: Fri, 6 Dec 2019 07:25:35 +0100
From: Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191206062535.GA13261@gentoo-tp.home>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
 <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
 <20191204071433.GA5806@gentoo-tp.home>
 <65509778-2d73-6ed4-1537-95c5ae54e36e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65509778-2d73-6ed4-1537-95c5ae54e36e@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDI6Mjc6MjZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAwODoxNCwgSmVyZW1pIFBpb3Ryb3dza2kgd3JvdGU6Cj4gPiBB
bnkgc3VnZ2VzdGlvbnMgaG93IHRvIHByb2NlZWQ/Cj4gCj4gQWN0dWFsbHkgaGVyZSdzIGEgYmV0
dGVyIHZlcnNpb24gKEkgdGhpbmspLgo+IAo+IEphbgo+IAo+IGx6NDogcmVmaW5lIGNvbW1pdCA5
MTQzYTZjNTVlZjcgZm9yIHRoZSA2NC1iaXQgY2FzZQo+IAo+IEkgY2xlYXJseSB3ZW50IHRvbyBm
YXIgdGhlcmU6IFdoaWxlIHRoZSBMWjRfV0lMRENPUFkoKSBpbnN0YW5jZXMgaW5kZWVkCj4gbmVl
ZCBwcmlvciBndWFyZGluZywgTFo0X1NFQ1VSRUNPUFkoKSBuZWVkcyB0aGlzIG9ubHkgaW4gdGhl
IDMyLWJpdCBjYXNlCj4gKHdoZXJlIGl0IHNpbXBseSBhbGlhc2VzIExaNF9XSUxEQ09QWSgpKS4g
ImNweSIgY2FuIHZhbGlkbHkgcG9pbnQKPiAoc2xpZ2h0bHkpIGJlbG93ICJvcCIgaW4gdGhlc2Ug
Y2FzZXMsIGR1ZSB0bwo+IAo+IAkJY3B5ID0gb3AgKyBsZW5ndGggLSAoU1RFUFNJWkUgLSA0KTsK
PiAKPiB3aGVyZSBsZW5ndGggY2FuIGJlIGFzIGxvdyBhcyAwIGFuZCBTVEVQU0laRSBpcyA4LiBI
b3dldmVyLCBpbnN0ZWFkIG9mCj4gcmVtb3ZpbmcgdGhlIGNoZWNrIHZpYSAiI2lmICFMWjRfQVJD
SDY0IiwgcmVmaW5lIGl0IHN1Y2ggdGhhdCBpdCB3b3VsZAo+IGFsc28gcHJvcGVybHkgd29yayBp
biB0aGUgNjQtYml0IGNhc2UsIGFib3J0aW5nIGRlY29tcHJlc3Npb24gaW5zdGVhZAo+IG9mIGNv
bnRpbnVpbmcgb24gYm9ndXMgaW5wdXQuCj4gCj4gUmVwb3J0ZWQtYnk6IE1hcmsgUHJ5b3IgPHBy
eW9ybTA5QGdtYWlsLmNvbT4KPiBSZXBvcnRlZC1ieTogSmVyZW1pIFBpb3Ryb3dza2kgPGplcmVt
aS5waW90cm93c2tpQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIHVuc3RhYmxlLm9yaWcveGVuL2NvbW1vbi9sejQvZGVj
b21wcmVzcy5jCj4gKysrIHVuc3RhYmxlL3hlbi9jb21tb24vbHo0L2RlY29tcHJlc3MuYwo+IEBA
IC0xNDcsNyArMTQ3LDcgQEAgc3RhdGljIGludCBJTklUIGx6NF91bmNvbXByZXNzKGNvbnN0IHVu
cwo+ICAJCQkJZ290byBfb3V0cHV0X2Vycm9yOwo+ICAJCQljb250aW51ZTsKPiAgCQl9Cj4gLQkJ
aWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKWNweSA8ICh1bnNpZ25lZCBsb25nKW9wKSkKPiAr
CQlpZiAodW5saWtlbHkoKHVuc2lnbmVkIGxvbmcpY3B5IDwgKHVuc2lnbmVkIGxvbmcpb3AgLSAo
U1RFUFNJWkUgLSA0KSkpCj4gIAkJCWdvdG8gX291dHB1dF9lcnJvcjsKPiAgCQlMWjRfU0VDVVJF
Q09QWShyZWYsIG9wLCBjcHkpOwo+ICAJCW9wID0gY3B5OyAvKiBjb3JyZWN0aW9uICovCj4gQEAg
LTI3OSw3ICsyNzksNyBAQCBzdGF0aWMgaW50IGx6NF91bmNvbXByZXNzX3Vua25vd25vdXRwdXRz
Cj4gIAkJCQlnb3RvIF9vdXRwdXRfZXJyb3I7Cj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0KPiAtCQlp
ZiAodW5saWtlbHkoKHVuc2lnbmVkIGxvbmcpY3B5IDwgKHVuc2lnbmVkIGxvbmcpb3ApKQo+ICsJ
CWlmICh1bmxpa2VseSgodW5zaWduZWQgbG9uZyljcHkgPCAodW5zaWduZWQgbG9uZylvcCAtIChT
VEVQU0laRSAtIDQpKSkKPiAgCQkJZ290byBfb3V0cHV0X2Vycm9yOwo+ICAJCUxaNF9TRUNVUkVD
T1BZKHJlZiwgb3AsIGNweSk7Cj4gIAkJb3AgPSBjcHk7IC8qIGNvcnJlY3Rpb24gKi8KPiAKClRo
YW5rcyBKYW4sIHRoaXMgd29ya3MuIEkgdGVzdGVkIGl0IHdpdGggZGlyZWN0IGtlcm5lbCBib290
LiBMaWtlIFByeQp3cm90ZSBwdmdydWIyIGlzIGFub3RoZXIgc3RvcnksIHNlZW1zIHRoZXJlIGlz
IG5vIHN1cHBvcnQgZm9yIGx6NApjb21wcmVzc2VkIGtlcm5lbHMgaW4gaXQgLCBhbmQgdWJ1bnR1
IHBhdGNoZXMgaW4gc3VwcG9ydCB0byB0aGUgZ3J1YiB0aGF0CnRoZXkgc2hpcC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
