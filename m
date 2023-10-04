Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55297B8B37
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 20:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612747.952816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo6um-0006Zr-Pw; Wed, 04 Oct 2023 18:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612747.952816; Wed, 04 Oct 2023 18:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo6um-0006XN-NB; Wed, 04 Oct 2023 18:48:08 +0000
Received: by outflank-mailman (input) for mailman id 612747;
 Wed, 04 Oct 2023 18:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+RGk=FS=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1qo6ul-0006XD-Kk
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 18:48:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c966a3a-62e6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 20:48:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1E8ECE1E5B;
 Wed,  4 Oct 2023 18:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A765AC433C7;
 Wed,  4 Oct 2023 18:47:59 +0000 (UTC)
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
X-Inumbo-ID: 8c966a3a-62e6-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696445280;
	bh=iOe3yiBqvNEzyZE58IbaBP55/gzFuPI3U1iKp4mINDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NGOLugBfED2lS0FBXQFyKEL2ddul/Oqd9Nh90VHghzHJ/sSYTuOAeXIcSQ7Vx32UD
	 oJisuVjQdO5S8CbdNIvwBCO7E4RLjWlbUeNJAHemewZmRNFh96kHuhjbNlRsiZyeJm
	 QOaaz5n/1oBJ6KiYbZ//G521IxNREIT2U+ArAdCi/boRRfJIAh3ijsfuCkS0WEi1Ht
	 cTuEOROzfLRXuIEm1oC7plr3cWAzeqOcEJHCU4Tx3+eW1SxU1VPqv2/PBbaPhito1E
	 1WbxiIOJ08/Dn1Sbi/9x2qSPWpan49G6P0vKwpc02GF+9aYMDZETk72fp9t8CcJ9xE
	 xzXer6Q/TP7mg==
Date: Wed, 4 Oct 2023 11:47:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Kahurani <k.kahurani@gmail.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 wei.liu@kernel.org, paul@xen.org
Subject: Re: [PATCH] net/xen-netback: Break build if netback slots >
 max_skbs + 1
Message-ID: <20231004114758.44944e5d@kernel.org>
In-Reply-To: <20230927082918.197030-1-k.kahurani@gmail.com>
References: <20230927082918.197030-1-k.kahurani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Sep 2023 11:29:18 +0300 David Kahurani wrote:
> If XEN_NETBK_LEGACY_SLOTS_MAX and MAX_SKB_FRAGS have a difference of
> more than 1, with MAX_SKB_FRAGS being the lesser value, it opens up a
> path for null-dereference. It was also noted that some distributions
> were modifying upstream behaviour in that direction which necessitates
> this patch.

MAX_SKB_FRAGS can now be set via Kconfig, this allows us to create
larger super-packets. Can XEN_NETBK_LEGACY_SLOTS_MAX be made relative
to MAX_SKB_FRAGS, or does the number have to match between guest and
host? Option #2 would be to add a Kconfig dependency for the driver
to make sure high MAX_SKB_FRAGS is incompatible with it.

Breaking the build will make build bots very sad.

We'll also need a Fixes tag, I presume this is a fix?
-- 
pw-bot: cr

