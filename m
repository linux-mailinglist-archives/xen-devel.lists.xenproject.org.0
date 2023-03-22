Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7D6C4AA4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513405.794331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexeK-0000cZ-1q; Wed, 22 Mar 2023 12:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513405.794331; Wed, 22 Mar 2023 12:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexeJ-0000aA-UU; Wed, 22 Mar 2023 12:33:03 +0000
Received: by outflank-mailman (input) for mailman id 513405;
 Wed, 22 Mar 2023 12:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYju=7O=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pexeI-0000Zy-Ij
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:33:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aea2d80c-c8ad-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:33:00 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id eg48so72140877edb.13
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 05:33:00 -0700 (PDT)
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
X-Inumbo-ID: aea2d80c-c8ad-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679488380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYNZ0o56MaBRKFMa+7+AL324mZQ42j3bUQYxzGrjiPY=;
        b=FPzlN4oybsb0O9eia3U4Ou+2v5UeS7aSLMzWxaCvMsYvhJ/98Xq4q+IFcSpc36C7XS
         ZpfCPkgVo2VAszZflbtLLcPexPcvP3ygFbp1vKBuSZ86KqA4i+fY1CWDQV1L1+WDoeDq
         /tx1lXSLCiwqDACMI2oZIFNJoHjqQErnX4TmYHGdObLg2eVJyMvkNYyKwKuP0e3Lr/gu
         REq4t9VfKniPMK4YTtnNDdifX22LIJTD6Q4DQvwNinLQ0LlSYj8HMUTuywZsCxqkzubI
         93spUpmDZrCTIB4K1/bT8jr9XstVEUs4uS5rCS6gJAd6OM33f3vXlj7bGrrr16jTuBje
         6vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYNZ0o56MaBRKFMa+7+AL324mZQ42j3bUQYxzGrjiPY=;
        b=BuZPcN9vdHluqsT+hN7TIapEE5sTdKtr7KY0/FjsfkciN+Ke8SwJPv+F9XDyMNAHRD
         rvTQxSJ+pgidqJ5KTX1knPCjEUm/9UyAnyRwEpPGcyGkJqX4dRb7s4gvj8D+DwhvKUB1
         qDx8ASRwZutG2HYJ+PHFU33e8+lJESzKdCtvfz8Hw5AjzgujLdM8PM0ib7Xnhn3VJYLa
         PLSDXEehHoszc2LbxpWKuomBMo2t+fCRZoenYTMEnOGKZbwiwNeWpg8xh+H57kvkBViU
         UsCm4BohvBtnz0Tz1l0jcDANB4NgiNItMuALacoA40DMr8gmUuyeOQca4F8jP4fUO2Rw
         3PFw==
X-Gm-Message-State: AO0yUKUAJibPX6/NYu/hwyFMIrztf9VgVlAEJxpP5nUEuxoV2QucspFq
	s2e3QDT5bDpVpe9OqtxsHTkE4sRHRsmdaHcxmfBbpMKY
X-Google-Smtp-Source: AK7set/ehmfNQblLaYDHz200fOfRvWfhmLBK+pcD8qwNi6IfScertpt9oYYcopltuGKSQ7qr3EG6+a3gmKv6gF8FiWI=
X-Received: by 2002:a50:9f45:0:b0:4fa:6fdd:62dd with SMTP id
 b63-20020a509f45000000b004fa6fdd62ddmr3505521edf.7.1679488380151; Wed, 22 Mar
 2023 05:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230322073453.7853-1-jgross@suse.com> <20230322073453.7853-4-jgross@suse.com>
In-Reply-To: <20230322073453.7853-4-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Mar 2023 08:32:48 -0400
Message-ID: <CAKf6xpuswTjP2ksn243VHXzv-b50Tq7W7pnoYeS+9ZKtbUPPoQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tools/xl: rework p9 config parsing
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 3:35=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Rework the config parsing of a p9 device to use the
> split_string_into_pair() function instead of open coding it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

