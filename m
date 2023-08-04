Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50F76FD20
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577013.903791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqzy-0003iA-Ky; Fri, 04 Aug 2023 09:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577013.903791; Fri, 04 Aug 2023 09:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqzy-0003gX-IA; Fri, 04 Aug 2023 09:21:30 +0000
Received: by outflank-mailman (input) for mailman id 577013;
 Fri, 04 Aug 2023 09:21:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRqzx-0003gR-6Q
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:21:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRqzw-0006LR-BE; Fri, 04 Aug 2023 09:21:28 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.104.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRqzw-0005Le-5H; Fri, 04 Aug 2023 09:21:28 +0000
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
	bh=r61StbouY/C8r/7hrH1QcobJYI1Q2gBAA4aCPWNc/p8=; b=oN/4IkcclgFRBGMC2yr2BfUQae
	yFBgl51xcNNkYCb8dHpNMA40NYwWNDBwvWjiH85DcpshVKb6fI/klyad1JjpZ7k8TzBSUqyxaKcjT
	MNhGv9Ux3fbVk7vrCOlDTCKpUcq9ECPy354Pqdmmcq9p/ii6rmQt4PWLCy7/CAgo/UIo=;
Message-ID: <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>
Date: Fri, 4 Aug 2023 10:21:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
 <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/08/2023 10:17, Juergen Gross wrote:
> On 03.08.23 23:36, Julien Grall wrote:
>> Hi,
>>
>> On 24/07/2023 12:02, Juergen Gross wrote:
>>> diff --git a/tools/xenstore/xenstored_watch.c 
>>> b/tools/xenstore/xenstored_watch.c
>>> index 86cf8322b4..2662a3fa49 100644
>>> --- a/tools/xenstore/xenstored_watch.c
>>> +++ b/tools/xenstore/xenstored_watch.c
>>> @@ -166,19 +166,12 @@ static int destroy_watch(void *_watch)
>>>   static int check_watch_path(struct connection *conn, const void *ctx,
>>>                   const char **path, bool *relative)
>>>   {
>>> -    /* Check if valid event. */
>>> -    if (strstarts(*path, "@")) {
>>> -        *relative = false;
>>> -        if (strlen(*path) > XENSTORE_REL_PATH_MAX)
>>> -            goto inval;
>>
>> I can't find an exact matching check in is_valid_nodename(). The call 
>> also seems to put more restriction on '@' node. Can you clarify?
> 
> The call of domain_max_chk() in is_valid_nodename() will check the length
> of the node name (at least for unprivileged callers, which is the important
> case).

Right, but from my understanding, this may not check against 
XENSTORE_REL_PATH_MAX but whatever limit the user set.

This is a change of behavior that you ought to be explained.

> 
> The additional restrictions for special nodes are:
> 
> - they can't end with "/"
> - they can't contain "//"
> - they can't contain characters other than the ones allowed for normal 
> nodes
> 
> None of those restrictions are problematic. I can add something to the
> commit message if you want.

Yes please.

Cheers,

-- 
Julien Grall

