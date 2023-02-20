Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03669C7EA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 10:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497998.768770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU2ku-00030U-Sd; Mon, 20 Feb 2023 09:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497998.768770; Mon, 20 Feb 2023 09:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU2ku-0002xu-PA; Mon, 20 Feb 2023 09:46:44 +0000
Received: by outflank-mailman (input) for mailman id 497998;
 Mon, 20 Feb 2023 09:46:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pU2ks-0002xo-PR
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 09:46:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU2ks-0003qv-0X; Mon, 20 Feb 2023 09:46:42 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.98.51])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU2kr-0005C7-NM; Mon, 20 Feb 2023 09:46:41 +0000
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
	bh=AoNy+bhsopCqt3Qqp24OGW0eFfiCNk/ARze0y4mqBCE=; b=1XsVwyxGz9qU7kwgvaUiPH+CJn
	Ik9gD9cnyM5gh89zMkzH/B35UCT4ANZqTPqK/azQhI5hisL41pEApsx9bzOARBCdreX0xpCV2awxe
	JrYL+MlM3ArUyjhcvhk4hzXSJTZt261AOLvEntdyJO34h7oX+pqx4AKf+iTiaCu7CvZg=;
Message-ID: <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
Date: Mon, 20 Feb 2023 09:46:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230120100028.11142-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 20/01/2023 10:00, Juergen Gross wrote:
> The accounting for the number of nodes of a domain in an active
> transaction is not working correctly, as it allows to create arbitrary
> number of nodes. The transaction will finally fail due to exceeding
> the number of nodes quota, but before closing the transaction an
> unprivileged guest could cause Xenstore to use a lot of memory.

I know I said I would delay my decision on this patch. However, I was 
still expecting the commit message to be updated based on our previous 
discussion.

Also thinking more about it, "The transaction will finally fail due to 
exceeding the number of nodes quota" may not be true for a couple of 
reasons:
   1) The transaction may removed a node afterwards.
   2) A node may have been removed outside of the transaction.

In both situation, the transaction will still be committed. This will 
now be prevented by this patch.

While I understand, they may be edge cases, this is also true for what 
you are aiming to solve. So I am still not convinced about the benefits 
of this patch.

Cheers,

-- 
Julien Grall

