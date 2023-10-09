Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3A7BD907
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 12:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614267.955271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpntB-0007VY-JE; Mon, 09 Oct 2023 10:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614267.955271; Mon, 09 Oct 2023 10:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpntB-0007Sy-GU; Mon, 09 Oct 2023 10:53:29 +0000
Received: by outflank-mailman (input) for mailman id 614267;
 Mon, 09 Oct 2023 10:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkxv=FX=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qpnt9-0007RR-PJ
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 10:53:27 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 119e8d93-6692-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 12:53:25 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-690b7cb71aeso3178806b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 03:53:25 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 g2-20020a63ad02000000b00584d035c08asm8018705pgf.24.2023.10.09.03.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 03:53:22 -0700 (PDT)
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
X-Inumbo-ID: 119e8d93-6692-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696848803; x=1697453603; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjpz99pKtSDqY7Lxx2Kmyl5doNN9PYMFGMw6h35LBMc=;
        b=XabKcBG9pI5KTKxzn8XrtcXEbyqcsGYbhsc1u1P0VmdxTQ6/CUmMJFrGvszn7LdD5P
         mFmreEN9TmDjjxoFpIZZbSvIBjVPq73urftLZ814lD7oVV8HKJSO7iq/spNLVQuWTj2i
         piiMSuenqzv5aP+lSYy313mpSVtu1uA48wj/eIi6yHU8fGuJLXcJe81I61hMbbtVO358
         gee15zsS+TUfXX4CkFS4m552tAEKBsMULX79W2tcGD2h4aDV1pw/8fpvr/6e3ymkoHvZ
         XRylYXIjezZ+aJTKsc+QTbhESwomhBlRR4o92Vek/yfO+Q/gvY7OsliN+GBHkZId0FA5
         mklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696848803; x=1697453603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjpz99pKtSDqY7Lxx2Kmyl5doNN9PYMFGMw6h35LBMc=;
        b=FbmRh3/jlILm5HhGt4kK/5ortlprZ1XxTGzuFPAiuZ0wkYbEzN+bL3vnoABvkCju+D
         uWZLXL6NgCSJZIQxSsLDTMBmnQALZnH33TlfKiT5GdFAHxkltHweaOVAVcCcGqoN1znT
         9p9kiBmkQTjrqrxuaDAP9cHZYM3mBZ8+B9rst0EjQVwZdpcK3SUA4vREMIQdmKHf22UT
         wOqtkbQFEBrKBmRzMf+piKkKuCMJMeZ42o4rDXY0dJjzmFFgACayA1wuQ5ROnW9mGdeV
         nkpRZFra44/G8uz/0l2iN+XRqOSFtCYv/Ivo6amb/8Yzp2Tlp5YbrynIlqZvH/sLheY8
         23hA==
X-Gm-Message-State: AOJu0Yx7zj0J2sRsVcITiplfnUZ3fbPzFnszy6b4ww8kGwVbx2vvfzuu
	4z5XZ+CT5SPOsPeBpMCnx/o3Rg==
X-Google-Smtp-Source: AGHT+IEVfOR4NoAnaSIGgCYioI/Xey27e7ZEqzjGtmASnTwitAxG2F2Q7OoKyuVPHInKVZV5l5+DIQ==
X-Received: by 2002:a05:6a00:cd4:b0:68f:c1e0:a2c4 with SMTP id b20-20020a056a000cd400b0068fc1e0a2c4mr17399432pfv.3.1696848803584;
        Mon, 09 Oct 2023 03:53:23 -0700 (PDT)
Date: Mon, 9 Oct 2023 16:23:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: privcmd: Add support for ioeventfd
Message-ID: <20231009105320.scljokj4ies2s5r4@vireshk-i7>
References: <cover.1693311370.git.viresh.kumar@linaro.org>
 <52b07a3861a34fb0deb6251bae8bd885815c6944.1693311370.git.viresh.kumar@linaro.org>
 <fb79fa9a-e91c-4bb7-8aee-c384b99df953@suse.com>
 <20231005063231.vqwhfnlc64phwmto@vireshk-i7>
 <877cnwqg27.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cnwqg27.fsf@linaro.org>

On 09-10-23, 10:40, Alex Bennée wrote:
> I thought generally sync points act as full barriers. Doing a bunch of
> grepping I think ends at:
> 
>   static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
>   {
>           unsigned long curr = (unsigned long)current;
> 
>           return atomic_long_try_cmpxchg_release(&lock->owner, &curr, 0UL);
>   }
> 
> so you should already have completed your writes by that point.

I am not sure if depending on such indirect mechanisms to implement
barriers for you is a good idea.

The situation here probably requires explicit barriers to make sure it
doesn't break in future ?

-- 
viresh

