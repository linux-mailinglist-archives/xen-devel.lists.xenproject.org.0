Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE3A45455
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 05:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896163.1304837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn8lA-0002At-8x; Wed, 26 Feb 2025 04:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896163.1304837; Wed, 26 Feb 2025 04:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn8lA-00029P-4O; Wed, 26 Feb 2025 04:11:00 +0000
Received: by outflank-mailman (input) for mailman id 896163;
 Wed, 26 Feb 2025 04:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+Z1=VR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tn8l8-00029H-OZ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 04:10:58 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad339ca5-f3f7-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 05:10:56 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7231e216a06so1000795a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 20:10:56 -0800 (PST)
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
X-Inumbo-ID: ad339ca5-f3f7-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740543055; x=1741147855; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q9srpR+ufHCOpxw7BTaNhDxMzgNbdhyJiyGSdubXPQ=;
        b=SQ5h/OPfiC8dtZJumb9U4gKiPUkrA2KTxpESHOOnjfwkdUg+sFsDiCRao9+Edgy20N
         SeQj6bAIgtMBcyMlr5pHiJrCkotAZUvr2E/6lkPQe1C8S8X/4Im8+zWKvDreRS3vMMXa
         N8oqOldKpKF0wrnZhdpBBr9C1YappCAtgtGyGVdkZeskuGOou8U1mJpOGnyJyza3rSNo
         TDu85sbdAGY7Pi0RFltD3b7UoiNZFHM+eOksoKZ6RU6ykj3k73fNDpGcsZlBltkAJXII
         IVoT+Gb4pd4psHLvavLZi/6v/bxSEEsdnkVDi2QIt99Z0jj+LHI34xlIXk0gJFrffCUJ
         Z7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740543055; x=1741147855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q9srpR+ufHCOpxw7BTaNhDxMzgNbdhyJiyGSdubXPQ=;
        b=NdseE7YOfViG1bpTFc0NcYnCAZu1Ahvm38YcZk4NrluSUj9CHFLg81nQTG6kRnX1f2
         bxeUKBYaJPCo4zBPpRZquslqCedDI8nUqiFvuZER79D1F02+5GEfseyrbL7jbpv+Vp3K
         tyxnMFvU+h8+HyZf7JMXqV/n2TlCRda9cd4G3ny8SsUxYX/axgafJEFP1xSMDjv9M9hZ
         pA0X69vP64I0neyJpiloxOrbouWxY+PasvqlOuCykNxEfXKyjtN31OuRzvQ3nbzEjT7Z
         8OTdyEpVGUPbrcLAXfDtlxNqQOId5IhqYfO0KuBnSft5VC53jIPyEkI7mJL2NUi5CwtK
         XT3A==
X-Forwarded-Encrypted: i=1; AJvYcCUNoC5yrWvszDBhdZTciDVxEoc5ylvwzkAhGdf9CRaWqAHVbKC02V1Kbf6KAusQSJsq+PAgiFAUIsk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0+6tLVNBAwfG4ti22hP5uLutyGt0l0aYmjw7Y0V4XXuZKIumu
	g8EotmD+Na7cXsv/1VSCDfmMx67KIwq9pqtD737DurW7gAYASjo6pIzaCAeyH2zYdHn3FcOMVtt
	sjss8CNqQOPeaRgZS6aGh4L8g+dM=
X-Gm-Gg: ASbGncta3ZENGCyNWE5gwrCxC5JeYhRl4ZAprQ4rvPqMfTR39xJXPpStJEF3S2WlS5F
	EstiRhjzs3pcKs3RvqdA+Q3vVr3vo9yjgX+cNDzaRxAaWXnM7K5mEbbkH9hPBvkXHJifHyhUumE
	BgT7ZGxTWE+yshQ3uoG9dcmIKyXfxaj4CjAlBu0NHGMw==
X-Google-Smtp-Source: AGHT+IEw1q3PTEd02NxlquzdLPbaCrCaTS+cdG70zv1qQ7GBBbjTx+kJZx04E150UIr8ZC07lCy1Z2zzB7I+8U6V48Y=
X-Received: by 2002:a05:6808:13c2:b0:3f3:fbd8:402f with SMTP id
 5614622812f47-3f4246cf44bmr6124882b6e.3.1740543055377; Tue, 25 Feb 2025
 20:10:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com> <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>
 <Z75lN_ShrXUGiT5e@mail-itl> <CAKBKdXh0ANyMnB2VbB8ayp64DmOnHTw8WwB4VNQ7NxjpbfV2oQ@mail.gmail.com>
 <CAKBKdXi=eufqCThU0Qf8mBqJ8zXbi9NtFKJN1c=H2ow4nFoo0w@mail.gmail.com> <CAKBKdXgrRScJZ9LvOe2vbFbMyaJP4hGuFPsR=yubcicu6tAedQ@mail.gmail.com>
In-Reply-To: <CAKBKdXgrRScJZ9LvOe2vbFbMyaJP4hGuFPsR=yubcicu6tAedQ@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 26 Feb 2025 05:10:43 +0100
X-Gm-Features: AWEUYZmuJ7OLLHbtqbRvrj4ZmEa_yVAIaCkjgUeO2ZS4TQppDG-I_aVoq781TDg
Message-ID: <CAKBKdXjVKX7pwXVTu40iYN3_FoOMJ0vuFXNecnGVngJwrHBtjQ@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:46=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> This is just a wild guess and it might be wrong. But clearly,
> something weird is happening around IPI during the xl save process
> that Windows doesn't like.
>

After carefully examining the crashdumps I have finally found the issue.
I looked at the stacks of the other cores and in both dumps I found
Shark.sys performing a call to KeIpiGenericCall.

Then it hit me - a long time ago I installed to the VM a tool to
defuse the PatchGuard - due to some shenanigans with a development of
an unrelated driver in the past.
I remembered that the tool installed a "Shark" driver -
https://github.com/9176324/Shark

After removing it from the VM, the "xl save" no longer causes problems.

Xen is innocent.

With that said, I'm still seeing errors during "xl create" I have
mentioned at the beginning of this mail chain, e.g.
libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: qemu
command-line probe already exited

They seem benign - they don't appear to disrupt anything. The VM is
created normally. But I have no idea why they show up.

P.

