Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D5B1E640
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074207.1436876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukK6k-00071j-ON; Fri, 08 Aug 2025 10:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074207.1436876; Fri, 08 Aug 2025 10:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukK6k-0006zN-Kp; Fri, 08 Aug 2025 10:13:54 +0000
Received: by outflank-mailman (input) for mailman id 1074207;
 Fri, 08 Aug 2025 10:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvPY=2U=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ukK6j-0006zF-HG
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:13:53 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f86ffba-7440-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 12:13:48 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-30c30d2ff71so195586fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:13:48 -0700 (PDT)
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
X-Inumbo-ID: 5f86ffba-7440-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754648027; x=1755252827; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2v7JQqVkNH6NHxVDd6NoAQpyK1BmZjLSWjmc41y8y4=;
        b=JcpPRkY2qQutkJg8OQnpdgBBubChhRn8exmQGLXBQNS7Fg0tCTuYP8eev+u1zRbx86
         WHqNpFRdHLGu6St5sWBMmLYlKatOQ2YvpXoMbzNHgnWJAdqrq3kZ80gWHhdcM7ZHFUe4
         QrtwMzSDgmD/tpqWaEmayZgLR55zTvCbY4/u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754648027; x=1755252827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2v7JQqVkNH6NHxVDd6NoAQpyK1BmZjLSWjmc41y8y4=;
        b=AkzWgriV6vm66iKo2GCS9QQHnClKccT3FEgMq+1EA8c+KaAsNNjK5qWFvLeHkvKUit
         TtvDkFPpFvOJuLAiVW2aeebEdpmrfpQrh7xuVut3zjQSnLCiTcCTTEseMFszIK6QHQtL
         RCQBQMQReNdX1Aee8CZgmI2rVCC1tdrdh+sga3QnZ+JZyQGCNhvBLrvPkKHJLBNFrUyg
         8RAIxkb6ZQ/9gtxgrwQAK88oeOC+dPOiGfJkAB090kQRdRqLPNb7Jwt+i5mOvsKfHRJ2
         zd6ZDwT7FjPPJIDPzphZRLUQOSNejHpz7+gWkKr/4txqgODbVP0uIo37IgkE0kYTtZK8
         xe9g==
X-Forwarded-Encrypted: i=1; AJvYcCXH8ynw4b2+1jJ1OHK4iuaaFYgCQKXzW7qVydQUdQ7zcUXFqGt+5U7WP87hBqmTKmlyTRoh18verPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE7UAlrfvfHxdd5LiWaAAoQWZMCiDwMWRLympPlEX01090fYiG
	cQIheUd90bP+2fXneOgfPYZJ5RmtmLmqnoDgbaNIJmyXDXHWC1DMAYv+X78uo0WYBdPl0tHFLD5
	Fltf+OOA36P6jvyVgRkuRfdetlEHEkufdLI3FaGeq
X-Gm-Gg: ASbGncvvoGdHx8oVwSNvOzSlm3HP4jxPY62vWyQgzpWcvD+b16BWf+S9OHTEFcB3713
	qru2s9+iNZx/oC47aLEq74QlfYTc05B0tezqX3ZUMUquy8zK4qHaZhsy4dB7vyk9Vn6Bn5uFnhx
	mX5AlhCmepWHiuT66RmHTWzaiJpc4uG2DZs57SsDP/V2heJrtFRFxBL79c9iGVXq5i7OEtA53hj
	cH2cg==
X-Google-Smtp-Source: AGHT+IGzA9o/VLXPI90g7EVYibXu/6ZjB86/+2e9+gguBL0zs0cVp8Z8GplcNQkRIEQW7p6Js48ogvnrqB7DQ04CztU=
X-Received: by 2002:a05:6870:d09:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-30c212bf693mr1292490fac.25.1754648027067; Fri, 08 Aug 2025
 03:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-3-ross.lagerwall@citrix.com> <3010ef8a-3d07-42f5-ac66-c62b7d50f745@suse.com>
In-Reply-To: <3010ef8a-3d07-42f5-ac66-c62b7d50f745@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 8 Aug 2025 11:13:36 +0100
X-Gm-Features: Ac12FXx1fb1s7DPKqH0VDwaUtI6uOQLecJXfK4b_y5sbzdl-5Yv11ypwfMm9Vtc
Message-ID: <CAG7k0EoX-M36CT7zcyCajvmq6Oi24xuxYFudvtvbi=mHGi8w5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: Stop using StdErr
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 7:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.08.2025 18:32, Ross Lagerwall wrote:
> > Xen's use of StdErr is inconsistent. Some boot errors are reported usin=
g
> > PrintErr() which uses StdErr and some are reported using blexit() which
> > uses StdOut.
>
> ... with PrintErrMesg() having
>
>     StdOut =3D StdErr;
>
> apparently to address at least some of the inconsistencies. Perhaps
> blexit(), when not passed NULL, should similarly override StdOut.
>
> > On my test system using OVMF, StdErr is not displayed on the emulated
> > screen. Looking at other EFI applications, StdErr is just used for debu=
g
> > messages if at all.
>
> That's hardly how StdErr was meant to be used. And at the risk of being
> flamed for saying so, looking at other EFI applications (without saying
> of what prominence or origin they are) can hardly serve as a justificatio=
n.
> If OVMF doesn't set up StdErr correctly (despite being configured / set u=
p
> correctly), and if that can't be fixed there, imo what you want as a
> workaround is a command line option to override StdErr by StdOut even whe=
n
> SystemTable->StdErr is non-NULL.
>
> Along the lines of the comment further up, inconsistencies in the use of
> StdErr vs StdOut may want addressing (separately).
>

I tried to reproduce this on a few physical hosts and was unable to so
for now I'll chalk it up as an OVMF bug / configuration issue and
retract this patch. And yes, the StdErr vs StdOut issue should probably
be addressed separately.

Thanks,
Ross

