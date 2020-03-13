Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA139184411
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:48:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgre-0004vc-Iy; Fri, 13 Mar 2020 09:44:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FVV1=46=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCgrd-0004vX-6P
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:44:21 +0000
X-Inumbo-ID: 3614424a-650f-11ea-b2b3-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3614424a-650f-11ea-b2b3-12813bfff9fa;
 Fri, 13 Mar 2020 09:44:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x11so6433420wrv.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 02:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RjpD0bHfQsX/74pCBhhAmfa3IrP407GT6+hm5OUIEJQ=;
 b=keLxyc8L+K9AFNKjb1QhpoXJkI+g0muh3RwWmvGP3nI/w1PX+bjZ34dxK6O0XaGeG1
 Ey+c73LhN2shkIkycxuhBgirGbE61yTEpkSYM1mC1KknbSJ7bvH8AcoRQ+9x9XnN0Tj3
 i2831Tqqo3FotO4E+1FA87IM4IQDRelSDHM13W08u32Lxt29Cs8iXe9DHhknMzk5h4IP
 DhrANtjjbt2HIwAJiiQEYhrmU3eUqev9BbIP4FplF9nQTBYzGOcXLHyBNBK7bJWIgzWr
 xVJPCl1PB3hLaC+Tt0P5fBE6Z+l0ofR3bpXvIFNZNNyDP/cUhxvJxfR4eZ9ibtk3q78b
 UxDA==
X-Gm-Message-State: ANhLgQ0L5MCggAaq96wP5VbEj+V2Zq3kNMc2k2QCx8SMglxmgaFfKygl
 8JFbF4QFutuWGxj5ah9eG4s=
X-Google-Smtp-Source: ADFU+vuzqb2/3EB+t6pVWq13ur0Dn7cXg9l3bLqYJtH5IG9Ejld2uZPJnZ+3rg4yaXAvNMaq1+Tl4w==
X-Received: by 2002:adf:8b1b:: with SMTP id n27mr7841224wra.349.1584092658937; 
 Fri, 13 Mar 2020 02:44:18 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id w22sm16371987wmk.34.2020.03.13.02.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 02:44:18 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-3-jgross@suse.com>
 <0e56d8d5-a66f-1990-faf2-488f1f07ae93@suse.com>
 <6f10339b-7746-ebde-fc11-787b6032f259@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f1810139-5843-e551-0864-11f732d5fb44@xen.org>
Date: Fri, 13 Mar 2020 09:44:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6f10339b-7746-ebde-fc11-787b6032f259@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] xen/spinlocks: fix placement of
 preempt_[dis|en]able()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMy8wMy8yMDIwIDA5OjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDEzLjAz
LjIwIDA5OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMDMuMjAyMCAwOTowNSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+IEBAIC0xOTksMTAgKzE5OSwxMCBAQCB1bnNpZ25lZCBsb25n
IF9zcGluX2xvY2tfaXJxc2F2ZShzcGlubG9ja190ICpsb2NrKQo+Pj4gwqAgdm9pZCBfc3Bpbl91
bmxvY2soc3BpbmxvY2tfdCAqbG9jaykKPj4+IMKgIHsKPj4+IMKgwqDCoMKgwqAgYXJjaF9sb2Nr
X3JlbGVhc2VfYmFycmllcigpOwo+Pj4gLcKgwqDCoCBwcmVlbXB0X2VuYWJsZSgpOwo+Pj4gwqDC
oMKgwqDCoCBMT0NLX1BST0ZJTEVfUkVMOwo+Pj4gwqDCoMKgwqDCoCByZWxfbG9jaygmbG9jay0+
ZGVidWcpOwo+Pj4gwqDCoMKgwqDCoCBhZGRfc2l6ZWQoJmxvY2stPnRpY2tldHMuaGVhZCwgMSk7
Cj4+PiArwqDCoMKgIHByZWVtcHRfZW5hYmxlKCk7Cj4+PiDCoMKgwqDCoMKgIGFyY2hfbG9ja19z
aWduYWwoKTsKPj4+IMKgIH0KPj4KPj4gYXJjaF9sb2NrX3NpZ25hbCgpIGlzIGEgYmFycmllciBv
biBBcm0sIGhlbmNlIGp1c3QgbGlrZSBmb3IgcGF0Y2ggMQo+PiBJIHdvbmRlciB3aGV0aGVyIHRo
ZSBpbnNlcnRpb24gd291bGRuJ3QgYmV0dGVyIGNvbWUgYWZ0ZXIgaXQuCgpUaGUgaW1wb3J0YW50
IGJhcnJpZXIgaW4gc3Bpbl91bmxvY2soKSBpcyBhcmNoX2xvY2tfcmVsZWFzZV9iYXJyaWVyKCku
CgpUaGUgb25lIGluIGFyY2hfbG9ja19zaWduYWwoKSBpcyBqdXN0IHRvIGVuc3VyZSB0aGF0IHdh
a2luZyB1cCB0aGUgb3RoZXIgCkNQVXMgd2lsbCBub3QgaGFwcGVuIGJlZm9yZSB0aGUgdW5sb2Nr
IGlzIHNlZW4uIFRoZSBiYXJyaWVyIHdvdWxkIG5vdCAKaGF2ZSBiZWVuIG5lY2Vzc2FyeSBpZiB0
aGUgd2UgZGlkbid0IHVzZSAnc2V2Jy4KCj4gCj4gRWl0aGVyIHdheSBpcyBmaW5lIGZvciBtZS4g
SXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgcHJlZW1wdGlvbiBpcyBvbmx5Cj4gcmVsZXZhbnQgb24g
dGhlIGxvY2FsIGNwdS4gU28gdGhpcyBpcyBhYm91dCB0cmFkaW5nIGxvY2sgc3RhdGUKPiB2aXNp
YmlsaXR5IGFnYWluc3QgcHJlZW1wdGlvbiBkaXNhYmxlZCB0aW1lLCBhbmQgSSBhZ3JlZSB0aGUg
dmlzaWJsZQo+IHRpbWUgb2YgdGhlIGxvY2sgaGVsZCBzaG91bGQgYmUgbWluaW1pemVkIGF0IGhp
Z2hlciBwcmlvcml0eSB0aGFuIHRoZQo+IHByZWVtcHRpb24gZGlzYWJsZWQgdGltZS4KCkkgZG9u
J3QgdGhpbmsgdGhlIHJhdGlvbmFsZSBpcyBhYm91dCAicGVyZm9ybWFuY2UiIGhlcmUuIFRoZSBy
YXRpb25hbGUgCmlzIHlvdSBkb24ndCBrbm93IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhcmNoX2xv
Y2tfc2lnbmFsKCkuIElmIHlvdSBnZXQgCnByZWVtcHRlZCBieSBhIHRocmVhZCB0cnlpbmcgdG8g
YWNxdWlyZSB0aGUgc2FtZSBsb2NrLCB0aGVuIGl0IG1heSBub3QgCmRvIHRoZSByaWdodCB0aGlu
Zy4KCkxpbnV4IHdpbGwgYWxzbyByZS1lbmFibGUgcHJlZW1wdGlvbiBvbmx5IGFmdGVyIHRoZSB1
bmxvY2sgaGFzIGJlZW4gCmNvbXBsZXRlZC4gU28gaXQgd291bGQgYmUgYmVzdCB0byBmb2xsb3cg
dGhlIHNhbWUgcGF0dGVybi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
