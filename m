Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ABC8D23AE
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 21:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731292.1136732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC26A-00033a-3v; Tue, 28 May 2024 19:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731292.1136732; Tue, 28 May 2024 19:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC26A-00030j-15; Tue, 28 May 2024 19:03:02 +0000
Received: by outflank-mailman (input) for mailman id 731292;
 Tue, 28 May 2024 19:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRkd=M7=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1sC268-00030d-Un
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 19:03:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5e74b7d-1d24-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 21:02:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDB8962348;
 Tue, 28 May 2024 19:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F71C32786;
 Tue, 28 May 2024 19:02:57 +0000 (UTC)
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
X-Inumbo-ID: e5e74b7d-1d24-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716922977;
	bh=GD3/dN6ZzfzJRaXladDHQA1hNTErMD4rTa0AbrBxOys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K19noRN/T7YC+i1E7Fkaoig7m7TchlX7Ihp54S2kNAmAvFxD77KVCgZp7oBpY/nrE
	 vH9MWNO2aQmpDABcsobPDhIHqyq3jmSTGwQ0RhfWTuQP1x93puLo6ULybvUuu4fFns
	 +Um0sNgoRC2z1kA5bcjukNYj3/wU+18y3tkozg5Q=
Date: Tue, 28 May 2024 21:03:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Xen.org security team" <security@xen.org>
Subject: Re: CVE-2021-47377: kernel: xen/balloon: use a kernel thread instead
 a workqueue
Message-ID: <2024052826-overpass-manliness-7f2c@gregkh>
References: <2024041747-CVE-2024-26908-4690@gregkh>
 <9fba239d-2e22-425b-b45f-86ecf016c2fd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fba239d-2e22-425b-b45f-86ecf016c2fd@suse.com>

On Mon, May 27, 2024 at 12:58:16PM +0200, Juergen Gross wrote:
> Hi,
> 
> I'd like to dispute CVE-2021-47377: the issue fixed by upstream commit
> 8480ed9c2bbd56fc86524998e5f2e3e22f5038f6 can in no way be triggered by
> an unprivileged user or by a remote attack of the system, as it requires
> initiation of memory ballooning of the running system. This can be done
> only by either a host admin or by an admin of the guest which might
> suffer the detection of the hanging workqueue.
> 
> Please revoke this CVE.

Ah, good catch, this came in as part of the GSD import, and I missed
that this required that type of permissions.  Now revoked, thanks for
the review!

greg k-h

