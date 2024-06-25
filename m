Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E91915B44
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747084.1154384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuSp-0004jP-5Y; Tue, 25 Jun 2024 00:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747084.1154384; Tue, 25 Jun 2024 00:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuSp-0004hs-1f; Tue, 25 Jun 2024 00:55:15 +0000
Received: by outflank-mailman (input) for mailman id 747084;
 Tue, 25 Jun 2024 00:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuSm-0004CT-W6
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:55:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 935c547d-328d-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:55:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4777F60B00;
 Tue, 25 Jun 2024 00:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331C1C2BBFC;
 Tue, 25 Jun 2024 00:55:10 +0000 (UTC)
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
X-Inumbo-ID: 935c547d-328d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276911;
	bh=/9xor8CXdhlq6PrtxGlhUTc6sfGmqbSL/B6lshBYNvw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c1ANsOKXWxzMMV+0PvBY1kNQWOK++xhqD9WmA9DP9Xbm0+7vIJ1wDxg6P/JJKQc5q
	 4+YJiJggGlBEJp/MsEtvq4iCrtAIi4VFaWHBh3c12uSaO/7TiwQMJ0B/ZEyt2bF39u
	 GtJA4RySd2aKtF1+utyA0fYoV3tlDihElcg7Sa5iK9q1qZRPLXV54WoB262kH6LKpF
	 pdv7C5fnjPN4LyZ0K9YYpH9H5gixqB+P8ulLDUOsYVUg4ckxlNq3MrSeFxzv/fCCpE
	 Gubu4oFPKtncAJoV8zj+l3Rgw66eQW24ARxcLGzQCll38rZ/cIscTsIulFTGYz+8vS
	 fZb5vx0Kqb4Qg==
Date: Mon, 24 Jun 2024 17:55:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 06/13] x86/mce: address violations of MISRA C Rule
 16.3
In-Reply-To: <c1015fb8f39d3a44732ccdebb8ba11392dbe4aa8.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241755020.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <c1015fb8f39d3a44732ccdebb8ba11392dbe4aa8.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add missing break statements to address violations of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

