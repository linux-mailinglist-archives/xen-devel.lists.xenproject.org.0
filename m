Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B7753BB8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 15:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563646.880986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIlE-0004nm-HL; Fri, 14 Jul 2023 13:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563646.880986; Fri, 14 Jul 2023 13:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIlE-0004mR-EE; Fri, 14 Jul 2023 13:23:04 +0000
Received: by outflank-mailman (input) for mailman id 563646;
 Fri, 14 Jul 2023 13:23:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKIlC-0004mH-Qj
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:23:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKIlB-0002BE-KT; Fri, 14 Jul 2023 13:23:01 +0000
Received: from [54.239.6.186] (helo=[192.168.4.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKIlB-0003FY-Eg; Fri, 14 Jul 2023 13:23:01 +0000
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
	bh=dGRqjOHHyeYazry7toK83b5avv/MhJKkK17pLYfjMRo=; b=u2dOM9IUcvpgDdKbSKLsTpoetg
	sHR08tsztw8VH7L0rcyY4UvUjdWTPbS3HnTacLEQ4T8ztINA1DWH0ZIdqTq5bQarui8zZq52SGLNH
	TVHqns2viCTtv6JyjyxeosbnzWQhoUXp1hHxNkiHDINKuXHYtT89aQqzgO+hQTYFllho=;
Message-ID: <b7aeb152-3dce-6378-3f9d-e23913a1e15f@xen.org>
Date: Fri, 14 Jul 2023 14:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/common: Use const char * for string literals
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20230714105902.2996620-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230714105902.2996620-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 14/07/2023 11:59, Andrew Cooper wrote:
> For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
> it is undefined behaviour to mutate them.
> 
> Swap char *'s to const char *'s for variables which hold string literals.
> 
> This fixes several violations of MISRA Rule 7.4:
> 
>    A string literal shall not be assigned to an object unless the object's type
>    is "pointer to const-qualified char".
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

