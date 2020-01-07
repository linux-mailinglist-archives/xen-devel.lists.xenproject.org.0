Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF74132B2E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:36:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioroD-0006vG-Hg; Tue, 07 Jan 2020 16:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ioroC-0006v9-2d
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:34:20 +0000
X-Inumbo-ID: 889ea028-316b-11ea-bf56-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 889ea028-316b-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 16:34:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so134631wrq.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 08:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vlez+quuHmistwK1wzGY7/NaT2folilol+e/2tomssE=;
 b=quNHwbdZiFmOA9SSt+ws4SjpN8r4BnKsk+3M4hclB5MXV8Wpg8A2sy/vhtid2Hh83+
 FPc0jUoN0I3q8VU2DGUlFmTMh9t3uhioFrJW2kbIKLMh4UpXs7LRV4y15dClZfXIwdTs
 Ap3lgcVy6KT2i1Uvl8z7pqCGy1NFdd9W1uAc4CHXAfTcEnGI5BrQerRc2ETeIqIksrwx
 hCqItC9q15LA21Fby/POJGQE8zk54ilPEglXInIK+p4XNQaA/zxsoHgYGjJ52DcQBqsU
 rf6PHffAAnHUATqqJWAQkW5h/Fy8OltrjVtp/CDGz8Tjev6qD9E0U94NtrgQRuYhcCHM
 TmjQ==
X-Gm-Message-State: APjAAAUyZ5He2AzTGBy+41rkh+oGluy7E+gfxRCaJlMGbKbl7KXtYwJL
 0nlzQFNQsUtPknlReM2I6EM=
X-Google-Smtp-Source: APXvYqyvD8oP+ccSW5fIX6onI1qdAC84q1erAdAOzqJNE6NmpZchWAXUpOPDK4FdJg2cEuG1IT0UJg==
X-Received: by 2002:a05:6000:1142:: with SMTP id
 d2mr103700058wrx.253.1578414850914; 
 Tue, 07 Jan 2020 08:34:10 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id g9sm407752wro.67.2020.01.07.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:34:10 -0800 (PST)
Date: Tue, 7 Jan 2020 16:34:08 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200107163408.p44u5p6yqg6j4fet@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-5-liuwe@microsoft.com>
 <775b79b4-4b12-62ad-63c3-04cc8179256c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <775b79b4-4b12-62ad-63c3-04cc8179256c@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/hyperv: retrieve vp_index from
 Hyper-V
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

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMTE6MzE6NTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDUuMDEuMjAyMCAxNzo0OCwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LmgKPiA+IEBAIC02Niw2ICs2Niw3IEBAIHN0cnVjdCBtc19oeXBlcnZf
aW5mbyB7Cj4gPiAgZXh0ZXJuIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBtc19oeXBlcnY7Cj4gPiAg
Cj4gPiAgREVDTEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+ID4gK0RF
Q0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKPiAKPiBTYW1lIHF1ZXN0
aW9uIGhlcmUgLSB3aWxsIHRoaXMgbmVlZCB0byBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhlCj4g
ZmlsZSBkZWZpbmluZyB0aGUgdmFyaWFibGU/IEluIHRoZSBvdGhlciBwYXRjaCBhcyB3ZWxsIGFz
IGhlcmUsCj4gaWYgdGhlIGFuc3dlciBpcyB5ZXMsIHRoZSBuZXh0IHF1ZXN0aW9uIHdvdWxkIGJl
IHdoZXRoZXIgaXQgbmVlZHMKPiB0byBiZSB2aXNpYmxlIG91dHNpZGUgb2YgeGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi8gKGkuZS4gd2hldGhlcgo+IGl0IHNob3VsZG4ndCBsaXZlIGluIGEgcHJp
dmF0ZSBoZWFkZXIpLgoKUHJpdmF0ZSBoZWFkZXIgc2hvdWxkIGJlIGZpbmUgZm9yIG5vdy4KCldl
aS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
