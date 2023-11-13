Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (unknown [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BAA7E977C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 09:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631363.984625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2S9R-0001RF-Lb; Mon, 13 Nov 2023 08:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631363.984625; Mon, 13 Nov 2023 08:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2S9R-0001PW-Hs; Mon, 13 Nov 2023 08:18:33 +0000
Received: by outflank-mailman (input) for mailman id 631363;
 Mon, 13 Nov 2023 08:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2S9Q-0001PL-TE
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 08:18:32 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3afc6ad1-81fd-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 09:18:31 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c6efcef4eeso54314211fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 00:18:31 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b0040596352951sm13036903wmq.5.2023.11.13.00.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 00:18:30 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3afc6ad1-81fd-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699863511; x=1700468311; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GrnbYfe0CuYiPy8LxZ0ANicY6fJ5e8VBeICu0CBLscY=;
        b=Y6ZhURGChE/BzRMiQgJusx0rEnBe5hVy5CZ/XdzNNXTClTDNAARWKH9PjNAR51Y+wc
         lCHpoW9KBVmYKbjKHpexfzlI3R9fYief53WiL0zZqwVIz0xdV0pGTb9ASYukHbN7jsi7
         kB+FdTWZOyCvUboD97XL8LQWGiGyAUEUencwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699863511; x=1700468311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrnbYfe0CuYiPy8LxZ0ANicY6fJ5e8VBeICu0CBLscY=;
        b=lK3egDI+4syZgthyYLs+hjWn56Dy3YZu3HcbcSdlDColQH64oT3iq4BoRn0ZGqw+Bq
         PJZu23eAMcqnhtvSiQ8TJc0L7PKFQd4tOn95T5fGH1URNwIzEuMZDBXIP+0RxYFk6cno
         CMeLYYCP2S6/xyJxTfq+g4z3pJbdrCjxNebtI4HWZoHhR9PMMES6CBqEUxJs9YgqlRhP
         Szg4+6tWSBhUDFtp/MAuqJXDU0qkapEHNaGEEVhK1WLESFOJx/H56v3P8bdkfXXmJ7q7
         On/a1o/KcX7/aVIYquoRKO7jobTsUlFesKiw8QpH2hwHIR6z8x8m1o8FctpEcM2otzch
         Wo4w==
X-Gm-Message-State: AOJu0YzsL23D60r1+1vi12/ZK4Azq6y6njXZRYTV1VYJVs1nMcCbd+SY
	dx7033sOor2VzRe7PHUkLeq9xw==
X-Google-Smtp-Source: AGHT+IFMwECalfuqm2Nc1h/Vptm/Ygw8zf/NA91ZorESVT49Qe06vUXKRMTcIfxYKEmSTBLk6Uo8IQ==
X-Received: by 2002:a2e:808d:0:b0:2c8:32e4:c080 with SMTP id i13-20020a2e808d000000b002c832e4c080mr3920321ljg.12.1699863510696;
        Mon, 13 Nov 2023 00:18:30 -0800 (PST)
Date: Mon, 13 Nov 2023 09:18:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	samuel.thibault@ens-lyon.org, wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Message-ID: <ZVHb1QE8VEI5Jn1W@macbook.local>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com>
 <ZU4g0y-Y6-77sY-C@macbook.local>
 <9d75d794-a333-792a-786c-064d35910980@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d75d794-a333-792a-786c-064d35910980@suse.com>

On Fri, Nov 10, 2023 at 01:44:50PM +0100, Jan Beulich wrote:
> On 10.11.2023 13:23, Roger Pau Monné wrote:
> > On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
> >> Get the own domid via creation of a temporary event channel. There is
> >> no "official" way to read the own domid in PV guests, so use the event
> >> channel interface to get it:
> >>
> >> - allocate an unbound event channel specifying DOMID_SELF for the
> >>   other end
> >>
> >> - read the event channel status which will contain the own domid in
> >>   unbound.dom
> >>
> >> - close the event channel
> > 
> > Should we look into introducing a way to expose the domid, so that in
> > the future we might not need to resort to this workarounds to get the
> > domid?
> > 
> > Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
> > a non-HVM specific leaf when it was made available to HVM for pvshim
> > reasons.
> 
> Couldn't we retroactively generalize the type-agnostic parts of that
> leaf?

Hm, maybe.  In retrospective heaving leafs with PV or HVM only fields
was not the best decision.  It would have been better to have a generic
leaf and then fields/flags that only apply to HVM or PV as necessary.

Thanks, Roger.

