Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6DB13A5BE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:19:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJF7-0002aM-4V; Tue, 14 Jan 2020 10:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irJF5-0002a8-DM
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:16:11 +0000
X-Inumbo-ID: ddec8bd0-36b6-11ea-b89f-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddec8bd0-36b6-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 10:16:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b6so11573846wrq.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 02:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5QxpfEWFxdUxIBS+pmJRk0cRndUIhmucqwSakb+lDI=;
 b=tJ6TPhOoLPUsiyoS8Jxl+Bu38E5oHIU8kAcPeUHXpqXUFJMUMGBy37AoH+ZPaREjaZ
 Bgx+30YEc2oJPNL8om3UkZTawM3WKQQNT29NzpjWW75zwj1Vzar5TafveGWzxTMFbVho
 AwasTFOYKAQkIhy6MJgHbj+hjYBIO8nD3jhFMRiNIvJ8ogpKHmMx1m0bJ2i9bCSRlHok
 lA8Dsiv8EAMGzo57uhgoPHKThbZBojjL5bFynPf6x9BYIecndT0WBaXjoAJrviWTi1br
 IaBOHO6eLSvmYPNEd1G/CNelkaBdRVJi+CowRwni0faq44LYd8aXrcrh/+ER9JIQroXn
 PH7Q==
X-Gm-Message-State: APjAAAWnnbYhotE5ohg5eDKpggSN4nEBBldbGJ9fHVeEX29IMyBZLMnW
 lwSiU15QfvUu7u3e8cSars4=
X-Google-Smtp-Source: APXvYqwI70X1VO/YtMhl8aCU8tnkFL5X6XTAEXuXS9Y+wS/nPvNVHqM1wfB3wDPOeQ00p/TEqwIKbg==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr23309679wrp.71.1578996961949; 
 Tue, 14 Jan 2020 02:16:01 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id q3sm17561483wmc.47.2020.01.14.02.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 02:16:01 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cb84362c-d175-7a71-89cc-17ce0c523b09@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <09fa90a8-b58a-04e9-ccae-702b3b092c4a@xen.org>
Date: Tue, 14 Jan 2020 10:16:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <cb84362c-d175-7a71-89cc-17ce0c523b09@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] IRQ: u16 is too narrow for an event channel
 number
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDEvMjAyMCAxMDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRklGTyBl
dmVudCBjaGFubmVscyBhbGxvdyBwb3J0cyB1cCB0byAyXjE3LCBzbyB3ZSBuZWVkIHRvIHVzZSBh
IHdpZGVyCj4gZmllbGQgaW4gc3RydWN0IHBpcnEuIE1vdmUgIm1hc2tlZCIgc3VjaCB0aGF0IGl0
IG1heSBzaGFyZSB0aGUgOC1ieXRlCj4gc2xvdCB3aXRoIHN0cnVjdCBhcmNoX3BpcnEgb24gNjQt
Yml0IGFyY2hlcywgcmF0aGVyIHRoYW4gbGVhdmluZyBhCj4gNy1ieXRlIGhvbGUgaW4gYWxsIGNh
c2VzLgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGFkZCBhIGNvbW1lbnQgcmVn
YXJkaW5nICJhcmNoIiBwbGFjZW1lbnQKPiB3aXRoaW4gdGhlIHN0cnVjdHVyZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL2lycS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oCj4gQEAgLTEy
Nyw5ICsxMjcsMTAgQEAgc3RydWN0IHZjcHU7Cj4gICAKPiAgIHN0cnVjdCBwaXJxIHsKPiAgICAg
ICBpbnQgcGlycTsKPiAtICAgIHUxNiBldnRjaG47Cj4gLSAgICBib29sX3QgbWFza2VkOwo+ICsg
ICAgZXZ0Y2huX3BvcnRfdCBldnRjaG47Cj4gICAgICAgc3RydWN0IHJjdV9oZWFkIHJjdV9oZWFk
Owo+ICsgICAgYm9vbCBtYXNrZWQ7Cj4gKyAgICAvKiBBcmNoaXRlY3R1cmVzIG1heSByZXF1aXJl
IHRoaXMgZmllbGQgdG8gYmUgbGFzdC4gKi8KCkkgb3JnaW5hbGx5IHBsYW5uZWQgdG8gYWRkIGEg
Y29tbWVudCBpbiBzdHJ1Y3QgcGlycSwgYnV0IEkgYW0gbm90IGluIApmYXZvciB0byBjb250aW51
ZSB0byBlbmNvdXJhZ2UgcXVpcmtpbmVzcyBpbiB0aGUgY29kZS4gSSBzZW50IGEgc2VyaWVzIAoo
c2VlIFsxXSkgdGhhdCBkcm9wIHRoaXMgcmVxdWlyZW1lbnRzIGZyb20geDg2IGFuZCB0aGVyZWZv
cmUgcmVtb3ZlIHRoZSAKbmVlZCBvZiB0aGlzIGNvbW1lbnQuCgo+ICAgICAgIHN0cnVjdCBhcmNo
X3BpcnEgYXJjaDsKPiAgIH07Cj4gICAKPiAKCkNoZWVycywKClsxXSAKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAxL21zZzAwOTI0Lmh0
bWwKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
