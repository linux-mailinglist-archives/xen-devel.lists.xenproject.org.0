Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1C86CE53
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687267.1070459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiyf-0002jW-QB; Thu, 29 Feb 2024 16:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687267.1070459; Thu, 29 Feb 2024 16:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiyf-0002gX-NY; Thu, 29 Feb 2024 16:09:45 +0000
Received: by outflank-mailman (input) for mailman id 687267;
 Thu, 29 Feb 2024 16:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygh/=KG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfiye-0002gR-Nm
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:09:44 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3763e91-d71c-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:09:43 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5132c455250so328729e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:09:43 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a19434c000000b005129994f013sm300138lfj.184.2024.02.29.08.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 08:09:42 -0800 (PST)
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
X-Inumbo-ID: f3763e91-d71c-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709222983; x=1709827783; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ElSet3YFfblPGyJ+kvjm8n5Jw+L91jCWvs9T39e2+Rw=;
        b=jKR+fxnCCY6+hUvtx7iubxmSozYegjbholoCcKN0YSz6LJdQ+rk16aL3p1Pd82BFsW
         A6JL1JhvbFRe3RaqNpSt/rzxFgS0Gcz2UNNWTzKyZmYXA/6a16w6rBt2mRZSZPJzOW7f
         acxukOX8viTDMNPqdy94TAzhhUrnSKI4WFk36RjvYIxN9BP0TUdFEXVgDhtIZ9KqDER4
         vM1ROxgk44I0ZHzhNjMOC1M2ple/4iDcsoYkaweCh++8O9CWJkFHu0M/+gbQas2Yn2v2
         cVDJVsJUk/E6LsJSrnhc8/a8TopDoAu4SR5/49uju22tyfUlNoRlmQU3K0kqpWqB1bTe
         Rieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709222983; x=1709827783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElSet3YFfblPGyJ+kvjm8n5Jw+L91jCWvs9T39e2+Rw=;
        b=WE6+MQsM85R6IWjFan1Y1ry+Lmi1z1+HXSjvhvr/EnQV1qP46p4SOTVAnzPRgmAiLh
         /zh03qEV6KRlgHQLUAK5WVFGjQ+TOcpk2qm29TqMKLC/BHDScGrcjfUr5lqAYSyELE8Y
         JoBskxc8483wLDtViClIOlFJC74cw9RZFQRT/x8AsX672PneCGozLdcx8o9ahoxyFSj0
         6rwL+k9/Xif83H0umMmsNI6SsRUqkYdRkac+mruiMvkyunL6AjDMc5zCSAHnDCKiOyaM
         Ay7+9IZ8xAmyRh5uRKJGjXHED7aJ8K854EeoYl/G24e7r/KLGZRWki8vOJiIjMAsbzNw
         4lAw==
X-Forwarded-Encrypted: i=1; AJvYcCUjPe4AStu+fkn8xgfdjnrDqjGREzUkJDUBKkWgbrX0Fs21V7fSqo5xxQk9R6j+2IR/on+gUeDRd3nGS9fEeSibYvkpYA3ziOP/KarpSNk=
X-Gm-Message-State: AOJu0YxMyOqc/comlSv2lK3J8PKsEv2p81Mwq4Ue9JLxdR7TwBSdrR67
	aGkMQ8WJe0eVDCtDTvsqSxc6otxFxTsMeXx/MK18vT/KlVkxRJl0
X-Google-Smtp-Source: AGHT+IHqO1oocMSOs0rIl8nqDfyz/DM0iyjZjETz/z8lOeBNJtf6BzozFNa0r0iWXRkKjJmcV+4RRg==
X-Received: by 2002:a19:5e18:0:b0:513:2be9:7a8e with SMTP id s24-20020a195e18000000b005132be97a8emr554472lfb.62.1709222982968;
        Thu, 29 Feb 2024 08:09:42 -0800 (PST)
Message-ID: <6150e4780fadf81e70b56da9e63112047945e249.camel@gmail.com>
Subject: Re: [PATCH v5 03/23] xen/riscv: introduce nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 29 Feb 2024 17:09:42 +0100
In-Reply-To: <7d9a7a89-2ad1-49e3-9cac-7cf8d6b5e6c5@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
	 <e44a8bcf-a037-441c-b85c-651784df020a@xen.org>
	 <7d9a7a89-2ad1-49e3-9cac-7cf8d6b5e6c5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-29 at 15:01 +0100, Jan Beulich wrote:
> On 29.02.2024 14:49, Julien Grall wrote:
> > On 26/02/2024 17:38, Oleksii Kurochko wrote:
> > > --- /dev/null
> > > +++ b/xen/arch/riscv/include/asm/nospec.h
> > > @@ -0,0 +1,25 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> >=20
> > New file should use the SPDX tag GPL-2.0-only. I guess this could
> > be=20
> > fixed on commit?
>=20
> I wouldn't mind doing so.
I would happy with that. Thanks.

~ Oleksii

