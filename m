Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C67849D1D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676144.1052046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX02H-0004in-CX; Mon, 05 Feb 2024 14:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676144.1052046; Mon, 05 Feb 2024 14:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX02H-0004gJ-8J; Mon, 05 Feb 2024 14:33:25 +0000
Received: by outflank-mailman (input) for mailman id 676144;
 Mon, 05 Feb 2024 14:33:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX02G-0004gD-DA
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:33:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX02F-0007Tc-Mr; Mon, 05 Feb 2024 14:33:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX02F-0008AZ-GI; Mon, 05 Feb 2024 14:33:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=cfHHG6y2PPIcHDovtO25KneISISlD2FDvZ7cmXCylRM=; b=2R+ea/fBeNC8Wbjp2TZ5mhyjcJ
	00bxsBW90531HFCNPvUegh9zSgbZenjuqowAi5tpGbdL8+B5G3QkpSMlViuKKeN4TEdpy1iZXPYL6
	YHNQ0CFXU9afYx/rdBM9jILdOEeGlcFJ39XXjp1GFv8NZ9xhn4dMscZjJBgqDWa29vE0=;
Message-ID: <c3bde61e-58f1-40fe-afa0-23510b6c5720@xen.org>
Date: Mon, 5 Feb 2024 14:33:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] tools/xenstored: move all log-pipe handling into
 posix.c
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-24-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240205105001.24171-24-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/02/2024 10:49, Juergen Gross wrote:
> All of the log-pipe handling is needed only when running as daemon.
> 
> Move it into posix.c. This requires to have a service function in the
> main event loop for handling the related requests and one for setting
> the fds[] array. Use a generic name for those functions, as socket
> handling can be added to them later, too.

I would mention the rename in the commit message. With that:

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

