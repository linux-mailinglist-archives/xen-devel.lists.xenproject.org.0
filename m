Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D319F253
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 11:18:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNtY-0007xQ-AQ; Mon, 06 Apr 2020 09:18:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLNtW-0007xL-Ln
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 09:18:14 +0000
X-Inumbo-ID: 8a491a8a-77e7-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a491a8a-77e7-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 09:18:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id cw6so18295191edb.9
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Tx7rBNCXnlpHQrdNaaPu8h1N1job7kKMdjUxxhmPvMI=;
 b=et5yYcI3kUwJcncifL5Zxkeul2/yVG1+EIVgHGQk45PdQlFUVR0Kre+N2m6EQ2aoov
 OGfUUsb3xW+e4vL3ThjXgnKS0Hk7ZPXsXn/xnqYX0w9cR9hTzbVqDNC+3UIc805lPgjt
 BM+nAj1OpKwMJzlcvpJESaISj9/S/x83RBHgF9Brk4ctGTnbfQBP/DETYqGqecY24iJ1
 69PO8gJW1g/+7+N2ixSa2oHOg34n7xiUnRWLxqJnYMVwZm5O2NjKUnLg6iEUvSmZMM5G
 mrMqrHxsCf/GQHq+Cft+xYE3boJlk6GzQqKqCPzRJiOPy0YE7tZQLX5VGuEHT6UInIPs
 4e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Tx7rBNCXnlpHQrdNaaPu8h1N1job7kKMdjUxxhmPvMI=;
 b=ZnMprCnaJoP+Q01L43d+nOodm1hC7aDKUwQxU5E8g4AdS+YboBjvA5oZs5Oci/bIKB
 P/yHhd5P1wLAfHOUJgqTVR+GWGZG64RvYhMBJEgAksaFqyKcijxwWwhjwtoz/JGrHRQn
 r+aCXyTjMX3jJvxt/dx21MNjFJ0YotgeJqch4CVLm+Pq+C1WALUU13dq95JQafzAoltS
 0crRpK1ggnvOyL/1y+358dgBSs0zrGd6D40eURZTLwScq+yQqFTm107SmLaZvaP4leZp
 G6tpKPwaAxnhWV7b1Zd6Nn/gLAkR8cPbADUBgfKRGj74XNEvVZARnRoUpDXSIkl7PV97
 ORgg==
X-Gm-Message-State: AGi0PuZIhiR1ls7xF1VvvgMHQ/V1W0n+1lGwNII8FMGe2MwiT4hufNVL
 d9MHz7eq5MXEPekqUQDao5Q=
X-Google-Smtp-Source: APiQypLt124LSi+NXS22VGoVs7pgQEBqkmeGCcXdMn0JcQ129IZpxIJ5PNBkyQ7UUGlsiuSQ2Gsipg==
X-Received: by 2002:aa7:d999:: with SMTP id u25mr18804209eds.210.1586164692515; 
 Mon, 06 Apr 2020 02:18:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id c5sm242346edt.40.2020.04.06.02.18.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:18:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <002201d609d0$55a76690$00f633b0$@xen.org>
 <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
 <001701d60bed$25606f80$70214e80$@xen.org>
 <e2e25069-36e5-b965-8f66-59a460369e88@xen.org>
In-Reply-To: <e2e25069-36e5-b965-8f66-59a460369e88@xen.org>
Subject: RE: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Mon, 6 Apr 2020 10:18:10 +0100
Message-ID: <002701d60bf4$4b640460$e22c0d20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AC9qttvAt7KY/0Cn78SegKGUxSNAT1JVvEC2KVtyahC20mg
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
> Sent: 06 April 2020 10:08
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
> On 06/04/2020 09:27, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Julien Grall <julien@xen.org>
> >> Sent: 03 April 2020 18:24
> >> To: paul@xen.org; xen-devel@lists.xenproject.org
> >> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian
> >> Jackson' <ian.jackson@eu.citrix.com>; 'Jan Beulich' =
<jbeulich@suse.com>; 'Stefano Stabellini'
> >> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>
> >> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
> >>
> >> Hi Paul,
> >>
> >> On 03/04/2020 16:55, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>> [snip]
> >>>>> +
> >>>>> +#include <xen/save.h>
> >>>>> +
> >>>>> +struct domain_context {
> >>>>> +    bool log;
> >>>>> +    struct domain_save_descriptor desc;
> >>>>> +    domain_copy_entry copy;
> >>>>
> >>>> As your new framework is technically an extension of existing =
one, it
> >>>> would be good to explain why we diverge in the definitions.
> >>>>
> >>>
> >>> I don't follow. What is diverging? I explain in the commit comment =
that this is a parallel
> >> framework. Do I need to justify why it is not a carbon copy of the =
HVM one?
> >>
> >> Well, they are both restoring/saving guest state. The only =
difference is
> >> the existing one is focusing on HVM state.
> >>
> >> So it would make sense long term to have only one hypercall and =
tell
> >> what you want to save. In fact, some of the improvement here would
> >> definitely make the HVM one nicer to use (at least in the context =
of LU).
> >>
> >
> > I guess we could move the HVM save records over to the new =
framework, but it works for the moment so
> I don't want to bring it into scope now.
>=20
> And I agree, hence why I say "long term" :).
>=20
> >
> >>   From the commit message, it is not clear to me why a new =
framework and
> >> why the infrastructure is at the same time different but not.
> >>
> >
> > An alternative would be to move the HVM save code into common code =
and then try to adapt it. I think
> that would result in more code churn and ultimately be harder to =
review. The extra infrastructure
> introduced here is fairly minimal and, for the moment, only targeting =
PV state. As I said above
> there's nothing stopping the HVM records being ported over later once =
any initial issues have been
> shaken out.
>=20
> Code churn is always going to necessary one day or another if we want =
to
> consolidate the two.
>=20
> Having two frameworks is not without risks. There are a few unknown to
> be answered:
>    * Is there any dependency between the two? If yes, what is the =
ordering?

There isn't any dependency at the moment so need I say anything? If an =
ordering dependency is introduced by a future patch then surely that =
would be time to call it out.

>    * The name of the hypercall does not say anything about "PV". So a
> contributor could think it would be fine to save/restore new HVM state
> in the new generic hypercall. Is it going to be an issue? If so, how =
do
> we prevent it?

The commit message says:

"Domain context is state held in the hypervisor that does not come under
the category of 'HVM state' but is instead 'PV state' that is common
between PV guests and enlightened HVM guests (i.e. those that have PV
drivers) such as event channel state, grant entry state, etc."

Do you think this should also appear in a comment? Do we really care? =
Nothing fundamentally prevents the mechanism being used for HVM state, =
but that may introduce an ordering dependency.

>    * Are we going to deprecate the existing framework?
>=20

There is no intention as yet.

> I am not suggesting we should not go with two frameworks, but the
> reasons and implications are not clear to me. Hence, why I think the
> commit message should be expanded with some rationale.
>=20

Ok, I can add a paragraph to try to explain a little more.

  Paul


