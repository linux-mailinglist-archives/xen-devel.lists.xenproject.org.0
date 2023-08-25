Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BF7881DA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590724.923100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRyF-0006UC-97; Fri, 25 Aug 2023 08:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590724.923100; Fri, 25 Aug 2023 08:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRyF-0006SU-4v; Fri, 25 Aug 2023 08:15:07 +0000
Received: by outflank-mailman (input) for mailman id 590724;
 Fri, 25 Aug 2023 08:15:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrQz=EK=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qZRyC-0006SO-V9
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:15:05 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d9ebba6-431f-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:15:02 +0200 (CEST)
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
X-Inumbo-ID: 7d9ebba6-431f-11ee-9b0c-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1692951301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60tr9aFEHnjsY9mPcHCSATo81fQ6Yc8CRVNAxGD2+3k=;
	b=YnaVCUEgDycspjQv7rUeW7YDHio+7YJzQzDuZpXqlnbIF4cYwLoKMV5zHbYZmRshvhQvDS
	qKopvVKCqWmCE3BxpVTUqh91SYjk/3OL0CMRpGkVuXcCI1mGvGI0llynxDDu00LL2CTZop
	cylgXO5mCbf3YkCZyzvXbZPkgYZlShEJ2ha6qQuUCHiYFjJXWVt1jipesLmOUCPSDNk92u
	rO6uZgPq7TDTm8pv897aZVhVjDt+zA2sD/MjXlSQDeL9OeUYi0+v4z/a9KZ5+tXTluvx0b
	vWw3vaYBaGu1ykC0QpCw60MbAHBC+Ib5VRzd95tKmaApz7PQlajiSvkfwfbPpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1692951301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60tr9aFEHnjsY9mPcHCSATo81fQ6Yc8CRVNAxGD2+3k=;
	b=X6xRv7vR6eT/uVXsSMwtU6aa6uPDDy6BM5+YIcmQnhQSZ6/Jl22kApnV1hn7KNppx9PVnU
	mncP4HVMIYZcN2CA==
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: simplify evtchn_do_upcall() call maze
In-Reply-To: <20230824154106.14799-1-jgross@suse.com>
References: <20230824154106.14799-1-jgross@suse.com>
Date: Fri, 25 Aug 2023 10:15:01 +0200
Message-ID: <87zg2fbksa.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 24 2023 at 17:41, Juergen Gross wrote:
> There are several functions involved for performing the functionality
> of evtchn_do_upcall():
>
> - __xen_evtchn_do_upcall() doing the real work
> - xen_hvm_evtchn_do_upcall() just being a wrapper for
>   __xen_evtchn_do_upcall(), exposed for external callers
> - xen_evtchn_do_upcall() calling __xen_evtchn_do_upcall(), too, but
>   without any user
>
> Simplify this maze by:
>
> - removing the unused xen_evtchn_do_upcall()
> - removing xen_hvm_evtchn_do_upcall() as the only left caller of
>   __xen_evtchn_do_upcall(), while renaming __xen_evtchn_do_upcall() to
>   xen_evtchn_do_upcall()
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

