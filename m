Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE90171118D
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 19:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539776.840979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2EKN-0007dF-44; Thu, 25 May 2023 17:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539776.840979; Thu, 25 May 2023 17:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2EKN-0007bZ-0W; Thu, 25 May 2023 17:00:39 +0000
Received: by outflank-mailman (input) for mailman id 539776;
 Thu, 25 May 2023 17:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN8z=BO=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q2EKL-0007bT-1P
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 17:00:37 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa906900-fb1d-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 19:00:36 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ba71cd7ce7fso1180553276.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 10:00:35 -0700 (PDT)
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
X-Inumbo-ID: aa906900-fb1d-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685034035; x=1687626035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHrTsqL0nqeqxBvVw7n3mE3d9UFJpL2j8If6jZFByTc=;
        b=VEXX4D+/ehgygAWm5BmRxKMQVayX+huiD86BmHpUJbQZIavyZk8MqgFgBVJCgltW8G
         DGf1XLm8HhYD7C5Ltu5hncRV4xkFiRLvjnKAKUZAVqhHyZU7uDae6IK3C5qSD3GFgpGy
         OqLSmV63QlFHc9BLqOH+z3/46t/qsNvryv2gOmzRQJTarAzeFF3wkmaawd/u1vYzudf+
         2OoFyE7ArYkSpPwfiPG4wUCBT5egkmxxlXwXAVhzZYomT8xAIzGjfTrChNVAlbK2FaKO
         3t03QrSsNM3MzVGbAgb9jEqdKkZ/GGbY36ZIzPCKupNWpFQuCEQc+t41/FAd5d9jW5uu
         ry0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034035; x=1687626035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHrTsqL0nqeqxBvVw7n3mE3d9UFJpL2j8If6jZFByTc=;
        b=dupNkAB+VaN4dGOJexfTrVsAZln0lPKMC7J8DuJLICWsrGgK348UoEcjKeBlGRmEMy
         UP3VpgqVCcBN/k5EP+pyfP2Qsa0fwp88WpgkvwLNIwR2z1CeuybINUrN0mXA76B4FtI5
         yU5qCapWrkapKVENWUDoZ0/MGuYYS1CKFZb9F4gNQgForoC8YlECjnoocHKO2WSwTsP5
         +Su3SKoDe/51Gavzr8oENrtqGOicu+diYAYVjrJIFjE7NOWjnTA+H48NDftwLwu2WhZL
         rvV3OldGTeWTwYGWBMctfSXEbBc0Id5TuUE0BjpGlxocfvyJTZJ7JKsmO4PBvfA26YmK
         uj/Q==
X-Gm-Message-State: AC+VfDyKfMWYCVGCkCxfyQEEuN4ysxpuHXZWGmFY3h/Z/sJZFNCdeyi7
	4dQ1aRCZPqL/mfm498uPLYUg43iJtAJ0nUTbxeA=
X-Google-Smtp-Source: ACHHUZ47ymCJWriUjad8DQ05hIMcCKin/PTMMU7nNv3HHwEyV9e0xB3DhHdcf1Fkkg8cgW7lAUtL7p6ayG4dp+Ur5MI=
X-Received: by 2002:a25:2487:0:b0:ba8:5ded:13f3 with SMTP id
 k129-20020a252487000000b00ba85ded13f3mr4152229ybk.17.1685034034679; Thu, 25
 May 2023 10:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
In-Reply-To: <20230525085555.GV4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 10:00:23 -0700
Message-ID: <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 1:56=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi,
>
> On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > No folio equivalents for page type operations have been defined, so
> > define them for later folio conversions.
>
> Can you please elaborate why would we need folios for page table descript=
ors?

Thanks for the review!

These macros are for callers that care about the page type, i.e. Table and
Buddy. Aside from accounting for those cases, the page tables don't use fol=
ios.
These are more for the cleanliness of those callers.

