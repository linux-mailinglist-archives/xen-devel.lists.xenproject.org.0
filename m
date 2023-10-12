Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7687C7A7A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616205.958046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5Cv-0001rn-Ml; Thu, 12 Oct 2023 23:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616205.958046; Thu, 12 Oct 2023 23:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5Cv-0001pc-JW; Thu, 12 Oct 2023 23:35:09 +0000
Received: by outflank-mailman (input) for mailman id 616205;
 Thu, 12 Oct 2023 23:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr5Ct-0001n8-VH
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:35:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f91f7358-6957-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 01:35:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BCF94CE2C81;
 Thu, 12 Oct 2023 23:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B23C433C8;
 Thu, 12 Oct 2023 23:35:00 +0000 (UTC)
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
X-Inumbo-ID: f91f7358-6957-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697153701;
	bh=Gmaq1/XycnXndiGqV4G0ilzh2kZuUH/6HTqHzlIVS0Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LKK3jgxkYyHjhMffNx/1E2Rt4MMQrms6sBpv0HuNoRmUrQhGnlNcF76tOnbuMeME2
	 Nw+tN9qAGpt4AIDU1HwzY8B3IWlAu8VX+DFL48PJFLMdPSftjadPqWefJKhv++I1AA
	 PQyH6JVJP6PtFBpT92+0SsKrBZByFO1TNnjwoeTMgTddYA7/9y/kAE9SIR0MD4YJB8
	 OmBBIZkqrWi1yOGl8NZCnpOw36KW7NZep5S/Ry2ecejMv4jKoPO6iJtiFBbKbaB1wF
	 Kjzbz0v5+96zx0dcEZdUsboW/jmdZbGyCPxWlzx7f7YbxKf0jkk0JkUHXDJMEW5QBh
	 w1wYaKLkOY+qg==
Date: Thu, 12 Oct 2023 16:34:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-next v2 4/8] x86_64/mm: express macro CNT using
 LOWEST_BIT
In-Reply-To: <eb05327a3af71c883c3ff5ed3b4501a8859403d3.1697123806.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121633290.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <eb05327a3af71c883c3ff5ed3b4501a8859403d3.1697123806.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> The various definitions of macro CNT (and the related BUILD_BUG_ON)
> can be rewritten using LOWEST_BIT, encapsulating a violation of
> MISRA C:2012 Rule 10.1.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

