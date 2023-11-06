Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012347E2034
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627937.978868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxyx-0007Sa-W6; Mon, 06 Nov 2023 11:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627937.978868; Mon, 06 Nov 2023 11:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxyx-0007PZ-TJ; Mon, 06 Nov 2023 11:41:27 +0000
Received: by outflank-mailman (input) for mailman id 627937;
 Mon, 06 Nov 2023 11:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wfGl=GT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qzxyw-0007PS-U5
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:41:26 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a45f61d-7c99-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 12:41:25 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507adc3381cso5528584e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 03:41:25 -0800 (PST)
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
X-Inumbo-ID: 6a45f61d-7c99-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699270884; x=1699875684; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Exb8z0n5FTbsiAJyh7PIbKX/eT+wH30KoslYnsrsVIE=;
        b=Bgwjj481Bnr+LWYsf+ahoqEuxi6sthTpKf7EV7hSktNqYWzcGmyDvs2oIMt78wGFod
         fKEnA0EuBs0bHBK5x4L61PzqirP2T0dODOcWvTTNtPRmESI778uDfVzEZ8s6sR6Ke6tQ
         kd9k6xBOITMisbJgDbV3chBusBneJRD+cOtCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270884; x=1699875684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Exb8z0n5FTbsiAJyh7PIbKX/eT+wH30KoslYnsrsVIE=;
        b=d06hGf3Um75csiLPsfSPf+6/n82WGLHNqcRJv6q2YFKY7LgetlHqpKBfe410nVYUwi
         ptn3d1zVrnwEpJHFoo7lAiQzHJbb2n4Zv1lnSwKooaH/21T0y3VcBrzLxZ/alCO/pp5U
         QWiAMnb0r/7S4D0U+IcGfztgA9GMlZ+FwPAyDQx3IdOFHFi0U3Q4BukdowUhSwYWwp9e
         kUgY8XmCmtV8+HxQdt0kFsBJKJ4Xlunzyv1F6JZqJKQpETXgi7X1I3e128X5ZAmgXoS8
         SN/FKElhA+6Z5qndCMIlpLFbCDwpUiV0TsCnMTpUA8Rv7DOcxvb+o72k7TtnWGpw8Khm
         4cSw==
X-Gm-Message-State: AOJu0YywSjQhBqtkU69bQt2w5FuIUkFWV9nlkwSqVffQMLEQR7yNKesL
	XWcc4ZeJGxknmBytjmaIRmZq/yB2pJVO8QxHRMQtMw==
X-Google-Smtp-Source: AGHT+IH65iS8OhPawiyOxTMZ82yfCa9TnErS44hKE71ht1HnFndsto80jp1u3FmAGn5iDkv3L1AqfH/gP1tgOKmvBls=
X-Received: by 2002:a05:6512:b8d:b0:509:47e1:6ebe with SMTP id
 b13-20020a0565120b8d00b0050947e16ebemr11301595lfv.14.1699270884657; Mon, 06
 Nov 2023 03:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20231103194551.64448-1-jandryuk@gmail.com> <20231103194551.64448-3-jandryuk@gmail.com>
In-Reply-To: <20231103194551.64448-3-jandryuk@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 6 Nov 2023 11:41:13 +0000
Message-ID: <CA+zSX=YUkiwkNV_p1SsAYbyd2q76VfwWqi_mBoCwaVpca-GfXQ@mail.gmail.com>
Subject: Re: [PATCH for-4.18 2/2] golang: Fix bindings after XSA-443
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 7:46=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com> w=
rote:
>
> The new bootloader_restrict and bootloader_user fields in the libxl idl
> change the bindings.  Update them.
>
> Fixes: 1f762642d2ca ("libxl: add support for running bootloader in restri=
cted mode")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

