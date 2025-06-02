Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BDDACBD5F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003838.1383446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDkZ-0000T8-5u; Mon, 02 Jun 2025 22:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003838.1383446; Mon, 02 Jun 2025 22:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDkZ-0000R5-3J; Mon, 02 Jun 2025 22:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1003838;
 Mon, 02 Jun 2025 22:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMDkX-0000Qz-Mc
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:35:21 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dceb4e8a-4001-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 00:35:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B38414A543;
 Mon,  2 Jun 2025 22:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BBEC4CEEB;
 Mon,  2 Jun 2025 22:35:16 +0000 (UTC)
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
X-Inumbo-ID: dceb4e8a-4001-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748903718;
	bh=2E5pzV8xvCugbBU2TwpfB0ndT5dcL5RpcchY2wh3Mls=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MvPkEnp9tvixn7Go/ANFbRyUriKh8ZjLpEVPQgVXhZQNIT8ASsfaZk9NNtgrwoAts
	 EaYoifYWqnFvmUntulUvZaU2l/V2VUaoCNn82mI839nUix1oIRxpaQCemzm5m9eiX+
	 wszx5ctI4MfJvOFVAga9LWNVpdH2LJNcHdCSVb5YS5/X0pXoCI1yzHNuISBGLXd4VP
	 5CvnsZhI0dAu7MxxZ9JKvxozflBr64QWAWxAeAy7mf6gixD3yMqRzqZPqYpDGxRLck
	 OFtagfmPzuHlBZWyRoj/cKwQvcFl7KPPwKv38bQ1aMIMFnb5wKYlLDNwlRef5TSZ9j
	 yMG7o9eFABjrQ==
Date: Mon, 2 Jun 2025 15:35:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    andrew.cooper3@citrix.com, edgar.iglesias@amd.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/5] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
In-Reply-To: <20250530134559.1434255-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2506021535100.1147082@ubuntu-linux-20-04-desktop>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com> <20250530134559.1434255-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a per-domain way to optionally disable traps for accesses
> to unmapped addresses.
> 
> The domain flag is general but it's only implemented for ARM for now.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I am OK with the name "XEN_DOMCTL_CDF_trap_unmapped_accesses" being long
but I would also be OK with a shorter name if it is still clear enough.



