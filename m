Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E57F13D8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 13:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636706.992408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r53qk-0004TO-G7; Mon, 20 Nov 2023 12:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636706.992408; Mon, 20 Nov 2023 12:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r53qk-0004Ri-Cs; Mon, 20 Nov 2023 12:58:02 +0000
Received: by outflank-mailman (input) for mailman id 636706;
 Mon, 20 Nov 2023 12:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AiFF=HB=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1r53qi-0004QK-QJ
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 12:58:00 +0000
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6df17729-87a4-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 13:57:59 +0100 (CET)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6d32ce135c4so536477a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 04:57:59 -0800 (PST)
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
X-Inumbo-ID: 6df17729-87a4-11ee-98df-6d05b1d4d9a1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700485078; x=1701089878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRmWYnun+H8N6YfHDxRkcl1OdXmrpY1OVWguGUrRMHw=;
        b=WQKqfuWiukl5QP0cXKMBMaQQWUxEYesnWEYNV6fz/9t0qG7hQZU5TYpMN7Ab3JR/ey
         4pf2o4Ke4TWE3kBKKjBHbdfLoGS70avkuNtFKR0V4Bz4nSf45ZyX3syK/P0VK1mLUJiU
         HD86MHAdg9IOrC7dmPp0sSXJdpkXR23QQUQyLf0gE9nfDj4YMFMjVn+Lla6MbprsmCmE
         fFFTzDMa68GfNRTqCY7iXPLMKcWf0m096DJEChdyeYKTpTF+uyVuVBcrYc5Vna6Kb0Wy
         qt4rDevYPiEXBzqV2VeoPqXrc3p7FpHzPg4MHKjwQnPYTSeZP/NLo7uM1ThULd2mMm3K
         AIyw==
X-Gm-Message-State: AOJu0YyKllHz5dm+sEEm2ZSrWCDe4ejtJwgx9HrAJcQrj5yj2QAqOhjR
	gdSpNKQxW9WMpWqxD41hES8Ki+nOmCBQeP3cEV4=
X-Google-Smtp-Source: AGHT+IH4DqzxN5gzKls1477E5UEmNarpobq+egq12hb2R4tSdspyOE8ms35n4o0BxLppvIHPFohx9qyv0KiJRw9tOUQ=
X-Received: by 2002:a4a:e783:0:b0:589:daaf:44a1 with SMTP id
 x3-20020a4ae783000000b00589daaf44a1mr6702974oov.0.1700485077850; Mon, 20 Nov
 2023 04:57:57 -0800 (PST)
MIME-Version: 1.0
References: <a079bba5a0e47d6534b307553fc3772d26ce911b.camel@infradead.org>
 <20231027191435.GF26550@noisy.programming.kicks-ass.net> <da465baf0ebcfa3c31e5be7e70319b0796ac59da.camel@infradead.org>
In-Reply-To: <da465baf0ebcfa3c31e5be7e70319b0796ac59da.camel@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Nov 2023 13:57:46 +0100
Message-ID: <CAJZ5v0hfkoZM==qobzgzxAvTBDO6yP3w37K=EdHVGFr7WuJTaQ@mail.gmail.com>
Subject: Re: [PATCH] acpi_idle: use raw_safe_halt() from acpi_idle_play_dead()
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-acpi <linux-acpi@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 1:20=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> On Fri, 2023-10-27 at 21:14 +0200, Peter Zijlstra wrote:
> > On Fri, Oct 27, 2023 at 07:36:51PM +0100, David Woodhouse wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > >
> > > Xen HVM guests were observed taking triple-faults when attempting to
> > > online a previously offlined vCPU.
> > >
> > > Investigation showed that the fault was coming from a failing call
> > > to lockdep_assert_irqs_disabled(), in load_current_idt() which was
> > > too early in the CPU bringup to actually catch the exception and
> > > report the failure cleanly.
> > >
> > > This was a false positive, caused by acpi_idle_play_dead() setting
> > > the per-cpu hardirqs_enabled flag by calling safe_halt(). Switch it
> > > to use raw_safe_halt() instead, which doesn't do so.
> > >
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > ---
> > > We might {also,instead} explicitly set the hardirqs_enabled flag to
> > > zero when bringing up an AP?
> >
> > So I fixed up the idle paths the other day (see all that __cpuidle
> > stuff) but I've not yet gone through the whole hotplug thing :/
> >
> > This seems right, at this point everything, including RCU is very much
> > gone, any instrumentation is undesired.
> >
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>
> Ping? Who's taking this?

I'm going to apply it.

> Needs a Cc:stable@vger.kernel.org now too, to fix 6.6.x.

Sure.

