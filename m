Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2A7DE8C7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626662.977111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKNf-0008Eh-4K; Wed, 01 Nov 2023 23:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626662.977111; Wed, 01 Nov 2023 23:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKNf-0008C7-1L; Wed, 01 Nov 2023 23:12:11 +0000
Received: by outflank-mailman (input) for mailman id 626662;
 Wed, 01 Nov 2023 23:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+92=GO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qyKNe-0008C1-5R
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:12:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e32790-790c-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 00:12:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A95DEB81AC8;
 Wed,  1 Nov 2023 23:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63B9C433C7;
 Wed,  1 Nov 2023 23:12:06 +0000 (UTC)
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
X-Inumbo-ID: 14e32790-790c-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698880328;
	bh=UD/Os8GGsFBO/mGOPgNggotHFu0irVWRZK/pH03Vmbc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I7vemr7hA4gCtYi8Ivf2mAHdg9XnmB1+q4DTlvetOc5qBzyLZGSQ6mhW3Tuv8gxzw
	 TJPTrMiwswibeZxuLEY9K96PONIkV8O/olFIkgSCk08KluiogZKYQvTUlCrryiCSP0
	 21lXjnPaDipOocDSjMPyzP1k1uRKSBxa+JdYpweTzrR1sE0L+FqC4LihdO3czf/ffd
	 bT3AGifk2LVxLmSGA6tXdhZnpX88J6D26UkADNWtezWz8pqVzO0YyEKNrXUYrqiwKo
	 V+1Ys5X6aZaWast6FnC/DIGTPvA5yCBAiEvDXNDy0tUwq+9t5oCbSFyMo1C1JT04x+
	 dbSyXaUd2OqeQ==
Date: Wed, 1 Nov 2023 16:12:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v6 3/8] x86: add asmlinkage macro to
 variables only used in asm code
In-Reply-To: <8e7762db94449c18e88171658c758a227e1fae9b.1698829473.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311011611580.2125691@ubuntu-linux-20-04-desktop>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com> <8e7762db94449c18e88171658c758a227e1fae9b.1698829473.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Nov 2023, Nicola Vetrini wrote:
> To avoid a violation of MISRA C:2012 Rule 8.4, as permitted
> by docs/misra/rules.rst.
> 
> The current_stack_pointer is a declaration: mark it as such
> for ECLAIR.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

