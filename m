Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A4184696
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:12:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCj8Y-0003aH-0q; Fri, 13 Mar 2020 12:09:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72WQ=46=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jCj8V-0003aC-US
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:09:55 +0000
X-Inumbo-ID: 8cdedebe-6523-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cdedebe-6523-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 12:09:55 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a20so11624968edj.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=MTH0vocSm3ueCVL9f2W2O8mau5ZtFT0HdtyxxNJ30Go=;
 b=OCA6CuqRXhmVV1jxwKtF8rKnQL53/6Aop3ZLDcN+AEr4/yBTrYCauiPFFCoKbhNSoM
 WLmiuDj7d8hKbHM6ra5GmZRo5y2/hUVAnoKHapS6JErT1nNxoT0V7VTwCknxSytm5A2q
 WNGR2BkLt8mK6ch9G+cRzEh2IudRGtwKoq8HB7xE1iJ60+1DSIc3Qoqreq3f1dDg3jKO
 3SyYZ2TTchalQ+TWdGxZiQcbPPzKZ5mTAgBVyxPors70wXm/hyBWBO96sTzXn5kiAits
 6c7lxDEJW9Yr6u0Hy9cn5+3Iup9sFQiUarXEh2Wmhzj2WNYYfcdBQOGa6+zdZDnNzk4u
 9DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=MTH0vocSm3ueCVL9f2W2O8mau5ZtFT0HdtyxxNJ30Go=;
 b=UOTJg8YTWJjAfcnn5XVW85xGWrJJwNal4hbB0ZJeKQxmBxhtiNWSrnZ2vMN3SoO8GJ
 cJNl591b8uoofVIBHO6gFNmzC2CSfq6Tmab7RkD6qKHAhb+Ee63gEJ6r6Kb2DGSG14a0
 1ZyyvOX+B7AS1WuQvXdHNfJmrfr3S3sfXiHl1sAlB+kTaVYfehTs1a1fOCPaVPa3piQx
 Wvg1f9C35hsqfkkHwy6buUhbgoR1HQAOl3bsZ3KnkgLLl4qMoiASLET1aYVCtzK9W9aK
 9I9Vz1qBb/1eid8qiRq+tMmR6vD8/5OFu4c2e39CnyAUPKlOwZxWqjGiqsngfreBgHxS
 1r4A==
X-Gm-Message-State: ANhLgQ2hiAmrmwsFMUQ8oGXVwfgLUfLcouYZ9AMltMd8pe/WHnJfqSbh
 X6ngYdJ5zsGX9j4jHOC/K4U=
X-Google-Smtp-Source: ADFU+vsSa2AREGtL74SvnUg3CZ+ygV7nicnWKMTN4+hzo9HqPAF02Zn824rB1vjfG/cIPBJviOCoRQ==
X-Received: by 2002:a50:8c03:: with SMTP id p3mr12684111edp.129.1584101394651; 
 Fri, 13 Mar 2020 05:09:54 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id u26sm4155781ejb.34.2020.03.13.05.09.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 05:09:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200312202407.1154-1-julien@xen.org>
In-Reply-To: <20200312202407.1154-1-julien@xen.org>
Date: Fri, 13 Mar 2020 12:09:53 -0000
Message-ID: <00b701d5f930$4e171660$ea454320$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJLIYHR3+SYeHFTshWVjeN1cepDQ6dcHXWQ
Subject: Re: [Xen-devel] [PATCH] tools/helpers: xen-init-dom0: Mark
 clear_domid_history() static
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
Cc: 'Julien Grall' <jgrall@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGp1bGllbkB4ZW4ub3JnIDxqdWxp
ZW5AeGVuLm9yZz4KPiBTZW50OiAxMiBNYXJjaCAyMDIwIDIwOjI0Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
PjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsKPiBwYXVsQHhlbi5vcmcKPiBTdWJqZWN0OiBbUEFUQ0hdIHRvb2xzL2hlbHBlcnM6
IHhlbi1pbml0LWRvbTA6IE1hcmsgY2xlYXJfZG9taWRfaGlzdG9yeSgpIHN0YXRpYwo+IAo+IEZy
b206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4geGVuLWluaXQtZG9tMCBp
cyBhIHN0YW5kYWxvbmUgYmluYXJ5LCBzbyBhbGwgdGhlIGZ1bmN0aW9ucyBidXQgdGhlCj4gbWFp
bigpIHNob3VsZCBiZSBzdGF0aWMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4KPiBDYzogcGF1bEB4ZW4ub3JnCgpSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
