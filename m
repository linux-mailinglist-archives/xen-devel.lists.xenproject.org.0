Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713888B1D19
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 10:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711918.1112265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzupL-00041b-Pl; Thu, 25 Apr 2024 08:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711918.1112265; Thu, 25 Apr 2024 08:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzupL-0003yx-Mt; Thu, 25 Apr 2024 08:51:35 +0000
Received: by outflank-mailman (input) for mailman id 711918;
 Thu, 25 Apr 2024 08:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d+ZV=L6=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzupK-0003yr-3H
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 08:51:34 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 034f9b64-02e1-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 10:51:33 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5aa3f0fcd46so445197eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 01:51:32 -0700 (PDT)
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
X-Inumbo-ID: 034f9b64-02e1-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714035091; x=1714639891; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/ZeL0QOzD2h4upf4QOU2xgVuavumJYAoFrUUVA5t5E=;
        b=S4yHd1Pc6pnACuKNyo528nMRvRgFa93IpvEntrCB9f1Qzr+vH8htugZi9zPV7dKR5H
         zcn+WdzkfjdnDxUlwnn1J4rsXcPw77Rxla9Naf4+k3CrTkWGrri+U2shTjxqXxhr4jJ1
         L3kVCJj1aC51y8ULC0uZequKuHiPNGmqKFd+vPxhbx4Vq+/ld3EmXCzWuHaAb9qCzw/m
         ONVUrN8pYR7OkMeYxYIyaRThxodLxacklKlPd+6oatcDBtavvZ5cmo3ebpPEvE97eM3B
         B7f3s0TfDtEBJjbk9PfhmAeiXqXPiwCtlRPr0r0QOjP+A2eiZdeMmXOGbXOZkzpFTO9y
         epcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714035091; x=1714639891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/ZeL0QOzD2h4upf4QOU2xgVuavumJYAoFrUUVA5t5E=;
        b=MZj6fN5x2YsMyBlII8/DQNNbfPz9ILWJzLd1gwyJwNgZ24aY00mBb+sobxt+5NnX1Z
         UuvKWy9a6KZGYZKU68ziLd29UfnUYeSUOcKetUzVNaA5qVNlZwe0TYFo/mSXWZ3k8s/d
         QVOVOR2A63dagwx+8osIjaGUTJ4rj679d1D8gX77wCK+fbCtwTi1B60ZmhGvDNISb9Jc
         CnghdjuslLlE/oDntkNw9YoqqkGRwIVXYHlZFGFpWLQw8dqFM/BC4kgLYVOxE24TyrjU
         iGx/8MOzT0AIJzrE1hgPIqQeo8aDeyJAs+tHASmJg2DtM0NVJhmUwEZL2JNUn1U32dJn
         GoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn3qaNhem51ebDLPUrQ8RNwMUUgsxOS1NsqjhOIG5jZIlpr5d5UfPGdv0vLbu10RLNkA6HBldIyVFlhlP+UuFznuOjrbO8g6BwsXosdak=
X-Gm-Message-State: AOJu0YzFvA55m7e2x1guLSY5IjPTJ02MEebw6f//zr2uXOdiet5xP6Vk
	0nOUhC+I25ylyjXRuNQDxrZvXOPXTRzsiOYehKhrFPOPMtQ9gHtiMz/+XnVRZN/L0tOZFezluTq
	yoRt+PqIDNoBv61nID+GcsWoZ5Pw=
X-Google-Smtp-Source: AGHT+IEvQx2JNckm1eId4qZw3+gX5gZJiGNGpce6+1M1FRzS/jABV0BwpVUxHwNiyBb8ikyPoClw4kgPpT7sKAO5fFA=
X-Received: by 2002:a05:6870:e985:b0:21e:b096:2494 with SMTP id
 r5-20020a056870e98500b0021eb0962494mr5819579oao.50.1714035091237; Thu, 25 Apr
 2024 01:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713990376.git.w1benny@gmail.com> <67b5dd52435132d0fb65e7b301970e17e092fa87.1713990376.git.w1benny@gmail.com>
 <9bb611ac-1187-4daa-9649-53afeeb11695@suse.com>
In-Reply-To: <9bb611ac-1187-4daa-9649-53afeeb11695@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 25 Apr 2024 10:51:20 +0200
Message-ID: <CAKBKdXjs2DRD=kQ3dxfaHjSgghbLH-HgvxUkAC++N2_zPArZXA@mail.gmail.com>
Subject: Re: [PATCH 3/7] tools/xl: Add max_altp2m parameter
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 8:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.04.2024 22:42, Petr Bene=C5=A1 wrote:
> > Introduce a new max_altp2m parameter to control the maximum number of a=
ltp2m
> > views a domain can use. By default, if max_altp2m is unspecified and al=
tp2m is
> > enabled, the value is set to 10, reflecting the legacy behavior.
>
> Apart from the public header you don't even touch hypervisor code here. W=
hat
> you say above therefore is limited in scope to the tool stack. I question
> though that adding a new field without respecting it constitutes an overa=
ll
> consistent change. In particular I'm curious how you mean to deal with th=
is
> for other than x86, where altp2m as a concept doesn't exist (yet).
>
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -77,6 +77,7 @@ struct xen_domctl_createdomain {
> >       */
> >      uint32_t max_vcpus;
> >      uint32_t max_evtchn_port;
> > +    uint32_t max_altp2m;
> >      int32_t max_grant_frames;
> >      int32_t max_maptrack_frames;
>
> Such a struct layout change needs to be accompanied by an interface versi=
on
> bump (which hasn't happened so far in this release cycle, afaics).
>
> Jan

So I should not include domctl.h changes in this commit and instead
edit the commit message that it's merely a preparation for the
following commit.
Then, move the xen_domctl_createdomain field creation to the commit
with the hypervisor changes (+ include interface version bump) and
then create an additional commit that ties xl and xen together.

Do I understand it correctly?

