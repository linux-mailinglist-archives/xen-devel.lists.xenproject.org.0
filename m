Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D67808890
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649845.1014847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDuU-0006lQ-Kh; Thu, 07 Dec 2023 12:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649845.1014847; Thu, 07 Dec 2023 12:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDuU-0006jc-Hy; Thu, 07 Dec 2023 12:55:22 +0000
Received: by outflank-mailman (input) for mailman id 649845;
 Thu, 07 Dec 2023 12:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri6x=HS=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rBDuT-0006jJ-Vd
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:55:22 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e22506-94ff-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 13:55:20 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9ef682264so8307231fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 04:55:20 -0800 (PST)
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
X-Inumbo-ID: e0e22506-94ff-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701953720; x=1702558520; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9eZGyTQww4F7GV0mTq9xrdy1qbxaPPMbQl412QVm8k=;
        b=Fp61dEk25j3WuQxn6Xj4c6YbJOJGvXTriHr2SFX66UjkCF1Opds4SFUOI67BahMfb9
         olrTfsewTfD6VDBISmlJkZs0NwS2/4oig9n/fLpY1lJh+lIG2u0aHva2xrNWU2YMhfyr
         Xmp/8eLImhN57tIjdM2zjs83G2LbidAUGUbZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953720; x=1702558520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9eZGyTQww4F7GV0mTq9xrdy1qbxaPPMbQl412QVm8k=;
        b=RkOIpCEiFTrTUDp4CIMCDnjNE8bwClWTMZm4+Wvfw1ZZUdf2W1e7Cn++eDLGTtinuH
         dkXZ17dHahBAvbJglOnmNkl8Ji2Eg0zGA57jsfJKwfhsPXugrYFSDVF4tJRt/BQteuBz
         4k+oZkjFTCcA1rcU6Gyn+TkzLXOzrTb+FHpSEU95fWg8OcsYD83XnKdkRn27bBHyamZp
         ZfRhcx0fTnRTQCdYViDf9fwkDtq7q7wNVi8lubPzlGGjrxPvbcSTzI2TLjbKcnrNYFgr
         sb0/m6mYZuVDO3TheJoBVEm02WiylHeT8jcI5PhWNo0DJck19YWiPWa2P+ObShFBQvVC
         GVOA==
X-Gm-Message-State: AOJu0YxRrYbz3oH9m9TQqli2DySr0nuNDazMe0DTx0qMQpSkE5TWiXuC
	V5nYvsU0AMOhOcgW3DR5iv3/o1mDdyAKyK/C89CQLA==
X-Google-Smtp-Source: AGHT+IGjOYd0E03GCOlJCnhIQ+K3ewbZ8mPRB4RXQ2umUKi/AnrpHTV0HI7wt+HU30isPgjCamMYmE2B+Dl6dbP9/UI=
X-Received: by 2002:a2e:86cf:0:b0:2ca:688:8406 with SMTP id
 n15-20020a2e86cf000000b002ca06888406mr1402931ljj.3.1701953720089; Thu, 07 Dec
 2023 04:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20231204152321.16520-1-jgross@suse.com> <20231204152321.16520-4-jgross@suse.com>
In-Reply-To: <20231204152321.16520-4-jgross@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 7 Dec 2023 12:55:09 +0000
Message-ID: <CA+zSX=bFDh2XUnJko3NfLxcq23K3WmFaX35n5-+M+k_5YJKaDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] xen/sched: do some minor cleanup of sched_move_domain()
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 3:23=E2=80=AFPM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Do some minor cleanups:
>
> - Move setting of old_domdata and old_units next to each other
> - Drop incrementing unit_idx in the final loop of sched_move_domain()
>   as it isn't used afterwards
> - Rename new_p to new_cpu and unit_p to unit_cpu
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

