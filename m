Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B481BE6E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 19:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659107.1028550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGO4k-0003MV-0o; Thu, 21 Dec 2023 18:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659107.1028550; Thu, 21 Dec 2023 18:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGO4j-0003Jm-Tc; Thu, 21 Dec 2023 18:47:17 +0000
Received: by outflank-mailman (input) for mailman id 659107;
 Thu, 21 Dec 2023 18:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywj9=IA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGO4i-0003Jf-0u
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 18:47:16 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd0d884-a031-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 19:47:15 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e2168ab09so1742244e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 10:47:15 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u5-20020ac25185000000b0050d438f0a09sm333325lfi.256.2023.12.21.10.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 10:47:13 -0800 (PST)
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
X-Inumbo-ID: 5bd0d884-a031-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703184434; x=1703789234; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/9r6Zec3H9AjIM0xtEfFYf1RwMixZEScNSDhzhNPTUo=;
        b=aPqtYa8FeQcVbLZsFSW9vZCOqWq3Jd+GCypWCmHBwGEibpGGjaNM+yvd56T6TzpyX+
         bvh6m5McSPUw1gK98FdEUzgtwuIB9Raq02OhcrRdbIayrEvpaS/DpFBrkFfy0xR1a8SG
         ZuQ6mDy6FdBRkzXdPdxcxpi5rzSaOny27nw/YiMBPP5lMXZ/w+USqnTFi000wRPbROfY
         L9QswshlS0coo1BozK9RGymtCxvVZynQIk+ilc/nG/SF6BL8SoWADRX0mUWQlpsAeYka
         VsAcUNXl67eu4nNnT7yzk+2OJ/cPF2hqxZ/RIwE55EDKtJ7QJW/TbhQ+jfRzuKB1Hn4G
         sJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184434; x=1703789234;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9r6Zec3H9AjIM0xtEfFYf1RwMixZEScNSDhzhNPTUo=;
        b=jHwl/nvHN3nHqiudhwK4dbfexYD8hy7Vly4nfvGIOK5l+mveSY+DJh94X3d7hYWTWl
         xty64n2PREvA+f4eMZzMcIbiQgk/DqhzlDE3O4BjOoJ2a72wL6lRNQ6F13/RnTGzFAGm
         gwzKhB0bYnXuJ+Twuhi9uJrL6Qobk2iXhUUKm3xBH2ELb3dscRozhBbXB1/Ug/5K7xuo
         TbrK1DfkwuAsGoV4xBW34TecxtPjC8Aj6NugIrmmxuXHZ3svxW1LxbqWgm4e3+SmDyhg
         FyJNLbB/HlZM5dlVEOKmTYAd582QgwZ/o2YOpXuxokSKdAA/GYXKLMyjKRbboncyrxN2
         0l4Q==
X-Gm-Message-State: AOJu0Yxd2N/RboXTRqX7G5M56fMfjv6NVF2Nh+q75HyPE6HzlMAvntrg
	3G+wmZLsmiFS+KhsmjxNv5by5Ru3sx0=
X-Google-Smtp-Source: AGHT+IEn8TRUcOXw6UcoPEOF1HMig19py3oZnDXAMxMeBM2O/Qyt0NGnC1hOrIYyXse3zId5W105Dw==
X-Received: by 2002:a05:6512:21ac:b0:50e:39db:b22d with SMTP id c12-20020a05651221ac00b0050e39dbb22dmr34724lft.59.1703184434247;
        Thu, 21 Dec 2023 10:47:14 -0800 (PST)
Message-ID: <bebb3ad9adecabe171b648274bdaf9e33e1c6185.camel@gmail.com>
Subject: Re: [PATCH v2 37/39] xen/rirscv: add minimal amount of stubs to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 21 Dec 2023 20:47:08 +0200
In-Reply-To: <ede547ec-b6dd-4b41-9655-0944fbda8eec@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <091887466560fbd6b66239f7fee5193eb97570b9.1700761381.git.oleksii.kurochko@gmail.com>
	 <f52b19eb-7633-48df-85b9-c6a545dc4232@suse.com>
	 <3c34e22a4cf040845e734c3575512945a87465dd.camel@gmail.com>
	 <ede547ec-b6dd-4b41-9655-0944fbda8eec@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-21 at 09:02 +0100, Jan Beulich wrote:
> On 20.12.2023 13:55, Oleksii wrote:
> > On Mon, 2023-12-18 at 18:00 +0100, Jan Beulich wrote:
> > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/stubs.c
> > > > @@ -0,0 +1,426 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +#include <xen/cpumask.h>
> > > > +#include <xen/domain.h>
> > > > +#include <xen/irq.h>
> > > > +#include <xen/nodemask.h>
> > > > +#include <xen/time.h>
> > > > +#include <public/domctl.h>
> > > > +#include <public/vm_event.h>
> > >=20
> > > I think I can see why you need the former of these last two, but
> > > do
> > > you
> > > really need the latter?
> > It is needed for vm_event_request_t and vm_event_response_t, but if
> > use
> > a forward declaration that it won't be needed:
> >=20
> > typedef struct vm_event_st vm_event_request_t;
> > typedef struct vm_event_st vm_event_response_t;
>=20
> Iirc Misra wouldn't like the duplicating of typedef-s used elsewhere.
> But
> as long as that's not going to stay (and I expect stubs.c to go away
> before Misra becomes of concern for RISC-V), that's going to be okay,
> I
> think. Yet then avoiding the typedef-s and using struct vm_event_st
> directly in the functions would be as good, and overall less code.
Hmm, it makes sense to use sturct vm_event_st direcly in this case.
Thanks for suggestion.

~ Oleksii

