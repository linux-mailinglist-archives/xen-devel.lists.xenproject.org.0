Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D1F7D2FB8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621260.967547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus5x-0006y7-Nn; Mon, 23 Oct 2023 10:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621260.967547; Mon, 23 Oct 2023 10:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus5x-0006vl-K0; Mon, 23 Oct 2023 10:23:37 +0000
Received: by outflank-mailman (input) for mailman id 621260;
 Mon, 23 Oct 2023 10:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qus5w-0006L8-Bi
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:23:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38a67e28-718e-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:23:34 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso460383766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:23:34 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a170906714800b00992b510089asm6344052ejj.84.2023.10.23.03.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:23:33 -0700 (PDT)
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
X-Inumbo-ID: 38a67e28-718e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698056614; x=1698661414; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zg/rNZfVDSxbOS8rUS2IxgQ9c4aUlP51FTpK7+GtscM=;
        b=fhlCM1dgKhbhe+AuJK5dFZicl5JwSkjp+7uMt0MKe3tbGiGn7pmym64KMw0HKmr3kw
         MDfwmi2voXDOYjHip7HDsk+OiFAFM2w2SONPrt/K+8Mz6C8b2FoHyX/DFgs4fFgs7+R+
         AR+PdmxteafyHxAvyyRokg8oGuvFt2swUXnwjAp77HgRJl3mWVa2ven40q9f9desbeyA
         Pe1XU2CL7qLGJY5Mzs/oef87UYxQYr7DNbZoRa8N3Qk+rhgsF9M4jK2pdV+wqDj3Fm2H
         KimlYdJ3H+d7n70Nn+Q/pZ0nvUZE61y4sZBiyoJj9xhOfidz00dxa0CK33k2HdCrYUQr
         4BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056614; x=1698661414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zg/rNZfVDSxbOS8rUS2IxgQ9c4aUlP51FTpK7+GtscM=;
        b=DFEEoSkiVYvyUaw9++OouBN4InWiXbeMjXBObD8GuWVHw9Sq66ZGMJWHMt6G3AA+pt
         LKTjhBQKF/fZRPx8jGm1EZVIJ5pGJG7/ka3qZqdlbbPOOg6/9Yf2sqRv3vKQ/as+iHLz
         iGDyCP1F/fy0SQQCN+US/cA3ehjqzaG9d8wn/kyIYKcG+IWzI5oEynrvvVXKfzSqeD+n
         BQGbHw6HEzS7qIz6rtVFw68gwF2rvMgOxCt0QSR6Hcv+dTcJa64nsNtJ9J6X22CnKuTh
         ddMWcVrompBZ6JrF1pWC+C7J8Uq66ISU60fvpJIxR0IrI5ev367XUta4NsFKiRigvULu
         HSnQ==
X-Gm-Message-State: AOJu0YxctjxpSCn0I2LfM7sR+ING7IXXeDvgXNoqM81VaAyua0FLqkzZ
	gRFMfGsBq5WYbDsQPy8BV1g=
X-Google-Smtp-Source: AGHT+IH+LLwzZtLV/DK5UiJZ0CjZbO1wfhBMFSi4iNdvaioBkMMEaN/mbpHcaex2Jur70NdL0OxCug==
X-Received: by 2002:a17:906:fe4c:b0:9c6:abf9:2a1e with SMTP id wz12-20020a170906fe4c00b009c6abf92a1emr6774648ejb.31.1698056614000;
        Mon, 23 Oct 2023 03:23:34 -0700 (PDT)
Message-ID: <1b7bec33c0931401d635586e5569279435e1ccb7.camel@gmail.com>
Subject: Re: [PATCH v1 05/29] xen/asm-generic: introduce stub header event.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:23:32 +0300
In-Reply-To: <a71eb141-6ef7-f1bf-d4fc-832d710f63e4@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <69563e3f41cb6971f93630d9df59395f159bd3c4.1694702259.git.oleksii.kurochko@gmail.com>
	 <a71eb141-6ef7-f1bf-d4fc-832d710f63e4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:18 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/event.h
> > @@ -0,0 +1,39 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_EVENT_H__
> > +#define __ASM_GENERIC_EVENT_H__
> > +
> > +#include <xen/sched.h>
> > +
> > +static inline void vcpu_mark_events_pending(struct vcpu *v)
> > +{
> > +}
>=20
> While this will satisfy callers from a build perspective, no port
> will be functional with an implementation like this. Yet the
> generic headers need to provide the required functionality, not
> just build stubs.
It makes sense but then we will have the similar patches when new
architecture is introduced.

>=20
> Going further in the series, I won't repeat this kind of comment.
> Unless others disagree, my view is that headers put here should
> be of use beyond initial bring-up of a new port.
>=20
Then we have two options here:
1. leave only declaration of the function.
2. remove it from asm-generic.

~ Oleksii

