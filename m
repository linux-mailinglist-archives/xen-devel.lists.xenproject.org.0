Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080317C9142
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616944.959340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRRw-0006En-PD; Fri, 13 Oct 2023 23:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616944.959340; Fri, 13 Oct 2023 23:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRRw-0006Cj-LL; Fri, 13 Oct 2023 23:20:08 +0000
Received: by outflank-mailman (input) for mailman id 616944;
 Fri, 13 Oct 2023 23:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRRu-0006As-W5
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:20:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab46617-6a1f-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:20:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC02A621BF;
 Fri, 13 Oct 2023 23:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8BBC433C8;
 Fri, 13 Oct 2023 23:20:03 +0000 (UTC)
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
X-Inumbo-ID: 0ab46617-6a1f-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697239204;
	bh=YXrD7RxguoGKemOAbsD5zWRMjATYaPjRi4C5tjERld8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qddzvx2t8ArNtXeyJ6c/2aaRS1fdjbWdRyd6qrUNMba1+Woe9tlwwrwo77H5QkX2i
	 1QYG09qiAM1nDwPQpVzRuR2D6GkbS44peTByiRxhOVPSW3ZOzrjk/ASM7WThj0yI4U
	 l/EXQWCb5GML4H/I9dwRlkZxvweQv/FFLT/EOKMyHxNkqpXSn118ELU58Hiq8ekvU9
	 T90zDh31WAXITkKqXMdMsWxDzoeD1e5jARfs19iSekArTA4owa+VW0CREW3Fyl8rLG
	 8AjXhivrKxzEjmOsYEbeo6P+Jv3FK9Y2tNYPmzPgbS8jGVVRnVai7bc6dSdcpfwF+f
	 zuKncCSCqMlnQ==
Date: Fri, 13 Oct 2023 16:20:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 08/10] arm/vgic-v3: address a violation of MISRA
 C:2012 Rule 8.2
In-Reply-To: <d508f7bcbc1f6e98b0115774c7b570769b3554ce.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131619530.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <d508f7bcbc1f6e98b0115774c7b570769b3554ce.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter name, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

