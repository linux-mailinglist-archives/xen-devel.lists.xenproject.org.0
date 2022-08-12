Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A355914B2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 19:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385813.621567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMYFm-0002sg-O0; Fri, 12 Aug 2022 17:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385813.621567; Fri, 12 Aug 2022 17:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMYFm-0002pb-KW; Fri, 12 Aug 2022 17:15:22 +0000
Received: by outflank-mailman (input) for mailman id 385813;
 Fri, 12 Aug 2022 17:15:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMYFk-0002pV-O9
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 17:15:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMYFk-00077v-DU; Fri, 12 Aug 2022 17:15:20 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.11.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMYFk-0000i5-5F; Fri, 12 Aug 2022 17:15:20 +0000
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
	bh=fWZu0u9Y5erHPDXGbeM/wQVwM6MuxBgsbUkTJ1tpcZg=; b=e+Ce207VFBh0Rd1kLCPezLZSDS
	FMZB36fdA/TtedaYD/Q2yDQozzyve+i9JtMTG09IYwQ6Z9GMeILmOES+aqel0RdPENoLAPa3rtGgj
	HGN2N1JNzJK5TmZq8+jP/QzjkuyNcGJPL8n2X1jcpnzD8aAFn9p4R3k/L2AkYnas/gLc=;
Message-ID: <8a8e66f0-1deb-a215-c171-a7759e0a6057@xen.org>
Date: Fri, 12 Aug 2022 18:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
 <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
 <68ca5d7c-d443-ea48-3984-ff76652392df@xen.org>
 <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
 <65772df3-a462-65fe-864e-d613d32c76e0@xen.org>
 <1455f58e-f035-083d-c1bb-13bafb45f933@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1455f58e-f035-083d-c1bb-13bafb45f933@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/08/2022 11:56, Juergen Gross wrote:
> On 12.08.22 11:13, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 08/08/2022 12:31, Juergen Gross wrote:
>>> On 08.08.22 13:00, Julien Grall wrote:
>>>>> This would break the use of xenstore-stubdom for such a setup.
>>>>
>>>> I am not sure why it would break the use of xenstore-stubdom. An 
>>>> application will already need to cope with the case Xenstored 
>>>> doesn't support a feature.
>>>
>>> Someone relying to be able to switch off a feature on a socket 
>>> connection
>>> might get into trouble trying to do the same when running with 
>>> xenstore-stubdom.
>>
>> This is not very different from an application that was built against 
>> an old Xenstored and would not be capable to talk properly with the 
>> new Xenstored if the feature is enabled. I understand that...
>>
>>> Switching a feature off will either not work, or switch the feature 
>>> off for all
>>> dom0 connections (which is a single one, of course).
>>
>> ... when using xenstore-stubdom xenstored it means that the feature 
>> will have to be disable for all dom0 connections.
> 
> Wait, I don't think we can ever add features which will change the 
> behavior of
> Xenstore when those new features aren't being used actively.
That would be fine if you know that your client can support it. Reading 
the rest of the e-mail, AFAIU your aim is to use SET_FEATURES to 
indicate which features is supported by Xenstored. This may or may not 
be supported by the client.

When I replied, I had a different idea in mind for SET_FEATURES. But I 
think it wouldn't work in a generic setup because an handshake would be 
necessary (the client would need to advertise the features it supports).

Anyway, now I understand your point and agree with you the we want to 
only have the field 'features' for ring connection.

Thanks for the clarification!

Cheers,

-- 
Julien Grall

