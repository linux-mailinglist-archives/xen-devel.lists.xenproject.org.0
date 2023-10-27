Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8727DA1FF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 22:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624637.973241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwTlO-0005Ma-TA; Fri, 27 Oct 2023 20:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624637.973241; Fri, 27 Oct 2023 20:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwTlO-0005Jp-Pe; Fri, 27 Oct 2023 20:49:02 +0000
Received: by outflank-mailman (input) for mailman id 624637;
 Fri, 27 Oct 2023 20:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HzCB=GJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qwTlN-0005Jj-0E
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 20:49:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3cf286-750a-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 22:48:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64DBF60D29;
 Fri, 27 Oct 2023 20:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DC0C433C7;
 Fri, 27 Oct 2023 20:48:51 +0000 (UTC)
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
X-Inumbo-ID: 3e3cf286-750a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698439734;
	bh=tABYMPaDThtIvUPtNVP0SnfmmdkCk1V5SMhg/Vecjr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qGAXOJqDLdHVaIw56+fQ/gXJqOmeuQKEorOdSi8xPa22bddY/RiJY62doIZcBtud0
	 csrd1INeQ7CJ05ANYE7/27/dA5pVw2eJJwHxBnYvKOSi2SFSn6X09cI30YD2W/xUl7
	 ay6X6jE/UUkMqHKjkccEZGMcruRpnSdeolxo8fnKpY1gJ53Re+wFl5ZSkOtPabWTpc
	 SJcj802BoVszhKa1P11bBsu31BpTelb322UaofvCBMs5AvcWeiMdNGDwTLySMGStm6
	 Yia492V+557bB1cxbSvaEXXd9qVVoXrgOloFxJ3bDIwT24M0VUQIrhPdpnsrnjJDH3
	 S4jI6Fnb7OZNA==
Date: Fri, 27 Oct 2023 13:48:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
In-Reply-To: <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310271348440.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com> <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Oct 2023, Nicola Vetrini wrote:
> The purpose of this macro is to encapsulate the well-known expression
> 'x & -x' that in 2's complement architectures on unsigned integers will
> give a mask where only the least significant nonzero bit of 'x' is set,
> or 0 if none are set.
> 
> A deviation for ECLAIR is also introduced.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

