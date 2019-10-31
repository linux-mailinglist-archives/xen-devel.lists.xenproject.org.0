Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9FEB779
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 19:45:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQFP1-0002eA-CZ; Thu, 31 Oct 2019 18:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RS8g=YY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iQFP0-0002e5-Hv
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 18:42:34 +0000
X-Inumbo-ID: 32dbfa74-fc0e-11e9-9550-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32dbfa74-fc0e-11e9-9550-12813bfff9fa;
 Thu, 31 Oct 2019 18:42:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e6so5562715wrw.1
 for <xen-devel@lists.xen.org>; Thu, 31 Oct 2019 11:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1ZaRhIoqZiY9QlKS2ubMwFZxWt9zJZB1wBfAHrz8IRk=;
 b=XB3nXcNGYg5kxZYX9DieM8max7zuu8GfBnJ/EiJWGhGEwgoNl+UfonUjCSqCngEATi
 wdR2DgpClQiF52GXbZWC8+9QCw8JFgngKm5zTv4nPVHr26mbiw59815mEG6e0Jn/mUxr
 tYw8v4ZIPBehTUoVbILxIIjKSKAqpbQGhJniCElwkJgSkMfncBQrcMB447CKRbm9hQhp
 ooxSzS8yrk3v9CwRXa5I9k1pmgqZwWiXy3EXBmTymE1c6Mx/OIt7S2x8mnl3HnFA1F0e
 I7K3gRSI1NAM4wHrKSVaNOt5i/BeGA3ygA0bjXBilT+qzMMFfCEIDiIaOoVF2N9xOuRC
 zHSg==
X-Gm-Message-State: APjAAAWhr/09e5Cy0fyjJ7a9lq2PtKgL4DVGhw4/UBA7EtE0n2aDZ/n7
 e1iFh5AYrwk0AJtLN5/v97A=
X-Google-Smtp-Source: APXvYqwdNflmqISDtTLK9V7Teul0Er7cav1x1hP1S+jylqwFaJ8A4eUK3CSmlWcuNBefM8hdFbTfXA==
X-Received: by 2002:a5d:634b:: with SMTP id b11mr7349507wrw.13.1572547352137; 
 Thu, 31 Oct 2019 11:42:32 -0700 (PDT)
Received: from debian (30.162.147.147.dyn.plus.net. [147.147.162.30])
 by smtp.gmail.com with ESMTPSA id c137sm2004887wme.37.2019.10.31.11.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 11:42:31 -0700 (PDT)
Date: Thu, 31 Oct 2019 18:42:29 +0000
From: Wei Liu <wl@xen.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20191031184229.nqmdf63icfan4eqi@debian>
References: <20191030145447.11122-1-sergey.dyasli@citrix.com>
 <20191030145447.11122-2-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030145447.11122-2-sergey.dyasli@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 for 4.13 2/2] x86/e820: fix 640k - 1M
 region reservation logic
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
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDI6NTQ6NDdQTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPiBDb252ZXJ0aW5nIGEgZ3Vlc3QgZnJvbSBQViB0byBQVi1pbi1QVkggbWFrZXMgdGhl
IGd1ZXN0IHRvIGhhdmUgMzg0awo+IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVz
dCdzIGJhbGxvb24gZHJpdmVyLiBUaGlzIGhhcHBlbnMKPiBiZWNhdXNlIFhlbiB1bmNvbmRpdGlv
bmFsbHkgcmVzZXJ2ZXMgNjQwayAtIDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKPiB0aGUgZmFj
dCB0aGF0IGl0J3MgcmVhbGx5IGEgdXNhYmxlIFJBTSBpbiBQVkggYm9vdCBtb2RlLgo+IAo+IEZp
eCB0aGlzIGJ5IHNraXBwaW5nIHJlZ2lvbiB0eXBlIGNoYW5nZSBpbiB2aXJ0dWFsaXNlZCBlbnZp
cm9ubWVudHMsCj4gdHJ1c3Rpbmcgd2hhdGV2ZXIgbWVtb3J5IG1hcCBvdXIgaHlwZXJ2aXNvciBo
YXMgcHJvdmlkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5
YXNsaUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
