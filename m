Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D969D27D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 19:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498326.769170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUATI-0004sY-WE; Mon, 20 Feb 2023 18:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498326.769170; Mon, 20 Feb 2023 18:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUATI-0004q4-SJ; Mon, 20 Feb 2023 18:01:04 +0000
Received: by outflank-mailman (input) for mailman id 498326;
 Mon, 20 Feb 2023 18:01:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUATH-0004py-Av
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 18:01:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUATG-0007mS-8b; Mon, 20 Feb 2023 18:01:02 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.98.51])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUATG-0000yE-2y; Mon, 20 Feb 2023 18:01:02 +0000
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
	bh=MPti7fO+hkxEWKAMwLaEgaLbjtYIVnIaPQkxsP2ylWA=; b=0WqZ+capgSdVnhioAO0nwdVhrA
	hazMXCCRSEh4JyJ/UN2ywA6cvbFJgzYAMZZ8EEwVrNTnQmJCt1pJA9onJOx6VQx3Zw+rH9x+2EIP+
	EbAwr/DaWpGTnL7rMExYJIZh/OB5y0FvyfWrmafI0NSMXJoiuvTgSK46F/Xh85MYFt1k=;
Message-ID: <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
Date: Mon, 20 Feb 2023 18:01:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/02/2023 14:21, Juergen Gross wrote:
> On 20.02.23 15:15, Julien Grall wrote:
>> On 20/02/2023 13:49, Juergen Gross wrote:
>>> On 20.02.23 13:07, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 20/02/2023 11:04, Juergen Gross wrote:
>>>>> On 20.02.23 10:46, Julien Grall wrote:
>>>>>> Hi Juergen,
>>>>>>
>>>>>> On 20/01/2023 10:00, Juergen Gross wrote:
>>>>>>> The accounting for the number of nodes of a domain in an active
>>>>>>> transaction is not working correctly, as it allows to create 
>>>>>>> arbitrary
>>>>>>> number of nodes. The transaction will finally fail due to exceeding
>>>>>>> the number of nodes quota, but before closing the transaction an
>>>>>>> unprivileged guest could cause Xenstore to use a lot of memory.
>>>>>>
>>>>>> I know I said I would delay my decision on this patch. However, I 
>>>>>> was still expecting the commit message to be updated based on our 
>>>>>> previous discussion.
>>>>>
>>>>> As said before, I was waiting on the settlement of our discussion 
>>>>> before
>>>>> doing the update.
>>>>
>>>> This is not a very good practice to resend a patch without recording 
>>>> the disagreement because new reviewers may not be aware of the 
>>>> disagreement and this could end up to be committed by mistake...
>>>
>>> You said you wanted to look into this patch in detail after the previous
>>> series, so I move it into this series. The wording update would strongly
>>> depend on the outcome of the discussion IMO, so I didn't do it yet.
>> This could have been mentioned after ---. This could allow people to 
>> understand the concern and then participate.
> 
> Will do so in future.
> 
>>
>>>
>>>>>> Also thinking more about it, "The transaction will finally fail 
>>>>>> due to exceeding the number of nodes quota" may not be true for a 
>>>>>> couple of reasons:
>>>>>>    1) The transaction may removed a node afterwards.
>>>>>
>>>>> Yes, and? Just because it is a transaction, this is still a 
>>>>> violation of
>>>>> the quota. Even outside a transaction you could use the same 
>>>>> reasoning,
>>>>> but you don't (which is correct, of course).
>>>>
>>>> I can understand your point. However, to me, the goal of the 
>>>> transaction is to commit everything in one go at the end. So the 
>>>> violations in the middle should not matter.
>>>
>>> Of course they should.
>>>
>>> We wouldn't allow to write over-sized nodes, even if they could be 
>>> rewritten in
>>> the same transaction with a smaller size.
>>
>> I view the two different.
>>
>>> We wouldn't allow to create nodes which would violate overall memory
>>> consumption.
>>>
>>> We wouldn't allow nodes with more permission entries than allowed, 
>>> even if they
>>> could be reduced in the same transaction again.
>>>
>>> I don't see why the number of nodes shouldn't be taken into account.
>>>
>>>> Furthermore, I would expect a transaction to work on a snapshot of 
>>>> the system. So it feels really strange to me that we are constantly 
>>>> checking the quota with the updated values rather than the initial one.
>>>
>>> You are aware that the code without this patch is just neglecting the 
>>> nodes
>>> created in the transaction? It just is using the current number of nodes
>>> outside any transaction for quota check.
>>
>> Are you referring to the quota check within the transaction?
> 
> I'm referring to the quota check in create_node(). >
>>
>>> So I could easily create a scenario
>>> where my new code will succeed, but the current one is failing:
>>> Assume node quota is 1000, and at start of the transaction the guest 
>>> is owning
>>> 999 nodes. In the transaction the guest is deleting 10 nodes, then 
>>> dom0 is
>>> creating 5 additional nodes owned by the guest. The central node 
>>> counter is now
>>> 1004 (over quota), while the in-transaction count is 994.
>>> In the transaction the
>>> guest can now happily create a new node (#995) with my patch, but 
>>> will fail to
>>> do so without (it sees the 1004 due to the transaction count being 
>>> ignored).
>>
>> This doesn't sound correct. To do you have any test I could use to 
>> check the behavior?
> 
> Try it:
> 
> - create nodes in a guest until you hit the ENOSPC return code due to 
> too many
>    nodes
> - start a transaction deleting some nodes and then trying to create another
>    one, which fail fail with ENOSPC.

So I have recreated an XTF test which I think match what you wrote [1].

It is indeed failing without your patch. But then there are still some 
weird behavior here.

I would expect the creation of the node would also fail if instead of 
removing the node if removed outside of the transaction.

This is not the case because we are looking at the current quota. So 
shouldn't we snapshot the global count?

Cheers,

[1]
#include <xtf.h>

const char test_title[] = "Test xenstore-transaction-limit-1";

#define BASELINE_DIR "data"
#define BASELINE_MAX_DIR BASELINE_DIR"/max"

#define MAX_NODES 2000

static bool max_out_nodes(void)
{
     unsigned int parent_id = 0, child_id = 0, nr_nodes = 0;
     xs_transaction_t tid = XBT_NULL;

     printk("Maxing out nodes\n");

     do
     {
         int rc;
         char path[256];

         rc = snprintf(path, ARRAY_SIZE(path), "%s/%u/%u",
                       BASELINE_MAX_DIR, parent_id, child_id);

         if ( rc >= (int)ARRAY_SIZE(path) )
         {
             xtf_error("Unable to create the path\n");
             return false;
         }

         rc = xenstore_mkdir(tid, path);

         /* Xenstored will return ENOSPC if we exceed a quota */
         if ( rc == ENOSPC )
         {
             /*
              * If we can't write the first child, then this likely means
              * we exceed the maximum of nodes quota. Consider it a
              * success.
              *
              * Otherwise, we may hit the maximum size of the parent.
              * Switch to a different parent.
              */
             if ( child_id == 0 )
             {
                 printk("Stopped after %u iterations\n", nr_nodes);
                 return true;
             }
             else
             {
                 printk("Parent ID %u: created %u children\n",
                        parent_id, child_id);
                 parent_id++;
                 child_id = 0;
                 continue;
             }
         }
         else if ( rc )
         {
             xtf_error("Unexpected error %d\n", rc);
             return false;
         }
         else
         {
             nr_nodes++;
             child_id++;
         }
     } while ( nr_nodes < MAX_NODES );

     xtf_error("Created %u nodes and the quota is still not reached?\n",
               nr_nodes);

     return false;
}

void test_main(void)
{
     xs_transaction_t tid;
     int rc;

     if ( !max_out_nodes() )
         return;

     tid = xenstore_transaction_start();
     if ( tid == XBT_NULL )
     {
         xtf_error("Cannot start transaction\n");
         return;
     }

     /* Remove one of the node within the transaction */
     rc = xenstore_rm(tid, "data/max/0/0");
     if ( rc )
     {
         xtf_error("Cannot remove the node data/max/0/0 (rc = %d)\n", rc);
         return;
     }

     /* Creating a new node should work because we removed one */
     rc = xenstore_write(tid, "data/foo", "bar");
     if ( rc )
     {
         xtf_error("Cannot create node data/foo (rc = %d)\n", rc);
         return;
     }

     xtf_success(NULL);
}



> 
> 
> Juergen

-- 
Julien Grall

