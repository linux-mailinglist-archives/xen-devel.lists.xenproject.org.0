Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C77A23841
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 01:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879803.1290008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdevM-0007bj-OX; Fri, 31 Jan 2025 00:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879803.1290008; Fri, 31 Jan 2025 00:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdevM-0007Z4-Lt; Fri, 31 Jan 2025 00:30:20 +0000
Received: by outflank-mailman (input) for mailman id 879803;
 Fri, 31 Jan 2025 00:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyPN=UX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tdevM-0007Yy-2T
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 00:30:20 +0000
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b91a15a-df6a-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 01:30:18 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1738283414209491.3141769924324;
 Thu, 30 Jan 2025 16:30:14 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6f7440444efso4576617b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 16:30:14 -0800 (PST)
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
X-Inumbo-ID: 8b91a15a-df6a-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1738283416; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UlT+3aEZ1pgeYjyWgkDet5yyInOGXbEZt20PXcRr36dTn/bV2dqMwzZ3E5yKSPiMr2rBb9dUw7Q+B5cOy8XsfQSgc8KFQkoxbdxkWN1nV0eICcQvECdM+++PVVcBzNtL3xmNGXcMFOD4GpUaH8W/siTFMXzTfx64I+53M5UFjX0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738283416; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PM5oirnBZ86E/0kDDfKgrWEpKXkiKmWIpyKteR6QFic=; 
	b=QDk0YuKCyFrERnLG+SA/NLfo7/K0NiAgtwk+l9rP0FhHreelTcBiDSD7WJmFPbcMUslxpMVraZ4DJOUdKYd50f0veKkk/V5jGjVybC2W6lF8jKi51GpzsnyEMOS8V0GjgkFGRgZKHTxrnhrYr6EK6cF4LF1uvio7LUqR6tNTMFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738283416;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PM5oirnBZ86E/0kDDfKgrWEpKXkiKmWIpyKteR6QFic=;
	b=I4oWfyFD1RX9IXfYBayZFgUhBF3TFdPQutsEXwTRQbXu9pUNCcU7Jg0KVx9lU7CD
	hHarAJvzC72hTp6WNNsPMoGm8R4EgyfRxMtpjadOCXqsuca4cteStiiik0M6HAaeTpK
	f/hYo8c7I3u0FEL4fnArEzH5YcrNvlW10YqLpyE0=
X-Gm-Message-State: AOJu0YzEuEqMn+kJvDeTFASP0G7q9OLQHEqmuJRnsp3z062GC4MhfboO
	H5+VlXhqP8Kc6ekEHo6bVH3L2xFLb9zBNtR+MbBJ1oAo3RKsGcCljCZtrJwRekPSB27wZBJ12au
	uqEyLZm1wzEjEzYAYLqivNW4fbkM=
X-Google-Smtp-Source: AGHT+IFVc1Iqxp9i6disdaV7tQYe+tkP3CyFafjslPNEiYSYebSditbS6mJUfIHpoSJZFhStUzxzDAsjrPwyn7uuHgA=
X-Received: by 2002:a05:690c:4d0a:b0:6ef:e39f:bbd with SMTP id
 00721157ae682-6f7a848ea13mr77436107b3.33.1738283413859; Thu, 30 Jan 2025
 16:30:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com> <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 30 Jan 2025 19:29:38 -0500
X-Gmail-Original-Message-ID: <CABfawhkZZtM7HRi8XqVoWjsmutv1s_49J3=oVNoTjGh-anYiaQ@mail.gmail.com>
X-Gm-Features: AWEUYZmSLPBf8xY7FE-WyEXmNQyII_SZbND8Lb5w_Ld3MZcaAxnxWjOFdofLyHI
Message-ID: <CABfawhkZZtM7HRi8XqVoWjsmutv1s_49J3=oVNoTjGh-anYiaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 5:19=E2=80=AFAM Sergiy Kibrik <Sergiy_Kibrik@epam.c=
om> wrote:
>
> Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
> CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher level
> feature, with mem_access & monitor depending on it.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

