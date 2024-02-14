Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D168A8548FC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680705.1058776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raE9q-0002Ly-AC; Wed, 14 Feb 2024 12:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680705.1058776; Wed, 14 Feb 2024 12:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raE9q-0002Jk-6e; Wed, 14 Feb 2024 12:14:34 +0000
Received: by outflank-mailman (input) for mailman id 680705;
 Wed, 14 Feb 2024 12:14:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raE9p-0002JY-40
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:14:33 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6f47c0-cb32-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 13:14:31 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d1094b5568so21165271fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 04:14:31 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a50d643000000b0056022d78141sm4929633edj.56.2024.02.14.04.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 04:14:30 -0800 (PST)
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
X-Inumbo-ID: 9b6f47c0-cb32-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707912871; x=1708517671; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cgqebQZxQ/sWMWCoqyhd5yCUbhDXysR/gEfB1BllkAs=;
        b=TwOuTzhB6X5t1UkKgWvdk/voJJ/gQeoQr6KUMuMsdyR3M4cICh4A7C+f4V0lKC4vCI
         vYgdk4GTodr0LY2aHoKMXaTfKRrLIDY0jHNpJJuijf3Loh6aYp6W0LCXolfLu+s1qYQP
         c7fLJRR91xCYGHSGRLkANExckY4DXCL3Woj17WfABz0mf2qUHs8JfYYcBGBSEAo0G8Nn
         KyDSZIGxH7yZUus2aNGZaUXCvAe5/lQ3Rn/VlP7lQ3/AUUMSi9bRxw6CylqJzrrEtKii
         jYcTB1Q2213R2Jw7XvJvWfA6dUjwjS67w03KqBxUcarRb3DBOrnEbrmmc+rAdzbAx14N
         gWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707912871; x=1708517671;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgqebQZxQ/sWMWCoqyhd5yCUbhDXysR/gEfB1BllkAs=;
        b=rG7wBK3gbJUwwlhxSPMTMtOyufmDiyNenkh+Ot6l3i5ERVXBt2mXfyQ41dbjl/Naj4
         TzbWrNe69o2fAEHqUH32ek/zqNEBSw432COWwP1z3SFa3MDdw5GNPlLhoG0D7c/7bvm3
         IqXq1hrej8gjgHmNYoO8kL7DCW2XpaDHrTDRWsTk+Lf/B+PwVl9XjYGFa4yQB6GcBH9t
         4ibsHfAjqKg5/qLWkmNV0Y6m32etXx4WsosT+RAGojUnQwIiqtwy439UHLA3revEQGh/
         V0FvGoVOYUaqv4dFtTLxpuC41b3n8txsdq2WjmKaaIF8m4+XsJR6zkB3PSv2z5JdLu01
         DxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9NSlNPNLd5l7+7nv1ra0m09og/HCfODmMsFGl3W3Tr8WE4XLtzNZe9ND1OIi1l6du+FFUBQd/zsVbBiuDZLwkyiM9XF2ZEuzN0aMvtPI=
X-Gm-Message-State: AOJu0YzrtFH7JT9oUgcyDNJAn7pOloKpyXUbsekYjbC/2aVUFcOJNicW
	tMUFHhjAB4801X00qAffK3WKEURwTcorHZX+gr0QsEQeItz7tzqk
X-Google-Smtp-Source: AGHT+IF5CyL+SH5i3qCBgxsWPnLmvcabRCjWbUwfRz4O4qY8vosdT3eLJrNOnyCZwbSa/Fi3oI0fZg==
X-Received: by 2002:a2e:91ce:0:b0:2d0:f6c7:906b with SMTP id u14-20020a2e91ce000000b002d0f6c7906bmr1756615ljg.42.1707912870499;
        Wed, 14 Feb 2024 04:14:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI3ODmz/PC6/hPyQakbG6DiO9oplU06Zy+GMF4mlQ3HFb9vqgi/cietpi8rJw+HUNBZQk8Tavho9Sntu3aMnXYYvRUwqCXnaYphaMivGDeCL4qfJ8U1omq/gJnZf6K8/seUJP/d5Yra/uQIyD0/BD/+JCHVLDYIR1d+NTCSttRU4wZIerbkzTwuiImJEfkI7KIZiRLLdJeij7WP2Nbv0xkqXxqfuf2AT2uBCcGxgl40YSBeH8B7hSfN7CooZ5iMd3q9Qt02T/KARd0/iGlZSs4WZxmvk1aDvy+emBdhT+6g/xEg1cM1Ls=
Message-ID: <7dd960c8bdce416f7cecc29f8794b5e5a35ee8cb.camel@gmail.com>
Subject: Re: [PATCH v4 18/30] xen/riscv: introduce time.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 13:14:29 +0100
In-Reply-To: <2962005e-252f-453e-a8fe-25856b16fe57@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <f0a4566c185469fa9f5de41b5bbbc7234cfa9912.1707146506.git.oleksii.kurochko@gmail.com>
	 <2962005e-252f-453e-a8fe-25856b16fe57@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:18 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Nevertheless ...
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/time.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_RISCV_TIME_H__
> > +#define __ASM_RISCV_TIME_H__
> > +
> > +#include <xen/bug.h>
> > +#include <asm/csr.h>
> > +
> > +struct vcpu;
> > +
> > +/* TODO: implement */
> > +static inline void force_update_vcpu_system_time(struct vcpu *v) {
> > BUG_ON("unimplemented"); }
>=20
> ... nit: Too long line. The comment also doesn't look to serve any
> purpose
> anymore, with the BUG_ON() now taking uniform shape.
I'll drop the comment and move "BUG_ON(...)" to new line.


~ Oleksii

