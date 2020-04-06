Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E019F18C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 10:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLN60-00031V-UV; Mon, 06 Apr 2020 08:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLN60-00031Q-4o
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 08:27:04 +0000
X-Inumbo-ID: 646e82de-77e0-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 646e82de-77e0-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 08:27:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a43so18172980edf.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=AmBPbhV6g2IaLOFOkpSmZFKlFd1m/HMJ+BA2WDmUJIU=;
 b=lTZ4RrDEQ2e0sj/upAp4GgAOsH5JOj4MUaMfKU3Ou4LheVKzHOC6GOErLoTVROgoYm
 yCBULJxRqJJplz4j0JD267G7DbqY8+4fIZ/RtQv6H4QLf10Z6ae8Q7hPMqF7+bTdB+mu
 eDpv0doFswVf6wRKTmpfuMG7AhJbMqdQ+D1pzXAcAin4I8XP9mcaUBHVgqh9wB0nkFCX
 zzzPWwgm9xTUnNY8dSZ54ickVKb+HRAGloPuJZnEZjgAP4rBII58lndi5GoQCghJ4dB5
 f3YJUydhhRq1nDe4AR0uLuCbZV2En7bOYPiZ54qEbwtrtkZm7GeD98jCtb4K9IqO7gK7
 gWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=AmBPbhV6g2IaLOFOkpSmZFKlFd1m/HMJ+BA2WDmUJIU=;
 b=Dwpn93e6Czg5iJokBEkKQJOb39QEjaGXsG4jyWSwwK0sgIFZt5oQdbp6M1iifY7Nkb
 PykUdVmssi8PmboSGZJL1B/YAS1B3dIrCPoQo17H8n2G123H9XIoqS2UmsXFCjb1txzI
 1N13EwW34Iy54cJH5LmDK9QvgLUwa+E662jfa4kqADdvuv3Igess28xEQ+i4McEjFR2E
 qrx4Ir3+7TAzDp7Mo1l1cyf9bzgKO2RvMlsg0riQJeNX39PecP9CLjWWrI28xBz5NeDT
 zU7ikQAHFN13THrd6cS+x6oZFtuKHWyUn7ePLzpkrk87sHL9VmILMNIQD38dbqhDfPRV
 jzXQ==
X-Gm-Message-State: AGi0Pua4MDrc+HnQBLU8u7iH9J7cq7fEwNbe2TdtOpCcmZvrR18e9xJe
 TQsbzewHvos4AZSRpImdzYI=
X-Google-Smtp-Source: APiQypLguW7BSWBLjVfkgWMNjzRjxwD9bbYIpW5CSxqaTLRUWdMuWOITt5p37kuc8zt5X+Ib2B7zBg==
X-Received: by 2002:a17:906:4d4d:: with SMTP id
 b13mr1352105ejv.6.1586161622483; 
 Mon, 06 Apr 2020 01:27:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id p17sm2776308ejn.5.2020.04.06.01.27.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 01:27:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <002201d609d0$55a76690$00f633b0$@xen.org>
 <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
In-Reply-To: <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
Subject: RE: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Mon, 6 Apr 2020 09:27:00 +0100
Message-ID: <001701d60bed$25606f80$70214e80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AC9qttvAt7KY/0Cn78SegKGUxSNqGN7zjA=
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 03 April 2020 18:24
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian
> Jackson' <ian.jackson@eu.citrix.com>; 'Jan Beulich' =
<jbeulich@suse.com>; 'Stefano Stabellini'
> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> Hi Paul,
>=20
> On 03/04/2020 16:55, Paul Durrant wrote:
> >> -----Original Message-----
> > [snip]
> >>> +
> >>> +#include <xen/save.h>
> >>> +
> >>> +struct domain_context {
> >>> +    bool log;
> >>> +    struct domain_save_descriptor desc;
> >>> +    domain_copy_entry copy;
> >>
> >> As your new framework is technically an extension of existing one, =
it
> >> would be good to explain why we diverge in the definitions.
> >>
> >
> > I don't follow. What is diverging? I explain in the commit comment =
that this is a parallel
> framework. Do I need to justify why it is not a carbon copy of the HVM =
one?
>=20
> Well, they are both restoring/saving guest state. The only difference =
is
> the existing one is focusing on HVM state.
>=20
> So it would make sense long term to have only one hypercall and tell
> what you want to save. In fact, some of the improvement here would
> definitely make the HVM one nicer to use (at least in the context of =
LU).
>=20

I guess we could move the HVM save records over to the new framework, =
but it works for the moment so I don't want to bring it into scope now.

>  From the commit message, it is not clear to me why a new framework =
and
> why the infrastructure is at the same time different but not.
>=20

An alternative would be to move the HVM save code into common code and =
then try to adapt it. I think that would result in more code churn and =
ultimately be harder to review. The extra infrastructure introduced here =
is fairly minimal and, for the moment, only targeting PV state. As I =
said above there's nothing stopping the HVM records being ported over =
later once any initial issues have been shaken out.

  Paul




