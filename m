Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3192E2EF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757200.1165976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpfL-0003y0-7G; Thu, 11 Jul 2024 09:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757200.1165976; Thu, 11 Jul 2024 09:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpfL-0003vx-4c; Thu, 11 Jul 2024 09:00:39 +0000
Received: by outflank-mailman (input) for mailman id 757200;
 Thu, 11 Jul 2024 09:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRpfJ-0003vn-Pl
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:00:37 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e9f3a6-3f64-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 11:00:36 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77baa87743so72723266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:00:36 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e380asm239140866b.90.2024.07.11.02.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:00:35 -0700 (PDT)
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
X-Inumbo-ID: 09e9f3a6-3f64-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720688436; x=1721293236; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zjv8MyfEPC/3Yp6c9wk9PiIfmL7uJ9UdtJiDGVezEVg=;
        b=O7ueJsMDiZP5KhsNnj/wCSvs+EJ6VUQEyOlnLdJDkiPHsuGSNKqvWaHi1VZ0p3zzxO
         cGZ71J5A7hnnnDzusw258AGPsc+wqMJvw7D4t/g2HL1iGUelPRSMUkLRPv0UsRB7Xvud
         2tS6i9qVwATDBhvfQI6mJ3I2+M/71+lR3p+xrKOHae20+3cVlWiOE60gfdN5vvd6/dcF
         5Mub8CI/5eTUG6UzeOWE0Qd7G8+/BW+SzdPUYq+uV962H3gBfXNfxikhv8GZqqfhj8zz
         4KHAsHmAHbi++OGNmTZ2ATD25v9yeo6kWpWdw5YVmIY74FT2oTx9Wv9OkcEJMnMwsc7R
         mDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688436; x=1721293236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zjv8MyfEPC/3Yp6c9wk9PiIfmL7uJ9UdtJiDGVezEVg=;
        b=dSzgHofpHdDqSaf2v5D+wi4+pOp/LXkt6KrF7il2PWtruhm6nX3PwtMQlVqHlhjZoU
         Ev+1KhrQ5MEBpeoNYl+sNjoxPOw9vHleWdkbqddQz1sUH4Yw9ReRN6uHq8NnLgbxYp91
         yRz87huEQPsVhd2XHaJ8t7fDknb1ozpXGGOdvlSFjcqRN8NeNni/BmI77Zv39RYb5mPi
         8x9t8bW4muYqUagOk1xWZZ9f1ANKegQRhezOtTTkMuzGbS+30YZjflWXP6dHzTRMh4l3
         w0b1W+f+3rEF6dT110RD7SN7yb3pWZPYIAO8krVM9azj3vskr6gcx31syux6LUuXdEoI
         SuHg==
X-Forwarded-Encrypted: i=1; AJvYcCVjggytBmpliQRf0PB2UzhUdspS/oJksscE66mgkdJj66BVBqJjWvjrCl5LkyUG+GnTciHOf9pBzwQmL0GfQ7KzxM+CGy/tYpSMpXRf3Xs=
X-Gm-Message-State: AOJu0YzEbIAsKKyrp7SF4ICYRemPhJXliZzW5xb+Dw6mSlS5+3QEmkqh
	WnagkvBXfodkjwAbuhTW4cPcnnCgLJI7vnt9efNpeA+ytooj/h3K
X-Google-Smtp-Source: AGHT+IF+qXioeAKz5ysB61QBRGdaVlunsLZpmhOJgEf3WIqQMAo0x7BlSpj9mT9oqo+NLdJT2qjKvA==
X-Received: by 2002:a17:907:94c5:b0:a77:b01b:f949 with SMTP id a640c23a62f3a-a780b6fee77mr761132466b.35.1720688436130;
        Thu, 11 Jul 2024 02:00:36 -0700 (PDT)
Message-ID: <d3b9070442e0ebca82ce0dd5257fe91eef4755cf.camel@gmail.com>
Subject: Re: [PATCH v1 1/5] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 11:00:35 +0200
In-Reply-To: <b3c5b6d3-561d-46d0-bc1b-1b2e3cbeeba2@suse.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <c656f0d08d4c4b515c99848b84db4171ab132f19.1720002425.git.oleksii.kurochko@gmail.com>
	 <b3c5b6d3-561d-46d0-bc1b-1b2e3cbeeba2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 12:23 +0200, Jan Beulich wrote:
> On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > From: Shawn Anastasio <sanastasio@raptorengineering.com>
> >=20
> > Arm's setup.c contains a collection of functions for parsing memory
> > map
> > and other boot information from a device tree. Since these routines
> > are
> > generally useful on any architecture that supports device tree
> > booting,
> > move them into xen/common/device-tree.
> >=20
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V5:
> > =C2=A0- add xen/include/xen/bootfdt.h to MAINTAINERS file.
> > =C2=A0- drop message "Early device tree parsing and".
> > =C2=A0- After rebase on top of the current staging the following change=
s
> > were done:
> > =C2=A0=C2=A0 - init bootinfo variable in <common/device-tree/bootinfo.c=
> with
> > BOOTINFO_INIT;
> > =C2=A0=C2=A0 - update the code of dt_unreserved_regions():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related changes =
and getting of
> > reserved_mem
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() ??
> > =C2=A0=C2=A0 - update the code of meminfo_overlap_check():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add check ( INVALID_PADDR =3D=3D b=
ank_start ) to if case.
> > =C2=A0=C2=A0 - update the code of check_reserved_regions_overlap():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related changes.
> > =C2=A0=C2=A0 - struct bootinfo was updated ( CONFIG_STATIC_SHM changes =
)
> > =C2=A0=C2=A0 - add shared_meminfo ( because of CONFIG_STATIC_SHM )
> > =C2=A0=C2=A0 - struct struct membanks was update with __struct group so
> > <xen/kernel> is
> > =C2=A0=C2=A0=C2=A0=C2=A0 neeeded to be included in bootfdt.h
> > =C2=A0=C2=A0 - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_I=
NIT to
> > generic bootfdt.h
> > =C2=A0=C2=A0 - bootinfo_get_reserved_mem(), bootinfo_get_mem(),
> > bootinfo_get_acpi(),
> > =C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() and bootinfo_get_shmem_ex=
tra() were moved
> > to xen/bootfdt.h
> > =C2=A0- s/arm32/CONFIG_SEPARATE_XENHEAP/
> > =C2=A0- add inclusion of <xen/macros.h> because there are function in
> > <xen/bootfdt.h> which
> > =C2=A0=C2=A0 are using container_of().
>=20
> Just to mention it: This is confusing. The series is tagged "v1". I
> understand
> you took Shawn's work, which had already undergone revisions. But
> then imo you
> want to at least clarify how your v1 relates to his v4 or v5, i.e.
> then making
> clear to the reader whether all of the changes above were actually
> done by you
> on top of an earlier v4, or whether you took the earlier v5 verbatim.
That is why I wrote "Changes in v5" to show that these changes were
done on top of v4 version of Shawn's series, so what is mentioned in v5
here it is what was done by me.

I'll reword that and probably I shouldn't drop "Changes in v4,3,2,1"
from Shawn's patch.

~ Oleksii


