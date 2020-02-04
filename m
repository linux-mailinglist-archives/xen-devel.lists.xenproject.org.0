Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12434151AD9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 13:53:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyxfy-0002wV-Fi; Tue, 04 Feb 2020 12:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyxfw-0002wQ-6O
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 12:51:32 +0000
X-Inumbo-ID: 10e6bdac-474d-11ea-8f38-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10e6bdac-474d-11ea-8f38-12813bfff9fa;
 Tue, 04 Feb 2020 12:51:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c84so3490788wme.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 04:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YbbFckbRGMddBqTfyz+PQotgm9wzTdbkRHzP5+2J1bI=;
 b=ElewWEvlQn6JTdUGl/h8n8PI95s35lrjzA2WxUq52JCWd6CKXZGcpVzVTovA7fC1bE
 TPJEP+OUudZ/LhvyNnYoDC9lEI1n9U0F4zgIoSYkPZ4c+t5ykRXwc5LafUauxJSUhRP6
 9T0Ljb4+ne/lxQr14u53MTrzuO02p+GbK8XItbauf3QCsACvprRimQ+59+Ea+4ED9D/a
 CCedFYZTIGAlgVNYc1O5vRchIMCHjcIpNA/+uFHyuu+sMCaYTzGktWIky6hf38+/HgYk
 Og6Gm0+JSiap1SroaeLeG72nd8lrVM83E/7J5MY63pHcFPu9LbXNc37kVicGZpri/ruU
 W1NQ==
X-Gm-Message-State: APjAAAWmK0jqrbUXBzU1/ok1vRTz+MHNvjykkkGXkSSUVdsqtHU49anr
 l924IFx07rLlLp2RxfNlAsc=
X-Google-Smtp-Source: APXvYqyxHl1RsrUUE5hKefZum5XI0vEHWmF9fIixSdboIYOdE2QOf1tLjyMn8ENflIZfkHZmZBIsuA==
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr5770168wmb.54.1580820690641; 
 Tue, 04 Feb 2020 04:51:30 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id t12sm22492164wrq.97.2020.02.04.04.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 04:51:29 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org> <20200204105156.GH4679@Air-de-Roger>
 <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
 <20200204112807.GK4679@Air-de-Roger>
 <4b5f37a3-b3ac-6a2c-70cc-b7773beea792@amazon.com>
 <7d2287d4-56a1-dcb9-38a3-31d8f66d050c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b789a1a7-b6be-c030-9155-5b05077c8c10@xen.org>
Date: Tue, 4 Feb 2020 12:51:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7d2287d4-56a1-dcb9-38a3-31d8f66d050c@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNC8wMi8yMDIwIDEyOjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNC4wMi4yMDIw
IDEyOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFzaWRlIHRoZSBNSVNSQSwgdGhlcmUgYXJl
IHNvbWUgY2FzZXMgd2hlcmUgSSBmZWVsIHRoZSBleHBsaWNpdAo+PiBjb21wYXJpc29ucyBtYWtl
IHNlbnNlLiBCdXQgSSBkb24ndCBoYXZlIGFueSByYXRpb25hbCBmb3IgdGhlbSBhbmQgdmlldwo+
PiB0aGlzIGFzIGEgbWF0dGVyIG9mIHRhc3RlLiBTbyBJIHdvdWxkIGxlYXZlIGl0IHRvIHRoZSBh
dXRob3Igb2YgdGhlCj4+IHBhdGNoIHRoZSBjaG9pY2UuCj4gCj4gRldJVywgSSBkaXNhZ3JlZSBv
biB0aGlzIGFzcGVjdC4gQ29uc2lzdGVuY3kgb2YgdGhlIGNvZGUgYmFzZQo+IGlzLCBJIHRoaW5r
LCBtb3JlIGltcG9ydGFudCBhbiBhc3BlY3QuIFllcywgd2UgbGlrZWx5IG5ldmVyCj4gd29uJ3Qg
cmVhY2ggYSBmdWxseSBjb25zaXN0ZW50IHN0YXRlLCBhcyBnb2FscyBzaGlmdCwgYnV0Cj4gYW55
d2F5LgoKVGhlIG1lYW5pbmcgb2YgY29uc2lzdGVuY3kgaXMgcXVpdGUgYnJvYWQuIFdoYXQgeW91
IHZpZXcgYXMgY29uc2lzdGVudCAKbWF5IG5vdCBiZSBmb3IgbWUgKGFuZCB2aWNlIHZlcnNhKS4g
U28gd2UgYXJlIGRvd24gdG8gdGhlICJtYXR0ZXIgb2YgCnRhc3RlIiB0ZXJyaXRvcnkuCgpXZSBj
b3VsZCBzdWdnZXN0IHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgY29kZSBzdXJyb3VuZGluZywg
YnV0IEkgdGhpbmsgCnlvdSB3aWxsIG5vdCBiZSBoYXBweSB3aXRoIGl0IGFzIHNvbWUgY29kZSBk
b2VzIG5vdCBzdWl0IHRoZSBjb2RpbmcgCnN0eWxlIChzZWUgdGhlIHJlY2VudCBkaXNjdXNzaW9u
IGFib3V0IHVzaW5nIF9fKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
