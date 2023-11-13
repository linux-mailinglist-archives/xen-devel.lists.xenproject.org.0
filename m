Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA97EA61D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632057.985984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fbz-00054C-67; Mon, 13 Nov 2023 22:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632057.985984; Mon, 13 Nov 2023 22:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fbz-00051X-3R; Mon, 13 Nov 2023 22:40:55 +0000
Received: by outflank-mailman (input) for mailman id 632057;
 Mon, 13 Nov 2023 22:40:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2fbx-00051R-NX
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:40:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2fbw-0003hF-VX; Mon, 13 Nov 2023 22:40:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2fbw-0004MX-PY; Mon, 13 Nov 2023 22:40:52 +0000
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
	bh=yq342z48GZcZPLmjB72RfLqAbkxCj3FxeBe0ppVgCeQ=; b=y7Og2GSnSf3wxGjNWXMg7hZTdZ
	jHyA2a1hJm4lmxFh0RgXwgGUzTQNIQjupxNp2+rr6FNQeXaFrHatRs1wBK9tusbXYWCql/Ey1QZ4P
	glq6yLAyyPKSJm7kHpcjvN5pyJd2TuO8OIcolC+oE0oDHaKX7GaQL6TySBJ6F7aTPlUU=;
Message-ID: <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
Date: Mon, 13 Nov 2023 22:40:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-29-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:08, Juergen Gross wrote:
> With 9pfs being fully available in Xenstore-stubdom now, there is no
> reason to not fully support all logging capabilities in stubdom.
> 
> Open the logfile on stubdom only after the 9pfs file system has been
> mounted.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>   tools/hotplug/Linux/launch-xenstore.in |  1 +
>   tools/xenstored/control.c              | 30 +++++++++++++-------------
>   tools/xenstored/minios.c               |  3 +++
>   3 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
> index e854ca1eb8..da4eeca7c5 100644
> --- a/tools/hotplug/Linux/launch-xenstore.in
> +++ b/tools/hotplug/Linux/launch-xenstore.in
> @@ -98,6 +98,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
>   	[ -z "$XENSTORE_DOMAIN_SIZE" ] && XENSTORE_DOMAIN_SIZE=8
>   	XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --memory $XENSTORE_DOMAIN_SIZE"
>   	[ -z "$XENSTORE_MAX_DOMAIN_SIZE" ] || XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --maxmem $XENSTORE_MAX_DOMAIN_SIZE"
> +	[ -z "$XENSTORED_TRACE" ] || XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS -T xenstored-trace.log"

I am probably missing something, but any reason to not use 
@XEN_LOG_DIR@/xenstored-trace.log as we do for xenstored?

Cheers,

-- 
Julien Grall

