Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4180DAA2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 20:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652502.1018382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClgm-0005rX-2f; Mon, 11 Dec 2023 19:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652502.1018382; Mon, 11 Dec 2023 19:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClgm-0005pF-08; Mon, 11 Dec 2023 19:11:36 +0000
Received: by outflank-mailman (input) for mailman id 652502;
 Mon, 11 Dec 2023 19:11:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rClgk-0005p9-P2
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 19:11:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rClgj-0003gl-VN; Mon, 11 Dec 2023 19:11:33 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rClgj-0002Xo-Nw; Mon, 11 Dec 2023 19:11:33 +0000
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
	bh=p2v3kRevYSyeEAHXzu6lyyNHWMvZvBmtkBhhMfXFbL8=; b=nb+oB8CswgJiHkVzUcmc4pb3do
	LsRBUCvsC6Wcq0UtTN93H5o3WIWE1Nj7cSrlpFbkM9EGpQt1BZYmys2j+JJuiI9UVdHnbI9/ALroU
	GfIsPaDUI05/ay+H589g/8qi6NO9D/JJMqz/RQRD/CgKSnmC3ItGASpO4tPEotAHvRUw=;
Message-ID: <c5a72070-fb63-4c05-a34e-e5abcb781ea2@xen.org>
Date: Mon, 11 Dec 2023 19:11:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstored: potentially split trace_io() out message
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231123160834.17674-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231123160834.17674-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 23/11/2023 16:08, Juergen Gross wrote:
> Today write_messages() will call trace_io() after having written the
> complete message to the ring buffer or socket.
> 
> In case the message can't be written in one go, split it by writing
> one trace entry when starting the write and one when finishing it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

With one remark below:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> This patch is meant to go on top of the patch "tools/xenstored: remove
> \"-V\" command line option" in order to not lose any possible debug
> information.
> ---
>   tools/xenstored/core.c | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 9046b200bc..a14b240ed9 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -121,7 +121,7 @@ void trace(const char *fmt, ...)
>   
>   static void trace_io(const struct connection *conn,
>   		     const struct buffered_data *data,
> -		     int out)
> +		     const char *type)

This change seems somewhat unrelated. It would be worth mentioning it in 
the commit message.

If you propose a new wording, I can update it while committing.

Cheers,

-- 
Julien Grall

