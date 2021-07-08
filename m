Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BDD3C1B58
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 00:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153321.283247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1c9m-0000Bm-Ro; Thu, 08 Jul 2021 22:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153321.283247; Thu, 08 Jul 2021 22:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1c9m-00008e-OS; Thu, 08 Jul 2021 22:06:06 +0000
Received: by outflank-mailman (input) for mailman id 153321;
 Thu, 08 Jul 2021 22:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X7bE=MA=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1m1c9l-00008W-1T
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 22:06:05 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afbfb516-e038-11eb-85bf-12813bfff9fa;
 Thu, 08 Jul 2021 22:06:03 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 168M5rla041516
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 8 Jul 2021 18:05:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 168M5rWX041515;
 Thu, 8 Jul 2021 15:05:53 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: afbfb516-e038-11eb-85bf-12813bfff9fa
Date: Thu, 8 Jul 2021 15:05:53 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: Xen/ARM API issue (page size)
Message-ID: <YOd2wSfaThhDPoHp@mattapan.m5p.com>
References: <YOZHkGrrl694NrfZ@mattapan.m5p.com>
 <8c7d9d21-d8be-d33f-6d37-dfb54f74c179@citrix.com>
 <2f27358a-e1d1-4627-3608-0c2fcd0754c0@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f27358a-e1d1-4627-3608-0c2fcd0754c0@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Thu, Jul 08, 2021 at 05:06:42PM +0100, Julien Grall wrote:
> On 08/07/2021 02:05, Andrew Cooper wrote:
> > On 08/07/2021 01:32, Elliott Mitchell wrote:
> >> Hopefully I'm not about to show the limits of my knowledge...
> >>
> >> Quite a few values passed to Xen via hypercalls include a page number.
> >> This makes sense as that maps to the hardware.  Problem is, I cannot help
> >> but notice aarch64 allows for 4KB, 16KB and 64KB pages.
> > 
> > Yes - page size is a know error through the ABI, seeing as Xen started
> > on x86 and 4k is the only size considered at the time.
> > 
> > 32bit frame numbers were all the rage between the Pentum 2 (1997) and
> > the advent of 64bit systems (~2006), because they let you efficiently
> > reference up to 16T of physical memory, rather than being limited at 4G
> > if you used byte addresses instead.
> > 
> > It will be addressed in ABIv2 design (if I ever get enough time to write
> > everything down and make a start).
> 
> IIRC, ABIv2 will only focus on the interface between the hypervisor and 
> the guests. However, I think we will also need to update the PV protocol 
> so two domains agree on the page granularity used.

I'm inclined to concur with Andrew Cooper here.  It makes a fair bit of
sense to consistently use full addresses across the entire ABI, just
specify alignment so the lower bits end up zeroes.


> Most of the arm64 cores supports all the page granularity. That said, 
> this is not a requirement from the Arm Arm, so it may be possible to 
> have cores only supporting a subset of the page granularity.

At which point it is possible to have a device where the page size(s)
supported by some cores are disjoint from the page size(s) supported by
other cores.

I imagine someone has plans.  An obvious use case would be a cellphone
chip with a low-power core for the modem and a high-power OS core.


> >> What happens if a system (and Xen) is setup to support 64KB pages, but a
> >> particular domain has been built strictly with 4KB page support?
> 
> If the processor only support 64KB, then you would not be able to boot a 
> 4KB kernel there.

I was being explicit about covering both cases of distinct page sizes
between Xen and domain (Xen with smaller page size, domain with smaller
page size).


> >> What if a particular domain wanted to use 64KB pages (4KB being too
> >> granular), but Xen was set to use 4KB pages?
> Today the hypercall ABI using the same page granularity as the 
> hypervisor. IOW, the domain would need to break its page in 4KB chunk to 
> talk to the hypervisor.
> 
> FWIW, this is how Linux with 64KB/16KB page granularity is able to run 
> on current Xen.

Breaking pages up is generally easier than putting them back together.
Good news is this could be handled similar to DMA operations and a few
pages reserved for interaction with small page domains.


> >> What if a system had two domains which were set for different page sizes,
> >> but the two needed to interact?
> 
> They would need to agree on the page granularity used. At the moment, 
> this is implicitely fixed to 4KB.

"implicitly" -> "undocumented" -> "guess" -> "12 hour build wasted"

For the case I'm concerned with, the history is a decent hint, but not
being explicitly documented is Bad.  In the Xen ABI there are too many
references to "page size" without the page size being defined as 4KB.

In a few years there may be someone on this list who assumed "page size"
meant whatever page size was in use and will be rather annoyed it means
4096, when both Xen and their OS were using 65536.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



