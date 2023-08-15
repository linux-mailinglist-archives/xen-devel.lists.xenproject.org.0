Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAB77C749
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 08:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583861.914207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVn5Z-0000Ux-VX; Tue, 15 Aug 2023 05:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583861.914207; Tue, 15 Aug 2023 05:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVn5Z-0000SU-SW; Tue, 15 Aug 2023 05:59:33 +0000
Received: by outflank-mailman (input) for mailman id 583861;
 Tue, 15 Aug 2023 05:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVak=EA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVn5Y-0000SO-67
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 05:59:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5c71925-3b30-11ee-b28b-6b7b168915f2;
 Tue, 15 Aug 2023 07:59:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6905.eurprd04.prod.outlook.com (2603:10a6:10:113::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 05:59:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 05:59:27 +0000
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
X-Inumbo-ID: e5c71925-3b30-11ee-b28b-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZkZWF+aWoe4Ffa/VpZm0kPCzkRVmiKBhFGqV7OcYp3tlhXJrg2NnfEyK/aMvAbWsBfANNMR2J5C7iepVpkWZOD6AKpTFKTwcUem/ct3PeW2Sz0N5Bcy9vrwOCtXh+l8whxU1ZxnnDn42prkzWynih/WK8HSN18DR4QTyT1ahfbtxIkSahcVBJ9k0gytbVVDkKVDkDlM228SW5uFzEfPD6TfisHbgXRLRjTM5u5+Wp3MP3afLHtMoshaf+5BnVl1/NHJJRnFgVIsJe8L5S9vMJ9JoGQn4Ikr0c+Xsk/aPHoH+ddnYHpAnKpOfJCMRnsmGUKbSGTRLPmofCOvgZZ2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtW5c5IFqRJ6t9+Wlp7QzAZc5xG3DbDYvu2/vusObE8=;
 b=TC+kE12tuHY2wBOonaiXITGghk9hA2MN+ZgLaEx8JuOZJ62t7odUcC3+BJ4YIKgP037uWYyZVGWBlDNUon1fbTYTPTybFSiPwA2TLjQ53n+hiF1P42ojZu0mDGgnj37Lp2gFtH2pDh476lBtP1zqL59fETJos0JTC74o3ZRCRouHnYCW8VjVns8tKRtuUoYU+lDdQe+ERJ8cqkAAdubjKne6EtApaGc1PAhZqDzixNiV3M/XYqwZouAPCOkhLyzMWdxL8Ct6Uh0AZ10AJ0UU6Sv5AMXjS1eUvQY6YxIPX4tfr9J1W9rXjZ7PLHEqS+uFFw4T2zoIx9hs3pPUqW/Gcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtW5c5IFqRJ6t9+Wlp7QzAZc5xG3DbDYvu2/vusObE8=;
 b=fCY16qp7T0uqZAUle8wMf29Z8xQsTItdGvBLuNy5Jj0/d3QhcIKEI55SNnJLpeggJ92/iXKTPx8jerTWOskkraR60UK7FvJWQb810wYYgh7DCwLZRUz8DUvKXmjbZhl6w4zdJNVi5E2TBu+IepK3+myp9MbzeEUWKRhfd1TcIdfHC4qgjXokkjomOSHrjfqMHqMPhN6cgQUwepYGRE1RR2eUrrqUQk36bzD57OrIdjgFNIx9KL2qF8ikmjXxbBSXCG5rTtx8iz/tBMQxEdPyVeRJUFFuEdHMovueOe+0E1PORYFlcs8A+u/k8TY4iTSRw/Q/AHx4EKcz/EG+wrQlgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b86c7256-22ba-28de-7279-d1d257cfa669@suse.com>
Date: Tue, 15 Aug 2023 07:59:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 0/3] vPCI capabilities filtering
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
 <98616195-71ef-23ce-e6ed-0dfb6e10020c@suse.com>
 <0dfbf498-affb-133d-08bb-69a96d629d1e@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0dfbf498-affb-133d-08bb-69a96d629d1e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: be0cd929-fbb1-4933-5a5f-08db9d54c8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V3+kWGp62De1ofgWstxw4NTpl2WO7KGw4pIOpctbEU8nLgJuV1tVVP6OnyQatVkashBbC4EMevhS+eI8EZVPAfSsd+gQDVUDy0C5+6H0bE5PrBM6TYrE7CbGy3ghEhp0HqWB800cSKocIa6/mfBjzTcbVFqjB3DomwMCUoSyeaAZ+7V5UkioI3L30pxvVFjyXcnAAXXiWd13UOUYOihzNipoHPKN1t6jRKMQakkcWq66sSSkHk42UOJpqXP2Sp9ZPE+2rzg+dWiIl5SiUKN6gpjOaif5kWhr+B1mPyqRiJT7Zrbo00rxqH9APZlJMYtVhET2z4cQgSIV/GdGzK2pIh9Sf8gwqXTFYJBmjBDzJAcVYvD2avx/21sMKtlEDta+5czNLhNQVf2lJ8tH72pUasjB9MJli//0BOF23asu+5ejpGYzBuIFztVSSMu4jDRO3R2/ZiHNOOi6HiC2txA+2TVPdAME+zfsWQUo6WivXGByw6oa2tszX+d/5FWbL7QBoh4mehzf6jkmzSQIxfviDrVZ2X3a/Q2p3F1CHxlOPKVkkXBGEQVHKR1+rveX7ohol1WS2WYoqCkjRA0ki7rzYMxz0xcxHlTTrHaxE3giWMJPWYZjEIcdvohErB0RMCFbUeivjTP4KvPpvU+rOP0naA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(186006)(1800799006)(26005)(6506007)(53546011)(966005)(6512007)(6486002)(2616005)(83380400001)(5660300002)(8676002)(8936002)(2906002)(478600001)(316002)(41300700001)(6916009)(66476007)(66556008)(66946007)(4326008)(31696002)(86362001)(36756003)(38100700002)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZllHYU1BNDF1N3lLa29yeXY0RmF0QTA0eGgrYTFpUE5HUldJY3BBeW83NkMr?=
 =?utf-8?B?V3M4QjM5TURZWlY4eXpVaThjajJUVUpINStvNmtNZWVIUmpIb2RtUlhWQXl6?=
 =?utf-8?B?RkZQaG5hMkNzVStncmZ0SlRjbmx2Yk1FWjJQY3UreFVtbDFvYVQ1dU5GR3U3?=
 =?utf-8?B?NGdwUkQyUkV4TnVrU2UwVG52cDR3dlB3K2lJMkNsV3VqbCtBZ1h3UW5YbUg0?=
 =?utf-8?B?MDJQam13WS9EVEdBOCtPSEdETnMrSlJjVVg1QVd5SGZjNFBGYS9ac2hKQm9Z?=
 =?utf-8?B?cHJhN0ZtTWtwQU9KVFRPMjdlZ1IyamQwV1FoRzNDcERpLzNtQnc5SUxYZHRz?=
 =?utf-8?B?bHNLZm1Oc2M5Z1dqTmVoWThaaWJ3QzFEaENQOWs5eTAvOWdTSEg0NTFINGMv?=
 =?utf-8?B?Z1RJc3BDOFNtdjVaanFjMC90NDZvL1JpTTJiTFd5b3pENUZOZlR1Tm5vVlM4?=
 =?utf-8?B?ZlkvM2hJZjZtbWlZYlZGdEhGS1d0aDlNUXFXNXhIWEp5ZjkxQzF5QjcrMjVu?=
 =?utf-8?B?YjMxek04Uy84ZTNMcW91TFRyQnpTbzRJUy9NUXdiVG1EOXh3Q0pwWjgwYVN4?=
 =?utf-8?B?ZDZtcVZSdXgzN1hLelBVOXlIcTZGSTdsZ3Q5ZmFsVHU0emFEazRZblNtMW9M?=
 =?utf-8?B?eEdyZjBxczRYOTNna1lFUVE3VVFnSG1PZlJTRHJTRDRDR293bjNmM1hVb01J?=
 =?utf-8?B?UHNENjJub1R1ZytGK0MySzJvdEhaTi9HSFlWcS9xUDAybVB4UU5CNm01MkVK?=
 =?utf-8?B?TkQyM3o5T2k4RG5lM2xpaEI5K3VKcktQdVM3a2Z1RHhiRjNFMDZhRlhaQkU1?=
 =?utf-8?B?KzNYRUx5eEpSSUxYdktjMHE1YW5RTUJPVHdsQU95SWw4ZnY1N2JTYmM4Si9H?=
 =?utf-8?B?R0plWWxnMnEyWmt4bGJpY3k1VysrekZwdG5lM3JxanVCMjc5KzJZOWZMSkxa?=
 =?utf-8?B?WFFwYmsyblBrUlR6VjNmcTRxYjhxMGorVjdnM1lzZS93MElMaHNac1FaN0Jp?=
 =?utf-8?B?S25La3NyRk04YWpuY1p1U0ZSZ1lkTFlUU2pNSmxJNFlRd1NOYkZNOGRXUHpr?=
 =?utf-8?B?ZHgyTkgvdTRLSlpGYThSZ3FBaGZINzQzaVhXUGxMK1VZZTNWdE04Z0ZCT2V2?=
 =?utf-8?B?Mmx2ZnpzQ1lZb3d4MmVwV0E1WG1pZUxBY0RHdDBPWXlqSFRCbnR6amtBNzVN?=
 =?utf-8?B?dDVHa0kyVXFPN3lKSkRXczZsbGNvUldXUUVmMGF3YXdhVHdKbFI2M3dhMFdh?=
 =?utf-8?B?OUNvWSt4NjBrMFdvT1U1UGs2akg4SDJFc0UzcGhhb2NiZkhSOVBIRXRvU3NN?=
 =?utf-8?B?dDNlQWYyZDVpajk5VWdHdnN5T2Z2QUNVVzhlRTRPa05TYlNqVTNUMHNOZEY4?=
 =?utf-8?B?WHM1dkV6cmx2THYzVEFxWkVqN0lXdW5VYmVUaW85bTFBaWxvVzRZTEF0SVho?=
 =?utf-8?B?RnpQYzdGa0hKOExwTFZRS0xxemhxYmN5SDg4YlpteG5IdGNQSmh5bTFmY1hw?=
 =?utf-8?B?Uy8rc3hOQWdIdzFWWEdnanlvM0liSmk2ZGlJVElMdmxjRGNKWXVaSUgweW9F?=
 =?utf-8?B?NHVHRU00c2N5bTRYQUx6eGI5Y3llSVVxUnRrTk8vNkJnaWdXRFJIb0liVWdF?=
 =?utf-8?B?cGtEM05QUEtQZU9IL2o2TU52ODhhTW1QcnkzU2lHL3hPc2QyeDY2aHU2N2U2?=
 =?utf-8?B?aGNaY3dsSjdoakJKSXZtcjdoMU5nalEzUkFiZnFZemZNNldVUDJEY3FYOWR5?=
 =?utf-8?B?TXhuUFUvYWF0N2Z2TnpRekc0eDl4SEV2bnZrVkhHUHR5bWlnQ1lEUmMvZEhL?=
 =?utf-8?B?VVBCVlBNVzlLNDZ4RUZIZzZwSEU4WFgzcjhpc2RtZ3RSdmQzNjFnZUZ3MzZw?=
 =?utf-8?B?U2pQaHhNNzFVWmFQZ3JiQXhHd2oyRnZuWUxSZjMwTlhQZUFVRm1WSWhaT2M5?=
 =?utf-8?B?RDBZZVRRRUZwN0R0cFUrVTVmNXB0Tmw5NDhKcnZxVG9jSFBuZUhYQlk2VXc0?=
 =?utf-8?B?MEN4K3BqTzJtYzNTZG1jYU1VeHZCOVZRS3VSb3F2T2tGMGxIbTQyK2U4aWVZ?=
 =?utf-8?B?RFlxWHhVa1V6Tkk5Q2hBcjZudmlic2NQYzN4S2U4RmxKcWNyclBwdFBkUWF0?=
 =?utf-8?Q?5ju7f8RKyR84FL5qKgRoG17Tf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0cd929-fbb1-4933-5a5f-08db9d54c8a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 05:59:27.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qzqMxH9rMQfN1FEAwhdbJd3VWlmwSLEyjQx8Vy6tf4uoitPpv/coysI0wlqBCPrC8pwE4mDoHxb9uPymE7yHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6905

On 14.08.2023 23:11, Stewart Hildebrand wrote:
> On 8/14/23 09:59, Jan Beulich wrote:
>> On 10.08.2023 21:12, Stewart Hildebrand wrote:
>>> This small series enables vPCI to filter which PCI capabilites we expose to a
>>> domU. This series adds vPCI register handlers within
>>> xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.
>>>
>>> Note there are minor rebase conflicts with the in-progress vPCI series [1].
>>> These conflicts fall into the category of functions and code being added
>>> adjacent to one another, so are easily resolved. I did not identify any
>>> dependency on the vPCI locking work, and the two series deal with different
>>> aspects of emulating the PCI header.
>>>
>>> Future work may involve adding handlers for more registers in the vPCI header,
>>> such as STATUS, VID/DID, etc.
>>>
>>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html
>>>
>>> Stewart Hildebrand (3):
>>>   xen/vpci: add vpci_hw_read8 helper
>>>   xen/vpci: add vpci_read_val helper
>>>   xen/vpci: header: filter PCI capabilities
>>
>> I'm not convinced of the split here: Seeing the new helpers in isolation
>> leaves entirely open what they're to be used for.
> 
> Our code review guide [2] (section "General Patterns") explicitly suggests separating independent helper functions into (a) separate patch(es). Whether it is one patch per helper, or all helpers in a single patch appears ambiguous.
> That said, I'd still be happy to squash all these into a single patch to avoid the transient dead code situation - please confirm.

I'm not the maintainer of this code, so my confirmation is of limited
value, but yes, in the case here I'm of the clear opinion that
separating out the helper functions is not helpful. Not doing so will
then also ...

>> Plus besides introducing
>> dead code (even if only transiently), you also introduce cf_check marked
>> code which isn't really called indirectly from anywhere. Yet we'd like to
>> keep the amount of these markings down (in the final binary, not so much
>> in source code).
> 
> The helper functions will be added to struct vpci_register objects, where they will be called from vpci.c:vpci_read():
> 
>     val = r->read(pdev, r->offset, r->private);
> 
> Does this justify the cf_check attribute?

It not only justifies the attribute, it actually demands it, yes. By
the time these use sites appear.

> If so, should the cf_check attributes rather be added once the helpers are actually used in the patch "xen/vpci: header: filter PCI capabilities"?

... deal with this, by rendering remark and question void.

> [2] http://xenbits.xenproject.org/governance/code-review-guide.html

I'll try to remember to add a topic to the next Community Call's
agenda. Actively suggesting to (even if just transiently) introduce
dead code is in direct conflict with the Misra work. Plus, if such
helpers were static, it also suggests actively breaking the build,
again just transiently of course.

Jan

