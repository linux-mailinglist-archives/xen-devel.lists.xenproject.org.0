Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4055B909
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356380.584577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lXY-0005aI-35; Mon, 27 Jun 2022 10:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356380.584577; Mon, 27 Jun 2022 10:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lXX-0005YH-W5; Mon, 27 Jun 2022 10:00:19 +0000
Received: by outflank-mailman (input) for mailman id 356380;
 Mon, 27 Jun 2022 10:00:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5lXW-0005IT-GH
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:00:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lXU-00088M-Iv; Mon, 27 Jun 2022 10:00:16 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lXU-00085B-BU; Mon, 27 Jun 2022 10:00:16 +0000
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
	bh=Ou47FWTOOPkFfV4TRqMrUAF44oQA6xSjq/DqZXuJK2s=; b=VHnlhrifS5+3CIJqbZ7jUWYjjc
	6Hc5H4Ca5bs8HOPmRDQCNilCn3S1BRp2XB+Xd9D7jIuOrMuhnpZGARHWZxcPmD9bSk/Uu4VLlaVMB
	J9Z1OSSnsKD03CSj1HwE37TrhPN8RZoqT91crRDf3b7rp+W4gq3OfMBjBODMisdhTjYY=;
Message-ID: <ce325da1-e6d4-3692-9707-f9bd52bf78c4@xen.org>
Date: Mon, 27 Jun 2022 11:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] public/io: xs_wire: Allow Xenstore to report EPERM
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220624165151.940-1-julien@xen.org>
 <d135e1aa-d0bb-8a7a-cb1d-7dc9387f1f24@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d135e1aa-d0bb-8a7a-cb1d-7dc9387f1f24@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/06/2022 07:57, Jan Beulich wrote:
> On 24.06.2022 18:51, Julien Grall wrote:
>> --- a/xen/include/public/io/xs_wire.h
>> +++ b/xen/include/public/io/xs_wire.h
>> @@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
>>   __attribute__((unused))
>>   #endif
>>       = {
>> +    XSD_ERROR(EPERM),
>>       XSD_ERROR(EINVAL),
>>       XSD_ERROR(EACCES),
>>       XSD_ERROR(EEXIST),
> 
> Inserting ahead of EINVAL looks to break xenstored_core.c:send_error(),

:(.

> which - legitimately or not - assumes EINVAL to be first.

I am not sure who else is relying on this. So I would consider this to 
be bake in the ABI. I think the minimum is to add a BUILD_BUG_ON() in 
send_error().

I will also move EPERM towards the end (I added first because EPERM is 1).

Cheers,

-- 
Julien Grall

