Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2464A3068F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885153.1294932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thm9J-0000KG-Dl; Tue, 11 Feb 2025 09:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885153.1294932; Tue, 11 Feb 2025 09:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thm9J-0000Gc-B1; Tue, 11 Feb 2025 09:01:45 +0000
Received: by outflank-mailman (input) for mailman id 885153;
 Tue, 11 Feb 2025 09:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thm9H-0000G4-NK
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:01:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf9cae50-e856-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 10:01:42 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab7e80c4b55so35958766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:01:42 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de59f893ebsm6621219a12.45.2025.02.11.01.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 01:01:40 -0800 (PST)
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
X-Inumbo-ID: cf9cae50-e856-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739264501; x=1739869301; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtqJY5Ibx/lvkqcUODKvXfScDCKtMqVuB9CA4GaRJe8=;
        b=ns5ivmBlkuRynRBW5BjjHOoTzpArjxDHH0u+VCFJLtEh3IS6C1oihFg12zPBOsY55e
         3Apr+STw76x3BWe9zGIsju5B2QJZ59C/fuT6kt8kOnCg3PC8M4dfoOBYTaYeRVtIiY4B
         ovOgJYu5IXBryOksFaipRHGzipqpEnfZt6UtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264501; x=1739869301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtqJY5Ibx/lvkqcUODKvXfScDCKtMqVuB9CA4GaRJe8=;
        b=dxTbuAdDrky7WLvUiFVqHzxsZBG3V0Hny+ZHdRVQFyNfcJxV8ZUsVc+pCQXPdUBCTm
         +eAtbDIlUQzOlTB3LvwSG7ny8ar/hG6KqHCZfuZvAMPvStPms1ijL3d4ZJVCWwF0f3zT
         X0DV1hmWwKUoh5Zl5odnhjzBjg/82hRGjp1ibshpZcFsw8ozXX+RF7+/NKsb2EpRKqP9
         J+K0XGLD8VfxYcOf9kufo5GoFfVRd4J0avfI/8BnPelYwdd8gEX4nmmXCG/FkikY+S4X
         o0YMffAyluBIvWAf6tzItnDRVtmpjwGIWlaeQAOQ6BvKQC8gO8swfdkihcV+0tOS9BSH
         8KfQ==
X-Gm-Message-State: AOJu0YyUWGvxOVRNNv92Ni9Yz2tbtSfRLWJaRY7fHY9eUBxnpsWnPGPz
	CjxzT7FVKbHKEgb2pg+8L1JXPN0ezq+cn6DgaaweMV7FOyIycXUDf9tobkQQGO5EOd+f48FiYLZ
	Q
X-Gm-Gg: ASbGnct16IC0CQ/mguS5hf1C2PDLyECor088wqlIgqmsiht99JxEPNEofz2bxNubnSr
	W32S7j6dXrU2lF/RET8XQkYGmGkIRLHKEjf1qHwVkYKZsYab8F2QhMOUbOpb1gCgPgC/vAm2kDt
	WG0VmwPLJRNeEjMccS/7CnLwDLOieT7X2xnp/5M3yBovELIN+/61rE4iB0i8fkxj9c2nzMdfcAp
	4LJxfOmkuYA/eo7YQtwpBaOeHIm23mmpa8+TqfXAIgPkFtvOxF1cRjWqe2j0sDK4fBfPCb+hbjI
	Smz9K478urFclXOnp4bN
X-Google-Smtp-Source: AGHT+IHEmdUkio6P+GX5Iq9/dnea3FIPoOVhEdalULIYHqHUYQdzovkF2+nxfP+YFr93gT6ZLPyzcA==
X-Received: by 2002:a17:907:3e02:b0:ab7:6c4a:6a74 with SMTP id a640c23a62f3a-ab789b7c402mr1772480766b.16.1739264501330;
        Tue, 11 Feb 2025 01:01:41 -0800 (PST)
Date: Tue, 11 Feb 2025 10:01:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6sR87FrKcOhgEqX@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>

On Mon, Feb 10, 2025 at 11:16:09PM +0200, Oleksandr Andrushchenko wrote:
> Hello, everybody!
> 
> What is the rationale behind introducing a tool to help with coding style
> verification? I will partially quote Viktor Mitin here [2]:
> 
> "The Xen Project has a coding standard in place, but like many projects, the
> standard is only enforced through peer review. Such mistakes slip through and
> code is imported from other projects which may not follow the same standard. The
> goal would be to come up with a tool that can audit the code base as part of a
> CI loop for code style inconsistencies and potentially provide corrections. This
> tool is to embed as a part of the continuous integration loop."
> 
> I would add that it would better reflect reality to say that Xen's coding style
> is quite incomplete to become a standard and needs some improvement to achieve
> that.
> 
> Here, I would like to provide a bit of history and acknowledge those brave
> individuals who dared and tried to introduce to Xen coding style checking and
> formatting support with clang-format.
> 
> Year 2017, Ishani Chugh.
> ---------------------------------------------------------------------
> This journey began with a request from an Outreachy program member [1].
> Then came the first patches by Ishani Chugh [2]
> Status: *busted*.
> 
> Year 2019, Viktor Mitin
> ---------------------------------------------------------------------
> Then picked up by Viktor Mitin, EPAM's first attempt [3].
> Status: *busted*.
> 
> Year 2020, Anastasiia Lukianenko
> ---------------------------------------------------------------------
> Continued by Anastasiia Lukianenko, EPAM's second attempt [4], [5].
> Some contributions were made to LLVM to make clang-format a better fit for
> Xen [6].
> Xen-summit and presentation [7] and the summary document [8].
> Status: *busted*.
> 
> Year 2023, Luca Fancellu
> ---------------------------------------------------------------------
> Luca restarted it, first ARM attempt [9], [10], [11].
> Status: *busted*.
> 
> That's all for now, but it is still impressive as of 2025.
> 
> So, in my opinion, what were the main issues with all these attempts? There are
> many different views, but I would emphasize the following:
> 
> 1) clang-format doesn't perfectly fit Xen's code style as some rules it applies
> are not liked by the community or it applies rules that Xen's coding style
> doesn't define (those Luca described in his .clang-format for every clang
> option).
> 
> 2) clang-format doesn't work in a "one-option-at-a-time" mode [12]: clang
> maintainers strongly oppose requests to allow turning off all options except
> some. Believe it or not, other maintainers also have strong opinions on what is
> right and what is not for their projects, and this is one area where they will
> not compromise.
> 
> 3) The size of the patch after applying clang-format is huge. Really. Something
> like 9 MB. Even if everyone agrees that the approach is good and we can proceed
> with it, it is highly unlikely anyone will be able to review it. Considering
> that new patches are being added to the upstream during such a review, it may
> also lead to new code style violations or require a new review of that huge
> patch.

I think this approach is difficult.  It would likely introduce a lot
of noise when using `git blame` (I know, it's just one extra jump,
but...), plus would likely break every patch that we currently have
in-flight.

> 4) Which clang-format version should we set as the one used by Xen, so it is
> easy for everyone to use it on their hosts?
> 
> 5) You name it. I think many people in the community can name their points for
> and against clang-format.

What are the parts of our coding style that clang-format cannot
correctly represent?  Could you make a list of what would need to
change in Xen coding style for it to match perfectly what clang-format
will check?

Ideally the first step would be to prepare a patch to adjust the
coding style so it's in line with what clang-format will do.

Is it possible for clang-format to be applied exclusively to newly
added chunks of code, while keeping the surroundings untouched?

Thanks, Roger.

