Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276980E0F4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652607.1018566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrp7-0001kx-E3; Tue, 12 Dec 2023 01:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652607.1018566; Tue, 12 Dec 2023 01:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrp7-0001iU-AB; Tue, 12 Dec 2023 01:44:37 +0000
Received: by outflank-mailman (input) for mailman id 652607;
 Tue, 12 Dec 2023 01:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCrp5-0001iI-Ik
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:44:35 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec22693-988f-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 02:44:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2ED87CE13AD;
 Tue, 12 Dec 2023 01:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0A8C433C7;
 Tue, 12 Dec 2023 01:44:29 +0000 (UTC)
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
X-Inumbo-ID: fec22693-988f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345470;
	bh=tq80R6tbY+WHErdqKlbP1A0A5OMhcDgUtfj/d+5WE+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EfFVmiQK5CARKRdOr1dFtDAzEP0dqa7IdUlfwvL2h7c3WGXbCll4Jae+va6UHQ4zL
	 ElbA7P4sdWiyK9n2rlmxs+GH1sz3tYDxpQ/Sc++MpGPho7OTQbC/aL+c3mudAt7+CB
	 6XP1hUXLh7Mk6csL8VSKsn6hCYbe/vmjAe4keUPQ8bf28i+dr3ZeLXA/9qSPpMm7pp
	 6XicOIHmyaS/FbGU8NpDRa6AEdD94iKS95J23yVwQzGu5+YTPoP/I7bLVwj3YO0Cq9
	 6Sw7QUztoFsOROMCFoqNfPZz0xxdLrANVJOjTz/X1PhW88qpxiUGHZKpFy+aXabgg5
	 337DBa37HcP+A==
Date: Mon, 11 Dec 2023 17:44:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 6/7] x86/platform: removed break to address MISRA
 C:2012 Rule 2.1
In-Reply-To: <b1103bc13d5ce04159417592705b4fe6a6db748b.1702283415.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111744170.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <b1103bc13d5ce04159417592705b4fe6a6db748b.1702283415.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> The break statement is redundant, hence it can be removed.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


