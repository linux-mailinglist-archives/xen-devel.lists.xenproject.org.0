Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF62735D71
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 20:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551319.860813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJWE-0001xO-TE; Mon, 19 Jun 2023 18:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551319.860813; Mon, 19 Jun 2023 18:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJWE-0001ua-QT; Mon, 19 Jun 2023 18:22:26 +0000
Received: by outflank-mailman (input) for mailman id 551319;
 Mon, 19 Jun 2023 18:22:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBJWD-0001uU-Jy
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 18:22:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJWC-0004jO-Eg; Mon, 19 Jun 2023 18:22:24 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJWC-00027W-95; Mon, 19 Jun 2023 18:22:24 +0000
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
	bh=DPRYZSj0nXlg7DnQv7yVAA8N+6Hezm//DPLxCtX8iBY=; b=mJgGQe3qQmX2fIeN1ln+qf43uI
	H0hDxEynJqjmiW6syP3xjk+B9df+vu8AgBDtsV8F4mazsbNMP6vL8krpdKryHqMGco/Rngc3MtKAu
	r/4GTy16mkBwSXI/0yR4HhwY31ek1wXI9jvewixjanTPcIP+rDfKSI5Imfx7WJUe8N9E=;
Message-ID: <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
Date: Mon, 19 Jun 2023 19:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

I haven't looked at the code in details yet. But I have a few questions 
regarding the commit message/

On 30/05/2023 10:13, Juergen Gross wrote:
> Today all Xenstore nodes are stored in a TDB data base. This data base
> has several disadvantages:
> 
> - it is using a fixed sized hash table, resulting in high memory
>    overhead for small installations with only very few VMs, and a rather
>    large performance hit for systems with lots of VMs due to many
>    collisions

Can you provide some concrete numbers and a setup in mind? This would 
help if someone in the future says that they see the inverse and we need 
to rework the logic.

> 
> - Xenstore is only single-threaded, while TDB is designed to be fit
>    for multi-threaded use cases, resulting in much higher code
>    complexity than needed
> 
> - special use cases of Xenstore are not possible to implement with TD

By special use cases, are you referring to only the transaction below? 
If not can you outline it?

>    in an effective way, while an implementation of a data base tailored
>    for Xenstore could simplify some handling (e.g. transactions) a lot

Do you have follow-up patches that would help to figuring out whether 
your new interface makes sense?

> 
> So drop using TDB and store the nodes directly in memory making them
> easily accessible. Use a hash-based lookup mechanism for fast lookup
> of nodes by their full path.
> 
> For now only replace TDB keeping the current access functions.

Do you plan to have the rest of the work upstreamed for 4.18? Also, if 
for some reasons, only this work will be merged. Will this have an 
impact on Xenstored memory usage/performance?

Cheers,

-- 
Julien Grall

