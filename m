Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5876CD8FC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 13:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516230.800031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUSC-0004XI-1Y; Wed, 29 Mar 2023 11:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516230.800031; Wed, 29 Mar 2023 11:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUSB-0004U7-Un; Wed, 29 Mar 2023 11:58:59 +0000
Received: by outflank-mailman (input) for mailman id 516230;
 Wed, 29 Mar 2023 11:58:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phUSA-0004U1-Ha
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 11:58:58 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 159860da-ce29-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 13:58:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.34; Wed, 29 Mar
 2023 11:58:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 11:58:55 +0000
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
X-Inumbo-ID: 159860da-ce29-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLQuX8N5JHB1ulMNboC41kEW2Hukth0WRTUQmK6FANCcVxplTlU40ZFF4wOlkOa9tNYH7ASaRgy6T2Ps1702Lbg3NZxXbICrl3nSvivP4S0tgAvRuc1E6zheDl0PkX9q1QKLHWmzYbbx++wpIaiFGk0I0B92hB2zZrSXHQVnwP1Hx//diZeMw6EOucPxqGnS0Bq4j2HaXEYmXzWlkYmwGL0pRdL8oGKxHLX+v6rjiY3yMv0SkDeu68hnIOOFgUL/lh1vdThJONBD61Z/gWV11dgfdqftePjLwY/5BxEt6lz7KV8AML3a+ncAFSlRKMFxyAHlycUWf11jLx9geGlFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZNnF6LoiXr9w2KAYcVNxpXiwUaCUzFehIFGRlC+3Mk=;
 b=XOpU2UWxzkZO8y6d9aJkkQ5P2qjhDJixCqobM199p+nW9LdXbZo15T85nspJTMjn9znUQJlX6v+nftctBzRC6WXUXiGKjl4LEDH+CHLjQ8UIgoo+HDAC8EM44ihmPcKqedBHqW0gZgeb4FhZQJd6Dfm+Xkvj4T9NoK3aZHYVwavxFaqZ8gdFTA8EUMjeZ9jW+z0QXpVbOYnc9+iZucrUlH/jWcQ1XkLPZHJ4ydizkOhK+weQd4aDVpCU4azwt6+BSEmC3vn6MI36IfJeoNeqsU2Xkp0XjjU8UakGxgl2+kPdTH/7lVbweh0eGzq46FXiuT1if6I1GLfIafADQBlBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZNnF6LoiXr9w2KAYcVNxpXiwUaCUzFehIFGRlC+3Mk=;
 b=DFLohIKV/75ZInuQ7hr2RTCL1QX5cVAMD25PEUIum4JI9IV7M6Xlh81/G9x/G4Wh7XTdrnQw3grjkEv2mkEF9SXiAi7TTGmeheX4ex8Q4Dvbo+rM4JfgDuuJgsq2Gsm/kh6qmZv/VT01Dnto1pfgikEptLcV32MBjTiR1+uME3kaLEzdChP8LDdYf/lkyisp/FISQN0o7syYSRcpJ3lmC42lcgjcdofzcXWhZ3FPORlw/qLFbS4Zj9vvgeyEHSMUfkMMYwyu5gaUSFxkXZ/2GczRLhjGJN8ahcQ14NIDqT7S7UUK8AZcIBjIJhGgJSJ2v5r7TniJl31U9MQa+WzFlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <650e89ae-1a3d-d7c9-62e5-cdcbb9aa2d4d@suse.com>
Date: Wed, 29 Mar 2023 13:58:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <c175d1b5-972c-e311-d634-e7a68e919ece@suse.com>
 <ZCQXZu8AqZtLGCUB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCQXZu8AqZtLGCUB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 0799e025-af03-4a65-dea2-08db304cf898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IRupQ9kVBB+X9Zn/xK20Ty38gZyYzwPxSSWPPIF6kTJkOhdai8C11yCGtEZm/GjyRX27fOXf75DrclCdOkJqNIAEATg25GoYdbJC6iT1MVEUpHgYWs57AmlggQTsPgxI7I3MWK9SASEmO0q7lCbyo4pRlWV0PHs6+wAL+0lYuZSHd+sJR/+BwPZUuM1o6hpZaW6u66aMciBWdIzHX6n9HgRSiVD+0mUjMR/F66yFzBW4c3L+137ARrUlROtH4K5eYqHKrbMNzvm/nrwgIyHJjTp0CnMM1Y4yv5RY39QD3z1lMtFm4ie+wmTgd1/eOIkkTgHEKTQpxm7ggVNfAwrcd4i57NXdWLoktiZZNFTBJP/ZhIb8+NWoXIAibfyCiam/lzk8Lfg8ZbNqKL92CNTD+sK79lwWmIIwtnYGRrVfXd9r4p8R4zUJHqNTfzLi/Oznbv50AKo5h5JBrK3sTXhR31CjhHKnklaQwnQfq5orekWluyMdxMGTvH59BpBdGgJVdJkMwWl9br9LjBnSgSGV1Fut9A+l121RarKIntFmxe2SFN7gKJljXGsrbQbZ3TSE0EtUe7jUUcFWH2y+JNI9yPDPLJEoILDwhsk2yDO1bWB0Vj/2GQ7hL5Cs1srjYGGzjoNHXE19TtnkDcNOXvhFmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(186003)(31686004)(6486002)(316002)(54906003)(6506007)(4326008)(8676002)(66946007)(53546011)(6512007)(26005)(478600001)(2616005)(6916009)(66556008)(83380400001)(66476007)(7416002)(41300700001)(5660300002)(38100700002)(2906002)(8936002)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01XK011VVZGRDNOaEp6TVQ5dVpLcEQrQUlaV0VuKzI5TXdLV2N2QjYvN0pE?=
 =?utf-8?B?b3lBbm1TZHV5RGpEU1VCVHNKMFhmeFpYbGdrYVB1bkl1VjdDM1lObXcrdWlo?=
 =?utf-8?B?RFNLTldzYnVMYy9UWU5xSzJDejdlY0Z4ZWZKdmNSMjVEcGNmdXFCdkp2Yml4?=
 =?utf-8?B?YUlON2FOT1hkMmR5TTNKWkM2Ukt4R29DZmEyQWdLQ0srbmJPV1NvN3dwd1A3?=
 =?utf-8?B?ZkdzNFNoSjlTbXZIVG9XVzhuSWI4Sk8yZkJ0RzNqVEZtZXJMRGtQaENnU0p0?=
 =?utf-8?B?NHdOclg4bSt1eDNGTU9USjNNS0pwMjlvMnM1UFBIRnRVRVJvMFdCWHFSM2ha?=
 =?utf-8?B?RGMzUHNRNlh4U0FHQXRwTTJVbmdRVnJ1K2RoekNWMzBta0ZUVGRBUTNMbTNl?=
 =?utf-8?B?dHIwQUxldW5KT2g5TElJOCtGZ1REQWtlZEM0dDF0c1h3YkcxS2tDYjV2Vk5n?=
 =?utf-8?B?MkZQbXh5bFcybkl5eml6MG1McCttZHFJRUlSSlBZa2wva0RPVHIySk1vS3J0?=
 =?utf-8?B?RVZWY05QZldTU0ZnUHcrSUJLa3dqVmxIdldqenFlakxXMGczYjRjdEhYeVQy?=
 =?utf-8?B?L1BBWGViTmk3T2d6NHlabHR1K0hVRG8xWldQRUpXTmY4K2lHeDl3RXJRWmF6?=
 =?utf-8?B?N3o4aUJWWFp3MTFkdElkWnNrbGVZUU9vWVF2ZU9OOHk1UzQ4MEtYL0hMdlhx?=
 =?utf-8?B?U3FjY0VlRmlxVHFSaFNsUXZGeVZRbFFBVFVEVk9GdGVWbkZXWlNNRWlwamF0?=
 =?utf-8?B?bHFSMnhJRUFCVXNSS0dtTGprcGs2UE82Y1JQRDBtVlRLaFZuVnJzZ1N3RXht?=
 =?utf-8?B?MmQ4Q3hva21WcXRNcmpoa3NDUDhYUWRpR2RXSFZ5M1BWbEF4TzgxdUdZamVl?=
 =?utf-8?B?ZW5WZjNid0tvQ0FUQmNOaVBQYVdMVDZWNFNOb20vM0NldkpBeHBldGw0cjJa?=
 =?utf-8?B?cXk1TDRkTTlOQ05sbjdoZEV1S2NINnAyRGxBSHZ2bi9TK3RPOXZybUI0T3Bo?=
 =?utf-8?B?UzFkMHNwS0wzcnZFMndJME53d25ZM0d4RmJ4M1ZRVExjVlFkcEpZVnowSXhy?=
 =?utf-8?B?VnN2VHhUVnltSGtuaXlKRDF3MzJzVTJnU3ArS0s1UGNiQ3NpSkZaNTRwcEFx?=
 =?utf-8?B?dlBCVE16bi8vOEVvTU01Qy9hN1J6d3VLMWd2REMxR0FEM0lQVm12MEVtcngy?=
 =?utf-8?B?Y3FjSHVZY1dFOS94a3RRYU4wR0JZS2JreW9SUXNqdzhKN01Nb3J0SjBxNFVV?=
 =?utf-8?B?Ti9NNzluaG91NzFiT0RkWDdKYlVQeC9RT1ZQZHZBeDZhTnBxOVBYSUNoT0NR?=
 =?utf-8?B?Zk4wUWFJMFNTQUovTlV2MHdjSVE1OG92aDNiL0t4WDVjdzBSUTBaWXJCQjJo?=
 =?utf-8?B?ZWNQOGk0MlRUajRIbTBWcmJ4L1VULzBwOTliUFZnTHcybi9CRG0xNVh2eUU3?=
 =?utf-8?B?Y3g1ZU1yNlZFUEdjWWZxTTlmMUZIZFM2ZTVTcm1mNHljaXpJZCttdHNNQXJ5?=
 =?utf-8?B?aTVXZytYUU9hMWxEYnpGdmJ0amkzMzZyNVQ2RTJFTUJFaDFCcEJMbEZmdTlK?=
 =?utf-8?B?NEhLSnZkU1g3enZ0aWRvRmxzQU0xUWRhNlBpRWVtVzZQaDhmcm9hMEljbEZN?=
 =?utf-8?B?Tld0TzZudmUrMncrL3A2TlBYSXFGTXZZV2p3THFDeFF1ZjBLMnFSZ0dxZmNO?=
 =?utf-8?B?T1BqTUNKNzRKVE80VHdnLzJKUmRaWWNEMmZuMnN1UjlJKzdONUNnc0tDaHor?=
 =?utf-8?B?TFcvZ2V4T3JDdkh6Q21BOS84UXZrMlpHeHM2QnFBR2g2RnJoWTFuTU1mUjUz?=
 =?utf-8?B?OWRWKytHbkxkb3NMM3JhK0llQkNRV3FmdWxZQ3I5YlBxRVh6R3ZFR2cvRXU5?=
 =?utf-8?B?eTA4ZUpSNVFVRDQ5NERqYXc0dkx4Rmc5N013dWd6V3VNVWtrVU1xM2lDdjBP?=
 =?utf-8?B?eFR3cThiVHkxc2hXeWJIcUx0UmZXZG1pZUYwdHZ0L2xyZTJ0aVJZTUFwOWJD?=
 =?utf-8?B?RWlycWJQNlprU204MUFlallaZ1llRDJhU0oyTXphOCs4cFpFR2tjaDVmUjhk?=
 =?utf-8?B?SFIwQWNlbkd6NlZMRWRSOFVMallJNmNZdCtURWVpVEwzR0hMU2tJMlJHM1hv?=
 =?utf-8?Q?A/rWwvDwxgR82khpb7zG1TxjW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0799e025-af03-4a65-dea2-08db304cf898
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 11:58:55.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUQVMiWO4m4Zmf8J4E3/Jud4n5thU/SrO7j2yb65K3iNpuxiWsxQF4R0hq511H00X4PRGk/rlQvMeczn4cxYfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

On 29.03.2023 12:48, Roger Pau Monné wrote:
> On Wed, Mar 29, 2023 at 11:55:26AM +0200, Jan Beulich wrote:
>> On 16.03.2023 17:16, Roger Pau Monné wrote:
>>> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>>>> Prior to this change, lifetime of pci_dev objects was protected by global
>>>> pcidevs_lock(). Long-term plan is to remove this log, so we need some
>>>                                                    ^ lock
>>>
>>> I wouldn't say remove, as one way or another we need a lock to protect
>>> concurrent accesses.
>>>
>>>> other mechanism to ensure that those objects will not disappear under
>>>> feet of code that access them. Reference counting is a good choice as
>>>> it provides easy to comprehend way to control object lifetime.
>>>>
>>>> This patch adds two new helper functions: pcidev_get() and
>>>> pcidev_put(). pcidev_get() will increase reference counter, while
>>>> pcidev_put() will decrease it, destroying object when counter reaches
>>>> zero.
>>>>
>>>> pcidev_get() should be used only when you already have a valid pointer
>>>> to the object or you are holding lock that protects one of the
>>>> lists (domain, pseg or ats) that store pci_dev structs.
>>>>
>>>> pcidev_get() is rarely used directly, because there already are
>>>> functions that will provide valid pointer to pci_dev struct:
>>>> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
>>>> find needed object and increase its reference counter before returning
>>>> to the caller.
>>>>
>>>> Naturally, pci_put() should be called after finishing working with a
>>>> received object. This is the reason why this patch have so many
>>>> pcidev_put()s and so little pcidev_get()s: existing calls to
>>>> pci_get_*() functions now will increase reference counter
>>>> automatically, we just need to decrease it back when we finished.
>>>
>>> After looking a bit into this, I would like to ask whether it's been
>>> considered the need to increase the refcount for each use of a pdev.
>>>
>>> For example I would consider the initial alloc_pdev() to take a
>>> refcount, and then pci_remove_device() _must_ be the function that
>>> removes the last refcount, so that it can return -EBUSY otherwise (see
>>> my comment below).
>>
>> I thought I had replied to this, but couldn't find any record thereof;
>> apologies for a possible duplicate.
>>
>> In a get-/put-ref model, much like we have it for domheap pages, the
>> last put should trigger whatever is needed for "freeing" (here:
>> removing) the item. Therefore I think in this new model all
>> PHYSDEVOP_{pci_device_remove,manage_pci_remove} should cause is the
>> dropping of the ref that alloc_pdev() has put in place (plus some
>> marking of the device, so that another PHYSDEVOP_{pci_device_remove,
>> manage_pci_remove} can be properly ignored rather than dropping one
>> ref too many; this marking may then also prevent the obtaining of new
>> references, if such can be arranged for without breaking [cleanup]
>> functionality elsewhere). Whenever the last reference is put, that
>> would trigger the operations that pci_remove_device() presently
>> carries out.
> 
> Right, this all seems sensible.
> 
>>
>> Of course this would mean that if PHYSDEVOP_{pci_device_remove,
>> manage_pci_remove} didn't drop the last reference, it would need to
>> signal this to its caller, for it to be aware that the device is not
>> yet ready for (e.g.) hot-unplug. There'll then also need to be a way
>> for the caller to figure out when that situation has changed (which
>> might be via repeated invocations of the same hypercall sub-op, or
>> some new sub-op).
> 
> Returning -EBUSY and expecting the caller to repeat the call would
> likely be the easier one to implement and likely fine for our
> purposes.  There's a risk that the toolstack/kernel enters an infinite
> loop if there's a dangling extra ref somewhere, but that would be a
> bug anyway.
> 
> So device creation would take a reference, and device assignation would
> take another one.  Devices assigned are safe against removal, so there
> should be no need to take an extra reference in that case.
> 
> There are however a number of cases that use pci_get_pdev(NULL, ...)
> for example, at which point we would need to take an extra reference
> on those cases if the device is not assigned to a domain?

I think in this case a ref should be acquired, and independent of
whether the device is assigned anywhere (or else I expect this would
end up cumbersome for callers, when they need to figure whether to
drop a ref).

> Or would we just keep those under pcidevs_locked regions as-is?

This may be a short-term option, but longer term I think we want to
fully move over (and get rid of the global lock altogether, if at all
possible).

Jan

> (as PHYSDEVOP_{pci_device_remove, manage_pci_remove} will still take
> the pci_lock).
> 
> Thanks, Roger.


