Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD138D5769
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733175.1139295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqaT-0004tU-NR; Fri, 31 May 2024 00:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733175.1139295; Fri, 31 May 2024 00:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqaT-0004rd-Kp; Fri, 31 May 2024 00:57:41 +0000
Received: by outflank-mailman (input) for mailman id 733175;
 Fri, 31 May 2024 00:57:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCqaR-0004rX-T6
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 00:57:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6326d5f-1ee8-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 02:57:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47F4862A2B;
 Fri, 31 May 2024 00:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F58C2BBFC;
 Fri, 31 May 2024 00:57:34 +0000 (UTC)
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
X-Inumbo-ID: c6326d5f-1ee8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717117057;
	bh=/eEABicd2wC3kYUMST9f2jcve2jqMmLFTvCQaWYiGE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pfK43IXskjZS7Z+xDEEqvqItg1tIc+dkpVENHxzVcCsXpXhE21lkZNJ1OaUCogzxB
	 Q7zgU0KlhB9UJNxTPH/5CtBomvgii//L1FAIL6CDhPSJNSzwrtSDD0+QPqE4VcxZLh
	 D8Hbo79PBE7eegi1OZVwzcSo/ygiQ4isdTwRi4pT8IIsy3DHJdMxFwaA7I8jL+DxAB
	 zGXHKN9N3naybwmdnpTW2Z2vnZuUhZHI9ltJZz2F6CFNGsafsKhR/0WiYbt6AUYsx9
	 RokDTrTiWYnLiQAAhUVBgjZFnKG2daZwB8SCHGn1lHNLaqayxFpA1Vnk5hDf8wD1EV
	 BunqxwUT3u6tw==
Date: Thu, 30 May 2024 17:57:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2 03/13] ARM/bitops: Change find_first_set_bit() to be
 a define
In-Reply-To: <20240524200338.1232391-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405301757220.2557291@ubuntu-linux-20-04-desktop>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com> <20240524200338.1232391-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Andrew Cooper wrote:
> This is in order to maintain bisectability through the subsequent changes, as
> the order of definitions is altered.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


