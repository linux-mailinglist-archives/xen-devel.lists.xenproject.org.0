Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B37FDF98
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:03:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcAn-0001st-As; Fri, 15 Nov 2019 14:02:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVcAl-0001si-4i
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:02:03 +0000
X-Inumbo-ID: 7f6f2e08-07b0-11ea-9631-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f6f2e08-07b0-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 14:02:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n1so11071906wra.10
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 06:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=AqQWObxtM/E6wprnxytZhCDWqQNufk4HHetx1lroQSY=;
 b=TSkopM1itIu1Jq9hKsaxV6sC0rRhp0I/o0j8ZYrmod/xChx7xI1nbqo2nugmiZLfQ+
 dl3g5nqVUfgQCZiHgjfixYnQ4KwcE432h3eWuJ+OdwxvSd9yuvFJJIif8SGHtV3bRvr7
 uOYulB3iBewXbm7+N9hEL6LVR9aIRDCiwYyPir2VjMpWYhuXdiE4Ktm71b7aMEzbI/pH
 QW2Had9Fgat5HzHzSTHdAWScWuMrF/BVTBVmETrDxfJQfJTDRn/9F0ktmIVMlSYnsLhk
 RoCtUKkNMWa78/114hRxDME6thGtDhd+8M+HCO3sCNdHfj0u1vcaoR9tMo4IeK0gQn1i
 YEWg==
X-Gm-Message-State: APjAAAWhiH8LWIdWX6CD+3Plw/262KxyP2IPF1H1ecvDg0QEm4hHH/Yx
 7nAsUrmgckAL/FBR52y3fP4=
X-Google-Smtp-Source: APXvYqy+rPobYWC6FzRTjGscNHDV4e0kc787vRP1Cm0kGJm4rpgbtUA8OEZSKO6b6/OPVeDQ6J/e5g==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr1599843wrm.327.1573826521894; 
 Fri, 15 Nov 2019 06:02:01 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id x11sm11544797wro.84.2019.11.15.06.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 06:02:01 -0800 (PST)
Date: Fri, 15 Nov 2019 14:01:59 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191115140159.m2eyqlbtwhinl2lb@debian>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <cc10107e-ce08-44ee-1dc0-695020396b11@suse.com>
 <dc06f24a-0db3-ec91-7195-771752ca48e3@eikelenboom.it>
 <f8cdc546-71c9-ff13-4869-dbbb48926303@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8cdc546-71c9-ff13-4869-dbbb48926303@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/6] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDI6NTY6NDhQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiA+ID4gCj4gPiA+IEp1ZXJnZW4KPiA+IAo+ID4gSGkgSnVlcmdlbiwKPiA+IAo+ID4g
U2luY2UgYSBsb3QgbW9yZSByZWNlbnQgcGF0Y2hlcyBoYXZlIGJlZW4gY29tbWl0dGVkLCBidXQg
dGhlc2UgZG9uJ3Qgc2VlbSB0by4KPiA+IEkgd2FzIHdvbmRlcmluZyBpZiB0aGVzZSBmZWxsIHRo
cm91Z2ggdGhlIGNyYWNrcy4KPiAKPiBIaSBTYW5kZXIsCj4gCj4gSSdtIG5vIGNvbW1pdHRlciwg
Imp1c3QiIHRoZSBvbmUgd2hvIGFsbG93cyB0aGUgY29tbWl0dGVycyB0byB0YWtlIGEKPiBwYXRj
aCBvciBzZXJpZXMgYXQgdGhhdCBwaGFzZSBvZiB0aGUgcmVsZWFzZS4uLgoKVGhpcyBzZXJpZXMg
aGFzbid0IGJlZW4gcmV2aWV3ZWQgeWV0LgoKVW5mb3J0dW5hdGVseSwgLUVUSU1FIGZvciBtZSBh
dCB0aGUgbW9tZW50LgoKV2VpLgoKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
