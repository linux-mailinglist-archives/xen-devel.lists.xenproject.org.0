Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1F13CFA4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 23:01:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irqfO-0000BI-MH; Wed, 15 Jan 2020 21:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ovR2=3E=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1irqfN-0000BD-RY
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 21:57:33 +0000
X-Inumbo-ID: 08093a54-37e2-11ea-b89f-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08093a54-37e2-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 21:57:32 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id n21so19472823ioo.10
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:mime-version:subject:from:in-reply-to:cc
 :date:message-id:references:to;
 bh=2hPMjFLlpTTJMnHfZfmgjrfPEIdv2pMbNbk43N42mK0=;
 b=ur7Nxq0AMTZRWVYijWDkxYL4fZFzbrpfwboU8EHJqkFkKjvZId1F+BlY+5P+DW9YRR
 syN9wL0Jwq/0BiSHHm1LLlDctoRG1M6bDiwzAp3odUHRPYe8LWS8jvCPXQiFiNhVtCBE
 FqlQL6xZuQkRQVkCxIdC1q86HTEL6OHlwf9HLkYb4Un3pLGIrGI/yF5GcBPixpCYp6rp
 qw9ydIlEFnPDs6jE44PQwy6yWhTZTM8hHdwChW9RFqR2jypLmHbe1o2X2J1LwlASBKZJ
 GGZzPHoYQEOJWW5kW0Q0QlxFi36L78pPdaEh7m2R1qy/Uayqe7bsaxxLU2gsbnQCpbhm
 7C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:mime-version:subject
 :from:in-reply-to:cc:date:message-id:references:to;
 bh=2hPMjFLlpTTJMnHfZfmgjrfPEIdv2pMbNbk43N42mK0=;
 b=E/p2SKmOQApccoWofxaNQFSDA1YJY7xxCt0uzbno4ARbBCzcLxhrU+19UVdGjSWIow
 vmEV941DVnEQDbAntNYXcomg5PrGV5PI4Vyy1mUemuA2M3q9Y8//GUGcxj1StyZvTiub
 tcCyfGUEyBFOQzm6WlEmO8iBdeACLs6zOWzdeeuk3wC1Rs4v45K2OlSVElgL1tbxbC0B
 YdXSmjRiHG+n+jloYvImQeeL0gt5c/NfdgXXD7/kUCZf+bcZlAX6gmgYYEOVjm8SAUeJ
 rnnueFzXZOVrgPstX0zgmI4HD8Ru0PMBH1YNRpopvjMvoBiJwtWqo+4q07fs6ykD0Kvy
 9MOQ==
X-Gm-Message-State: APjAAAUY/BsBIX9W1TJJRi0nGfWI1+NM/8saMjLKA5gU0iVM7cwRXkUy
 6+ZlLsoKoAjfWR+L+0tWRcY=
X-Google-Smtp-Source: APXvYqxVcKdCk4KlMT42wjRGSx2RzvhQAvxyRYJGgx8EmZeUtcOXnK5iQNAKtd5/n3Pxo7dQqPyidA==
X-Received: by 2002:a6b:6f01:: with SMTP id k1mr23993829ioc.28.1579125452133; 
 Wed, 15 Jan 2020 13:57:32 -0800 (PST)
Received: from [100.64.72.6] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id 68sm6135477ilc.85.2020.01.15.13.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 13:57:31 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
In-Reply-To: <844c2e98000772126a3168305d692192df90c204.1579055705.git-series.marmarek@invisiblethingslab.com>
Date: Wed, 15 Jan 2020 16:57:29 -0500
Message-Id: <839DA21B-FE80-47D0-91AB-740B36B381A8@gmail.com>
References: <844c2e98000772126a3168305d692192df90c204.1579055705.git-series.marmarek@invisiblethingslab.com>
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
X-Mailer: iPhone Mail (17C54)
Subject: Re: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKYW4gMTQsIDIwMjAsIGF0IDIxOjQyLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+IO+7v1NpbmNlIHdlIGhh
dmUgdGhvc2UgZ2VuZXJhdGVkIGZpbGVzIGNvbW1pdHRlZCB0byB0aGUgcmVwbyAod2h5PyEpLAo+
IHVwZGF0ZSB0aGVtIGFmdGVyIGNoYW5naW5nIGNvbmZpZ3VyZS5hYy4KCklzIHRoZXJlIGFueSBy
ZWFzb24gbm90IHRvIHJlbW92ZSB0aGUgZ2VuZXJhdGVkIGNvbmZpZ3VyZSBmaWxlcz8gIEEgZGV2
ZWxvcGVyIHVzaW5nIGdlbmVyYXRlZCBmaWxlcyBvbiBzeXN0ZW0gQiB3b3VsZCBiZSBpbmNvcnBv
cmF0aW5nIGNvbmZpZ3VyYXRpb24gYXNzdW1wdGlvbnMgZnJvbSBzeXN0ZW0gQSB3aGVyZSB0aGUg
Y29uZmlndXJlIHNjcmlwdCB3YXMgZ2VuZXJhdGVkLiAgSWYgd2UgYXJlIGdvaW5nIHRvIHNoaXAg
Y29uZmlndXJlIHNjcmlwdHMsIGRvIHdlIG5lZWQgdG8gZG9jdW1lbnQgYSAic3lzdGVtIEEiIHJl
ZmVyZW5jZSBkaXN0cm8vZW52aXJvbm1lbnQgd2hlcmUgYWxsIGNvbmZpZ3VyZSBzY3JpcHRzIGZy
b20gWGVuIHdpbGwgYmUgZ2VuZXJhdGVkPwoKCk90aGVyIG5vdGVzOgoKMS4gIERlYmlhbiBhdXRv
cmVjb25mIHdvcmtzIGluIHRoZSBYZW4gcm9vdCBkaXJlY3RvcnksIGJ1dCB0aGUgZGVmYXVsdCBP
cGVuRW1iZWRkZWQgYXV0b3JlY29uZiB1c2VzIEdudSBsaWJ0b29saXplIGFuZCBmYWlscyBiZWNh
dXNlIHNvbWUgWGVuIGJ1aWxkIHN1YmRpcmVjdG9yaWVzIGRvbid0IGhhdmUgY29uZmlndXJlLmFj
Ly5pbi4gICAKCjIuICBJZiBPcGVuRW1iZWRkZWQgYXV0b3JlY29uZiBpcyBydW4gb25seSBpbiB0
aGUgdG9vbHMgZGlyZWN0b3J5ICh3aGVyZSBpdCB3b3JrcyBhbmQgZ2VuZXJhdGVzIGEgbmV3IHRv
b2xzIGNvbmZpZ3VyZSksIHRoZW4gcm9vdCBjb25maWd1cmUgKGdlbmVyYXRlZCBmcm9tIG9sZGVy
IGNvbmZpZ3VyZS5hYykgd2lsbCBzaWxlbnRseSBpZ25vcmUgdGhlIG5ld2VyIHRvb2xzIGNvbmZp
Z3VyZSBhbmQgd3JpdGUgY29uZmlnLmggX3dpdGhvdXRfIHRvb2xzLXNwZWNpZmljIGNvbmZpZywg
c3VjaCBhcyB0aGUgdmNoYW4gUU1QIHByb3h5LgoKMy4gSWYgYXV0b3JlY29uZiBydW5zIHN1Y2Nl
c3NmdWxseSBpbiB0aGUgcm9vdCBkaXJlY3RvcnksIHRoZW4gdG9vbHMtc3BlY2lmaWMgY29uZmln
dXJlIGlzIGNvcnJlY3RseSBnZW5lcmF0ZWQgYW5kIGV2ZXJ5dGhpbmcgd29ya3MgYXMgZXhwZWN0
ZWQuCgpUaGlzIHNpbGVudCBmYWlsdXJlIGNvdWxkIGJlIGF2b2lkZWQgYnkgZGVsZXRpbmcgdGhl
IGdlbmVyYXRlZCBjb25maWd1cmUgc2NyaXB0cy4gIFRoZXJlIG1heSBiZSBvdGhlciBmYWlsdXJl
IG1vZGVzIGZvciB1c2luZyBTeXN0ZW0gQSBnZW5lcmF0ZWQgc2NyaXB0cyBvbiBkb3duc3RyZWFt
IGJ1aWxkIHN5c3RlbSBCLgoKUmljaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
