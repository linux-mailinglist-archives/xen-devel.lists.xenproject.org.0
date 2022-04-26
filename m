Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F66D51094D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 21:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314135.532076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRDS-0001Wv-PP; Tue, 26 Apr 2022 19:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314135.532076; Tue, 26 Apr 2022 19:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRDS-0001U6-MV; Tue, 26 Apr 2022 19:51:18 +0000
Received: by outflank-mailman (input) for mailman id 314135;
 Tue, 26 Apr 2022 19:51:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckxI=VE=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1njRDR-0001Ty-VQ
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 19:51:18 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bc0209c-c59a-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 21:51:17 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id bg9so16896906pgb.9
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 12:51:16 -0700 (PDT)
Received: from [192.168.0.18] ([118.33.58.98])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a63b510000000b00398d8b19bbfsm13720448pge.23.2022.04.26.12.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 12:51:15 -0700 (PDT)
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
X-Inumbo-ID: 3bc0209c-c59a-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references:cc
         :from:in-reply-to:content-transfer-encoding;
        bh=fU0UOb7Z4Jp4qPhNb2hjMnu4rnkA/7cO1b1V5zl7bE0=;
        b=i8lUw+XadwiyCJwS2QOtYSjK8igaaGd0k6XljQc4RrDTHDGM8VIV+cV4DjlGJouMDY
         WvmJLQIv4wJKpYS0q+U5nvh5Dsww0fNnJQtnNAbRxY8mdYJSItro7mzMPcRqG7+cMlNY
         bCb5SX3FzS/VNEAEqlyuqZhJHPa8IzoI0NKhtDGY+pjP13PAhKtL8Qy8hJyTa29Z9DoH
         PgVUHegZGeZA+y/iiujyffi0W7M2QrR1K5PkwDuRyghuK6xCfi/gfqiYnjroe+Vh420A
         ipYT2tE2pu9npouqaC5l38fyEiVBjYatWFpik4G5oLnBvmhTz0+B0T5ruNqltdbMuylZ
         7zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:cc:from:in-reply-to:content-transfer-encoding;
        bh=fU0UOb7Z4Jp4qPhNb2hjMnu4rnkA/7cO1b1V5zl7bE0=;
        b=BmcinyEzDjE5G4mpY0FadAIClD43mm8PyaOxrHstk3p/TA/7L9tRl4yc1Kx7JdQLwQ
         gkOnIAtgP8ShVN6iXjn5wGpra+YcozbUcBkdKS4vTBVvzOM4lCPoi8CXuQlgWjLlg+ue
         0Z6yvWb9yu2OYHeQaG0Jfhj3qnperqrBd7PvEQ7y7B3rhEAq59yilaRw0DtvXg1Hxc2D
         9Mzt7G8FSlY7Lm46V1exfCE7jDIQP1tRQfBukUmhI+7nAup9Ql9E1yYqnVJVzgYEM/zT
         +rD5UKrgs1aRzH4XHxkIceO7R7SjW5QyqXNrUBI0zyXTKr1jWmViEw7GuvmOcOupXyWz
         D8ww==
X-Gm-Message-State: AOAM530JU5i35OfSi5DzCzOVLzSOiLvm/PYS0mWfJ1P2NQHssLcvjv2Z
	Jto2cU54UhkcaqTB2wzDNR2+/i3tL5JuTgpM
X-Google-Smtp-Source: ABdhPJxUkew1k0H1MehvqYcLrXPgZ7SDsjP/PbmlHXvTS+Q69bkmtrbwgemDAi8mwEkGfnXq436MIA==
X-Received: by 2002:a63:6ac9:0:b0:3bc:321e:6d56 with SMTP id f192-20020a636ac9000000b003bc321e6d56mr684654pgc.490.1651002675319;
        Tue, 26 Apr 2022 12:51:15 -0700 (PDT)
Message-ID: <cc689445-20b3-7648-e447-ac0b2a61d0ea@gmail.com>
Date: Wed, 27 Apr 2022 04:51:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: p2m_set_entry reuse mask variables
To: Julien Grall <julien@xen.org>
References: <20220426154904.GA11482@DESKTOP-NK4TH6S.localdomain>
 <0028b769-ff2b-cadd-d85c-ec7885304b73@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, austindh.kim@gmail.com,
 xen-devel@lists.xenproject.org
From: Paran Lee <p4ranlee@gmail.com>
In-Reply-To: <0028b769-ff2b-cadd-d85c-ec7885304b73@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thansk!

> It is common to add a changelog after "---". This helps the reviewer to
> know what changed in your patch.

I think this experience will be very helpful for the next more
meaningful patch.

>
> "1UL << order" refers to the number of pages and not a mask. So I don't
> think re-using the local variable 'mask' is a good idea because the code
> is a lot more confusing.

I agree too.

> Instead, I think your other patch is the way to go with a small tweak to
> use 1UL (which BTW should be mentioned in the commit message).
>
> Either Stefano or I can deal with the change on commit.

Thank you so much for your detailed patch review.

BR
Paran Lee

