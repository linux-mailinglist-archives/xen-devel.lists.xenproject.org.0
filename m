Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDE70DCF2
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 14:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538483.838448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RS2-0001ms-9u; Tue, 23 May 2023 12:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538483.838448; Tue, 23 May 2023 12:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RS2-0001jj-6E; Tue, 23 May 2023 12:49:18 +0000
Received: by outflank-mailman (input) for mailman id 538483;
 Tue, 23 May 2023 12:49:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q1RS0-0001j7-Uk
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 12:49:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q1RRz-0004f0-Fo; Tue, 23 May 2023 12:49:15 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.11.95]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q1RRz-0001S7-9P; Tue, 23 May 2023 12:49:15 +0000
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
	bh=4t0bMAxBhqhtnV31uOR6tsKBZ3Y3/TqJbAfZTn9OVcU=; b=HoH1ZUsXiPBVfFcQoJO9UId+IW
	eNkzgPvHwg04xgwv9QuLN+CPOfGhRDl0KsHCZsWU6z5Gx7iOCil3UEaSZlzTJds0ZfDltrQfh7yoB
	54sx1uzbAIeJefIEWzOrZbztqzY/Jk2KgyrIlT6A8bj4cIcIxKOcSnBTbd39n/p9PKco=;
Message-ID: <b5743ce3-2f3c-c514-2deb-710a3980b2db@xen.org>
Date: Tue, 23 May 2023 13:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2] maintainers: add regex matching for xsm
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230522191450.5665-1-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230522191450.5665-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 22/05/2023 20:14, Daniel P. Smith wrote:
> XSM is a subsystem where it is equally important of how and where its hooks are
> called as is the implementation of the hooks. The people best suited for
> evaluating the how and where are the XSM maintainers and reviewers. This
> creates a challenge as the hooks are used throughout the hypervisor for which
> the XSM maintainers and reviewers are not, and should not be, a reviewer for
> each of these subsystems in the MAINTAINERS file. Though the MAINTAINERS file
> does support the use of regex matches, 'K' identifier, that are applied to both
> the commit message and the commit delta. Adding the 'K' identifier will declare
> that any patch relating to XSM require the input from the XSM maintainers and
> reviewers. For those that use the get_maintianers script, the 'K' identifier
> will automatically add the XSM maintainers and reviewers. Any one not using
> get_maintainers, it will be their responsibility to ensure that if their work
> touches and XSM hook, to ensure the XSM maintainers and reviewers are copied.
> 
> This patch adds a pair of regex expressions to the XSM section. The first is
> `xsm_.*` which seeks to match XSM hooks in the commit's delta. The second is
> `\b(xsm|XSM)\b` which seeks to match strictly the words xsm or XSM and should
> not capture words with a substring of "xsm".
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2f1881b32..b0f0823d21 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -674,6 +674,8 @@ F:	tools/flask/
>   F:	xen/include/xsm/
>   F:	xen/xsm/
>   F:	docs/misc/xsm-flask.txt
> +K:	xsm_.*
> +K:	\b(xsm|XSM)\b
>   
>   THE REST
>   M:	Andrew Cooper <andrew.cooper3@citrix.com>

-- 
Julien Grall

