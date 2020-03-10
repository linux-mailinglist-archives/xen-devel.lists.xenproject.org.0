Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FC1802E2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:11:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhRB-000637-11; Tue, 10 Mar 2020 16:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBhR9-000632-UY
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:08:55 +0000
X-Inumbo-ID: 7083fa38-62e9-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7083fa38-62e9-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 16:08:54 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id a13so17029553edh.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=9wzU3i61uNIL1fZmHG88ALepcFQWKinYFzAPnGWD/5A=;
 b=TmvfLf5xSLNCOPb7NOUAuIHkw/0PrsRENKbgGPomHq8Zo5ZqDF63EjnWxxL7iSgY7Y
 T/oM5IINpkdYCtdZnF5gRoR8cIeTTKuWV9UH0ZXmqq8ujI0mz1r8vibrY9EpJdzbTSYy
 U4aGBubU5v/3fsQ5Q977oEiF+io/86dxQhw3zjTiSuYTDuySECyMSV1DlHeW6iZI+Gdy
 krV6lkLS7Tw4tmropQx79/zN+nYEeC4zWAlxDkWsPntlBDyYTnMTUC3aPnpko2loyYPy
 3/72L9/CysQX01QoygrCXu71qOG/AhZvT7AZE4UFC5XTuwL13rhXp/YoMfnbVGAPiOCs
 2Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=9wzU3i61uNIL1fZmHG88ALepcFQWKinYFzAPnGWD/5A=;
 b=TrBIe2vqtIK6VsiKve7BpWoyjP8dyddL2iJGEMHg/jQ82O4cmb9zSPnabpe45FLBD9
 /8p1U/t9ugvxKGvLkrD2V9naz2GILXdmeAsw14xKLJIcDQJdPSkRL+aKwOMheHCTbiqP
 +TOfeqA8SmG1E0AXGNnKQIjCMkxYzfQYo107iLCeKpBQ7GbZfyLUvkJhqaK4g3OK9Dp5
 bejwjK7Yrckg4fvQpfGUqrRwE3wBZcCx4tNXI2RENRGTESWAOmICQTpH72FChb6gdoJq
 P9i48Ppd3CPzeP7ycbqpnp/O5puv85VHNy9UBjRdmhcIYeyDcUaWHH9zKb92eKltc2wm
 iJjg==
X-Gm-Message-State: ANhLgQ3dET3lZC08uaShRiFdO8LtaKZeLWs6T4TFJ5tkv6+EuWYB25W7
 U5xTrkvsVKKog9OMg5Yh9ks=
X-Google-Smtp-Source: ADFU+vvhPp7UttKxtjEk8944ZII2z/pnaJPJnkRQsd9t22c7Y3WzHdFxnHgPKQa7Cs9W5TYmMkXA7Q==
X-Received: by 2002:a17:906:8254:: with SMTP id
 f20mr20309309ejx.43.1583856533877; 
 Tue, 10 Mar 2020 09:08:53 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id l4sm3654969eds.3.2020.03.10.09.08.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 09:08:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
 <7dceca7f-f0fc-a4a1-eb9b-0a69ab3f4df1@suse.com>
In-Reply-To: <7dceca7f-f0fc-a4a1-eb9b-0a69ab3f4df1@suse.com>
Date: Tue, 10 Mar 2020 16:08:52 -0000
Message-ID: <003501d5f6f6$31af56e0$950e04a0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7RxHcSPCUV9p/rP8AmZSLBgrCeQIxw9UCp+XP/DA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 2/9] x86/HVM: reduce vcpu.h include
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE1OjQ5Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kKPiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiBTdWJqZWN0
OiBbUEFUQ0ggdjIgMi85XSB4ODYvSFZNOiByZWR1Y2UgdmNwdS5oIGluY2x1ZGUgZGVwZW5kZW5j
aWVzCj4gCj4gRHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYu
IFB1dCB0aGUgb25lcyBuZWVkZWQKPiBpbnRvIHdoaWNoZXZlciBvdGhlciBmaWxlcyBhY3R1YWxs
eSBuZWVkIHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
