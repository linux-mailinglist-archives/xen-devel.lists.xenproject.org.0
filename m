Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924D117FC1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 06:32:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieY5o-0003lR-Jt; Tue, 10 Dec 2019 05:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHo1=Z7=gmail.com=natechancellor@srs-us1.protection.inumbo.net>)
 id 1ieQMl-000323-8d
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 21:14:51 +0000
X-Inumbo-ID: efac4b3a-1ac8-11ea-b6f1-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efac4b3a-1ac8-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 21:14:50 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id l136so7779502oig.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kI1cdqsohvrBZb1G7zvJRzw516Sb7QCZ7TtWVwq88mU=;
 b=tFBqaJ6Eo9qr+Sygep748UzAdEO4AKba+6RRWjkEuwQCBVnTqgqwNo/cUrtj/iOeWX
 I8bFZQypaMzklntlXxlO/YjyUMMq3d/aQCGFL0cMj5pKJBjcERHsQiDUUbQ3m5Au0EVf
 Vxa0n5Rl9aByWwLOfUCe2W1u8KojEDq01cr4X1mc8rI2ETSD/gQrFAl6A6HZgE0bP74b
 H2/I4xqbiJjh7sR4CoUVII7/+XT1iPQ9qfVT16LXgXwXrK/NQHA+jX+JFfygzdxKnjjG
 uC98WlgJM+wz+vi0BfV2oFdMFnAhNEhwq04chyPC2jlHAloXxdJs8sHSy938bey5IqNY
 YZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kI1cdqsohvrBZb1G7zvJRzw516Sb7QCZ7TtWVwq88mU=;
 b=niSSCm6feM2ptQQt3NXiy8i2OwW1+/uZPRs1A9E7iHQXH/0i+3f8keLiPoaWlplDW0
 GANLTPxdBvoDcR0Fj+S/fyT/6T27ni3KyrsD1qfCKABZBCCOs/mNdctlfBY0zFC6QOVs
 ebTZJKSS19BOWFl0KeXp+qE9LTKkJ9a8U0ryEmS1kUxyfK2YxuKopw38+0wAVBjL7ZsC
 y5ll29sCTJCUeUkQ/pYkyBIwU5HTOO2TieAZI+mSMSRIeOkfR8d4epiwVD5jP2UCFu1L
 vCfpdihim2O5kJlbFsvCytQ7Ha7M/v3wL7Ro48Yt8zr4bIsPLSdY+CIx+kYWqP3LIODc
 foRw==
X-Gm-Message-State: APjAAAV2MMB7KzvQ0kZCfPIkz9hS347sss/uPU2G+V52UY58BTbIX+fb
 yNytXt5Nji1ipugzAcihRFE=
X-Google-Smtp-Source: APXvYqzlMt4odPZ7cWf+kqQOZWfGPtDFYJUEA3rCViP6YFhPndf4Ihj37q8UtsN4ZJiubpAhb7h4OQ==
X-Received: by 2002:aca:8d5:: with SMTP id 204mr981154oii.141.1575926089961;
 Mon, 09 Dec 2019 13:14:49 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id g19sm397100otj.81.2019.12.09.13.14.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 13:14:49 -0800 (PST)
Date: Mon, 9 Dec 2019 14:14:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20191209211447.GA43622@ubuntu-m2-xlarge-x86>
References: <20191209201444.33243-1-natechancellor@gmail.com>
 <CAKwvOdmrGGn6f+XBOO3GCm-jVftLsFTUXdbhS9_iJVY03XqCjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdmrGGn6f+XBOO3GCm-jVftLsFTUXdbhS9_iJVY03XqCjA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 10 Dec 2019 05:29:50 +0000
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: Adjust indentation in
 xlvbd_alloc_gendisk
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDE6MDc6NDFQTSAtMDgwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBPbiBNb24sIERlYyA5LCAyMDE5IGF0IDEyOjE0IFBNIE5hdGhhbiBDaGFuY2Vs
bG9yCj4gPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2xhbmcgd2Fy
bnM6Cj4gPgo+ID4gLi4vZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYzoxMTE3OjQ6IHdhcm5p
bmc6IG1pc2xlYWRpbmcgaW5kZW50YXRpb247Cj4gPiBzdGF0ZW1lbnQgaXMgbm90IHBhcnQgb2Yg
dGhlIHByZXZpb3VzICdpZicgWy1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbl0KPiA+ICAgICAgICAg
ICAgICAgICBucl9wYXJ0cyA9IFBBUlRTX1BFUl9ESVNLOwo+ID4gICAgICAgICAgICAgICAgIF4K
PiA+IC4uL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmM6MTExNTozOiBub3RlOiBwcmV2aW91
cyBzdGF0ZW1lbnQgaXMgaGVyZQo+ID4gICAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiAgICAg
ICAgICAgICAgICAgXgo+ID4KPiA+IFRoaXMgaXMgYmVjYXVzZSB0aGVyZSBpcyBhIHNwYWNlIGF0
IHRoZSBiZWdpbm5pbmcgb2YgdGhpcyBsaW5lOyByZW1vdmUKPiA+IGl0IHNvIHRoYXQgdGhlIGlu
ZGVudGF0aW9uIGlzIGNvbnNpc3RlbnQgYWNjb3JkaW5nIHRvIHRoZSBMaW51eCBrZXJuZWwKPiA+
IGNvZGluZyBzdHlsZSBhbmQgY2xhbmcgbm8gbG9uZ2VyIHdhcm5zLgo+ID4KPiA+IFdoaWxlIHdl
IGFyZSBoZXJlLCB0aGUgcHJldmlvdXMgbGluZSBoYXMgc29tZSB0cmFpbGluZyB3aGl0ZXNwYWNl
OyBjbGVhbgo+ID4gdGhhdCB1cCBhcyB3ZWxsLgo+ID4KPiA+IEZpeGVzOiBjODBhNDIwOTk1ZTcg
KCJ4ZW4tYmxrZnJvbnQ6IGhhbmRsZSBYZW4gbWFqb3IgbnVtYmVycyBvdGhlciB0aGFuIFhFTlZC
RCIpCj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lz
c3Vlcy83OTEKPiA+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNl
bGxvckBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5j
IHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiA+IGluZGV4IGE3NGQwMzkxMzgyMi4uYzAy
YmUwNmM1Mjk5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+
ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+ID4gQEAgLTExMTMsOCArMTEx
Myw4IEBAIHN0YXRpYyBpbnQgeGx2YmRfYWxsb2NfZ2VuZGlzayhibGtpZl9zZWN0b3JfdCBjYXBh
Y2l0eSwKPiAKPiBXaGlsZSB5b3UncmUgaGVyZSwgd291bGQgeW91IHBsZWFzZSBhbHNvIHJlbW92
aW5nIHRoZSBzaW5nbGUgc3BhY2UKPiBiZWZvcmUgdGhlIGxhYmVscyBpbiB0aGlzIGZ1bmN0aW9u
Pwo+IAo+IEluIHZpbToKPiAKPiAvXiBbYS16QS1aXQo+IAo+IHR1cm5zIHVwIDUgbGFiZWxzIHdp
dGggdGhpcy4KClRoYXQgc2hvdWxkIHByb2JhYmx5IGJlIGEgc2VwYXJhdGUgcGF0Y2ggc2luY2Ug
dGhlcmUgYXJlIG9ubHkgdHdvIGxhYmVscwppbiB0aGUgZnVuY3Rpb24gSSBhbSB0b3VjaGluZyBo
ZXJlLiBJJ2xsIHdoaXAgdXAgYSB2MiBpZiB0aGUgbWFpbnRhaW5lcnMKd2FudCBpdCB0aG91Z2gg
b3IgSSdsbCBqdXN0IGRyYWZ0IGEgc2VwYXJhdGUgcGF0Y2ggd2hlbiBJIGFtIGRvbmUKYWRkcmVz
c2luZyBhbGwgb2YgdGhlIG1pc2xlYWRpbmcgaW5kZW50YXRpb24gd2FybmluZ3MuCgpUaGFua3Mg
Zm9yIHRoZSByZXBseSEKTmF0aGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
