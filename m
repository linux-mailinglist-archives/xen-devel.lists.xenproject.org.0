Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696535E62D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 20:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110091.210140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNdG-00087m-Qq; Tue, 13 Apr 2021 18:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110091.210140; Tue, 13 Apr 2021 18:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNdG-00087N-N9; Tue, 13 Apr 2021 18:19:26 +0000
Received: by outflank-mailman (input) for mailman id 110091;
 Tue, 13 Apr 2021 18:19:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWNdF-00087I-0c
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 18:19:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWNdD-00018u-GE; Tue, 13 Apr 2021 18:19:23 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWNdD-0003QO-83; Tue, 13 Apr 2021 18:19:23 +0000
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
	bh=uHo4OxMK6flwM207WY7VYnJ0W6uAPtprU6t4eOqXek8=; b=FV0JnJisldGm5Wiw1uBa5bMKUm
	AvkVvbphaUUS+nW1HwoFJuYtR62Uke181sGjymVvcHBdJyYw1c18/dQgLmXztZrJR8iPkfugwRJYO
	tJ4Anm5szKL65xE/D8Pmkc5tGOIHGOG0yS17PRWdHd4HBti+K3LphIEaxVfQxPW5+heM=;
Subject: Re: [PATCH 11/11] Arm/optee: don't open-code xzalloc_flex_struct()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <aad23304-c727-2921-59fe-ab3763f5da03@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9f95c37b-dc4a-d2cf-01c1-98d2108fae88@xen.org>
Date: Tue, 13 Apr 2021 19:19:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <aad23304-c727-2921-59fe-ab3763f5da03@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/04/2021 13:23, Jan Beulich wrote:
> There is a difference in generated code: xzalloc_bytes() forces
> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
> actually don't want it.

So I think moving to xmalloc_flex_struct() is a pretty good move. But I 
am actually a bit confused with the argument used.

Could you provide some details why you think forcing the array to be 
aligned to the maximum cache line supported (128 bytes on Arm) is wrong?

Cheers,

-- 
Julien Grall

