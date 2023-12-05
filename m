Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A678B806227
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 23:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648587.1012603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAeI6-0007Of-6Z; Tue, 05 Dec 2023 22:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648587.1012603; Tue, 05 Dec 2023 22:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAeI6-0007N1-3V; Tue, 05 Dec 2023 22:53:22 +0000
Received: by outflank-mailman (input) for mailman id 648587;
 Tue, 05 Dec 2023 22:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQDs=HQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAeI5-0007Mt-0R
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 22:53:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a630e3-93c1-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 23:53:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 45A59B81D5E;
 Tue,  5 Dec 2023 22:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764D6C433C7;
 Tue,  5 Dec 2023 22:53:17 +0000 (UTC)
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
X-Inumbo-ID: 15a630e3-93c1-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701816798;
	bh=KyOL/7NMLx7bo4Tol2EvWyUTqHwZyC8Cqw72KnUv1ns=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m6p2+Am44vuWoXOsZEhT2WtaepKj2Wvmot1QyGyI2E6rpfW1i1jfLdmB/QqF+e6xI
	 qtyyoSREKG3i/7qp/xv0f9o3996rgM6m4Dz6Ca1MmmEkieuDXcy2YXUF2B/GFv0T1D
	 2hU4T02ORPHZC7L2PK1Fq8n5StvqO7IYAp6LuJC+0tve1SCRpKtXfcJg5eS4o1MvrY
	 Srhc9MFropC7lJQEW6ylJqCwu3kXvJUK6EdYolfP1bm70RBjaPnZHC0oJ/VmzZlEjF
	 xgkTgqoZ3Lh++rveuVAMEWzcSE1yS9vqWUP+kiSEFJggesNgGyvSTArjAK/OfJ9Yuw
	 8gRd1UA/iSCqg==
Date: Tue, 5 Dec 2023 14:53:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2] x86/DMI: adjustments to comply with Misra C:2012 Rule
 9.3
In-Reply-To: <1ca903e7-ed2c-435e-999d-2a8519957498@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312051453090.110490@ubuntu-linux-20-04-desktop>
References: <1ca903e7-ed2c-435e-999d-2a8519957498@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Jan Beulich wrote:
> The rule demands that all array elements be initialized (or dedicated
> initializers be used). Introduce a small set of macros to allow doing so
> without unduly affecting use sites (in particular in terms of how many
> elements .matches[] actually has; right now there's no use of
> DMI_MATCH4(), so we could even consider reducing the array size to 3).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


