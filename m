Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D8AB453C
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982133.1368682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZFY-0005sg-I0; Mon, 12 May 2025 19:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982133.1368682; Mon, 12 May 2025 19:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZFY-0005qw-Es; Mon, 12 May 2025 19:55:44 +0000
Received: by outflank-mailman (input) for mailman id 982133;
 Mon, 12 May 2025 19:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZFW-0005qp-Rc
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:55:42 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1476a591-2f6b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:55:40 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22fb6eda241so49893185ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:55:40 -0700 (PDT)
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
X-Inumbo-ID: 1476a591-2f6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079739; x=1747684539; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC6QgwCA+pWMQ2oM+iySTdBksZruENYT9g05czYu/tk=;
        b=cU8KP4nt6GE4UTlmqMAOWEf/85hcYV5SYwQ3nH05FCumiqDyeQ2j2jtw4u+BybH/4T
         rm4o6lplUF0CqfUqV7o/RIBNDq+M67uq4JozD2npurJL2es6DgqSVD0IfXFpjfWHnELz
         v4YSqf7jF4CbJVUtJlFli1TZ8h8zomnDc0yDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079739; x=1747684539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC6QgwCA+pWMQ2oM+iySTdBksZruENYT9g05czYu/tk=;
        b=sLk1I+ySRocJ8xCAaxq0Tr5ICtcjz1gk1ZoWNmZdMjpucC5uYRAto8SCYv/dDB1Nma
         y+OjulBZO8+j07E58CMjFMVJ9uAUHts3XFXF/zwKfT9QuciatyceE6vnc5Pq1ocaaW/Y
         By8kOiGJn+mdTgfCraV21yIR2/nNR4y7U+kyg5J03SaApe3Adkg4BUotOiAHBQKknKjO
         A41HvYZ4RQHtuFHSJDl4v45w3xQHj2zkVtDxwRS9DxmFfXFrkAP44wrgLN9EqitmVMqR
         cRHFUje7tmpXEjBQ7DzRoduKj2gv3/xWt5+5eLuWodMAJkx/0zv+0uS7evOUxkfOh6Zv
         1epA==
X-Gm-Message-State: AOJu0Yyw/Vvo6gzWPYS+G18AW/kcB5l5MYjz/h/B2gTAKd6AL5GEWHdV
	z7hCP0PSmuIZJLm38G0UfYaquPgsWyAs33/d4Z6ywl3fTPYUFA/2V82F13E7iLuwLTWBH4TPpym
	QujPre7GsQMcBAUI9ldPDgJSgro8AuI49zuLHsEhFJzYBAvlTOKg=
X-Gm-Gg: ASbGncubMcWls8vOKvpXC99qlMkF2lRdAFp3gtQ0yo5BsTa/ukcdFnujuX+YP7/WiGP
	g+MN8mfB6MwubR8dtg1859d/bSzX4pf5LWAmQ3P9+plfLn26PQj5Q7DEfcZlo+1TzQ8EpecN0uv
	O684lP3Yp2cgl/9xSE18UJoMzcBn3+vcMDVtesDsg9sQ==
X-Google-Smtp-Source: AGHT+IFKl9T9y1sJD966XrUuSqDHOkY2ht9zjfm1rUALC6ttmFO31L1VKgFTJe7J+UrqSdoGTi3Gch405WFqExqIA+0=
X-Received: by 2002:a17:902:e94d:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22fc91c2cdcmr239387365ad.48.1747079739267; Mon, 12 May 2025
 12:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162347.1676357-1-kevin.lampis@cloud.com>
 <20250512090210.1718623-1-kevin.lampis@cloud.com> <3e35eeb3-c4f6-423e-9185-5d98b6d1d060@vates.tech>
In-Reply-To: <3e35eeb3-c4f6-423e-9185-5d98b6d1d060@vates.tech>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Mon, 12 May 2025 20:55:27 +0100
X-Gm-Features: AX0GCFvsPgEmEPDSFsBKkCo8Zwl-tzhdXmiTpV5O3pRiJDCJUbcj7yuc3c25qdA
Message-ID: <CAHaoHxa0Hf2_rTaWOYd+rznBCgZ94gMsZeLX2sxvizgTVF64Lw@mail.gmail.com>
Subject: Re: [PATCH 4/4] Disallow most command-line options when lockdown mode
 is enabled
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:48=E2=80=AFPM Teddy Astie <teddy.astie@vates.tec=
h> wrote:
>
>What makes max_cstate / dom0-max-vcpus / dom0-mem specifically unsafe ?

These arguments are all allowed. The *_secure_param macros mean the argumen=
t is
safe for lockdown mode.

Making PCI passthrough safe for secure boot will be handled in a
different patch.

