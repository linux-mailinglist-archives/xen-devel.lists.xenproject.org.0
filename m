Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA957943EA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 21:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596838.930895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyXN-0002Dn-90; Wed, 06 Sep 2023 19:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596838.930895; Wed, 06 Sep 2023 19:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyXN-00029k-5n; Wed, 06 Sep 2023 19:50:05 +0000
Received: by outflank-mailman (input) for mailman id 596838;
 Wed, 06 Sep 2023 19:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdyXL-0001pQ-Ig
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 19:50:03 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c603c0-4cee-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 21:50:02 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50098cc8967so241109e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 12:50:02 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n7-20020ac24907000000b004fe09e6d1e7sm2838655lfi.110.2023.09.06.12.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:50:01 -0700 (PDT)
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
X-Inumbo-ID: 91c603c0-4cee-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694029802; x=1694634602; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L7IYImw336YE/oOppUzmqhDhC/LiV2wEiYOf+uT5HtA=;
        b=YaY7cYfzQ3paNsTqZegdXkNwyOOlqqexB+q0WUgq/x0C1pBJGKSZQH5zyoiat04Y1a
         HtlizOapovGp77Eup654UCYYyZkICSZT220echzpi735IPWt2sxDUlDX6UuBfdo+188n
         4DYIqg7WGJ0/Pqpv9XQFgjkPr7OURa7pEIPbkDuykDWmDhCPX3SxcYQkDP4q4VcB5KTL
         I7L5i7TAzAelqaCn1LK0PPNiFEvJcAUGePKq6/TZPmCebygam/QQYLAPGKmZfkZzQB7X
         1jo6C5C+HhQffczbs1N2oF133xz/o1L+o/TYClGYRl9GXOQcjvh/BNH+6aQtis1y1/uW
         VKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694029802; x=1694634602;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7IYImw336YE/oOppUzmqhDhC/LiV2wEiYOf+uT5HtA=;
        b=UuTtZrCrVwMUEAdQydr6Z2K1h27g86+BMIDTgAsnH/yq5reCeRgfWFT2HeIwc7XPjO
         eSWVazFfyDMu5qzVlfNYGnmhZwjOzybl9iQadof0/vAKGhDCjOTgBIGvQlr7LGrSYGMw
         pdg49NdJd7nwXu1iGyXBy8zRb+5N54Szfmw+yNGXqMeYt5ryt2yHCfpb3KmuC9wwor1v
         bJqoB/B7C7BEoesoMbVp0UllwKnzI6tKARkdh+zDYp/nkfD+6i937x6l8YOZH8jgDMld
         OhkEBcMHaYifCMIWaMSjg7Gt9RCpzkakVXm/E+F2xxx/3fKRVU6XVrAGw7OgxQbg0NKq
         C5NA==
X-Gm-Message-State: AOJu0Yx+bdfCMRbcOIkJn+skRaTpLzDAJXF/kHTkcsN2Xclqqt4NLk3c
	QaWH9YsQSRxNcbrnCpDORDZNbNKmjAs=
X-Google-Smtp-Source: AGHT+IGwC8xiy6TrToRvE/XizsAwuSSdPsTJ/62dEGQq29uxLSx0iu5vPqaV8pUMdCk08j8b9OoUew==
X-Received: by 2002:ac2:58f3:0:b0:501:bd16:4d76 with SMTP id v19-20020ac258f3000000b00501bd164d76mr2694253lfo.16.1694029801789;
        Wed, 06 Sep 2023 12:50:01 -0700 (PDT)
Message-ID: <f6a7caf3057fd91d983f59b385f6a8c5a2eca501.camel@gmail.com>
Subject: Re: [PATCH v5 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Wed, 06 Sep 2023 22:50:00 +0300
In-Reply-To: <f5a959bf4a28f2c77e7330b4c441e2628acfa7d4.1694024884.git.oleksii.kurochko@gmail.com>
References: <cover.1694024884.git.oleksii.kurochko@gmail.com>
	 <f5a959bf4a28f2c77e7330b4c441e2628acfa7d4.1694024884.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi all,

Missed the comment (https://lore.kernel.org/xen-
devel/a526c0b285d94550e59a8968786b28d266afba58.camel@gmail.com/T/#m99a4
dc8280439e84021c4e0546dc9ff539a60191 ) of Anthony so I'll sent a new
one patch series tomorrow.

Sorry for inconvenience.

~ Oleksii

