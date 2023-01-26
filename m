Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FF67C456
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 06:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484781.751575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuwz-0006Yo-RS; Thu, 26 Jan 2023 05:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484781.751575; Thu, 26 Jan 2023 05:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuwz-0006WL-Oa; Thu, 26 Jan 2023 05:37:29 +0000
Received: by outflank-mailman (input) for mailman id 484781;
 Thu, 26 Jan 2023 05:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqlM=5X=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1pKusc-0006HV-2t
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 05:32:58 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e30d2913-9d3a-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 06:32:57 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-16332831ed0so1183717fac.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 21:32:57 -0800 (PST)
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
X-Inumbo-ID: e30d2913-9d3a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJAQgBRuwpXxWSXisMFNNhhlbaGmkLss4fzFxsPQzfU=;
        b=ZncYNnnhEqhhPst6qVkgMxts8Sll+Kn9+2JRpLXBY3R65P7i30YnBafkiw3FrMNrjI
         b5eowmqak/1Hr3HrdXfZIHLT0in8n3XmdGvzvLOtcZcZq8UVIqfmr3VhPyM94AXMIgzM
         VrGS1D0FF6sNcpqT9z/M1kvMJk/m1H7U2aEQ7s8G6xwfVzzWEqA9rVQEADyJkIsqPP+2
         ZIr9LRKHgWyIaY5AQ9JB+e3jy22GstNGyDyuZatwufcnX/1qQQWegKRUeV91Qp0mqs+z
         Tn+5/Ezk8sMmWltYWN48rWaoKlvGq3qGTW2Zau5SAJ2/ImOxmTCu2zNRMgN/w1Vwsca1
         5iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJAQgBRuwpXxWSXisMFNNhhlbaGmkLss4fzFxsPQzfU=;
        b=IlK2J+LXEhGcJwIo3Z8PSM61D9A3J9K+AaK17Gch+szPK1Ppo6zAcEGgzTrJZDoLkG
         kt8WtYddzps7XU7wiTbsJPkRuZiuE6Dw8r0jjNq5nCVBciIzqsV0BhiHy+lpaUkSPzq+
         Rq/L5zecR+XpgVB5rHI6c8NVBzKcMzEYTBHmiTUfWJT7KCRjOOInOBTC5ikOEW3V+Fyz
         QCT/xZfMV4a3mZvMptYMUekT5N83E9bdOqanSSo8BBcPPk5lkZYV6fcVDUQfyNOZLu0T
         acgGbHSlXJTH6O+QdT9qrN1ZtxJYz9igWHQybsKISEFpXW02QF9Iv+GFGcwEa9+YFgmf
         /iXg==
X-Gm-Message-State: AO0yUKWVzkRaDtuv1o8k/gNQ/IZj9g4PWtnO/SKq02SaVVxA2u+cY212
	B1Dd/bus1M2TlD9xuicORxBBH281XWqcKyTkh3M=
X-Google-Smtp-Source: AK7set+WOpkr7U5MlgMG9N0kqnSZnb4s8gS05hCP8kcZmvzBkPLTQWkfRVn8IbmO+1hkpeSQe1aYQ+dCrZ4xa40gl2c=
X-Received: by 2002:a05:6871:829:b0:163:2d87:3a90 with SMTP id
 q41-20020a056871082900b001632d873a90mr413948oap.1.1674711175744; Wed, 25 Jan
 2023 21:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20230125085407.7144-1-vikram.garhwal@amd.com> <20230125085407.7144-8-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2301251406170.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2301251406170.1978264@ubuntu-linux-20-04-desktop>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 26 Jan 2023 05:32:44 +0000
Message-ID: <CAHt6W4di4kUQxrXtE9Y8Nrv-H_r0OdhMBk7fo9CwDBDUaDkhnw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v4 07/10] hw/xen/xen-hvm-common: Use g_new and error_setg_errno
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
	xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
	alex.bennee@linaro.org, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 25 gen 2023 alle ore 22:07 Stefano Stabellini
<sstabellini@kernel.org> ha scritto:
>
> On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> > Replace g_malloc with g_new and perror with error_setg_errno.
> >

error_setg_errno -> error_report ?

Also in the title

> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Frediano

