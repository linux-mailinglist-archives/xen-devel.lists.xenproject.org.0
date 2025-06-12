Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CAAD6951
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012457.1390909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcYv-00072w-Ie; Thu, 12 Jun 2025 07:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012457.1390909; Thu, 12 Jun 2025 07:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcYv-00070u-Eh; Thu, 12 Jun 2025 07:41:25 +0000
Received: by outflank-mailman (input) for mailman id 1012457;
 Thu, 12 Jun 2025 07:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/f/=Y3=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uPcYu-00070o-2e
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:41:24 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a36aca20-4760-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 09:41:23 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5532a30ac45so626708e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:41:23 -0700 (PDT)
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
X-Inumbo-ID: a36aca20-4760-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714083; x=1750318883; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R/5DpBaQMcdoJ68yNaTLXbkCFIgDATb9sFKj2xxMbY=;
        b=iFvGG/faa+rxpbOiLFdDvQK3uqko5w0EKPS8kLnuf7t66IMrz0cNX4PHZ7lDa10Tcy
         Fk5w0ITxZXRK0kGJ6iffVRorUWJcG1MvftIItiT6CMOPffXyBmmS+Ze0KzPSRISKC1lh
         lToGsXZnrwYD7yKwH3TmnrdSJ2tj2Yefw7SlwGHzjW3PXx43Aql7h33AWMjw18tPV7mU
         rDkef71PBuRdvAELytt5cHY+ikl9c72gW/J2htX0+5mhSTHyDk0OWWlZhHAkF+41YGh/
         UWBbXRksGF9LsSv0ry4vMODd6Y1eIWWTmMZpUmOqnP23CCL1cp/6Ooud1FKZHya1FQne
         uBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714083; x=1750318883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6R/5DpBaQMcdoJ68yNaTLXbkCFIgDATb9sFKj2xxMbY=;
        b=BuH2/AHDiU+QzMBKqj4EzfTjqEmEblXTXv7YGqjlaDJFZjQ+T62A5T19Cl8wiFbJ3k
         jZrOe0nJL3EEulTti+lQNzUnGK717L92m4nAKX7ZgLg6F/dIXXcQSBWmjYvmRTjIUa2s
         bV1LpTIj06eUhpXUGpOC//qem+n+uc0NqgNuDpd8EiUb5olI736gtSQLv2TVEGDeqc79
         aGqBqLXIV7odooDTA2zGlk7Qot8k4TWAr6r62t53hKUxnLzfYkpdg0AyTS/VURONK/96
         zXbVwW92700SjlIeVuLckb4Gu0U0mk3B1UvE+hzZtXTRWoPkxWRv4jO8GA6EIPFF+upR
         C7VQ==
X-Gm-Message-State: AOJu0YxmtxMIe3/u3LSwI1LVw1QfhWYtW/x/O4PMvF9QzPDkXfGY5Usz
	cW3us/1D9o+g5Dwg1pGp5XCLOaUn6Db9ROVpkjitUgnYjmgrRUolLxIHBWjAsGvogz1//diSpaK
	GMS2or/R5mPc/LHpVXNodYxqXSi9Nm4Y=
X-Gm-Gg: ASbGncuUnokgOvV6gxFKWF1uz3v5P0RQccV0+0N/D/KtRhhjee+QKNW8nTYD9tEahIU
	Yi5nAOP5ebBgX7QzcamU6dBGc1fnxDs70htF/eudSipFyQAgrFlz+c9AXDM7BD18yTCFTaReWRx
	7X6rmrBAd2QcJEw6rudxZLBt8piqVx1tB4Uq2ZT1Nb5w==
X-Google-Smtp-Source: AGHT+IE15WhpiWIZmuPM2+cIqV3ecsrPGs4nxGV+owduKXkpqNJap8losnoOi4wtBOdaaU6L5qffSNEN+oEiWrjB144=
X-Received: by 2002:a05:6512:b8d:b0:54e:8135:33dc with SMTP id
 2adb3069b0e04-553a545233dmr677127e87.14.1749714082397; Thu, 12 Jun 2025
 00:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <7364a71d-2604-49ca-bab7-d21544d49b10@gmail.com>
 <CAGeoDV_2BSUaL+9=zVZpgOi6vC6fcEE2Rt0Du0mTPO3pyxrR7w@mail.gmail.com> <4fb007fd-3a87-4a12-ae73-15870d7bae42@gmail.com>
In-Reply-To: <4fb007fd-3a87-4a12-ae73-15870d7bae42@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 12 Jun 2025 10:41:11 +0300
X-Gm-Features: AX0GCFuGHe-4RoSUFMXLFT2iRXLI8xNAtqy7F1aDW8eGWuHmBYdtpmDAm9J0_lY
Message-ID: <CAGeoDV8wma_xskM+zuW_4W=tecbHKU0d4dGeCr3xiLPXtZ_17g@mail.gmail.com>
Subject: Re: Xen 4.21 Development Update [May]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	Juergen Gross <jgross@suse.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Jason Andryuk <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, Penny Zheng <Penny.Zheng@amd.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Grygorii Strashko <gragst.linux@gmail.com>, 
	Alejandro Vallejo <agarciav@amd.com>, "committers@xenproject.org" <committers@xenproject.org>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 1:39=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Hello Mykola,
>
> On 6/11/25 9:03 AM, Mykola Kvach wrote:
>
> =3D=3D=3D ARM =3D=3D=3D
>
> * SMMU handling for PCIe Passthrough on ARM (v11)
>    - Mykyta Poturai
>    -
> https://lore.kernel.org/xen-devel/cover.1741958647.git.mykyta_poturai@epa=
m.com/
>    -
> https://patchew.org/Xen/cover.1748422217.git.mykyta._5Fpoturai@epam.com/
>
> * xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
>    - Grygorii Strashko
>    -
> https://lore.kernel.org/xen-devel/20250311111618.1850927-1-grygorii_stras=
hko@epam.com/
>
> * Add initial Xen Suspend-to-RAM support on ARM64 (v4)
>    - Mykola Kvach
>    -
> https://lore.kernel.org/xen-devel/cover.1741164138.git.xakep.amatop@gmail=
.com/
>    - https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.co=
m/
>
> I'd like to propose including initial support for Suspend-to-RAM in Xen 4=
.21.
>
> This feature enables Xen and its guests to enter suspend state via
> PSCI SYSTEM_SUSPEND. Xen suspend is triggered from the hardware domain.
>
> Support is currently Experimental.
>
> Thanks for your feedback!
>
> I saw that there are two patch series connected to Suspend-to-RAM topic:
> - https://lore.kernel.org/xen-devel/cover.1748337249.git.mykola_kvach@epa=
m.com/
> - https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epa=
m.com/
>
> So it seems like we should follow a progress for these two patch series i=
n parallel
> Or the difference is that one of patch series is for connect to guest and=
 another
> to hardware domains.
>
> Am I missing something?

Yes, you're right, but the second patch series (part 2) depends on the
first one (part 1).
It was split out to help speed up the review process, as suggested
during the review of v3,
in order to separate guest (vPSCI) and host (PSCI) suspend functionality.

It's expected that part 1 will be merged first. However, since
CONFIG_SYSTEM_SUSPEND
has already been merged, most of the patches from part 2 can also be
applied independently,
except for a few at the end of the series that still rely on part 1.

>
> ~ Oleksii

Best regards,
Mykola

