Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290913A958
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 13:33:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLKv-0006En-7s; Tue, 14 Jan 2020 12:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irLKu-0006Eg-FZ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 12:30:20 +0000
X-Inumbo-ID: 9b84f530-36c9-11ea-b89f-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b84f530-36c9-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 12:30:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so11970772wre.10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 04:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T717NCPDa5HCLuGdG/uaqgec/l/iKm/0nzvTCPIFWT8=;
 b=R2VBbibtVurL6fqT4q7pJOF7LTYlGPv6wOEfZ0n949rCaSwCJjh/yP/TUkZEqrJWJ0
 k7BaNRMG5Z+cwo/gn4+q5O5ysdlMNJER6ykuutsYH7L0oUWb8c5eqtoOKk4/e5GV5EUe
 ZYAJhhOqXK7W2lcN+jZAGyXOszP7HE49cDjwhFfRwPYB0LqedA3tTrmC6T2tdqJGhk8r
 KVjtiHhOrzSu0k2aeAzJ+Z3TuwVJf6qqdHoTyGdTLgMsXa0Vspx9jZYGDc/4ncoIIgfA
 WZP/ISCklLcLLlPbQ13usmZCDXThcUitN2N+RHiXV3e8HJo/Rk/XAQv9m8ef0XkJTy76
 h5vA==
X-Gm-Message-State: APjAAAUSavtaqM2MbqMlXcAT5uazpDSc0/ZwhCjUeFNbVaYwKuIt5jyK
 DP/Pvx4d6ox1O1VCOfrfK+g=
X-Google-Smtp-Source: APXvYqz3mFyWx6Gj7Mh8lFSqaMrgolalS5cAZ6x0zjxsYBE6RJdcl0US+Xi5cx+IMci46xBbXBgHXQ==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr24787032wrx.153.1579005010986; 
 Tue, 14 Jan 2020 04:30:10 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id e16sm19557770wrs.73.2020.01.14.04.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 04:30:10 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-4-julien@xen.org>
 <9ec30bb8-49d5-0a3c-df8c-4cd9ababe972@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <653f59a9-1e77-ddae-9253-c782b88898fb@xen.org>
Date: Tue, 14 Jan 2020 12:30:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <9ec30bb8-49d5-0a3c-df8c-4cd9ababe972@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 3/4] xen/domain: Remove #ifndef surrounding
 alloc_pirq_struct()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDEvMjAyMCAwOTozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMu
MDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vZG9tYWluLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4+IEBAIC00MSw5
ICs0MSw3IEBAIHN0cnVjdCB2Y3B1ICphbGxvY192Y3B1X3N0cnVjdChjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKTsKPj4gICB2b2lkIGZyZWVfdmNwdV9zdHJ1Y3Qoc3RydWN0IHZjcHUgKnYpOwo+PiAg
IAo+PiAgIC8qIEFsbG9jYXRlL2ZyZWUgYSBQSVJRIHN0cnVjdHVyZS4gKi8KPj4gLSNpZm5kZWYg
YWxsb2NfcGlycV9zdHJ1Y3QKPj4gICBzdHJ1Y3QgcGlycSAqYWxsb2NfcGlycV9zdHJ1Y3Qoc3Ry
dWN0IGRvbWFpbiAqKTsKPj4gLSNlbmRpZgo+PiAgIHZvaWQgZnJlZV9waXJxX3N0cnVjdCh2b2lk
ICopOwo+IAo+IElzIHRoaXMgcmVhbGx5IGEgaGVscGZ1bCBjaGFuZ2UuIEJhY2sgdGhlbiBpYTY0
IGhhZCBhICNkZWZpbmUgZm9yCj4gdGhpcywgYW5kIGEgZnV0dXJlIHBvcnQgbWF5IHdhbnQgdG8g
ZG8gc28gYXMgd2VsbC4KCkkgZGlkIG5vdGljZSBpdCB3YXMgdXNlZCBieSBpYTY0IGJ1dCBJIGFt
IHVuY29udmluY2VkIHRoaXMgaXMgZ29pbmcgdG8gCmJlIHVzZWQgaW4gdGhlIGZ1dHVyZS4gTW9z
dCBsaWtlbHkgYmVjYXVzZSB0aGVyZSBpcyBzaW5nbGVyIGNhbGxlciBmb3IgCmFsbG9jX3BpcnFf
c3RydWN0KCkgYW5kIHRoaXMgaXMgbm90IGEgaG90IHBhdGguIFNvIHVzaW5nIGEgc3RhdGljIApp
bmxpbmUvbWFjcm8gaXMgbm90IHJlYWxseSBhIGdvb2Qgc29sdXRpb24gaGVyZS4KCj4gSXMgdGhl
cmUgYW55dGhpbmcgYWN0aXZlbHkgcHJvYmxlbWF0aWMgd2l0aCBsZWF2aW5nIHRoaXMgdW50b3Vj
aGVkPwpZZXMsIHRoaXMgZG9lc24ndCByZWR1Y2UgdGhlIGFtb3VudCBvZiB1bnVzZWQgY29kZSB3
ZSBoYXZlIGFuZCB3aWxsIAp1bmxpa2VseSB0byBiZSB1c2VkIGluIHRoZSBmdXR1cmUuIElmIHdl
IHJlYWxseSBuZWVkIGl0IHRoZW4gd2UgY2FuIApyZS1pbnRyb2R1Y2UgaXQuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
