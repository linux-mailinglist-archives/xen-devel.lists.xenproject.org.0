Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C0876BF86
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 23:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574554.899933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxG4-0006Yo-QR; Tue, 01 Aug 2023 21:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574554.899933; Tue, 01 Aug 2023 21:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxG4-0006WU-NU; Tue, 01 Aug 2023 21:50:24 +0000
Received: by outflank-mailman (input) for mailman id 574554;
 Tue, 01 Aug 2023 21:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQxG3-0006WO-Iz
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 21:50:23 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69347b35-30b5-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 23:50:21 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1bba7717d3bso4559742fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 14:50:21 -0700 (PDT)
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
X-Inumbo-ID: 69347b35-30b5-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690926620; x=1691531420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5rCAtpBNZXLPF1OmSD+Axody9pboeWmdmrPPO1MaOI=;
        b=QF+pguATSKLHX1a7qURHsLDFb43GgVsOkXf+YuzRuMvfzL9u5Lm6/098at+Bo0X0OF
         psFPWkV9dkhMY3jlc/rMbwXI9UTZiBF/RW+8PRi1lG6+4ghn/8BehNZybrIdpaEH5JEV
         5pt+N8rDlySShFuIpvdijSW30mWvyqDireSey6RvsweRndchMt8+whuKYgGbmY2sGnV0
         W81/3ELo1uaMGYSWLnuD5zVt1vYULErJbl3gL/o8D9teaFjxXO4BSYHJNe4ridR97gF0
         ix99cvJ/CRW3DfSABez1awxLg5qXsUazFs+BzNi+R6PkkrNNCAJkEcOSv+D6rAxybGPa
         F4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690926620; x=1691531420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5rCAtpBNZXLPF1OmSD+Axody9pboeWmdmrPPO1MaOI=;
        b=JHiRUe9R/CKNh6/HssyBOJYAiIvcGNER7wj0pbsid/VXOdS81jhN8JSamFzBZrjNyH
         2NR+dT+9mTvS1uv4rZ9kUBKEmbwkt2IEDJ4RZZFIHVIgD4lYArxgs5u5+UGzrPvH8rMZ
         Gda14bDllD9gYEDqh8LvemK294gJ6gAEps0kkQWv5opGNKBq7R53AIkxrGnEEiiTqASU
         PQUXbIO6aZMeeFPA+tsPeDgfXIKS6gZaUv6DstW1hXnTmR4lg5CiBGscbN3sFFNNrX9s
         Cvb2E5HHiQWQsnIHQu+JFlxvzzgxCEbhbcwePn4oC1Fovn9P+rZt6CLTm8H2OJwZuaSz
         7GHw==
X-Gm-Message-State: ABy/qLYAtvLuvVu3EQWAieXGX/yFZ8kApFxxo1Oj4y98XMGa0u1i57Q/
	jTDeroRf9RXlhPcPZedAt4hGceUtPBaMc8GFqFg=
X-Google-Smtp-Source: APBJJlHX6m3nhYISCmTsQNwrp4Xd3U2QurjDzHUUYAgcbCgWYobQ5O1r4hHvwoL383XfwQOaaqHnRgBIJ51SsErIQi4=
X-Received: by 2002:a05:6870:46a5:b0:1b0:25b4:4b7a with SMTP id
 a37-20020a05687046a500b001b025b44b7amr17682930oap.51.1690926620049; Tue, 01
 Aug 2023 14:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230801174930.2995947-1-raj.khem@gmail.com> <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
In-Reply-To: <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2023 14:49:53 -0700
Message-ID: <CAMKF1srf0h=x7vSv4jF6AwyJfsmeddzyPOjSog7eK7TeF9yjsQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section directive
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 2:03=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> Title: This patch is not arm32 specific anymore. So I would replace
> 'arm32' with 'arm'. This can be done on commit.
>
> On 01/08/2023 18:49, Khem Raj wrote:
> > Assembler from binutils 2.41 rejects [1] this syntax
> >
> > .section "name"[, flags...]
> >
> > where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
> >
> > It is almost like a regression compared to 2.40 or older release,
>
> The next word after ',' start with an uppercase. Did you intend to use
> '.' rather than ','?
>
> That said, the documentation has the following:
>
> For SPARC ELF targets, the assembler supports another type of .section
> directive for compatibility with the Solaris assembler:"
>
> This leads me to think this is not a regression and instead an intended
> behavior (even though it breaks older build) even it breaks build.
>
> I would suggest to reword the commit message to:
>
> "
> Assembler from binutiles 2.41 will rejects ([1], [2]) the following synta=
x
>
> .section "name", #alloc
>
> for any other any target other than ELF SPARC. This means we can't use
> it in the Arm code.
>
> So switch to the GNU syntax
>
> .section name [, "flags"[, @type]]
>
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D11601
> [2] https://sourceware.org/binutils/docs-2.41/as.html#Section
>
> If you agree with the commit message, I can update it while committing.

LGTM, go ahead.

>
> We should also consider to backport.
>
> Cheers,
>
> --
> Julien Grall

