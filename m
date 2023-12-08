Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918E80975F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650275.1015625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOuL-0000LF-T0; Fri, 08 Dec 2023 00:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650275.1015625; Fri, 08 Dec 2023 00:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOuL-0000JJ-Q6; Fri, 08 Dec 2023 00:39:57 +0000
Received: by outflank-mailman (input) for mailman id 650275;
 Fri, 08 Dec 2023 00:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOuK-0000JD-Cd
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:39:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e553ef2-9562-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 01:39:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 58C86B82AC7;
 Fri,  8 Dec 2023 00:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9585C433CA;
 Fri,  8 Dec 2023 00:39:52 +0000 (UTC)
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
X-Inumbo-ID: 4e553ef2-9562-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701995993;
	bh=V/rE++xkzEZjyEiW4nQZHQqmrcmZFQ/RpQiX3XT6qdg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=go63I0z1JZRlGQrHIsm+IZLxjuBpM/8zbCYKarrki6Wbsg7C+RU/b32cXIzrHgYOU
	 l5fRbRa/bTCJtbRc+T+cg1KPC1j6VdWNuyataxI3P8B4R1NQu8p3eUL5qT8pQ09fUR
	 BLqQmuR4S8nLPh1KmhylT/WbK8WT4FDRb0nC2ZNHT9nX2X3z66KWQM5KU/3TwTuqd7
	 gKAy6j8AvxnfMOlN2V22dmIp6wFjjk9revSRGESIHxqaRqUJW/JLwbfelMKogIaBzO
	 +ToHl6aIpRDZPS75j3wBIWIjTBxEoXG/zYCIr50A8rLXdBnh9rB4LidrGgxHf5yv6R
	 xIWHtB+1m7TWg==
Date: Thu, 7 Dec 2023 16:39:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 5/5] AMD/IOMMU: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <68a1922cce9a68a8b69661d564fccc012cf5f414.1701936906.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071639430.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701936906.git.federico.serafini@bugseng.com> <68a1922cce9a68a8b69661d564fccc012cf5f414.1701936906.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Federico Serafini wrote:
> Add missing parameter names to address violations of MISRA C:2012
> Rule 8.2. Remove trailing spaces and use C standard types to comply
> with XEN coding style. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

