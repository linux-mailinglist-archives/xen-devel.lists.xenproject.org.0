Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4737363D
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122916.231899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCri-0002SA-27; Wed, 05 May 2021 08:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122916.231899; Wed, 05 May 2021 08:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCrh-0002Or-UU; Wed, 05 May 2021 08:26:41 +0000
Received: by outflank-mailman (input) for mailman id 122916;
 Wed, 05 May 2021 08:26:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leCrg-0002Of-3H
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:26:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leCre-0005Mm-2a; Wed, 05 May 2021 08:26:38 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leCrd-0005nh-Qk; Wed, 05 May 2021 08:26:37 +0000
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
	bh=Bnc620D7Y/A1AOJp/WBBp5QvW31nlw914HMMj82VQwg=; b=GLw8t3n5trBIbyiw99uUKu3Xty
	3/odtFKuDxD1hDGa2Dh41Nvh0MpVPtIcVbcIjOrZOk6nYvUseHu5m26t3KqTCiL3NFaOtJYK8t+5R
	Cg54MyNo2t/IoCOeiVs+elQ4QJSjuDQTA1dfX3celdx5kAUn0rpcIIhSTjUu9zJcm6Mo=;
Subject: Re: [PATCH v4] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f23ed85d-a906-a8b3-edba-48eb376c0633@xen.org>
Date: Wed, 5 May 2021 09:26:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/05/2021 09:42, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway, by doing this only
> in gnttab_populate_status_frames(). While the delaying of the respective
> memory allocation adds possible reasons for failure of the respective
> enclosing operations, there are other memory allocations there already,
> so callers can't expect these operations to always succeed anyway.
> 
> As to the re-ordering at the end of gnttab_unpopulate_status_frames(),
> this is merely to represent intended order of actions (shrink array
> bound, then free higher array entries). If there were racing accesses,
> suitable barriers would need adding in addition.

Please drop the last sentence, this is at best misleading because you 
can't just add barriers to make it race free (see the discussion on v2 
for more details).

With the sentence dropped:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,


[1] <f82ddfe7-853d-ca15-2373-a38068f65ef7@xen.org>


-- 
Julien Grall

