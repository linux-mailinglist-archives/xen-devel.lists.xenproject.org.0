Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDBC108F85
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:04:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZEwY-0007KU-56; Mon, 25 Nov 2019 14:02:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BGRM=ZR=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iZEwW-0007KP-2D
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:02:20 +0000
X-Inumbo-ID: 31cef0b4-0f8c-11ea-b08b-bc764e2007e4
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31cef0b4-0f8c-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 14:02:19 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id i3so5970329ybe.12
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 06:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r8edulbtwbwsXC3ue5ssAoGTkZxFnne5AGxgRVOeOYQ=;
 b=W+YAQm/tcvUAg1sgN9LjkMqCfli32yJbre2l7nQE00rC2qKJFKtUtnjgN1vMD0RCu/
 2svH75mVtxXyygHEsmBfCeUWKg1QZSREUmFjEjs0AQx5+KSRGRCEZOn+Ocvat6piA6gO
 Vhn+8cSJ0/vrxhlXIWgHJ5SvoUofNhJsDobWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r8edulbtwbwsXC3ue5ssAoGTkZxFnne5AGxgRVOeOYQ=;
 b=pwtfcRPj/AOhoGZGbiU3XC9073w5cwLzCBFjDvMyyegzMCXu+9vIcoUGM4EtECQFme
 8aoILq1fHxyEcVtDwE0E1owlbcJJ6s1b0+8BxeMdmX3Wco04mEk4pmraBAfQU+wywDq/
 KhLlYH+sCPqlbaSuHb8+iW3WHzqfgJWiHAjszaSGacdPHZ5WkMppgFKYUhJufjPM6Bo1
 13ouDkBsWAIFvG+sZEM6XjNPEZ0zGcVcMhedcTG8cOOpJAxLL6ni/Sol8e5wvMTDzOQM
 zIXJvRxixFG++9X3jTmmEoWVUMV/OMCfxmqklbTE38R2ICfaZw9O2XOXINmSO1tlApFZ
 kgoA==
X-Gm-Message-State: APjAAAUxsv5M/Ptor2yCSPpwEmEnS3IwGpWH3LPucTb5hQWmunQBt0rV
 AQQRmvsP5/eErlu8mW3czv/6vw==
X-Google-Smtp-Source: APXvYqx65pe1JNgjAv1Wk93qWTmFDAMWWgVLgu1WzXAmVSaqWME6E/7TfBeMzyRHg1IwGQbHoUXUlg==
X-Received: by 2002:a25:a143:: with SMTP id z61mr10048204ybh.367.1574690538918; 
 Mon, 25 Nov 2019 06:02:18 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:546b:4824:2cc1:3b48])
 by smtp.gmail.com with ESMTPSA id z14sm3798257ywj.74.2019.11.25.06.02.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2019 06:02:18 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
Date: Mon, 25 Nov 2019 08:02:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjEvMTkgMTI6MDUgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cgo+IFdoZXJlIGRvIHdl
IHN0YW5kIHdpdGggWGVuIDQuMTMgcmVnYXJkaW5nIGJsb2NrZXJzIGFuZCByZWxhdGVkIHBhdGNo
ZXM/Cj4KMS4gQ3VycmVudGx5IHRoZSBkZWZhdWx0ICJtYWtlIGluc3RhbGwiIGZhaWxzIHdpdGgg
ZXJyb3JzIGluIAp0b29scy90ZXN0cy94ODZfZW11bGF0b3IgaWYgeW91IGRvbid0IGhhdmUgYSBu
ZXcgZW5vdWdoIEdDQy4gQ2F1c2luZyAKZmFpbHVyZXMgb24gZGlzdHJvcyB0aGF0IGFyZSBjb25z
aWRlcmVkIHN0aWxsIHN1cHBvcnRlZCBiYXNlZCBvbiBSRUFETUUuCgoyLiBUaGUgaHlwZXJ2aXNv
ciBjdXJyZW50bHkgZmFpbHMgdG8gYnVpbGQgd2l0aCBjbGFuZyB1c2luZyB2ZXJzaW9ucyAKdGhh
dCBSRUFETSBzYXlzIGFyZSBzdXBwb3J0ZWQgbm8gbWF0dGVyIHRoZSBjb25maWd1cmF0aW9uLgoK
LS0KCkRvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
