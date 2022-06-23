Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937A5587A0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355129.582605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ref-0005Fo-NI; Thu, 23 Jun 2022 18:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355129.582605; Thu, 23 Jun 2022 18:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ref-0005Df-KB; Thu, 23 Jun 2022 18:34:13 +0000
Received: by outflank-mailman (input) for mailman id 355129;
 Thu, 23 Jun 2022 18:34:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4Red-0005DZ-Qt
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:34:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Red-0003EB-H2; Thu, 23 Jun 2022 18:34:11 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Red-00029e-8b; Thu, 23 Jun 2022 18:34:11 +0000
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
	bh=3ddCkUWlRCbiDqr4lfOdAp4N8Iou0D35VDNGT72VTUA=; b=o0RbW0lQ3Quxa1hexj+HajP2mw
	9w+FRFZ15aGK0jEraGluZH9VD1+FG9PBbxrNBbe5ucVqR6SYyi1ngqGnnoDfdbunaM9T6IWkF+cah
	1tgzyESAm5YjL2KD/b0KhC44Fc3poTukjBAUWZK2fBj0KA98ddfAKyz5iXcEJCw9d8Nk=;
Message-ID: <a3eb8018-2e32-e451-7d97-885a5d4fd336@xen.org>
Date: Thu, 23 Jun 2022 19:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/4] tools/xenstore: add documentation for new
 set/get-quota commands
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220527072427.20327-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/05/2022 08:24, Juergen Gross wrote:
> Add documentation for two new Xenstore wire commands SET_QUOTA and
> GET_QUOTA used to set or query the global Xenstore quota or those of
> a given domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Note that it might be a good idea to add support to the Xenstore
> migration protocol to transfer quota data (global and/or per domain).

I think this is needed because a user may have configured a domain with 
quotas above the default. After Live-Update, we would have a short 
window where the domain may not function properly.

I think it would be good to documentation the migration part in this 
patch. But if you want do it separately then:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

