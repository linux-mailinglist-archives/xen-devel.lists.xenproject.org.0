Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46587A648
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692336.1079363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkMJm-00082l-O6; Wed, 13 Mar 2024 10:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692336.1079363; Wed, 13 Mar 2024 10:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkMJm-000814-L4; Wed, 13 Mar 2024 10:58:42 +0000
Received: by outflank-mailman (input) for mailman id 692336;
 Wed, 13 Mar 2024 10:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkMJl-00080y-TD
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 10:58:41 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a656da33-e128-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 11:58:40 +0100 (CET)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2218a0f55e1so531285fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 03:58:40 -0700 (PDT)
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
X-Inumbo-ID: a656da33-e128-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710327519; x=1710932319; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5h9JwJAKrV4OE/L09HHTEZ8FYrOOBIqAvzIDW+sn1Y=;
        b=EC5oBRYWQqsvS0fy2Q1ytmt99PJJQP4sj+jaDZTElq6wEw2OUpymEjZtM0WgpEulfl
         bTEslykKRfF1sBfdWBr6aZyhSz6X2G2L1nmtNkiJU5v8/HVgyA91YACKoIDHppcQ/y0Y
         5c/RNFe+uhHn2RIuacxfDfZqSYaa65yQtn744=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710327519; x=1710932319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5h9JwJAKrV4OE/L09HHTEZ8FYrOOBIqAvzIDW+sn1Y=;
        b=Iqx+8HcdG+xoiNCSF2v764Bz/mV7c9GhLxQkG616ebeDaCdggCD+/EeWgfdJbDYejQ
         LVlxcDuppODwU2m+xrsPbTQ2zheBhzm/Ay7yazNzFvyRo0n3Z3BIc+gyXMLDIL5kj69f
         /sGzVjb4x8PeKIBjyRcJdYCKKm3LQP8WAD/dyYxY4JChdteFW2XMXIMWw4WPFf1fR6Ym
         cVR1Y/5wVPXs0vR65kBx2Vwtr3KuBL8w4wdT5eYILX/cRl8y2JmqjQ6dMN31zK1yQWpP
         N7YGWbKcOrNmmU3kEAYqzn0bgyuZVAksU3vjy9N0oUzB6IJykkSlPh0D643Jo+yP7WCj
         ofmg==
X-Gm-Message-State: AOJu0Yw0eO3BlAHi68GEdyqUFcoimHzXXr2PCewu8f6ZVrDsPenT1BL7
	HnQ6gN1lBNvDKKz80dRCeQbQGACcBY+KwoREA9WaT7UBFYsNbuBvzlkdy2ppOnX4BRrW5avxsOT
	/YDEiHzZ4MhPh5AdTyvKUaBpBeR9KZaGTz38uew==
X-Google-Smtp-Source: AGHT+IFwN+KcWgiSvPIDHUYaMDdjJwtT2a4f+bAC7tBEpCxDHPe22SKKV9K0Emq901kSYQbtkKeEBfo5Yx8Krm+jfOo=
X-Received: by 2002:a05:6871:28a5:b0:21e:7a1d:b4ec with SMTP id
 bq37-20020a05687128a500b0021e7a1db4ecmr6632395oac.7.1710327519556; Wed, 13
 Mar 2024 03:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com> <740404f0-3da9-4ae5-b4a5-b24cb2907e7d@suse.com>
In-Reply-To: <740404f0-3da9-4ae5-b4a5-b24cb2907e7d@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Mar 2024 10:58:28 +0000
Message-ID: <CA+zSX=YiG9dskoZVw8u+bKtD5a-8Sc1Z+hRMUgzv=a1HmYawZg@mail.gmail.com>
Subject: Re: [PATCH v3] x86/PoD: tie together P2M update and increment of
 entry count
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 3:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
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
> ---
> The locked region could be shrunk again, by having multiple unlock
> calls. But I think both ioreq_request_mapcache_invalidate() and
> domain_crash() are fair enough to call with the lock still held?
> ---
> v3: Extend locked region instead. Add Fixes: tag.
> v2: Add comments.
>
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1348,16 +1348,22 @@ mark_populate_on_demand(struct domain *d
>          }
>      }
>
> +    /*
> +     * P2M update and stats increment need to collectively be under PoD =
lock,
> +     * to prevent code elsewhere observing PoD entry count being zero de=
spite
> +     * there actually still being PoD entries (created by the p2m_set_en=
try()
> +     * invocation below).
> +     */
> +    pod_lock(p2m);
> +
>      /* Now, actually do the two-way mapping */
>      rc =3D p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>                         p2m_populate_on_demand, p2m->default_access);
>      if ( rc =3D=3D 0 )
>      {
> -        pod_lock(p2m);
>          p2m->pod.entry_count +=3D 1UL << order;
>          p2m->pod.entry_count -=3D pod_count;
>          BUG_ON(p2m->pod.entry_count < 0);
> -        pod_unlock(p2m);
>
>          ioreq_request_mapcache_invalidate(d);
>      }
> @@ -1373,6 +1379,8 @@ mark_populate_on_demand(struct domain *d
>          domain_crash(d);
>      }
>
> +    pod_unlock(p2m);

We're confident that neither domain_crash() nor
ioreq_request_mapcache_invalidate() will grab any of the p2m locks?

If so,

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

