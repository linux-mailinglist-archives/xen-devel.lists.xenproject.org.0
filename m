Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B292880F10
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 10:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695839.1086022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmsb2-0002Ld-WE; Wed, 20 Mar 2024 09:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695839.1086022; Wed, 20 Mar 2024 09:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmsb2-0002Jv-SX; Wed, 20 Mar 2024 09:50:56 +0000
Received: by outflank-mailman (input) for mailman id 695839;
 Wed, 20 Mar 2024 09:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmsb2-0002Jm-4Q
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 09:50:56 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57083d13-e69f-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 10:50:53 +0100 (CET)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3c398187b4dso940687b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 02:50:54 -0700 (PDT)
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
X-Inumbo-ID: 57083d13-e69f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710928253; x=1711533053; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiGcr24ALFDS/AFNc6B2F+49LphSOS0U2lgmpSIjAGs=;
        b=FqTsi6htb4NSjsRSYoJmWbKaYktD3UmdD8JbR0K9g71do+Z0RzheGZB5kiRsVd09oY
         3ONQTOp8X7pn8h4/2lSZLxjZTEnn4vxTTT2oE7u4+KHSs2Y1BZsF2eLF4bHj+joBexOy
         f96xHRs6yLyvPbKoqIWQRNeJtwExThRMsxCwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710928253; x=1711533053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiGcr24ALFDS/AFNc6B2F+49LphSOS0U2lgmpSIjAGs=;
        b=YRBmE7WgNGVdTHqhboeXbj7IA+UExr2MWoe28QnrIm9TF6vyR4ElSsaTbdTPerLemJ
         2KYFkg4gTtD0y1alvREdV82VAfS870srfYzhDZ57/5ecAOvvMW+5BTkvuOswOXVaRJwC
         jM10ArcuMlT8c41O69lxIGX4+Ut41d/h048ShVCtnDbM9bGgFCUtsmgboE4zRVye+l/M
         K8EeLKfIeB5jGQopnpHSSqtaECw8P9bK4bwWbNO3H4kT3+fk/+mjT0lpL/Qpon1c/pug
         0xzq9v/oRfEIuNGJ8oDgD/7Py9b6n4uY6xe7791AsMl0//fir3hZd5OdULfXeppJRs+D
         IIDA==
X-Gm-Message-State: AOJu0YwEp8Q94NwB7WGw8H1C4XoZ+i/EIytA0NDDKrTcPajwY82cL6L4
	e6zHZcFdqb/G6FOyEjm0UEWMFGaYFLKJmRzpIb0siq1hLUokrIXNwC0LtcdLWAX7wYv/LyfhWuO
	tmL1FVXwaP4EJLpQ6iSe9hDn3s+HxxjIX4fy2lg==
X-Google-Smtp-Source: AGHT+IEtMsUCxFWtGS52erNN8sWe5cUHNtN3MipyAOnDBVHApmaVv32i6YQR4iN8riL2uGo9aExmUc3sYO3T/40S4fk=
X-Received: by 2002:a05:6870:503:b0:221:42a1:9457 with SMTP id
 j3-20020a056870050300b0022142a19457mr5391860oao.9.1710928252819; Wed, 20 Mar
 2024 02:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com> <95699d2c-7e2a-40db-875f-907990797317@suse.com>
In-Reply-To: <95699d2c-7e2a-40db-875f-907990797317@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 09:50:41 +0000
Message-ID: <CA+zSX=afK6AhpOtqsr0EH-UZs-bb61ecb037hhULV3tUvSY8jA@mail.gmail.com>
Subject: Re: [PATCH v5] x86/PoD: tie together P2M update and increment of
 entry count
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 1:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> When not holding the PoD lock across the entire region covering P2M
> update and stats update, the entry count - if to be incorrect at all -
> should indicate too large a value in preference to a too small one, to
> avoid functions bailing early when they find the count is zero. However,
> instead of moving the increment ahead (and adjust back upon failure),
> extend the PoD-locked region.
>
> Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Oh!  Thanks for doing this -- I hadn't responded because I wasn't sure
whether I was bikeshedding, and then it sort of fell off my radar.  At
any rate:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

