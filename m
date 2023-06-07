Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C71725C0B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544699.850659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qjk-0000uo-AZ; Wed, 07 Jun 2023 10:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544699.850659; Wed, 07 Jun 2023 10:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qjk-0000s6-7m; Wed, 07 Jun 2023 10:49:56 +0000
Received: by outflank-mailman (input) for mailman id 544699;
 Wed, 07 Jun 2023 10:49:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6qji-0000s0-Tw
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:49:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qjh-0000qS-SU; Wed, 07 Jun 2023 10:49:53 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qjh-0004ty-Lk; Wed, 07 Jun 2023 10:49:53 +0000
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
	bh=LDN6gO7jFfKIWZ+qS/a4+1bxq6Y04R9l52k4aKls4Eo=; b=jr67EYC0CK6x8gyOifnueTaR2M
	tzS2uh9vVGLE6je69J0N2CSFpsbA67Qf2OaOtsZMBOGHEjIjtMmX3KMk6kkZN2U7U//A2Hj+RwgOy
	Q4zBoaZWwF6KZJ3lmYEXvhz4xnsFxGJ4rQXqh9qQGKfMMEsEFjuy58aRuTg4xPwxwD2E=;
Message-ID: <baa4d9b3-7538-61e6-3b9c-64e32f335f67@xen.org>
Date: Wed, 7 Jun 2023 11:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 05/14] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530082424.32126-1-jgross@suse.com>
 <20230530082424.32126-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530082424.32126-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:24, Juergen Gross wrote:
> Add the node accounting to the accounting information buffering in
> order to avoid having to undo it in case of failure.
> 
> This requires to call domain_nbentry_dec() before any changes to the
> data base, as it can return an error now.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

