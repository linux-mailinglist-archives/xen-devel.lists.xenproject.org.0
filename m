Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B8133CF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 21:01:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMdMN-00037S-Qz; Fri, 03 May 2019 18:56:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SF20=TD=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hMdMM-00037N-2i
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 18:56:38 +0000
X-Inumbo-ID: 2d22589d-6dd5-11e9-843c-bc764e045a96
Received: from mail-ua1-x944.google.com (unknown [2607:f8b0:4864:20::944])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d22589d-6dd5-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 18:56:36 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id g16so2387481uad.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=G0m5V+AUt0AA5eQd/o8+ABNqsEJc8WipRkkEJ02oRGA=;
 b=YesrMXA/LwEoIFY73ywxlUkySRohD0mndEJs/HP7l4VfORZW7k4yZLeZoKrVMCH+fE
 7+1B9uxYr7Ho4B5GOswXI6Nvef4qW4dwBpzWWaoJc37gC1B89fB19k6m619pwvhES59c
 BzMtdSb7gBbx0Uchy6n6Y0EmepwhMB7KSnAMo+TuDvKPnAhZYwG9HCm+6gMTrGz2ryJg
 fUzKi35CfuAXcsPetlTF9qmne5y3Zyh68UgO6iAkRD3L4M3wNXdYcrW2P765znI0iDJL
 QGntxDzffXhCsUF824iPSxiY1Hac1wpOxuL4ANgk0cOuz2/yEvBqN1cbtvrm4daTbgYs
 0Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=G0m5V+AUt0AA5eQd/o8+ABNqsEJc8WipRkkEJ02oRGA=;
 b=Jizo1gs+f2efi+iCPOQxP7FQFZrdnCcKjaybFtcySPgL717eJGyYoutvxFCzrytQIU
 VqOHaFeOUavqZwc76cIufNVH9y8io8ACj/8iJq3ecYiuCk9R2n3JudU/YBqrvFwrr31K
 5/MzaBmgwepOzbsJ4nvh+QCTwGn7AaoJJHx+mYD2goFcEcSku7Ulws3vvdoLPi5rSzgV
 jm0v3rdOUYQnHVRkOJC4CyOrHINBbx3AIGXTbAw4aqjkh++DIDX6fCoUcfoHkYPKkGnB
 Z4bn0wrMfGLTynr48KMEoSTaG2W8/tfqcFIsWfQP+UJlgDAbCXF7e6yfF/jdt4LYTsfN
 6MUA==
X-Gm-Message-State: APjAAAUglP5PEfr7SgGJoojsTp23l3di9k8cYbxfQFAsdK2KOZA7+wc1
 kW25LpFIZF31tzPVwt2uUAw=
X-Google-Smtp-Source: APXvYqxSmTpXE7oC75vUcrq9CK/ukIKPDBNzuGiKBjw2e1SP+8E3RpvgdcCY6K7XUFaJ9FUMgFYEhQ==
X-Received: by 2002:ab0:3058:: with SMTP id x24mr5956135ual.95.1556909795543; 
 Fri, 03 May 2019 11:56:35 -0700 (PDT)
Received: from [192.168.0.102] (ip88-74-15-186.ct.co.cr. [186.15.74.88])
 by smtp.gmail.com with ESMTPSA id h93sm527225uad.2.2019.05.03.11.56.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 11:56:34 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
In-Reply-To: <9434ed49fc68a05999e130abfde973663ed41d2d.camel@suse.com>
Date: Fri, 3 May 2019 12:56:30 -0600
Message-Id: <CB078283-0837-4477-A831-564745FD0C76@xenproject.org>
References: <20190503153839.19932-1-elnikety@amazon.com>
 <9434ed49fc68a05999e130abfde973663ed41d2d.camel@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH] sched/credit: avoid priority boost for
 capped domains when unpark
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@xen.org>,
 Eslam Elnikety <elnikety@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDMgTWF5IDIwMTksIGF0IDEwOjQ4LCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1
c2UuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIDIwMTktMDUtMDMgYXQgMTU6MzggKzAwMDAsIEVz
bGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBXaGVuIHVucGF1c2luZyBhIGNhcHBlZCBkb21haW4sIHRo
ZSBzY2hlZHVsZXIgY3VycmVudGx5IGNsZWFycyB0aGUKPj4gQ1NDSEVEX0ZMQUdfVkNQVV9QQVJL
RUQgZmxhZyBiZWZvcmUgdmNwdV93YWtlKCkuIFRoaXMsIGluIHR1cm4sCj4+IGNhdXNlcyB0aGUK
Pj4gdmNwdV93YWtlIHRvIHNldCBDU0NIRURfUFJJX1RTX0JPT1NULCByZXN1bHRpbmcgaW4gYW4g
dW5mYWlyIGNyZWRpdAo+PiBib29zdC4gVGhlCj4+IGNvbW1lbnQgYXJvdW5kIHRoZSBjaGFuZ2Vk
IGxpbmVzIGFscmVhZHkgc3RhdGVzIHRoYXQgY2xlYXJpbmcgdGhlCj4+IGZsYWcgc2hvdWxkCj4+
IGhhcHBlbiBBRlRFUiB0aGUgdW5wYXVzZS4gVGhpcyBidWcgd2FzIGludHJvZHVjZWQgaW4gY29t
bWl0Cj4+IGJlNjUwNzUwOTQ1Cj4+ICJjcmVkaXQxOiBVc2UgYXRvbWljIGJpdCBvcGVyYXRpb25z
IGZvciB0aGUgZmxhZ3Mgc3RydWN0dXJlIi4KPj4gCj4+IE9yaWdpbmFsIHBhdGNoIGF1dGhvciBj
cmVkaXQ6IFhpIFhpb25nLgo+PiAKPiBNbW0uLi4gSSdtIG5vdCBhbiBleHBlcnQgb2YgdGhlc2Ug
dGhpbmdzLCBidXQgZG9lc24ndCB0aGlzIG1lYW5zIHdlCj4gbmVlZCBhICJTaWduZWQtb2ZmLWJ5
OiBYaSBYaW9uZyA8eHh4QHl5eS56eno+IiB0aGVuPyBDYy1pbmcgTGFycy4uLgoKQXMgZmFyIGFz
IEkgY2FuIHRlbGwgZnJvbSBhIHF1aWNrIHNlYXJjaCBvbiB4ZW4tZGV2ZWxAIFhpIFhpb25nIGlz
IG9yIAp3YXMgYW4gQW1hem9uIGVtcGxveWVlIHNvIGEgc2lnbmVkLW9mZi1ieSBpcyBub3Qgc3Ry
aWN0bHkgbmVjZXNzYXJ5CmJ1dCB5b3UgbWF5IHdhbnQgdG8gc2F5IHNvbWV0aGluZyBsaWtlLgoK
T3JpZ2luYWwgcGF0Y2ggYXV0aG9yIGNyZWRpdDogWGkgWGlvbmcgb2YgQW1hem9uCgpMYXJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
