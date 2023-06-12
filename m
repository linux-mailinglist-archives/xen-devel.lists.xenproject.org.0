Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B3172C4D5
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 14:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547135.854375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8gxh-0004V8-1P; Mon, 12 Jun 2023 12:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547135.854375; Mon, 12 Jun 2023 12:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8gxg-0004Rn-UE; Mon, 12 Jun 2023 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 547135;
 Mon, 12 Jun 2023 12:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oj3S=CA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q8gxf-0004Rh-ID
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 12:47:55 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59553b6e-091f-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 14:47:54 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so5186204e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 05:47:54 -0700 (PDT)
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
X-Inumbo-ID: 59553b6e-091f-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686574074; x=1689166074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jlwpx67/GeYfFh9oneqzHY/viw5PwbovhEfwiRyUpJw=;
        b=RfPaDcf1Rco5b0+NmwJEnIUvhopJD2aQz28B5WpurrO/e15YNvQkZoLr7p/rTgK2t/
         YmHobqo6nxTTmTKrjcUYAIjeVXMspQvQR9qtdVM/Ngs0wQpAtqdc5ykNk2gnSLgMUMQ+
         0oGOWj7rIiyWv7irc0WJU11pRzF2RveVZ3YaFSvC35T5LJAw5quA7kYWFZ4MCPspql5E
         xvSahqB3TAqadS3D0x9rWclOL/+Cv4lq0bw1oa51ShExTfiWRn762MwsKIW5QyLZOxKz
         Cs6q+fCFF8UEur7IuIURilv28b03TV57e5K07PiL3B89wLF+jZRsghsD5yWEO7PD02s0
         G99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574074; x=1689166074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jlwpx67/GeYfFh9oneqzHY/viw5PwbovhEfwiRyUpJw=;
        b=hun1P9KeC47tbwlrXtoP3alX+lU4hTE658+Sp/4YRqkDo3zdqdEQREuRQWtpR0t0l5
         Ag7NO5wslA66liMLyx6EJBv0oFKtxF87zPgbrankKFQCX41r2u6qcVMMEi5fc9vs0YUQ
         zZr/RtieddngGQK1ZNo1MFbNNAr/JYbcRDjxhLOEm6xTxVNUzXmgMH/nO4fMcv/T0ZUV
         FDnDgrW44BDTyHOvszD9S0TXfClh1mtr2SsxciIASC76QJ/rwzB9kGwqq/9w7NXqtfEI
         j/mc1zw9vbEGG/VahB9OkgLpwPU3P4fA9N2pQ7yJ0Jy6Am8YrY7/L3jFdoZGHwh9BBqt
         eXAA==
X-Gm-Message-State: AC+VfDzXgpiaTk14NJE8/7zff7KY6RbvqrFDa25Ft0BhlnF8Mi2lJSkA
	eoEqhXKvrA4rDIN439YTAJ8yMlBtBZjspTjLMYp2Bs9D
X-Google-Smtp-Source: ACHHUZ6IxhJ9aCoNCVnrx9KABZfRHR2+1UYDorMIb5jlNPd2TeI5u671xPgososOTLpD8bxyv4YnOov9wo7OIbkhXao=
X-Received: by 2002:a19:9101:0:b0:4f6:2b29:b446 with SMTP id
 t1-20020a199101000000b004f62b29b446mr4299156lfd.21.1686574073858; Mon, 12 Jun
 2023 05:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com> <fc7b72ce-2426-4452-bff6-f98b07b5a41c@suse.com>
In-Reply-To: <fc7b72ce-2426-4452-bff6-f98b07b5a41c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 12 Jun 2023 08:47:41 -0400
Message-ID: <CAKf6xptx4hNCZm6T371VJopUS+4=Fvp2Wd1m+16mAH5B0UHKYA@mail.gmail.com>
Subject: Re: [PATCH 1/5] xen-mfndump: drop dead assignment to "page" from lookup_pte_func()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 7:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> The variable isn't used past the loop, and its value also isn't
> meaningful across iterations. Reduce its scope to make this more
> obvious.
>
> Coverity ID: 1532310
> Fixes: ae763e422430 ("tools/misc: introduce xen-mfndump")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

