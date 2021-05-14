Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC7380215
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 04:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127155.238903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhNmi-0007BC-Nk; Fri, 14 May 2021 02:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127155.238903; Fri, 14 May 2021 02:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhNmi-000784-KX; Fri, 14 May 2021 02:42:40 +0000
Received: by outflank-mailman (input) for mailman id 127155;
 Fri, 14 May 2021 02:42:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjOs=KJ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lhNmh-00077y-4S
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 02:42:39 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cd4390e-c50a-4cd4-835b-171f2d4b7675;
 Fri, 14 May 2021 02:42:37 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 14E2gSm8073818
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 May 2021 22:42:34 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 14E2gSQW073817;
 Thu, 13 May 2021 19:42:28 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 3cd4390e-c50a-4cd4-835b-171f2d4b7675
Date: Thu, 13 May 2021 19:42:28 -0700
From: Elliott Mitchell <ehem+undef@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monn?? <royger@freebsd.org>,
        Mitchell Horne <mhorne@freebsd.org>
Subject: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
Message-ID: <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
References: <YIhSbkfShjN/gMCe@Air-de-Roger>
 <YIndyh0sRqcmcMim@mattapan.m5p.com>
 <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com>
 <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com>
 <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com>
 <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Upon thinking about it, this seems appropriate to bring to the attention
of the Xen development list since it seems to have wider implications.


On Wed, May 12, 2021 at 11:08:39AM +0100, Julien Grall wrote:
> On 12/05/2021 03:37, Elliott Mitchell wrote:
> > 
> > What about the approach to the grant-table/xenpv memory situation?
> > 
> > As stated for a 768MB VM, Xen suggested a 16MB range.  I'm unsure whether
> > that is strictly meant for grant-table use or is meant for any foreign
> > memory mappings (Julien?).
> 
> An OS is free to use it as it wants. However, there is no promise that:
>    1) The region will not shrink
>    2) The region will stay where it is

Issue is what is the intended use of the memory range allocated to
/hypervisor in the device-tree on ARM?  What do the Xen developers plan
for?  What is expected?


With FreeBSD, Julien Grall's attempt 5 years ago at getting Xen/ARM
support treated the grant table as distinct from other foreign memory
mappings.  Yet for the current code (which is oriented towards x86) it is
rather easier to treat all foreign mappings the same.

Limiting foreign mappings to a total of 16MB for a 768MB domain is tight.
Was the /hypervisor range intended *strictly* for mapping grant-tables?
Was it intended for the /hypervisor range to dynamically scale with the
size of the domain?  Was it intended for /hypervisor to grow over the
years as hardware got cheaper?

Might it be better to deprecate the /hypervisor range and have domains
allocate any available address space for foreign mappings?

Should the FreeBSD implementation be treating grant tables as distinct
from other foreign mappings?  (is treating them the same likely to
induce buggy behavior on x86?)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



