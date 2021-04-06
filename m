Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EF355BFF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 21:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106245.203205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTr42-0002BG-31; Tue, 06 Apr 2021 19:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106245.203205; Tue, 06 Apr 2021 19:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTr41-0002Ap-VI; Tue, 06 Apr 2021 19:08:37 +0000
Received: by outflank-mailman (input) for mailman id 106245;
 Tue, 06 Apr 2021 19:08:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTr3z-0002Ak-PS
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 19:08:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTr3q-0005P2-Gg; Tue, 06 Apr 2021 19:08:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTr3q-0007xZ-6J; Tue, 06 Apr 2021 19:08:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=6wOenFQlNcHpNG9oYsLulwUGB8EKhCn0QaFN28HGeX0=; b=fVnRkz3EO6qqxT8hFyFm76YoT9
	+55CWVWeYlxrD+ftRBKqaJAqPmeTecjnULwDytvcNJZjHQ4LQsIBbMStNHPwcVT4+RvmsvFXJLIbt
	RskPosV4cPXhtynfwgNg1LRfNSzHzP9BbC4fjC8lQg9qmllQ6Cm5BJRyKYy7C7Ub7t2w=;
Subject: Re: [PATCH 00/14] Use const whether we point to literal strings (take
 1)
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210405155713.29754-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7e7e7324-0bb8-4583-3282-7ef0a6b2f1b1@xen.org>
Date: Tue, 6 Apr 2021 20:08:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 05/04/2021 16:56, Julien Grall wrote:
> Julien Grall (14):
>    xen: Constify the second parameter of rangeset_new()
>    xen/sched: Constify name and opt_name in struct scheduler
>    xen/x86: shadow: The return type of sh_audit_flags() should be const >    tools/firmware: hvmloader: Use const in __bug() and __assert_failed()
>    tools/kdd: Use const whenever we point to literal strings
>    tools/xentrace: Use const whenever we point to literal strings

I have merged the above patches. The rest still needs some reviews or 
respin (for patch #4).

Cheers,

-- 
Julien Grall

