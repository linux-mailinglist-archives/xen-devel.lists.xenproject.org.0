Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B378F8B65F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 13:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxUcj-0003kr-UZ; Tue, 13 Aug 2019 11:05:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nXkd=WJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hxUci-0003km-KG
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:05:52 +0000
X-Inumbo-ID: 4fb3c28c-bdba-11e9-8980-bc764e045a96
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4fb3c28c-bdba-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:05:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z1so107351569wru.13
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2019 04:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yFPk+JGPVnjIej4T3KQckV/3DB5EkSjvI2Tbea7RLxU=;
 b=FQA86xloqK4LKWHvC457W8LL6xac5SLYE8yCxlkHD3Vit9ZSVLsMigdniagy6mJc0r
 KCE7UmUp88ZSZwLQDs3euvTplsAhxD+sSBPUn/mlDE4tddfE3Wl5Ty8/bN56/kZUIcOi
 QRq79YJ2i6mqzeGgLrPc6iT4ifADXp6UzShZZlxp471LbahVElJpB3rpexaD2cFBph/T
 0bGWYZScITEGcp7KQv0QOWL7QV1OryDkl/88frYj+U5lmSMLAGZCcfnU13elllFz57px
 nJJrpOQYK8aYpLE9NVTSPGnL5foaII6Ql0tQpgscGvcW4FCNZAaV66AVUbp7PW5BIT+t
 5xLg==
X-Gm-Message-State: APjAAAWkjW2535kS3rIriWmtEWrFpFx7j9dB6ukCmGl28WCn3r+/BCOy
 WrBgAwSA7+Oq/QtTmCMYI/U=
X-Google-Smtp-Source: APXvYqzB8Bvv0u5MhRXP9Qr1QaIBsf6m78XyTJ11AKntZ035ELIILnT5nTmR1GyDKd+GtYOAkTyFZA==
X-Received: by 2002:adf:f584:: with SMTP id f4mr31609992wro.160.1565694350319; 
 Tue, 13 Aug 2019 04:05:50 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id b2sm16333587wrf.94.2019.08.13.04.05.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 04:05:49 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:05:48 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190813110548.wssbumuaz3vlj6ov@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190812151032.9353-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812151032.9353-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/boot: Simplify %fs setup in
 trampoline_setup
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDQ6MTA6MzJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBtb3Yvc2hyIGlzIGVhc2llciB0byBmb2xsb3cgdGhhbiBzaGxkLCBhbmQgZG9lc24n
dCBoYXZlIGEgbWVyZ2UgZGVwZW5kZW5jeSBvbgo+IHRoZSBwcmV2aW91cyB2YWx1ZSBvZiAlZWR4
LiAgU2hvcnRlbiB0aGUgcmVzdCBvZiB0aGUgY29kZSBieSBzdHJlYW1saW5pbmcgdGhlCj4gY29t
bWVudHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
