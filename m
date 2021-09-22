Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A054414AFF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192768.343386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2aF-0005BY-7n; Wed, 22 Sep 2021 13:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192768.343386; Wed, 22 Sep 2021 13:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2aF-00059N-4n; Wed, 22 Sep 2021 13:46:47 +0000
Received: by outflank-mailman (input) for mailman id 192768;
 Wed, 22 Sep 2021 13:46:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mT2aD-00059H-1v
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:46:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mT2aB-0008Ru-Ga; Wed, 22 Sep 2021 13:46:43 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mT2aA-0001aQ-4w; Wed, 22 Sep 2021 13:46:43 +0000
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
	bh=jp5Y4ELZ4RSHL0wMVHLANLBmsmpOcx5IG5cte0B3Fl4=; b=k+3+rMNEmECtDvk1y6WlgbkaTG
	1HCWhjH2DYEtx71u39CyRw1R0NQWEGcsa8rlQ8L+5WyPgY3hsuG9TI9Q57/gdtQdznfSINJ0mkH+s
	Z0SSbQd0/oT8dnRFg66ILDJZBd7gT4sbvwqeJWdlncWmVTP0xq5jHnlReq/bom+ccFbM=;
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
To: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, raphning@amazon.co.uk,
 "Doebel, Bjoern" <doebel@amazon.de>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
 <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
 <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
 <09c4bad1-99e3-5d24-873e-4aca9acd6fed@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <56bb55e3-ca7a-12e6-5848-84756b431846@xen.org>
Date: Wed, 22 Sep 2021 18:46:25 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <09c4bad1-99e3-5d24-873e-4aca9acd6fed@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

(+ Some AWS folks)

Hi Juergen,

On 22/09/2021 17:34, Juergen Gross wrote:
> On 22.09.21 12:23, Julien Grall wrote:
>> Hi Roger,
>>
>> On 22/09/2021 14:58, Roger Pau Monné wrote:
>>> On Wed, Sep 22, 2021 at 02:07:44PM +0500, Julien Grall wrote:
>>>> Hi Roger,
>>>>
>>>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>>>> Failure to map the shared ring and thus establish a xenstore
>>>>> connection with a domain shouldn't prevent the "@introduceDomain"
>>>>> watch from firing, likewise with "@releaseDomain".
>>>>>
>>>>> In order to handle such events properly xenstored should keep track of
>>>>> the domains even if the shared communication ring cannot be mapped.
>>>>> This was partially the case due to the restore mode, which needs to
>>>>> handle domains that have been destroyed between the save and restore
>>>>> period. This patch extends on the previous limited support of
>>>>> temporary adding a domain without a valid interface ring, and modifies
>>>>> check_domains to keep domains without an interface on the list.
>>>>>
>>>>> Handling domains without a valid shared ring is required in order to
>>>>> support domain without a grant table, since the lack of grant table
>>>>> will prevent the mapping of the xenstore ring grant reference.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>> oxenstored will need a similar treatment once grant mapping is used
>>>>> there. For the time being it still works correctly because it uses
>>>>> foreign memory to map the shared ring, and that will work in the
>>>>> absence of grant tables on the domain.
>>>>> ---
>>>>> Changes since v1:
>>>>>    - New in this version.
>>>>> ---
>>>>>    tools/xenstore/xenstored_domain.c | 30 
>>>>> ++++++++++++++++++------------
>>>>>    1 file changed, 18 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/tools/xenstore/xenstored_domain.c 
>>>>> b/tools/xenstore/xenstored_domain.c
>>>>> index 9fb78d5772..150c6f082e 100644
>>>>> --- a/tools/xenstore/xenstored_domain.c
>>>>> +++ b/tools/xenstore/xenstored_domain.c
>>>>> @@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
>>>>>        struct xenstore_domain_interface *intf = 
>>>>> conn->domain->interface;
>>>>>        XENSTORE_RING_IDX cons, prod;
>>>>> +    if (!intf) {
>>>>> +        errno = ENODEV;
>>>>> +        return -1;
>>>>> +    }
>>>>> +
>>>>>        /* Must read indexes once, and before anything else, and 
>>>>> verified. */
>>>>>        cons = intf->rsp_cons;
>>>>>        prod = intf->rsp_prod;
>>>>> @@ -149,6 +154,11 @@ static int readchn(struct connection *conn, 
>>>>> void *data, unsigned int len)
>>>>>        struct xenstore_domain_interface *intf = 
>>>>> conn->domain->interface;
>>>>>        XENSTORE_RING_IDX cons, prod;
>>>>> +    if (!intf) {
>>>>> +        errno = ENODEV;
>>>>> +        return -1;
>>>>> +    }
>>>>> +
>>>>>        /* Must read indexes once, and before anything else, and 
>>>>> verified. */
>>>>>        cons = intf->req_cons;
>>>>>        prod = intf->req_prod;
>>>>> @@ -176,6 +186,9 @@ static bool domain_can_write(struct connection 
>>>>> *conn)
>>>>>    {
>>>>>        struct xenstore_domain_interface *intf = 
>>>>> conn->domain->interface;
>>>>> +    if (!intf)
>>>>> +        return false;
>>>>> +
>>>>
>>>> Rather than adding an extra check, how about taking advantage of 
>>>> is_ignore?
>>>
>>> Right, I just need to change the order in conn_can_read and
>>> conn_can_write so that the is_ignored check is performed before the
>>> can_{read,write} handler is called.
>>>
>>>>>        return ((intf->rsp_prod - intf->rsp_cons) != 
>>>>> XENSTORE_RING_SIZE);
>>>>>    }
>>>>> @@ -183,7 +196,8 @@ static bool domain_can_read(struct connection 
>>>>> *conn)
>>>>>    {
>>>>>        struct xenstore_domain_interface *intf = 
>>>>> conn->domain->interface;
>>>>> -    if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
>>>>> +    if ((domain_is_unprivileged(conn) && conn->domain->wrl_credit 
>>>>> < 0) ||
>>>>> +        !intf)
>>>>>            return false;
>>>>>        return (intf->req_cons != intf->req_prod);
>>>>> @@ -268,14 +282,7 @@ void check_domains(void)
>>>>>                    domain->shutdown = true;
>>>>>                    notify = 1;
>>>>>                }
>>>>> -            /*
>>>>> -             * On Restore, we may have been unable to remap the
>>>>> -             * interface and the port. As we don't know whether
>>>>> -             * this was because of a dying domain, we need to
>>>>> -             * check if the interface and port are still valid.
>>>>> -             */
>>>>> -            if (!dominfo.dying && domain->port &&
>>>>> -                domain->interface)
>>>>> +            if (!dominfo.dying)
>>>>>                    continue;
>>>>
>>>> This is mostly a revert on "tools/xenstore: handle dying domains in 
>>>> live
>>>> update". However, IIRC, this check was necessary to release the 
>>>> connection
>>>> if the domain has died in the middle of Live-Update.
>>>
>>> But if the domain has died in the middle of live update
>>> get_domain_info will return false, and thus the code won't get here.
>>
>> Hmmm... I think I am mixing up a few things... I went through the 
>> original discussion (it was on the security ML) to find out why I 
>> wrote the patch like that. When going through the archives, I noticed 
>> that I provided a different version of this patch (see [1]) because 
>> there was some issue with the check here (I wrote that it would lead 
>> to zombie domain, but don't have the rationale :().
>>
>> Juergen, I don't seem to find the reason why the patch was not 
>> replaced as we discussed on the security ML. Do you remember why?
> 
> Sorry, no, I don't.
> 
> You did send the new version for V6 of the LU series, but it seems at
> least in V9 you commented on the patch requesting that a comment just
> in the section being different between the two variants to be removed.
> 
> So either we both overlooked the new variant not having gone in, or we
> agreed to use the old version (e.g. in a security meeting). In my IRC
> logs I couldn't find anything either (the only mentioning of that patch
> was before V6 of the series was sent, and that was before you sending
> the new one as a reply to V6).
> 
>> Assuming this was a mistake, could someone take care of sending an 
>> update? If not, I could do it when I am back in October.
>>
>> For the archives, the issues would appear when shutting down a domain 
>> during Live-Update.
> 
> Hmm, IIRC you did quite some extensive testing of LU and didn't find
> any problem in the final version.

I did extensive testing with early series but I can't remember whether I 
tested the shutdown reproducer with the latest series.

> 
> Are you sure there really is a problem?

I thought a bit more and looked at the code (I don't have access to a 
test machine at the moment). I think there is indeed a problem.

Some watchers of @releaseDomain (such as xenconsoled) will only remove a 
domain from their internal state when the domain is actually dead.

This is based on dominfo.dying which is only set when all the resources 
are relinquished and waiting for the other domains to release any 
resources for that domain.

The problem is Xenstore may fail to map the interface or the event 
channel long before the domain is actually dead. With the current check, 
we would free the allocated structure and therefore send @releaseDomain 
too early. So daemon like xenconsoled, would never cleanup for the 
domain and leave a zombie domain. Well... until the next @releaseDomain 
(or @introduceDomain for Xenconsoled) AFAICT.

The revised patch is meant to solve it by just ignoring the connection. 
With that approach, we would correctly notify watches when the domain is 
dead.

Cheers,

-- 
Julien Grall

