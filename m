Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D10BF634
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:50:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVyH-0001c5-HV; Thu, 26 Sep 2019 15:46:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDVyG-0001c0-DF
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:46:20 +0000
X-Inumbo-ID: c85cce9e-e074-11e9-97fb-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id c85cce9e-e074-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 15:46:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i1so3352197wro.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 08:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m9sVH0SvOXXf63sXGOk68FT8hLQf4CJZ2HFKXtpCFZ8=;
 b=RbYBNZpcSZeQbNyWRWPIWbkUWC8AO5TRBYW6sO0tZ8YHoC6epQfAKfw2B6J1nZwwfF
 Ft+GeLnVhyxdHn1CXGbzrGMX9VPtd/mCBVGgIY9HgC8PxCgjp522lpxtS6z1ORfAgPUT
 g888JoohDTBL71JhdfFNKzUvLRdicJcEQC08lUZ/KYq4lKfau5wwz62xtdFVVSkjPG4J
 fJUuP3z4CEUnP/u+kIsykm77MzE6XtcHt0Ff5UKj6Pkrc5a9Op2IIQ4VPPS1b38nZZ6c
 4M9ocmequLLm81F3gfbJ4aV33p5noclJkR2oAqJjb2/jmQuwc7wSu/QI3eSPbAfNVQ7x
 Pm7g==
X-Gm-Message-State: APjAAAVVZEzr8JhhM9bT4wzv9P8TwmgC7xX4INqbCRuEQdMhlsueAxPV
 jo02Px6M3frJWr9VoZXJpak=
X-Google-Smtp-Source: APXvYqzqsQLIUSCPu3mfRgat4EbpMDX6NHWBfZX2DL/7bXNUNDxRGHRqhj62CzE9b3SMqfxFWcIvjQ==
X-Received: by 2002:adf:e48a:: with SMTP id i10mr3458832wrm.311.1569512779076; 
 Thu, 26 Sep 2019 08:46:19 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id z6sm2272029wro.16.2019.09.26.08.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:46:18 -0700 (PDT)
Date: Thu, 26 Sep 2019 16:46:16 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926154616.txfhyhtmum7fevhj@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <08be36e125433c438191fa17bbdaed5b50088530.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08be36e125433c438191fa17bbdaed5b50088530.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 81/84] x86/mm: optimise and properly
 unmap pages in virt_to_mfn_walk().
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6NDRBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
VGhpcyBhbHNvIHJlc29sdmVzIGEgbWFwY2FjaGUgb3ZlcmZsb3cgYnVnLgoKClRoaXMgc2hvdWxk
IGJlIHNxdWFzaGVkIGludG8gdGhlIHBhdGNoIHRoYXQgdG91Y2hlZCB2aXJ0X3RvX21mbl93YWxr
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
