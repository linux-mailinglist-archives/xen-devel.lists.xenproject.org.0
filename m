Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F937C7A8B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616208.958056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5MT-0005OK-KJ; Thu, 12 Oct 2023 23:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616208.958056; Thu, 12 Oct 2023 23:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5MT-0005Ma-Gk; Thu, 12 Oct 2023 23:45:01 +0000
Received: by outflank-mailman (input) for mailman id 616208;
 Thu, 12 Oct 2023 23:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr5MR-0005LB-RH
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:44:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a23f99-6959-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 01:44:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EF94ACE2C7C;
 Thu, 12 Oct 2023 23:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA6EC433C8;
 Thu, 12 Oct 2023 23:44:49 +0000 (UTC)
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
X-Inumbo-ID: 58a23f99-6959-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697154291;
	bh=9quvGr8tKgOKJ9gCBM1PIW04shRwHtckxR5D9UVUfmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZgqTxfbTROf/BLK2yTtmhAqOeUBamYnORy5dE/G+JThf7ZG+LheCz1rn4G6bDEKc8
	 On8TjiWM0GuNlwHIkNnqw0gPO5osj3PWRyO4FPuMtJyIe2tBlRFxHwavyoA4G7mSQb
	 eswuRkjifV99ElTr+QHUf2rTUc/dr2nZYGAsIEgFo6ejFUBD1nVn3yH1T8aAZi1WI2
	 I4r503pTTvdl+KvhaHJCVDyiyCjmgOmp+RHIZygZJw66Drz0u7UxQkI1FX5psfWW0g
	 PWa2oNg/LvsqtBxqo6xEdtK6vXAcpSLdL422x5VybYO+zuPxSUNQ74HiH3eoOEGv5X
	 3SKDctSGbTwVw==
Date: Thu, 12 Oct 2023 16:44:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
In-Reply-To: <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121643150.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> The definition of MC_NCLASSES contained a violation of MISRA C:2012
> Rule 10.1, therefore by moving it as an enumeration constant resolves the
> violation and makes it more resilient to possible additions to that enum.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

