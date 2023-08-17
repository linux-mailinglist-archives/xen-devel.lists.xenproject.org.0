Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55277F63C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585367.916454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbwq-0005uZ-OJ; Thu, 17 Aug 2023 12:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585367.916454; Thu, 17 Aug 2023 12:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbwq-0005rz-LZ; Thu, 17 Aug 2023 12:17:56 +0000
Received: by outflank-mailman (input) for mailman id 585367;
 Thu, 17 Aug 2023 12:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+W=EC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qWbwp-0005o2-Sq
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:17:55 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18512d98-3cf8-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 14:17:55 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c93638322so184921366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Aug 2023 05:17:55 -0700 (PDT)
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
X-Inumbo-ID: 18512d98-3cf8-11ee-877b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692274675; x=1692879475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyGu2tmQwe2b5D7VbO24y947d2slAAh2NIefrQhG5/c=;
        b=VvbCEs21FJNZVaIGvRvJJtJITTfhxL3/t0kfscGym5j6TdpYPLH7E0MuctsvNP4bY4
         g4j7MYjP6OJip5ztMNALW4wYHPeHGGHgjZQ0OgkhXDK4V0gUB1pmcUE5laLftZEDQ4Yw
         yLjwg+V2jhSB+VZP1qPKo6IlpHCpCqmobEHr45xirf+bnFJIMAq4xp9OAH0sH1gTd+M1
         4PxCBRKjPQ2P3IU0mt/Io4QaxtypNZujZrebNBtWmlGB8mjXrKnDHi0LrjchzM64Jz+q
         8fixaTJPSRX8qFSlbX++OHpkgGOOlmYG9g6CLqaMssOzysSdksXoDD6p2nTEckd2dDv5
         6L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692274675; x=1692879475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyGu2tmQwe2b5D7VbO24y947d2slAAh2NIefrQhG5/c=;
        b=Y3/6n+gg0zE75Il8lktvqAKJ9kw1neYq6ct5vZ2vWdiVKstI0bVIGaXauNME2InCEM
         0NxNHKZQ/hOzXjaLorQb2XWK7odvGQjjMFIEBEXskaaBHJh61DF7Gm5UHjuLt27mN47i
         gMA3iwaBhVmZuzr/N2LHcU4iQhfw69ua+BjBUhSe74xOEYiH3LOWRKCRJrVBUxLvo0NU
         JsUwfnz6ohXUHQfc91vww+2K56hrf4CzeCC+DpauHUdJpCBdHhxUyRivTgyfEQBMuQ/H
         +FGjzBVHhRL9wkEkGF50C/Mk0u1ZlKG4KzvPOf8i/7lYfj2bz6xGbaFHW5Gq1U5sY87e
         9yzw==
X-Gm-Message-State: AOJu0YwTWwuw6LxUjYitb9Ay4YGtsiqY3VDLZuY7Fld0sQozwM2ZfdhM
	h1IMJiL98MQAcWXB963/f0lnkDzu6jaarJ81LKGqh4bI
X-Google-Smtp-Source: AGHT+IGGzBRc7FYcPSgN1rCHDPezZ0yAPDcW6psVS3/fH2IBeU18LlTvCvbxMRYIbC+TbW3/KAEYNuyp79+321d79gI=
X-Received: by 2002:a17:907:847:b0:99d:f274:316e with SMTP id
 ww7-20020a170907084700b0099df274316emr2970709ejb.2.1692274674596; Thu, 17 Aug
 2023 05:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230816190425.8160-1-dpsmith@apertussolutions.com>
In-Reply-To: <20230816190425.8160-1-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 17 Aug 2023 08:17:42 -0400
Message-ID: <CAKf6xpvpHq5vBHm20snGr+fgu78Kviiwne2JVcxrESXStDs2Mw@mail.gmail.com>
Subject: Re: [PATCH] xsm: removing inclusion of byteorder.h
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:05=E2=80=AFPM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> This is to complement patch 'common: move Linux-inherited fixed width typ=
e
> decls to common header' by removing the unnecessary include of
> 'asm/byteorder.h'. In the process of removing these includes, the orderin=
g was
> corrected to comply with current coding style.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/xsm/flask/ss/avtab.c       | 3 +--
>  xen/xsm/flask/ss/conditional.c | 9 ++++-----
>  xen/xsm/flask/ss/ebitmap.c     | 8 ++++----
>  xen/xsm/flask/ss/policydb.c    | 9 ++++-----
>  4 files changed, 13 insertions(+), 16 deletions(-)

These four files all call le32_to_cpu(), so AFAICT, you are trading an
explicit dependency for an implicit one.  Is that what you want?

Regards,
Jason

