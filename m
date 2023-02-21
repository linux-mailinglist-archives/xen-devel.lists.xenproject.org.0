Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FE69EA66
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 23:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499204.770256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUbOK-0004v4-At; Tue, 21 Feb 2023 22:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499204.770256; Tue, 21 Feb 2023 22:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUbOK-0004sl-7H; Tue, 21 Feb 2023 22:45:44 +0000
Received: by outflank-mailman (input) for mailman id 499204;
 Tue, 21 Feb 2023 22:45:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUbOI-0004sf-N2
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 22:45:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUbOH-00074I-TL; Tue, 21 Feb 2023 22:45:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUbOH-0001ny-Ol; Tue, 21 Feb 2023 22:45:41 +0000
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
	bh=yEp5jb+jc4Za9n0DzJuymd9meDiECOlMQO4b/Lk3Mhs=; b=yqgVrwYnwVjC4F1ahVRzuMBvtS
	bckUxW4q/mGzJC2MtcsES7D+e150ktfCuuqZlGMo9y4jXfmljZBIf+zMMWlG9KmNjXKL+8+xeaA/C
	CeQti9F5kfhr0eTj7Z++axI38itNAiXsPTRWqX3CBOQ7yyaqZK9AHLONtSVAqxw3RKoA=;
Message-ID: <4ab275aa-3ff6-68cf-e307-bbe119d285d3@xen.org>
Date: Tue, 21 Feb 2023 22:45:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 08/13] tools/xenstore: add accounting trace support
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-9-jgross@suse.com>
 <b1cc767e-b3c0-f021-f386-27bcde3cc5c9@xen.org>
 <f035f5c0-3eed-d4f4-ef86-08453c721643@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f035f5c0-3eed-d4f4-ef86-08453c721643@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 21/02/2023 08:40, Juergen Gross wrote:
> On 20.02.23 23:57, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 20/01/2023 10:00, Juergen Gross wrote:
>>> Add a new trace switch "acc" and the related trace calls.
>>>
>>> The "acc" switch is off per default.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> With one reamrk (see below):
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>>> ---
>>>   tools/xenstore/xenstored_core.c   |  2 +-
>>>   tools/xenstore/xenstored_core.h   |  1 +
>>>   tools/xenstore/xenstored_domain.c | 10 ++++++++++
>>>   3 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c 
>>> b/tools/xenstore/xenstored_core.c
>>> index 6ef60179fa..558ef491b1 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -2746,7 +2746,7 @@ static void set_quota(const char *arg, bool soft)
>>>   /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
>>>   const char *const trace_switches[] = {
>>> -    "obj", "io", "wrl",
>>> +    "obj", "io", "wrl", "acc",
>>>       NULL
>>>   };
>>> diff --git a/tools/xenstore/xenstored_core.h 
>>> b/tools/xenstore/xenstored_core.h
>>> index 1f811f38cb..3e0734a6c6 100644
>>> --- a/tools/xenstore/xenstored_core.h
>>> +++ b/tools/xenstore/xenstored_core.h
>>> @@ -302,6 +302,7 @@ extern unsigned int trace_flags;
>>>   #define TRACE_OBJ    0x00000001
>>>   #define TRACE_IO    0x00000002
>>>   #define TRACE_WRL    0x00000004
>>> +#define TRACE_ACC    0x00000008
>>>   extern const char *const trace_switches[];
>>>   int set_trace_switch(const char *arg);
>>> diff --git a/tools/xenstore/xenstored_domain.c 
>>> b/tools/xenstore/xenstored_domain.c
>>> index b1e29edb7e..d461fd8cc8 100644
>>> --- a/tools/xenstore/xenstored_domain.c
>>> +++ b/tools/xenstore/xenstored_domain.c
>>> @@ -538,6 +538,12 @@ static struct domain 
>>> *find_domain_by_domid(unsigned int domid)
>>>       return (d && d->introduced) ? d : NULL;
>>>   }
>>> +#define trace_acc(...)                \
>>
>> The indentation of '\' looks odd.
> 
> Not for me. Maybe you have a different tab setting?

I only looked at the code from my mail client. In my editor, it looks OK.

Cheers,

-- 
Julien Grall

