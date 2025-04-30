Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20701AA510E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 18:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973855.1361887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9rO-0004pv-L6; Wed, 30 Apr 2025 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973855.1361887; Wed, 30 Apr 2025 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9rO-0004oC-ID; Wed, 30 Apr 2025 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 973855;
 Wed, 30 Apr 2025 16:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUHs=XQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uA9rN-0002rq-ET
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 16:00:33 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ef5091f-25dc-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 18:00:32 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso57737675e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 09:00:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5debsm17543986f8f.38.2025.04.30.09.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:00:31 -0700 (PDT)
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
X-Inumbo-ID: 3ef5091f-25dc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746028832; x=1746633632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+vuJKMxrMyX9W9xFKZPwD6p4jB17G4wb6C1vz5GjM+A=;
        b=CGEWHxph0PCZHhVW9cIMZHINOsh7U5vKRuTMFYlX4xPMLU+cq4EICGUfpegbj9AzFy
         4XWYepVqM2/S97Gbksr5f03flGhLEx9UT4jD4cZ8DdhnoG9R4XD2vVhSBagSIMdFMCes
         4iTxFHokOfFHm2AIbhoZU1Q250ZevV/HbZOFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028832; x=1746633632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vuJKMxrMyX9W9xFKZPwD6p4jB17G4wb6C1vz5GjM+A=;
        b=QCHWeDU4V/aSnb86/jTSdzgomcvqOqCNIS5W3bnpJqTuZEimknMw2ZrVx6d1A2BB33
         h0sPiTc7S5TMAaeftaTDecVUoEeNBIkCr859eOp0ggii0IMT6X7rf5b0gUsKZRNTJCPs
         mnDci2CHtaRlhaPAr1ICTkQD/4UybaAdslBqg995vC15Rbqc/+OV4USn7wfLj3v0oX1p
         Qa81bPhfVla2LAK16R/usjYn+7za8o//JjfiiaNPByvp7BnatK/5chnAOpZSs+oXnXir
         KWHlas1T2F6D6A2n5thw5MKgmz3rT0Oe5IqWuYSyDxjX/0uJOgqJscG4G8GJho9nblFj
         fA1w==
X-Forwarded-Encrypted: i=1; AJvYcCWup2y7hYDtf/bycULvAnuSNQdd8Q3FtD7//LW64YToGvSmdHcJnyIvrJ2UK4pXgBipDnHj8sP9O1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtfh8ZiUYv+gaYiaru+pOQt3lmoMeL8NcAmOyxAazNdjSM3JwV
	c6WSEx9OLz/dhBDjTywzzLW6YgKKf+IlBezL5ucopfWs1kduKNNN1Gt14WJ7il4=
X-Gm-Gg: ASbGnctrOrjvQv/xpjvOUIaGuMeRosSVJ+mIcbb4Q/fCtzQvFP7qN5Cb8caQGLrr2yv
	hQcCK7NpfYRHwl5s74W9g4D9PzYpLUvnkzTK5koFkuTQDWlgHEePaV9sKnp8uXJVQDK/2bqJsMF
	ysdMBQ+GchaaE6A+M+S32GFhz853WKC9bvT4dubIitF70R2EGy3Nn5NxhOJAsf/i38klaGD2tBz
	K1q+Ksr4jFH9wWtBLSHRtXVdHb5dhf6P6pARGrINu1QE9EeowOrjyHn/8lVLw7Lw7OHSdWFlvVX
	upYZH98GODwUZ/RH7lWDDZJESWorI1OD2kg9/i8faJlwKEaEwXGQwNoff13L4/czbgLyeT0z/OT
	g3tvPXQ==
X-Google-Smtp-Source: AGHT+IFKzQQGMKKtVSlLRyZcQveTx+dbBWUBkccda8DFrRogQIiup//Bcn0kAC6oeFy5mJ54WjiNbg==
X-Received: by 2002:a05:6000:3109:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3a08ff33057mr2832401f8f.9.1746028832307;
        Wed, 30 Apr 2025 09:00:32 -0700 (PDT)
Message-ID: <192ab217-b7f0-425d-8da4-6270d4494b37@citrix.com>
Date: Wed, 30 Apr 2025 17:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/alternatives: allow replacement code snippets to be
 re-used
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c4a71d96-b255-432e-b148-1daf1b14c77f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c4a71d96-b255-432e-b148-1daf1b14c77f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 2:13 pm, Jan Beulich wrote:
> In a number of cases we use ALTERNATIVE_2 with both replacement insns /
> insn sequences being identical. Avoid emitting the same code twice, and
> instead alias the necessary helper labels to the existing ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

On a random build, the size of .altinstr_replacement drops from 0xe47 to
0xdf8, so not too bad.

While the patch is fine, if we're adjusting the assembly ALTERNATIVE_2,
we should make the same adjustment to the C version, even if there's
nothing to benefit from it immediately.

~Andrew

P.S. it would be even nicer if we would put these in mergeable sections,
but I haven't figured out way to set the mergable unit size, which needs
to be an absolute expression.

