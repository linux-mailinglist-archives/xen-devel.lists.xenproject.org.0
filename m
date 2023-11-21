Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59777F2267
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637421.993195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Eo8-00050j-4x; Tue, 21 Nov 2023 00:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637421.993195; Tue, 21 Nov 2023 00:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Eo8-0004y8-0E; Tue, 21 Nov 2023 00:40:04 +0000
Received: by outflank-mailman (input) for mailman id 637421;
 Tue, 21 Nov 2023 00:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5Eo6-0004Su-Cz
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:40:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eee9bee-8806-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 01:39:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22E2660DC4;
 Tue, 21 Nov 2023 00:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAA3C433C8;
 Tue, 21 Nov 2023 00:39:55 +0000 (UTC)
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
X-Inumbo-ID: 7eee9bee-8806-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700527196;
	bh=XIsJX7YvOZKqotHm+J5/cuXbBZH9QdBVJaWrUgC+Zus=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A8/TgOvJOlt3/M1v7WbczkhPBcMOoOZHffTNmYV7+5fTC5hCfHxq1VULehndYF3qK
	 YINksseq2X8j5g209wgn5t23D3ln8SrwX82r69kjOzWnIUJ5c+FcXmIlKRgFdSgWnH
	 C2SbE0RwLJNIA8jEtjgEBjzXKOamqAyKxMOoVzICjbOBliiiIidOZyIrC6qJH1KlOJ
	 UIeSOM2yKscwB72BE0UUap1xIEZUu8UrTmYy4WST9zIq5ZXgOo7oMQCoyjAHngcKm2
	 7Jz3bYePkODz/6QHe++dPomltX0lUXBsLV0kGoO/J1PGW2DQtz5S9k5ghw912CJP4i
	 9qFdjloC3lkSA==
Date: Mon, 20 Nov 2023 16:39:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH 1/6] x86/setup: Make the loader variable const
In-Reply-To: <20231120224912.1421916-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201639000.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <20231120224912.1421916-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Andrew Cooper wrote:
> It is never written to, but has a string literal assigned, and needs to be
> const to support -Wwrite-strings
> 
> Suggested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


