Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1147666242
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475677.737451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfBO-0000GM-RK; Wed, 11 Jan 2023 17:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475677.737451; Wed, 11 Jan 2023 17:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfBO-0000Cr-NY; Wed, 11 Jan 2023 17:46:38 +0000
Received: by outflank-mailman (input) for mailman id 475677;
 Wed, 11 Jan 2023 17:46:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFfBN-0000Cl-AD
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:46:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfBM-0006pK-KA; Wed, 11 Jan 2023 17:46:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfBM-0000QX-EY; Wed, 11 Jan 2023 17:46:36 +0000
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
	bh=Jvy5eD9ZeUAtNcJWnt2kJUd5icqyY9UC1xK7nopURIA=; b=PO7N406FBi0TsjelWwOzO7r9YR
	Roq7YBxAWuL9bEYoFhZovjoKzOAfU0TdpgFOisQCpfwN2Jk7A5jyjebSQRPIWpGW7Gz75uZgzKEj8
	HSyopx0/r8TqNllC33M+wOxIUuRsJC+cziVxkVk/roePs42Bg0oWVYNB/MIETLsbKA2I=;
Message-ID: <0d56e193-c70d-e65a-f4a5-02babc608045@xen.org>
Date: Wed, 11 Jan 2023 17:46:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/19] tools/xenstore: introduce dummy nodes for
 special watch paths
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-8-jgross@suse.com>
 <ef0ed925-5c07-a5c2-c7e6-f5a8ad21d480@xen.org>
 <db863117-a383-4373-d43d-7072bdf57a96@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <db863117-a383-4373-d43d-7072bdf57a96@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 11/01/2023 06:41, Juergen Gross wrote:
> On 20.12.22 20:39, Julien Grall wrote:
>>> +static void fire_special_watches(const char *name)
>>> +{
>>> +    void *ctx = talloc_new(NULL);
>>> +    struct node *node;
>>> +
>>> +    if (!ctx)
>>> +        return;
>>> +
>>> +    node = read_node(NULL, ctx, name);
>>> +
>>> +    if (node)
>>> +        fire_watches(NULL, ctx, name, node, true, NULL);
>>
>> NIT: I would consider to log an error (maybe only once) if 'node' is 
>> NULL. The purpose is to help debugging Xenstored.
> 
> I think we can log it always, as this is really a bad problem.

That works for me. If it is always logged, then I guess this would need 
to be a syslog message as well.

Cheers,

-- 
Julien Grall

