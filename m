Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0588917B4A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748517.1156250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOKU-000145-SS; Wed, 26 Jun 2024 08:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748517.1156250; Wed, 26 Jun 2024 08:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOKU-00010v-PJ; Wed, 26 Jun 2024 08:48:38 +0000
Received: by outflank-mailman (input) for mailman id 748517;
 Wed, 26 Jun 2024 08:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOKS-00010p-Rq
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:48:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df776c24-3398-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 10:48:35 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id 3BEAE4EE0738;
 Wed, 26 Jun 2024 10:48:34 +0200 (CEST)
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
X-Inumbo-ID: df776c24-3398-11ef-b4bb-af5377834399
Message-ID: <d35cf13a-5cfd-425f-9c01-3a4122da3a69@bugseng.com>
Date: Wed, 26 Jun 2024 10:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for 4.19] automation/eclair: add deviations agreed in
 MISRA meetings
To: Oleksii <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <4a65e064768ad5ddce96d749f24f0bdae2c3b9da.1719328656.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop>
 <c6aeb6007ead36afaf48ceef1070e5ec5a2ef88f.camel@gmail.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <c6aeb6007ead36afaf48ceef1070e5ec5a2ef88f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/06/24 09:37, Oleksii wrote:
> On Tue, 2024-06-25 at 18:59 -0700, Stefano Stabellini wrote:
>>> +-doc_begin="The conversion from a function pointer to unsigned
>>> long or (void *) does not lose any information, provided that the
>>> target type has enough bits to store it."
>>> +-config=MC3R1.R11.1,casts+={safe,
>>> +  "from(type(canonical(__function_pointer_types)))
>>> +   &&to(type(canonical(builtin(unsigned
>>> long)||pointer(builtin(void)))))
>>> +   &&relation(definitely_preserves_value)"
>>> +}
>>> +-doc_end
>>
>> This one and the ones below are the important ones! I think we should
>> have them in the tree as soon as possible ideally 4.19. I ask for
>> a release-ack.
> Just want to be sure that I understand deviations properly with this
> example.
> 
> If the deviation above is merged, then it would be safe from a MISRA
> point of view to cast a function pointer to 'unsigned long' or 'void
> *', and thereby MISRA won't complain about code with such conversions?

Exactly, taking into account section 4.7 of GCC manual.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

