Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F083CB72
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hafr4-0005U1-PP; Tue, 11 Jun 2019 12:26:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hafr3-0005Tv-4j
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:26:21 +0000
X-Inumbo-ID: 1da8f8e4-8c44-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1da8f8e4-8c44-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:26:20 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u10so9136034lfm.12
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=csz9/PJbPQ/X8JenHPc9mtlGZ5Kg2lisUWVWUtP/Hkc=;
 b=MOlYvAJ1yED6RG2U9sE50H8Uo6n1Dq0atke/PBU311ei2ID24NLKLw27MaV22NiXo3
 tnxYYKQ1h2zZh2PuL8s/kZenHkw/Fnkbi6G3mj/P0nW+ZxaXBo7WYYddodOmaHHmWFww
 FRiM5Rw4w7kU3P71sx1lltg9eOhTeNHUfLhSl9TaoWjpwP9L/6+tHDK15NKmy2sRAZ7o
 FDhyz5IfU0LA0HArG46NGi3yeuB9jlHIjt/X/f1NQV3MXcRHkaaM4+MbUtor4n49MHo6
 Awy3NnSV5219f5YgFGeSobmTE/LXDjuP/gnOv5jZwc5bgvdNdLZ+6tAp9DaYcnFeBz6j
 uIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=csz9/PJbPQ/X8JenHPc9mtlGZ5Kg2lisUWVWUtP/Hkc=;
 b=A76dXuhmRtwvrtOI6cCNLv6odShVTN3f3A2inPD7SZGfaRga4WPgIHf0ejLTtvTxy9
 C+OvDYldctObHGQiLBc4c3/LuSdkmfbT267//r/pQ91qUJrKg4s/rYGep9ruOdDlvByp
 Js+GinDpw0rNhC9qzou/xswtFUz2pqwSlw+EueA8YmpuAtEOaX6rRPCYY2gmPvcpDRtI
 Pp1LYndq/H13OlxD71pY69lgIY8wUdg2Eza4psYWZnPtKq0rnYPT1ekm7XJFhRLG6TXz
 fdYjiTc9lFqcznns1cDILU5iP1IXCn8JwmXiol6YNTd9RzKdwUgCh/Qmdn2VY3DOyZg/
 iXXA==
X-Gm-Message-State: APjAAAUu5QSpxWIMj7h1XMzYVfyrkYdxVpH9zhiSZkyT3YSm6LkFEgoW
 +98Wu0kjdnhD3AlttccTIFo=
X-Google-Smtp-Source: APXvYqxId5LZXVVgKcaUR60K6xIeC/IZ/F3cmUWGTTjIxnQnhnBbAGxZqLsMsPHb8N2w69GTqcrC4g==
X-Received: by 2002:ac2:4908:: with SMTP id n8mr36069933lfi.10.1560255978713; 
 Tue, 11 Jun 2019 05:26:18 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 j11sm2499257lfm.29.2019.06.11.05.26.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 05:26:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
 <b07c98a5-00cc-a51f-2eda-ba4038f0f667@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4d747a77-408b-56b9-9404-60b3754ceccb@gmail.com>
Date: Tue, 11 Jun 2019 15:26:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b07c98a5-00cc-a51f-2eda-ba4038f0f667@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS4wNi4xOSAxNToxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBKdWxpZW4sIEknbSBu
b3Qgc3VyZSBJIHVuZGVyc3RhbmQgaG93IHdvcmsgb24gKHA/KUNQVSBjb3VsZCBiZSBkZWxheWVk
LiBXZSBhcmUgaGVyZSB3aXRoIGludGVycnVwdHMgZW5hYmxlZCwgc28gaGVyZSBndWVzdCB3b3Vs
ZCBqdXN0IHNwZW5kIGhpcyBvd24gdmNwdSB0aW1lIGJ1ZGdldC4gCj4gCj4gWGVuIG9ubHkgc3Vw
cG9ydHMgb25seSB2b2x1bnRhcnkgcHJlZW1wdGlvbi4KCk9oLCByZWFsbHk/IExldCBtZSBsb29r
IGludG8gaXQgYSBiaXQgY2xvc2VyLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
