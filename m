Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9A17DCFC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:11:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFKN-0006pi-25; Mon, 09 Mar 2020 10:08:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RYxH=42=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBFKL-0006pd-6R
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 10:08:01 +0000
X-Inumbo-ID: db2770e2-61ed-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db2770e2-61ed-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 10:08:00 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z65so5378043ede.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=UIOg23mUNopvIC6WgbTyyMTojG2Kv7jR2B7niLLpiuw=;
 b=gBwVDqAR7lwmRD9WwT8qQbnHrShuq+y9Um3m+lXBNaHLizfn5cFRJdRpgoQ8K5qwrc
 pm530Cn6/w7Oy4rQhxkWJrP5i77r5XPRDe4sMRCdaRKsrzAeK9iwKlKJ0p7mUfN37SkB
 81StvhvDf+VOKf7bZWmQjCgN77czNWZuPnq5g5eQQefMr2bdNi7vaJbFNi61LxFJ2Ba2
 +xHVMEyryQ5eFlcCQAFI6AP9SN1MWTzBEmEsq5xnzOcYppx7ftfdqI1MCQUaCp0IfZP+
 AI7OAdXlLwvvD0ZglfIto9tcEowuTzVE9gp1CH9OWGWNOO2492pJoxHDlYrRs6V4VUc4
 hWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=UIOg23mUNopvIC6WgbTyyMTojG2Kv7jR2B7niLLpiuw=;
 b=s2CgCi97vT4kA7Vfe+eqdjlnJoLl5+9cDoe23uv2mHSoIQY3mMXDUPfLyX4anmvYcE
 MV9bPj2/P7p3lF7IbAZ/yj9qqMuGXnXdKmvAIgYgBXxXSxHO+tnZ3bMQsIdNvUgSpgP+
 BDb1tqYkWZYdcKGaco+AbNKa7gxUkBeNOXD7h2fDZGxgTE0JvAfM330uY3jeUWAQqomA
 f0rIcgD7sRm6duLws0MR6owNfdtRanUNtioEjlczr+5fawuWbxVB9jeildlAj2Pe8bMt
 WFsEiwcUU2e6t9vsWMMH/Q45HGEUhm19cdrrRKK9ypCg4lvEt7ZOmvpPoTwOX3FC0j8r
 rw8w==
X-Gm-Message-State: ANhLgQ2Oq5LubNNuJy4iI4qEqEwUtf+Cc9i86MMMPbsqVWrUychBlN+k
 vnvuFHsiceZFIHRDYyXXXRo=
X-Google-Smtp-Source: ADFU+vtcmvaI9vkmT/h/jQ1MB/FlquMAmk8NaK3wrEUHwXf7F9eTZ75IHB6KgPEbcCfLx6gHLyFN8A==
X-Received: by 2002:a17:906:a59:: with SMTP id
 x25mr13649264ejf.50.1583748479671; 
 Mon, 09 Mar 2020 03:07:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id o25sm309104eja.28.2020.03.09.03.07.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 03:07:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309093511.1727-1-paul@xen.org>
 <20200309093511.1727-3-paul@xen.org>
 <3620303a-149f-36f8-1708-236e4bcbb8f0@suse.com>
In-Reply-To: <3620303a-149f-36f8-1708-236e4bcbb8f0@suse.com>
Date: Mon, 9 Mar 2020 10:07:58 -0000
Message-ID: <000101d5f5fa$9c4e1650$d4ea42f0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ67pNJ24W66LNnVrJf5nGAmz5EyAIZ9zasAmOk1TOm0isUoA==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v4 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table...
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
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDA5OjU5Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT47IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBSb2dlciBQYXUKPiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi82XSB4ODYgLyBwMm06IHJlbW92ZSBwYWdlX2xpc3Qg
Y2hlY2sgaW4gcDJtX2FsbG9jX3RhYmxlLi4uCj4gCj4gT24gMDkuMDMuMjAyMCAxMDozNSwgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPgo+ID4KPiA+IC4uLiBhbmQgcmVwbGFjZSB3aXRoIGEgY2hlY2sgb2YgZG9tYWluX3RvdF9w
YWdlcygpLgo+ID4KPiA+IFRoZSBjaGVjayBvZiBwYWdlX2xpc3QgcHJldmVudHMgdGhlIHByaW9y
IGFsbG9jYXRpb24gb2YgUEdDX2V4dHJhIHBhZ2VzLAo+ID4gd2hlcmVhcyB3aGF0IHRoZSBjb2Rl
IGlzIHRyeWluZyB0byB2ZXJpZnkgaXMgdGhhdCB0aGUgdG9vbHN0YWNrIGhhcyBub3QKPiA+IGFs
cmVhZHkgUkFNIGZvciB0aGUgZG9tYWluLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bEB4ZW4ub3JnPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpUaG5ha3MuCgo+IHByZWZlcmFibHkgd2l0aCAicmVtb3ZlIiBpbiB0aGUg
c3ViamVjdCByZXBsYWNlZCBieSB0aGUgInJlcGxhY2UiCj4gY3VycmVudGx5IGF0IHRoZSBiZWdp
bm5pbmcgb2YgdGhlIGRlc2NyaXB0aW9uLiAoSXQgYWxzbyBsb29rcyBhcwo+IGlmIHRoZXJlIHdh
cyAiYWxsb2NhdGVkIiBvciBzb21lIHN1Y2ggbWlzc2luZyBuZWFyIHRoZSBlbmQgb2YgdGhlCj4g
ZGVzY3JpcHRpb24uKQo+IAoKT2ssIEknbGwgZml4IGluIHY1LgoKICBQYXVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
