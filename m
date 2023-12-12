Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA9780FA8C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 23:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653626.1020058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBbC-0000wn-Td; Tue, 12 Dec 2023 22:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653626.1020058; Tue, 12 Dec 2023 22:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBbC-0000ud-Q2; Tue, 12 Dec 2023 22:51:34 +0000
Received: by outflank-mailman (input) for mailman id 653626;
 Tue, 12 Dec 2023 22:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDBbB-0000uE-Nu
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 22:51:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe44f292-9940-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 23:51:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8D089B817B7;
 Tue, 12 Dec 2023 22:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCDFC433C7;
 Tue, 12 Dec 2023 22:51:29 +0000 (UTC)
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
X-Inumbo-ID: fe44f292-9940-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702421490;
	bh=FWunfJukoEf8uv3S6Blf40SDiYHQAMZe9Gql3B5kJ9g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TwR1sbFNYKaYes9kb8UhuDAQrTGyBcpOc+uiASp4ZT3pnzyKlNcLAc6mQhPljcvPP
	 AvOiznIKZelqj+cOuZjLzeCEzZsSonPS1dZ2H08sJ3wqSzxmRKTAajLC2N5t7S2mIz
	 i+HBxehN53suP7YlWH1r04ToX6cGTYjI3aO7/EJUDMYTDZii7Z+2w6KskgtDg+AgmU
	 tSoVWmTnc0Hq099IM3qPWUPCilDHvLkmtZY6eT+EGF11tIcxK5REPYctJutTmwXscs
	 uG3XqdTuqt6itxyqqJEJwD0Qd0HZ1pcC1c4vw/yfSe92TeaxVGbmA4autS6FA7KHgm
	 U5iIrQC44lYjw==
Date: Tue, 12 Dec 2023 14:51:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/4] xen/drivers: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <6cd192af722b99323021c6f1561c5cf0178a1aaf.1702394721.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312121451230.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702394721.git.federico.serafini@bugseng.com> <6cd192af722b99323021c6f1561c5cf0178a1aaf.1702394721.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


