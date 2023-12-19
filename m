Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CDA817F4F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656449.1024616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP2y-0005m3-IY; Tue, 19 Dec 2023 01:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656449.1024616; Tue, 19 Dec 2023 01:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP2y-0005jl-Ea; Tue, 19 Dec 2023 01:37:24 +0000
Received: by outflank-mailman (input) for mailman id 656449;
 Tue, 19 Dec 2023 01:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFP2w-0005jb-Ry
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:37:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2614ef7b-9e0f-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 02:37:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E21FCE14E9;
 Tue, 19 Dec 2023 01:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F1DC433C8;
 Tue, 19 Dec 2023 01:37:16 +0000 (UTC)
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
X-Inumbo-ID: 2614ef7b-9e0f-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949837;
	bh=5CqPYV/NQa8r1/ZMeF5vcsOlmD+EktOqX8lOW8jr4V8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KF0pHljl1te4JMI8aoVeIeBsGElap77QSaHBPcDAwNOA7JWE2VxpJJGmUkQnaBXr5
	 bvPRxTsEH4L9/Xaj8gLIo14w6ewm2vm/apbF5zxkI9eVHi2WcMTFLBOHOcyHBT2OWo
	 dnL5znkZMDdNeTpFezA4YaavX8Q/qKQ4zC+fxN4uSzRaz/Hh/HjFBKcm7+/9FFwSef
	 vAin4a/niH6/91BbM5DVh/V6wR0qC9qUWVWhfQoLR2CPCL27FHsGRFAxEHsMRDmcpI
	 2ptu9+I2zeDsNyIAJ2Us05H+BnRbi9lPVOcyDzHszAHyjvC0er12/d6JJwvYhe7rvc
	 dp2KBiZAeL2PA==
Date: Mon, 18 Dec 2023 17:37:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 5/7] x86/platform: removed break to address MISRA
 C:2012 Rule 2.1
In-Reply-To: <a6b3f8d44888d7c8b1d72803111dc331fafd4b02.1702891792.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181737090.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <a6b3f8d44888d7c8b1d72803111dc331fafd4b02.1702891792.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> The break statement is redundant, hence it can be removed.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


