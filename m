Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E7760AFC1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 17:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429239.680137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzoX-0005RT-Di; Mon, 24 Oct 2022 15:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429239.680137; Mon, 24 Oct 2022 15:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzoX-0005PD-Aw; Mon, 24 Oct 2022 15:56:33 +0000
Received: by outflank-mailman (input) for mailman id 429239;
 Mon, 24 Oct 2022 15:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omzoU-0005P7-Tw
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 15:56:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0c5ddf-53b4-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 17:56:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9100.eurprd04.prod.outlook.com (2603:10a6:10:2f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 24 Oct
 2022 15:56:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 15:56:26 +0000
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
X-Inumbo-ID: 6c0c5ddf-53b4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVHdPBrUIYPqGe1pZ20jPUymUfe+9VNlCNEeavyb2JcLCQGzwLjET33fPO+Uc8HqslTThvmfN/FDgUAOJsYZ+IYrSY5mPET/bqTtFBPqMXFlUi1xGM3gHOQ4yXseXAY81UAkkz5tTk2xrnNijJU4UlHUgXyZpiIytniDWzjhpMDsFsn6a05mnnsVbvTJ6fNXbBEkoMwbKKJ5hQULZV1OVEgSHv6Ka9CT1jvqPKEqS2Lxe/djcKJu+l1KwkOBmH1trhV5AEImdr8728pKateAV9AhPYYuqjkX2oBbZ/Bih2yW12BGPfk5b6UE8g/AK+oCnTqFyrDCQYsqveKstAJ3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxL015ye25JaB+u+T4WKhG34ZmwUdObg3fYJa5grYxI=;
 b=VxW2/hYPHVtzyKkpY7fZ0+wCNEtcq5EXQPDzKENdRKaFKdek+WNwxNuPizMMCK4Ye6iKLPbUKHMnWqR2ghyRL/4CSCl6W2Og+QQZZBu7PJaFl/xwytCwKICcPUGChMau/TCwToohWRlOn4c79fFRYCF80bt867kUvCLSpCYPlBy63cnMsHvYFk/m+w86MVgqJHn9UrkJKXyuAqnmRQj53n7H4nVw7oMn/A7DrwV9fRZXKrpq5QCZpJDz+25G4Hcl62UufcUMWfD8SUA7M+vWYWhw+FCBsbX8Ic3pZH7o9sfqyrf1hbfNajuZgSF491EOuY6rH/n6uP/BhpJEPgBAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxL015ye25JaB+u+T4WKhG34ZmwUdObg3fYJa5grYxI=;
 b=mbjUqzHJ+0pJRaKWLxnPuDWMcYIrNGSGzlmUIr+yDeEzRm0gb2ri3vpiYwp/5B8Kb2agPPRmc/9s/QVY+4JSNhKjjaFHWMIsO9SoRYFKVOJoB9IziI+SibuFVOu9s/DY0Jayta9+37p5eKrdg2Xx0x15rerxWryHgeRgZuzxJ6HBCooEYOxPjQ7/JDjU6E4R2VGe//lBSGUJM6/D+OQpQutJosgQt1uCpJ3P9tL3wGmssd6yjd7yDpbMxaRpyYxyrQkg34ufHlav2CumPdSS00EA5IaxQCFovhpNtAHkENJVy/AsjJRd3yk9DGNQL6lo0b/LaeH4ggznxr1cqRa1Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82a69c5c-3174-cee0-932b-3141df6454a2@suse.com>
Date: Mon, 24 Oct 2022 17:56:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 5/6] pci: do not disable memory decoding for
 devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-6-roger.pau@citrix.com>
 <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
 <Y1aI5Lbi3sysIZVv@Air-de-Roger>
 <730158ce-d168-5dbf-38cc-78cdedcfe33e@suse.com>
 <Y1ay/zIPSpODqsNY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1ay/zIPSpODqsNY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: d7181d9d-0882-4ae4-d9e8-08dab5d84e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SQm7eK1J882vwbsh6OgPhoarQldQidGcpezkRcjUft/Gv4AGvV/YJY1/0Up/IF8DfxZp4Cgm0wZ8tJfATlv1dMNTu0zBtiRw4L3OoFDaZOx4Vx6GIM/VkaW9grYeWkfnYRlWH7hYpYHsimDqFPNFSaQtIjxsN25mVrUSK+iw2j0uUE1R2v6uFbcqrhGxm09MHMKHMlFcoBkfdXAKMwcI6ASyf8NCs5yUIDe6xRjMKhp1VPSuK0t8Xl+mKz7By5Z1vu2HEczidK2bfCL0STTwwA0oOCrvq7v/ZTl+jfdmgANNnmykMI4BH10KZXePbir5r8jJTJkCQjU32kK55TGj6ljJoz6EWiNgO67+3xxMqIyAFAumr0XNlQqv+lspFwsWjZro546DiIgxaWYQ1sJRpCfYiNeMyDi3BclZKmFgEondrV6PF3jPIDyjJY3pd08J6Pyc0q8TD6mqwoxd4aZddijFvRAuDBjIEQte9yNlEdFT5rklEMIjwWq2DjSfnXRRwidiHTpelDDRGgs+yc/XPG7FizSQPJaIjYGrB4cWRp3KHCDLzCSN7ZmyPfGXuqmt3u3WYig8IhDelX6Mg9LQAWupc3DH7Ba6MOKUOyglJo+hb2GW5E3LKv9xWeS2rPQV6wwmxmk76pzO0nxM0LrlFHr84fjakEA7EQ7hXz/XJZQKxBSqDBSlebZLQ8U3d2++1UiYRPINBIAlgWd28oLZon+rtuW21XGSiHs/LJfZDrKb6GwTeV2I4VuIljZCBP81pZ+VZ6oMBkRG1rcy/gn9vnDw0k1cykSl3sG3ERcGt14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(6916009)(6512007)(316002)(53546011)(186003)(31696002)(8936002)(83380400001)(66946007)(2616005)(66476007)(86362001)(6506007)(5660300002)(66556008)(41300700001)(8676002)(36756003)(2906002)(4326008)(26005)(31686004)(66899015)(38100700002)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEZzRUNMVy8yRGlucGhLRTF4YWh6Q1dOMkxJZUtST3ladzVzcDdidkIySWl5?=
 =?utf-8?B?V3lpZy9DelJCaVBnNUVGTXd4NHFzN1JTVm90dnpBejUxT0cyTmNOZG9CK2to?=
 =?utf-8?B?TFJJT2s2SzlYL3k5NHh4UnpONjNkTEYwaHRXeFJ4aEFjbERVL3NLS0JsbXI3?=
 =?utf-8?B?OXcrTHlQTHNvQ3kvbW9mSFN1aVRmMGFnY3hRckJHYXVxSEUzeEpsVi93TFcw?=
 =?utf-8?B?WjVvOTVOWE9pN29XV2VMRDJmQjFGTXYzeEhBRFg3SkU1cExiZDJaV29WclVL?=
 =?utf-8?B?TjlNMGlLRUo5LzZCbmRTQVRJZWRqUUJlU1NFR1hCL3FkN1didW9sdTRSVS9s?=
 =?utf-8?B?dTY3akRROTYzQXdxY1MyN29HRzlpQmxkMUFYQU1kbzVDcE1xT0dNcGdQV1kv?=
 =?utf-8?B?ZXVJK1ArMDd0N3hiVk9xR3BKV3R2VzhJU0hqWk1xd25sQ2xLelVONU5OZTA4?=
 =?utf-8?B?M3lsVE9DUnJET2lkbGJ4aXEyQjN2aXMwZmpwTGpub0dRSWZ4UkpTTGljYVFM?=
 =?utf-8?B?RmRKZnozdkpoWkNRRWlIU2luTnpHVytUdDFWSEJIcFMwaEJTTElhVURFMTJm?=
 =?utf-8?B?c0tHOENBTWh5b1pWNHpadTRsUHBVeTlSRHRHS0NQOEdwMlVscGJrTjFJbHFj?=
 =?utf-8?B?T3IralBma1l5NWFsVkVEakNIMnRid0xYU3ZQZE81R0RtblNqdE1obEU3WlE4?=
 =?utf-8?B?MkZpbjV3V2FScGpRWENyNEQ0ZkJOSXF5dzVRM0xWcjBnSmtqTzBYTytHY1hS?=
 =?utf-8?B?dWtBQzA4WGR0Uyt1NW1UdE5GdjJzc0FoczM5UVVud0pHRVRsRmlNcS9BcWRs?=
 =?utf-8?B?ZGRhQXBqeGpQYWpCQTVZS2VnT0RPNENGU2RjbnV2MkJ1V2tSUWZCT21XK0xD?=
 =?utf-8?B?S3dyQ2hyT3duaXVIa0h1NjdSYVhQTEUvNW8xVTdDYVB6WUovUGJPTTZNbnBB?=
 =?utf-8?B?RGFtUTVIQ3hTVkxQV2xoNnlCMUJmMDR1Wk9uQ1lrdkUxc1ZrYjEvREFLTndH?=
 =?utf-8?B?RlMxaEdWQk9mdGFnR1M3SnhmaUY5UFlXNE1oRTN2dXdLb1RibXRIYWV4Y1NC?=
 =?utf-8?B?NkpGM1RnYlNkWnhybFZTczZPTUFOclJQUjM3WGgrYm9FYVAvdjdVUXQ0VkhH?=
 =?utf-8?B?cXIwY1RHNzNSV1Awb3FTZThNYXhuRjZBNVJldkhZSnl6VDEzMWpKRC9JSFFV?=
 =?utf-8?B?UzhqWERCZFUxU3AraWdvZkdENGlBRFJtQ3VsbU1GcEdSMzdBMWZvUVppQUVn?=
 =?utf-8?B?RW95UFh1UzI1aElLakt3MVhnTFdxZEZlSjFhVktGYzB2OThHVi9zaTNKUm5o?=
 =?utf-8?B?RzlCWkU0dExLWDRNMnM0aEEyTC85amRBSUgreG1ibE50NUxYbnc1dCszWWQ3?=
 =?utf-8?B?MHI0OVhBSDg0WGV3Wnd6bzh1aEVkQk9VM3F2R205ZnpGem80NGJ2RVo2QmVL?=
 =?utf-8?B?aEdFNnh6TEp0c3gxMFllejRzREp5WEN3NXpHcEMwNVZ2M0RJL3RlTzVzNGV2?=
 =?utf-8?B?ODQvRzBsOVVMTzVFWVFaN2Q0TjFiV0tqOTdiNFFKRUNJVWdCN3d0VWVxeW84?=
 =?utf-8?B?K0VRd09BQUpCTnpic1Zwdmp3eEpPcTVjQ3ArSnduSUJ1d210MWQzaEFuY2Fa?=
 =?utf-8?B?anlyQkxnSHUxZm1lMnNUbHJYM1dveGtPb2xuOHFaZWM0OUVndTVFVE5PL2ZG?=
 =?utf-8?B?TUs5RkRHV0ZZMnRjdlp4MTRwM29xN0lQMlJ0YUlFZi9LVWlxb1haVUx2bTM3?=
 =?utf-8?B?T0t5dDgzTC9JdzZuZ1dkR3g5bC9RbU4yK25SeDVxYzJjKzh5RWlYYThrcHVG?=
 =?utf-8?B?RE43S004UHNPSUxyV1Z0azFIWDJBSUc2U0YrUHJxRzk2TlJFaFdKNzRVdlBw?=
 =?utf-8?B?RGx4c2RHbzR6blJrUU1xRFlRWEVycVcwOXJNU0w4UTBvd2RJaUtaek10WktH?=
 =?utf-8?B?RXo2WFAzODVuWDZIVWsrRU5hREx2TldRcHBheG45aHEyQ2NKajl2bjVBUkJh?=
 =?utf-8?B?Tlk4UTdqdlp5ZXZiRi9VaURoL1kzNncyaHFBaGxVU1pRMWZLU2pSa2FYUXRI?=
 =?utf-8?B?Rmk1V0FzcE5ZRGN4d082czZDMlpXb2pIZkNkY0VQTGtaVG5wWDVNWnhodSs3?=
 =?utf-8?Q?lbfsEulN6EgBPf62/I8kPf7MB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7181d9d-0882-4ae4-d9e8-08dab5d84e8e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 15:56:26.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjTSdKta1jlrKd+sjSX9zYCZrqfsFtZzFuGDLQh/eqe+NWK4+WG9a0w8Z1XPR9Aq4js2Jdo/X50nNaWRKI+VFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9100

On 24.10.2022 17:45, Roger Pau Monné wrote:
> On Mon, Oct 24, 2022 at 03:59:18PM +0200, Jan Beulich wrote:
>> On 24.10.2022 14:45, Roger Pau Monné wrote:
>>> On Mon, Oct 24, 2022 at 01:19:22PM +0200, Jan Beulich wrote:
>>>> On 20.10.2022 11:46, Roger Pau Monne wrote:
>>>>> Commit 75cc460a1b added checks to ensure the position of the BARs from
>>>>> PCI devices don't overlap with regions defined on the memory map.
>>>>> When there's a collision memory decoding is left disabled for the
>>>>> device, assuming that dom0 will reposition the BAR if necessary and
>>>>> enable memory decoding.
>>>>>
>>>>> While this would be the case for devices being used by dom0, devices
>>>>> being used by the firmware itself that have no driver would usually be
>>>>> left with memory decoding disabled by dom0 if that's the state dom0
>>>>> found them in, and thus firmware trying to make use of them will not
>>>>> function correctly.
>>>>>
>>>>> The initial intent of 75cc460a1b was to prevent vPCI from creating
>>>>> MMIO mappings on the dom0 p2m over regions that would otherwise
>>>>> already have mappings established.  It's my view now that we likely
>>>>> went too far with 75cc460a1b, and Xen disabling memory decoding of
>>>>> devices (as buggy as they might be) is harmful, and reduces the set of
>>>>> hardware on which Xen works.
>>>>>
>>>>> This commits reverts most of 75cc460a1b, and instead adds checks to
>>>>> vPCI in order to prevent misplaced BARs from being added to the
>>>>> hardware domain p2m.
>>>>
>>>> Which makes me wonder: How do things work then? Dom0 then still can't
>>>> access the BAR address range, can it?
>>>
>>> It does allow access on some situations where the previous arrangement
>>> didn't work because it wholesale disabled memory decoding for the
>>> device.
>>>
>>> So if it's only one BAR that's misplaced the rest will still get added
>>> to the dom0 p2m and be accessible, because memory decoding won't be
>>> turned off for the device.
>>
>> Right - without a per-BAR disable there can only be all or nothing. In
>> the end if things work with this adjustment, the problem BAR cannot
>> really be in use aiui. I wonder what you would propose we do if on
>> another system such a BAR is actually in use.
> 
> dom0 would have to change the position of the BAR to a suitable place
> and then use it.  Linux dom0 does already reposition bogus BARs of
> devices.

Yet that still can't realistically work if the firmware expects the
BAR at the address recorded in the EFI memory map entry.

>>>> Plus with this adjustment, is
>>>> ...
>>>>
>>>>>  Signaling on whether BARs are mapped is tracked
>>>>> in the vpci structure, so that misplaced BARs are not mapped, and thus
>>>>> Xen won't attempt to unmap them when memory decoding is disabled.
>>>>>
>>>>> This restores the behavior of Xen for PV dom0 to the state it was
>>>>> previous to 75cc460a1b, while also introducing a more contained fix
>>>>> for the vPCI BAR mapping issues.
>>>>
>>>> ... this (in particular "restores the behavior") a valid description
>>>> of this change?
>>>
>>> Yes, it restores the previous behavior for PV dom0, as memory decoding
>>> is no longer turned off for any devices regardless of where the BARs
>>> are positioned.
>>
>> It restores one aspect of behavior but then puts in place another
>> restriction.
> 
> I assume the other restriction is about moving the check to vPCI code
> rather than disabling memory decoding?
> 
> It restores the behavior for PV dom0, and keeps a more 'contained' fix
> for PVH dom0.

Ouch, I'm sorry: I didn't pay attention to the "restore" applying to PV
(the similarity of the acronyms made me read "PVH" despite it being "PV").

>>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>> AT Citrix we have a system with a device with the following BARs:
>>>>>
>>>>> BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
>>>>> BAR [0, 0x1fff] -> not positioned, outside host bridge window
>>>>>
>>>>> And memory decoding enabled by the firmware.  With the current code
>>>>> (or any of the previous fix proposals), Xen would still disable memory
>>>>> decoding for the device, and the system will freeze when attempting to
>>>>> set EFI vars.
>>>>
>>>> Isn't the latter (BAR at address 0) yet another problem?
>>>
>>> It's a BAR that hasn't been positioned by the firmware AFAICT.  Which
>>> is a bug in the firmware but shouldn't prevent Xen from booting.
>>>
>>> In the above system address 0 is outside of the PCI host bridge
>>> window, so even if we mapped the BAR and memory decoding for the
>>> device was enabled accessing such BAR wouldn't work.
>>
>> It's mere luck I would say that in this case the BAR is outside the
>> bridge's window. What if this was a device integrated in the root
>> complex?
> 
> I would expect dom0 to reposition the BAR, but doesn't a root complex
> also have a set of windows in decodes accesses from (as listed in ACPI
> _CRS method for the device), and hence still need BARs to be
> positioned at certain ranges in order to be accessible?

Possibly; I guess I haven't learned enough of how this works at the
root complex. Yet still an unassigned BAR might end up overlapping a
valid window.

>>>> I have to admit
>>>> that I'm uncertain in how far it is a good idea to try to make Xen look
>>>> to work on such a system ...
>>>
>>> PV dom0 works on a system like the above prior to c/s 75cc460a1b, so I
>>> would consider 75cc460a1b to be a regression for PV dom0 setups.
>>
>> Agreed, in a way it is a regression. In another way it is deliberate
>> behavior to not accept bogus configurations. The difficulty is to
>> find a reasonable balance between allowing Xen to work in such cases
>> and guarding Xen from suffering follow-on issues resulting from such
>> misconfiguration. After all if this system later was impacted by the
>> bad BAR(s), connecting the misbehavior to the root cause might end
>> up quite a bit more difficult.
> 
> IMO we should strive to boot (almost?) everywhere Linux (or your
> chosen dom0 OS) also boots, since that's what users expect.
> 
> I would assume if the system was impacted by the bad BARs, it would
> also affect the dom0 OS when booting natively on such platform.
> 
> What we do right now with memory decoding already leads to a very
> difficult to diagnose issue, as on the above example calling an UEFI
> runtime method completely freezes the box (no debug keys, no watchdog
> worked).
> 
> So I think leaving the system PCI devices as-is and letting dom0 deal
> with the conflicts is likely a better option than playing with the
> memory decoding bits.

Maybe. None of the workarounds really feel very good.

Jan

