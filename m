Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59E11A9FA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:36:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0GV-0001cp-31; Wed, 11 Dec 2019 11:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r5Tp=2B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1if0GT-0001ck-K7
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:34:45 +0000
X-Inumbo-ID: 3a123544-1c0a-11ea-8b0d-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a123544-1c0a-11ea-8b0d-12813bfff9fa;
 Wed, 11 Dec 2019 11:34:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so23633119wrn.7
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 03:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IPpFRav33J05aVz3s4ll/akwvWLAdlmRQ5bshrRd3NI=;
 b=abUyzUUbmVbd3vPP53PssGXFj89yvEZFHnYGEDTyoCC+5PPMEEnpHW/WbsbOcjWOHK
 KT05uftmiyhsyecf05TmDE/SsIUD3opKrrJ8o2UNofCnR8XFODzow6irsvqjnFF436RI
 DM2FYZ9MXCGFtxSlfQasNDv/yzFcSI0OyaWNboT6lNuzp6PbtWeIhB9w4weO8sm2Fgd4
 UiWyJbml5hMtmDqEWuHMv0OUxYbSLoruNEN+iyxC+v58Yqh+OkekhtuRFTPo0yO4Qfd/
 mxMg0owLqE784B1EQEVCNmkIxdEf5hI1shPkC8Yv9KhWJCR3YOA6zvbpCFEo7W8Nb3rs
 keBg==
X-Gm-Message-State: APjAAAWm8p3/WejAndrUFKFI4KXijvyOwbU9skJ+Zoy5alK2d6hCOBGM
 iWD6jnW+J87qIu1gZMklb98=
X-Google-Smtp-Source: APXvYqyO/UEbkyX+o2LARCpuQGzWA3r7Etvn60l5Wr1dWngdpTQ4I4GCZwttkesVA1JAAIRDdvT/9Q==
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr3253379wrx.39.1576064083521; 
 Wed, 11 Dec 2019 03:34:43 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id v17sm1853060wrt.91.2019.12.11.03.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 03:34:42 -0800 (PST)
Date: Wed, 11 Dec 2019 11:34:41 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191211113441.xxjswqzovsftudpd@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-6-liuwe@microsoft.com>
 <58dd4638-e23d-4ffc-1e4a-13edf73ebb93@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58dd4638-e23d-4ffc-1e4a-13edf73ebb93@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next 5/7] x86: use running_on_hypervisor
 to gate hypervisor_setup
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDU6MTc6MjhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4gQEAgLTE1
NzcsNyArMTU3Nyw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVk
IGxvbmcgbWJpX3ApCj4gPiAgICAgICAgICAgICAgbWF4X2NwdXMgPSBucl9jcHVfaWRzOwo+ID4g
ICAgICB9Cj4gPiAgCj4gPiAtICAgIGlmICggeGVuX2d1ZXN0ICkKPiA+ICsgICAgaWYgKCBydW5u
aW5nX29uX2h5cGVydmlzb3IgKQo+ID4gICAgICAgICAgaHlwZXJ2aXNvcl9zZXR1cCgpOwo+IAo+
IFRoaXMgY29kZSBpcyB1c2luZyBoeXBlcnZpc29yX25hbWUgYWxyZWFkeSwgc28gSSBndWVzcyB0
aGUgcGF0Y2gKPiBoYXMgYmVjb21lIHVubmVjZXNzYXJ5PwoKWWVzLiBJIGJhc2ljYWxseSBzcXVh
c2hlZCB0aGlzIHBhdGNoIGludG8gbXkgcHJldmlvdXMgc2VyaWVzIHdoaWxlCnJld29ya2luZyB0
aGF0LgoKVGhpcyBwYXRjaCBoZXJlIGlzIG5vdCBuZWVkZWQgYW55bW9yZS4KCldlaS4KCj4gCj4g
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
