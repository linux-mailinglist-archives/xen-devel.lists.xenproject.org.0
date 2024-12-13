Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A39F0CA7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 13:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856668.1269217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM53Q-0002yc-Ae; Fri, 13 Dec 2024 12:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856668.1269217; Fri, 13 Dec 2024 12:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM53Q-0002wz-85; Fri, 13 Dec 2024 12:46:00 +0000
Received: by outflank-mailman (input) for mailman id 856668;
 Fri, 13 Dec 2024 12:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM53O-0002wp-5o
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 12:45:58 +0000
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [2607:f8b0:4864:20::d2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 319baee2-b950-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 13:45:56 +0100 (CET)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so51235039f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 04:45:55 -0800 (PST)
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
X-Inumbo-ID: 319baee2-b950-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734093954; x=1734698754; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP/HHVlymalsIk/eJX6eEgaI5TLf71EpIA7DRChZFT8=;
        b=2fz2rfyCJsja711HL65rXRAgyrcnTM+Dxptzv7z5Xm3qLNsEJnn0S5kvAaNSwxGZg7
         7pVLxXVLNVznvgDrky4B0U2HQs/KrF8L13DR9dVs+9ez6pslOWnSqxVbMiZ1MUojhJYc
         aRKsxR0g03Cq9X+lrNRb5+zTJTAmsq8bLgIHwVY/QZORb19frPUL2ahuT8RLsGQbJmpG
         quHwbP0xkqmyXe7Vluw0YDzWFvsZGC37yvi0k/jhPOEamSdWME/+OxD0UWITAgpf9053
         cD+75n0qREC9453VEpfozCSqLWLSAXlT8KI/978UX3Xlx5Q2QDyHqHPn68TZ9iU2QGyj
         YItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093954; x=1734698754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fP/HHVlymalsIk/eJX6eEgaI5TLf71EpIA7DRChZFT8=;
        b=b70ZJM8t2zgRMZ5olBrL3OvgtoSqV1IvPP9t9SNQGKbg7ZeNcir3IBoVguML9ZfGTh
         t5NfDS7WXFaPpxvbBd5fvP/ZwWGwyohXViYA7BFbQbkZ5IyVzcIInkOHmFUqe0p8zrbV
         BHMQBX+zZKCeuALUdTbGenHESS4E/2/jxAL+QfFS0JVFOmcD4Io/NPZtMRAFgzMOpL4k
         6OWXB6yrc/LDEwOlOUrfGhsqsuUe6666bbR1ICFeSFSfT1NTVZ6Hd2iQosrPNmggflNE
         T/akoKDg1Eh+o4pzvpGrXS9J0k/l/g/V5KdYX6Yot/YVThw8ByhsONTaxO4WQQAZst2q
         8stQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgKWlEdMpIt16Q1dkCjjnnwqYQRqbBTQQrA+4MsrU54zf+tRdIVgqPPqFEDtj+g4jkmHAvD9C7eIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrO6ytyyAQLlGhTHuZu/n3Ujzp5mx4bBKyxzhaEKuORKcRkI8P
	Lnae1Qp2X2f5cZelrgztx0gAvTBF7lRFiWGUNh5VFxH0XHXrsx666kDM72q5wfIiTvkejVE+riv
	BUZ0Zm8A9bJK6SU2/hgFcZooB0pDdSk4t7HkWmw==
X-Gm-Gg: ASbGncvn2s2cafrr9u+3cfc/8bRNbYDaec+xkp/AzjngVyvlhavMijvetg6gtAT4oFE
	Ohmqw6GWLR9YPLvxZStagSGEwhvAwsoTqhc0tlw==
X-Google-Smtp-Source: AGHT+IFr1FQ+KA5kfbjgDjYU+yAHc4eAh+dDYiy6PssJg9uGtT1+01F76pmmrXO0DILILKndStTahE2J1/f1YYnb/7o=
X-Received: by 2002:a05:6e02:18ca:b0:3a7:d7dd:e70f with SMTP id
 e9e14a558f8ab-3afeee787ecmr34140155ab.12.1734093954733; Fri, 13 Dec 2024
 04:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech> <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org> <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org> <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech> <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
 <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com>
 <6cb8c273-8e1d-4f34-adcc-620d4a71340c@amd.com> <CAG+AhRUFHH10daDvaqyhomCO6Yzyk4AUE_6E-53NmZU5auC9PQ@mail.gmail.com>
 <CAG+AhRVPiyG+mTQSF80ZEN5CsVW+0W0Y97d-Atrit9g2nO9-HQ@mail.gmail.com> <daeb7503-2427-4cd8-be65-152f308ec7d2@amd.com>
In-Reply-To: <daeb7503-2427-4cd8-be65-152f308ec7d2@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 13 Dec 2024 13:45:43 +0100
Message-ID: <CAG+AhRUn_0TgKS6k_WwMvEFHjF7unf=dQEYiXKPC1TtudJX0cQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 12:47=E2=80=AFPM Michal Orzel <michal.orzel@amd.com=
> wrote:
>
>
>
> On 13/12/2024 12:33, Carlo Nonato wrote:
> >
> >
> > Using paste.debian:
> >
> > https://paste.debian.net/1339647/
>
> 1. Issue I mentioned with prefixing with double underscore
> 2. Generic helper should not be named ext_regions
> 3. s/skip_size/min_bank_size/
>
> And still you need to convince others about 128MB limit because I'm not s=
ure.
>
> Imagine, that our kernel+dtb+ramdisk is > 128MB and your first bank is 12=
8MB. With your
> solution this would fail. Now, imagine that you sort your banks and start=
 with the biggest
> one. You don't care about its size. It's the biggest one so if it does no=
t fit, then that's not
> your problem.
>
> ~Michal
>

Something like that in add_hwdom_free_regions()?

>     /* Find the insert position (descending order). */
>     for ( i =3D 0; i < free_regions->nr_banks ; i++)
>         if ( size > free_regions->bank[i].size )
>             break;
>
>     /* Move the other banks to make space. */
>     for ( j =3D free_regions->nr_banks; j > i ; j-- )
>     {
>         free_regions->bank[j].start =3D free_regions->bank[j - 1].start;
>         free_regions->bank[j].size =3D free_regions->bank[j - 1].size;
>     }
>
>     free_regions->bank[i].start =3D start;
>     free_regions->bank[i].size =3D size;
>     free_regions->nr_banks++;

With that (if I didn't make any mistake) I'm inserting banks in descending =
size
order. Is it ok?

Thanks.

- Carlo

