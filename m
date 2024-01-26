Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED083E442
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 22:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672545.1046688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTU52-0006Rx-L1; Fri, 26 Jan 2024 21:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672545.1046688; Fri, 26 Jan 2024 21:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTU52-0006PG-Ha; Fri, 26 Jan 2024 21:49:44 +0000
Received: by outflank-mailman (input) for mailman id 672545;
 Fri, 26 Jan 2024 21:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1+W5=JE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rTU50-0006PA-Ox
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 21:49:42 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce15353b-bc94-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 22:49:40 +0100 (CET)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182]) by mx.zohomail.com
 with SMTPS id 1706305775574428.08918493061356;
 Fri, 26 Jan 2024 13:49:35 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-602cf45bfe9so8506767b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 13:49:35 -0800 (PST)
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
X-Inumbo-ID: ce15353b-bc94-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1706305777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UuW5D2AUY/6Gm7REZ9N8PQJ/E2CvEx5HhtjSZ9KYJb1uRRllrSvz8ltKJrKpSzsfxUUS8licVYPO91xv5H136gNy3yvvaodcRnjJnvWJ/38rpTVJCLlN5PGs6cfdxed/jsowyMXyaP4V7CRtOeqmY8GJSHWmKdzWnclp+G1qrhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1706305777; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=byCJeq9qylYIhTpENFoknC1RQg2HB1JYDz1FifW7c2k=; 
	b=EthEuQ2pm+xGrWo59C53/Eonj6T26RabHX/XFOa1RO9Uel52OdeFLUXrCytnUyUKIxb91l3EkRqrXMHxjdVbPVWKfnb9tsPgo7cERDSRK/bPaXOCWgEYrzIetjPJPG+JDGD66BikBtalq6MTlt55AqBv72tMP4IE666WimsSpVo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1706305777;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=byCJeq9qylYIhTpENFoknC1RQg2HB1JYDz1FifW7c2k=;
	b=OfeJnFdusyzgG0J1xSn/ZgtdvDiw6xoDhY4Nb+lwhqrIKI9183vnA38EYzwCl8vA
	3pyGklCet00HoifE6xn9oXi/QFZIXlgnBS8TaLafdmWPhwaAtev/0BHV9Jbuj9h+1e2
	KFDMb23RiscyHobyGghZ1c2dCv+pqG962PQsLkhY=
X-Gm-Message-State: AOJu0YzuYHEPSLFhWxYNvW0o+s37VY6Jv7ndiQtSF7zS8Y8mrtyus39n
	SYIJ4yA+jLKwirmi6K5cjM3+xJdyXresdQS5ORNAKe/+gVUMA+ihMbAa7x+qWUB4MlmY17BgDTG
	PX3xJgMGmAJjmAVU2qbeuoC3hH80=
X-Google-Smtp-Source: AGHT+IFO1YXT2VdMmSiByLYaYaBq7NtT1CE6O+Qf/sduWnYfRtiwxaH9VRNumR1gjhT1j0ZHZ4E8GpIBTe4GaexzT5E=
X-Received: by 2002:a81:4520:0:b0:5ff:5e9d:8374 with SMTP id
 s32-20020a814520000000b005ff5e9d8374mr495183ywa.41.1706305774631; Fri, 26 Jan
 2024 13:49:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706281994.git.oleksii.kurochko@gmail.com> <30c450ef4141656724b03adcc292fd1ac4b635b6.1706281994.git.oleksii.kurochko@gmail.com>
In-Reply-To: <30c450ef4141656724b03adcc292fd1ac4b635b6.1706281994.git.oleksii.kurochko@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Jan 2024 16:48:58 -0500
X-Gmail-Original-Message-ID: <CABfawhnvc6q3vtP-BHaC9zQVr4MbkrtckTyT2e5_yzeouKOuyQ@mail.gmail.com>
Message-ID: <CABfawhnvc6q3vtP-BHaC9zQVr4MbkrtckTyT2e5_yzeouKOuyQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 10:42=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
> allows to avoid generation of empty <asm/mem_access.h> header
> for the case when !CONFIG_MEM_ACCESS.
>
> For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
> and traps.c because they require some functions from <asm/mem_access.h> w=
hich
> aren't available in case of !CONFIG_MEM_ACCESS.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

