Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB95328976
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 19:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91917.173502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmrC-000676-Nn; Mon, 01 Mar 2021 18:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91917.173502; Mon, 01 Mar 2021 18:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmrC-00066g-KR; Mon, 01 Mar 2021 18:01:22 +0000
Received: by outflank-mailman (input) for mailman id 91917;
 Mon, 01 Mar 2021 18:01:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lGmrA-00066V-KQ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 18:01:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lGmr7-0005n5-Lf; Mon, 01 Mar 2021 18:01:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lGmr7-0006bV-Cv; Mon, 01 Mar 2021 18:01:17 +0000
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
	bh=EqTkK1Obth/uelctgemBgB6AfCcwT1n6aNzuOY9QFmw=; b=5clfxH0yfmlJ1SgVlRTtvenPOp
	Mf1ATYtx/ewTLTAehK1LpRgYemx5eAyHgEn077/ePNIhGIYUW5tMxTkGuY1Ik+iYBlltUOXbe1bPS
	IerCAPTiqnSKK4Pqi9Gg2k0RR7SxC8WXvW532CDi2yAo4lceOwOa1IIuhJ3hCD3UYegI=;
Subject: [for-4.15] Re: [PATCH XENSTORE v1 00/10] Code analysis fixes
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>,
 Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <759336de-727b-db67-b082-709d5ee735f8@xen.org>
Date: Mon, 1 Mar 2021 18:01:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

I have tagged the e-mail with 4.15 as I think we likely want some of the 
patches to be in the next release.

As a minimum, we get the following:
   - patch #7: xenstore: handle do_mkdir and do_rm failure
   - patch #8: xenstore: add missing NULL check
   - patch #10: xs: add error handling

The first two add missing NULL check in runtime code in XenStored. The 
3rd one adds a missing NULL check in xs_is_domain_introduced() in 
libxenstore (can be used at runtime by xenpaging at least).

In addition to that, I would like to consider patch #3: xenstore: check 
formats of trace. It is allowing the compiler to check the format printf 
for trace(). This should be low-risk.

For the rest is a mix of silencing coverity and potential errors either 
at init or in a standalone binaries.

The init ones would be useful (patch #1, #5, #9) for Xenstored 
LiveUpdate as they would be potential triggered when upgrading the 
binary. But I am not sure whether we consider LiveUpdate supported.

Any thoughts?

Cheers,

On 26/02/2021 14:41, Norbert Manthey wrote:
> Dear all,
> 
> we have been running some code analysis tools on the xenstore code, and triaged
> the results. This series presents the robustness fixes we identified.
> 
> Best,
> Norbert
> 
> Michael Kurth (1):
>    xenstore: add missing NULL check
> 
> Norbert Manthey (9):
>    xenstore: add missing NULL check
>    xenstore: fix print format string
>    xenstore: check formats of trace
>    xenstore_client: handle memory on error
>    xenstore: handle daemon creation errors
>    xenstored: handle port reads correctly
>    xenstore: handle do_mkdir and do_rm failure
>    xs: handle daemon socket error
>    xs: add error handling
> 
>   tools/libs/store/xs.c            | 10 +++++++++-
>   tools/xenstore/xenstore_client.c |  3 +++
>   tools/xenstore/xenstored_core.c  | 16 ++++++++++++++++
>   tools/xenstore/xenstored_core.h  |  2 +-
>   tools/xenstore/xenstored_posix.c |  6 +++++-
>   tools/xenstore/xs_tdb_dump.c     |  6 +++---
>   6 files changed, 37 insertions(+), 6 deletions(-)
> 

-- 
Julien Grall

