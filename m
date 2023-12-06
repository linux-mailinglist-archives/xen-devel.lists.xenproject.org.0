Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B98806BA1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 11:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649067.1013366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAovE-0002TE-By; Wed, 06 Dec 2023 10:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649067.1013366; Wed, 06 Dec 2023 10:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAovE-0002R5-7m; Wed, 06 Dec 2023 10:14:28 +0000
Received: by outflank-mailman (input) for mailman id 649067;
 Wed, 06 Dec 2023 10:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mE+U=HR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rAovC-0002Qz-8M
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 10:14:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa50b64-9420-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 11:14:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 712FB4EE0739;
 Wed,  6 Dec 2023 11:14:23 +0100 (CET)
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
X-Inumbo-ID: 3aa50b64-9420-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Wed, 06 Dec 2023 11:14:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] ns16550: remove partial explicit initializer
In-Reply-To: <21691a25-1630-4f56-bd3f-60e2a71107ef@suse.com>
References: <89f9aebddac56c034aace59c5b910ad4bef701c5.1701793717.git.nicola.vetrini@bugseng.com>
 <21691a25-1630-4f56-bd3f-60e2a71107ef@suse.com>
Message-ID: <5bdafb3552e35e5db3db54ba59e23b6b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-06 10:01, Jan Beulich wrote:
> On 05.12.2023 17:31, Nicola Vetrini wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -73,7 +73,7 @@ static struct ns16550 {
> 
> With the variable even being static, ...
> 
>>      bool msi;
>>      const struct ns16550_config_param *param; /* Points into .init.*! 
>> */
>>  #endif
>> -} ns16550_com[2] = { { 0 } };
>> +} ns16550_com[2] = { };
> 
> ... what use is the initializer in the first place?
> 
> Jan

I understood it as a visual cue that the array was initialized, as it 
was before. I don't have a specific preference one way or another, but I 
see this has already been committed.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

