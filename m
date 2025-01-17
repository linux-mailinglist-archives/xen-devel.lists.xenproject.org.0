Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A13A14D98
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 11:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873980.1284883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYjd3-0003L7-92; Fri, 17 Jan 2025 10:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873980.1284883; Fri, 17 Jan 2025 10:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYjd3-0003J2-5b; Fri, 17 Jan 2025 10:31:05 +0000
Received: by outflank-mailman (input) for mailman id 873980;
 Fri, 17 Jan 2025 10:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wado=UJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYjd2-0003H8-DR
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 10:31:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26b69b04-d4be-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 11:31:03 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso20511515e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 02:31:03 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890413801sm28329125e9.15.2025.01.17.02.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:31:02 -0800 (PST)
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
X-Inumbo-ID: 26b69b04-d4be-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737109862; x=1737714662; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWnfsQANsxzXMU5+yYNLa3Ox6UG+PQHS2M8lsUr+nz4=;
        b=WSQ/BMBsh+gLnnaHJ/oBXzxmrQblRmaXFQqgj2tKeu9mYF5GR0m7zeP91tPGSGniU5
         REH42Uyuf04gKvG8WoIIqqf0aKre+VIempQa1MplHsUcAfq5UgPMlSp0i21wXHj8OoDT
         RsNFjFErU1dgsCsEvJYN3ug550uCnobx/ZqZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737109862; x=1737714662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWnfsQANsxzXMU5+yYNLa3Ox6UG+PQHS2M8lsUr+nz4=;
        b=NbeaAAN7erPWu6IupM1uQBcSTHlE+64v9t88ttpIWiFuErwosgbISzKIUPu4jyZ9za
         c55VO/z9BuvJ6qCXs1gRorUq0axX/K5jutH7DrdVuRHwLCwab12DDDmhauPfWjhl2Vnd
         fRaM6IxZZEXMBMt5ArEDRc2HesiPWekq9TTp7BwGbSNr34XOfVwt61lSDLw8q7969ROl
         YOP2WnRgqfl8AQWTyuauxP0kk0PFfi9z9uKgQN8GvLt2gh4eJlz2tt5b5Jl/wSK21d36
         PVkcznsFCP0c3Yis7cubLEmK7DvB58JUUwDQNT/ccVonixwHvgINHrzZeZqVISqEbKGo
         f32Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHKsgsxCkwp1GD/EUIsMtOPoisanGyFkl6fjnmtshrjMlbqd4KVjr3qGpW3nX4C70MPVQR9QdPCqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8Tg813oEF6LGnwKNthbDrgmhEl66J1pGAXoW593GXYNGS/eaL
	1rNE3fdvHf6uiGxFcheZL2cHtM7aFxdopeMJQh3hpJ55cm6Qn8gn+tKhtH0r7qQ=
X-Gm-Gg: ASbGncv5sgytdaV/MSJkDvaRdlUTc/HFJ8g3x/LaMLtBa/fWB5FZx+EOUZeW6Pj79sc
	YVmKeDYeeFgqwcr5wGiNJKznHiC0zLj1728ztGz/FxNTh8RUl1PN4Wxwjl4e+AMPSjB6UUaWpov
	tPbshHbfGG2fNgWYydrem+u3hHlCBxJKkjwWtl7mi2j91L3c8VRjGOURJs87bzWYyiJFcMWGogJ
	hUwNcZoEyL5z1Xg17QvVCbuO3uYiNhZ27hkTiy366D0j2MUmvzPZ/uhP8vWnA==
X-Google-Smtp-Source: AGHT+IEo+Qxb9n8ExU9BaXNNFMwfhk7Dy9TIAKl2hbzARFWejH53KYJHc1VJzhokTtaFMB/pYmDtUg==
X-Received: by 2002:a05:600c:4fd6:b0:436:18e5:6917 with SMTP id 5b1f17b1804b1-438912d3aa3mr22055875e9.0.1737109862550;
        Fri, 17 Jan 2025 02:31:02 -0800 (PST)
Date: Fri, 17 Jan 2025 11:31:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	sergiy_kibrik@epam.com
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
Message-ID: <Z4oxZSUQ6VARiR0H@macbook.local>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
 <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
 <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>

On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
> On Wed, 1 Mar 2023, Jan Beulich wrote:
> > While we want certain things turned off in shim-exclusive mode, doing
> > so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
> > that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
> > a result. Yet allyesconfig wants to enable as much of the functionality
> > as possible.
> > 
> > Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
> > C code using it can remain as is. This isn't just for less code churn,
> > but also because I think that symbol is more logical to use in many
> > (all?) places.
> > 
> > Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > ---
> > The new Kconfig control's name is up for improvement suggestions, but I
> > think it's already better than the originally thought of
> > FULL_HYPERVISOR.
> 
> I think the approach in general is OK, maybe we can improve the naming
> further. What about one of the following?
> 
> NO_PV_SHIM_EXCLUSIVE
> PV_SHIM_NOT_EXCLUSIVE

IMO negated options are confusing, and if possible I think we should
avoid using them unless strictly necessary.

I for example always considered extremely confusing that previous to
having CONFIG_DEBUG Xen used NDEBUG (so no debug) as a way to signal
debug vs non-debug builds.

Thanks, Roger.

