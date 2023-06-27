Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA974026C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 19:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556228.868580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEChr-0002Ku-LD; Tue, 27 Jun 2023 17:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556228.868580; Tue, 27 Jun 2023 17:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEChr-0002IO-Hm; Tue, 27 Jun 2023 17:42:23 +0000
Received: by outflank-mailman (input) for mailman id 556228;
 Tue, 27 Jun 2023 17:42:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qEChq-0002I2-4S
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 17:42:22 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f690f734-1511-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 19:42:19 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-57688a146ecso45090907b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 10:42:20 -0700 (PDT)
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
X-Inumbo-ID: f690f734-1511-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687887739; x=1690479739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i618d6TBDc9eRPjFDJkpeqKfOfbO3uM7uCEV9XLltFk=;
        b=HvOjTHjCD8itMm1xp5AnK/TmYH5tQiF1El2gyMO5zpqTY4wM1G2ir3ku6089UY1inQ
         ilXwuLjIDRYIMPHiQPHPbFQRy/hIa9oVwH0QYqAm53mZsyIpL6HgYzNNL/NNLIh2SC53
         /Joi55NqQPacIQIaSPLnjCH7o6qvV31ICWbCQ8IiY+RsTUhqfYiVoVRzcNBSzvMpURs/
         f/RKmZePqghHrHdV5n1so0lsBS2EaZX77ICe7eDI+jllhbMiPBHJhxnD9h+Hh+PnGjAo
         7epexu03a+N5aJGPnt128CQw+E8IVZS3OeUo6R0hlPLkskRaMfOu6WUJJOIpsapTfYI9
         tHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687887739; x=1690479739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i618d6TBDc9eRPjFDJkpeqKfOfbO3uM7uCEV9XLltFk=;
        b=LpOJqes9wTpkQRGFRM+huXEMl6KPEKTpw4b/rMP0Z+TIazWsIFmoGX8ggky6II1nIV
         jTJz1qZN14bXCSRdhxVNafvzrKv14XhJEthMTT1x0ZSQHw3aHuziEBjEV/8JDrxGR4JA
         3AG1MmCybkLVBeleeRNXGgl5QzTIpyxk3Kyj3bSZMfUujqIQ0K3IoCQtZuA4reYLHkWB
         3s9ONSKwFyiYiWlgkWeD7kRjYgPTqpeo7yMuuDgGTxIpOBLdGUPTpBVHwthxm6ft1TWr
         Tf48rIt33lKlNyG9KfcfRsrfv5BupZupkxMWH/GTJyZItcLS+fnHZLnc3mhYlBEsDpr3
         o5qQ==
X-Gm-Message-State: AC+VfDwbRU7bLSB/QZbQJZUOgR9bx083COspf8r3RXcFytyo+2XEyY+w
	2Jhx4s++d0qoW+zaFl18x7NEdVoYFMB65T0tH6I=
X-Google-Smtp-Source: ACHHUZ5ixDfcfZvsP+Sk9Q2uIR96dLCuXZPewVmRsckC25R1Wt8J/1BC8EjmOgQOvqL4+PjmfxQNP2ok9/vuUSXcV8M=
X-Received: by 2002:a25:86c8:0:b0:c16:ba32:1b1c with SMTP id
 y8-20020a2586c8000000b00c16ba321b1cmr8446597ybm.58.1687887738923; Tue, 27 Jun
 2023 10:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com> <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
In-Reply-To: <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 27 Jun 2023 10:42:07 -0700
Message-ID: <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, Dinh Nguyen <dinguyen@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 10:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>
> This patch causes all nios2 builds to fail.

It looks like you tried to apply this patch on its own. This patch depends
on patches 01-12 of this patchset to compile properly. I've cross-compiled
this architecture and it worked, but let me know if something fails
when its applied on top of those patches (or the rest of the patchset).

