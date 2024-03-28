Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518FB88F48A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 02:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698759.1090843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpeVM-0006ZK-KV; Thu, 28 Mar 2024 01:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698759.1090843; Thu, 28 Mar 2024 01:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpeVM-0006Xp-Gy; Thu, 28 Mar 2024 01:24:32 +0000
Received: by outflank-mailman (input) for mailman id 698759;
 Thu, 28 Mar 2024 01:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSAQ=LC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rpeVL-0006Xj-0S
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 01:24:31 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebe59263-eca1-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 02:24:28 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso244409f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 18:24:28 -0700 (PDT)
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
X-Inumbo-ID: ebe59263-eca1-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711589068; x=1712193868; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMXtwOiTpOApCjD9n1tSkh3mIVCmf75hXY5jgNK9zj4=;
        b=eObVBc5TVl6HSngqa9VN64j5EZO7uRBxzBF4VIN/h9MU0QR5GYDBP96jnA4nRHdAuU
         lJ9RWpPTKM0ZHiRdo3I14Df+7ablYNGi24EvOwss2hHceO68df5YqlnukDNxSRwIRKEP
         6ZVqmC9E3OR/49iTw5PCgBDlPYx2RYwodXoCgR9Bc2Cv+AdPXKlk+AJwmbtcnXPaAmTP
         x3XctJqoy1PejsXe+OTM0hq5y0UxyPwfPcxoZm/ssrzgbrH4Rig96dKD5iQp0Sv2TJzI
         t8EBQdbKklqEq4i0kC6PNH7jeGNj/lrRsa7BOKLx99sbyLf/C8EBFkLidd5G6V46Wxpu
         JV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711589068; x=1712193868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMXtwOiTpOApCjD9n1tSkh3mIVCmf75hXY5jgNK9zj4=;
        b=mHv6bJS6gCrIld0l5gvqlptzgajfDtjb9vt0UQitoOdLGfqlSkyzDubzx4/ljz51pA
         xiZ+MUpRh41wfqre5ig96GCoUDXmT+OrBV59oIhXus/nn6dE3kpASRRkkkgRPGaZ87Kf
         5Z5ClVzJE3Z/mbxrEOuqEqKaUzxXPfMqTLjeeObu1+UBXCwmK4jew57pzMQ8ghK9RxwE
         XZ0+QrqQWf7pV5ygcv8J7sNwnoBqqQN5szj1caNvjr/qR3bLqPx5WmV/DnFMuxHD7K6i
         NqPikdQHN8Os2hkLPtumZ6TnvaPJxQF3iUlE01x03oKGb0hbnbxad9J1uHv99I5KMPyL
         mNcw==
X-Gm-Message-State: AOJu0YxNawHde9HNtxgErUBGbi/5+cns+l6rbbB7v5CM6ju7I5agW3zj
	c8ChN/r9j/lf7xrNLF4l/Huzs76Aj9kzyRv8QS2t8WgB4zKA8gAqMeDI4CIQAYK+HdIZUzAZK4o
	xwvKePdd4gl9z9mS2dA6unJU1vF0=
X-Google-Smtp-Source: AGHT+IH0WkDEkoB50gqDDf7Pqf+mPlwgwvE5z7UJjKbwZi8QN2iXXcuwQDjVXUuhoVZI5em2VTt9tvP3uV5wpPbqbk8=
X-Received: by 2002:a5d:6d8b:0:b0:341:deab:4313 with SMTP id
 l11-20020a5d6d8b000000b00341deab4313mr1371694wrs.1.1711589068005; Wed, 27 Mar
 2024 18:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240124165401.35784-1-jandryuk@gmail.com> <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
In-Reply-To: <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 27 Mar 2024 21:24:16 -0400
Message-ID: <CAKf6xps9X=6GYxuk9u2cPYh_pzpLu2MQ00smydRQ40TjxDhgEQ@mail.gmail.com>
Subject: Re: Linux Xen PV CPA W^X violation false-positives
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 7:46=E2=80=AFAM J=C3=BCrgen Gro=C3=9F <jgross@suse.=
com> wrote:
>
> On 24.01.24 17:54, Jason Andryuk wrote:
> > +
> > +                     return new;
> > +             }
> > +     }
> > +
> >       end =3D start + npg * PAGE_SIZE - 1;
> >       WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx rang=
e: 0x%016lx - 0x%016lx PFN %lx\n",
> >                 (unsigned long long)pgprot_val(old),
>
> Jason, do you want to send a V2 with your Signed-off, or would you like m=
e to
> try upstreaming the patch?

Hi J=C3=BCrgen,

Yes, please upstream your approach.  I wasn't sure how to deal with
it, so it was more of a bug report.

Thanks,
Jason

