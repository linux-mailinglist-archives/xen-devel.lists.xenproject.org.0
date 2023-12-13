Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDFB81105A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 12:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653955.1020588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNbP-0005UL-PE; Wed, 13 Dec 2023 11:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653955.1020588; Wed, 13 Dec 2023 11:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNbP-0005S5-Ld; Wed, 13 Dec 2023 11:40:35 +0000
Received: by outflank-mailman (input) for mailman id 653955;
 Wed, 13 Dec 2023 11:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+hD=HY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rDNbN-0005Rz-JG
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 11:40:33 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c20ffc5-99ac-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 12:40:32 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9f572c4c5so101936861fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 03:40:32 -0800 (PST)
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
X-Inumbo-ID: 6c20ffc5-99ac-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702467632; x=1703072432; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbCoC5hTxmsD9+C7j2qIyyBRKnNV3el4/6uZNw9lgBc=;
        b=BGsLPCpIPTnwN3GZ4dlR087KVxAeIZIyyp/Y96xW1JMXGkxEKaeM3ILSYx/UbHSHge
         kuENwbbwbQHKdvsdtie3VbvaOeSNeuBJTAeISKsQ53UGum1jv+xLZ2aIm8b97DcjEw3Y
         qy6Y92d4Go1E2LQxdeOgZwWYPe/TWVdW6+u1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467632; x=1703072432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbCoC5hTxmsD9+C7j2qIyyBRKnNV3el4/6uZNw9lgBc=;
        b=tcP8VbSJ12DKW/AhrTQSRzzb8qUXkfT50Kb4cUJfmMlllxx421a+VuV5ley0F3XJZ5
         MdPGUr6jmHdbSJ6YiDFQehbaaOZHZTpn72pUVSVRukZl6O4GeSV1UART2f8Ld58zPTus
         VMdhDD5svXYtjmaHqHuW7p1NNTzgWHwsa+nOuHPvAmWwrlF/rycxvaxafc3+hv3T+Rdr
         onWNnBYZLWxWE8BXp+UC4q36c8T3BtFGn6PJfaWCcl6PwU5V1kZgA2mSxppD2rdyOAVq
         tLJiA56hOV2QHAGV4y+wzq45aFjEfjziFQ7fBs19U1d7zYwP0Aq56q+mWT65Hel8qvM4
         vg9Q==
X-Gm-Message-State: AOJu0YxBj2DXwzowLaB9gIdLQvzffJpJYpoCxTi/TiRMS2KYa34Z2TS7
	zukShV9rTa1Mbzs+8wDGigZG7G9vllxilmf9f5I2KA==
X-Google-Smtp-Source: AGHT+IFY2Sog5cENVzgUpEoRKS09COuOXOL/DO+lypPO+Dua/pH07uEMjaMjaFLYjLpdhkhOWgk6lPgIJDAawnEouK8=
X-Received: by 2002:a2e:98d0:0:b0:2ca:24f9:c55e with SMTP id
 s16-20020a2e98d0000000b002ca24f9c55emr3610170ljj.45.1702467631807; Wed, 13
 Dec 2023 03:40:31 -0800 (PST)
MIME-Version: 1.0
References: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
In-Reply-To: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Dec 2023 11:40:20 +0000
Message-ID: <CA+zSX=Yupx6bEQLTViY=CCV1N2vNdsW7UX-QtPgznjfeH_R5yg@mail.gmail.com>
Subject: Re: [PATCH] smp: move cpu_is_offline() definition
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 11:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> It's all the same for the 3 arch-es which have it, and RISC-V would
> introduce a 4th instance. Put it in xen/smp.h instead, while still
> permitting asm/smp.h to define a custom variant if need be.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

