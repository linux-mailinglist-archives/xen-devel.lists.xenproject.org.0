Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A090741C87F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 17:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199232.353153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVbYI-0003Md-3v; Wed, 29 Sep 2021 15:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199232.353153; Wed, 29 Sep 2021 15:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVbYI-0003KZ-0k; Wed, 29 Sep 2021 15:31:22 +0000
Received: by outflank-mailman (input) for mailman id 199232;
 Wed, 29 Sep 2021 15:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R9Bq=OT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mVbYG-0003KT-A8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 15:31:20 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ace6376-213a-11ec-bd11-12813bfff9fa;
 Wed, 29 Sep 2021 15:31:19 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 18TFV9s9015040
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 29 Sep 2021 11:31:15 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 18TFV8OJ015039;
 Wed, 29 Sep 2021 08:31:08 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 4ace6376-213a-11ec-bd11-12813bfff9fa
Date: Wed, 29 Sep 2021 08:31:08 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YVSGvGZc67ZLMdKm@mattapan.m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
 <YVD59QVbmdVwzYQI@mattapan.m5p.com>
 <033cc499-34de-d27a-7b1b-2a0a7ce38672@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <033cc499-34de-d27a-7b1b-2a0a7ce38672@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Sep 29, 2021 at 03:32:15PM +0200, Jan Beulich wrote:
> On 27.09.2021 00:53, Elliott Mitchell wrote:
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d0402e8be0>] R arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260
> > (XEN)    [<ffff82d0402ec51c>] S p2m_flush_nestedp2m+0x1c/0x30
> > (XEN)    [<ffff82d0402e0528>] S arch/x86/mm/hap/hap.c#hap_write_p2m_entry+0x378/0x490
> 
> hap_write_p2m_entry() calling p2m_flush_nestedp2m() suggests that
> nestedhvm_enabled() was true for the domain. While we will want to
> fix this, nested virt is experimental (even in current staging),
> and hence there at least is no security concern.

Copy and paste from the xl.cfg man page:

       nestedhvm=BOOLEAN
           Enable or disables guest access to hardware virtualisation
           features, e.g. it allows a guest Operating System to also function
           as a hypervisor. You may want this option if you want to run
           another hypervisor (including another copy of Xen) within a Xen
           guest or to support a guest Operating System which uses hardware
           virtualisation extensions (e.g. Windows XP compatibility mode on
           more modern Windows OS).  This option is disabled by default.

"This option is disabled by default." doesn't mean "this is an
experimental feature with no security support and is likely to crash the
hypervisor".

More notably this is fully enabled in default builds of Xen.  Contrast
this with the stance of the ARM side with regards to ACPI.


> Can you confirm that by leaving nested off you don't run into this
> (or a similar) issue?

Hypervisor doesn't panic.  `xl dmesg` does end up with:

(XEN) p2m_pod_demand_populate: Dom72 out of PoD memory! (tot=524304 ents=28773031 dom72)
(XEN) domain_crash called from p2m-pod.c:1233

Which is problematic.  maxmem for this domain is set to allow for trading
memory around, so it is desireable for it to successfully load even when
its maximum isn't available.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



