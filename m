Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C3165BB6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:39:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4jBY-0001y9-JE; Thu, 20 Feb 2020 10:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEUe=4I=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j4jBX-0001xt-Sy
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:36:00 +0000
X-Inumbo-ID: c799b866-53cc-11ea-ade5-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c799b866-53cc-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=po4Q18eXEkPxpHx65udDotkgex020mbWSkUmjHVuETM=; b=KZoylRJ4vSyaYwrtZknqSkivjG
 WQUr2vvjmk1BAlEDC1VBvGahn1IisBCNujlVF78N5Z8SBq9lsj6jQk8tlTGQTvv2yQq5V785P9hUo
 92jUHeYXPGle+VRAb0dhPY7zS+vQzeMGgcGw1FceS+iQYZCFDi1NwNcjDk1e6fmmQuWk=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:43944
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j4jDH-0007Y3-Sx; Thu, 20 Feb 2020 11:37:47 +0100
To: Wei Liu <wl@xen.org>
References: <cover.1582143896.git.linux@eikelenboom.it>
 <20200220005330.bigbb7e7okuvez3x@debian>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <644d0cb7-93ad-2c59-fcac-c3d50e607775@eikelenboom.it>
Date: Thu, 20 Feb 2020 11:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220005330.bigbb7e7okuvez3x@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] tools/xentop: Fix calculation of used
 memory and some cleanups
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDIvMjAyMCAwMTo1MywgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEZlYiAxOSwgMjAy
MCBhdCAwOTozMToyOVBNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IEZpeGVz
IHNvbWUgZmFsbG91dCBmcm9tOiBjNTg4YzAwMmNjMSAoJ3Rvb2xzOiByZW1vdmUgdG1lbSBjb2Rl
IGFuZCBjb21tYW5kcycpCj4gCj4gVGhhbmtzLiBJIG1hZGUgc29tZSBzdWdnZXN0aW9ucyBvbiBh
ZGRpbmcgY29tbWl0IG1lc3NhZ2VzLiBMZXQgbWUga25vdwo+IGlmIHlvdSdyZSBva2F5IHdpdGgg
dGhvc2UuCj4gCj4gV2VpLgo+IAoKWWVzLCB0aGV5IGFsbCBzZWVtIGltcHJvdmVtZW50cywgdGhh
bmtzICEKCi0tClNhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
