Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB9814F9C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655317.1023042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rECnI-0007dh-9B; Fri, 15 Dec 2023 18:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655317.1023042; Fri, 15 Dec 2023 18:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rECnI-0007b1-6K; Fri, 15 Dec 2023 18:20:16 +0000
Received: by outflank-mailman (input) for mailman id 655317;
 Fri, 15 Dec 2023 18:20:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rECnG-0007ar-Gh
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:20:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rECnG-00045Q-2k; Fri, 15 Dec 2023 18:20:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rECnF-00016B-TA; Fri, 15 Dec 2023 18:20:14 +0000
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
	bh=g+wjXQEd6Llwerpzoi1f9KCEQ/bU6rfkvhU1YbLhOio=; b=cPvYJFyWciooHVzfdFBCP06XGy
	DdrMNIJf7Psjj6j9r0HUj+WEFM6FkOf/w0DG2V25N37Ke3s5+kjnZZDf9Y514+unVKi0CebjHTG58
	q7u5gxVA6ZzNoGWqy4qymP+ZWMD3vPlId0knLt5cCaN7EyZnweSqXyEMrS0aQEOpXs6w=;
Message-ID: <6e9db22f-2974-48a8-a659-a2424c60c797@xen.org>
Date: Fri, 15 Dec 2023 18:20:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/char: Drop run_in_exception_handler() ifdefary
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Federico Serafini <federico.serafini@bugseng.com>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
 <20231215181433.1588532-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231215181433.1588532-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 15/12/2023 18:14, Andrew Cooper wrote:
> Since commit 60a9b0715055 ("xen: introduce CONFIG_GENERIC_BUG_FRAME"), the new
> common bug.h provides an implementation of run_in_exception_handler() in all
> cases, making the #else here dead.

This reminds me, I need to look at using CONFIG_GENERIC_BUG_FRAME for 
Arm. In the past, we had some issues compiling it.

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

