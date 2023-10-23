Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24327D3364
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621377.967779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qut7s-0001Lc-8Z; Mon, 23 Oct 2023 11:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621377.967779; Mon, 23 Oct 2023 11:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qut7s-0001JO-5u; Mon, 23 Oct 2023 11:29:40 +0000
Received: by outflank-mailman (input) for mailman id 621377;
 Mon, 23 Oct 2023 11:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qut7r-0001I1-BP
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:29:39 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ace10f-7197-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 13:29:37 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507c5249d55so4455952e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:29:37 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 if5-20020a0564025d8500b0053f10da1105sm6181962edb.87.2023.10.23.04.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:29:36 -0700 (PDT)
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
X-Inumbo-ID: 72ace10f-7197-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698060577; x=1698665377; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=67K4wi1FHXcF9B8JHqCxBBVrHRJ66FWBI6218bHCz6Y=;
        b=LKy27+1+ktIXw9rDFtSNt0Oi3GFqKql2cm+Kn19XWxJ+6fIlLtcGtOx5OG7sU63tnO
         j9H8UkyiNpClFMHyNToBHrRroq88MHEKOW4GX+0E8VYsP3p8quZRPAN8P2tkwIJQ+xmR
         VSNaGUD3/WnUZYjfgORToEFBeqm+q2C+guOAXDugzzXLXIk89yONcyVmy1FqZsrss5LX
         tRxH8Mr0npyHposv42ywxxMlNw9iawi0Xrx7hg6CFrNvB7hLa2mjHXC4oKi6ig/XOS28
         uiQzgKImtvNjN2NoKCn03kbcWRsibG6d84TmZE8/+85zaD6/+hgGClixPhJFolmDFj7G
         BAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060577; x=1698665377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67K4wi1FHXcF9B8JHqCxBBVrHRJ66FWBI6218bHCz6Y=;
        b=wpjLPzM/XV05lnE5vq+jYb22Yy3IE0XP9wParHSCLzaZ+ZmWDRlu3Y2qa7HwOwJf22
         hxasxNTSz9JsDRU3ogorXVbfBRzWmhOFV5zL3VWBbDn48YDF4/SKqTcS7HFBtRBOf59K
         OovGvI1eholFBJezgF5pQUB80m13AWzDt7xN4VA5JzVUzKdZcekNGPsGP2I+cASdL9Vg
         GvXMuxDPjNHhpTSEpwJ0IZkR0W6YGEoiBzMJsZBGHUuSKd+THNA26EnyrjkAauPA+Hw7
         k4x42JXd8MoGDoD80Le4ZQy705D7OJICpaxeSdIcf3WIqAThAzyNDggaSYwKMVSIt9z7
         Jrcg==
X-Gm-Message-State: AOJu0YyquJmkpC3bfum3rqilnNjYe5LIw/XXh9bS+b3+5irFye3laVIp
	8gpVNp2xS+zN+SG0GKjQkAA=
X-Google-Smtp-Source: AGHT+IE6E4URa7u1ou0aeF1+YenG0pzUzBwk4T0vVYi6kc1ZIuHJFv2E/uTIzCYz6xsZUfdcTGQMcA==
X-Received: by 2002:ac2:494f:0:b0:4fb:8f79:631 with SMTP id o15-20020ac2494f000000b004fb8f790631mr5897770lfi.46.1698060576718;
        Mon, 23 Oct 2023 04:29:36 -0700 (PDT)
Message-ID: <8a36af842ed91cb599bb62bd3a9382528710dd89.camel@gmail.com>
Subject: Re: [PATCH v1 19/29] xen/asm-generic: introduce stub header
 hardirq.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:29:35 +0300
In-Reply-To: <95b6cdcf-2ceb-6b38-3318-afbd3b985a68@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <cb76190d2b0b056c6733c1f5cfc941d0201f6490.1694702259.git.oleksii.kurochko@gmail.com>
	 <95b6cdcf-2ceb-6b38-3318-afbd3b985a68@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 13:04 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > The patch introduces header stub necessry for full Xen build.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> I agree this one can be generalized from Arm's, but ...
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/hardirq.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_HARDIRQ_H
> > +#define __ASM_GENERIC_HARDIRQ_H
> > +
> > +#include <xen/smp.h>
> > +
> > +typedef struct {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long __softirq_pen=
ding;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int __local_irq_co=
unt;
> > +} __cacheline_aligned irq_cpustat_t;
>=20
> ... where is __cacheline_aligned going to come from without inclusion
> of xen/cache.h (as Arm has it)?
xen/cache.h should be added. thanks.

~ Oleksii

