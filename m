Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA47FD6CF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 13:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643890.1004417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8JkE-0008CE-S5; Wed, 29 Nov 2023 12:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643890.1004417; Wed, 29 Nov 2023 12:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8JkE-00088u-PI; Wed, 29 Nov 2023 12:32:46 +0000
Received: by outflank-mailman (input) for mailman id 643890;
 Wed, 29 Nov 2023 12:32:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZl0=HK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r8JkC-00088k-WB
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 12:32:45 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63af2194-8eb3-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 13:32:41 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bbb79f97cso864040e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 04:32:42 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05651210d000b005091492ac3fsm2156339lfg.175.2023.11.29.04.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 04:32:40 -0800 (PST)
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
X-Inumbo-ID: 63af2194-8eb3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701261161; x=1701865961; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YvnBl+R1Ju3ql1RLrxPAVAWkXan19QwniUK/LuxsjbE=;
        b=bIcWWL7lALWtqWOzl/zUN2cz4sVdd1zTqBCt61DZ7TvmvLbtw5Dp5qS68nVh2tNi0Y
         CIemsfXs83cBrHjQtvUauBe9nylV/j8Gmhc7ldCp7Pn3uulTmIOqXDPupM7R92usR2Ts
         EZnydIQhTnR4AKJBg7b7zSRnUhFTqo/oJ1xHTVU/ZFCeqTWU5VK11BaWLM8tp0cd7L4w
         TP03kmfFkqJ8HEQLZHkvQ/1YiKpfN3kZEIrdVMDQa0/UN9jAiVUwKk7eQLXnIW/4OE6a
         TcTy+uCZFUxkdIgdgssVDmxWWo5CeFUDOCV3Be2IWzX6Dg476fkL4ysnpRpSq/xuMEZG
         sWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701261161; x=1701865961;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YvnBl+R1Ju3ql1RLrxPAVAWkXan19QwniUK/LuxsjbE=;
        b=JouUUQaKEeEuPz+FLgL5tv9VoWc4PYMXBIk0smTJnBzAKHu13l4E2+9o0mRUb7aCkE
         heePw7mAcO9U/GlXpWVWyiA+82BuztrZQq/EgG7JC7DxA9EO/XOa+FPq/yZQ+aPdpacm
         9IqkFH79POCpwzWEQ20KzFz07qf92I0GAAz+GYxfBTo/nSQdDEtMdh/e9OQ6ozHgMxAJ
         tZrjNjEvYVtLyOeawjzNTAWe2TIQX29gp2c2eWQbP1VkjvucV975vWrYOU42WzHU7jCn
         tHAHD36ulVsR+n+asZrTmHCptO+3WkkONTzax0GkJZfxItKPAib80JjKFjUbsFTeBoh2
         ZHNQ==
X-Gm-Message-State: AOJu0YzegaQ3/nzVDOtrDQHHfpgUsvbS9x3z/xH45juVb6k0lobygIZN
	25XlFoGEothFsxwCe7HV4lc=
X-Google-Smtp-Source: AGHT+IEUkvY9ziKeRRK5GKubUhrlyA2x6ATxHbZUd9EcKh533s06TCGNBkHe1XziGPsG8AI8CIrr0g==
X-Received: by 2002:a05:6512:110f:b0:50b:b6d9:50d9 with SMTP id l15-20020a056512110f00b0050bb6d950d9mr2162136lfg.26.1701261161220;
        Wed, 29 Nov 2023 04:32:41 -0800 (PST)
Message-ID: <794fb8f49155751ea01ee2aad7a4ffbdf6f033c1.camel@gmail.com>
Subject: Re: [PATCH v4 00/14] Introduce generic headers
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>,  xen-devel@lists.xenproject.org
Date: Wed, 29 Nov 2023 14:32:39 +0200
In-Reply-To: <307eb136-8edb-4c8e-8256-eabdfcdb9260@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <307eb136-8edb-4c8e-8256-eabdfcdb9260@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Wed, 2023-11-29 at 10:25 +0100, Jan Beulich wrote:
> On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > Oleksii Kurochko (14):
> > =C2=A0 xen/asm-generic: introduce stub header paging.h
> > =C2=A0 xen/asm-generic: introduce generic device.h
> > =C2=A0 xen/asm-generic: introduce generic hypercall.h
> > =C2=A0 xen/asm-generic: introduce generic header iocap.h
> > =C2=A0 xen/asm-generic: introduce stub header <asm/random.h>
> > =C2=A0 xen/asm-generic: introduce generic header percpu.h
> > =C2=A0 xen/asm-generic: introduce generalized hardirq.h
> > =C2=A0 xen/asm-generic: introduce generic div64.h header
> > =C2=A0 xen/asm-generic: introduce generic header altp2m.h
> > =C2=A0 xen/asm-generic: introduce stub header monitor.h
> > =C2=A0 xen/asm-generic: introduce stub header numa.h
> > =C2=A0 xen/asm-generic: introduce stub header softirq.h
> > =C2=A0 xen: ifdef inclusion of <asm/grant_table.h> in
> > <xen/grant_table.h>
> > =C2=A0 xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
>=20
> I've applied what I think was suitably ack-ed, re-basing over patches
> which
> need further work. For the rest I'd like to ask that you do the
> necessary
> re-basing, perhaps moving in particular the device.h change later in
> the
> series (so that "easier" changes can go in without further tweaking).
Thanks a lot. I'll take into account your advice.

~ Oleksii

