Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE28084DE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649677.1014487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAtm-0007NM-Bi; Thu, 07 Dec 2023 09:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649677.1014487; Thu, 07 Dec 2023 09:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAtm-0007Ki-97; Thu, 07 Dec 2023 09:42:26 +0000
Received: by outflank-mailman (input) for mailman id 649677;
 Thu, 07 Dec 2023 09:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBAtl-0007Kc-0Z
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:42:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec29af86-94e4-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:42:23 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54cfb03f1a8so914611a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:42:23 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a50999e000000b0054c9df4317dsm585518edb.7.2023.12.07.01.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 01:42:22 -0800 (PST)
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
X-Inumbo-ID: ec29af86-94e4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701942143; x=1702546943; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i9GGonFwdu3X/gF8/AcujfGtHlcYSQhjp0F5ctTVoLw=;
        b=f+yt7FEL1mzoABFz4rHcRgzYg7PbkpRl3vHITDWWe6ypEM6Kuy/3zUqmhZvJGLtdxV
         TJgCJw8zr3dRuhaKFXbSMN4O2yYMG65a5TC4C2F5gf8DJb4+hKa35geY5VtXkgN0DhfP
         yiWmvpeplWW1hDAxYyIhAImxtaDCBIrv8RVz+Izt+UOWPwlWBXOY0H2Oi8xTYUsVN5YT
         SYYF3COdIneDcrKPkBn21zHZT/qDayK5Vs8J6Qx7jRSXtmQVvt5tUAJS6TdRuELE04on
         4HteN00c2wzXmeyBxtBsRJV33BsH0Ku1sxN1DAPynwRUqVy856sbQcozffojPhmN7RM8
         rBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942143; x=1702546943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9GGonFwdu3X/gF8/AcujfGtHlcYSQhjp0F5ctTVoLw=;
        b=YYi7Z8rwokyGV1y8fG4i4nZQ9slErnuL5FRSdmM6z8tVUnO237Lt4a0ww43u6pDHh5
         ayAy7vvrFdAH5t2FFiankqJurmx7Uvf2zXPve8qX6euiUb/XfaxB0HbQPidk5rneTi5s
         Xg61ByBY959Vav4BTfAzgs55OBvQ/QXpl8FUmoBAp1WmFoUdymrAguUlC3wJJPsvebG6
         6MjPG8omsp0FS6W6yxVhrAl7C5gFfklfe7Z9cpV7ImH4ekgsm2pHTgE2i2Ey+96Gciaa
         LzBTU6id0/jQ12JVN/DRqGdcEK8lXWpYQkK0GfLp4IU/8tU6mBwLMg+rPcxW87ZAsBri
         htUQ==
X-Gm-Message-State: AOJu0YyjEnctRTUtvEj/0aRjZ+XUNY2MHW3JWR4M3fPrQfDInoTWV+/Y
	4aXY29u+rx7CwLIl+S14C6o=
X-Google-Smtp-Source: AGHT+IFsGCxce0zrrqjTBAhcJmjkFRR62dK89bJnXpkRrMA9dXZ/cLY3OThppQyybhg8Dstp9IuM0w==
X-Received: by 2002:a50:d744:0:b0:54b:bc5a:e68a with SMTP id i4-20020a50d744000000b0054bbc5ae68amr1299515edj.15.1701942142580;
        Thu, 07 Dec 2023 01:42:22 -0800 (PST)
Message-ID: <306915687362f916b11a78d7a74ee817c8d2ec16.camel@gmail.com>
Subject: Re: [PATCH v2 06/39] xen/riscv: introduce fence.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Dec 2023 11:42:21 +0200
In-Reply-To: <902146c4-8f36-446b-8332-78858186986c@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <225f7c6eac811dfd6afbb188c869557c5465ecca.1700761381.git.oleksii.kurochko@gmail.com>
	 <902146c4-8f36-446b-8332-78858186986c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-12-05 at 16:56 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/fence.h
> > @@ -0,0 +1,12 @@
> > +#ifndef _ASM_RISCV_FENCE_H
> > +#define _ASM_RISCV_FENCE_H
> > +
> > +#ifdef CONFIG_SMP
> > +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
> > +#define RISCV_RELEASE_BARRIER		"\tfence rw,=C2=A0 w\n"
> > +#else
> > +#define RISCV_ACQUIRE_BARRIER
> > +#define RISCV_RELEASE_BARRIER
> > +#endif
> > +
> > +#endif	/* _ASM_RISCV_FENCE_H */
>=20
> Imo such a header would be better to introduce once a use for the
> constructs appears. Otherwise at the very least it wants explaining
> in the description what this is going to be needed for. I can't
> find items of these names in other architectures so far, so this
> must be something RISC-V-specific.
It is going to be used only in RISC-V. The things that use these
definitions are introduced in the patches of this patch series:
* [PATCH v2 18/39] xen/riscv: introduce cmpxchg.h
* [PATCH v2 17/39] xen/riscv: introduce asm/atomic.h

~ Oleksii



