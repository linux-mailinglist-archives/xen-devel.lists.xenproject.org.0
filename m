Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A67EAC38
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 09:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632204.986339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pDp-0007Bm-2Y; Tue, 14 Nov 2023 08:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632204.986339; Tue, 14 Nov 2023 08:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pDo-000796-Vq; Tue, 14 Nov 2023 08:56:36 +0000
Received: by outflank-mailman (input) for mailman id 632204;
 Tue, 14 Nov 2023 08:56:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2pDn-000790-Pw
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 08:56:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2pDn-0001IY-3l; Tue, 14 Nov 2023 08:56:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2pDm-0005EE-V3; Tue, 14 Nov 2023 08:56:35 +0000
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
	bh=kHSBN33AOhguD4rDtQgv/7xShl46FXkVpa68Mq75XIc=; b=w8h4Wftoq/Pnlouefi5e/QXRVw
	6iP+bWUhuoKCgdAvnE8OSVwYh0h+pXlL6QmusBc8hA95DMn/B1pgozihiqjBaqJz4cVZTqvmWhhim
	g4/mgYC54Pxu+2MrVY06p/o5aaQV+gj3Z2G4WoxWPzIOfWN2tealmzDYabik0S7IzQMg=;
Message-ID: <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>
Date: Tue, 14 Nov 2023 08:56:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
 <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 14/11/2023 06:33, Juergen Gross wrote:
> On 13.11.23 23:04, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 10/11/2023 16:08, Juergen Gross wrote:
>>> When running as stubdom, map the stubdom's Xenstore ring page in order
>>> to support using the 9pfs frontend.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/xenstored/core.c   |  2 ++
>>>   tools/xenstored/domain.c | 27 ++++++++++++++++++++++++++-
>>>   tools/xenstored/domain.h |  1 +
>>>   3 files changed, 29 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>>> index b9ec50b34c..4a9d874f17 100644
>>> --- a/tools/xenstored/core.c
>>> +++ b/tools/xenstored/core.c
>>> @@ -2991,6 +2991,8 @@ int main(int argc, char *argv[])
>>>           lu_read_state();
>>>   #endif
>>> +    stubdom_init();
>>> +
>>>       check_store();
>>>       /* Get ready to listen to the tools. */
>>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>>> index fa17f68618..162b87b460 100644
>>> --- a/tools/xenstored/domain.c
>>> +++ b/tools/xenstored/domain.c
>>> @@ -37,6 +37,10 @@
>>>   #include <xenctrl.h>
>>>   #include <xen/grant_table.h>
>>> +#ifdef __MINIOS__
>>> +#include <mini-os/xenbus.h>
>>> +#endif
>>> +
>>>   static xc_interface **xc_handle;
>>>   xengnttab_handle **xgt_handle;
>>>   static evtchn_port_t virq_port;
>>> @@ -500,6 +504,11 @@ static void *map_interface(domid_t domid)
>>>       if (domid == xenbus_master_domid())
>>>           return xenbus_map();
>>> +#ifdef __MINIOS__
>>> +    if (domid == stub_domid)
>>> +        return xenstore_buf;
>>> +#endif
>>> +
>>>       return xengnttab_map_grant_ref(*xgt_handle, domid,
>>>                          GNTTAB_RESERVED_XENSTORE,
>>>                          PROT_READ|PROT_WRITE);
>>> @@ -509,7 +518,7 @@ static void unmap_interface(domid_t domid, void 
>>> *interface)
>>>   {
>>>       if (domid == xenbus_master_domid())
>>>           unmap_xenbus(interface);
>>> -    else
>>> +    else if (domid != stub_domid)
>>>           xengnttab_unmap(*xgt_handle, interface, 1);
>>>   }
>>> @@ -1214,6 +1223,22 @@ void dom0_init(void)
>>>       xenevtchn_notify(xce_handle, dom0->port);
>>>   }
>>> +void stubdom_init(void)
>>> +{
>>> +#ifdef __MINIOS__
>>> +    struct domain *stubdom;
>>> +
>>> +    if (stub_domid < 0)
>>> +        return;
>>> +
>>> +    stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
>>> +    if (!stubdom)
>>> +        barf_perror("Failed to initialize stubdom");
>>> +
>>> +    xenevtchn_notify(xce_handle, stubdom->port);
>>
>> If I compare to introduce_domain(), it is not entirely clear to me why 
>> the notification is done unconditionally here. Can you clarify?
> 
> There is no reason to do it conditionally, as we can be sure the event 
> channel
> is existing and the ring page is accessible.

Hmmm... But there is a second part in the condition:

domain->interface->connection == XENSTORE_RECONNECT

Why isn't it necessary here? What I am looking for particularly is some 
in-code comment (or at least in the commit message) because this is not 
100% clear why we are diverging.

Cheers,

-- 
Julien Grall

