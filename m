Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93180612BA5
	for <lists+xen-devel@lfdr.de>; Sun, 30 Oct 2022 17:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432565.685280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opBJE-0001NY-6G; Sun, 30 Oct 2022 16:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432565.685280; Sun, 30 Oct 2022 16:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opBJE-0001K8-3W; Sun, 30 Oct 2022 16:37:16 +0000
Received: by outflank-mailman (input) for mailman id 432565;
 Sun, 30 Oct 2022 16:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhP/=27=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1opBJD-0001K2-7u
 for xen-devel@lists.xenproject.org; Sun, 30 Oct 2022 16:37:15 +0000
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b260964-5871-11ed-91b5-6bf2151ebd3b;
 Sun, 30 Oct 2022 17:37:13 +0100 (CET)
Received: by mail-pl1-f179.google.com with SMTP id c2so8852993plz.11
 for <xen-devel@lists.xenproject.org>; Sun, 30 Oct 2022 09:37:13 -0700 (PDT)
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
X-Inumbo-ID: 1b260964-5871-11ed-91b5-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmRryiIhsBZrJWe9dZMnKrws2g1r0LIPunYSsFhLBeU=;
        b=s4nffNlcAmrgMc9aHVCme51KhReSCr1c1ebakGdK+L6ZUy05tNgdjRTfOBeGrnV/NL
         JYADtlvMiXBa5poWlD6FDx8EWQiM5hdLHXceuVS5/cdmILuZQuMU7dSKOOoOjTFJwBIL
         TpV9rXZKyPgsTr+47sEQkLbL+vxl2sOutczrCYgF5AncoWo3al2zTTyDlDKiZsTfhlTt
         kKqHNpEAy3PVupy+73QvDKi9sT3OYEpqqTMWWnMIQO7a+4ld5e/TK/pQkaQOFYQUGb4N
         6wa3DkCJlLHPHgmYMe9pPsoigOLqSYZn9ETPboTBcqD/RAOLVtYbg6z0JjF+Z62zvkWc
         Razg==
X-Gm-Message-State: ACrzQf3koEE1Z2GTEtxhGYTBUgRjt6/alK7fLdvvdoP/7mkVYn7ouoF/
	52ojDbGLCvXvROljw4fGQB8dA0F3cwGMqLZoxkI=
X-Google-Smtp-Source: AMsMyM6Txmb9vm84kuPRw2bOFh4ZSw1Dc0vY4I9iPpctVlZc/dx/9/fnBXr7BlotWDPPPsHl34VFbV61e2LdOdzu/PU=
X-Received: by 2002:a17:90b:60e:b0:212:d5cd:4e58 with SMTP id
 gb14-20020a17090b060e00b00212d5cd4e58mr10568850pjb.165.1667147832202; Sun, 30
 Oct 2022 09:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger> <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger> <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger> <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger>
In-Reply-To: <YdxIbLYRYh4hvVGj@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 31 Oct 2022 00:36:59 +0800
Message-ID: <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 10:54 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
> > So looks like at least the imbalance between two directions are not
> > related to your patch.
> > Likely the debug build is a bigger contributor to the perf difference
> > in both directions.
> >
> > I also tried your patch on a release build, and didn't observe any
> > major difference in iperf3 numbers.
> > Roughly match the 30Gbps and 1.xGbps number on the stock release kernel=
.
>
> Thanks a lot, will try to get this upstream then.
>
> Roger.

Hi Roger, any news for the upstream fix? I haven't heard any news since...
The reason I came back to this thread is that I totally forgot about
this issue and upgraded to FreeNAS 13 only to rediscover this issue
once again :-(

Any chance the patch can apply on FreeBSD 13.1-RELEASE-p1 kernel?

Thanks,
G.R.

