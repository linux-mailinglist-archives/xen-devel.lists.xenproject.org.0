Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43410DE34
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 17:13:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib5It-0001Il-4c; Sat, 30 Nov 2019 16:09:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDlk=ZW=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ib5Ir-0001If-BS
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 16:09:01 +0000
X-Inumbo-ID: b8bad82e-138b-11ea-83b8-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8bad82e-138b-11ea-83b8-bc764e2007e4;
 Sat, 30 Nov 2019 16:09:00 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id q18so12690941ybq.6
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 08:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dMP/2yxAR0DvSuiaxAiuWWocMjOJkwSD/vHjYN44GIo=;
 b=gb6j4ard9tQw5vh0MIV09/W7CIwXr7ovHOdn4qRvfTya3l1QnC/nXYBQijRPt7qFvl
 P05/zc5f5qs98xpFcOII5G/6O80HU9mk9/SqjdMctFXDSU4fChggbJQ57iL3Uh/Ls+b/
 cNCEaWW4CFAcLy5EZcrbUPQ6Ge/Ivga2pPQlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dMP/2yxAR0DvSuiaxAiuWWocMjOJkwSD/vHjYN44GIo=;
 b=cvCvY095Sao9Ow+vLWOAzUta/yOiw7BZ3MqDAlAn/K3nVCpf7LYErgtv8cTXNpK1ka
 32pNT1ESa4mHXUirpiKICXP8Al+Y/sHZczQTkrjRckABL6mTFFCC2bgpfI/5fCQQj+8I
 O0CpiArNtfj/C5uyCRTgzpUvAkq+xLn33fazpdzEjMyVzuISbqQD8C23+n6uJmK2qjOf
 IxLxS5pDcCLBTfM/wUao2qNDiFZ1XxlzJPdavEiES20V4u7BOKVZ4tRVfFvcJuO/uFWl
 7SBRm0YDSOPMde+Hc7mHJsL/IL6UNET1m0oCErsK3WJVfi9l4Zk+0nHjRIgpaUFBdmfS
 5sLw==
X-Gm-Message-State: APjAAAWqKO68wpobIIh5PpWGSKQQrwdY5NOsmcUWO0AKjDYF4Jucfif8
 EL7yxK6RudgUg3QvUYeLCRmM4Tt51NQ=
X-Google-Smtp-Source: APXvYqy5y+8F99xs1lfSVm+eoEDzUUQbiXEvaE7MKOMbDNwmaojdB+6k6j25jGHemSoBTOFnaPP7KA==
X-Received: by 2002:a25:c511:: with SMTP id v17mr46465388ybe.138.1575130140312; 
 Sat, 30 Nov 2019 08:09:00 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:4df:392f:5995:64aa])
 by smtp.gmail.com with ESMTPSA id t206sm1884058ywa.87.2019.11.30.08.08.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 30 Nov 2019 08:08:59 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
 <20191115143959.GI72134@Air-de-Roger>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <81c0740c-edce-05e8-bb2e-3eb0b7a3723c@cardoe.com>
Date: Sat, 30 Nov 2019 10:08:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115143959.GI72134@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] x86: clank build check adjustments
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgODo0NSBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKCj4gT24gRnJpLCBO
b3YgMTUsIDIwMTkgYXQgMTE6NDM6MjFBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IDE6
IGZpeCBjbGFuZyAubWFjcm8gcmV0ZW50aW9uIGNoZWNrCj4+IDI6IGNsYW5nOiBtb3ZlIGFuZCBm
aXggLnNraXAgY2hlY2sKPiBGb3IgYm90aDoKPgo+IFRlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGFzdUBjaXRyaXguY29tPgo+IFtPbiBGcmVlQlNEIGFuZCBEZWJpYW4gOS41XQo+
IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPgo+
IE5vdGUgdGhlcmUncyBhIHR5cG8gaW4gdGhpcyBlbWFpbCdzIHN1YmplY3QgKGNsYW5rIHYgY2xh
bmcpLiBBbHNvLCBpZgo+IHBvc3NpYmxlLCBjb3VsZCBib3RoIHBhdGNoZXMgaGF2ZSB0aGUgc2Ft
ZSBwcmVmaXg/ICh4ODYvY2xhbmcpCj4KUm9nZXIsCgpEbyB3ZSBuZWVkIHRvIG1ha2UgY2hhbmdl
cyB0byB0aGUgY29udGFpbmVycyB0aGF0IGJ1aWxkIHRoZSB0cmVlPyBUaGVzZSAKcGF0Y2hlcyBi
cm9rZW4gdGhlIGNsYW5nIGJ1aWxkcyBpbiBDSSBhcyBjYW4gYmUgc2VlbiBoZXJlOiAKaHR0cHM6
Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL2pvYnMvMzY1MjQ2NTYzI0wyMzcxCgotLQoK
RG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
