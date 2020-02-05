Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B2153636
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 18:18:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izOGX-0002k0-8t; Wed, 05 Feb 2020 17:15:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izOGV-0002jv-Td
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 17:15:03 +0000
X-Inumbo-ID: 0bcbfa96-483b-11ea-8396-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bcbfa96-483b-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 17:15:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so3697218wrt.6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 09:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gt7JKC5bU4Kn8QWritXkTNhZYADZ1EAroj+29iTULkI=;
 b=eW9e+7yS3dRsJMFy6sT3a1gFbmTf5fZqfxH5MgEy+OB3cfvN9j1fBn4T+o74EiOWb4
 m42fGxs0IgHl81nOHZ9IxPzdku5btfGmwM2rlUlxyzXZMIaSNTW5kiB7cW/9EsiGxhbo
 ONRZB1J7sljuEnUE6BsnGNBiS02oIUTBYxG/KIXzyunNoDNwdVaAsSbj4FPFfLieHv3L
 9aPLDBvbCJciWGmcNDPkvvk1IxeGDU1rlAb7VhGkqYwOl9JAGae148Pqe7x0xa240aQi
 RG6pcrACxW9bV44igXsIsRNe1Ywns8LcVwfKO0d+BfueuoJtGMnq7Be9jxH+7oq+AMIZ
 /yVg==
X-Gm-Message-State: APjAAAU5rAk8FnlLdsJLDtwFjRtq5XcYz0/BoM7a34AnZzbFnsNujMqb
 A60bKUzCX5Ks/9MmTKI1HyU=
X-Google-Smtp-Source: APXvYqx00aN4uGnlfI+cCWfNLsejxKTJuJZN+d3eKKjIJZOMogvCVOAADy7sOFcGab7sN767qek0OA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr27625601wrq.98.1580922902344; 
 Wed, 05 Feb 2020 09:15:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id w26sm284540wmi.8.2020.02.05.09.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:15:01 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
 <4cf07838-40ff-a941-159a-263c9305b89d@suse.com>
 <c2e44382-18b1-f62e-a2a8-98974c040069@xen.org>
 <40359ffc-13b3-daee-4456-99a461c26de7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6e4a58c4-aa80-f349-67b6-dffb1fa8e707@xen.org>
Date: Wed, 5 Feb 2020 17:15:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <40359ffc-13b3-daee-4456-99a461c26de7@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/6] sysctl: use xmalloc_array() for
 XEN_SYSCTL_page_offline_op
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
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDIvMjAyMCAxNjozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUu
MDIuMjAyMCAxNTozNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAwNS8wMi8yMDIwIDEzOjE2
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoaXMgaXMgbW9yZSByb2J1c3QgdGhhbiB0aGUgcmF3
IHhtYWxsb2NfYnl0ZXMoKS4KPj4+Cj4+PiBBbHNvIGFkZCBhIHNhbml0eSBjaGVjayBvbiB0aGUg
aW5wdXQgcGFnZSByYW5nZS4KPj4KPj4gSXQgZmVlbHMgdG8gbWUgdGhhdCB0aGUgY29tbWl0IG1l
c3NhZ2UvdGl0bGUgc2hvdWxkIGZvY3VzIG9uIHRoZSBzYW5pdHkKPj4gY2hlY2suIFRoZSB4bWFs
bG9jX2FycmF5KCkgaXMganVzdCBhIGNsZWFudXAgaXMgImxlc3MgaW1wb3J0YW50Ii4KPiAKPiBC
dXQgaXQgbm90IGJlaW5nIHRoZXJlIHdvdWxkIGdlbmVyYWxseSBqdXN0IHJlc3VsdCBpbiAtRU5P
TUVNCj4gZHVlIHRvIHRoZSB4bWFsbG9jXy4uLigpIGZhaWxpbmcgKGxlYXZpbmcgYXNpZGUgb3Zl
cmZsb3cgbm90Cj4gYWNjb3VudGVkIGZvciBpbiB0aGUgb2xkIGNvZGUpLCB3aGljaCBieSB0aGUg
bmV3IGNoZWNrIGp1c3QKPiBnZXRzIGNoYW5nZWQgaW50byB0aGUgbW9yZSBhcHBsaWNhYmxlIC1F
SU5WQUwuIEkgdmlldyB0aGUKPiBjaGFuZ2VkIGNhbGxlZCBvdXQgaW4gdGhlIHRpdGxlIGFzIG1v
cmUgaW1wb3J0YW50LgoKTm9uZSBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgcmVhbGx5IGV4cGxhaW4g
dGhpcy4gU28gdGhlIHNhbml0eSBjaGVjayBkaWQgCmZlZWwgbW9yZSBpbXBvcnRhbnQuCgpZb3Ug
cHJvYmFibHkgd2FudCB0byByZXdvcmQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gd2h5
IHRoZSBzYW5pdHkgCmNoZWNrIGlzIGFkZGVkIChpLmUgRU5PTUVNIHZzIEVJTlZBTCkuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
