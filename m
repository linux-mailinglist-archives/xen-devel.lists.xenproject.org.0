Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599D7B3BA9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610724.950247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKVY-0001w3-Ab; Fri, 29 Sep 2023 20:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610724.950247; Fri, 29 Sep 2023 20:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKVY-0001tY-7S; Fri, 29 Sep 2023 20:54:44 +0000
Received: by outflank-mailman (input) for mailman id 610724;
 Fri, 29 Sep 2023 20:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKVX-0001pn-2H
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:54:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69251b67-5f0a-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 22:54:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D5C062045;
 Fri, 29 Sep 2023 20:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9655C433C8;
 Fri, 29 Sep 2023 20:54:39 +0000 (UTC)
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
X-Inumbo-ID: 69251b67-5f0a-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696020880;
	bh=2B856vGkSTMJAMikwkE5b97Idn5yLE+F6kWpkmavanI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YNui5MH89YjyJ2BBtvXZwkCUYmqp5OmODzD32aLbaxo4fmF2VTUg8zw1kxesbg2GS
	 V+hGl8iD6pa0EvVIIS11sQWX6PH/2eQMdS4k4I6HgCg2wjz/PY6dDmNPOS8063HEGg
	 VKNgVkW2/ZWKdAZN5rzx2JTfqdb51e4wBBfLw5nzEldxxy8O06aRZmvp5FLYCnCboj
	 1IVaZRdY/7iCE6o89mCRnakCs1yFIG5Scv1WQAx+EhGEdN0RRcOMfI5UWVqiNVI6zx
	 kzxrOvv27rkbiX7LONAXcxPWwTs2+htdealYEBvYKpOeWGe6rLzEm81jUkpIeL5ACW
	 1T4RHXhd87+Ow==
Date: Fri, 29 Sep 2023 13:54:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 4/4] x86/psr: address a violation of MISRA C:2012
 Rule 8.3
In-Reply-To: <c7673a1cd70e1f4901b8f6a6a0ffe3019c9307ac.1695972930.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291354300.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1695972930.git.federico.serafini@bugseng.com> <c7673a1cd70e1f4901b8f6a6a0ffe3019c9307ac.1695972930.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Federico Serafini wrote:
> Make function declaration and definition consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


