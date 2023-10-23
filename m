Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248FF7D323F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621370.967761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quswV-000582-TX; Mon, 23 Oct 2023 11:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621370.967761; Mon, 23 Oct 2023 11:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quswV-00054j-PZ; Mon, 23 Oct 2023 11:17:55 +0000
Received: by outflank-mailman (input) for mailman id 621370;
 Mon, 23 Oct 2023 11:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1quswT-0003z8-Vm
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:17:53 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf2bd933-7195-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 13:17:53 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507bd64814fso4572425e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:17:53 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p14-20020ac24ece000000b004fdde1db756sm1654253lfr.26.2023.10.23.04.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:17:52 -0700 (PDT)
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
X-Inumbo-ID: cf2bd933-7195-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698059873; x=1698664673; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9obuvYIWw7a+6/1TE6LC9070ElKQUu1VXjhmU4IhkoQ=;
        b=FX1Dbj8S+VQYWEs/J1qYI+U2Wh9ju8hTw6sppidt+r86UUIp8iyukz+5J3ggp78DID
         Qg1Ati2UvMMfQ72HuV7R7eeqaQ1dWdG3OGp4EVC8EUhJnu9REk5qjvFxYBff55dfSy/o
         In31NuT7ZiU22L8iqCALsXZoWPYPstit5EzMxzIqRcoR7jcX0/sit2cpNu6aUMH0HidC
         S4AC9S0qqUn7VOQHGwaiab6ld3Jm+omC3tqNmAFHYoXkVElXPvnoyZO4AzqIaE4mqHty
         5XuMy7nbth7AXMadnoYQM3/aqNTKDi1pFA6r0q3tivX8B4vCwefcSog+dRhw/KfZpWzU
         YNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059873; x=1698664673;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9obuvYIWw7a+6/1TE6LC9070ElKQUu1VXjhmU4IhkoQ=;
        b=FbpupKfqx4lRbP+xWK/LlJ5NC/LahLx4WNpu71KBtIInVxf1Ox6u//KxxbbJliP63R
         JAi46mW/QkSTfqMDQGDSWpBVoiDWYdnvpai7ZhOpdBLnCd2yEf72T+6atdkqQeZZFDPb
         vJ3So0cV/xcspqY+5Cn4n1BITgyS+hoDcLaEf46gtIr77N0OtmHfKa7wIU/w6sZq680r
         +524gJ8c3yCG4bVOx9JrF9a3c83eTI1WAnJGDEVLmgTad9Ue0yECUciV1fxtXwElpucK
         tWN4X+PbENMTJcZ1Gxo/bSFAJpzc1N34aaLANbfzneIa6m7qtNOUqYhRKTFr7E7XeI16
         1AXg==
X-Gm-Message-State: AOJu0Yz3mrB37zAno51LpVw0BS4L0bSAxRZdnzJTNzJbw+PrlfiOAzTt
	rgjXabyOVyXNfwvuZI0A5fU=
X-Google-Smtp-Source: AGHT+IEoEtFWzmWmzY7rcxtZ15YPNrBRjzmr68VeirA265zijDzcwiDGoqTz8YCdy0Jpqke4aP0O1w==
X-Received: by 2002:a19:8c43:0:b0:507:9778:5a0d with SMTP id i3-20020a198c43000000b0050797785a0dmr6188285lfj.30.1698059872816;
        Mon, 23 Oct 2023 04:17:52 -0700 (PDT)
Message-ID: <b244c869810d22ee1c9420b0d80ff48e7d8146ce.camel@gmail.com>
Subject: Re: [PATCH v1 17/29] xen/asm-generic: introduce stub header percpu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:17:50 +0300
In-Reply-To: <9136bdd4-2ae1-4b7a-b4b8-a66181b2bfe4@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <521647680aa5010629ded799010c8f9e5d22cde3.1694702259.git.oleksii.kurochko@gmail.com>
	 <9136bdd4-2ae1-4b7a-b4b8-a66181b2bfe4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 12:39 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/percpu.h
> > @@ -0,0 +1,35 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_PERCPU_H__
> > +#define __ASM_GENERIC_PERCPU_H__
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <xen/types.h>
> > +
> > +extern char __per_cpu_start[], __per_cpu_data_end[];
> > +extern unsigned long __per_cpu_offset[NR_CPUS];
> > +void percpu_init_areas(void);
> > +
> > +#define per_cpu(var, cpu)=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]=
))
> > +
> > +#define this_cpu(var) \
> > +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(&per_cpu__##var,
> > __per_cpu_offset[get_processor_id()]))
> > +
> > +#define per_cpu_ptr(var, cpu)=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
> > +#define this_cpu_ptr(var) \
> > +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(var, get_processor_id()))
> > +
> > +#endif
> > +
> > +#endif /* __ASM_GENERIC_PERCPU_H__ */
>=20
> This looks okay, just one request: Please use smp_processor_id(). You
> may have seen on the Matrix channel that there's the intention to do
> away with the get_processor_id() alias that's used in only very few
> places.
Thanks. I'll update the patch.

~ Oleksii

