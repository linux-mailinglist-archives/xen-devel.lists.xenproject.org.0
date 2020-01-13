Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456E139259
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 14:42:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqzw7-0006IP-43; Mon, 13 Jan 2020 13:39:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iqzw5-0006IK-5L
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 13:39:17 +0000
X-Inumbo-ID: 12d05c4e-360a-11ea-b89f-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12d05c4e-360a-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 13:39:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so9666278wmj.4
 for <xen-devel@lists.xen.org>; Mon, 13 Jan 2020 05:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yisV81CPy2b/bZHBQRKcguw5RuqKcpdQYiAsUV8FEMU=;
 b=Mnfyj5/N5JH1kL6jge5VSxXA8zUwqFEIW4dht8jbdJVAzse8RN37Sd/gDpA1LA0F0O
 EfeBBbWKLh6IhXNlFaiyWBY/7vf8tb74yfnnU1BKF8wcmHW8lVTy5tJeCHKRhsBOGfxs
 u+dfTMx2wRt6tCvmYNuIX5vrPUVuNoQxNpuzEQG0aAydvcUbfDy/sauVCnSTZaf6i89c
 70d1VT/f9lLpdL6vDkSp5E6ElQPgW+LnQu1XHrPbPZAZsnxDVcL2CHksJEIC4VuLl4L+
 pjSHE1LtY/dkUL5ulFX8yuctVWZbO/toc9eQ0FynOjQefpn0peR3bu/2KeBmbza+CMdM
 V6VA==
X-Gm-Message-State: APjAAAXjIWQB/uBAWmqZfMuSye4SaRApPsnBaEVTs10y+8DK0d70eqmd
 vRJ34vKB4rFLGQ7S0E+dAgs=
X-Google-Smtp-Source: APXvYqwjUuQ7dX3xmqo6kAnLm0I/cJ4P/6Yviw8PCCucnIcQ0hVD+nrRfYXZzVP8tI2sawm9ByhFJw==
X-Received: by 2002:a05:600c:30a:: with SMTP id
 q10mr19563068wmd.84.1578922747713; 
 Mon, 13 Jan 2020 05:39:07 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id s15sm13998370wrp.4.2020.01.13.05.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 05:39:07 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
 <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <530f7613-299e-651b-c42e-c93ca261d16b@xen.org>
Date: Mon, 13 Jan 2020 13:39:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKVGhhbmsgeW91IGZvciBzdW1tYXJpc2luZyB0aGUgcG9zc2liaWxpdHkuIE9u
ZSBxdWVzdGlvbiBiZWxvdy4KCk9uIDEzLzAxLzIwMjAgMTI6NTEsIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4gMi4gQmxvY2sgWEVOVkVSX2V4dHJhdmVyc2lvbiBhdCB0aGUgaHlwZXJ2aXNvciBsZXZl
bC4gIExlYXZlIHhlbl9kZW55KCkKPiBhcyByZXR1cm5pbmcgIjxkZW5pZWQ+IiwgYnV0IHJlcGxh
Y2UgIjxkZW5pZWQ+IiB3aXRoICIiIGluIGh2bWxvYWRlciBzbwo+IGl0IGRvZXNuJ3Qgc2hvdyB1
cCBpbiB0aGUgU3lzdGVtIEluZm8gYW5kIHNjYXJlIHVzZXJzLgo+IAo+IDMuIEJsb2NrIFhFTlZF
Ul9leHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwuICBDaGFuZ2UgeGVuX2Rlbnko
KQo+IHRvIHJldHVybiBhIG1vcmUgYmVuaWduIHN0cmluZyBsaWtlICI8aGlkZGVuPiIuICAoUGVy
aGFwcyBhbHNvIGZpbHRlciBpdAo+IGluIGh2bWxvYWRlciwganVzdCBmb3IgZ29vZCBtZWFzdXJl
LikKCk15IGtub3dsZWRnZSBvZiBsaXZlIG1pZ3JhdGlvbiBvbiB4ODYgaXMgYSBiaXQgbGltaXRl
ZCwgYnV0IGlmIEkgCnVuZGVyc3RhbmQgY29ycmVjdGx5IHRob3NlIHR3byBvcHRpb25zIHdvdWxk
IHJlcXVpcmUgYSBndWVzdCB0byByZWJvb3QgCmluIG9yZGVyIHRvIHBpY2sgdXAgdGhlIGNoYW5n
ZXMuIEFtIEkgY29ycmVjdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
