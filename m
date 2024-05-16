Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05318C6FAD
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722748.1127044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7POc-0005Wv-Eq; Thu, 16 May 2024 00:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722748.1127044; Thu, 16 May 2024 00:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7POc-0005US-CI; Thu, 16 May 2024 00:54:58 +0000
Received: by outflank-mailman (input) for mailman id 722748;
 Thu, 16 May 2024 00:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7POa-0004vR-Q3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:54:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e92e20f5-131e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:54:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 166806163D;
 Thu, 16 May 2024 00:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF2DC32786;
 Thu, 16 May 2024 00:54:53 +0000 (UTC)
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
X-Inumbo-ID: e92e20f5-131e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820894;
	bh=w+bUDSePBm3kOiKXdGcHoqpjZkpwd5sLkggqM0vWmbs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VJAqJVXb7Cre7G4723V8LbB4C6iNfBcCCNMRvdKVF0nQ7K9tdl8PeRqNjpCVrXz6f
	 C4GbCCWJKa7CVLMxABG0npL51lYLhICySpUdHVJ8deMsIQEy2+P654QXFAJMpMJ8Av
	 pS0EdzT9pRTFIQxDQGS5ShWfpprKAEt8FObY5ri4mu4wP8tqCpp5M/1R0X1pLuOD6S
	 FLms5q+U+JtLk8yafxEBv+q40titS8OlhyMsaJ5MwyL/FGJzaYQusg1f0/myrCD4jt
	 liCmO7GuC4M/UtZj8tgfcz1+PTHIREjgU43/b0z1yakD+/lnfEw+xjvTtyvbWwzCjM
	 VHBoQpnPgIejA==
Date: Wed, 15 May 2024 17:54:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 15/15] x86/hvm: make AMD-V and Intel VT-x support
 configurable
In-Reply-To: <3ad7c0279da67e564713140fb5b247349cf4dccc.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151754420.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <3ad7c0279da67e564713140fb5b247349cf4dccc.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Provide the user with configuration control over the cpu virtualization support
> in Xen by making SVM and VMX options user selectable.
> 
> To preserve the current default behavior, both options depend on HVM and
> default to value of HVM.
> 
> To prevent users from unknowingly disabling virtualization support, make the
> controls user selectable only if EXPERT is enabled.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


