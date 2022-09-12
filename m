Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1155B5B1C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 15:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405811.648242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXjQT-0000PJ-7H; Mon, 12 Sep 2022 13:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405811.648242; Mon, 12 Sep 2022 13:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXjQT-0000NH-4Q; Mon, 12 Sep 2022 13:24:37 +0000
Received: by outflank-mailman (input) for mailman id 405811;
 Mon, 12 Sep 2022 13:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nJqN=ZP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oXjQR-0000NB-Oy
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 13:24:36 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36be879e-329e-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 15:24:23 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id y9so6667768qvo.4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 06:24:32 -0700 (PDT)
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
X-Inumbo-ID: 36be879e-329e-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5P5x0IAgxd/2DXkuZ9Kq/5iwKCuZHBST8BjihYLy0Ag=;
        b=n8aguukkLKro3i5Gf5KKiagB6WL3yx5eXgE+tCTuXVbLlfjnX/3AcdpdVO8RBi0QfV
         6f9OZ+fpj3kroz5lXo5ZYldjk+CaNaRVCArVMvdOwCeCbNTGqjG2I2WsfQq5jMEmsCYI
         s8w7nT6+ek7x2Svq7EE4Gc1qD1xeFIi2IQGmXldE8J7cL8vKHB5bcloHUIJKL9EYHzQc
         lY+o1XHN7Ouf7MrH2SCv0nBiJ280FgzVl/tZrX1mw60adfR0xnkxwJl2xMeZ0pxWQju+
         scViTvwYhR3NL0le+gSrPKDrnDiFvMiFHWiVk6YCxchlf21Y3DrKeYS1mpeBDs2pQ6bC
         mrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5P5x0IAgxd/2DXkuZ9Kq/5iwKCuZHBST8BjihYLy0Ag=;
        b=KTQFVEupvpTQpKZH6tiuMSWFoGcW5zViyBbav4loNyUQXPc0CAhBllN3gSJz5jdSWe
         +K0YEIZ3doiY77b9GyClUeTEZcHYeE8k2JfbjaUPtBe10g0qLNhnRX/Llj1AbwqqmvF8
         +0wlnaSBIQQwiZJPabDSUXlhb2mtMXDx9FEuKjfNHR4pFFS6wsfVvQA5/FMeOMvVzQed
         gJqXwPEl0qHXRfIY2twBQtx4dTPhxsDHCoiE/g4OXgZJi3QwUFrWgzLHKINfK+qtyWhE
         x2ZFrotgNmbkEN/twAlBhYGYoFmJ2QIiaeiJMQnzK2KcdpQUyS+J2diYZ3K2P2jR2V2o
         Ha0Q==
X-Gm-Message-State: ACgBeo09Vasi9Owvf/3GhpPY6eqncRePaQRLXW/wcJ1XoGt6Cod2xRCo
	VRsCUfgC2rdLXi6ThiVCSiEx6Z4WVNT2iUu6ix6Ieg==
X-Google-Smtp-Source: AA6agR4pfmNXlrUDBmMBh3V7OAnqsodbb6V1xdaGCifmydawZ0xxOz15BsWC47sIn6wCnFvq7KAhm7ekGtSJ1xI0WXo=
X-Received: by 2002:a05:6214:238b:b0:48a:f607:c4e0 with SMTP id
 fw11-20020a056214238b00b0048af607c4e0mr22877411qvb.44.1662989071787; Mon, 12
 Sep 2022 06:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech> <ec492136-53c2-8cdb-ad01-b3b232d3bc85@xen.org>
In-Reply-To: <ec492136-53c2-8cdb-ad01-b3b232d3bc85@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 12 Sep 2022 15:24:21 +0200
Message-ID: <CAG+AhRX8fR9gHBi6-OWuO-7_1sU7V3kP5m2BxD6AKwjSQParaQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] Arm cache coloring
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Sat, Sep 10, 2022 at 5:12 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 26/08/2022 13:50, Carlo Nonato wrote:
> > Shared caches in multi-core CPU architectures represent a problem for
> > predictability of memory access latency. This jeopardizes applicability
> > of many Arm platform in real-time critical and mixed-criticality
> > scenarios. We introduce support for cache partitioning with page
> > coloring, a transparent software technique that enables isolation
> > between domains and Xen, and thus avoids cache interference.
> >
> > When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> > the user to define assignments of cache partitions ids, called colors,
> > where assigning different colors guarantees no mutual eviction on cache
> > will ever happen. This instructs the Xen memory allocator to provide
> > the i-th color assignee only with pages that maps to color i, i.e. that
> > are indexed in the i-th cache partition.
> >
> > The proposed implementation supports the dom0less feature.
> > The solution has been tested in several scenarios, including Xilinx Zynq
> > MPSoCs.
> >
> > Overview of implementation and commits structure
> > ------------------------------------------------
> >
> > - [1-3] Coloring initialization, cache layout auto-probing and coloring
> >    data for domains are added.
> > - [4-5] xl and Device Tree support for coloring is addedd.
> > - [6-7] A new page allocator for domain memory that implement the cache
> >    coloring mechanism is introduced.
> > - [8-12] Coloring support is added for Xen .text region.
> >
> > Changes in v2
> > -------------
> >
> > Lot of things changed between the two versions, mainly I tried to follow
> > all the comments left by the maintainers after the previous version review.
> > Here is a brief list of the major points (even if, imho, it's easier to
> > repeat all the review process):
>
> The series doesn't build on Arm64 without cache coloring. Please make
> sure to compile and check that Xen still boot on system after your
> series with cache coloring disabled.

I'm sorry for that. Tested multiple times, but probably missed it after some
last minute change. The following diff fixes it.

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 00351ee014..6abe2fdef7 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -411,7 +411,7 @@ static inline void page_set_xenheap_gfn(struct
page_info *p, gfn_t gfn)
 #else
 #define virt_boot_xen(virt) virt
 #define set_value_for_secondary(var, val) \
-    var = val;
+    var = val; \
     clean_dcache(var);
 #endif

>
> Cheers,
>
> --
> Julien Grall

Thanks.

- Carlo Nonato

