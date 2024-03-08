Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66448769C3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 18:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690365.1076282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ridv9-0003t6-6N; Fri, 08 Mar 2024 17:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690365.1076282; Fri, 08 Mar 2024 17:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ridv9-0003qt-35; Fri, 08 Mar 2024 17:22:11 +0000
Received: by outflank-mailman (input) for mailman id 690365;
 Fri, 08 Mar 2024 17:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WWIB=KO=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1ridv7-0003ql-CL
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 17:22:09 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 642ab14b-dd70-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 18:22:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4131b27cda2so5078795e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 09:22:08 -0800 (PST)
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
X-Inumbo-ID: 642ab14b-dd70-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918528; x=1710523328; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jucViIz8xwJxIjrz/FZM/DDlB3DLqqBFRzm+RODn104=;
        b=e0CSeSXeLLIIX8BC/28pbCf4d1FYCIQF4KFbh0Z/e/mNEIJ2XyiPVAaKpGEsc79QSx
         Cnybls7GtAZPVFQj5Bz3pl+m8z4x1gzD7LN0d5qlQS0p1E78jzZIJcLCZcg7Y5zHfQfz
         7abv+UaggYVq7XaeDRUNsan8kg7tdEbaO9tYUQaolVP6t3pj+9OyZEDgQQiSodfHMCvw
         mF21oe3syYUGl5J+b3lRkZqAz2y8LWylhYboKeyK9I8hTcZp9gJT17oKWu2vrqxte9H1
         VzBYR6IgrEvHQF94xrRULd/sdYAxy5qNeSeZ9LzYMlsnKv59HDlsLOnTBZOE/227F6ij
         Ruqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918528; x=1710523328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jucViIz8xwJxIjrz/FZM/DDlB3DLqqBFRzm+RODn104=;
        b=bdC8DjWHq4qLtICSdCUlS9UvjyLccLckBWbg6g2De2jf8FLBCAb1Opri9abRUSu8If
         aOZydzdkmcF3RW6BPOF85G9Pr+SCcp8r3EiMyt1OTWirDHSRk5X+Sa6FvsoZf5qOcNbd
         rAOhAnuVB+Lwc+jXEvC7JmuhzkuW/Ci5F7ZGWK7LxLHudq/JNnHcVYsc5CfxBoQigIRH
         kqhCBnDU9cDtalwEVl12cj0XxC+q44Wu02JN3iNr3wYoNHCg0MRxHFkhXKeKxSPfWckI
         Uf/MztNMULbgoIrrjNhTKdlkXPCpupLZpUKAhPrrPVudVHU7NIVa9FUAVXyfcP9G71pY
         TOZg==
X-Forwarded-Encrypted: i=1; AJvYcCULoVXqcK76sdY6c0OTuCv1APw6/8IN2GqkhTB1ZgPAB8hmEhYKc2LUQ1Q3XEiXVcG8OcI77eou9XGXYn2xRpeadRVZOWqC0d9yyZ7uVN8=
X-Gm-Message-State: AOJu0Yx7/fPHbJlHdvTVpNUN36mN0Yo5p7RPs9Qx8XAdmDA0K0xigOWh
	hvHXUjrg4/yp0e/Art1ZJShfbJUvUpaKBVyE6eqCB8R4KoI35emRlIBppEkEbALhDo6FWt5iEB+
	3tqC9fXq4VhdgE/CjycYCV6kSDO8=
X-Google-Smtp-Source: AGHT+IEsyTvVxIZznYVc7DZoZGa2Ni1s/uRtj8TYmazDkx3DsdR9S3CA2W36uHp4bLl2A4XXQ6ZxfYXr1V2wkcErN0Q=
X-Received: by 2002:a5d:670a:0:b0:33e:7c19:dec8 with SMTP id
 o10-20020a5d670a000000b0033e7c19dec8mr208779wru.21.1709918527648; Fri, 08 Mar
 2024 09:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <CGME20240308171422eucas1p293895be469655aa618535cf199b0c43a@eucas1p2.samsung.com>
 <20240305030516.41519-2-alexei.starovoitov@gmail.com> <1f49d568-24f9-4003-b222-515f33a99cf2@samsung.com>
In-Reply-To: <1f49d568-24f9-4003-b222-515f33a99cf2@samsung.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Mar 2024 09:21:56 -0800
Message-ID: <CAADnVQJNjz5W+7-SA5n3R1_8Y2qtj1F4xvEU-zd-tk8mh7mXAw@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 1/2] mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Barret Rhoden <brho@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org, 
	Juergen Gross <jgross@suse.com>, linux-mm <linux-mm@kvack.org>, xen-devel@lists.xenproject.org, 
	Kernel Team <kernel-team@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 9:14=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 05.03.2024 04:05, Alexei Starovoitov wrote:
> > From: Alexei Starovoitov <ast@kernel.org>
> >
> > There are various users of get_vm_area() + ioremap_page_range() APIs.
> > Enforce that get_vm_area() was requested as VM_IOREMAP type and range
> > passed to ioremap_page_range() matches created vm_area to avoid
> > accidentally ioremap-ing into wrong address range.
> >
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> > ---
>
> This patch landed in today's linux-next as commit 3e49a866c9dc ("mm:
> Enforce VM_IOREMAP flag and range in ioremap_page_range.").
> Unfortunately it triggers the following warning on all my test machines
> with PCI bridges. Here is an example reproduced with QEMU and ARM64
> 'virt' machine:

Sorry about the breakage.
Here is the thread where we're discussing the fix:
https://lore.kernel.org/bpf/CAADnVQLP=3DdxBb+RiMGXoaCEuRrbK387J6B+pfzWKF_F=
=3DaRgCPQ@mail.gmail.com/

