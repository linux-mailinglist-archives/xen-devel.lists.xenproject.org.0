Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05AD7A951B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 16:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606484.944415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjKS3-0006y2-Nb; Thu, 21 Sep 2023 14:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606484.944415; Thu, 21 Sep 2023 14:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjKS3-0006w2-Ke; Thu, 21 Sep 2023 14:14:43 +0000
Received: by outflank-mailman (input) for mailman id 606484;
 Thu, 21 Sep 2023 14:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqFj=FF=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qjKS2-0006rO-Qw
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 14:14:42 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 349fda6b-5889-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 16:14:41 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c00df105f8so17194281fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 07:14:41 -0700 (PDT)
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
X-Inumbo-ID: 349fda6b-5889-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695305680; x=1695910480; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TErzemIwiGFoTA4/sKwsvLL1DO6ofzZDAEdf6+HqL8=;
        b=B9ouuFnD7vLTLZuhaohb6ki64PsBGtKj4dru7lztmpUOlgfUm5KmnTEM6VIJz53AU9
         9oe2DFU391+JgcpFMo6qMeizqjvWwCQCsGlGEFWM2iA+yzSkuBu0xIZ00vRuiDs+fyn7
         rmtEFlfMju06TjCAGVaNK/H+H3AI4JC8+hxT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695305680; x=1695910480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TErzemIwiGFoTA4/sKwsvLL1DO6ofzZDAEdf6+HqL8=;
        b=iqdYrSgSA0aJhqvmsbV8GlKr4T889qX1aMkIZy94swdlQ/Hme0UZhvJxhZeOzqA61l
         qX63LAopVEfAUj6nue04NjDFQLJCFBnCWPimdYplyswCYrFyEEVcnyGnBtBpC7W6QH/T
         +arvhj7zSxokhfCYz3eVTq0LFOXm+eZh5W1T4KKwv2ML7a17zrlI24UgL2wj27BbW4o6
         uvnRVPKfIf/kJ1lYi27ALH5PVsPuhxcuWDQmoxou40+RiD1DdihGePI/qivGIXHkIyDU
         kHTCeR9SMW/tPFzci5Q4E3f1Wzuppmizo2UzPxMn1BYXQkbKDaNDmXey/fY+ISoHoLx5
         vH/A==
X-Gm-Message-State: AOJu0YzCT8d0555j30BooNKsQDZhP2IJwD6IP+dN7M+RwRp0RKo10831
	vzbDT0xc0RhRIj8MsdQtqbJUaBtAt3R5gmIoiD4aUC43TTvs5Orzqz8=
X-Google-Smtp-Source: AGHT+IF/IjGjQ4CccY72embJ0E7J5SOhaEHadQOj4xJSECL/NYhZUXY8JBLn2grNTu1cD6r3UbgbFjX2fg+Qi9m1Wek=
X-Received: by 2002:a2e:8746:0:b0:2bc:e961:a383 with SMTP id
 q6-20020a2e8746000000b002bce961a383mr4408637ljj.52.1695305680489; Thu, 21 Sep
 2023 07:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230921122352.2307574-1-george.dunlap@cloud.com> <20230921122352.2307574-2-george.dunlap@cloud.com>
In-Reply-To: <20230921122352.2307574-2-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 21 Sep 2023 15:14:29 +0100
Message-ID: <CA+zSX=bmb5c3LR4u63kaZCBuMK1tvzLxaw=yenerrsV0=61XVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Marcus Granado <marcus.granado@cloud.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 1:23=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com> wrote:
>
> On large systems with many vcpus yielding due to spinlock priority
> inversion, it's not uncommon for a vcpu to yield its timeslice, only
> to be immediately stolen by another pcpu looking for higher-priority
> work.
>
> To prevent this:
>
> * Keep the YIELD flag until a vcpu is removed from a runqueue
>
> * When looking for work to steal, skip vcpus which have yielded
>
> NB that this does mean that sometimes a VM is inserted into an empty
> runqueue; handle that case.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Marcus,

Just wanted to verify my interpretation of the testing you did of this
patch several months ago:

1. On the problematic workload, mean execution time for the task under
heavy load was around 12 seconds
2. With only patch 2 of this series (0004 in your tests), mean
execution time under heavy load was around 5 seconds
3. With only patch 1 of this series (0003 in your tests), mean
execution time under heavy load was around 3 seconds
4. With both patch 1 and patch 2 of this series (0003+0004 in your
tests), mean execution time under heavy load was also around 3 seconds

So both patches independently exhibit an improvement; but the combined
effect is about the same as the first patch.

Assuming those results are accurate, I would argue that we should take
both patches.  Does anyone want to argue we should only take the first
one?

 -George

