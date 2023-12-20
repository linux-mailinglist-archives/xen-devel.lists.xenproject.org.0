Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CA819B63
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657521.1026414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFssO-0008Tj-Ll; Wed, 20 Dec 2023 09:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657521.1026414; Wed, 20 Dec 2023 09:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFssO-0008RX-J9; Wed, 20 Dec 2023 09:28:28 +0000
Received: by outflank-mailman (input) for mailman id 657521;
 Wed, 20 Dec 2023 09:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFssN-0008RF-5h
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:28:27 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 205dc89e-9f1a-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:28:25 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3365d38dce2so4339520f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:28:25 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 s8-20020a5d5108000000b003366fb71297sm4478971wrt.81.2023.12.20.01.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 01:28:25 -0800 (PST)
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
X-Inumbo-ID: 205dc89e-9f1a-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703064505; x=1703669305; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrEvX6/yVQgGwfF8heu5Y7DVN16yqcwz9KXea8MHDJo=;
        b=Rc5UJsnu7v1XxYAYCnOp5vRN4xmmQWZSMbnjbmpSkm7J7ZbVrFAyebNtMg3TI5uCeE
         DGZ2nv/aK+KlQToInmO8WARe4nzq7GrDVwUpmYFS6RJtaR80+oiOhHpP4kMjOSfd1Qmz
         ZhfnU0HXC+UX89MQNph2YlC93V9fJsomaI/wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064505; x=1703669305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrEvX6/yVQgGwfF8heu5Y7DVN16yqcwz9KXea8MHDJo=;
        b=QjxKCyp3QtAuTZKWiR92KOdSWnkvAOTQmHvQPQ1Qswo4HcftXZUYGiQ8TNb2ITDfQp
         BAjY9f/WsrtlYKU/5uZC4hVu7OAAvVARppwwRx3fTJ5bIETM3wwtnmbexJeXUBbKZevl
         D5YIUXS9qn8Lzq7lVg+9qDLpiuXiZG36WtzcnNuUhOv4nTxfumUnZ8dsO6cPZSHJNktW
         WYLV1IpIoHK/nx6E5JLNl18ztfW6R8GMqSgOL4+ULJ2qAwKFafwQ/xz7U2svrykE0YrE
         Diiyx57borIQ5QpWl4jALmQnWoRvG3W8Ce3T9g4bQIqvPAzDyEXG7Xam7+0/v2K+bKk6
         /gYw==
X-Gm-Message-State: AOJu0Yy65R8yPhONt7YbSobN6RT61ALtPeZufq6PSJKGclS/Yuz8Y1Xf
	FZQlLhcONWoKTGBH+kBY0X+9zg==
X-Google-Smtp-Source: AGHT+IE8XZFd/kUnvO2yd/DMdwicdEdzY2XpHHGkNhU1sFdDlQJZUjEcS5PAU+JoCL2m3wkjXQA6Bg==
X-Received: by 2002:a05:600c:244:b0:40c:2b4c:623f with SMTP id 4-20020a05600c024400b0040c2b4c623fmr6611652wmj.82.1703064505268;
        Wed, 20 Dec 2023 01:28:25 -0800 (PST)
Date: Wed, 20 Dec 2023 10:28:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Message-ID: <ZYKzuJVnoE312Xdi@macbook>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
 <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>
 <3957ab63-9f77-4342-a470-62a0c077bb55@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3957ab63-9f77-4342-a470-62a0c077bb55@suse.com>

On Wed, Dec 20, 2023 at 10:09:12AM +0100, Jan Beulich wrote:
> On 19.12.2023 21:31, Andrew Cooper wrote:
> > On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> >> +        if ( system_state < SYS_STATE_active )
> >> +            printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> > 
> > This is a test hypercall, for the purpose of running testing, in
> > combination with test livepatches.  Eliding the diagnostics isn't ok.
> > 
> > Logspam concerns aren't an issue.  If the user runs `while :; do
> > xen-test-smc; done` in dom0 then they get to have a full dmesg ring.
> > 
> > Don't let that get in the way of having a sensible time figuring out
> > what went wrong.
> 
> Since it was me who asked to suppress this when invoked through sysctl:
> I can live with an unconditional printk() here, but I think this goes
> against the "what can be done in user space should be done there"
> principle: If enough information is propagated back, user space should
> be able to provide all necessary output without even a need for the
> observer to run "xl dmesg".

But propagating such information to user-space is also not trivial,
and involves more logic in the hypervisor.

I think the point of "what can be done in user space should be done
there" is to avoid adding unnecessary code to Xen, but in this case
printing such detailed information in user-space would require adding
more code to Xen in order to propagate it.

Thanks, Roger.

