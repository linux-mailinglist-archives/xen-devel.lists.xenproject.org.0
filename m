Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D529483CBA0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671745.1045264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4rx-0002tQ-JY; Thu, 25 Jan 2024 18:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671745.1045264; Thu, 25 Jan 2024 18:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4rx-0002ri-Gd; Thu, 25 Jan 2024 18:54:33 +0000
Received: by outflank-mailman (input) for mailman id 671745;
 Thu, 25 Jan 2024 18:54:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4rv-0002rc-Ri
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:54:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4rv-0002e9-0h; Thu, 25 Jan 2024 18:54:31 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4ru-0000Fd-PV; Thu, 25 Jan 2024 18:54:30 +0000
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
	bh=r/EAGkVsGdWc3s3qAR2k/CswpTvdAD7UWy8VIbjBVhY=; b=xxsFlaQVqShH6GadGSMaq5NonM
	uw225axU/pbLmCC1uf6Q/GxVhHhVoipvDWZLvt4apmPESBHIilfp1jTTy03yIXy3pZ5jpPbb54OHO
	52G8SloC5HJ8mVXoL+rk50weFIYOMmwaIAeDjXsXwGCEa5XnoaFrMzmnx+B4jTpqeyOg=;
Message-ID: <7feae542-5b76-481e-8f2e-8dac91042a03@xen.org>
Date: Thu, 25 Jan 2024 18:54:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/33] tools/xenstored: move all log-pipe handling into
 posix.c
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-25-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-25-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> All of the log-pipe handling is needed only when running as daemon.
> 
> Move it into posix.c. This requires to have a service function in the
> main event loop for handling the related requests and one for setting
> the fds[] array. Use a generic name for those functions, as socket
> handling can be added to them later, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/xenstored/core.c   | 41 ++++-------------------------------
>   tools/xenstored/core.h   | 11 ++++++----
>   tools/xenstored/minios.c | 14 ++++++------
>   tools/xenstored/posix.c  | 46 +++++++++++++++++++++++++++++++++++++++-
>   4 files changed, 64 insertions(+), 48 deletions(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 7b5e1d0c0f..650c1d1574 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -56,7 +56,7 @@
>   
>   extern xenevtchn_handle *xce_handle; /* in domain.c */
>   static int xce_pollfd_idx = -1;
> -static struct pollfd *fds;
> +struct pollfd *fds;

The name is quite generic. So, I am not sure I like the idea to export 
it. How about passing 'fds' as an argument of handle_special_fds()?

This is still not very great (we have an array of "unknown" sized pass). 
But it is better than exporting it.

The rest LGTM.

Cheers,

-- 
Julien Grall

