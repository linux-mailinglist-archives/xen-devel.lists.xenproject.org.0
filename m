Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7E813CA9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654756.1022076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtL4-0001VR-VC; Thu, 14 Dec 2023 21:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654756.1022076; Thu, 14 Dec 2023 21:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtL4-0001TO-RH; Thu, 14 Dec 2023 21:33:50 +0000
Received: by outflank-mailman (input) for mailman id 654756;
 Thu, 14 Dec 2023 21:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtL4-0001TB-0V
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:33:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76c8614f-9ac8-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 22:33:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E8EACE2646;
 Thu, 14 Dec 2023 21:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC43C433C8;
 Thu, 14 Dec 2023 21:33:41 +0000 (UTC)
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
X-Inumbo-ID: 76c8614f-9ac8-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702589622;
	bh=G7OvJbnTg05jJWpHaAvpURoYXvWOrX3FazP3c15oqRk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vMLO5OF8ZwH4yyeUff2IK6qsFWi0dN0xdkfMrAAWPldDfFCwEw9Xw4NdMtu9a1Tv9
	 aZSqArbsDm1HRM8OgS6jrSWu5/uJuuezDw5XfrW8O2hB/W5hrmBJbitGY2vE9rvecW
	 4hb08Dgv9E/hKYhlRj/1F2GRK9f734xC7gEePuboUa/Yp6kL1HH1Qp1DAXM/vSlxsF
	 vIsHhonYE6q+x40w86JcKqp1Ax2n5hhC7eSQRaplLye+BTTxhNHlSGMVFuaFVv2Hip
	 IxyTSXjJ91Z9kbneBHOBdLa5jC47DpNzeLTkXo2tuw1DM5jpai6YSil97Tvra8+P6O
	 2WVFbI7sjEa8g==
Date: Thu, 14 Dec 2023 13:33:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 5/5] xen/wait: address violations of MISRA C Rule
 11.9
In-Reply-To: <a4e13ba24ab54895454d8df1c956865f7cf7f0b5.1702553835.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141333350.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com> <a4e13ba24ab54895454d8df1c956865f7cf7f0b5.1702553835.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

