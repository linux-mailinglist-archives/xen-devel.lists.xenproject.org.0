Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD587A785
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:26:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692398.1079482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNgO-00055n-4f; Wed, 13 Mar 2024 12:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692398.1079482; Wed, 13 Mar 2024 12:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNgO-00052t-1w; Wed, 13 Mar 2024 12:26:08 +0000
Received: by outflank-mailman (input) for mailman id 692398;
 Wed, 13 Mar 2024 12:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkNgM-00052f-FY
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:26:06 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc2edde8-e134-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 13:26:05 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-221e1910c3bso2018342fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:26:05 -0700 (PDT)
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
X-Inumbo-ID: dc2edde8-e134-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710332764; x=1710937564; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9JCDC61iNKYNQIve/QaGBY5AdoE81HbyRknOAkalEo=;
        b=lyY2Ofn94lTGmZDSc8QEvqlV4qfLezeMM5ByF5aebBcGxtG2vHww6K0fdOr1Ow/Ivt
         9Q41YwLqMCWEzbbweXJKdoEYRvRyBDDN6X0V1wpusu+v09IXOa3jdg5CRYutt1/1hGoe
         HEyz+sup1OuudPAzkDJWUWE9ZmFdHaH0SE8q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332764; x=1710937564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9JCDC61iNKYNQIve/QaGBY5AdoE81HbyRknOAkalEo=;
        b=pPZdWnAKEZ//NbCZNGqXLP8tx+MbpGLUE1gkXMHs30XWYxEOShtyr/cFkHwKUM8qip
         9uluSfZXMT3ThszHpqQriL1g4zabJDgo7ZouTPdwQsTBUEYorC93wyTZB7C5RWl3RHm4
         lyPw+51NqpRdILHIX+j8foFSibbJL6sizI0XvhsxHMOk80PTfdZSOI57yTgzIxpux+DJ
         O0i+RUQvzR9ww48bRC4mDGhC84dGjzQY7fGeKX6Wi7aeF6FWCSdldVqa+EsedueSEI5B
         T5nENfPW8YA0foUdDVkMn9hpXfimOES5j9AytDcajplpgYQmFprZNadfZX124MPD5++1
         2OBw==
X-Gm-Message-State: AOJu0Yzts+lRI9FlfHfno1HZyZ/Jd9WPNtrbKcDivMujDCJYPgB35IjC
	2FfzB7pRLo4nwIjWxiPinL/JVfpVq8B65hjQw2dVl8E4m+REZTQT8dppMStDlddOaFh17tZUUq8
	7denO4B0mx1p2S3mW5NO2I0e+We2b1EaC0QERLoybw/cf6Jd+
X-Google-Smtp-Source: AGHT+IHi4KV+JtS0Yup9YLsW4GC+ypeG73864X60BTfpHdywmbKBm8ywDW8L461FCSiJw7YnCk6vpvBnOXWQokByAkE=
X-Received: by 2002:a05:6870:1197:b0:220:fffc:e085 with SMTP id
 23-20020a056870119700b00220fffce085mr10399622oau.18.1710332764089; Wed, 13
 Mar 2024 05:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <740404f0-3da9-4ae5-b4a5-b24cb2907e7d@suse.com> <CA+zSX=YiG9dskoZVw8u+bKtD5a-8Sc1Z+hRMUgzv=a1HmYawZg@mail.gmail.com>
 <064ec76a-4957-448b-9afe-1bd264fd81c7@suse.com> <CA+zSX=ZMjFRqj9BhVWN=JF5RidejTwjbzzHQQx=trfMBZ-90Ew@mail.gmail.com>
In-Reply-To: <CA+zSX=ZMjFRqj9BhVWN=JF5RidejTwjbzzHQQx=trfMBZ-90Ew@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Mar 2024 12:25:53 +0000
Message-ID: <CA+zSX=bhitA9nr=q3+jqCR5E7pPQRY+Q84OX2uHtyG8WLYtnbA@mail.gmail.com>
Subject: Re: [PATCH v3] x86/PoD: tie together P2M update and increment of
 entry count
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:25=E2=80=AFPM George Dunlap <george.dunlap@cloud=
.com> wrote:
> I keep missing your post-commit-message remarks due to the way I'm
> applying your series.

Er, just to be clear, this is a problem with my workflow, not with
your patches...

 -George

