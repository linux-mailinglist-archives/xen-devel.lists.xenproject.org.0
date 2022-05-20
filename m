Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0952EB6E
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333890.557804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1L7-0003jm-9W; Fri, 20 May 2022 12:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333890.557804; Fri, 20 May 2022 12:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1L7-0003hO-5x; Fri, 20 May 2022 12:02:41 +0000
Received: by outflank-mailman (input) for mailman id 333890;
 Fri, 20 May 2022 12:02:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1L6-0003hG-Cd
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:02:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1L5-0005dw-G8; Fri, 20 May 2022 12:02:39 +0000
Received: from [54.239.6.186] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1L5-0001Bz-9j; Fri, 20 May 2022 12:02:39 +0000
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
	bh=JwX0JobA4BMoA7jf56a/hJnolgRdRg60wpWgTWz9Ol0=; b=CVD8sMUJScaIsepiZBuDyUiIPM
	KD/9V14sCQBZNcWICtVMQUlLEIPCV1wS2mepPtCr5iKNQAnG1KcsLW+3Tzof0q9GHfgVMbZP2eLjG
	bky3jSGnfIq0+FQpbrQ5//K3+27uD4rwWzEOctcktSVa/H2lOE2u8WXnij4COIdADtbw=;
Message-ID: <1c234dba-0b1a-49d6-e4c7-045c8bfda87f@xen.org>
Date: Fri, 20 May 2022 13:02:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] build: Fix make warning if there is no cppcheck
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <11fe35abe0a4cc79e6f7253d04ed12d951f1d09d.1653043632.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <11fe35abe0a4cc79e6f7253d04ed12d951f1d09d.1653043632.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 20/05/2022 11:49, Bertrand Marquis wrote:
> If cppcheck is not present, the following warning appears during build:
> which: no cppcheck in ([...])
> /bin/sh: cppcheck: command not found
> 
> Fix this by hiding the error output from which and only try to execute
> cppcheck --version if we have a cppcheck.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

This solves the warning so:

Acked-by: Julien Grall <jgrall@amazon.com>

In the long term, I think using what Jan suggested would be better.

Cheers,

-- 
Julien Grall

