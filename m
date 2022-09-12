Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873055B5680
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405577.648037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXf1E-0008Ow-Ay; Mon, 12 Sep 2022 08:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405577.648037; Mon, 12 Sep 2022 08:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXf1E-0008Lc-8D; Mon, 12 Sep 2022 08:42:16 +0000
Received: by outflank-mailman (input) for mailman id 405577;
 Mon, 12 Sep 2022 08:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXf1C-0008LW-26
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:42:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb9696a3-3276-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 10:42:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 08:42:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 08:42:10 +0000
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
X-Inumbo-ID: cb9696a3-3276-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mL4n/qRu/0KxO/7AfDh14pTQPWc3ubydazIP6MYfbYYmmuxVa3/io8ZTN+HnDPnTA2qZIE0r7qXAu1WFAaBM4fy7geUuIZkpHD09mmIcC9WU5dJMRksssFlkTOrUWGD4lH1iEJxz9ubzk0qM+wSEuNtTjhE0NiONOODoA/OprBLzRhSyGea7Zgdg5bRYO3rL5k554ujlU20N/B0r6j0fuLS6irf3YwRMJq22u5J5zLxpEUTUt2MMkbBi4FxJkSEP75+Co0GUPbbK/ALmciysEJbDii/Y2jUZqPqOn0rdEVNO3E6nrxOW/2w/ULjNhg1qmBGBDb1ZO2WA5cfBFz6K+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynvVUh/G9AgcgTk3W2ENe33XBmw5Uw8BzR+mr2nmam4=;
 b=VwJd2JULQi+Z2iBt1iBysjBf6BfMTs6GddlG8rZhMNhsy8/EjY/WR1KjUlTYmowjjDjwLGmScL/XU269LBSlmrecI19kQU0NHApS0mSs/IlFZCOWtNpRnet9fY0uQjNv/uGJ5IZoF7ROKUAPPdYIQQt9RHa1xFYpMBErYgBDPw3/aQn2RfQX7796vUk82u8cARzc8t9HzKFh3g/B3xPBXiD58kp8htsRp2aWoMXPNvUVURr/OsSF8Vl312up3BPe+j5hopoavliw3ER41XB6omKulHSDuiCy/NN5GtwOl6gq3QDNf/nNfjpHEQEi2F3hou4jmPteCRcVB3kUlRg2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynvVUh/G9AgcgTk3W2ENe33XBmw5Uw8BzR+mr2nmam4=;
 b=fs6IqJy29Q1f7lDPyh3uI6Jy8sRcPDYfQyhsnyZs5W/RmTii4Lxqmyqn6u+MOmQzGamB0pBu45mu9vuEdM973FHSySxx8yM/E+kTXiXGZIg42DaSLHrCz4CLHTae84HJ8YGTcGYw/TCSUQB3kRPr26tuPMGNnEmbI6/UOlouHbMXDFgS/j5BgVITnncalYkBtraOUjvuASUnpcNV27jFPJhrheYQ3dFAZB2mZS+nInKRvkBtGXpxsE9h+SpV92aRU52k0MgkfcHLH+LoryN6r3nmdR9jLcETbgjno7FJEMjZ7xxtn71TQQwNMDUvA+7hxIaFa029+uIrXe3957vOSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d57d986a-cfdb-a43f-6a30-6f1dd602a57e@suse.com>
Date: Mon, 12 Sep 2022 10:42:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
 <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
 <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0275.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7bbe10-67c2-4c7a-84ba-08da949aae7b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hm/DrCZ2QWQ9qHdBktYJgZwDrqLU/K8SD2huTgm2MAQBRcC4+w2ISvumlj7S/nQxUKpelNQp9/uSnjTmk5EGh0RFVTP2DLbZ6xNpufuu2WkxtPf3a44WeSkAaV+YSAfBdPgT9SwHFsUJTn3l1QPcswQ/pE00/CSuYaYA3EKBijQ5+lJtA26slAV+uqGgEy7g+mgOSFDVGXEooi2510BRmhSzvz1q1KB305a8eKx8fMfKWnrqu/m0UyXgFaTsaosEKAm7muqy2gPkyP1z3wVlwGxK0p3lOqlhxh3ae/f4VeAqMYcw0AHN+6DDFLO/Sl1XozzervU1jjE0dERkvjOKyKtAgPBnHif8Fb2ulv+o+atHPkb6LqPjtv7VaAAFnQs2wqR/ZVXhucRGyyV9YyxIp3QdCD9zIk2B29SlFcZJvN4u3uKW2L/pTqep16qGHHsV5Ce7Ry0V9QBFPcvQ8ve9fxevzb5zUt/4mUxt0jVOfNSNqIp7ln3iNPr88CA59XEzQuO95+DPg7mzdYoGWPwip2TAY5Tr7J/mfEh8ua4yZ2XktXJ+iv4TI0dXIy/N69sGY7HLSep+w2aFDoQlKczXwfEZDXaD4MBoi5x3J5DBSP70limhgaPojRC/YjQyxIxKtHv3I2nuqGeXbKVQN7Da8XU/v71oOzAS4Q72YLvBoRnD4+PD9EPibVrKy7d1MgfY97LVGcNsudOopwFRo+TCrKVPNvdwzIelS9HaxBahUPU4tngf2N+LuDMbK3v3I+rtuvU8ZIEozaWcCBMPnuk0U5Sbzq54nxCsMuUu522COFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(39860400002)(366004)(136003)(6506007)(186003)(2616005)(2906002)(5660300002)(8936002)(4326008)(8676002)(66556008)(66476007)(66946007)(6512007)(53546011)(86362001)(36756003)(31686004)(83380400001)(41300700001)(26005)(478600001)(6486002)(107886003)(31696002)(54906003)(6916009)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXI1bHRZQlREc0hEd3lUL2NKSERCSXk0aUI4QjdqdmlWZnVDY3BXLy82ZFZq?=
 =?utf-8?B?MHloTGlvbW9xczBYUEdJMkk0YWdkQkdseGZtK3dIVHN0ZHcySS9EdWMxakc4?=
 =?utf-8?B?dEpUcVhZVzJtanJLclM3MzN0NUR5eVRQZTdDd01TWkdxRkFKdjdwcmh2N1VW?=
 =?utf-8?B?Z0J1NWxKZXQ4dkhEWGtUd0NiVkV0YzlPS2FXOTV1NldCUkZRdXdZUXBYSVpL?=
 =?utf-8?B?NzNHckhVeWJmNldOaS9vRThDd0txVFpGZFk5Zjk5eVp3MGhsR0Q0NEhZK3Q3?=
 =?utf-8?B?YjJOWng1anVOZ2tLYUVJblkyY1p6MFJ0NE1ja1Y2eWV4V0xZSlJIOG5nYUhz?=
 =?utf-8?B?SEcxeTdJR3A3WE02emtpMjdydFd2Tkg0bHVrQXhBVHRwMEgrZU1sdzBSQUE3?=
 =?utf-8?B?d0t5T0J2ZnUxWm4yMUJvcmlHZ25WQkhkQjR6U0lucVlyMEdTYStVS0JjNUdF?=
 =?utf-8?B?UXdzcEo2K0N0dlFrNkxKNERhZTN3VjQzNEhGdWNPVXdCK0UzMnV5cDU5TnJF?=
 =?utf-8?B?RmhZMmNFcm9DejNyVnIvUVZ2VDQ1Vy96bTB0eVd2b1kzNk14eFdVNldEcjJw?=
 =?utf-8?B?OGpwSkl0enp6NytWMzBRRkRlUHJXTEt3Q1RtS0c1QU9UM1lDV1lhTTB4Zy9E?=
 =?utf-8?B?bFVUUm5EaWNtUU5iZkdLVG9xenZRT2pyZEJnbW11YzJZOTM1YjlJckJhZEw0?=
 =?utf-8?B?aXVCT08xZUxVZ1VpckNNbFduY2F4bnBObFUzM0ovTGNoTUNQWU5ualAyaE9V?=
 =?utf-8?B?U0kvWGt1blBUc1RQL2xiWEJPdGk3d1NyNnlNN0k2L21vMDNBald0bEVVb1RH?=
 =?utf-8?B?QU1ZQUVQRWRyM2EwdTBkaC9ZMDF5VGZwTHRrZ1NuejBIVE8xcTBVSXNwbVJW?=
 =?utf-8?B?ZEFlSklPVjh3OTJSMzJ0VTI2L0M5ZFRNdHU1UHl5NU1yZGlOenh2ZU9XTG5R?=
 =?utf-8?B?K2RURU9HaTJBSmhkQ0RzUi9KTUhsUXpoeXpsVkJGVEVDNlZBODB3aU83bHVE?=
 =?utf-8?B?WVVUMnVOU3J0a1dRc3c4SnI3bWxBY1V3aUVNTk9XSW1EcWhVSUZtRFBzV25M?=
 =?utf-8?B?bDE5RkxlZzdCckVnbUZ3Tk1CQ3pVZTErS1pYV21XaFd2QTBlZTdDalhnUEZV?=
 =?utf-8?B?VEZYQlR0WWpaNi9ZbUIydXYwc3ZJek9RWjZuenM4cFY0K085T2tlVk9BM0pG?=
 =?utf-8?B?TEZhbkJrbC9aNGNiN2llRlUzaUxTQlV5TzFaMjl6ODhUUUJybDJqalp4Q0hE?=
 =?utf-8?B?eGhOZTNoajlGT05Lc0NHeFphTE9kMU1iMFUxNUEzMTI2L00vWmZMUk41MzFq?=
 =?utf-8?B?OWR4V05hWG10TmR4UnZNRzlsckRwc29Hb3Z5VUFNZ1dUNm10dWhzZU9oWFJX?=
 =?utf-8?B?dGdqYTFSVmxDZStSWVBEMXFkcklFdzdEODhXUFpsMExvOHloTnltUURIaWlx?=
 =?utf-8?B?aCtJcUJHZE5reVNNYi9kWW5iamxBR2hOcHVlc0lseE1WUkh1TUhnMzVFOTJq?=
 =?utf-8?B?cWthSU00UW1XMTNGNk5vN1IyeTMxNDhWR1hHQ1FldllMUDI2WGdHcUQrM2pT?=
 =?utf-8?B?d05LaXZPaTJmdGFKLzNmYmprc1pVbDhZRDBrK3BPcVAzbkVFWWo4MDRhdUZr?=
 =?utf-8?B?dUZBaTNkeDMxdmtuZ2hjVHdPMEVzWmpaQ09zek1YbWRjQU8rUEVqTU9jNzhJ?=
 =?utf-8?B?NjJXMldrb0pxN2RPUzk1Tmh5WUVsai9VckhnbDRqcDlQT1FvVEVGT2V5YnJO?=
 =?utf-8?B?dXBmSHlaWGcybnhjNHE0YzBZejFYMVlqZzNmcEpIN3JBeEtIQ2Y4WElHbHJO?=
 =?utf-8?B?cWhodXhEZG85Q1JyenJhYi83TE5tVkpJT1ZBR3U2WWdLQ0Viek85Vk96MElD?=
 =?utf-8?B?NHpWYTNzRVM1NzdCc04zQnZmSlNEK3pSWXlybEhFTzVYYzRibUNRTnIrNDVC?=
 =?utf-8?B?WURycFp5ODNLcGZqSFdnZmZiME9ZQjFwK21zUHltUU9acThrYnh5c21jWFFV?=
 =?utf-8?B?cFNlUmVoUi9SNzlMZTIzUHlPRHZDOGo2NkNYcFU3S2hNRU93SmY5MGp5UDJi?=
 =?utf-8?B?MWhSY0ErOTlhQVlkOU1UaG1PZzZLU3k5SVVURXlPRSs2SEF1RllNbDBYTCtT?=
 =?utf-8?Q?EJ7vtiSz05/wKIqGbSs8PvR3w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7bbe10-67c2-4c7a-84ba-08da949aae7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 08:42:10.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hT7iuK743MR/ptj/LgCx82usdNL8EzofAs83dvaqDNrl5YEIHgsjwIerhCfKrvkSjI2N1QVGVYxqrE+enkOwMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

On 12.09.2022 10:36, Julien Grall wrote:
> On 12/09/2022 09:33, Juergen Gross wrote:
>> On 12.09.22 10:31, Jan Beulich wrote:
>>> On 12.09.2022 10:23, Juergen Gross wrote:
>>>> On 12.09.22 10:19, Jan Beulich wrote:
>>>>> On 12.09.2022 07:53, Juergen Gross wrote:
>>>>>> Add a helper domid_to_domain() returning the struct domain pointer for
>>>>>> a domain give by its domid and which is known not being able to be
>>>>>> released (its reference count isn't incremented and no 
>>>>>> rcu_lock_domain()
>>>>>> is called for it).
>>>>>>
>>>>>> In order to simplify coding add an internal helper for doing the 
>>>>>> lookup
>>>>>> and call that from the new function and similar functions.
>>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>
>>>>> I don't see an issue with adding such a helper (responding to your 
>>>>> concern
>>>>> in the cover letter), but I think the constraints need to be empahsized
>>>>> more: We already have get_knownalive_domain() and 
>>>>> get_domain_by_id(), so
>>>>> how about naming the new helper get_knownalive_domain_by_id()? And 
>>>>> then ...
>>>>
>>>> I explicitly didn't name it "get_...", as those helpers all increment 
>>>> the
>>>> reference count of the domain. And this is NOT done by the new helper.
>>>
>>> Hmm, agreed. But domid_to_domain() isn't expressing the "known alive" 
>>> aspect,
>>> yet that's relevant to see when reviewing new uses of the function. 
>>> Such uses
>>> aren't likely to make the reviewer go look at the function declaration 
>>> when
>>> the function name is pretty "innocent".
>>
>> Okay, what about domid_to_knownalive_domain()?
>>
>> Or knownalive_domain_from_domid()?
> 
> FWIW, I am fine with either. However, please don't replace 'to' with '2' 
> if you need a internal helper. Just suffixed with 'locked' to make clear 
> this is a version where the caller should take the lock.

Hmm - personally I dislike "_locked" suffixes on functions. If the
"internal helper" aspect is to be made more explicit, then perhaps
by way of prefixing a single underscore?

Jan

