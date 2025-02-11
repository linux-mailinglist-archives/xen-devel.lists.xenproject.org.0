Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA8A30875
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885302.1295093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnTK-0004lk-Ub; Tue, 11 Feb 2025 10:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885302.1295093; Tue, 11 Feb 2025 10:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnTK-0004io-S0; Tue, 11 Feb 2025 10:26:30 +0000
Received: by outflank-mailman (input) for mailman id 885302;
 Tue, 11 Feb 2025 10:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thnTK-0004ii-5L
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:26:30 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6fc647d-e862-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 11:26:28 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f61b01630so55284015ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:26:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-730880ec313sm4138751b3a.140.2025.02.11.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:26:26 -0800 (PST)
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
X-Inumbo-ID: a6fc647d-e862-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739269587; x=1739874387; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMrzuxBAdOTydMYX/tWqdg24r56Mm57l+KegMpJmInM=;
        b=g3J5u0z7MVcV37lDS7Ugo8mQk27Nlc3B/IjQJ7f4nRSLVNCin9cZfRuP8I52gN8KgL
         p+f9qDv2e4RPwd53UXHmnV4WKSURpHBlqfba5ccysAcqttbr/WhLIlQJWR27qr0kOysk
         a/aDi4MfrauCwTEBTOwsJVP8WHBLh8NfN6yaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269587; x=1739874387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMrzuxBAdOTydMYX/tWqdg24r56Mm57l+KegMpJmInM=;
        b=dtUpJLkPPdAvQAVeq09FESPQ9DyC3xCmiuRdi6Nn+/OOy0F+hatxjN3xT24QVp5VzW
         XSTcbKOwDtbwxYxlEQw4SPkAX5NJD91YrmnznTgWSu0CgYhdAVcknU5Y277rTkuBdbFA
         4kf7h58TNzV0/qF4x0X+3iLQJ7eUlLtW0ZtUAlPYCb6wkuqr4Z5lOhg4eI0/XH9Sokqg
         /OrSS3N0S/nyurRe/c89eDGZ1MH6ZB4wlkcY4M63jVhWb5PXvNXnwZh3peFvrzDvaFfC
         57ZyWaG/07Ei1UOKDLN32eQUVxQuZqeMm1hB7d+R1EHRAouH2/4UlnVw8iuNYU4nZR5E
         JGcg==
X-Forwarded-Encrypted: i=1; AJvYcCUWI1IAUwgjVrxXMFyLKNSpVubSAuHtNmfv5Y/t66PpHdIh7nfjHy9eXcX5xj+6+99oPmE1GajVJfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSdCm1ao0abbger0GR+h0pj479EdPGXnPNkrqMNi3iVTLDgefG
	Wy08Z/lBb9CMFtrs8BtRz2tIbpSBglVPqf4sGvNtQjdVEO7beDyToQS7Drtq0aA=
X-Gm-Gg: ASbGncsO4lR3jwr59GI1r4KcpR87QSuJIsJ93VZ30A48y0iVpG3pjgbFOD2dHG92/+R
	lqEHC1I2VvBTNmykTyAxm8CItMqSTewgCmksLa+HLYwOO+kSDNeF814eyNkbAMnA7MxyHK0FHoA
	F0WD6sjlYeirvBx8H8ovg5bBYa8nYPGobomwd9aW+vG6Py6lsuf3DL1HLKV7fHnb7YRvgboDMMT
	uxtmPjnYuWN5ozMwg2N0rPE9FjanbmFRgCJG7ppyQynD/yhfKLVHY1KQfdWxboqLKhPTie+j7S3
	2fXahQ0GlZLs2vS2iHRVgbMiSA==
X-Google-Smtp-Source: AGHT+IE+xsSdie8+oKtJaJ4NKHX/HMbD3dJ5+HFVVSglZKdXIbLYsHUjuhVZ/t3B5Ig4czzsqHh/9g==
X-Received: by 2002:a05:6a00:1889:b0:726:a820:921d with SMTP id d2e1a72fcca58-73218c5fa64mr4666546b3a.10.1739269587131;
        Tue, 11 Feb 2025 02:26:27 -0800 (PST)
Date: Tue, 11 Feb 2025 11:26:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6slzXnBALUyZj1f@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
 <Z6sY_YsjJ6rGi8zS@macbook.local>
 <904D5489-29C7-4377-B50C-CED2F13A7D35@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <904D5489-29C7-4377-B50C-CED2F13A7D35@arm.com>

On Tue, Feb 11, 2025 at 09:49:54AM +0000, Luca Fancellu wrote:
> Hi Roger,
> 
> >>>> 
> >>>> 5) You name it. I think many people in the community can name their points for
> >>>> and against clang-format.
> >>> 
> >>> What are the parts of our coding style that clang-format cannot
> >>> correctly represent?  Could you make a list of what would need to
> >>> change in Xen coding style for it to match perfectly what clang-format
> >>> will check?
> >> 
> >> we already went through that route, there is no checker anywhere that matches
> >> the Xen coding style perfectly, so it’s either we change the coding style or we
> >> don’t proceed further with any automatic check
> > 
> > I'm probably fine with changing coding style, that's why I'm asking
> > for a list of what needs to be changed (unless we switch to a
> > completely different coding style).
> 
> Sure, I think listing the differences is fine.
> 
> > 
> >>> 
> >>> Ideally the first step would be to prepare a patch to adjust the
> >>> coding style so it's in line with what clang-format will do.
> >> 
> >> It’s easy to say that, but difficult to implement, if we could accept the clang-format
> >> rules it would be easier to adopt the configuration itself as coding style, maybe
> >> enhanced with some comments.
> > 
> > I'm kind of lost, why is it difficult to implement?  What I'm asking
> > for is a patch to CODING_STYLE that modifies it in a way that we could
> > use clang-format.  In any case we need to do that if we want to use
> > clang-format.
> 
> Changes to the CODING_STYLE are historically difficult, given that the natural
> language is prone to interpretation. I’m not opposing to that, I’m just pointing out that
> starting changing the CODING_STYLE in order to accept the clang-format feels
> more risky and time consuming than testing clang-format and modifying the
> CODING_STYLE accordingly.

I suggested that because it's IMO important to see the resulting
style.  I'm not suggesting to modify CODING_STYLE in a single change,
it should be multiple patches that adjust the different areas that
require changes to match what clang-format can do.

I think it's important that we can see how the final style will look
like, otherwise it's hard to compromise on intermediate seemingly
unconnected changes without knowing what the end result will be.

> Anyway the resulting clang-format would have our coding style for what can be covered
> by the tool and have something new for what it cannot be covered, it’s just that at least
> you have a reproducible way that can be tested.
> 
> > 
> > One question that seems to have been dropped from my previous email:
> > would it be feasible to apply the updated style to newly added chunks
> > of code only, but not to the (unmodified) surrounding context?
> 
> I dropped that one from my reply because I know there are tools that do that,
> but I’ve never investigated, maybe Oleksandr could try to have a look.
> 
> I’m not sure if the result would feel more like a frankenstein, but it would for sure
> limit the churn.

Depends on how many differences there are between our current coding
style and what clang-format can enforce that's closer to our existing
style.

Knowing the differences would be key in understanding whether this
would be a viable approach.  It would certainly be my preference if
the differences between our coding style and what clang-format can do
are not too big.

Thanks, Roger.

