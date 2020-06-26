Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15220AD52
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joiu3-0004g0-03; Fri, 26 Jun 2020 07:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1joiu2-0004fv-22
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 07:36:02 +0000
X-Inumbo-ID: aea68890-b77f-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aea68890-b77f-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 07:36:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t194so8397610wmt.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=CETvD1BVCb9PYKbxPYDHyrBKH39clrmwIBRG5ovO63c=;
 b=N+dBt36exrfHqWQw+QtXkHpvkeYCwgTmzgXE16kXfgvci7hZ+I0hvX19V3m8RfDdCI
 2Z2qIrDUE0+dP21lkqBevUjyY0XcWa21kkE6juuGKHYKKKbsWXnHoTP/eGIHu6njzdFd
 zmFe/HQzIzaxCyi2to/fcBwkMib19MghkfcOFoNNUvUQn1PtRZ6whPd43rHsRw2RqiA+
 etJ/yCKO43zHhmTFb8XNcvw71qdhWwRgrIfPaBeU6hrRwOGgAJfVmoC9zob+iOW/FXL9
 yNi4ShauLilM76BohGM7DFzDkfRIlmeDqYC/Tis85kvbmvgrFbJnnonxQm9l1bXcwtwI
 TUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=CETvD1BVCb9PYKbxPYDHyrBKH39clrmwIBRG5ovO63c=;
 b=QgtQjnvR7ilociRyThXL4C1sPNkHAE20nMT8TYJosSyHqe9lpf7GhGjKDxyxyYc3Hn
 sG7HtOkR6WXPi3Kn9GpVhYavDYvLjl8f4iT2qWzz9TDYH7x5rYUaPAZx3rd/T/9GWDSF
 VmZB8W3coCXgGyuySZrJF0bMInlyIG3tvHYwv2ugXs1sAO41eURJADIFRiQBW2aNqqbf
 cXLnzg9lgR4VCCs8GKYIqXyZb78s/XpNsFPeq8wm0SlVlBvxJpT2QZio7Naa/6eOoQYs
 YoSTkVo4PAqi99i+2gU62xiEq0ocT7nyjZGBgbNuWSJbbS3VyenO2ulyemx26bs7e2/5
 uZjg==
X-Gm-Message-State: AOAM531yItNl9wQ2tgEaSBKKN5C3B7y6rTNPE9m88oXUmoJAqPNosdFU
 F/+yvKynT1BlkgCKk1qX09o=
X-Google-Smtp-Source: ABdhPJzvrywodPf1EIrM7e6rsCey4b2r6rayff/RvVF0SWLE0p5lY5Dv9ETKfn+vh2Zfso/ZGgW/Bw==
X-Received: by 2002:a1c:1d46:: with SMTP id d67mr2084783wmd.152.1593156960321; 
 Fri, 26 Jun 2020 00:36:00 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id 92sm28852929wrr.96.2020.06.26.00.35.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 00:35:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Jason Andryuk'" <jandryuk@gmail.com>
References: <691aebb4-87af-60df-b6ad-07cb6fef4167@suse.com>	<24308.50838.149966.847431@mariner.uk.xensource.com>	<64c6a187-bf90-ae69-793b-0651bedd4f88@suse.com>	<CAKf6xpuAHCDc-O_CwXCrRYQojDLi9Abjjphud076OCeU_eoidg@mail.gmail.com>
 <24308.53852.871947.61151@mariner.uk.xensource.com>
In-Reply-To: <24308.53852.871947.61151@mariner.uk.xensource.com>
Subject: RE: [PATCH] scripts: don't rely on "stat -" support
Date: Fri, 26 Jun 2020 08:35:58 +0100
Message-ID: <000301d64b8c$6fd987c0$4f8c9740$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHcg0OOtNH1/o2UTx36U3QnAmwfsQFzhIFdAhU3WrgCrYBjdgHUyarnqJ257BA=
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 25 June 2020 17:36
> To: Jason Andryuk <jandryuk@gmail.com>
> Cc: Jan Beulich <jbeulich@suse.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; Wei
> Liu <wl@xen.org>
> Subject: Re: [PATCH] scripts: don't rely on "stat -" support
> 
> Jason Andryuk writes ("Re: [PATCH] scripts: don't rely on "stat -" support"):
> > On Thu, Jun 25, 2020 at 11:47 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > > On 25.06.2020 17:45, Ian Jackson wrote:
> > > > Jan Beulich writes ("[PATCH] scripts: don't rely on "stat -" support"):
> > > >> While commit b72682c602b8 ("scripts: Use stat to check lock claim")
> > > >> validly indicates that stat has gained support for the special "-"
> > > >> command line option in 2009, we should still try to avoid breaking being
> > > >> able to run on even older distros. As it has been determined, contary to
> > > >> the comment in the script using /dev/stdin (/proc/self/fd/$_lockfd) is
> > > >> fine here, as Linux specially treats these /proc inodes.
> > > >>
> > > >> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> > > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > >
> > > > Thanks.
> > > >
> > > > The only code change here is this:
> > > >
> > > >> --- a/tools/hotplug/Linux/locking.sh
> > > >> +++ b/tools/hotplug/Linux/locking.sh
> > > >> @@ -45,18 +45,14 @@ claim_lock()
> > > >> -        if stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
> > > >> +        if stat=$( stat -L -c '%D.%i' /dev/stdin $_lockfile 0<&$_lockfd 2>/dev/null )
> > > >
> > > > Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > > >
> > > > Has anyone executed this ?
> > >
> > > I have, of course, to confirm this fixes my issue. But I'm not sure
> > > that's what you've meant to ask - you may have wanted assurance
> > > that someone else has also tried it.
> >
> > Tested-by: Jason Andryuk <jandryuk@gmail.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> :-).
> 

In which case...

Release-acked-by: Paul Durrant <paul@xen.org>

> Thanks,
> Ian.


