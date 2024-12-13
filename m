Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565469F0B38
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 12:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856595.1269167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3vl-00082S-1g; Fri, 13 Dec 2024 11:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856595.1269167; Fri, 13 Dec 2024 11:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3vk-0007zr-V0; Fri, 13 Dec 2024 11:34:00 +0000
Received: by outflank-mailman (input) for mailman id 856595;
 Fri, 13 Dec 2024 11:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM3vj-0007zl-DZ
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 11:33:59 +0000
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2443fa97-b946-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 12:33:58 +0100 (CET)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a815ed5acfso5650755ab.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 03:33:58 -0800 (PST)
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
X-Inumbo-ID: 2443fa97-b946-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734089637; x=1734694437; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CnpqPdvmC0fd8qrUabT3ZvDcK97udtTf3U/+QZUvbkI=;
        b=D0agULTL4J6cnNV+nuXXSuoS4wRTUzA9rza4Nb/wFGTrTs9nRoQhOAJ+tFsbfVZMKE
         xCUpDOJWPlWCuzXrpLUYaHuTjJgZkn8wQlla3f2t4F9FJ0ph0VITvBaBiPmbJhCP2TgZ
         QpVUURIaoeoLkgs7ZfcG8671iNk31vmb53scF2iwvcxqiCWSGQu9mL9B3Jj+z/9vOy2g
         aiKuYzlpQyrBlv4ILfp6p/STskkiMEHo61KEPbb24Z89FmFC6wxCQkMy0JzCEsh+5V+m
         t4tsHii8MSxDrokIkKM2yEcuF6xBA2r+bK8C33OOlbzTGv7+DYoXmpJBaJpPJlXoW+LD
         STbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089637; x=1734694437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnpqPdvmC0fd8qrUabT3ZvDcK97udtTf3U/+QZUvbkI=;
        b=TRNUmPKfHN+XBH9ct3la4Ed69+vbOX0x+bOxVv/PZSrgrHVOUbMY7ln5QVgS9iVL2p
         zGUsVKjtMw7dDG8CFwiRObdPKMNNRZXzYvlW9Fc2XP4+Ti8h4kqRofBL0WeZ3c23r32e
         PjlGSREhrLVEWlLPV6tYQIjJskB9WL7GzuKamgYkLaVf5WZ9RyR9+smKMvBTH8NLBVsw
         KXs1tNJgsIwFF0nhvAnSm6yAwhDiisebG980ve6Lx/poelG2gMVHX6sfQGZ9hyGgfcm5
         +LAUACPdceW2wtUmGA8a4fQ09gm+vL205ukT5mcEeE9MON886x1OVs4EQv8Jhs8PUC55
         V0UA==
X-Forwarded-Encrypted: i=1; AJvYcCXoI/3Sdq6jWoz2zM+TZPzLUThgwc7Fxphi+S8vQybNiYBDkZOijUXJ4RC+q9kj7f+N1JLWfMs9TqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw44d569NcRAv3Qs8g3JVkgteEkxjfttC41CQMHfvOhXJVV5MCL
	P14Lwa+RuwlSMFOvkxqexXIPwrQZe2YhfN6ZLgetTAhh5D3N0agX7j7gtzD+Nx3jKAQpZ7tFoZG
	F7S+YPFTEpXbSZVRfHK6Q0fi+frORLzrsaITakZUOJHbD/4oLzHUHog==
X-Gm-Gg: ASbGnctI4BeEtj0KW76CJ25+hwu4HY+NLEWCA1WexTdwSfPEkV4BDJ8vlQrK5eafaLx
	MN5EEN/lrdkTcO97Z5t1VHkl9DYloUq7mTbbNug==
X-Google-Smtp-Source: AGHT+IE9TXACnS+Yl7gW0I1j4FiDRHAqiOknphe4zM0QA6aMeq3Zj1GctXhGqM4b+xS/44Sc5x+dROMd3LDJ5hzyCyU=
X-Received: by 2002:a92:c569:0:b0:3a7:172f:1299 with SMTP id
 e9e14a558f8ab-3aff794e4a0mr28272915ab.12.1734089637368; Fri, 13 Dec 2024
 03:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech> <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org> <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org> <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech> <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
 <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com>
 <6cb8c273-8e1d-4f34-adcc-620d4a71340c@amd.com> <CAG+AhRUFHH10daDvaqyhomCO6Yzyk4AUE_6E-53NmZU5auC9PQ@mail.gmail.com>
In-Reply-To: <CAG+AhRUFHH10daDvaqyhomCO6Yzyk4AUE_6E-53NmZU5auC9PQ@mail.gmail.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 13 Dec 2024 12:33:46 +0100
Message-ID: <CAG+AhRVPiyG+mTQSF80ZEN5CsVW+0W0Y97d-Atrit9g2nO9-HQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Using paste.debian:

https://paste.debian.net/1339647/

Thanks.

- Carlo

