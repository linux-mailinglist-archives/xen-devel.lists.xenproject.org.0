Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B854F2CB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 10:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351108.577620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27Hi-0006am-2T; Fri, 17 Jun 2022 08:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351108.577620; Fri, 17 Jun 2022 08:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27Hh-0006Z0-Vm; Fri, 17 Jun 2022 08:24:53 +0000
Received: by outflank-mailman (input) for mailman id 351108;
 Fri, 17 Jun 2022 08:24:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o27Hh-0006Yu-7j
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 08:24:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27Hg-0006Jm-BC; Fri, 17 Jun 2022 08:24:52 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.0.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27Hg-0005vd-4I; Fri, 17 Jun 2022 08:24:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=qvHYX2J41cIKah7mxPn4mYSyPxiYpNdLglsYhEX5rlw=; b=j4GwyG/sTiBRa/lbDGXKdCrN5C
	ADMWVPuun6G/NxhVQya48HEwsdtxPEfMkorTh6Dpzc7X+BeAXjZR3l8iuMw9zD/vMqKGpHzTtNVFJ
	zn71+eqLDTluBYI+azwK88d+czKEGWkFQIbgXEeAtp88Ammm6/ZfRZJfoQsaoUlUvDrU=;
Message-ID: <7e4a9c8d-f88c-83dd-535a-b8fae3ac2f6a@xen.org>
Date: Fri, 17 Jun 2022 09:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v2 00/29] Toolstack build system improvement, toward
 non-recursive makefiles
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <Yqsw5mmC8KHVbtrb@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Yqsw5mmC8KHVbtrb@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2022 14:32, Anthony PERARD wrote:
> Hi,

Hi Anthony,

> There's quite a few patch in this series that are reviewed and could be
> committed. The one reviewed don't depends on the other ones.
> 
> The list I've gathered that I think are reviewed properly are:
> 
> 11: tools/xenstore: Cleanup makefile
> 14: libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
> 15: libs: Remove need for *installlocal targets
> 16: libs,tools/include: Clean "clean" targets
> 17: libs: Rename $(SRCS-y) to $(OBJS-y)
> 18: libs/guest: rename ELF_OBJS to LIBELF_OBJS
> 19: libs/guest: rework CFLAGS
> 20: libs/store: use of -iquote instead of -I
> 21: libs/stat: Fix and rework python-bindings build
> 22: libs/stat: Fix and rework perl-binding build
> 24: stubdom: introduce xenlibs.mk
> 25: tools/libs: create Makefile.common to be used by stubdom build system
> 26: tools/xenstore: introduce Makefile.common to be used by stubdom
> 27: stubdom: build xenstore*-stubdom using new Makefile.common
> 28: stubdom: xenlibs linkfarm, ignore non-regular files
> 29: tools/ocaml: fix build dependency target

Committed.

> 
> (I didn't a run with them on our gitlab ci, and no build issue.)

I am guessing you mean you *did* a run?

Cheers,

-- 
Julien Grall

