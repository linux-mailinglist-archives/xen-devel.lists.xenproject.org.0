Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACEE1536FB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 18:48:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izOk5-0005Ex-DP; Wed, 05 Feb 2020 17:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izOk3-0005Es-HW
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 17:45:35 +0000
X-Inumbo-ID: 4f629266-483f-11ea-9175-12813bfff9fa
Received: from mail-wr1-f54.google.com (unknown [209.85.221.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f629266-483f-11ea-9175-12813bfff9fa;
 Wed, 05 Feb 2020 17:45:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c9so3801249wrw.8
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 09:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C62zTzrbNkq8VEn+9kYniMA3aX0/ea+WW7f0i3vONoY=;
 b=FFFIqwZMUcowNQ1DZCQy1nxCQX0UtJmbT8fMyZVOd+86Ur+9EW6xFnA9YO9MY3JYcV
 gNeUZTpNOuqlivYpnZQtnCSCelvwUK+a7i/SHqTEMRbGf4ivkLHYlENP5dWqNPbZQ/Ws
 GU6tvDmXgIZyz/iB5oOBhs8hcVQdPvmmBqHt92/SO7clDeWL4uFkcMY+1gyXxpbkgItm
 TR049Qwfqld12vd7jCH5hBY3A8axsmKDTRAzEs73UcunfOuh9NhJY/pVoaN11p+a1EbC
 Qf28JruVmVm1bJfKlhIZzy/N1ah/Yc+q/6pcJiwFSa5lTbQGaSfE/qlwuXB11dii2Le1
 5ffw==
X-Gm-Message-State: APjAAAVoDSOm6sKeDq1YJxVu1fq8ZmCue45jltU/cTYYaWt4u92oEqlO
 hEMIKCDjbf4R7MFj6/EtRUY=
X-Google-Smtp-Source: APXvYqwLLq/ldH0cQyCuvdwjAtykCRXexHSqvfCSV0EaB0YsXwyJuU3+zl6E2lx3u8oaWxndk+25CQ==
X-Received: by 2002:adf:e550:: with SMTP id z16mr27024888wrm.5.1580924733712; 
 Wed, 05 Feb 2020 09:45:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id z25sm364038wmf.14.2020.02.05.09.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:45:33 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, "Xia, Hongyan" <hongyxia@amazon.com>
References: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
 <1398d8919b9f5c81e54b459c69e6b89352260ebe.camel@amazon.com>
 <c125fe8e-a2c6-a972-e7f7-a18f8c75a3ab@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0316c4aa-4511-cd04-e40d-46ab92350e14@xen.org>
Date: Wed, 5 Feb 2020 17:45:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <c125fe8e-a2c6-a972-e7f7-a18f8c75a3ab@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDIvMjAyMCAxNjo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUu
MDIuMjAyMCAxNzoyNSwgWGlhLCBIb25neWFuIHdyb3RlOgo+PiBQaW5nLgo+IAo+IFNvcnJ5LCB0
aGVyZSdzIGp1c3QgdG9vIG11Y2ggZWxzZSBhbHNvIG5lZWRpbmcgYXR0ZW50aW9uLiBJJ20KPiBk
b2luZyB3aGF0IEkgY2FuIHJldmlldy13aXNlLCBhbmQgSSBhc3N1bWUgc29tZSBvdGhlcnMgZG8g
c28sCj4gdG9vLiBZb3UncmUgdmVyeSB3ZWxjb21lIHRvIGhlbHAgd2l0aCB0aGUgcmV2aWV3IGxv
YWQuCgpXZWkgYW5kIEkgYWxyZWFkeSByZXZpZXdlZCB0aGUgcGF0Y2guIFNvIEhvbmd5YW4gaXMg
bWFpbmx5IHdhaXRpbmcgb24gCnRoZSBtYWludGFpbmVycyAoQW5kcmV3IGFuZCB5b3UpIHRvIGdp
dmUgdGhlaXIgZmluYWwgYWNrLgoKV291bGQgeW91IGJlIGhhcHB5IHRvIGdpdmUgeW91ciBhY2sg
YmFzZWQgb24gdGhlIHJldmlld3MgZnJvbSBXZWkgYW5kIG1lPwoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
