Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF4BF632
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:49:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVzL-0001fq-Ts; Thu, 26 Sep 2019 15:47:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDVzK-0001fg-GW
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:47:26 +0000
X-Inumbo-ID: efa65196-e074-11e9-9659-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id efa65196-e074-11e9-9659-12813bfff9fa;
 Thu, 26 Sep 2019 15:47:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y19so3361665wrd.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 08:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kzNR+T1yL/El0CDPcmXZ2hwszNyAOPWOsohkRClj7FE=;
 b=pMLuLzC3FAPCCnUSl6p274hlmMDnj1UeZ2veHjOIEnrGZxqePNtXCa+WygLdTqtLgX
 bwh21SC36srXRaXbrvmGkhFYmAbpDXACYjDn0KN/l61LOIBiWTXgffnJTjTh0WqGrtHs
 ETmbl5tDkwtf8o8Ahgs0qRiD6ewftSJpdL1DRN7orDFBbp4NN4e9otRPRk/LxMxvGp9d
 v+QBQ6+8P3GZzT0CF1t7J9ylR2WOCb3oheDMntaXWU66VOoqvL8KNTlsNupYHalcG5Od
 SI4TFVe8iiEPbcK2W7gw0KemymGhSaa4mxPJOiyNhmL7AgPH/1WNZWTpIDaJ0RNnSegb
 fJuA==
X-Gm-Message-State: APjAAAX0WnDbPgcjpn78Vmsx0/dxjlz6SE3KuD3IFkxs+5/pp+Olw2T7
 IUkSzuPlb+8F5O6Bxx9eeh7WlIq0
X-Google-Smtp-Source: APXvYqzkWSPNL2aiVq4CTZJlWkXsJr2CJhlMMiuLoXddR012dqrjQFAGFXJ6ZOu/NmkJ4CLehOS8TA==
X-Received: by 2002:adf:d84f:: with SMTP id k15mr3433351wrl.70.1569512845056; 
 Thu, 26 Sep 2019 08:47:25 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id b12sm2422300wrt.21.2019.09.26.08.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:47:24 -0700 (PDT)
Date: Thu, 26 Sep 2019 16:47:22 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926154722.uj3jozev4k5zwxqa@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <969374c5a1c62eabb329694092d551b04d77b8be.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <969374c5a1c62eabb329694092d551b04d77b8be.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 80/84] x86/setup: Install dummy 1:1
 mappings for all mem passed to allocators.
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6NDNBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
VGhpcyBtZWFucyB3ZSBubyBsb25nZXIgaGF2ZSBhbiBhbHdheXMtbWFwcGVkIGRpcmVjdCBtYXAg
bm93LgoKQnV0IHdoeSBhIGR1bW15IG1hcHBpbmcgaXMgdGhpcyBuZWVkZWQgYXQgYWxsPyBUaGF0
J3MgdGhlIHNhbWUgcXVlc3Rpb24KdGhhdCB3YXMgYXNrZWQgaW4gYSBwcmV2aW91cyBwYXRjaC4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
