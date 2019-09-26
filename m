Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE646BF639
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDW0u-0001xj-As; Thu, 26 Sep 2019 15:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDW0s-0001xd-Nu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:49:02 +0000
X-Inumbo-ID: 291bb632-e075-11e9-97fb-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by localhost (Halon) with ESMTPS
 id 291bb632-e075-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 15:49:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 3so3127214wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 08:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/jejOBsv/3sVXQxNGp4i3pjcCx6AGaAELmIOLxGBx4k=;
 b=bOtIJYHTef6Z+4TksXkAmHJXoqu//sTUdxJJTSYAqgkc3S7ij8D/7e2S83Iwxnm+EJ
 jqBy9rLeFPm/SXNeNUbPgfQ1j85fL8qxAeSwXTKry+v+w1mmch89e2Qi00rZnEQcAHDP
 4MFWUNqnh7Bks6DU9jPJ26GAyMail2oC+sS4/5XgH82ZuNB7F3H+eXeI8VLI4SJqmfDC
 7T/X50TPihg+bl9dOA2NEy1vPPidhTrxZFhQABAt9wxI0SB7SFgikD6liBy0pxWwy/R/
 yKaEsXKbGts4gerNEp6FOlXnDgzEWUmDtD8+rpjZNMKoCnz69pC4xAtnj91UlZYR3ind
 QOlQ==
X-Gm-Message-State: APjAAAXhS/SNQFKds7BUOdGHh59G+7MbZIGsK9bbRBDzXXsyt/9YJFaF
 zSFbJgtsE4U90SY3xJmRnuo=
X-Google-Smtp-Source: APXvYqzdAR9cwni6wMzGv4pscdqQVm9D2ZJ/4Pcq3IJC2EX0usSsrjdA5K+3MqgSY2Bd/9icW6sw6A==
X-Received: by 2002:a05:600c:389:: with SMTP id
 w9mr3463071wmd.139.1569512941356; 
 Thu, 26 Sep 2019 08:49:01 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id c10sm5438663wrf.58.2019.09.26.08.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:49:00 -0700 (PDT)
Date: Thu, 26 Sep 2019 16:48:59 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926154859.3prekqucyrbn27ja@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <f4c05d048bbad24972874e978f4266abb32cdc3c.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4c05d048bbad24972874e978f4266abb32cdc3c.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 82/84] x86: deduplicate code a bit and
 fix an unmapping bug.
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6NDVBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gIHZv
aWQgdW5tYXBfZG9tYWluX3BhZ2UoY29uc3Qgdm9pZCAqcHRyKQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwo+
IGluZGV4IDE1NTVhNjFiODQuLjIwMmVkY2FhMTcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L3B2L2RvbTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKPiBA
QCAtMjM2LDcgKzIzNiw3IEBAIHN0YXRpYyBfX2luaXQgdm9pZCBzZXR1cF9wdl9waHlzbWFwKHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgcGd0YmxfcGZuLAo+ICAgICAgaWYgKCBwbDNl
ICkKPiAgICAgICAgICB1bm1hcF9kb21haW5fcGFnZShwbDNlKTsKPiAgCj4gLSAgICAvL3VubWFw
X2RvbWFpbl9wYWdlKGw0c3RhcnQpOwo+ICsgICAgdW5tYXBfZG9tYWluX3BhZ2UobDRzdGFydCk7
CgpQbGVhc2UgZml4IHRoZSBidWcgd2hlcmUgaXQgd2FzIGludHJvZHVjZWQuCgpXZWkuCgo+ICB9
Cj4gIAo+ICBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqIF9faW5pdCBhbGxvY19jaHVuayhzdHJ1
Y3QgZG9tYWluICpkLAo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
