Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659AD1DA36E
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 23:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb9gL-0003Jo-3M; Tue, 19 May 2020 21:21:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2w/r=7B=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jb9gJ-0003Jj-0T
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 21:21:47 +0000
X-Inumbo-ID: bde4ef30-9a16-11ea-a991-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bde4ef30-9a16-11ea-a991-12813bfff9fa;
 Tue, 19 May 2020 21:21:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD7652072C;
 Tue, 19 May 2020 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589923305;
 bh=lFItuiU0pJUpD20mjrwscQrNyRXkmctTL7PaHATfXeU=;
 h=Date:From:To:cc:Subject:From;
 b=Rm/b/c1sL3T9ygTYuV73v9qIV4bPgCH6i5qp/gs5MPwBsRTDEGfDBm2+5h8TirQXN
 3O6ARRszLJaT/tle/+W516Rec3S2vjK/9HjBYPJ8SoFHxOVOqonn4agAXXpo9N94WR
 IviIFT0hMX5XKRfEqUj+N8ijFUfBnDB1JQTsgkh4=
Date: Tue, 19 May 2020 14:21:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com, boris.ostrovsky@oracle.com
Subject: grant table issues mapping a ring order 10
Message-ID: <alpine.DEB.2.21.2005191252040.27502@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, sstabellini@kernel.org, jbeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen, Boris,

I am trying to increase the size of the rings used for Xen 9pfs
connections for performance reasons and also to reduce the likehood of
the backend having to wait on the frontend to free up space from the
ring.

FYI I realized that we cannot choose order 11 or greater in Linux
because then we incur into the hard limit CONFIG_FORCE_MAX_ZONEORDER=11.
But that is not the reason why I am writing to you :-)


The reason why I am writing is that even order 10 fails for some
grant-table related reason I cannot explain. There are two rings, each
of them order 10. Mapping the first ring results into an error. (Order 9
works fine, resulting in both rings being mapped correctly.)

QEMU tries to map the refs but gets an error:

  gnttab: error: mmap failed: Invalid argument
  xen be: 9pfs-0: xen be: 9pfs-0: xengnttab_map_domain_grant_refs failed: Invalid argument
  xengnttab_map_domain_grant_refs failed: Invalid argument

The error comes from Xen. The hypervisor returns GNTST_bad_gntref to
Linux (drivers/xen/grant-table.c:gnttab_map_refs). Then:

    	if (map->map_ops[i].status) {
			err = -EINVAL;
			continue;
		}

So Linux returns -EINVAL to QEMU. The ref seem to be garbage. The
following printks are in Xen in the implemenation of map_grant_ref:

(XEN) DEBUG map_grant_ref 1017 ref=998 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=999 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=2050669706 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x7a3abc8a for d1
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=19 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=56423797 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x35cf575 for d1
(XEN) DEBUG map_grant_ref 1013 ref=348793 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x55279 for d1
(XEN) DEBUG map_grant_ref 1013 ref=1589921828 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=2070386184 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x7b679608 for d1
(XEN) DEBUG map_grant_ref 1013 ref=3421871 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af for d1
(XEN) DEBUG map_grant_ref 1013 ref=1589921828 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=875999099 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af7b for d1
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=2705045486 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0xa13bb7ee for d1
(XEN) DEBUG map_grant_ref 1013 ref=4294967295 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0xffffffff for d1
(XEN) DEBUG map_grant_ref 1013 ref=213291910 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0xcb69386 for d1
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=4912 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0x1330 for d1
(XEN) DEBUG map_grant_ref 1013 ref=167788925 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
(XEN) DEBUG map_grant_ref 1017 ref=24 nr=2560
(XEN) DEBUG map_grant_ref 1013 ref=167788925 nr=2560
(XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
(XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560


Full logs https://pastebin.com/QLTUaUGJ
It is worth mentioning that no limits are being reached: we are below
2500 entries per domain and below the 64 pages of grant refs per domain.

What it seems to happen is that after ref 999, the next refs are garbage.
Do you have any ideas why?


I tracked the gnttab_expand calls in Dom0 and they seemed to be done
correctly. We need 5 grant table pages:

- order 10 -> 1024 refs
- 2 rings -> 2048 refs
- 512 refs per grant table page -> 4 pages
- plus few others refs by default -> 5 pages

[    3.896558] DEBUG gnttab_expand 1287 cur=1 extra=1 max=64 rc=0
[    5.115189] DEBUG gnttab_expand 1287 cur=2 extra=1 max=64 rc=0
[    6.334027] DEBUG gnttab_expand 1287 cur=3 extra=1 max=64 rc=0
[    7.350523] DEBUG gnttab_expand 1287 cur=4 extra=1 max=64 rc=0

As expected gnttab_expand gets called 4 times to add 4 more pages to the
initial page.


Thanks,

Stefano

