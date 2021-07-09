Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CA3C2671
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 16:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153722.283987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1rxw-0005sJ-UC; Fri, 09 Jul 2021 14:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153722.283987; Fri, 09 Jul 2021 14:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1rxw-0005pK-Qy; Fri, 09 Jul 2021 14:58:56 +0000
Received: by outflank-mailman (input) for mailman id 153722;
 Fri, 09 Jul 2021 14:58:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1rxv-0005pE-Ri
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 14:58:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1rxI-0002fX-Sa; Fri, 09 Jul 2021 14:58:16 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1rxI-00050O-LC; Fri, 09 Jul 2021 14:58:16 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ior2SaE97cRM43UQs43PwiSC3TTJ9FyWh2BNEejkN0M=; b=KklH+ZbbF3R/Sxn3T/9yxUgAZA
	P088sSUW3Ig5n6PerzGoyUgsd+a8+T3pOD4iWfLLVdO19S/Wp4GdMFEu99aX7KbveE8OWGfNrPU1d
	Z3Q8Y2JT2Nlx521hh+56FNB8YVDVQhiPuR/9xseCM/NtBEFXNqNo0ERKiyE8UB8fy7WQ=;
Subject: Re: [PATCH v4 0/5] Fix redefinition errors for toolstack libs
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Julien Grall <jgrall@amazon.com>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <fd842748-18ca-c86d-f961-f2f82971e239@xen.org>
Date: Fri, 9 Jul 2021 15:58:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1623155575.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Costin,

On 08/06/2021 13:35, Costin Lupu wrote:
> For replication I used gcc 10.3 on an Alpine system. In order to replicate the
> redefinition error for PAGE_SIZE one should install the 'fortify-headers'
> package which will change the chain of included headers by indirectly including
> /usr/include/limits.h where PAGE_SIZE and PATH_MAX are defined.
> 
> Changes since v1:
> - Use XC_PAGE_* macros instead of PAGE_* macros
> 
> Changes since v2:
> - Define KDD_PAGE_* macros for changes in debugger/kdd/
> 
> Changes since v3:
> - Use sysconf(_SC_PAGESIZE) instead of getpagesize()
> 
> Costin Lupu (5):
>    tools/debugger: Fix PAGE_SIZE redefinition error
>    tools/libfsimage: Fix PATH_MAX redefinition error
>    tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
>    tools/libs/gnttab: Fix PAGE_SIZE redefinition error
>    tools/ocaml: Fix redefinition errors

Ian gave his acked-by on IRC, so I will commit them in a bit.

Cheers,

> 
>   tools/debugger/kdd/kdd-xen.c                  | 15 ++++------
>   tools/debugger/kdd/kdd.c                      | 19 ++++++-------
>   tools/debugger/kdd/kdd.h                      |  7 +++++
>   tools/libfsimage/ext2fs/fsys_ext2fs.c         |  2 ++
>   tools/libfsimage/reiserfs/fsys_reiserfs.c     |  2 ++
>   tools/libs/foreignmemory/core.c               |  2 +-
>   tools/libs/foreignmemory/freebsd.c            | 10 +++----
>   tools/libs/foreignmemory/linux.c              | 23 +++++++--------
>   tools/libs/foreignmemory/minios.c             |  2 +-
>   tools/libs/foreignmemory/netbsd.c             | 10 +++----
>   tools/libs/foreignmemory/private.h            |  9 +-----
>   tools/libs/gnttab/freebsd.c                   | 28 +++++++++----------
>   tools/libs/gnttab/linux.c                     | 28 +++++++++----------
>   tools/libs/gnttab/netbsd.c                    | 23 +++++++--------
>   tools/ocaml/libs/xc/xenctrl_stubs.c           | 10 +++----
>   .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  4 +++
>   tools/ocaml/libs/xl/xenlight_stubs.c          |  4 +++
>   17 files changed, 98 insertions(+), 100 deletions(-)
> 

-- 
Julien Grall

