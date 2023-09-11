Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E865679A8A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599503.934948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfi0G-0000zZ-1h; Mon, 11 Sep 2023 14:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599503.934948; Mon, 11 Sep 2023 14:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfi0F-0000wI-VC; Mon, 11 Sep 2023 14:35:03 +0000
Received: by outflank-mailman (input) for mailman id 599503;
 Mon, 11 Sep 2023 14:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zuN=E3=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qfi0F-0000wB-5i
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:35:03 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 639b69ad-50b0-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 16:35:01 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2be5e2a3c86so67068921fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 07:35:01 -0700 (PDT)
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
X-Inumbo-ID: 639b69ad-50b0-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694442900; x=1695047700; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ku2KOBhqYkhO6B029bHAAgjP3gm0xf2OjLf1A/4aqqQ=;
        b=UIZw7mF/CHPl+JMtHtMuSLnqM8RAcesicKCLWAMRES/cX65DNcIEIixBmYEY8AR+cw
         NQvmHqwjmSkEOrtAktochDXb1LBXWp6Prw8AMmfkVd0V4tnwh4YuV7CyCL+7B9qPizsf
         O3sFqrFVWcbDwEcFZRAy+optuuQmsmm1tlN08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694442900; x=1695047700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ku2KOBhqYkhO6B029bHAAgjP3gm0xf2OjLf1A/4aqqQ=;
        b=dDnOGbCJIshWulGZvu4pfIcC1eGKpPtuQYitLFoh1KNjORUkVQHV75r7keIL0WKd2K
         ctOc2LM81ZVRrPrP+AxmtiNLNPDnzSVLDjXr5nBDKuG3/R+RdTC3FgHuzwQKQrvLXi+o
         XzkHDBGBSGGhyWV7LRDWoo7ODjLNnpezeG4ekgjKspRWAbSCOXYbrCTWQ5jTfp8JqWpH
         86dtbCj5GhDlpGgXUW1Ebl7grJgEcFG44qgQ8ITOoLMn6RE1G5XkwxZOChZHMfkuKU2Q
         qd9ybn9oVoqcBoTTbkufGFr953zrvdX2bWZncQVix6KF0ac9H9F/RwOarJuujD14d82d
         hIug==
X-Gm-Message-State: AOJu0YzVwRKQOLJhq94LMC+Rfa9JLtwT74uotAIuFWim8FCcZ7JiqDqX
	IfrfR+Hvc5mldVxt3mo36BaTwECAjw4KSS9HaR6FyaBSIhlok+skVws=
X-Google-Smtp-Source: AGHT+IHVVhVx9neiqXHCtF6TAGP05x4jWhu95fXrXM/yFopPDqtQ7FrnX1NyuBqUjjSFlzVglCPFaQq7XCHtNMnAY4A=
X-Received: by 2002:a2e:800f:0:b0:2b9:601d:2c0 with SMTP id
 j15-20020a2e800f000000b002b9601d02c0mr3108579ljg.25.1694442900627; Mon, 11
 Sep 2023 07:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <74aa0f95-e059-f6a4-b085-03c7e4b2fceb@suse.com>
In-Reply-To: <74aa0f95-e059-f6a4-b085-03c7e4b2fceb@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 11 Sep 2023 15:34:49 +0100
Message-ID: <CA+zSX=acfj1E2-mzPFVUJSkWKro71S-dcUj1b4LKz0Aj_icbbQ@mail.gmail.com>
Subject: Re: [PATCH] cmdline: move irq-max-guests doc entry
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2023 at 3:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> ... to adhere to intended sorting.
>
> Fixes: e373bc1bdc59 ("x86/IRQ: make max number of guests for a shared IRQ=
 configurable")

This seems a bit strong, but in any case...

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

