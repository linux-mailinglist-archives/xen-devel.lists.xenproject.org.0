Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE4787B2A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 00:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590358.922630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZISp-0001vg-9L; Thu, 24 Aug 2023 22:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590358.922630; Thu, 24 Aug 2023 22:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZISp-0001sY-6H; Thu, 24 Aug 2023 22:06:03 +0000
Received: by outflank-mailman (input) for mailman id 590358;
 Thu, 24 Aug 2023 22:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZISn-0001sF-Hf
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 22:06:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 686bae19-42ca-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 00:06:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7610864941;
 Thu, 24 Aug 2023 22:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C7FC433C8;
 Thu, 24 Aug 2023 22:05:57 +0000 (UTC)
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
X-Inumbo-ID: 686bae19-42ca-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692914758;
	bh=ud65ELzYxOx564bsrZYqy+9OCYVxpk4wwbNQBM3yZQw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N/l4JIMAdN5EUMmSSU6Ub6hXispKn76eRjj5Mz4KR2QChTfELttE8RT6kbEtsoHkR
	 Zl+AfZfLfiL0ElSMLW8dojtujZKdBP3WlRWIzcPussLV2uR18BaHIbxAN2+7s1oQ5j
	 jLlBF95welmVu4AQcfdyZSQ86ahB3wa3RQgLHPo+iRxqmmZJzvkp7hCIpSc4iYq0cb
	 UXiM6YqjwXMxg/8EjCz45VZkz9NQpShYXSnaGtgR32P6Jyv25gufnMjTzfHCryeX5E
	 jTxOixg0cXn3oM8SsuiaiEBPm4U6GctOM9vaBtUMjMR0uqLxJKVGp7qrR+TAHBd+HV
	 G23n+m+dsG/NQ==
Date: Thu, 24 Aug 2023 15:05:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 2/4] xen/vpci: address violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <ZOdK9w69E2IiHI1r@MacBook-Air-de-Roger.local>
Message-ID: <alpine.DEB.2.22.394.2308241505350.6458@ubuntu-linux-20-04-desktop>
References: <cover.1690368810.git.simone.ballarin@bugseng.com> <2cb770d946c4bf858a41271fd7b9985f789ca149.1690368810.git.simone.ballarin@bugseng.com> <ZOdK9w69E2IiHI1r@MacBook-Air-de-Roger.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-338273008-1692914757=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-338273008-1692914757=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 24 Aug 2023, Roger Pau Monné wrote:
> On Wed, Jul 26, 2023 at 01:03:37PM +0200, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > 
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> > headline states:
> > "A 'u' or 'U' suffix shall be applied to all integer constants
> > that are represented in an unsigned type".
> > 
> > Add the 'U' suffix to integers literals with unsigned type and also to other
> > literals used in the same contexts or near violations, when their positive
> > nature is immediately clear. The latter changes are done for the sake of
> > uniformity.
> > 
> > Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks! I saw too late :-)
--8323329-338273008-1692914757=:6458--

