Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48CD74DB1D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 18:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561283.877738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItoN-0002Fe-Ia; Mon, 10 Jul 2023 16:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561283.877738; Mon, 10 Jul 2023 16:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItoN-0002D8-FR; Mon, 10 Jul 2023 16:32:31 +0000
Received: by outflank-mailman (input) for mailman id 561283;
 Mon, 10 Jul 2023 16:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qItoM-0002Ct-AP
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 16:32:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bd8fd78-1f3f-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 18:32:28 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 16:32:26 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 16:32:26 +0000
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
X-Inumbo-ID: 5bd8fd78-1f3f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REwBkaAuAmlh9Zxeiih8UVPbZ331zPoLWFYU5H972waroBsP+Yk6bLD9LfONEAnQjUVzELcBjOepjOx+bcEZztZm8Ef9iT1NA2l8B7TOinshh7+onZWHASmNhV5VO7GVrKAxoHJiJboxoM1rEXMRJtO3Q+J5ge2gE1AKv3TlO9hAqz90v4a9ECVqvdMVIWKEAB+f38J+UxXh5G8By6HaK/0JHp+GXI7NVcvLgLkiShxS8wKGzQWqGqLzdRsHTP/QgdiHdHfWbkmWf7oHKwZR11rOhvXVsIVUKUMIPUY64GRnmOQ6wu1Z++sH4E2xXmiHwGvIwSJ9ZdOFwG9u3rU7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmJE5VhmAD3QWhYPKSl6KezIAwPCVORINXgmdeRzYG8=;
 b=dzxpJSZCzWYYwZ2jDmHM1Gu9p2YM6FBc4+yQvKhBmtTy8Tds9CP56gqfBvrFiGyJ3IMMqovkBrL/VsF++AJQmg259UHiYdd1tT5k4vG0BIJI1MrE33Z3Q3D6/ScHHHcsAQPC1UIuGe+N3787Sc5rNVrqHxU8cd2/h4HXKAZA7HBC4kIl03vd7flGPhrVLl/8Rn66JEe5RZhGfdpj8pCe3p01jNCe1Xnqt+U9yRx5QmUHpdE2y8F661y6L9JEIWpf1zAPsn1C2vI6p24H4yGH+4GtMwSHpTNWGTgtbVo/bppTPY4/s0shQGiaxLDUyqXDrKdZeq0btC6V18+gxDWzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmJE5VhmAD3QWhYPKSl6KezIAwPCVORINXgmdeRzYG8=;
 b=4ApaKR7CkrfLMSIUrE+nyMnjuug0rFpCNg3XirBUkSJcU4EACOkneE8tyYGt5PgrZahw3Sa7RVyPu6XdPHUsVrjK+h4lOFg0Xlp3EA7rqKnFcEgz3kQxbz7wdMHZrsYlBIDEA4Xb/NxJehq74wWkp7E07UvxpkjzpWcbg44Y4MXb0zxzythSY1Y4tjvTZWoviz/k6XIzLykIlLIU+hJsHAFZGrNOS4+ySp9pV1vWPiSlkjTwAVaT6B+QJVTUEnI+EzFYarI5TKIQctkMfAWyWA6DzzYr/FmJveRFhAH7mMueRfKxpNGBUNjJPJyuzra9nD3D6fKiTIiybNnmRcSXZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45c3a2e1-b3ef-55ea-7729-99f4ef4bb804@suse.com>
Date: Mon, 10 Jul 2023 18:32:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
 <e7d3daa3-7d5b-1c36-51f1-453bf11b55d2@suse.com>
 <64a83575.170a0220.2c96.8158@mx.google.com>
 <03e5e1a7-2c04-c991-e3b7-cea6916ec59b@suse.com>
 <64ac2df2.170a0220.87102.74de@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64ac2df2.170a0220.87102.74de@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 62593995-0eb1-4917-fee8-08db81633f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zfXUTaO3sKnRxLv90xCnZazECWSu2n0wBHBzvSVPnlPQV9MZ8Xp7/sFKOYnZ7mVSEGT96SQXhimsqnIPQfVZ7o1SPy/FvrPR/MCcH05TLDbl90PnX7N1tEyh84/l4qo3nkO2XJBnmeHcfsOk1cxH9+NjiKUY1OeT89Hq6eYOA2nBNa4CY1LTykieHIdDayyHVB/of5yBU4UslZ3534cfkPB4awyspa8rVqqfCW3z5EmC37bHKYKO50TorEsGmUfy0TjVFLmEDfVZJkeAFJrN8XRW3gwEWC/d6Fm/smW142nEd0DbA5uBKi75VTpO5uliFtYnyKkWYQubWOz306k0Y8dlKZSsZF2guav4HftvFirnjO1OGzdx6HhZVr8DoTAtJMdcaIMd9SCFKC1H50e5FS9My5vhw/BNiHraYf4VfCFfsPoDsNWM7bnuiMmmwGNhO257uVgCDkpqXDmpX58SiFBMQEhpCxeGuDrRv5MR0rfROvARh1tgjgWtSS6u2Dpoi9tkCmm722k0Gt6k+fWsBUoxT/oolYqZh2dk4PJ+7nBNgUthopTsPjTU2s+IdOfAmZpA8oYbxlLyhYJZkBGu9s7M0DWCI0u0ixyq4zlKPFUmgPdJl6W333sHx8ueu4a3/0zqoR3ncD7Mc48ytvvGjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(31696002)(6916009)(54906003)(478600001)(5660300002)(8676002)(36756003)(8936002)(86362001)(2906002)(66556008)(38100700002)(66476007)(66946007)(4326008)(316002)(41300700001)(83380400001)(53546011)(26005)(31686004)(186003)(2616005)(6506007)(6486002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZPYkQreG9nL3FoVTdnWTVVZlRVWUYxYlFyQ2xCQXJBK1FvcG1NMExFeUZy?=
 =?utf-8?B?THNJamFHUlVOVkc3TnpCUjkvRFN2S0JMcWhVSUU1emNRYUVtNUxDTzJUZzQ0?=
 =?utf-8?B?OWgwR1doZXRkcDE5eUd2UlpIL3ZPK1pwNkVrRUJOVkJQV2dLMTlvSldLZUl5?=
 =?utf-8?B?bFFiclZydHJ0UDg2bTQ3L3RhTUE2TVVDZ1V6Q1JwUkt0Wmk2YlZCMExaQWw5?=
 =?utf-8?B?N3doNzlNSVROMUdkazloREd2bWFFN251MDRJK3h1UXh6OHV4V0JMR3FuMEY0?=
 =?utf-8?B?ZmJFNWVzK3pyYVpKS0pFdVczdXNaSHVNMitNV1d4VVE1VzVYeGRXK1czK3No?=
 =?utf-8?B?MmpBcnY3em9vSW5HMVR4bkptYlBEUHV6VVQxOStpMGRLeS8wZStYN0RzSGRK?=
 =?utf-8?B?SFUwRm5JUUtnbFgwYWw1UjJ1bzh4SzdQcG5CNGorc1VmTlkvTEk5NzVYRGg0?=
 =?utf-8?B?SnZDY2hvYUR5dW5Wck5idnBxTEZnSXVqNHNQN3hkUFpWNzZMNmVaeFpzbkdk?=
 =?utf-8?B?UzNlUTVxaFhuVEk2dmcwL0xRWDIxcXJSblE5QmFIOG1xVUs0eUFrci9jSjRK?=
 =?utf-8?B?ZkRMTVRvM1NtTTE5N1FlY3NmNVBwRkppdlNCTHI5N0JhNUN6UkIvWmVwR2Mz?=
 =?utf-8?B?VVpBTkxKVW50dXZWU3pxazFJTHdjV3NlWUN6empuckloQkoxOFZHU212dmwx?=
 =?utf-8?B?ZUthMEZxeUdQQnY2OFlJOFQ1Sk9rYVFqZ1ZhSjNIM2RqdW9WYUtmVmpoUTFt?=
 =?utf-8?B?cDJUMVlCa29oVGM4bVI3eW9BTFlkZG8zajlzS3czTDd3WDBINE55d1h3Wlln?=
 =?utf-8?B?ZzZnbWxXcksrYWdwRy81RDRmaVhaaXQyVStzUjBmeHZGL1pkZE9DZTdpZk4z?=
 =?utf-8?B?V1d3VXV2dFIyNDB6VUJVcHBpK3ZLZ296a21FaEhFVXlVZ2ZXUGhPSUVwQ3Zm?=
 =?utf-8?B?MWcxQjFFTml4QjZqRFVkSC82eVR5OW02V2R2My9IRHpyWFZaVXVBejlZZTNV?=
 =?utf-8?B?SGhoYkNuejg5TVNjWDUzSGpCNTRpZmluQjJ6dzN5MVBYc3A4VVhVSzkrYzFP?=
 =?utf-8?B?VDZSN2N0MG96WGZRT2tYd3FXK0haQ2JzTUdDOHRIWVdDMTB0TTJMTzFhdGVW?=
 =?utf-8?B?WUsyc1ZxeDhUdkUvTXpMN2phOVBWSTVaQTFTeS9CaUVLbHdZc0lRSElpaW02?=
 =?utf-8?B?M3UzMW1HbU1tZ2xyOUdxYVV0VldxRDlhcEh2Mkd1Q3NUKy9QT281dFBNZGdi?=
 =?utf-8?B?VWh1UVFuNFdBUzUvUTg2bVdmTXFkNU0rMkJsQ0xXeVpBdkI5cDZuWkIrUk1o?=
 =?utf-8?B?WlZuQ1BHOUVMZU1teFMzS3BTQTVKOFNCaFYwN25qajhoMmxKaXhmUGUrUEoy?=
 =?utf-8?B?d05Pb29GcEY4K1VabFVwTzVRamE3dVNxT215SmNqZ1Q5aWlPQVJoVkU5TkZW?=
 =?utf-8?B?QkFFL3FCMmdrMkxSUDVZbURyNkZaNDN1em0vWVFDVjZDaHpUeXdJYjVjVnlt?=
 =?utf-8?B?eU5hazdKRyttNGh3azRNTzdCSHhBR0hpeU5BRkJzOVJoN3BSK3RiK0h2bXVs?=
 =?utf-8?B?RlN3Q1NXU1V0dUhvOHBSQ0hQN1VJTHVkUHJYbXZQNHpoaURpT1hwbmZXTExS?=
 =?utf-8?B?N3lNYVRma3pySkRRdUxFVzBmOHRmV3pWWFJ2aWZXMytWTmNGV0wvWWduU3ZE?=
 =?utf-8?B?OGNybVN4ZzBFRTkyTDJHYnB6cUZHclpqNkl2UDl3L0NrRUJXQTkvUFUrcExN?=
 =?utf-8?B?RkM1bnlQMHFYZE03Sm5qdERnQ01CeWdkNjhLNmNpakdNTUR4YkJZZERadzhv?=
 =?utf-8?B?MFI1QjZtUW9URjVwZXFna1dwRjFjUFhyNlFvU29xS1JMY2xnQUhMWWRld1Mr?=
 =?utf-8?B?eHhTMlRwVkl2eXljdCtkZi8ybnRVRXdlUmNYbVc0OUx2SVIrem1xL2E3WnBk?=
 =?utf-8?B?TWl3ZVBxMElNNE0yYmcySHRIa1pIcFZxaTJJQmhueWFxQ2ZNUGtJVGJRYkVX?=
 =?utf-8?B?OEhvMzV2MzRHWVBORjZlR3BGaVNzbFZ0U2IrMHRJRExrOEFWTGFReUtXSmtv?=
 =?utf-8?B?OU9nbkdEZGc0SVV5Ti91emJNOXd5c3lOSVB3bzJCWkRJcVFmc3F2MzBkMTlP?=
 =?utf-8?Q?3AbxBST2IENI4y6ZZ7Oe+JFxt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62593995-0eb1-4917-fee8-08db81633f2a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 16:32:26.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7cKi6OzMKDAfCzAFwzKqdOhnm72H0HrVNgSsbNnlZ32l3OAYow/yNnmt19hWnTNdKEbshjPuwh07IyCMNXV7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On 10.07.2023 18:12, Alejandro Vallejo wrote:
> On Mon, Jul 10, 2023 at 09:43:34AM +0200, Jan Beulich wrote:
>> This is ...
>>>>> [snip]
>>>>> + * This is where compression becomes useful. The idea is to note that if
>>>>> + * you have several big chunks of memory sufficiently far apart you can
>>>>> + * ignore the middle part of the address because it will always contain
>>>>> + * zeroes as long as the base address is sufficiently well aligned and the
>>>>> + * length of the region is much smaller than the base address.
>>>>
>>>> As per above alignment of the base address doesn't really matter.
>>> Where above?
>>
>> ... what "above" here meant.
>>
>>> As far as I understand you need enough alignment to cover the
>>> hole or you won't have zeroes to compress. Point in case:
>>>
>>>   * region1: [0x0000000000000000 -
>>>               0x00000000FFFFFFFF]
>>>
>>>   * region2: [0x0001FFFFFFFFF000 -
>>>               0x00020000FFFFFFFF]
>>>
>>> I can agree this configuration is beyond dumb and statistically unlikely to
>>> exist in the wild, but it should (IMO) still be covered by that comment.
>>
>> Right, but this isn't relevant here - in such a case no compression
>> can occur, yes, but not (just) because of missing alignment. See the
>> example I gave above (in the earlier reply) for where alignment
>> clearly doesn't matter for compression to be possible.
>>
>> Jan
> Fair enough. Then I think we can simply drop the last sentence and be done
> with it.
> 
> So the paragraph becomes:
> ```
>    * This is where compression becomes useful. The idea is to note that if
>    * you have several big chunks of memory sufficiently far apart you can
>    * ignore the middle part of the address because it will always contain
>    * zeroes.
> ```
> The details on when or how compression is possible are implicit in the
> following example anyway.
> 
> Would that, combined with v3, take care of everything?

I'm yet to look at v3. Sorry, too many things going on / pending.

Jan

