Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7D12FB7B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 18:17:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQWv-0004Ok-9S; Fri, 03 Jan 2020 17:14:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpWN=2Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1inQWu-0004Of-Kv
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 17:14:32 +0000
X-Inumbo-ID: 8186b9e6-2e4c-11ea-a4f2-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8186b9e6-2e4c-11ea-a4f2-12813bfff9fa;
 Fri, 03 Jan 2020 17:14:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so43070426wre.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 09:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hHxwdaLTCWh3Vpq/yAcPsdnXr6l+qHooE1puox4hOeY=;
 b=GcWoyqg1kZrtL9afHGErLY1uym1pxwaYd923RTxQWKN3jt35guHkFp6QLk3+Zv3a5N
 DmMNVKnSeogpW35hG2RIuxyimJsY03gx404kqufL55U1lStMBRyHonyc+UYGUq4IppzU
 UoTGbSFSydRvidaV64VUpamvcy9SASc4l+RIKuekLGRcqTry0zb5L7oStpieaV5uqX+r
 sjHWbfhxbh0I3qPL6WdwX9US7M5ob3RY66phFrxP8u1kq8H/LS6NBKyfpT2+siumh+7l
 fQdFyEJatgHO0aX1c4I1mMmfJ22pq4FeAB+wy49HUQyE4JObl6paXEX0Te9DhtB/BoJb
 0ptw==
X-Gm-Message-State: APjAAAXekkG29ucr3IiSUXI8UEfoKO0oWaS+HJIDvB1hKcKqDgPBB6NQ
 Unt9I66rTyo8kGeFDdkvya4=
X-Google-Smtp-Source: APXvYqz0byZsM2AinJwnSGw2ZhWSATTI5jffa33AMSMvF5yXyU0NOd8qCXvzRQFYUeQVYrO2WxT1Ng==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr90113353wrm.48.1578071671020; 
 Fri, 03 Jan 2020 09:14:31 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id z4sm12692899wma.2.2020.01.03.09.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 09:14:30 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200102135624.30787-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <508cdaea-f800-e12d-269d-24fec08bfc60@xen.org>
Date: Fri, 3 Jan 2020 17:14:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200102135624.30787-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/efi: Drop infinite loops and use
 unreachable()/noreturn
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

SGkgQW5kcmV3LAoKT24gMDIvMDEvMjAyMCAxMzo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
