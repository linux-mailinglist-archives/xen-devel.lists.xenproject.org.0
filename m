Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE177E7E30
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630718.983851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VV2-0007Lk-Rc; Fri, 10 Nov 2023 17:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630718.983851; Fri, 10 Nov 2023 17:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VV2-0007Id-N0; Fri, 10 Nov 2023 17:40:56 +0000
Received: by outflank-mailman (input) for mailman id 630718;
 Fri, 10 Nov 2023 17:40:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VV1-0007IC-6h; Fri, 10 Nov 2023 17:40:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VV0-0005ER-IY; Fri, 10 Nov 2023 17:40:54 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VV0-0004jS-Cm; Fri, 10 Nov 2023 17:40:54 +0000
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
	bh=lj+e1r9LzSArgAgK4VcRJq8Gg1Iucv1dJNbrloYU4F0=; b=XJSL0DNF+spD1Db51GqVzulkV4
	MJcp3tJBrGpn8thZGZ3B6SU5RE83WlHf/a/wSFAdTz6q2q9Dc3/V8zLveUQpXlMqo8uhQk5U0z1a5
	S1uSBrJYjtvQthJylv7vEY5EvfFu+AEfnxvFb+8BjFrwZe1kT0qKFNCRQdtfGDA387jw=;
Message-ID: <06119077-00e4-4b33-a71e-b6eafd63271e@xen.org>
Date: Fri, 10 Nov 2023 17:40:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110113435.22609-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/11/2023 11:34, Juergen Gross wrote:
> Get the own domid via creation of a temporary event channel. There is
> no "official" way to read the own domid in PV guests, so use the event
> channel interface to get it:
> 
> - allocate an unbound event channel specifying DOMID_SELF for the
>    other end
> 
> - read the event channel status which will contain the own domid in
>    unbound.dom
> 
> - close the event channel
> 
> Signed-off-by: Juergen Gross <jgross@suse.com
> ---
> V2:
> - new patch
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   events.c         | 32 ++++++++++++++++++++++++++++++++
>   include/events.h |  2 ++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/events.c b/events.c
> index cdae90f4..af9f9f9e 100644
> --- a/events.c
> +++ b/events.c
> @@ -261,6 +261,38 @@ int evtchn_get_peercontext(evtchn_port_t local_port, char *ctx, int size)
>       return rc;
>   }
>   
> +domid_t evtchn_get_domid(void)
I think the function name should be generic so the caller doesn't need 
to be modified everytime the implementation is updated.

How about get_domid()?

Cheers,

-- 
Julien Grall

