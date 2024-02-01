Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B9844DC7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 01:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674195.1048981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVKrp-0003Lf-1C; Thu, 01 Feb 2024 00:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674195.1048981; Thu, 01 Feb 2024 00:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVKro-0003IT-UG; Thu, 01 Feb 2024 00:23:44 +0000
Received: by outflank-mailman (input) for mailman id 674195;
 Thu, 01 Feb 2024 00:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dNsH=JK=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1rVKrn-0003IN-OO
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 00:23:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26d7b74d-c098-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 01:23:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D31196190F;
 Thu,  1 Feb 2024 00:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646C0C433F1;
 Thu,  1 Feb 2024 00:23:39 +0000 (UTC)
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
X-Inumbo-ID: 26d7b74d-c098-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706747020;
	bh=7gsKG6V5s1dopCQuysbsTz34HGC4+l+xc5j4okSwkgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lk+5raA/Cc61dnv9T5cuz4gmbXaTbEiX742QUf0zqnvIfq3Fj3SYKTN/uoi3yP+g/
	 pLoelw6V1AJdY5MbbIOAYtjq2qesUk/3GIwLzdEFsN3PUAnwi+SxWwW3Lk9cgZsGoS
	 qlbBbWMb45LrvVgTPSl5JJf+j443ewZ3jZ6m6+9GWMGFXHWIqsoJk6VP5mL+8net8k
	 d2kwVXZdx5SbZTOwXM3ZVtzXTiOiHudjReNRanO2NxpAYRWNjdzws2AHMiA+mEOmcg
	 c0zNjS8GO0+Zn4sPw2NrOEAj6LZ6IyjsmFrxzylSiyQWii7Fsps6xQ8mJ7fjWr3eN7
	 6nJN7zWOFch0g==
Date: Wed, 31 Jan 2024 16:23:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Durrant <paul@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH net] xen-netback: properly sync TX responses
Message-ID: <20240131162336.7d3ba09e@kernel.org>
In-Reply-To: <980c6c3d-e10e-4459-8565-e8fbde122f00@suse.com>
References: <980c6c3d-e10e-4459-8565-e8fbde122f00@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jan 2024 14:03:08 +0100 Jan Beulich wrote:
> Invoking the make_tx_response() / push_tx_responses() pair with no lock
> held would be acceptable only if all such invocations happened from the
> same context (NAPI instance or dealloc thread). Since this isn't the
> case, and since the interface "spec" also doesn't demand that multicast
> operations may only be performed with no in-flight transmits,
> MCAST_{ADD,DEL} processing also needs to acquire the response lock
> around the invocations.
> 
> To prevent similar mistakes going forward, "downgrade" the present
> functions to private helpers of just the two remaining ones using them
> directly, with no forward declarations anymore. This involves renaming
> what so far was make_tx_response(), for the new function of that name
> to serve the new (wrapper) purpose.
> 
> While there,
> - constify the txp parameters,
> - correct xenvif_idx_release()'s status parameter's type,
> - rename {,_}make_tx_response()'s status parameters for consistency with
>   xenvif_idx_release()'s.

Hi Paul, is this one on your TODO list to review or should 
we do our best? :)
-- 
pw-bot: needs-ack

