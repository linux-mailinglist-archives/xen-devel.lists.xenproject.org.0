Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774FD11617E
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 13:05:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idvGH-00016F-4x; Sun, 08 Dec 2019 12:02:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+SuD=Z6=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idvGG-000169-7m
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 12:02:04 +0000
X-Inumbo-ID: 8bf0bb88-19b2-11ea-86b0-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bf0bb88-19b2-11ea-86b0-12813bfff9fa;
 Sun, 08 Dec 2019 12:02:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s14so11903278wmh.4
 for <xen-devel@lists.xenproject.org>; Sun, 08 Dec 2019 04:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JD7AenCTr+4Fb3PrWOnogabtmlelRA1PIMXIGja2p6k=;
 b=Iut8akRwMAVbavcMH6FRAYbofmoo/CkMYsDh7//URATdQovk9pYllW0wHFDjQPEuiq
 JqRzpk06zGaBMIgRiXPPOfjUVhBN/bdtNTWvWW8bZBwjFvcYYehCsmGzRmg8NCFpnMrV
 y1zFhA7mMaic7yDuXUclxenFVPE81bxQLutW1QWd9iYNtv08OgUThtYTZf+g4GdnKEIg
 cDtZ3gW6ROEP1pjidMkZcjE9lR+g9iI5LTiAczoha2OS7gHHB045SFubJ7oPp2Jh0K0F
 CIMy3bJ+xrVjWQZTw1gVXwKL/kJvEiBvD8zwwRodbI2xH6Q8NdMsHeyRshxH0C73NZ25
 CSPQ==
X-Gm-Message-State: APjAAAWS3BKZtaMGObizGFnvjlYoEBPkwQ8iSxdnkEAk6Ma6RNI1C7dZ
 t1LZRsVGwwCGc/lky5yO09I=
X-Google-Smtp-Source: APXvYqzbFQz2gbH8vP6R/IlueL5Zw8SwBiOi/g1w3fWZwRho42bvg5VENpPsUJdfeU3NeGhwcmJY4g==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr18927779wmc.119.1575806522807; 
 Sun, 08 Dec 2019 04:02:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-225.amazon.com.
 [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id l17sm9956474wme.45.2019.12.08.04.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2019 04:02:01 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0c1db85c-14cf-c799-e0a1-a7c70910a75c@xen.org>
Date: Sun, 8 Dec 2019 12:02:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-3-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/6] xen/tasklet: Switch data parameter from
 unsigned long to void *.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDUvMTIvMjAxOSAyMjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBN
b3N0IHVzZXJzIHBhc3MgYSB2Y3B1IHBvaW50ZXIsIGFuZCBvbmx5IHN0b3BtYWNoaW5lX2FjdGlv
bigpIHRha2VzIGFuIGludGVnZXIKPiBwYXJhbWV0ZXIuICBTd2l0Y2ggdG8gdXNpbmcgdm9pZCAq
IHRvIHN1YnN0YW50aWFsbHkgcmVkdWNlIHRoZSBudW1iZXIgb2YKPiBleHBsaWNpdCBjYXN0cy4K
PiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
