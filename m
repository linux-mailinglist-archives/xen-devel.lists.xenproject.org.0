Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAF6A1DE4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501120.772719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZZE-0004f3-AP; Fri, 24 Feb 2023 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501120.772719; Fri, 24 Feb 2023 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZZE-0004dG-6o; Fri, 24 Feb 2023 15:01:00 +0000
Received: by outflank-mailman (input) for mailman id 501120;
 Fri, 24 Feb 2023 15:00:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVZZC-0004d9-Fn
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:00:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVZZC-0000RC-BN; Fri, 24 Feb 2023 15:00:58 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.156.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVZZC-0001fl-5e; Fri, 24 Feb 2023 15:00:58 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID; bh=2mzti8Sv1CTJp4qEfEXVPD+6RBsoor0gOmFXqiBYw/o=
	; b=I0tAOrWVIMc64hBjH3eITvf9vJvHp2ilMYMVA9UpVlrhz6DfGB8KqXTaiJeeAb9Uq0KU1ZgMS
	/i0kYu1YrDdMMmYQhgGSpCBHmZQmKKL+KxxZMKmKUV9IKRXUBGgfVDljSBARbodmaiQAI9Qb/u5i9
	AlWSOogu9nvtILoOpzIQ0=;
Message-ID: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
Date: Fri, 24 Feb 2023 15:00:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Julien Grall <julien@xen.org>
Subject: xenstored: Interaction bettwen SET_PERMS and transaction
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

For some internal purpose, I need to write a script that would do the 
following:

   1) Start a transaction
   2) Call GET_PERMS
   3) Call SET_PERMS with the permission just retrieved
   4) Commit the transaction

(Don't ask why :))

This was executed from dom0 on every nodes. In some cases, we noticed 
that 4) would return -ENOSPC.

When digging through the code, it looks like this is because 
transaction_fix_domains() (now called acc_fix_domains()) will check that 
the quota is correct.

The domain is question were over its limit, but given this is called by 
dom0, I would have expected that it should not never return -ENOSPC 
(note that a SET_PERMS outside of a transaction would work, but this 
can't be used our case).

Furthermore, the transaction is not changing any accounting. So I find a 
bit strange that we would prevent it even if this was run from an 
unprivileged domain.

Do you know if this issues would be fixed by your current rework?

If not, then I think we at least want to skip the quota check if the 
domain is privileged.

For non-privileged domain, I am not entirely sure what to do. I was 
originally thinking to check if cd->nbentry is 0 and then skip the quota 
check. But this would allow a domain to remove a node and then replace 
by a new one (I think we still want to forbid that).

What do you think?

Cheers,

-- 
Julien Grall

