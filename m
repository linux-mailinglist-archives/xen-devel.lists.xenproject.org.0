Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D30809761
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650278.1015635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOvA-0001kv-8r; Fri, 08 Dec 2023 00:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650278.1015635; Fri, 08 Dec 2023 00:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOvA-0001jI-6D; Fri, 08 Dec 2023 00:40:48 +0000
Received: by outflank-mailman (input) for mailman id 650278;
 Fri, 08 Dec 2023 00:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOv9-0001jA-6E
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:40:47 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c549b5a-9562-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:40:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0113FB82A3A;
 Fri,  8 Dec 2023 00:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B2CC433C8;
 Fri,  8 Dec 2023 00:40:43 +0000 (UTC)
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
X-Inumbo-ID: 6c549b5a-9562-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701996044;
	bh=elH7okRRSOuS8Ocawq6tHYicZUCVwzOcqaAtkKsK/9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aprSYD+oTGaK36U7gihYjkwrS7fF6I7zzuPssUmYVdrQyR/B/jE+dVxU2ZP0LkZdv
	 a3DmJdAwvyJvzMv19G6LUFkoe47OV0of/p0DPbI0VGzASnmWzvui6prn0KLdgpLu4+
	 /fXaZ6g1Ij+VddotZkMJR+QytTqR0u8uUZJcy1dSrwmM6cN/6We9zvsqd8ushcJYd+
	 CfhHkXcVz6Gq3uDMAe7WkQKvxLUG2AWczfUX8RSXPcNyVoTUGGk8UPBXwjC6fhG+8O
	 ULKN0+Paq5lDgoz5DBIawDZQjnsRIl5YCud+c1V1NzI5wb+Er4tBlnzbVGWHL3V2lK
	 kXRS1iz7FQsNw==
Date: Thu, 7 Dec 2023 16:40:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 4/5] x86/mm: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <428b868a2b1aec2b50ccbe510bc3089203ac9c7b.1701936906.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071640330.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701936906.git.federico.serafini@bugseng.com> <428b868a2b1aec2b50ccbe510bc3089203ac9c7b.1701936906.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

