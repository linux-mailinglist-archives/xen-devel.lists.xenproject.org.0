Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157FF3B29DB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 10:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146466.269498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKNf-0007Uj-HD; Thu, 24 Jun 2021 08:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146466.269498; Thu, 24 Jun 2021 08:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKNf-0007Ss-E6; Thu, 24 Jun 2021 08:06:35 +0000
Received: by outflank-mailman (input) for mailman id 146466;
 Thu, 24 Jun 2021 08:06:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwKNe-0007Sk-4U
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 08:06:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKNb-0003ag-60; Thu, 24 Jun 2021 08:06:31 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKNa-0002ua-UC; Thu, 24 Jun 2021 08:06:31 +0000
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
	bh=pB1YWnCA7A0AOxCkbXSbKy3vf3NtrD1e87JcPsvmZXU=; b=T3SDWVWhValekvLRVr12bZlEmD
	5u09sN2I+rAyx9rDyXrbVVl4CWWNao3SV90X5qx/YPA9HcEHx1b4PdQtL5fqw6wU5/ar8+eqsKT7A
	56SjNN6d9dsACdkgNQvWZ5LFho3GAjG1NU85ohTQYAnT1Z+YJyBofZnfmUJbR0aSs+cw=;
Subject: Re: [PATCH 03/10] tools/xenstore: Don't assume conn->in points to the
 LU request
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, raphning@amazon.co.uk, doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-4-julien@xen.org>
 <4316B0AD-5F89-4D04-8996-00836AE3991A@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e08f65e9-8d3c-4f50-20d9-312a358417be@xen.org>
Date: Thu, 24 Jun 2021 10:06:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4316B0AD-5F89-4D04-8996-00836AE3991A@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 21/06/2021 10:55, Luca Fancellu wrote:
>> diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
>> index 6842b8d88760..27d7f19e4b7f 100644
>> --- a/tools/xenstore/xenstored_control.h
>> +++ b/tools/xenstore/xenstored_control.h
>> @@ -20,3 +20,6 @@ int do_control(struct connection *conn, struct buffered_data *in);
>> void lu_read_state(void);
>>
>> struct connection *lu_get_connection(void);
>> +
>> +/* Write the "OK" response for the live-update command */
>> +unsigned int lu_write_response(FILE *fp);
>> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
>> index 607187361d84..41b26d7094c8 100644
>> --- a/tools/xenstore/xenstored_core.c
>> +++ b/tools/xenstore/xenstored_core.c
>> @@ -272,15 +272,10 @@ static int undelay_request(void *_req)
>>
>> static void call_delayed(struct connection *conn, struct delayed_request *req)
> 
> Here the conn parameter is not needed anymore, or am I missing something?

The parameter is now unused. I will drop it.

Cheers,

-- 
Julien Grall

