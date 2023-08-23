Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4788C7850BD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 08:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588937.920591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhZK-0006oN-TW; Wed, 23 Aug 2023 06:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588937.920591; Wed, 23 Aug 2023 06:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhZK-0006lW-QT; Wed, 23 Aug 2023 06:42:18 +0000
Received: by outflank-mailman (input) for mailman id 588937;
 Wed, 23 Aug 2023 06:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhZJ-0006lO-Lf
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 06:42:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 326e7fb5-4180-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 08:42:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8067.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 06:42:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:42:13 +0000
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
X-Inumbo-ID: 326e7fb5-4180-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etbpmJ2RT7Q56v+4cLZKTZcyAb/dnDNJ1O3ZY50fOS+Jc7NbSvg2HB5Tt2iOomr9gvgd1ilWTSk/RvN7CmWylYoz6RK6F2FIQGMfM/RjgZu2ly9bORThLkVLbaslQoE5ZPUewaCgQBeIhPiSjhVH6JtlbY8lzSBUH0A4eTH5XoVVfrgaIO+1FVXhHn5IWlKpuWtMvSOln+Fk27Ba7UtZaQy1r/RQdOxoOTsgvVP14ZbkozsafP9DxE2kKJa25ieObK1J8Cr4rZBoZas2p0y0HmD9zWEaRaTzE8vgHlZNeCns8u6Rm9hXA+nCij7vTGR4Fw4tl491ZcLovYW6RQ4MKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phSsjkXKzy+yW2tsv7VHKyg6GR6ls6gy0kdRJtNmjPk=;
 b=l6wuSX/nilJ068r5aCZOSsFSyDJZSyKrVH29RKyfwop7GPamZRChNRI1GP9crPTgGNzIG6Gt1TqjOjifSMjrzrAwiF3XvcyJ3Fniiweg7qIN1oYFhH3fYrE8wQXjonGTxftXZ+xEMr8CYI/M72xuqFJDLhwWf/ikTFF1TLDMgykfLpMRPaTVMomTfBw85XzqBQQsIdJN0Wzx/eDF4wM1gq47srH7Ou14NKe8NjmCIHE9VXMzrMKZ3VDNZSg1KRZg1R7gLx/+dXMNMTVg9tqTQ3nty25zVwcj69byV1uhhdwd5Iu+WjXES+Ae3C+j6g3/7hFLxQX4ZiLY00oNra4f6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phSsjkXKzy+yW2tsv7VHKyg6GR6ls6gy0kdRJtNmjPk=;
 b=RWGY4Fn8M54xR/EVi/cgHZP0Xftho6549zA+KK6376WgoY8Y5F+u5B+jrj7NR2oCflBoqnEXpRT5VSRvq82C1ncsyib34wEOWjwLWbKcPtX7lBaqWzrjP0htznr8wI9gKzTtiGrsGgX+hcb3TsE4FeIicN+RvYmIqc6nsQPOt/IERypEqRiDLcx/VOT5CRxXB84rPmMemCV2II0k2MVCjqJB0Moy99ZzO+sii7b14OdK9WUv2jofy7gRFkc8YYnCcCXP1EZGbIyRlL8iaQJmkSpxriMmOfbUF4SX+BP9dyrhNiu/AXtcGPcFAYD5vF5Vz78nLeQTl3ncZ/K9f0XIzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d78fbd65-008b-ac5c-4459-86f4526f814e@suse.com>
Date: Wed, 23 Aug 2023 08:42:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add exceptions to rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230819012410.1754839-1-sstabellini@kernel.org>
 <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
 <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop>
 <89c57dd1494de14168dc0c7f4aed959e@bugseng.com>
 <cb10f21e-afe4-6593-f10a-fefd1731bf90@suse.com>
 <alpine.DEB.2.22.394.2308221715290.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308221715290.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce7384c-9b5b-4b99-08b6-08dba3a415a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VX/GXAmrz5eCZycuDIJoirh4PZRRsg1JrKlw4P5iyVoLhGy3ZLKl97HIgTzdJkAHCGSxAruLfC3XcU0I6Rp0Rp6M2lMuYrWAhF7iDsxOcC1Y3Vm2MMCKvQnTtAJaowwwGbA8BXbUxgmwNvBSgDL5QH81n90FGfezvksfqvi1PKUEXNQKDPEspbQxpuK+PVY4HmuoG8brurYGmDixhouLckgpHlQ2vkIC5+zA4IxeVMnBnbtvpIKFjj2aPItQ3H84TMkif0LPCFS5UJZ35JC97um95O4WVGqilyV1I7DQsnqNpaSCkeY1IHo9o9udKqSefsdBI+AfXn5GZfae58KjEEcU5bYvRD2cXtXnKcAkjbVhKqBBF06oFjB9HMouGF4B8sqSRvfsnSdSX1jOPSJP3YDJMvl1FnSc/dT44iLl/m0tXkkhbLYb8E57KA9wbYrsofQEkRQfAxBmKu3nKy/ENex8bzLZMDrVgxZJIACKEHEXEEJEbONzINm+4mBgtDldJqOXcyuWvuM7Lc6nYiHMQ/w+YXwRDycB9CWrJbYWcqYU3jo+5I+xnpvEQBoaocmCagIO8M9BoJVh933ia/C0FE/+I/6halDorBMZBnbptbiJjFWGYcIKd+AbxbVzqDAy/b371t/s9i68PBYvM6f/7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199024)(1800799009)(186009)(83380400001)(2906002)(6916009)(316002)(66556008)(6486002)(66476007)(6506007)(54906003)(53546011)(66946007)(478600001)(86362001)(36756003)(31686004)(31696002)(5660300002)(26005)(2616005)(38100700002)(41300700001)(6512007)(8676002)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGxyekkzZXNZT2UvSnB0TlBYMFY0MDc2cnNpWW1BdHNNRkZTbVZzL0pLSTBT?=
 =?utf-8?B?WUZyR2t4MExWelA0anBQTFpGUmhKbUtqSm0yTmExcVJCeDBaVld3YlYzYU8x?=
 =?utf-8?B?WHQ1bzkrODZrelpTYlQ0K2RjWXcyWmZVMkUxTVQxY21XWTBMci9sZDZDeVIz?=
 =?utf-8?B?NTdYL1cxTkYvQlhIME9UTGR1Vmp6cEkxNkYxY2Y3VUw1aE1ScUFYOVp3VDFn?=
 =?utf-8?B?NmdPV3hFODlpcEtoK0dKK2VZUHJjaHRlR0ZPV1pBT0NBem94VEZITzhUUUhD?=
 =?utf-8?B?SUVWd0RqYWRoWm1TcEZwY3FpZVlKVnFabGMxNjJua2ZaQUYvYk95VlRyZVc4?=
 =?utf-8?B?UWJULzhxUW9tYU8zdUE5My9uSUdWYWk1dEJ2eUZHUVpHOHVMaDBhQjY3R01h?=
 =?utf-8?B?VlRSL09xWndsd3g2MjVadyt2QmdGZ0xFeWprRWhxSmZoQys1c20ra1lqZVB5?=
 =?utf-8?B?Qmxrc1EyOWlPZ2JsRWJnZ2czdGp5K2RoMjhxRjNscGt2OEZQM3ZQWnpXWmxk?=
 =?utf-8?B?Nk5nczZnbFlLY1grMmR6eFUrYnlTMDB6K21ncXlWUnRnVWt2b0lRbi9TSmU1?=
 =?utf-8?B?WSthSFl4MG9VcDRqRGlOditsbHZFcUFvZ0pWNWpzcEtzRXNXMlljRVRJU3Az?=
 =?utf-8?B?aFpzd3M4ZHBrVHBSQnJNYzhMZnpQSS9VNWFpNGtxZjhwMkh2UG82aFowQXQ2?=
 =?utf-8?B?SEhzR0hOUXJSTHhHbGFCRExTSHRNNGVxTnlxc3IzS3p5bEVZekNCbi9peW50?=
 =?utf-8?B?QU1VcTlzV1NHNkZ3TWtuRi80TGxyQ2lqTFBibnd5TGY4amZXVktES1k4dUZX?=
 =?utf-8?B?SGp2czZtWVdvRFZqV0ZqQlBxc1RqWHFSTWU1S0F5bVBRLzNsT3doNCtrWS9O?=
 =?utf-8?B?ZGFLdUVpVm9ieWNFOUdNV1RPM2w5UU03UjRxVjdSWFhTYUJkNVYzUzJFcURt?=
 =?utf-8?B?Qy9WZm9uWGZiaXQwcGNUQkZmNHJwTDhyNUo3RE54cVFNUityTmxHYmZxbDJk?=
 =?utf-8?B?Y2cyZ3RHbXhjKzV2akhsTzcxemdkY0IwY3EzN0FGZjY3NHVMVWx3YWdubVUr?=
 =?utf-8?B?V0R5U2Y2cXgwNzJjaXJ0REtuSHRHcDJmcHJkS2pNekY2cjJxbmwyQk1UWXJZ?=
 =?utf-8?B?cHpKZUZjZEw3Tm8yWjJNRHVRZXlQaVVmdVNaT2E1NWhxUEpTbXAwZTloQm9z?=
 =?utf-8?B?TVZ5aEdkY2E1M081S2RCYWFoOXY0UERyTlh1bkN5SXBRb3VxK0hrZHd5SG4y?=
 =?utf-8?B?TzdMZVhrZEFaaUN0SEsrZmdKZTBKYzQrdVplZFpuN3ZxTHJ4bGtUS1FNZ0h5?=
 =?utf-8?B?MXFJVDJoK2Nxdzkrc2F5S3RMRWVPWElZdEJUT2hZemhBdWx2blhoY2FTZ0hn?=
 =?utf-8?B?RkVDTHphL1lVZndvdS9BV0NScnpLWU1zd1F0RUFUbG55bUU1ZlB0VFAwb3oy?=
 =?utf-8?B?QXhNTVhRajFCS3dFSXRMRGFvejNkcDJtTDV3TnBSalRRbG9KVFRac1Z6K0tp?=
 =?utf-8?B?Y1dwdnFweVhjYnNnZE9JdEkwUlFUbzVESlpySmN5RVByT1k0dkxlOE80ZElm?=
 =?utf-8?B?SGo0YkVTZnlvSjBYMEVDemR1aXRGbHhFTVJhbExEemFUVU5VMTM4alI5b1d3?=
 =?utf-8?B?SlZaL1BxRGRWVUlYQ1pYdnpreXdiVjkyUGVWZGs5bVBEZElTMEd2Z0t0Y1pj?=
 =?utf-8?B?NzlXdDIyd3YrWXZPMlNGNTFBNHJZalpDb0dRMnZZQ1JXTTNCTzVqeHlMbkY5?=
 =?utf-8?B?WExYcGp1dHhORm81UjhuaE1ZYXZaT25KWmtzWTVva3VMMUE0czdwWjczbjBj?=
 =?utf-8?B?OGp2ejJXOEZ6WkZRYVNzZG5EZ1grV0ZRN250MmxndWtocDNCNkVrbDF3Q3Jk?=
 =?utf-8?B?QWNaQ05uSnhDSU9IQlMxQnRzOFlwell6T1hhbmdqNEU0d2pUZ2JkRHlEaXEr?=
 =?utf-8?B?ZDN5cFhTQWtJODJBV0NIREJjVldmOHNYbmFEdVllMVlZdlZzc2svMVdSekRD?=
 =?utf-8?B?VHhBVlRTcEUrNWtMdFFWdVRTOHJoTUVBd2RFU2JzZkNUWDVud0pld0I1NTEx?=
 =?utf-8?B?dWplRVd0aCtqMHhYKzc4SGZuNFF5UENhdFBCYU9lYnoybHkwaU1KdVp3Zy9p?=
 =?utf-8?Q?Bh77IAotL2vd80+xaiD+pF6PJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce7384c-9b5b-4b99-08b6-08dba3a415a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:42:13.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+W2TNgI9yNQmzdgxiAciszdO9WRXEK9+pCfFstnsk4yW1b0xM62gFFJhwiU1a2sAHcihp+xOoidXHfHdZmGRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8067

On 23.08.2023 02:19, Stefano Stabellini wrote:
> On Tue, 22 Aug 2023, Jan Beulich wrote:
>> (re-adding xen-devel@)
>>
>> On 22.08.2023 17:09, Nicola Vetrini wrote:
>>>
>>>>>> +         - Switch with a controlling value incompatible with labeled
>>>>>> +           statements
>>>>>
>>>>> What does this mean?
>>>>
>>>> I am not certain about this one actually. It could be when we have:
>>>>
>>>> switch (var) {
>>>>   case 1:
>>>>       something();
>>>>       break;
>>>>   case 2:
>>>>       something();
>>>>       break;
>>>> }
>>>>
>>>> and var could be 3 in theory?
>>>>
>>>> Nicola, please confirm.
>>>>
>>>>
>>>
>>> This one is about case labels that are statically determined not to be 
>>> reachable (and hence
>>> saying that the code under that label is unreachable is not inaccurate) 
>>> because the
>>> controlling expression of the switch statement can never have such 
>>> value. An example below:
>>>
>>> $ cat p.c
>>> int f(void) {
>>>    char c;
>>>    switch (c) {
>>>      case 260:
>>>        return 260;
>>>      case 4:
>>>        return 4;
>>>    }
>>> }
>>>
>>> $ eclair_env -enable=MC3.R2.1,B.REPORT.TXT -- gcc -c p.c
>>> violation for rule MC3.R2.1: (required) A project shall not contain 
>>> unreachable code. (untagged)
>>> p.c:3.3-3.8: Loc #1 [culprit: `switch' statement has a controlling value 
>>> incompatible with labeled statement]
>>>    switch (c) {
>>>    <~~~~>
>>> p.c:5.14-5.16: Loc #2 [evidence: integer literal is unreachable]
>>>        return 260;
>>>               <~>
>>>
>>> This is also true for things like
>>>
>>> switch(sizeof(int)) {
>>>    case 2:
>>>      ...
>>>    case 4:
>>>      ...
>>> }
>>
>> Ah yes, we certainly have quite a few of those. Not sure how to best
>> describe such for the doc, but what was suggested (still visible at
>> the top) doesn't get this across, I'm afraid,
> 
> What about: "switch with a controlling value statically determined not
> to match one or more case statements"

Sounds okay, assuming this is the only case we want to treat specially.

Jan

