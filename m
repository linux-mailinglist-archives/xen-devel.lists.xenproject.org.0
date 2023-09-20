Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD497A79E1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605574.943162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuvh-0001tE-QR; Wed, 20 Sep 2023 10:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605574.943162; Wed, 20 Sep 2023 10:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuvh-0001rU-Ni; Wed, 20 Sep 2023 10:59:37 +0000
Received: by outflank-mailman (input) for mailman id 605574;
 Wed, 20 Sep 2023 10:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atm2=FE=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qiuvg-0001rO-TJ
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:59:36 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a1cc17-57a4-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 12:59:34 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bff936e10fso8989761fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 03:59:34 -0700 (PDT)
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
X-Inumbo-ID: c8a1cc17-57a4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695207574; x=1695812374; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OX2RWp9HhmgAb5GMmVeXa354t6dsLsLefC1I8hAsqLU=;
        b=IA6zu1Q0wsUQmE5j2B9VJHWsFWNWDkoCrKnWMhT3T02UrzKqlYyq+AB1GWeCIrsJQH
         KhxLR3fJFKuyPOzn/xIJifJAOL2NVSOKn3rbybu7elVI+oz2OxB4dcYTsoNjsjAG5EDl
         D8GI5VWEV1soZm66/uaIHkJOjrQ/ip6BdFDXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207574; x=1695812374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OX2RWp9HhmgAb5GMmVeXa354t6dsLsLefC1I8hAsqLU=;
        b=eCPbBYN7D1gPgBfNDYzAGaP4yimvDONo/v7xctWK3/mbflg/IyG7J+rsjrWrahD7hy
         A0crPGHVRRQPxmAu5O5eR5epmTxZTX/dW+Qji2gq5G3h/mtNPDbVmxVA4lmKW6+PSR3g
         YDk0SywJ+XNt3OLG4/5wLe7jyZHOZyhXd0RKE2D6+qO7LsMGIoaDjz5AduttWorc3L4v
         JDxt8rnkKsVxeXSx3FZb1QLogIbOKQdxcy70je/4XKGU/wB0+I6RO94hwuKoFfSL9+Rb
         lq4O+CNsMGrWOYUJwzKPiRUCyv/x2hxgmh2qZrUyaVmnxhtGk88edoLMyJ75ruvcEbki
         9duw==
X-Gm-Message-State: AOJu0YykAtn23zzPhwIoqlsyo56OczmfRgQIV7kTGfUOVhkJnSoI4GSv
	7jO4LS+k4oAFNsDOLxe2FzjgzCW9D0EuCfmcdHZlsg==
X-Google-Smtp-Source: AGHT+IGgIOesCa0OBftqcrvxeb0fNrD+sXxhhCRrYy0fWowDWFXt1l/r0IYQNUvVrZBJRMakSm9G3+q2HYDVfuy0q6Q=
X-Received: by 2002:a05:651c:48e:b0:2b9:aad7:9d89 with SMTP id
 s14-20020a05651c048e00b002b9aad79d89mr1829193ljc.15.1695207574141; Wed, 20
 Sep 2023 03:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
 <d3f04552-28d3-8745-3def-b7c341f8b76b@suse.com> <daaff015-6da1-8daa-d8b3-3618c89bc799@raptorengineering.com>
In-Reply-To: <daaff015-6da1-8daa-d8b3-3618c89bc799@raptorengineering.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Sep 2023 11:59:23 +0100
Message-ID: <CA+zSX=a6U5Ox-uS8EO7A2c4QPF06Ua007hCkyimwU-nKdsnxbQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] ppc: Enable full Xen build
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Jan Beulich <jbeulich@suse.com>, Timothy Pearson <tpearson@raptorengineering.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 6:27=E2=80=AFPM Shawn Anastasio
<sanastasio@raptorengineering.com> wrote:
>
> On 9/18/23 8:19 AM, Jan Beulich wrote:
> > On 14.09.2023 21:03, Shawn Anastasio wrote:
> >> Shawn Anastasio (4):
> >>   xen/ppc: Implement bitops.h
> >>   xen/ppc: Define minimal stub headers required for full build
> >
> > Compilation fails after applying this.
> >
> >>   xen/ppc: Add stub function and symbol definitions
> >
> > Continuing nevertheless, linking fails after this.
> >
> >>   xen/ppc: Enable full Xen build
> >
> > Things build okay for me when the full series is applied. Generally we
> > wouldn't deliberately break the build between any two patches; doing so
> > may be okay here (except I guest CI's build-each-commit would be upset)=
,
> > but I'll do so only upon explicit request (and with no-one else objecti=
ng).
> >
>
> Sorry about that. Going forward I'll take more care to ensure that
> partially-applied series still build correctly. For this series though,
> if you could make an exception it would be appreciated.

What would be the reason for the exception?

We don't want to follow the rules just for the rules' sake, but the
rule is there for a reason: primarily to keep bisection working.  Not
sure of osstest is testing the PPC build yet, but if it were, then
this sort of thing would make it more difficult for the automatic
bisector to find regressions in other parts of the code.  Having
non-building patches can also confuse "archaeologists" -- people a few
years hence who are trying to understand what the code does.

Is there a reason that this series would be particularly difficult to
reorganize in a way that would keep it building?  (Haven't looked at
it in detail.)

 -George

