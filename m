Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62901802EC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:15:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhVQ-0006x9-2q; Tue, 10 Mar 2020 16:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBhVO-0006x0-Bt
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:13:18 +0000
X-Inumbo-ID: 0d5b2412-62ea-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d5b2412-62ea-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 16:13:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n18so16993409edw.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=de574b32fP7PCsgAUoPswpsAghx9h7AGQ6QqyaEeZRQ=;
 b=ucX3oINKaFxZfauYxJlqnPOfPIobzLYos5p95mbZh7k7hLEn/EnxeKCLu46HmOw375
 OGf2efaYPgtRdyrkqDPx5iHWkBFBQJIUcDr/ITToYDTZaTaoZfu3fN9lo8vzY6VCcaJt
 DbyGj3lnFTqBJai3G8IliohrztHQMh9cdcNV0W1DdtpWQ8gPRwgjHXmT0FnCRcw2icI3
 /LDH1D+wdKolb8bvnnNvrPJhP5+CBP230JiYLCbLmjFsTfoevasbxLrkrZ/REoJ4bV31
 aW6HXOvKHdRfUh/xDKhy2l6b5R6/s8vbTY9tcAwneONMLRIZpDT6r7OdQc4XXuc5xUQO
 fMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=de574b32fP7PCsgAUoPswpsAghx9h7AGQ6QqyaEeZRQ=;
 b=tCQfpor8pZRo93JO8bmMzJZQnwdNIIgw3fvUn3zMus45c7mHmZPjROtauod6PuWxx+
 BKwmSA8JRntN0aALJB9PxkRXSKOp3jtXkrD5ofEgAIr4GGjDWPRlg0bQ2boKraog7yld
 62P0Gjj6V0q5AULxfH7UOFCueUVvWVE9o3LjgwnPreSIMBLR5gD1I4GixwmIcQzFj+yG
 VY3FXDrI0DooWSgsaLYnbyRLsBJXsGREp1UOMYULaYOC/BPYSwRFBXfsfBdbhImJyR1u
 eoD+LyFJMais4Y4X9zr0/7TJYFB4rl1JRTZkUd/1APbrpYFxd42cX6STAJbbH0Xsv8Ew
 ASAw==
X-Gm-Message-State: ANhLgQ0tDRJM8eThxcvr1s7o4RAo6Ce2EdtMvoZDv3b2q/NtDQgZQLt9
 Ut8Cdvs29JLRmHV8ywjVS0E=
X-Google-Smtp-Source: ADFU+vtgD+J+CcLr4twRQR1DUrb0svJegPcTiZIs7wlROKZH7NDgm4m8HBSBBFdy4zny0fOo1el5Mw==
X-Received: by 2002:a17:906:2596:: with SMTP id
 m22mr20190674ejb.167.1583856797018; 
 Tue, 10 Mar 2020 09:13:17 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id d23sm267248edr.33.2020.03.10.09.13.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 09:13:15 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
 <f84b99c1-3b9c-2886-5733-845b19c0c1e4@suse.com>
In-Reply-To: <f84b99c1-3b9c-2886-5733-845b19c0c1e4@suse.com>
Date: Tue, 10 Mar 2020 16:13:15 -0000
Message-ID: <003701d5f6f6$ce32c880$6a985980$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7RxHcSPCUV9p/rP8AmZSLBgrCeQG7r5Zjp+mB2OA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 8/9] x86/HVM: reduce hvm.h include
 dependencies
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Kevin Tian' <kevin.tian@intel.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE1OjUyCj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kKPiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgSnVuIE5ha2FqaW1hCj4gPGp1bi5uYWthamltYUBp
bnRlbC5jb20+Cj4gU3ViamVjdDogW1BBVENIIHYyIDgvOV0geDg2L0hWTTogcmVkdWNlIGh2bS5o
IGluY2x1ZGUgZGVwZW5kZW5jaWVzCj4gCj4gRHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkg
dGhlIGhlYWRlciBpdHNlbGYsIGFuZCBhZGQgc21hbGxlciBzY29wZQo+IG9uZXMgaW5zdGVhZC4g
UHV0IHRoZSBvbmVzIG5lZWRlZCBpbnRvIHdoaWNoZXZlciBvdGhlciBmaWxlcyBhY3R1YWxseQo+
IG5lZWQgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
