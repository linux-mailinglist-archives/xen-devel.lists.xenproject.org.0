Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5575BAC4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566789.886109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcP6-0008PY-HO; Thu, 20 Jul 2023 22:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566789.886109; Thu, 20 Jul 2023 22:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcP6-0008NG-Ei; Thu, 20 Jul 2023 22:45:48 +0000
Received: by outflank-mailman (input) for mailman id 566789;
 Thu, 20 Jul 2023 22:45:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMcP5-0008N2-Hf
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:45:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMcP4-00020o-I1; Thu, 20 Jul 2023 22:45:46 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMcP4-0002qQ-CS; Thu, 20 Jul 2023 22:45:46 +0000
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
	bh=5OeqasK1yQOuaCS/hZC7U8CYPg+CPk2wdFcfMpR11dk=; b=6rFsujpJ3b9J/9cRcgxFy3pBdZ
	F9HC8W22MWzasWlm6MK1nE3KyIaGn1mUkE/+Um+ARuYODx3LvWCXvezgDzQo7xdNuAdpTrq83+p75
	FGUx3ijTTsqbPFSml0A8c23hbfeEIm27jlwal2qoDTtcf9Id1jBRFlcNwv8QCntzrA24=;
Message-ID: <d19a18c3-128b-2997-e22c-b2f2f6c46083@xen.org>
Date: Thu, 20 Jul 2023 23:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] tools/xenstore: fix get_spec_node()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230720150853.31368-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230720150853.31368-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 20/07/2023 16:08, Juergen Gross wrote:
> In case get_spec_node() is being called for a special node starting
> with '@' it won't set *canonical_name. This can result in a crash of
> xenstored due to dereferencing the uninitialized name in
> fire_watches().
> 
> This is no security issue as it requires either a privileged caller or
> ownership of the special node in question by an unprivileged caller
> (which is questionable, as this would make the owner privileged in some
> way).
> 
> Fixes: d6bb63924fc2 ("tools/xenstore: introduce dummy nodes for special watch paths")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index a1d3047e48..790c403904 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1252,8 +1252,11 @@ static struct node *get_spec_node(struct connection *conn, const void *ctx,
>   				  const char *name, char **canonical_name,
>   				  unsigned int perm)
>   {
> -	if (name[0] == '@')
> +	if (name[0] == '@') {
> +		if (canonical_name)
> +			*canonical_name = (char *)name;

eww. Let's not continue the bad practice in Xenstored to cast away the 
const. I will have a look to remove the const and you can rebase your 
patch on top.

Cheers,

-- 
Julien Grall

