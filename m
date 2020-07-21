Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D1227B9C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 11:23:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxoUz-0006y6-P5; Tue, 21 Jul 2020 09:23:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDR4=BA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxoUy-0006y1-Fa
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 09:23:44 +0000
X-Inumbo-ID: def41234-cb33-11ea-84fc-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id def41234-cb33-11ea-84fc-bc764e2007e4;
 Tue, 21 Jul 2020 09:23:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a14so5608858wra.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=OlvW3xbvdzsZzjeUiLqigemg/exIGFMp6fI8py9pDoo=;
 b=JDklvqbu+podRlAKOwhFEiEbjDzEuGdWWqmNfkzs18dCNwBDINGWZ4wh2zHjuu9z5b
 raJDAXsNskWbXC9Ol4fQkmOyMUsvQ7mRDHbXJRBnhxF39gDIbWJAhJc2E8Eaz5ApDyNC
 /ZX6W/xwGVT9Qu1VpvyqatME8d/140wQo34hXX8uyEgmjJKuR0oiisr0Twup8i8XwNrm
 55L6CKNNx3h3ZFNQMneezgMhb7Wf304G/Y+oRli2rWcIq6SyEg+nJTZfPYB7xsj84POS
 z0uCa8pxYnPQ7o14SVT1TqNV2EJSkaiHcwES2qFWaRI5QKuSoA+Xh25gBNDLy3ZSw4UX
 bIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=OlvW3xbvdzsZzjeUiLqigemg/exIGFMp6fI8py9pDoo=;
 b=XgAXthWCF55/eRP+obo202iYE5va761eDuJKSizTIWIKLu+IwCXQI2eSBavWhSFqQT
 5RlbsQHF4ifwqov5N4tObTRhRjxPisH66xA641SKExx69fuj68LrnPtRHrbd3eEPGqS5
 qrUXTGXZZREwlhdGHpLnqEONCfEXMdHS7wVS3nSEpMIathQkc0vhGekqy9uPqtOBJwk9
 AWenMkEXJXq87t8u0KJfurUwONVaSEYhtdfa6p3Uln9yIG9+/Tvxk98hhf1uVPB+ezpe
 OTG6YiuEovnyp3hctRT3iRxLv0M5kYWzmu/YDIXB6jQig/wndknkAXzT0A8oQnN0qatB
 JMJw==
X-Gm-Message-State: AOAM5336T5NOTqdBaW+qmGEMEeRoW6/jbXubU04ARpnrA/qXCQdwD3cU
 k57/q2tdFpl4w0LUDoh+oTE=
X-Google-Smtp-Source: ABdhPJy1FccZoSGC4ujMAJaT39575N9yzIHrqVgvTrIYj0R8L/2sI6m2+F//D7j7iLXOIuNWgCXcVQ==
X-Received: by 2002:adf:f449:: with SMTP id f9mr1556571wrp.416.1595323422924; 
 Tue, 21 Jul 2020 02:23:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id k126sm2734171wmf.3.2020.07.21.02.23.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 02:23:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Nick Rosbrook'" <rosbrookn@gmail.com>, <xen-devel@lists.xenproject.org>
References: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
 <003901d65f2e$6faab0c0$4f001240$@xen.org>
 <66dc2e79-e899-1d94-c0f2-d834b55cd859@citrix.com>
In-Reply-To: <66dc2e79-e899-1d94-c0f2-d834b55cd859@citrix.com>
Subject: RE: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
Date: Tue, 21 Jul 2020 10:23:41 +0100
Message-ID: <004001d65f40$a0348330$e09d8990$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJO5yDcExPNZQbG/t5S46VRX2lP6wJ2S7dHAu7JLWan9YorIA==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 21 July 2020 10:21
> To: paul@xen.org; 'Nick Rosbrook' <rosbrookn@gmail.com>; xen-devel@lists.xenproject.org
> Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'George
> Dunlap' <george.dunlap@citrix.com>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation for python 2.6
> 
> On 21/07/2020 08:13, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Nick Rosbrook <rosbrookn@gmail.com>
> >> Sent: 21 July 2020 00:55
> >> To: xen-devel@lists.xenproject.org
> >> Cc: paul@xen.org; Nick Rosbrook <rosbrookn@ainfosec.com>; George Dunlap <george.dunlap@citrix.com>;
> >> Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> >> Subject: [PATCH for-4.14] golang/xenlight: fix code generation for python 2.6
> >>
> >> Before python 2.7, str.format() calls required that the format fields
> >> were explicitly enumerated, e.g.:
> >>
> >>   '{0} {1}'.format(foo, bar)
> >>
> >>   vs.
> >>
> >>   '{} {}'.format(foo, bar)
> >>
> >> Currently, gengotypes.py uses the latter pattern everywhere, which means
> >> the Go bindings do not build on python 2.6. Use the 2.6 syntax for
> >> format() in order to support python 2.6 for now.
> >>
> >> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > I'm afraid this is too late for 4.14 now. We are in hard freeze, so only minor docs changes or
> critical bug fixes are being taken at
> > this point.
> 
> This is Reported-by me, and breaking gitlab CI on the master and 4.14
> branches (because apparently noone else cares to look at the results...)
> 
> The alternative is to pull support for CentOS 6 from the 4.14 release,
> which would best be done by a commit taking out the C6 containers from CI.
> 

At this late stage I'd rather we did that.

  Paul

> ~Andrew


