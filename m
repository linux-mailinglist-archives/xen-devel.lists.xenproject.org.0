Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E67EE056
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634142.989424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3b6x-00015d-BD; Thu, 16 Nov 2023 12:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634142.989424; Thu, 16 Nov 2023 12:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3b6x-00012K-7w; Thu, 16 Nov 2023 12:04:43 +0000
Received: by outflank-mailman (input) for mailman id 634142;
 Thu, 16 Nov 2023 12:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqXc=G5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3b6v-00012C-QM
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:04:41 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5278c375-8478-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:04:41 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5094727fa67so996952e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:04:41 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d20-20020ac241d4000000b0050a72e696e1sm1932917lfi.117.2023.11.16.04.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:04:40 -0800 (PST)
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
X-Inumbo-ID: 5278c375-8478-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700136280; x=1700741080; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TAQJ0p9YnaxcOAT+8G7dAwXbJw97tfts4uTfp1Y7Xg=;
        b=gGcDdbtkTIk8YdAhrJh8excyeVuRt3/umtIu6ovkrRifhFq33gAH8o9G1ZhDO/HqC/
         vxKld7IHA/KWGPS8ld6qE8I3TQqKZGjPE8sVT5J9J3PaC6+N4+d9ef+iKINeLCJNRqFO
         H7Q0ng1RIcXKP+8NMVcQkhWHNMgx2T7WEFlYHmWoIVH3ldGCtb+KtP/yuyBwvA0Zmoiz
         Kczh3FAyae8rj3H8404TiNVwuuU4WVTg7RxTi2rO6EAv7ybL7lD6Fq8muUiiNMzMYxFr
         vt8yPOinWy3no4cavaJMsUv6hWtdKroMxSILorJhqnpfkGDnP80yN+2LwnJCS0TSN3RD
         Vrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136280; x=1700741080;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TAQJ0p9YnaxcOAT+8G7dAwXbJw97tfts4uTfp1Y7Xg=;
        b=PUrkHlKXyovHUoRqbnBtklCxLJVtYULsO5SXbAhMXavbfdK6QzrVGISAaWUnpiEkVr
         6tKVjttg7/+VlyrUtGHEucGUkbrbj9TDlzMdafG09cUcbQq//nfwQXIDy6BG1Vwx4Hfh
         6Rn6Q6iY17aV1K4kAuSqpQQnTtKNRou6RHOw4JWE68qQyfWui9NdKCCPrAE8Dn4t5Gmo
         6tl21BcTykzYH3V1kit8Agl8oX8IQgDDBQyEk9ayRpbLp/ZiaH1G8OEhWOWZLAZnksKN
         nAgoHP7VPtFuRmK+El/V+uBvKGAuw2AGnRnXvnrbqZiLOxQ46RZSGi9DxzY6B/hV+xEM
         v1UQ==
X-Gm-Message-State: AOJu0YwbzmVz1aeyzAQVH+XOpZiP0V4ueXlKJomtFcPL2PPHvvlJn9rr
	F4d3UKxwIJc4CxC2PNvDET8=
X-Google-Smtp-Source: AGHT+IFCT6Pzz/VCtT1h8jJgGIsYFJwr6tuiRhPnMMd+4hRXVqwrZvBTRrGPzKI9KLRzFgU1DKGn5w==
X-Received: by 2002:ac2:4d01:0:b0:503:19d8:8dc3 with SMTP id r1-20020ac24d01000000b0050319d88dc3mr1532062lfi.31.1700136280245;
        Thu, 16 Nov 2023 04:04:40 -0800 (PST)
Message-ID: <45623d7e6ca4f9ed34c1818ae304cbf49d82da4a.camel@gmail.com>
Subject: Re: [PATCH v2 08/15] xen/asm-generic: introduce generic header
 percpu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 16 Nov 2023 14:04:39 +0200
In-Reply-To: <f7fca726-f4d5-4cdf-981e-2a6fcf5085b0@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
	 <f7fca726-f4d5-4cdf-981e-2a6fcf5085b0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-11-16 at 08:36 +0100, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
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
>=20
> Can we go one tiny step beyond what Arm presently has and make the
> latter of the two const?
I am not sure I think we will have compilation issue with the following
code in Arm and x86 because of [-Werror=3Ddiscarded-qualifiers]:

static void cf_check _free_percpu_area(struct rcu_head *head)
{
    struct free_info *info =3D container_of(head, struct free_info, rcu);
    unsigned int cpu =3D info->cpu;
    char *p =3D __per_cpu_start + __per_cpu_offset[cpu];

    free_xenheap_pages(p, PERCPU_ORDER);
    __per_cpu_offset[cpu] =3D INVALID_PERCPU_AREA;
}

I guess cast can help.


~ Oleksii

