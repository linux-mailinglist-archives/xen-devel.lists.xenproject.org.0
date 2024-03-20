Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0888120C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695904.1086184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvcy-0006Q9-08; Wed, 20 Mar 2024 13:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695904.1086184; Wed, 20 Mar 2024 13:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvcx-0006NJ-TD; Wed, 20 Mar 2024 13:05:07 +0000
Received: by outflank-mailman (input) for mailman id 695904;
 Wed, 20 Mar 2024 13:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmvcw-0006ND-FX
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:05:06 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76403f2a-e6ba-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 14:05:02 +0100 (CET)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-221a9e5484aso4436087fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:05:02 -0700 (PDT)
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
X-Inumbo-ID: 76403f2a-e6ba-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710939901; x=1711544701; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izQzpUbL1dpO3IoB7vXcaReCh2kIbRFcbdk/5mplQx4=;
        b=TQ637XUoEImu/9KnwttZoVma7vZD8dnjrbjWL0T+XN4DAl98C9eTS5Q97cirOaE5b4
         HWNH8tbnrMhD+l2OW4HQW+K5En8qGrckD4Oe4JFdn1JohLuOia9kQa+1zIv75970zPIS
         TcDfceE+T2vQT8DvB7xXz5Oh+LYnMtj8bhkaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710939901; x=1711544701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izQzpUbL1dpO3IoB7vXcaReCh2kIbRFcbdk/5mplQx4=;
        b=DGodkmSwq4y8LYFK3BtqV2551QTtALc7tx1k4Xplm2qQMlbMVd0bollA6zOW1cfR1C
         wiZq6I56aYMMQkIfv59jR7ocSPy0fh2gmhsDWuuu2bRwuA0PPPaWvY1lX4/FtZj/Gkk0
         R7BZw2VXxMojCeaaf2PXiY3LDe2xPdSqyqnLMvpYuPW9KEg3N6T6mBhVcJKZ6eyQC6jf
         FwvVJ2T9VqA1eUOH6I1UGnXlEjK1BkT6YsmWisAJx9RWn6xF6/pzV6B2xY0s0WEKiuqS
         a1++/MfqPyJoe2Q7OaAttfwb5AqXZ9j5DwbDhaeSjdJ4ecnXl2V9+uD6dCqIL37MNsVK
         OKRQ==
X-Gm-Message-State: AOJu0Yx62hMWtVYXhBhLHmEIzkUD2uUfVNtTjiCRo3JJTHKPAeM/McbG
	XBs+MdASvJT5c1MqX4/ABBfv4zByWTeISS4851LZpXC/l5XMBFnfLWcVA22HVN+9rWoQwgQZjY1
	OcZKsb3JPsZagY6OK7GMSRt829/lG37f5M5mGEQ==
X-Google-Smtp-Source: AGHT+IGovfy95FbuhemsJdyxgQbq7yGz8amTU9+gWwj5ifvmfOWd0UnougtFkNqzKUTEKomfO4/zWQ6xWhPdBhgNLpw=
X-Received: by 2002:a05:6870:20f:b0:21e:6b95:fb2d with SMTP id
 j15-20020a056870020f00b0021e6b95fb2dmr19199336oad.18.1710939901138; Wed, 20
 Mar 2024 06:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-3-andrew.cooper3@citrix.com> <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
 <19d9487e-67cf-4c1e-9dc6-419d9c5d0120@citrix.com>
In-Reply-To: <19d9487e-67cf-4c1e-9dc6-419d9c5d0120@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 13:04:50 +0000
Message-ID: <CA+zSX=aGAwfyxxq=ViCF1S4oWr50hYH8E811kX2aaOYL-G=HQQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] xen/credit2: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 12:19=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 20/03/2024 12:16 pm, George Dunlap wrote:
> > On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >> There is no need for bitfields anywhere - use more sensible types.  Th=
ere is
> >> also no need to cast 'd' to (unsigned char *) before passing it to a f=
unction
> >> taking void *.  Switch to new trace_time() API.
> >>
> >> No functional change.
> > Hey Andrew -- overall changes look great, thanks for doing this very
> > detailed work.
> >
> > One issue here is that you've changed a number of signed values to
> > unsigned values; for example:
> >
> >> @@ -1563,16 +1559,16 @@ static s_time_t tickle_score(const struct sche=
duler *ops, s_time_t now,
> >>      if ( unlikely(tb_init_done) )
> >>      {
> >>          struct {
> >> -            unsigned unit:16, dom:16;
> >> -            int credit, score;
> >> -        } d;
> >> -        d.dom =3D cur->unit->domain->domain_id;
> >> -        d.unit =3D cur->unit->unit_id;
> >> -        d.credit =3D cur->credit;
> >> -        d.score =3D score;
> >> -        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
> >> -                    sizeof(d),
> >> -                    (unsigned char *)&d);
> >> +            uint16_t unit, dom;
> >> +            uint32_t credit, score;
> > ...here you change `int` to `unit32_t`; but `credit` and `score` are
> > both signed values, which may be negative.  There are a number of
> > other similar instances.  In general, if there's a signed value, it
> > was meant.
>
> Oh - this is a consequence of being reviewed that way in earlier iteratio=
ns.
>
> If they really can hold negative numbers, they can become int32_t's.
> What's important is that they have a clearly-specified width.

Oh yes, sorry if that wasn't clear -- I was suggesting int32_t, unless
there was some compelling reason to do otherwise.  I just realize that
the last time this series had some review comments, it took 3 years to
come back around, and it would be a shame if that happened again; so
I'm happy to go through and do the change.

 -George

