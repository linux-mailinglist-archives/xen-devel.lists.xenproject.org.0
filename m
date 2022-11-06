Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3961E666
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 22:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439002.692927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orn27-0006Dn-Cq; Sun, 06 Nov 2022 21:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439002.692927; Sun, 06 Nov 2022 21:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orn27-0006AL-9R; Sun, 06 Nov 2022 21:18:23 +0000
Received: by outflank-mailman (input) for mailman id 439002;
 Sun, 06 Nov 2022 21:18:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orn25-0006AD-Gd
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 21:18:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orn24-0001B1-Nj; Sun, 06 Nov 2022 21:18:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orn24-0007QX-GV; Sun, 06 Nov 2022 21:18:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=TdAMxtQTotYIg+GA11QtQTVjpyM8HXkA7Id0HB8sckU=; b=0hY+NDDC41/r+WvN5wFCmcs4eY
	iEWvIZEjnPDQ7dSiebTA2emRutIIyOFVpgBAt4PyIHblabeun00FiVVeuooA18U30uU5muAHXdVBq
	daICmHFuthFzfbtIbAwI3m+3/OyJimkGDpVtC1G+b7vyiesOZHftOT3SNvxl6hcW6S4M=;
Message-ID: <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
Date: Sun, 6 Nov 2022 21:18:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
In-Reply-To: <20221101152842.4257-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> When a domain has been recognized to have stopped, remove all its
> registered watches. This avoids sending watch events to the dead domain
> when all the nodes related to it are being removed by the Xen tools.

 From my understanding, shutdown doesn't mean dead. It may be used 
during migration (or snapshotting), where we don't want to touch the 
state in case of a cancellation (or resume).

For instance, see the command XS_RESUME which will clear domain->shutdown.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_domain.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index aa86892fed..1516df71d8 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -364,6 +364,12 @@ void check_domains(void)
>   			    && !domain->shutdown) {
>   				domain->shutdown = true;
>   				notify = 1;
> +				/*
> +				 * Avoid triggering watch events when the
> +				 * domain's nodes are being deleted.
> +				 */
> +				if (domain->conn)
> +					conn_delete_all_watches(domain->conn);
>   			}
>   			if (!dominfo.dying)
>   				continue;

Cheers,

-- 
Julien Grall

