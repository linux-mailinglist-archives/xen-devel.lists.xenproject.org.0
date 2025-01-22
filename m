Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FEA18EC6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 10:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875844.1286257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taXMI-0002TU-Ko; Wed, 22 Jan 2025 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875844.1286257; Wed, 22 Jan 2025 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taXMI-0002RX-IB; Wed, 22 Jan 2025 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 875844;
 Wed, 22 Jan 2025 09:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYzQ=UO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taXMI-0002RR-24
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 09:49:14 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22773307-d8a6-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 10:49:12 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1301923166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 01:49:12 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c5c465sm891577866b.17.2025.01.22.01.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 01:49:11 -0800 (PST)
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
X-Inumbo-ID: 22773307-d8a6-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737539352; x=1738144152; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJSCDKb2eB5CRIvZDbmZLNEwqJEBlN0L6WqqdCi1C5s=;
        b=sTPp3GY1BMmiy13ZPqwr2hXKW2jLWxUJXTKDisjWN7xQI6sFxzhZGcTdNjihMNETBj
         aaUJ+FZuC0+vesOSR3sPf3L8/ruaZWOj7u/qOFwexlVirBvhBXBqHQJ9cQlkWDYLZQ4J
         +aCmaWjUxFbXZMOBLLfFHwshevg7+s7jVxfqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539352; x=1738144152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJSCDKb2eB5CRIvZDbmZLNEwqJEBlN0L6WqqdCi1C5s=;
        b=MjHn885lPnvzd8l2bgPSp6KTf+uTZ550CaHN66PseJAjaSbckSxdaYumm1IKROYmJj
         Gd9mtVKWrEbY7wRa0/FluuL2Y1wwCncqhh5+m3JVbCjNwYuzppF7myTqsT3Fmjtn7pc/
         uA2KsdGmJNZtu6jNemcsgHTQwqk4SsuJVMhbrr2bzwYUOhWP5AQLL4WryQkWCtPgRPq4
         YDe8Pf4IcGs0ouXDL2ttU2Or0Uh0kq3zhWxaiTHyCrHcMv7y7C3ojZmg0N7B6XAMBMIJ
         CnSOWTKoQn+Md8JTyqVX+EgjK0QaWLNSjhK/m1QdRW9CAYSfwhLhlzCuF6DiMSFjB5TO
         8whw==
X-Forwarded-Encrypted: i=1; AJvYcCVJkfmfGTJAG8lzH6f4UgMrRKW+rh08hlP3aJRd3+TRPsFQTuV+JwaPAjjKtqakqDr488NLycDQIpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3b4Vn+Sm0LBNaHo4T1T8niYz1L87rPLoVUSNFtw9i/m2Uk6x/
	UlVf2Le+vhsBXxrY02YmvshuWXhado//aDXucgBuAIi7kDMSUcjtZUVHd9qIx/0=
X-Gm-Gg: ASbGnctGrA2vnMJ+ONbQy+ElVoy7Aw6p+C0M4PiEjBYb2EcguPJNsU/xrqu3Y/Pnf17
	C6jtaUUW6eYpFQ7K0fHFT6dFskRmg8xEjhB8tRb/gFZJFUjYIu77N6ueCecmhAhlEiLpqz/ui/o
	UpuGWtTNthcBs7q5OlcfnmuQUJrnbNw9usvVzzENkKUTT2/gv5DXEhshhdoPXFv02RiK4v/xL/T
	AvxM8Cw3qqpDntervUTz52+iwb9q9n4e1goYRCz4jzPHttHAiUUBdhxKPhzP4ehoFAlHB/l5k1k
	FjPJ
X-Google-Smtp-Source: AGHT+IETiRXoQSjhqFAYlk6Wqt2G/2hm//dP61dZAbkxSrUOgOP4ozfPdYXiY6KLOb15FJHuSlggfg==
X-Received: by 2002:a17:907:3e21:b0:ab6:5558:4922 with SMTP id a640c23a62f3a-ab655585167mr197757766b.41.1737539352139;
        Wed, 22 Jan 2025 01:49:12 -0800 (PST)
Date: Wed, 22 Jan 2025 10:49:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	sergiy_kibrik@epam.com
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
Message-ID: <Z5C_EJEtorK2pwGE@macbook.local>
References: <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
 <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
 <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com>
 <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop>
 <bae48627-fa5b-48b6-b74e-267285175eff@suse.com>
 <Z49gQBkxCbXIO84D@macbook.local>
 <41859184-bd9c-420f-96c1-65abe379b81e@suse.com>
 <Z4_hOmi01AkiYH_k@macbook.local>
 <c897005a-2e8e-4031-a828-acb8128f7c0c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c897005a-2e8e-4031-a828-acb8128f7c0c@suse.com>

On Wed, Jan 22, 2025 at 09:43:53AM +0100, Jan Beulich wrote:
> On 21.01.2025 19:02, Roger Pau Monné wrote:
> > On Tue, Jan 21, 2025 at 11:35:42AM +0100, Jan Beulich wrote:
> >> On 21.01.2025 09:52, Roger Pau Monné wrote:
> >>> On Tue, Jan 21, 2025 at 09:13:38AM +0100, Jan Beulich wrote:
> >>>> On 21.01.2025 00:27, Stefano Stabellini wrote:
> >>>>> If I understood it right, I like Andrew's suggestion. He is suggesting
> >>>>> to do the following:
> >>>>>
> >>>>> - turning PV_SHIM_EXCLUSIVE into something that does nothing
> >>>>
> >>>> FTAOD - you mean Kconfig-wise? Andrew clearly didn't say "nothing", but
> >>>> "nothing other than making the boolean be a compile time constant".
> >>>
> >>> Won't making the boolean a compile time constant would also result in
> >>> DCO kicking in and removing a fair amount of code?  So even if you
> >>> have enabled everything in Kconfig, the resulting hypervisor would
> >>> only be suitable to be used as a shim?
> >>
> >> Of course.
> > 
> > Then what's the point of this approach?  Options will be enabled in
> > Kconfig, but the resulting hypervisor build when using allyesconfig
> > would have a lot of them short-circuited, making it even worse than
> > currently?  As options will get effectively build-time disabled due
> > to DCO while enabled in Kconfig.
> 
> Well, I have to direct this question to Andrew. It is specifically
> what I'm trying to address with UNCONSTRAINED.
> 
> > Overall I think PV_SHIM_EXCLUSIVE should be excluded from
> > allyesconfig, even with Andrew's proposed change.  Otherwise the
> > purpose of allyesconfig is defeated if enabling PV_SHIM_EXCLUSIVE
> > makes the resulting hypervisor build PV shim only.  IIRC we can
> > provide a default alllyes.config with CONFIG_PV_SHIM_EXCLUSIVE=n.
> 
> Hmm, I wasn't aware of the option of using allyes.config. That might be
> the route to go, albeit it looks like people using the allyesconfig
> target then need to remember to set KCONFIG_ALLCONFIG in the environment
> (to <empty> or 1), or to explicitly specify a file name that way. (This
> of course ought to be easy enough to arrange for in our automation.)

My knowledge of Kconfig is very limited, but isn't there a default
path for such file to be picked up by Kconfig?  I see we already have
a xen/tools/kconfig/allrandom.config, I was expecting it would be a
matter of dropping an allyes.config in that directory, but I haven't
tried.

Thanks, Roger.

