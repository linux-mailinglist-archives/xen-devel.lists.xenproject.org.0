Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074C75DD7B
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 18:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568051.887459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNFie-0005S8-5S; Sat, 22 Jul 2023 16:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568051.887459; Sat, 22 Jul 2023 16:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNFie-0005Ph-29; Sat, 22 Jul 2023 16:44:36 +0000
Received: by outflank-mailman (input) for mailman id 568051;
 Sat, 22 Jul 2023 16:44:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qNFid-0005Pb-81
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 16:44:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNFic-0004jh-2F; Sat, 22 Jul 2023 16:44:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNFib-00006M-Q0; Sat, 22 Jul 2023 16:44:33 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=yuYB436eqH2GU3dKV2QT3D7Wz9PnJv+5Vky4kR/9QmU=; b=MICvJ15nZXtawZYm/O677W5Kbw
	Sd/9LiVj64/ne11qw6mbJsdPuMQUU2WPdXhY02FZooq5bXXR0qpRLjEqCo4H7BP3nJ3HYLG0/5edb
	6W1eqGr6usKnyvYz1yo2UJ4tG0xKzTXEWR/sy4nsJRmX/HVLCYWUuJ5YV0vzw2kjjNpk=;
Message-ID: <e374c950-7dce-2e28-3b4c-946f4a0a2aec@xen.org>
Date: Sat, 22 Jul 2023 17:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] tools/xenstore: add const to the return type of
 canonicalize()
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230722081646.4136-1-jgross@suse.com>
 <20230722081646.4136-2-jgross@suse.com>
 <adc0b17a-1d59-8c52-8823-64a0d9ec475b@xen.org>
In-Reply-To: <adc0b17a-1d59-8c52-8823-64a0d9ec475b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/07/2023 16:20, Julien Grall wrote:
> Hi Juergen,
> 
> On 22/07/2023 09:16, Juergen Gross wrote:
>> -static struct watch *add_watch(struct connection *conn, char *path, 
>> char *token,
>> -                   bool relative, bool no_quota_check)
>> +static struct watch *add_watch(struct connection *conn, const char 
>> *path,
>> +                   const char *token, bool relative,
>> +                   bool no_quota_check)
>>   {
>>       struct watch *watch;
>> @@ -218,12 +219,14 @@ int do_watch(const void *ctx, struct connection 
>> *conn, struct buffered_data *in)
>>   {
>>       struct watch *watch;
>>       char *vec[2];
>> +    const char *path;
>>       bool relative;
>>       if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
>>           return EINVAL;
>> -    errno = check_watch_path(conn, ctx, &(vec[0]), &relative);
>> +    path = vec[0];
>> +    errno = check_watch_path(conn, ctx, &path, &relative);
> 
>  From my understanding, check_watch_path() could update vec[0] which is 
> then used below. But with your change, vec[0] would not be updated anymore.
> 
> I can see two possible approach:
>     1) get_strings() is taking a const as well

I have a patch doing this. I will send it on Monday.

Cheers,

-- 
Julien Grall

