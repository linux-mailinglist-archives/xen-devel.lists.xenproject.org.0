Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DF41E345
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 23:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200250.354710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW3UG-0001Js-H1; Thu, 30 Sep 2021 21:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200250.354710; Thu, 30 Sep 2021 21:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW3UG-0001I1-Di; Thu, 30 Sep 2021 21:21:04 +0000
Received: by outflank-mailman (input) for mailman id 200250;
 Thu, 30 Sep 2021 21:21:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fx8M=OU=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1mW3UE-0001Hv-Lf
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 21:21:02 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8362652c-3305-4b41-9f6e-8539cafeafcd;
 Thu, 30 Sep 2021 21:21:01 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id f130so7249987qke.6
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 14:21:01 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id p15sm2222453qti.70.2021.09.30.14.21.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 14:21:00 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id u32so16180503ybd.9
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 14:21:00 -0700 (PDT)
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
X-Inumbo-ID: 8362652c-3305-4b41-9f6e-8539cafeafcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
        b=BlxMYaM/OWq2QOg73mmSIuZReJqS9WDVJwYpygBxYlCdpjQvMPkG8JUUJuWMEfe7VW
         Kc4xJOkMskHk8O+awxj6C0zYig/iRuEgT85zngr4j5VHau1O2THU+xT3x/AlUo4/mD7V
         wX52wLkXcsoyoK8aKbnCd70Ljj6pEqXvKGjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
        b=NSzdVm7uVYffpeMxX5Q6SQbAxUsJV8Cqyknf2kk19DHRw8rjrlVUkftbjsE1Lpb2yM
         jaOrk5c5BrtuLlquAWiChFDNSC3HcfA3syx6plvXUWFvgJ6X2zlF2eR/c9xn478TCQEh
         HG4w/MUeVLdWG4ZgHygRits0XDicxSUnIG8U+pXu2NuT9VpJCTv70LiKqE5M8fxC3im1
         Lm0M9y8Ycvbn0Ax3Awoc3uH5hjvG+KOJn2KS4oZHYUVLoUkmtTnaHQOUzbW/i7FEK+T3
         /ABhrx+6PZm/8kXEdmAVlmZAHUSCRY844AQykF2ne1/DGD2Tg3u1PgKqOLWNzt2HXzA6
         SVGQ==
X-Gm-Message-State: AOAM530ThJ9fr9CgROGx3D+r/ilhRQRPgPp89sBWBqg5GIUarzFtR8bl
	WbqsL8265rll0SF451M25dhqBqsf+ZWuq71ocLo=
X-Google-Smtp-Source: ABdhPJwyxpSfA9iqeH8zYycgVMlOoOwRkpt4nbQEQtjCKAM5tcUXs7m0lM6wT9ofWATcp6mXeUWEdg==
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr7152414qki.35.1633036861318;
        Thu, 30 Sep 2021 14:21:01 -0700 (PDT)
X-Received: by 2002:a25:df06:: with SMTP id w6mr1562849ybg.459.1633036849801;
 Thu, 30 Sep 2021 14:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930185031.18648-1-rppt@kernel.org>
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Sep 2021 14:20:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Juergen Gross <jgross@suse.com>, 
	Mike Rapoport <rppt@linux.ibm.com>, Shahab Vahedi <Shahab.Vahedi@synopsys.com>, 
	devicetree <devicetree@vger.kernel.org>, iommu <iommu@lists.linux-foundation.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, KVM list <kvm@vger.kernel.org>, 
	alpha <linux-alpha@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-efi <linux-efi@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-usb@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-sparc <sparclinux@vger.kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 11:50 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The first patch is a cleanup of numa_distance allocation in arch_numa I've
> spotted during the conversion.
> The second patch is a fix for Xen memory freeing on some of the error
> paths.

Well, at least patch 2 looks like something that should go into 5.15
and be marked for stable.

Patch 1 looks like a trivial local cleanup, and could go in
immediately. Patch 4 might be in that same category.

The rest look like "next merge window" to me, since they are spread
out and neither bugfixes nor tiny localized cleanups (iow renaming
functions, global resulting search-and-replace things).

So my gut feel is that two (maybe three) of these patches should go in
asap, with three (maybe four) be left for 5.16.

IOW, not trat this as a single series.

Hmm?

             Linus

