Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD38CB4564
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 01:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183417.1506121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTUCh-00038a-EQ; Thu, 11 Dec 2025 00:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183417.1506121; Thu, 11 Dec 2025 00:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTUCh-00036A-Ao; Thu, 11 Dec 2025 00:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1183417;
 Thu, 11 Dec 2025 00:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3Jk=6R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vTUCf-000364-SU
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 00:06:41 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 442abe20-d625-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 01:06:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 53E806011E;
 Thu, 11 Dec 2025 00:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21894C4CEF1;
 Thu, 11 Dec 2025 00:06:37 +0000 (UTC)
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
X-Inumbo-ID: 442abe20-d625-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765411598;
	bh=yRc9t9/N4g1pgugjP4Fx/9kFP8G3ynGxtVmYqPb1VCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oDgcWit232fyOY8vSp7OhSYRpjaUTBiEMomS5ZTtHEYPVvUpAszyCi+kc19ogOnmg
	 n/urLFxBLU+s4o4+xQKXL0MRyoWplE1ItGjwnL+dK+Yvrx4l0NY1Rd2rH40K+srC0m
	 LLU2Pf2W1u8hzJdhpf+EKQiEFaJCXH1tIFtx7wVe/P7BVs9u3IkiJFn+aT99Wqqztw
	 iLXB33Wqk+ah5OMbx4JKB4zK0qSBNBq49pWTg8BQlCOLHKfpZwT1bcRgJhAIfV04dp
	 eNTyxSK8Pr0Cxt2xYJ0CoYN088SvUDgsFy60UtBHStprXFnFYifCcGjxrBmzDKLKCp
	 jxUfkM7aTDmAg==
Date: Wed, 10 Dec 2025 16:06:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 3/5] x86/ucode: Don't cast away const-ness in
 cmp_patch_id()
In-Reply-To: <c260c81b7be1e5b27cd6c6705709c060@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2512101606290.19429@ubuntu-linux-20-04-desktop>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com> <20251210183019.2241560-4-andrew.cooper3@citrix.com> <c260c81b7be1e5b27cd6c6705709c060@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Dec 2025, Nicola Vetrini wrote:
> On 2025-12-10 19:30, Andrew Cooper wrote:
> > Fixes a volation of MISRA rule 11.8.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


