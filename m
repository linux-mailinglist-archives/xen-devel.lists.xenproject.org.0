Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EEB35954
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094216.1449559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqI5-0003kO-Vt; Tue, 26 Aug 2025 09:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094216.1449559; Tue, 26 Aug 2025 09:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqI5-0003hl-T7; Tue, 26 Aug 2025 09:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1094216;
 Tue, 26 Aug 2025 09:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqqI4-0003YB-9n
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:48:32 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2ac19bb-8261-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 11:48:30 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55f499c7f0cso1476886e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 02:48:30 -0700 (PDT)
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
X-Inumbo-ID: d2ac19bb-8261-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756201710; x=1756806510; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scb/IjM2shtIHt9HmdY5L/jlVhJX/pdj0Owy7R6WES0=;
        b=BY2JbMNwcECHn9wGyJ14+Z2j3w4d0+M5zXoofQCr3qcsDf0uDbyn8opkZQ42q7Vn9M
         ai7seSoZ0jG+BIAaf9SfsPvsa4YFYEq3lCLJNCrTvrsKpnRFE1je7hURvOKzcH/0yebh
         DoYUx0G/8rUcJy/ija0Cwd8L1czzyoFOxETvjBbvTjIR7tLVFfdAF7dgtF5YxmUbK5G8
         QoKgjjRRq7e6qdhYcNfyVqyJN7A6aG0PRBcSMhvRf21nBLjy62d1Yl5DQG5dThh5EbG/
         TBtsqsoy4RZo9xAiWB2a2ndD9nJmIsgV+0L3/cTGn6TX3VVJ9RhS5F5HI4oAh+q+LxJd
         Y38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201710; x=1756806510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scb/IjM2shtIHt9HmdY5L/jlVhJX/pdj0Owy7R6WES0=;
        b=UByJCXV4645x/4Bkp9U6V8us3X5VQvOej+oEI7uyItTYBiLfx3fLp2v9F86DnFKYMT
         ytUe8hUuleG9qq7D1LELRqts4MzaBCyincydacA+2iJVkVHKZ3uzRLqhqCYYx8uYiYNx
         h/XQIYlfR6Tj7IkMkdXXVtA6HHxpvMjJ1yjs3tY+8bOj1GZByQrTWWA0aEqeFF4VqMeR
         nWFGfeuUNJGBZJR7HU1SsyMgd/NldPKpRK5DnuK/bDRLaKdayN7vefaYSx9xVC0lZQcr
         VJz/pJFX5w3SV7PAXwn+XS9AhwtV+nW3QinvQNzYfsOhYQMHYZj79YSQdlI+946E1Aa9
         DuPw==
X-Gm-Message-State: AOJu0Ywa00jaW4eXBjsyTsPoLAShlA/nMc9riUitkJ6tN7NfmPdDWJP3
	ONW+cs3CzcSsCudpB/AaBsLnLNTK1ZNgwcEmOrPBkGi11SXjMxriPe4ITBk2XMEd9bnHEqluhlh
	L8GN+mIAVmT1ZzgAy0Fm7bSlfHHN3aIE=
X-Gm-Gg: ASbGncvFmbz3TvoFsXIuZqknR2TO1VozUmS9WWGG8KjJ4Wt6XwoyVqP/uCQtCJQyjxX
	7npDnCXfWVUj99ykCMEQhJRATbhAYEdU7HsFlDxZRMjNRlvraVHhMMfC6sJcPQ60O21/iMhinXu
	Hz8SIGcASPb0zgsZcaFF3K+srUi35Sx8TANbKNhrXYl23T/Z6D7a4VjVwU3xsNQos7oO6Nhg9+X
	3heEnwI23QAfrVE
X-Google-Smtp-Source: AGHT+IEMbRSrnIFAqkIo5nmEnNcWSt0fGlP9LQYomMl5YVMvYp8B+ybwmpi4eUY71zTjJJU8Bk9gjqRwDEbyXSGjEV0=
X-Received: by 2002:a05:6512:318e:b0:55f:4ac2:a583 with SMTP id
 2adb3069b0e04-55f4ac2bbc8mr1140778e87.15.1756201709820; Tue, 26 Aug 2025
 02:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755506449.git.mykola_kvach@epam.com> <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
 <9ab99307-9594-4cbc-9c7a-b1221575d41c@xen.org> <CAGeoDV-MC65TZ74BLVDzfggQoeKXTKB-eVaadUoDB9iuP7TW3Q@mail.gmail.com>
 <67d58304-146e-480e-a689-440afe7828aa@xen.org>
In-Reply-To: <67d58304-146e-480e-a689-440afe7828aa@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 12:48:17 +0300
X-Gm-Features: Ac12FXzNZuyVmFBkbumG53KdnohdMoKCOm6PARfzayij070L9GjEI_WMTANPAfU
Message-ID: <CAGeoDV9GQ6v8T3dqit_Xhpud1g=q8M35nJ7q1QQSN4fjgyiyEg@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 12:26=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Mykola,
>
> On 26/08/2025 10:09, Mykola Kvach wrote:
> >> Shouldn't this be removed so the check also apply for 32-bit domain on
> >> 64-bit system?
> >
> > AFAIK, this question was already addressed in a previous version of
> > this patch series:
> > https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/0=
72270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam=
.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
>
> Sure. For 32-bit domain, in theory the top bits should be zeroed. But
> AFAIK, there is no harm to zero them again and it would avoid someone to
> wonder why this is protected by is_64bit_domain().
>
> So unless there is a strong reason to keep, I would rather prefer if we
> remove the 64-bit.

Understood, I=E2=80=99ll remove the 64-bit domain check as suggested.

>
> Cheers,
>
> --
> Julien Grall
>

Best Regards,
Mykola

