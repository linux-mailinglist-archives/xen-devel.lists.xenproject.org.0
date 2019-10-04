Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D7CB5CA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:12:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGIdz-00054y-5h; Fri, 04 Oct 2019 08:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qonk=X5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iGIdx-00054t-V7
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 08:08:53 +0000
X-Inumbo-ID: 325900d8-e67e-11e9-9745-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 325900d8-e67e-11e9-9745-12813bfff9fa;
 Fri, 04 Oct 2019 08:08:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r5so5879000wrm.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2019 01:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5gECaFgn9TMm+xiUekrzdoV/tvYvaLDi7YOu5iKnqRo=;
 b=C+fKKx2upPR8457FzKB57TrgdngG3Hoz/ezzqetagIjmPaqH6HULvnPrQoDK9RwVbj
 YyGgH+jqeK6XJjSu7z5KtqvJlooairYquogFCUvVvYHg68nIRMqhWt09bYwoavlBvtnN
 vhM9Qxy1g5Ks6OTyHLNuTNLsnSfzbcEPvidoB0naq92u7pZLm/uIOwmCS2akGyzr0P+x
 N+2OrJHLu6CwEJD+yxu9gJoZM3EiIm7P8YgWncKtNZs8D3O/tTL5slJFwGiC47bH28ws
 55cURnmJ9TllycxD4YB5xWeX/Hj7AV778kRb5l3e6NLD54wD5zl6rWSmwAu4t0e/BJQ/
 KZ1w==
X-Gm-Message-State: APjAAAWm6+9X4L1CKaY3q7AyEm4djd18SocBWkNDABqil3gKL8Ao3kYW
 jTjtrU/otIHYL85CBeI79K8=
X-Google-Smtp-Source: APXvYqyerp/hSelXVp57Woq6RGGaT/mU4IDe1szjvPEFJP90reYpP4dd4LRzDF4aLGYDUsJ+RCMUKg==
X-Received: by 2002:adf:b60b:: with SMTP id f11mr9918307wre.95.1570176529352; 
 Fri, 04 Oct 2019 01:08:49 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id w7sm5856439wmd.22.2019.10.04.01.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 01:08:48 -0700 (PDT)
Date: Fri, 4 Oct 2019 09:08:46 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191004080846.e4fu4royzoqpgepe@debian>
References: <20191003104736.32259-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003104736.32259-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix the use of RDTSCP when it is
 intercepted at L0
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Chris Brannon <cmb@prgmr.com>, Jan Beulich <JBeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6NDc6MzZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBMaW51eCBoYXMgc3RhcnRlZCB1c2luZyBSRFRTQ1AgYXMgb2YgdjUuMS4gIFRoaXMg
aGFzIGhpZ2hsaWdodGVkIGEgYnVnIGluIFhlbiwKPiB3aGVyZSB2aXJ0dWFsIHZtZXhpdCBzaW1w
bHkgZ2l2ZXMgdXAuCj4gCj4gICAoWEVOKSBkMXYxIFVuaGFuZGxlZCBuZXN0ZWQgdm1leGl0OiBy
ZWFzb24gNTEKPiAgIChYRU4pIGRvbWFpbl9jcmFzaCBjYWxsZWQgZnJvbSB2dm14LmM6MjY3MQo+
ICAgKFhFTikgRG9tYWluIDEgKHZjcHUjMSkgY3Jhc2hlZCBvbiBjcHUjMjoKPiAKPiBIYW5kbGUg
UkRUU0NQIGluIHRoZSB2aXJ0dWFsIHZtZXhpdCBoYW5kZXIgaW4gdGhlIHNhbWUgd2FzIGFzIFJE
VFNDCj4gaW50ZXJjZXB0cy4KPiAKPiBSZXBvcnRlZC1ieTogU2FyYWggTmV3bWFuIDxzcm5AcHJn
bXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gVGVzdGVkLWJ5OiBDaHJpcyBCcmFubm9uIDxjbWJAcHJnbXIuY29tPgoKUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
