Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37367EB805
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 21:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633258.987894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30TO-0005LB-SX; Tue, 14 Nov 2023 20:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633258.987894; Tue, 14 Nov 2023 20:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30TO-0005Io-PS; Tue, 14 Nov 2023 20:57:26 +0000
Received: by outflank-mailman (input) for mailman id 633258;
 Tue, 14 Nov 2023 20:57:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r30TM-0005Ii-Sj
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 20:57:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30TM-0007VH-6d; Tue, 14 Nov 2023 20:57:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30TM-0004XY-1s; Tue, 14 Nov 2023 20:57:24 +0000
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
	bh=9OCmomxCpefw+gIcjq8RN5WYOB52tvYPIsHxqdDymjw=; b=1dd93Pg2HebsALV4yURHHOaWvH
	Kcqalxo3Pj3pg4frUH9x4t+VNCb7I9n2H7waw+ZNI8p/zeRS/qQrUWzq8dC7AZxDcLHadnujuRLG5
	kpSyNKon8+pMTM4gEROi641cjYuS2ZAFreLOpTxdC2QCZxWcMwhXofnoX78DhgSFuzho=;
Message-ID: <1cedf7ab-aa82-484c-9ddb-2b2537cc1d4a@xen.org>
Date: Tue, 14 Nov 2023 20:57:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
 <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
 <f9e8900b-10a9-4c88-bc99-118c61b549d7@suse.com>
 <829d9031-058f-47ea-95bc-d41b4b439690@xen.org>
 <47cb32ab-d842-47aa-80fc-77cd61ee25bb@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <47cb32ab-d842-47aa-80fc-77cd61ee25bb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 14/11/2023 09:20, Juergen Gross wrote:
> On 14.11.23 10:05, Julien Grall wrote:
>> Hi,
>>
>> On 14/11/2023 06:45, Juergen Gross wrote:
>>> On 13.11.23 23:40, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 10/11/2023 16:08, Juergen Gross wrote:
>>>>> With 9pfs being fully available in Xenstore-stubdom now, there is no
>>>>> reason to not fully support all logging capabilities in stubdom.
>>>>>
>>>>> Open the logfile on stubdom only after the 9pfs file system has been
>>>>> mounted.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>>>>> ---
>>>>>   tools/hotplug/Linux/launch-xenstore.in |  1 +
>>>>>   tools/xenstored/control.c              | 30 
>>>>> +++++++++++++-------------
>>>>>   tools/xenstored/minios.c               |  3 +++
>>>>>   3 files changed, 19 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/tools/hotplug/Linux/launch-xenstore.in 
>>>>> b/tools/hotplug/Linux/launch-xenstore.in
>>>>> index e854ca1eb8..da4eeca7c5 100644
>>>>> --- a/tools/hotplug/Linux/launch-xenstore.in
>>>>> +++ b/tools/hotplug/Linux/launch-xenstore.in
>>>>> @@ -98,6 +98,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons 
>>>>> && . @CONFIG_DIR@/@CONFIG_LEAF
>>>>>       [ -z "$XENSTORE_DOMAIN_SIZE" ] && XENSTORE_DOMAIN_SIZE=8
>>>>>       XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --memory 
>>>>> $XENSTORE_DOMAIN_SIZE"
>>>>>       [ -z "$XENSTORE_MAX_DOMAIN_SIZE" ] || 
>>>>> XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --maxmem 
>>>>> $XENSTORE_MAX_DOMAIN_SIZE"
>>>>> +    [ -z "$XENSTORED_TRACE" ] || 
>>>>> XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS -T xenstored-trace.log"
>>>>
>>>> I am probably missing something, but any reason to not use 
>>>> @XEN_LOG_DIR@/xenstored-trace.log as we do for xenstored?
>>>
>>> Yes. Stubdom has no access to XEN_LOG_DIR.
>>
>> Ok. This restriction is not that obvious... The documentation in 
>> sysconfig.xencommons.in implies that it will be written in XEN_LOG_DIR:
>>
>> ## Type: string
>> ## Default: ""
>> #
>> # Additional commandline arguments to start xenstored,
>> # like "--trace-file @XEN_LOG_DIR@/xenstored-trace.log"
>> # See "@sbindir@/xenstored --help" for possible options.
>> # Only evaluated if XENSTORETYPE is "daemon".
>> XENSTORED_ARGS=
>>
>> Also, we are saying this is only supported when Xenstored is 
>> daemonized. So I think there are some documentation update necessary 
>> in this patch.
> 
> This is for the daemon. And the documentation example here is using an
> absolute filename, so this is very clear where the trace file will be 
> written.

Ah yes. Sorry I got confused.

> 
> For stubdom a related parameter "XENSTORE_DOMAIN_ARGS" is available. I 
> can add
> a sentence to the explanation of that parameter describing setting of a
> possible trace file specification.

Do you mean in the following comment:

## Type: string
## Default: Not defined, tracing off
#
# Log xenstored messages
# Only evaluated if XENSTORETYPE is "daemon".
#XENSTORED_TRACE=[yes|on|1]

I think here we need to remove the "Only...".

Cheers,

-- 
Julien Grall

