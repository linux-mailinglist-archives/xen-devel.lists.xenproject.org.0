Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C7779A86B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 15:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599427.934848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhPg-0003KD-M6; Mon, 11 Sep 2023 13:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599427.934848; Mon, 11 Sep 2023 13:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhPg-0003HR-Iw; Mon, 11 Sep 2023 13:57:16 +0000
Received: by outflank-mailman (input) for mailman id 599427;
 Mon, 11 Sep 2023 13:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfhPf-0003HL-Pj
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 13:57:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ca4740a-50ab-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 15:57:14 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso47806465e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 06:57:14 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b0031f3780ce60sm10224349wrt.7.2023.09.11.06.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:57:13 -0700 (PDT)
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
X-Inumbo-ID: 1ca4740a-50ab-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694440634; x=1695045434; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LtszPSjF0361o7mG9b3MT9vCwKyYLB+8SdTDz5xxw0Y=;
        b=icUvW7YFZCSbz7X9fvHVT5kpmujNDF7aW2I04s5yL7a1rF/Z8dbemQqqB5efBpPwBz
         kvdaluMGkGLBpA7nZvmq4rCATZsMLRy2NJkP6dIyKGKkJx5Vg3f5KLO0F3iINB8yejBU
         S/gA3iBGz1vPtQnC0i/eplt6RyOdUJeUNwpo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440634; x=1695045434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtszPSjF0361o7mG9b3MT9vCwKyYLB+8SdTDz5xxw0Y=;
        b=RmP61CT4I3YAbku1ffFBBmRPrcGL1vCy52xrC5eCy+7dmqbeDzLt3b7vKu7nTXUttV
         l6leGjfAaVKe7d2yrHFexZk5BuxlRnCNNhhmEXOoBTcyRzBRqzD13vgKR9EflIXc8lbF
         wVu5sY1m176uLPEPdmP0kx72iBEvsTaQHWXJOQndGCCzojRzyZahcNEJTPja2ovBCJ7o
         DT2jMMcwJE4RXh7DbXnkqiIrmSiISDLsZeNbghg/8MGm/580g5klnEmqxztshBtXKNm6
         4zCnWCjUdNEZasVxqWq0dTVoW0KKjzlilv7k28VAXD5GV85o5aADo+q43GU1q8AvXwKu
         QmdQ==
X-Gm-Message-State: AOJu0YyjLnhuZsOvDDbeThF5cqRkCXrqn14K3Nhf+uWDXfyg3OtVsPA2
	u29TTcLKZqTs8f4uTH2AoBhX9A==
X-Google-Smtp-Source: AGHT+IHbcCpFQfcuOKECRQb/pzUWzVhKag0NkQYI+gCwH5zHAqqePd7kvby5e9SC4QjgfDoA+nQtbA==
X-Received: by 2002:a7b:c7c9:0:b0:3fe:22a9:910 with SMTP id z9-20020a7bc7c9000000b003fe22a90910mr9082356wmk.14.1694440633975;
        Mon, 11 Sep 2023 06:57:13 -0700 (PDT)
Date: Mon, 11 Sep 2023 14:57:13 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] tools/xentrace/xentrace_format: Add python 3
 compatibility
Message-ID: <e5xo6kolwd7ujd2utbx54rg4t25p37d4kkvlisyqkgsdioj3si@4amodrdu45nq>
References: <20230906131616.7681-1-javi.merino@cloud.com>
 <eccd7f3e-abf6-2e6d-063f-477ccbdc6b5d@citrix.com>
 <lt77rwliauydvvzzm2vgaox5nqdt5a2sectcjvcyvq7edpq3ul@im3spknk7qcg>
 <daf0ec20-71bf-26cf-5587-848d94bab972@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <daf0ec20-71bf-26cf-5587-848d94bab972@citrix.com>

On Mon, Sep 11, 2023 at 02:45:56PM +0100, Andrew Cooper wrote:
> On 11/09/2023 2:44 pm, Javi Merino wrote:
> > On Mon, Sep 11, 2023 at 11:52:43AM +0100, Andrew Cooper wrote:
> >> On 06/09/2023 2:14 pm, Javi Merino wrote:
> >>> diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
> >>> index 5ff85ae2e8..166ebae325 100644
> >>> --- a/tools/xentrace/xentrace_format
> >>> +++ b/tools/xentrace/xentrace_format
> >>> @@ -4,11 +4,15 @@
> >>>  
> >>>  # Program for reformatting trace buffer output according to user-supplied rules
> >>>  
> >>> +from __future__ import division
> >>> +from __future__ import print_function
> >>> +from __future__ import unicode_literals
> >>> +from builtins import str
> >>> +from past.utils import old_div
> >> This adds a new dependency on a package we (upstream Xen) don't
> >> currently use.  AFAICT, it's only for...
> >>
> >>> @@ -223,7 +232,7 @@ while not interrupted:
> >>>              last_tsc[cpu] = tsc
> >>>  
> >>>          if mhz:
> >>> -            tsc = tsc / (mhz*1000000.0)
> >>> +            tsc = old_div(tsc, (mhz*1000000.0))
> >> ... this, which is always int / float and doesn't fall into Py2's
> >> int/int behaviour in the first place.
> >>
> >> I'm pretty sure the code can just stay as it is, without needing to use
> >> old_div().
> > Ok, I will the dependency on python3 future and the old_div() for v2.
> 
> My point is that I don't think we need this dependency at all, and I
> don't think you need to change this line at all.

Yes.  And I forgot to add "remove" and the sentence made no sense.
What I meant was:

Ok, I will remove the dependency on python3 future and the old_div() for v2.

Cheers,
Javi

