Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB860A10551
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871223.1282264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf52-0003Fo-MZ; Tue, 14 Jan 2025 11:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871223.1282264; Tue, 14 Jan 2025 11:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf52-0003Cb-JE; Tue, 14 Jan 2025 11:27:32 +0000
Received: by outflank-mailman (input) for mailman id 871223;
 Tue, 14 Jan 2025 11:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXf50-0003CV-OA
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:27:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a23870c-d26a-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:27:29 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso6927825a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:27:29 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c440bsm5938529a12.26.2025.01.14.03.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:27:28 -0800 (PST)
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
X-Inumbo-ID: 8a23870c-d26a-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736854049; x=1737458849; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ldjiazwPH/9g3yJmkdafzgo4e1V47IDF3ZSi2eHgu4=;
        b=JYrrgirfWYvHoU9/BmiRt6rPr8DcyM4yN5iUJb/1hs67eYhj7qqw21gbrrglN89Nnh
         B54DPpIG+zWOjI8//l56YWWIEPlXTu/vFpq9WLXV6VeQDbeQ2rWk3/sdFYK7iMvnHc4a
         rVvnSwFcG2ORuOn5MWjm7CrlUIZOt9m1kNDp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854049; x=1737458849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ldjiazwPH/9g3yJmkdafzgo4e1V47IDF3ZSi2eHgu4=;
        b=XNkAb0IqMwUFcC2cvlRC901vMHJcvfvGt5BXSrddI/ux2gE4FEsC9i2LCBz+LM8tIF
         te4Tt1rF5T5PEb1h35Lj3rpt2kiBFtOr2VHbF8Z9s0nXiyY2PMbSCHGY7bVQRNbCoi4N
         F3IRV33eJ1I9bRBGK6pdVhf+ff8aIwhuObnRo+2hSTdUHRyCx2GXAT3zVoUbcSAV6swN
         Oy84XuEX9THdd87+I1YQ2DRRVXhOIn8dzCJfZ7EEaZK5ZKSEI8i6z7Ci/f9ZuoXY25N9
         76CPxOlGReCYx8nDXOD5AGQ0j8iDtsXFy9OMvNm7Oh5+2iBMl2k1GtLQGKq5K0rYZRGp
         XPgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvqLRnqEW3Bu4QLXYdVaBYBtloRuWHQcotPUnswodcabMZv9IW/sF/1TQyS1u6gR5nWrA7EJQkh1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKfolTI3gS9r7DmJMN2/ecFFOdF/EG3NS4GA+XC/s3IPxf2ZKc
	K1ke8RXV+F6TAbEZtwtouemXo9OCF7v0EbJhRo1z9Or5PfVJiuGUboe7CSqfGqE=
X-Gm-Gg: ASbGncs6jhQWZ5q9HDqSJBFs8KxJqo6/E0w9Z3twksEFn510p4/A5pCj8XhAUBzHtMO
	AS93IAUpE55x+se4FYNuxvcypoDvwwhhn62xaIdhv6HjPaYLF3hQ6C60OWlqWVXhb1IaDiJwhqL
	McB9wswx1r42fkkT9mluoOEfvp1tw/WpbuDNYUgj+f+SsRSHuVrLEWgRy82ETNaXDCrQo2D21bX
	LamAhCiLA1LTGemFwtmhtg5WuckGAwIreBv/slVoBX/kQIcnT0Jq/+84cxwUhYM6bg=
X-Google-Smtp-Source: AGHT+IE8eng1kEqFIdvntk1QFXrFAxg4/l8zMJCie8iIQHNaFTnDUyQEYIeGFhqb+qjOsbP31spVoA==
X-Received: by 2002:a05:6402:354b:b0:5d0:bf4a:3dfe with SMTP id 4fb4d7f45d1cf-5d972e4e7b6mr21832791a12.23.1736854049337;
        Tue, 14 Jan 2025 03:27:29 -0800 (PST)
Date: Tue, 14 Jan 2025 12:27:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <Z4ZKINmJXw5T2dsM@macbook.local>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
 <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>

On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
> 
> On 1/13/25 6:52 PM, Roger Pau Monné wrote:
> > On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
> > > > Allow setting the used wallclock from the command line.  When the option is set
> > > > to a value different than `auto` the probing is bypassed and the selected
> > > > implementation is used (as long as it's available).
> > > > 
> > > > The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
> > > > supported built-in) or from UEFI firmware respectively.
> > > > 
> > > > Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> > > Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> > Thanks for the review.
> > 
> > Oleksii, can I get your opinion as Release Manager about whether this
> > (and the following patch) would be suitable for committing to staging
> > given the current release state?
> > 
> > It's a workaround for broken EFI implementations that many downstreams
> > carry on their patch queue.
> 
> Based on your commit message, I understand this as addressing a bug ( but not very critical
> as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
> reviewed and tested, we should consider including it in the current release.

IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
the same behavior as proposed here.

> IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
> It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
> value over time. After that, we could consider making "auto" the default.
> That said, I am not particularly strict about following this approach.

We cannot really set efi as the default, as it would break when
booting on legacy BIOS systems.

We could take only patch 1 and leave patch 2 after Xen 4.20 has
branched, but at that point I would see little benefit in having just
patch 1.

I don't have a strong opinion, but downstreams have been complaining
about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
good to not ship yet another release with such allegedly broken
behavior.

Let me know what you think, as I would need a formal Release-Ack if
this is to be committed.

Thanks, Roger.

> ~ Oleksii
> 
> 
> > 
> > Thanks, Roger.

