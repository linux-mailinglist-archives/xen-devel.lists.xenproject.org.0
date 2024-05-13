Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1778C48DF
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 23:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721076.1124205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6dDa-0001UD-NK; Mon, 13 May 2024 21:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721076.1124205; Mon, 13 May 2024 21:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6dDa-0001Rc-Kj; Mon, 13 May 2024 21:28:22 +0000
Received: by outflank-mailman (input) for mailman id 721076;
 Mon, 13 May 2024 21:28:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6dDY-0001RW-SQ
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 21:28:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6dDY-00060p-Fi; Mon, 13 May 2024 21:28:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6dDY-0002Jt-7u; Mon, 13 May 2024 21:28:20 +0000
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
	bh=s5iFEEnN9UXy4r21ykiZB5NBzlGvJTTeFya/dDBwq4w=; b=CSz96nr42qkhMOWz0M5OSGbfkD
	rAbgaiiamMFx9tXem6qHZfI+GVImVy5oT1uG2/PgkXnvM1i/gC13hPocnb4Wq/9INtZo4dfmyjrbs
	zX/m1/Rjf4Pny/D8RBOcVrV0xt+B2fYPpWzl0ZcEbwztC4UL3pDYNvNddehm+ZYIttvI=;
Message-ID: <0625f4f2-daaa-4867-8c39-f8e9ce939ca0@xen.org>
Date: Mon, 13 May 2024 22:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix Rule 10.2 violation
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2405101634500.2544314@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2405101634500.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

title: Is this the only violation we have in Xen? If so, then please add 
the subsystem in the title.

On 11/05/2024 00:37, Stefano Stabellini wrote:
> Change opt_conswitch to char to fix a violation of Rule 10.2.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 2c363d9c1d..3a3a97bcbe 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -49,7 +49,7 @@ string_param("console", opt_console);
>   /* Char 1: CTRL+<char1> is used to switch console input between Xen and DOM0 */
>   /* Char 2: If this character is 'x', then do not auto-switch to DOM0 when it */
>   /*         boots. Any other value, or omitting the char, enables auto-switch */
> -static unsigned char __read_mostly opt_conswitch[3] = "a";
> +static char __read_mostly opt_conswitch[3] = "a";

Looking at the rest of the code, we have:

#define switch_code (opt_conswitch[0] - 'a' + 1)

Can you confirm whether this is not somehow adding a new violation?

Cheers,

-- 
Julien Grall

