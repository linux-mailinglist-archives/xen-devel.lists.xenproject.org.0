Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9829151BAF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:54:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyybv-0008U0-95; Tue, 04 Feb 2020 13:51:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyybt-0008Tt-4W
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:51:25 +0000
X-Inumbo-ID: 6e74df96-4755-11ea-8f4c-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e74df96-4755-11ea-8f4c-12813bfff9fa;
 Tue, 04 Feb 2020 13:51:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u6so9863920wrt.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 05:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qcWnxcAr9NJjXAB6sQ3UsoKxksJEI39j9GaVev4Dh3M=;
 b=NxWLqzRviMBpSE0giaiKm5wGrDjobF05jWg7xMQ7igRnqBhUwMQOUSAODYmtmQUDlB
 xWwB/x2KDU9hzjpxsI4vldOF6/ucY+eiLX6apBYLPZOUEiJ+uiUg62TQOBlmqMZJ4g56
 zgwzXKcAfv99wE7EVkolaa4SG9gWR8GZ8KJc2dFOF6TaxXdqjs+Zyu1GTTGWDqfQ4Jo1
 Nzo3tf7T49kpL6jXMN2y2ioc4krHlA5Bx1hUd775AvT/lVDAU/pWNU81+3EpjHRjsvCi
 KjPzry9kuatlRos64bFfLvEwcjz9gZ/Q5obheXv4HxsohW8KGg2ZFbW+DorneAmDwi/Q
 KI+g==
X-Gm-Message-State: APjAAAVI+5SCy6WArQT/65ZjH18QLypl3HF7oaWrFk3oHJAcQJV+bbap
 dgkMG9AqepU/eNU6T32kWAY=
X-Google-Smtp-Source: APXvYqyIpkgVxWrCjY0vG+jeN0lCmd8jlC8yBiDc2CFLRK74C8z6xS9Fr4zyc/+VZCRKSY3Tl4XK/g==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr24033368wrv.0.1580824283514;
 Tue, 04 Feb 2020 05:51:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id 124sm4169592wmc.29.2020.02.04.05.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 05:51:23 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204133357.32101-1-julien@xen.org>
 <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3199dd4d-1b3e-4ba8-9f76-6a6ed0c7c067@xen.org>
Date: Tue, 4 Feb 2020 13:51:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/mm: Avoid assuming PG_state_inuse == 0
 in assign_pages()
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

CgpPbiAwNC8wMi8yMDIwIDEzOjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNC4wMi4yMDIw
IDE0OjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBtb21lbnQsIGFzc2lnbl9wYWdl
cygpIHJlbGllcyBvbiBQR19zdGF0ZV9pbnVzZSB0byBiZSAwLiBUaGlzCj4+IG1ha2VzIHRoZSBj
b2RlIHNsaWdodGx5IG1vcmUgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQuCj4gCj4gSSBjYW4gY2Vy
dGFpbmx5IHNlZSB3aGVyZSB5b3UncmUgY29taW5nIGZyb20sIGJ1dCAuLi4KPiAKPj4gLS0tIGEv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
Pj4gQEAgLTIyODYsMTAgKzIyODYsMTEgQEAgaW50IGFzc2lnbl9wYWdlcygKPj4gICAgICAgZm9y
ICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApCj4+ICAgICAgIHsKPj4gICAgICAgICAg
IEFTU0VSVChwYWdlX2dldF9vd25lcigmcGdbaV0pID09IE5VTEwpOwo+PiAtICAgICAgICBBU1NF
UlQoIXBnW2ldLmNvdW50X2luZm8pOwo+PiArICAgICAgICBBU1NFUlQocGFnZV9zdGF0ZV9pcygm
cGdbaV0sIGludXNlKSk7Cj4+ICsgICAgICAgIEFTU0VSVCghKHBnW2ldLmNvdW50X2luZm8gJiAo
flBHQ19zdGF0ZSkpKTsKPiAKPiAuLi4gSSB0aGluayB0aGlzIG9uZSBpcyBiZXR0ZXIgaW4gaXRz
IG9yaWdpbmFsIGZvcm0uIEFuIG9wdGlvbgo+IG1pZ2h0IGJlIHRvIHB1dCBhIEJVSUxEX0JVR19P
TigpIG5leHQgdG8gaXQuCgpJIHdhbnQgdG8gYXZvaWQgYSBCVUlMRF9CVUdfT04oKSBpZiBwb3Nz
aWJsZS4gSSBqdXN0IHJlYWxpemVkLCBJIGNvdWxkIApzaW1wbGlmeSB0byAiKHBnW2ldLmNvdW50
X2luZm8gIT0gUEdDX3N0YXRlX2ludXNlKSIuCgpXb3VsZCB0aGF0IGJlIG1vcmUgc3VpdGFibGU/
Cgo+IChJbiBubyBjYXNlLCBpbW8sCj4gdGhlcmUgc2hvdWxkIGJlIHBhcmVudGhlc2VzIGFyb3Vu
ZCBhIG5lZ2F0aW9uIGV4cHJlc3Npb24uKQoKV2hpbGUgSSB1bmRlcnN0YW5kIHRoaXMgd291bGQg
YmUgdmFsaWQsIEkgZmluZCBpdCBhIGJpdCBlYXNpZXIgdG8gcmVhZC4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
