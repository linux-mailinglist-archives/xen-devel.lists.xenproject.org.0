Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEC477D86
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 21:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248218.428169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxxJn-0000wx-HS; Thu, 16 Dec 2021 20:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248218.428169; Thu, 16 Dec 2021 20:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxxJn-0000u6-De; Thu, 16 Dec 2021 20:25:35 +0000
Received: by outflank-mailman (input) for mailman id 248218;
 Thu, 16 Dec 2021 20:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxxJl-0000u0-IT
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 20:25:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50546c84-5eae-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 21:25:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 401FF61F60;
 Thu, 16 Dec 2021 20:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464D8C36AE8;
 Thu, 16 Dec 2021 20:25:29 +0000 (UTC)
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
X-Inumbo-ID: 50546c84-5eae-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639686329;
	bh=r27tcHp5Z6CKNNW9/L7PAoVWyywZ/pyOu14nV40CaCk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mg1/zZ5GwnmTtZ2czI0MEokpabt4cajVBEljIuqHe4YqRaZH9zRAW2TRJrSRxmV8a
	 qHJBzGcns1Edt/bXvhvAHVTETDEuUIpZNUr1et+HUs8vEgTLAEB5A3SU2mD6RrFl1w
	 XNbTszClh3zyog8+4kr4/UxmdeH2LQfLYk3gt3SBaZ1ksdVi3tai2x4jQdmIUxpezE
	 013TraAPE3sbydlYIAZa5VNr87lCuQjUADSV/4cXqX1SUlvPu25OkEjstJ/DJo7Lk/
	 AW4Vp36rPI56fmw/hyyzJGSUFFXQrYIWyRwCPD5a1CdonM6Zi2nl8a1oiQX01dbej1
	 bV8vgATe7y73Q==
Date: Thu, 16 Dec 2021 12:25:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: make some per-scheduler performance counters sched
 global ones
In-Reply-To: <91fabc88-f4d5-aa0d-be8d-1f1ebf465360@suse.com>
Message-ID: <alpine.DEB.2.22.394.2112161225020.3376@ubuntu-linux-20-04-desktop>
References: <20211216054502.14085-1-jgross@suse.com> <91fabc88-f4d5-aa0d-be8d-1f1ebf465360@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Dec 2021, Jan Beulich wrote:
> On 16.12.2021 06:45, Juergen Gross wrote:
> > Some performance counters listed to be credit or credit2 specific are
> > being used by the null scheduler, too.
> > 
> > Make those sched global ones.
> > 
> > Fixes: ab6ba8c6753fa76 ("perfc: conditionalize credit/credit2 counters")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> As an immediate fix
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I tested the patch and it fixes the issue

Tested-by: Stefano Stabellini <sstabellini@kernel.org>

