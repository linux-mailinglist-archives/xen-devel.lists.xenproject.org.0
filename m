Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C30A14F1E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 13:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874040.1284913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYlPI-0004Yd-Da; Fri, 17 Jan 2025 12:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874040.1284913; Fri, 17 Jan 2025 12:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYlPI-0004X9-Af; Fri, 17 Jan 2025 12:25:00 +0000
Received: by outflank-mailman (input) for mailman id 874040;
 Fri, 17 Jan 2025 12:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGgd=UJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tYlPG-0004X3-Kc
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 12:24:58 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fcb850e-d4ce-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 13:24:56 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so439546566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 04:24:56 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384d28507sm162195766b.77.2025.01.17.04.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 04:24:55 -0800 (PST)
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
X-Inumbo-ID: 0fcb850e-d4ce-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737116696; x=1737721496; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjGDC0ZAfo7uCkPg54+zeMeHrkZkBx1xwvN1HBSGBps=;
        b=cyH9RGKuNyFEetxcYUkxYWuRe9PD7JLc60GWBHpATvK48c9PYSsDCwvOOAwh5Fkrlw
         yLBqHymKbHYr8rh9OS2DB0z2slcGAhI1oJ6whBVgNdW5dS71iIoWb9E18PHjuWu9xQTT
         FyPTZCfKpIaSVYLqQ7JyuZKKKqBr5Ft5QAdlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737116696; x=1737721496;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZjGDC0ZAfo7uCkPg54+zeMeHrkZkBx1xwvN1HBSGBps=;
        b=u6QAMGXPTVOE8GIukD3fu1jEJBXxz7HXWmh0/yV+im5lrr9jXV4RgM3kBlEMT6pUWy
         Ii+nQrS0dWsJyfU3DIKYBc5fHw8xVawuKsaMPZb56d7V2dAaYDU361M8aJgex88eutop
         v54NFX6OzhgC7Fl6AqmHoGHVnX9dEk8TkHoYwXmVbifwTylkcDH6/sZ2FHoxc5A75gcx
         /7y3FPV17Ap0zck1JXZaXt8V/PlrLnfuiVP/mdRhequehHgGTwDN5fCdKTaPYPGPW3cL
         r3bXqQAZDXaAQ/aLydcJqDS9Y6I5jlJ8w7opjyr6BnjkcuL/q7bW8wkKqosRHxUB3VR7
         8Jwg==
X-Forwarded-Encrypted: i=1; AJvYcCXNOsYRZWAhqPo/wxwW9vmf/NU+aolYGPOMhbKUQC2dhxVU2nhz2J23Yq3Yu2+gxQ6X5xDe5nAX+8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzG41fiEO+aaTQC0nQs3U/lQpqgVFB8Yk7JTD6mzcrb6nvVoSN
	dKXouHvrRy6XSjjW/EcnG3i9E3rlb9vk06CVeWg4iW3RrKK1pb6AHo2CGqREWPs=
X-Gm-Gg: ASbGnct/c0oTZ7STK0K3f9BGe4iiPaeQxUWO+EKfi5NCR+jrN/yHXEGpvUZTDRYELyI
	VtQfurhHTW6uKw9TMZbnvCef+N+gNhqogzaxZcfer/SbkvzMgFsak5yfXLWLG+IUYDtHSg8swny
	uQhFsZ8nqQwnk04C9vVu12z6kZmAHOafLluwFqbwxmCDe7vagsnZESK6379su9Uwf1f67iBFz2m
	QBA3NY/YiLrqekAKEo790iFPuTsEaLcOQs7MJFr2CQLfkU6sknm8XP081eiNolrvA==
X-Google-Smtp-Source: AGHT+IHiqGtgizAR99kSa21ynZO425cuV68rvSS6tGs+oi/qyVmdNo9uJqML7SsYa+R2Qn+Nz1/H+g==
X-Received: by 2002:a17:907:930b:b0:aab:c78c:a705 with SMTP id a640c23a62f3a-ab38b3d4253mr243695766b.52.1737116696049;
        Fri, 17 Jan 2025 04:24:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 12:24:54 +0000
Message-Id: <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Wei Liu" <wl@xen.org>,
 <sergiy_kibrik@epam.com>
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
X-Mailer: aerc 0.18.2
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
 <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
 <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
 <Z4oxZSUQ6VARiR0H@macbook.local>
In-Reply-To: <Z4oxZSUQ6VARiR0H@macbook.local>

On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
> > On Wed, 1 Mar 2023, Jan Beulich wrote:
> > > While we want certain things turned off in shim-exclusive mode, doing
> > > so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Si=
nce
> > > that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off=
 as
> > > a result. Yet allyesconfig wants to enable as much of the functionali=
ty
> > > as possible.
> > >=20
> > > Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of a=
ll
> > > C code using it can remain as is. This isn't just for less code churn=
,
> > > but also because I think that symbol is more logical to use in many
> > > (all?) places.
> > >=20
> > > Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >
> > > ---
> > > The new Kconfig control's name is up for improvement suggestions, but=
 I
> > > think it's already better than the originally thought of
> > > FULL_HYPERVISOR.
> >=20
> > I think the approach in general is OK, maybe we can improve the naming
> > further. What about one of the following?
> >=20
> > NO_PV_SHIM_EXCLUSIVE
> > PV_SHIM_NOT_EXCLUSIVE
>
> IMO negated options are confusing, and if possible I think we should
> avoid using them unless strictly necessary.

The problem is that the option is negative in nature. It's asking for
hypervisor without _something_. I do agree with Stefano that shim would be
better in the name. Otherwise readers are forced to play divination tricks.

How about something like:

    SHIMLESS_HYPERVISOR

That's arguably not negated, preserves "shim" in the name and has the corre=
ct
polarity for allyesconfig to yield the right thing.

>
> I for example always considered extremely confusing that previous to
> having CONFIG_DEBUG Xen used NDEBUG (so no debug) as a way to signal
> debug vs non-debug builds.
>
> Thanks, Roger.

Cheers,
Alejandro

