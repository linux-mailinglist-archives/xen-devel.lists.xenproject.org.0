Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B44F76F6A5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576685.903098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiz8-00077K-6N; Fri, 04 Aug 2023 00:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576685.903098; Fri, 04 Aug 2023 00:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiz8-00075d-3W; Fri, 04 Aug 2023 00:48:06 +0000
Received: by outflank-mailman (input) for mailman id 576685;
 Fri, 04 Aug 2023 00:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRiz6-00075V-As
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:48:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 903e7fed-3260-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 02:48:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3FED61EB3;
 Fri,  4 Aug 2023 00:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682E8C433C7;
 Fri,  4 Aug 2023 00:47:59 +0000 (UTC)
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
X-Inumbo-ID: 903e7fed-3260-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691110080;
	bh=EaAQPFoaGOI3ZfSLVu0aZr8HeevyqtL/S0G/iXavdas=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XAfB44FZtGHWgzqurllVDo3K6OoWTQj6opwOBRDxYSxGTX+ChqP6lPKNLjxR/eHi3
	 q76aosi2+qHSt3VTcFl8LPqpbtvlWiauuNcdrSiBu5l1+62SG44jLMMMjv3CiIsfN0
	 VGMIGRKV2qUbuzD4GSWvZYjwFvNBdf2wYyhmsquwTJcxx7ExLrvWlDlj/zt8wYlmze
	 Q/VbpAIF9p5/T1jL6NnZ8zqNEyErAxlk7BwnIHKZYaZN1bqL3Y3RIH6hWUlis6Kr+a
	 wnxZpuAsDcZH2e81UcWBOqQ+8GGOm0d8bBwZhcFNZKlpOIV7qkfTtNLsbEdBGL6Ety
	 cZ57NX4cJXl1g==
Date: Thu, 3 Aug 2023 17:47:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH 06/13] xen/mem_access: address violations of MISRA
 C:2012 Rule 7.3
In-Reply-To: <7e4ff67a24206177c5a304055f395cc2983bb994.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031746340.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <7e4ff67a24206177c5a304055f395cc2983bb994.1691053438.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

