Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D336B9F77
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:18:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509804.786313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA9t-00030M-Uk; Tue, 14 Mar 2023 19:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509804.786313; Tue, 14 Mar 2023 19:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA9t-0002x2-RQ; Tue, 14 Mar 2023 19:18:05 +0000
Received: by outflank-mailman (input) for mailman id 509804;
 Tue, 14 Mar 2023 19:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfqj=7G=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pcA9t-0002ww-1g
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:18:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0b86d9f-c29c-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 20:18:02 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id z21so1045540edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 12:18:02 -0700 (PDT)
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
X-Inumbo-ID: f0b86d9f-c29c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678821482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1DtganGhhMfDMEKhE8vAiKkiDf6NGmcJkuNohps2Wk=;
        b=B26fmF6qbGMGMJvfHr8LOiTqvOItPWeHjngRidCern0PHjchzU6jh3h+yIr/YbWaNZ
         PkED3aZNBGzSfBeqMpgQhajDFwoJkd/qbSKqDbG3lTlmA86E/y+O1xgyWMn5SRx2grtb
         rvju9EuLbOyCYOdVCineNNIf2P/ktHFtCVKbarG1TFMQlydZofeK5iP/y4CeTOoeMx+y
         Rqi057AWGfVdKdNG/VFzQcQbmGPYx8+PQOmudd7s2apemVqUB9iQtGxUGKUAttmT2RbF
         alTInpob8mt6eYPp1KCnhIQGep8tZ5tHT7iYyAuzldg2rCuC0r4wFYtT1Af236e/5pl2
         uLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678821482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1DtganGhhMfDMEKhE8vAiKkiDf6NGmcJkuNohps2Wk=;
        b=nsqqLACk45FtH24nIyP1oZjQmznLKSDAEKjvlLPdM/XMPb21AVLDnQF3VI6lxYIND9
         PsmUlvRtH1Roleoyd7MixcWVMZnz/zA44svKyTgORcWzToOh7jF66+PNpQcRuhSZrm9n
         lR8ZSr0ay6put/EJbtU6qhCpR+ek1Sq5SSPaGVlPHoC0dFgQZKxo8V9J49uuYMuvVtf7
         ak4r0fsplo56qhUqlF0pk4MJGpKkmf5bgf/VOMhOZ9RtOwj5hwUO7KuBOYKo03fr9Z8Y
         mTn7OjV7YL5aRPSyr4JzYjZ2XHVdIdEqufy/iVI+sWHo77hj8TDecK9fjQneuKdyZluX
         6ajg==
X-Gm-Message-State: AO0yUKXHDYTV4IDJQoykriAzxjGuciuR2gzCTqwq1+25nnQMwm4q/BBn
	yS5vi4rHMgYdsaRJbL/58b4gIBDYl4KEs4dOudh6HjlN
X-Google-Smtp-Source: AK7set+aC4op4tZ3zCR4DLeiFWxXxUMLp6MvkJ2uCjHOCubqv9XkwEkb0AQ2psQM8rANgwRYRLzM+6Wzt3bEDy6rgTI=
X-Received: by 2002:a17:907:e91:b0:924:32b2:e3d1 with SMTP id
 ho17-20020a1709070e9100b0092432b2e3d1mr1994871ejc.3.1678821482408; Tue, 14
 Mar 2023 12:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
 <671cd744b92f14ddc0c47ca471e03e3229cb89ba.1678368234.git.oleksii.kurochko@gmail.com>
 <3df43c25-6c06-0cbb-5452-c989511a7e15@suse.com> <192fbcf22a6c6e16498cc208eeb37fc6e08ce56a.camel@gmail.com>
In-Reply-To: <192fbcf22a6c6e16498cc208eeb37fc6e08ce56a.camel@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Mar 2023 15:17:50 -0400
Message-ID: <CAKf6xptSdS8GxWXj6Cr93WPRAzARVHYzNtSN+P1i9FQ+GZrN1w@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Gianluca Guida <gianluca@rivosinc.com>, George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 3:12=E2=80=AFPM Oleksii <oleksii.kurochko@gmail.com=
> wrote:
> I would like to add the changes from the [PATCH] xen/cpufreq: Remove
> <asm/bug.h> by Jason Andryuk <jandryuk@gmail.com> but I don't know how
> correctly do that. I mean should I added one more Signed-off to the
> patch?

Hi, Oleksii,

It's two trivial deletions, so I think you can fold them in without a
Signed-off-by from me.  Consider my patch as an overly complicated
review comment.

Regards,
Jason

