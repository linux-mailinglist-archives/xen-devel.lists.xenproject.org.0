Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD712A7306E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929098.1331729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlfQ-00053i-Ni; Thu, 27 Mar 2025 11:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929098.1331729; Thu, 27 Mar 2025 11:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlfQ-00052G-JW; Thu, 27 Mar 2025 11:45:00 +0000
Received: by outflank-mailman (input) for mailman id 929098;
 Thu, 27 Mar 2025 11:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFzh=WO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1txlfP-00052A-AN
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:44:59 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8cb684a-0b00-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 12:44:58 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5499659e669so876641e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:44:58 -0700 (PDT)
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
X-Inumbo-ID: e8cb684a-0b00-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075898; x=1743680698; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoZMJ9gzYnrJjo5j6EOySURaQ1LdtStF5y244u8/3pM=;
        b=QWu6ClxI0I36tVuEwFOMVaYrmqKyYfDSfXwskJV+mYfaCFT9Xxtj9B7a0fJ/x0iNIg
         hOupgWfgJxVWbfKvkrSpRrxYaubF2XUr4u5Z1wU0xyUzKQwSqzD+h36pHmJs5fnOJEHo
         uNexQ3BeGKTGCJPShErJJOtCRfDkN0QUlQp7CdT5PMljbavTXOFO5y30Ajy3eHkBvYjf
         BwHVC/BT8QQFpzXcpmPx4DLkw7EbDPel/0DKGQkH/C+63cuvEOul54yqeDop6h4k2kf5
         auDm7V/YtF2Qe7eEbEDkrBPsKixiSLZjLd/wkHaPPnAIee6yCh5IGpfztV1Qz8x9PgiU
         jHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075898; x=1743680698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoZMJ9gzYnrJjo5j6EOySURaQ1LdtStF5y244u8/3pM=;
        b=eiHQqQki7dHZSmaDgdraUtKVFCBy4Mb3fmsLjLiKiqHKjoKkij/nI1RMdl5bbYk/XC
         P0yQttlhGYXCHlkFNn0PHddRWUqUjJAzRMPhYN2HRvRT+8Bgy0cFtVrFU/ksw2jqWQG+
         yw/zMKqfIfQo29yopo7klPYofRKYxN8C91VN0FQuJYUbmDaKY8a7ZV1LQzNv2kJSqRaX
         pI98fTq3dH6ZD7veJZkKTbOqaEhn70Fni2gOabqbwUHn+7zpfYWL4Dv93e+tZUry86Rm
         kEjcgOEaifOborRB0M2oFIhutG9U7d/1bvXNP/HNRFfySexH0o/TrnurJOXKNUhGfMgc
         bZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDSOcaJI5rmyGhotz6zsbiwwx7c/vhlCJijNpag2LFY2k0UYW0mGm9HxCF0KPu42te84+H8OjvrZU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1UY6z79U1AfYXhKxEPy0ZMyBCDrWFwOqBZDGpSlR7g3cb3/NZ
	hPckb4gVOCDoaQ+G2hwMIYlFyggciHbz0aeEKdrp1aRs6mvZP8zvOGhWkvmeJiGNoJcMJUeGe1H
	+Xg3XJ0o8lueELfTLU0rijSpx0I0=
X-Gm-Gg: ASbGncs3fpblQfyN3T1jH/hjhbzpTQqbxxAKSF52UzRL7XTRo/1J1wVEeV9ZXkPK0NZ
	KKKW/fnk9q81kNDc5dMyO4zWtgbtYK7ZLowV8Dhu6kYcCBmNl7caCCYypMalgV99vFkl2OIWPbW
	1W2YgCEBtS+GIw2W0XpFi0sZ3GkQM2hMjBkg4=
X-Google-Smtp-Source: AGHT+IF+BfG0fzTwmjGMDa/i+59/Q9ou4SeFW8RGEc77dYAr09td64vA3lQ4FrM7HXbHB5DoqK0h7VzPmZhOsTxk1Fk=
X-Received: by 2002:a05:6512:ace:b0:545:2cb6:af31 with SMTP id
 2adb3069b0e04-54b011d5b21mr1554497e87.15.1743075897630; Thu, 27 Mar 2025
 04:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250327052241.202167-1-xakep.amatop@gmail.com> <a0334340-6dc9-4526-ab00-1d9bbb290de2@suse.com>
In-Reply-To: <a0334340-6dc9-4526-ab00-1d9bbb290de2@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 27 Mar 2025 13:44:46 +0200
X-Gm-Features: AQ5f1JpWm7Upcy5a8hmLICDizW4hPvJi-71zOLtjL_UGTwBdxgtbSkk2r1tMxK8
Message-ID: <CAGeoDV8kLCYO-GQw=SNF0YA4TAnQ7ppCidvR9sy99FiCD_fx9Q@mail.gmail.com>
Subject: Re: [PATCH] xen/percpu: don't initialize percpu on resume
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org, 
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 10:27=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 27.03.2025 06:22, Mykola Kvach wrote:
> > Invocation of the CPU_UP_PREPARE notification
> > on ARM64 during resume causes a crash:
> >
> > (XEN) [  315.807606] Error bringing CPU1 up: -16
> > (XEN) [  315.811926] Xen BUG at common/cpu.c:258
> > [...]
> > (XEN) [  316.142765] Xen call trace:
> > (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/=
0x1ac (PC)
> > (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/=
0x1ac (LR)
> > (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0=
x4c/0x1a0
> > (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercal=
l_tasklet_handler+0x54/0xd0
> > (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+=
0xb8/0x100
> > (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
> > (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x=
194
> > (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0=
/0x14
> > (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
> >
> > Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AR=
EA
> > only occur when !park_offline_cpus and system_state is not SYS_STATE_su=
spend.
> > On ARM64, park_offline_cpus is always false, so setting __per_cpu_offse=
t to
> > INVALID_PERCPU_AREA depends solely on the system state.
> >
> > If the system is suspended, this area is not freed, and during resume, =
an error
> > occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA=
 is not
> > set and park_offline_cpus remains 0:
> >
> >     if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
> >         return park_offline_cpus ? 0 : -EBUSY;
> >
> > It appears that the same crash can occur on x86 if park_offline_cpus is=
 set
> > to 0 during Xen suspend.
>
> Oh, also - it's not "appears"; iirc Marek meanwhile confirmed the misbeha=
vior on
> x86 AMD hardware.

I've updated this line in the commit message.

>
> Jan

~Mykola

