Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15F803E6C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647290.1010273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEgy-0002za-S3; Mon, 04 Dec 2023 19:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647290.1010273; Mon, 04 Dec 2023 19:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEgy-0002xC-PL; Mon, 04 Dec 2023 19:33:20 +0000
Received: by outflank-mailman (input) for mailman id 647290;
 Mon, 04 Dec 2023 19:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rAEgy-0002wn-57
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:33:20 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9497360-92db-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 20:33:17 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso11786701fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 11:33:17 -0800 (PST)
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
X-Inumbo-ID: f9497360-92db-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701718397; x=1702323197; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bpxM4hLK4WGKwUO3Qa5qRxTSXt9Rg90KE0V/M9a+CE=;
        b=hE2PzX4K6VuKqbVP07nsvVsW9vrTtlz/MDCkV1QuHm3VboXAhKezqw3UkrQiOH2vVv
         L9wPcpk/qdn7PjsRigUGPC58zsLHwTTt4QyfDYu4S+lOudyw8/zwCc3EqrAos7urOSkn
         0ag1fb70Eh0YMx2itMibIe353XhBYoNAnNI/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718397; x=1702323197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bpxM4hLK4WGKwUO3Qa5qRxTSXt9Rg90KE0V/M9a+CE=;
        b=GY48B5/uJi6OKNY+9b+HllrBBxo/Co38FZX0d8J0rTrBFno01KYhGgcBYSlB5orMoP
         iUGkrsZdaBvPRqmj+zdg8H5kLWZV1EB+eWHeNuW4MyEOgSwbQZRuNCfzm+R4e2A7PO1U
         1BuRWlMoQlAaIt5/EF7RNtsu1jv5olB2/+NQQ0A3AHoIz62rv7vAf1+F4g7wWlD2ELB7
         rLPVE1B/sgPJLLY5b70gx2YDY+nH2eDG3OD2Lsg+DaBtJSx3OBHZDIEt8CGgLMEfKhbY
         z6L54D4kR3Pbt4wRm+C70QRN2rHEoAT6UNzFklpaRjfDAd4Q+a5OtefRZBe004AyLXzS
         qIlA==
X-Gm-Message-State: AOJu0YwldHR1Rh7BYwIP8q2PrNduCWBhdifChmXmsOdHLPZB1qd21Et7
	qqnlh8xXgbqtfjMEEx4GG8Z+L1z27YCaTEa/4kkw9A==
X-Google-Smtp-Source: AGHT+IGatogwaod5sgFI0d57lf1sC5URkabiSKZHB9VbDR9jEZkBBt3xAl6eOhY5feshfpT2/tAGabK3EZFaLPXtNFY=
X-Received: by 2002:a2e:8341:0:b0:2ca:41b:74da with SMTP id
 l1-20020a2e8341000000b002ca041b74damr953760ljh.4.1701718396821; Mon, 04 Dec
 2023 11:33:16 -0800 (PST)
MIME-Version: 1.0
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com> <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
 <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com> <cd4b8857-ad69-489b-9a4f-63d53c4d360e@suse.com>
In-Reply-To: <cd4b8857-ad69-489b-9a4f-63d53c4d360e@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 19:33:05 +0000
Message-ID: <CA+zSX=b0fVbRcyonZ3axXfbS6Kaw_kKTebNBhUie6C555JbLvg@mail.gmail.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, 
	=?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 2:44=E2=80=AFPM Juergen Gross <jgross@suse.com> wrot=
e:
> >> Personally I prefer to keep the "goto out", rather than duplicating
> >> the rcu_read_unlock().  I'd yield if Jan said he preferred
> >> duplication, however.
> >
> > I'm on the edge there actually.
>
> In this case I'd prefer it my way, as it avoids having to scroll down to =
the
> out: label to see what is happening there. Additionally it enables to get=
 rid
> of the ret variable.

The issue is, suppose we change something else, like needing to grab
(and release) another lock?  Sharing the exit path makes it easier to
avoid those kinds of mistakes.

 -George

