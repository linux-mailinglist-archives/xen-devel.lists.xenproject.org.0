Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107207CA0F4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617311.959818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsIIO-00089W-M2; Mon, 16 Oct 2023 07:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617311.959818; Mon, 16 Oct 2023 07:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsIIO-00087q-Iz; Mon, 16 Oct 2023 07:45:48 +0000
Received: by outflank-mailman (input) for mailman id 617311;
 Mon, 16 Oct 2023 07:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dMeS=F6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qsIIM-00084n-Id
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:45:46 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0331f853-6bf8-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 09:45:44 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c51f5a1ecdso10022461fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 00:45:44 -0700 (PDT)
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
X-Inumbo-ID: 0331f853-6bf8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697442344; x=1698047144; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+peydpvmQo2JrSbTCthAGMaKLnXT+2glwsPZ2zeC+0=;
        b=IQJepJhv0YdaSMQWKZXJmXGlcyABBkjvkbgR5jGgq9jV4eh4V+JmKt5Vpq0tnenCEG
         teUQG4s23uMTAj/kQaHpyJbDjf6Q3AUlOxH5FSjh6x4WUTLsdtG20Fv5qj7fM+1Hp9UB
         VFKvu8+MBZvEwzpTFDX+VtbUmqhSeLLqn+WCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697442344; x=1698047144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+peydpvmQo2JrSbTCthAGMaKLnXT+2glwsPZ2zeC+0=;
        b=lTag7a3meDXQSPVgz4nbBT7K9TeYGpBry2bN9jZH0eAVys1QcLn5bAIW1mnNP0DlXs
         hbmVdQlO82O95FysWZmpKBsheNz9wtRSjDz4qExPzrGyf8JB4N5Az0DFXE2UqEmn0geL
         gnwFpZApO/YybwVQH53ROH56h5X/wlJ6ld4AceGAYUaazEsoeLRahBCpAoiXcyfZ8T+J
         o/l/8Zye3jNIZk0ACDVCNCfO9Lz0HhWjL15rHfurugvY6dcs5+ARNn2m6hAgMS7vOMaw
         pSTnLYNKjJJVJkSf7J9os83AMiiJk+dB96w0HgEYSnV205R1eTBRmg403BoY87vgXr7h
         NwkA==
X-Gm-Message-State: AOJu0Yw6rsrT7I6fOB1K/65JMfWg4XxtusS32YDFPCviVNxqyJO0gL7y
	9l9Gp6DTGbYsv/CXIjSiQ+elTx9FNdQwut968hA+vg==
X-Google-Smtp-Source: AGHT+IHmYSEHRRGxD7qygWaTapruGMR0e+Lu1gZbMZyh7gD74T9iMsrJz2A5w/QVr0HZ8yurEGF7uGLml7E4olFTGnE=
X-Received: by 2002:a05:651c:10ac:b0:2c5:9d4:7370 with SMTP id
 k12-20020a05651c10ac00b002c509d47370mr4145024ljn.12.1697442343980; Mon, 16
 Oct 2023 00:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231013230624.1007969-1-sstabellini@kernel.org> <28143c17-2562-43a0-9796-644fd50a1dd6@suse.com>
In-Reply-To: <28143c17-2562-43a0-9796-644fd50a1dd6@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 16 Oct 2023 08:45:33 +0100
Message-ID: <CA+zSX=Y_40RMvCv8x4o-LQk+RCAJekrYisMD4FLqEYuN49=tzw@mail.gmail.com>
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less domains
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <stefano.stabellini@amd.com>, julien@xen.org, wl@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 8:38=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
> On 14.10.23 01:06, Stefano Stabellini wrote:
> > +             /* Notify the domain that xenstore is available */
>
> Please add a "." at the end of the sentence while you are moving this lin=
e.

CODING_STYLE explicitly allows the omission of a '.' when a comment is
only a single sentence.

More generally, in this context in English at least, a comment seems
to me more like a sign (which should not have punctuation) than a
normal English sentence (which does).  As such, to me the period
actually seems wrong.

In any case, CODING_STYLE was modified to avoid having to spend time
arguing about this sort of thing. :-)

 -George

