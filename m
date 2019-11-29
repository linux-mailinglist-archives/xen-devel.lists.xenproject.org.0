Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F510D451
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:42:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadgs-0002Et-Rd; Fri, 29 Nov 2019 10:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z6ZB=ZV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iadgr-0002El-Gl
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:39:57 +0000
X-Inumbo-ID: 95af7e0e-1294-11ea-a3e1-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95af7e0e-1294-11ea-a3e1-12813bfff9fa;
 Fri, 29 Nov 2019 10:39:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n5so14499483wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 02:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iep7O+9AgS/eIC5vP/y+e0KFgTPfoS/q7n5kTjVXHZ4=;
 b=XEm76dzPK8W5WiHYZP3W7tSclv5TuqpgR0NCKavjlsYPdTSmz4/OxPQ3vDXfAWD304
 QsEVbd6ZSIFFgaGcytmvmL99XTrZ45NLsHSesJOjKeF0wcwohMGoWsAbslDWCvqeYqcI
 R2hw8umxyYg3LtJmCtSGlJXk/lWfgZhfWhfnux8Mhxya8TCWz+Xe5xsvrBF0EfkJ1D+U
 j++OU4O/Gx4AMeX43mwngwFgLZAuodg5qGJp3NuPf2L/oLSIdkD+rgukmWFOo6UzK25w
 EQ80jaaQ2isLIf9q5qdA5NHC6klmOI0lOa00R5dx1Kj5p7YcrcYNq+P7UTJjONnnMhxI
 i4tA==
X-Gm-Message-State: APjAAAWHQBGzT4t0u+yzVPda/4X21Oi8R7YhoyziPAOXBWHCNkES0ypR
 1JelLr6OQ2GXLYizZUoreVc=
X-Google-Smtp-Source: APXvYqwG7BdJA72jwKElRwNN0PhBW/V5RmnpNsz9bNN7zuJ+LtS79bgeGHTED+z0uVX/pYO9n0ozTQ==
X-Received: by 2002:a05:600c:a:: with SMTP id
 g10mr14140584wmc.69.1575023996044; 
 Fri, 29 Nov 2019 02:39:56 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id u203sm13516982wme.34.2019.11.29.02.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 02:39:55 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9d917ebd-1e9a-2cc1-7372-67a08d311884@xen.org>
Date: Fri, 29 Nov 2019 10:39:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOS8xMS8yMDE5IDEwOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGUgc3dpdGNo
IG9mIGd1ZXN0X2NvbnNvbGVfd3JpdGUoKSdzIHNlY29uZCBwYXJhbWV0ZXIgZnJvbSBwbGFpbiB0
bwo+IHVuc2lnbmVkIGludCBoYXMgY2F1c2VkIHRoZSBmdW5jdGlvbidzIG1haW4gbG9vcCBoZWFk
ZXIgdG8gbm8gbG9uZ2VyCj4gZ3VhcmQgdGhlIG1pbl90KCkgdXNlIHdpdGhpbiB0aGUgZnVuY3Rp
b24gYWdhaW5zdCBlZmZlY3RpdmVseSBuZWdhdGl2ZQo+IHZhbHVlcywgZHVlIHRvIHRoZSBjYXN0
cyBoaWRkZW4gaW5zaWRlIHRoZSBtYWNyby4gUmVwbGFjZSBieSBhIHBsYWluCj4gbWluKCksIGNv
bnZlcnRpbmcgb25lIG9mIHRoZSBhcmd1bWVudHMgc3VpdGFibHkgd2l0aG91dCBpbnZvbHZpbmcg
YW55Cj4gY2FzdC4KPiAKPiBGaXhlczogZWE2MDFlYzk5OTViICgieGVuL2NvbnNvbGU6IFJld29y
ayBIWVBFUkNBTExfY29uc29sZV9pbyBpbnRlcmZhY2UiKQo+IFJlcG9ydGVkLWJ5OiBJbGphIFZh
biBTcHJ1bmRlbCA8aXZhbnNwcnVuZGVsQGlvYWN0aXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpTb3JyeSBmb3IgdGhlIGJyZWFrYWdlLgoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpDaGVlcnMsCgo+IAo+IC0t
LSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9j
b25zb2xlLmMKPiBAQCAtNTM4LDcgKzUzOCw3IEBAIHN0YXRpYyBsb25nIGd1ZXN0X2NvbnNvbGVf
d3JpdGUoWEVOX0dVRVMKPiAgICAgICAgICAgICAgICAgICBfX0hZUEVSVklTT1JfY29uc29sZV9p
bywgImlpaCIsCj4gICAgICAgICAgICAgICAgICAgQ09OU09MRUlPX3dyaXRlLCBjb3VudCwgYnVm
ZmVyKTsKPiAgIAo+IC0gICAgICAgIGtjb3VudCA9IG1pbl90KGludCwgY291bnQsIHNpemVvZihr
YnVmKS0xKTsKPiArICAgICAgICBrY291bnQgPSBtaW4oY291bnQgKyBzaXplb2YoY2hhclswXSks
IHNpemVvZihrYnVmKSAtIDEpOwo+ICAgICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdChrYnVm
LCBidWZmZXIsIGtjb3VudCkgKQo+ICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gICAK
PiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
