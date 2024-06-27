Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C991AB3A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 17:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750217.1158478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMr2Q-0000p4-83; Thu, 27 Jun 2024 15:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750217.1158478; Thu, 27 Jun 2024 15:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMr2Q-0000nC-5U; Thu, 27 Jun 2024 15:27:54 +0000
Received: by outflank-mailman (input) for mailman id 750217;
 Thu, 27 Jun 2024 15:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NNyG=N5=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMr2O-0000n6-M6
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 15:27:52 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf90b468-3499-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 17:27:49 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-25d57957b37so1079222fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 08:27:49 -0700 (PDT)
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
X-Inumbo-ID: cf90b468-3499-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719502068; x=1720106868; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0Qw53IU5ENt3GoeaIEHlWBuk/kuwVhNuf26iyhfUC8=;
        b=hu4j7cZZapsqpZLPebFNBtfjGh0MEa031+5qcNJQs82PFAJcq5mFmMxh6NKe+VOV1E
         FEnQXj1osNrkY20CIDnmyuOR9tQwGmXJEk0AB7YAvHNbv7s1GGYxQ5jIiNZxCDWelswL
         cEQkZOoSHJOvUFNoNUMiTkXv7Yq3nyPZ7fE6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502068; x=1720106868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0Qw53IU5ENt3GoeaIEHlWBuk/kuwVhNuf26iyhfUC8=;
        b=QNx/RisW0+4odMsqMu5te7/6WNS1anrJUWeHbEeaDqPygNZLdG17WoUKaWBvRcvTTC
         +cT45PQCK+fLFPhVEMXljQ1VrllilRYlkXctSAa4S/nsajtGHGTg7RpjBi/i1gSE0iYX
         rKjYRT0kI5cgnHlzdV8GlZrwJg5n1pNziQvfo+KQu+uQtIihsJCp76EMlfcder+6/w/n
         H/AWAQWol1RFyqC6uqI3RIYbQKBF9sBwTPkZYEYZL1QSi9PkW2duX3m73WQH246ceQ72
         ZhxFs/y/roK7cTH6OAIrjF9/ZFvpM45LVV2aV1ShrLQGwwl2ksMjW+rKdU6vZQGdwf28
         z+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBUra3tDBlTFIc3wN0zN62PtcoZuEw0dIoMie4RJt/OiMF0Xz1q3YwTJHYCvaS9sOEPwm8mNkp4Y+sfU2ApMjurntnZIm3nS6jzetjQmk=
X-Gm-Message-State: AOJu0YyqvlVe8rwTBYgmbghBwjxfyVLC4hMTeuyhSHX83szqCP5AFcmR
	IEXsSyUXdh71gjm8vDodUTevKMI+vRFdFwyj141r4w/SmFHfxb2QudvI4uBsBYsh7fKbp87kAot
	26i2UgwJB/WyW+hEF8R2hXRM6PHB2uQ7Zj1uSAw==
X-Google-Smtp-Source: AGHT+IFFTK4owjDhbyTrPH7JUoWcKaMK2NNl7L7xjyVvxc3ECnnOf8ie4WoZRtaz1rUkn4SApqoqIWBRI10qDkGXtKk=
X-Received: by 2002:a05:6871:58a4:b0:258:434b:729e with SMTP id
 586e51a60fabf-25d06bc7f2dmr13979378fac.7.1719502068386; Thu, 27 Jun 2024
 08:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <f14f2c5629a75856f4bafdbff3cc165c373f8dc2.1719319093.git.oleksii.kurochko@gmail.com>
 <4a4e37a9-eac7-4e72-8845-6b4bbd7bafe6@suse.com> <c52181a7aca8b56716d7ee354ebda9d32e67816c.camel@gmail.com>
 <f324a4f3-b64d-4b20-92d0-8cfea050d44a@suse.com>
In-Reply-To: <f324a4f3-b64d-4b20-92d0-8cfea050d44a@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 27 Jun 2024 16:27:37 +0100
Message-ID: <CA+zSX=aO2vDh8mv2OSwUxWkAzPtE-FkAP426nXTz5e78OmRF9A@mail.gmail.com>
Subject: Re: [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 11:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 25.06.2024 18:23, Oleksii wrote:
> > On Tue, 2024-06-25 at 16:25 +0200, Jan Beulich wrote:
> >> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> >>> During Gitlab CI randconfig job for RISC-V failed witn an error:
> >>>  common/trace.c:57:22: error: expected '=3D', ',', ';', 'asm' or
> >>>                               '__attribute__' before
> >>> '__read_mostly'
> >>>    57 | static u32 data_size __read_mostly;
> >>>
> >>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> >> Acked-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> If you give a release-ack, this can go in right away, I think.
> > Release-Acked-by: Oleksii Kurochko  <oleksii.kurochko@gmail.com>
>
> Thanks, but actually I was misled by the subject prefix. From a formal
> perspective this really wants an ack from George (and mine doesn't
> count anything at all).

Acked-by: George Dunlap <george.dunlap@cloud.com>

