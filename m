Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F78EB9C8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 23:42:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQJ5U-0004TI-Ro; Thu, 31 Oct 2019 22:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RS8g=YY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iQJ5T-0004TD-GP
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 22:38:39 +0000
X-Inumbo-ID: 2e6e78b0-fc2f-11e9-beca-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e6e78b0-fc2f-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 22:38:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l10so7976865wrb.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2019 15:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Czjt0TLQuE660vIn8QRgePAF46bRgWb4slfFTL4KdlQ=;
 b=RggkRqyEEo0LLRNe3I5sfkMEnW9yyml12YpURbkPzz8JoYBkld2G9jKTz42canH8jd
 6spugVuH479jJ0O0stobAX25LDT3muHghO3dAr8qbQiPd/jcaC4nmCioPiRQweOZuEDn
 1p/Zc7Y8TlASOwnVhn8bDfSJhBQQHKGkSJZjTofTd/r07I/4hfMQrH4DsrUG08GXxHes
 DAnFlOh80ZUIHWGvOw8phO5+rd0gFwu29govJbgYa8fsi+I56f8zCdKcoJKj75DiJ6UK
 mL9r/lQBwie6cQeri9wsygEUxOw5GRKS9EL+fVxSDsO5dItNOBHJqiZzAL+36VFfB1a+
 HK2Q==
X-Gm-Message-State: APjAAAXujI8LyvNIKA1shVzeEeA+sjjeyhKyvBoVw7f1yStcNMEigdKE
 PDA/jRUl2Pv5IuqbN7culbY=
X-Google-Smtp-Source: APXvYqy6JzVsplv6SVtsqgWXrWjiABU3DgtHScsHrDp9xlvqYTNvS/IucnCi77zdIfOo9S8T/QlN+A==
X-Received: by 2002:adf:b603:: with SMTP id f3mr8109860wre.306.1572561518139; 
 Thu, 31 Oct 2019 15:38:38 -0700 (PDT)
Received: from debian (30.162.147.147.dyn.plus.net. [147.147.162.30])
 by smtp.gmail.com with ESMTPSA id z12sm4972320wmi.4.2019.10.31.15.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 15:38:37 -0700 (PDT)
Date: Thu, 31 Oct 2019 22:38:35 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191031223835.b2ghdizqhmufgsy2@debian>
References: <20191031193808.15401-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031193808.15401-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/pv: Fix !CONFIG_PV build following
 XSA-296
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDc6Mzg6MDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBQVEZfKiBhcmUgZGVjbGFyZWQgd2l0aGluIENPTkZJR19QViwgYW5kIHVzZWQgb3V0
c2lkZToKPiAKPiAgIG1tLmM6IEluIGZ1bmN0aW9uIOKAmF9wdXRfcGFnZV90eXBl4oCZOgo+ICAg
bW0uYzoyODE5OjMyOiBlcnJvcjog4oCYUFRGX3ByZWVtcHRpYmxl4oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAgICBib29sIHByZWVtcHRpYmxlID0gZmxh
Z3MgJiBQVEZfcHJlZW1wdGlibGU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fgo+ICAgbW0uYzoyODE5OjMyOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQg
aWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2gKPiAgIGZ1bmN0aW9uIGl0
IGFwcGVhcnMgaW4KPiAgIG1tLmM6Mjg0MjoyNDogZXJyb3I6IOKAmFBURl9wYXJ0aWFsX3NldOKA
mSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiAgICAgICAgICAgIGlm
ICggIShmbGFncyAmIFBURl9wYXJ0aWFsX3NldCkgKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+Cj4gICBtbS5jOiBJbiBmdW5jdGlvbiDigJhwdXRfcGFnZV90eXBl
X3ByZWVtcHRpYmxl4oCZOgo+ICAgbW0uYzozMDkwOjMzOiBlcnJvcjog4oCYUFRGX3ByZWVtcHRp
Ymxl4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAgICBy
ZXR1cm4gX3B1dF9wYWdlX3R5cGUocGFnZSwgUFRGX3ByZWVtcHRpYmxlLCBOVUxMKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ICAgbW0uYzog
SW4gZnVuY3Rpb24g4oCYcHV0X29sZF9ndWVzdF90YWJsZeKAmToKPiAgIG1tLmM6MzEwODoyNTog
ZXJyb3I6IOKAmFBURl9wcmVlbXB0aWJsZeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBQVEZfcHJlZW1wdGlibGUg
fAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ICAgbW0uYzoz
MTEwOjI3OiBlcnJvcjog4oCYUFRGX3BhcnRpYWxfc2V04oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFRGX3Bh
cnRpYWxfc2V0IDogMCApLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+Cj4gICBtbS5jOiBJbiBmdW5jdGlvbiDigJhwdXRfcGFnZV90eXBlX3ByZWVtcHRpYmxl
4oCZOgo+ICAgbW0uYzozMDkxOjE6IGVycm9yOiBjb250cm9sIHJlYWNoZXMgZW5kIG9mIG5vbi12
b2lkIGZ1bmN0aW9uCj4gICBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KPiAgICB9Cj4gICAgXgo+ICAg
Y2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiAKPiBSZXBvc2l0aW9u
IHRoZSBkZWZpbml0aW9ucyB0byBiZSBvdXRzaWRlIG9mIHRoZSAjaWZkZWYgQ09ORklHX1BWCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
