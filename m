Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E973213E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549885.858667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9u4a-0001kK-LP; Thu, 15 Jun 2023 21:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549885.858667; Thu, 15 Jun 2023 21:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9u4a-0001gr-IM; Thu, 15 Jun 2023 21:00:04 +0000
Received: by outflank-mailman (input) for mailman id 549885;
 Thu, 15 Jun 2023 21:00:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9u4Z-0001UP-9C
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:00:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9u4Y-0007Hc-Jc; Thu, 15 Jun 2023 21:00:02 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9u4Y-0002yg-D9; Thu, 15 Jun 2023 21:00:02 +0000
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
	bh=dZt+950HjfTgtDA5EWE7mE3Qn0cX0A3CA3zKoAswfas=; b=Y/1De1NB0J44ViIUZxI6Sci/HU
	bJ+33/8esMFrw0hKqTqv2lNFjgFS2he3aBYvO4cTxS6zaVNTzsvjLhSQWsZYlp+vTmAxB4mtaj9YC
	3w/IA2ymXzuR9a3nntUOSWBtPaAs/g7W0fvyyXWZIgEbCyzfj7KXv0ZDaz1hYIV3MEKo=;
Message-ID: <dc07a985-2c27-035f-b6b6-fe14be108f5c@xen.org>
Date: Thu, 15 Jun 2023 22:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 12/16] tools/xenstore: remove no longer needed
 functions from xs_lib.c
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> xs_daemon_tdb() in xs_lib.c is no longer used at all, so it can be
> removed. xs_domain_dev() and xs_write_all() are not used by xenstored,
> so they can be moved to tools/libs/store/xs.c.
> 
> xs_daemon_rootdir() is used by xenstored only and it only calls
> xs_daemon_rundir(), so replace its use cases with xs_daemon_rundir()
> and remove it from xs_lib.c.
> 
> xs_daemon_socket_ro() is needed in libxenstore only, so move it to
> tools/libs/store/xs.c.
> 
> Move functions used by xenstore-client only to xenstore_client.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

