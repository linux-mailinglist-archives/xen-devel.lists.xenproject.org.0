Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4567F534D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639219.996266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vZt-0002AT-1X; Wed, 22 Nov 2023 22:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639219.996266; Wed, 22 Nov 2023 22:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vZs-000286-UX; Wed, 22 Nov 2023 22:20:12 +0000
Received: by outflank-mailman (input) for mailman id 639219;
 Wed, 22 Nov 2023 22:20:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5vZr-00027h-L4
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:20:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b59c6b2-8985-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:20:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C16D0B829F2;
 Wed, 22 Nov 2023 22:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC41C433C7;
 Wed, 22 Nov 2023 22:20:06 +0000 (UTC)
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
X-Inumbo-ID: 4b59c6b2-8985-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700691607;
	bh=cj8UHk9HT2c8Xyppk5t9rIaWeC6pFdz5b+WsGsK03hk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JAioIA2EoJ7ksJtETRfQQtRTcuQrzS28FoxnHnyZ2V53xf5IMghWSsaurc99on1Wo
	 unzK4FlSxYVELMtxTVztbXvYSzw6Pq0k6p8U/6gnoo4lbCrFNhiJFkRX/h3c4FlalK
	 6apDsJHyRLADHGGDk3JBbt6G0iyjHF89Rrhf7TjeCis+RhfCD2IC+QOSxJF/SZK7jp
	 oha+EMlRyeV7ylGYA9bA6kuBAXPoI4FRyXLsNTqEcxTry96oojVEJW/3TqNxKzRWDC
	 lqrsJIxjUpjBsvmlXh+PUPLp4rSwLmm2cspoAKeSP8P4EWa1NZHYBKz500zBfXplyZ
	 dd7Z4iKkDziQQ==
Date: Wed, 22 Nov 2023 14:20:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v4 1/2] x86/mm: preparation work to uniform
 modify_xen_mappings* interfaces
In-Reply-To: <8f318ade9277b316a6f91df3b75a593d662ac586.1700645120.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311221419530.2053963@ubuntu-linux-20-04-desktop>
References: <cover.1700645120.git.federico.serafini@bugseng.com> <8f318ade9277b316a6f91df3b75a593d662ac586.1700645120.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Federico Serafini wrote:
> The objective is to use parameter name "nf" to denote "new flags"
> in all the modify_xen_mappings* functions.
> Since modify_xen_mappings_lite() is currently using "nf" as identifier
> for a local variable, bad things could happen if new uses of such
> variable are committed while a renaming patch is waiting for the
> approval.
> To avoid such danger, as first thing rename the local variable from
> "nf" to "flags".
> 
> No functional change.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

