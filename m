Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F83690267
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 09:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492247.761696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2a8-000227-3Y; Thu, 09 Feb 2023 08:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492247.761696; Thu, 09 Feb 2023 08:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2a8-0001zI-0a; Thu, 09 Feb 2023 08:47:04 +0000
Received: by outflank-mailman (input) for mailman id 492247;
 Thu, 09 Feb 2023 08:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ2a6-0001zC-6W
 for xen-devel@lists.xen.org; Thu, 09 Feb 2023 08:47:02 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50e38231-a856-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 09:47:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 9 Feb
 2023 08:46:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 08:46:58 +0000
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
X-Inumbo-ID: 50e38231-a856-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIROl3lBXgzQXOB2QTBsgAteOzTqqPgeI3JKfwFdaG7nSe7q+4r83QKMXXCes3mYDypfHApunULfC3VCUaS3Sip/F5Uji+S5sGsyy3nsQU+6O56BaxcR7XVJHzriMlFgEHoDtu5Qg+XDhpdJUj73RXIBh+xdYsLs/1Nb6pfefuhHvTF+KW6hKfJiE24J3oMFBCBySPDT7dCzG+VFx13ad+5lJKYoM7T6rBqDFrwUKQmgyjzXD9p5/YLD0+7lCByoBwbwoPTr+tbBS3IBPT5Zs1EottM1dc9g1Z4JTsF7qZGOUSuJRPbGlC8XvnLAGwRb6yB9arWK75PHlb8S4JhSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMwvSSS0gF+lZ/JTBQIWgHHwuL56XGrlMC/d6GqnOD4=;
 b=AVyGEYpWavzKzfnBFZiTGCH7PVRYtivy2NeXN9sIrqGhzzKk8aOxPJKUP1naggyLRT+97tkjb+Mt4IGQR77fEbuHigWKA/BGJajI0Z5rHiNWDQP9TVju2TSPsCTBJamnvbrsZNRwIzCUcS6+ObVmXxx9QHtJnF5dk4KUqTTRx2MuPgvjbdUahzjWg2ffoYQS/R/MQBBALBVxfolZxBZclp3GftpAtMOixkIFH76zjKym9BH9DrOZx65s2+9QwjzATVZ1A41ztTVWV2hZgJbWXcKzUs7Jl8lhsJ5H39hSUFchLAfF33IXOQ8pXYg+yBgID7n2aHrECknanjbr/1HuNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMwvSSS0gF+lZ/JTBQIWgHHwuL56XGrlMC/d6GqnOD4=;
 b=XeRvhA6gg5QOq9KdLTsBdUWUQv7HbKqGaKySMC+YTI9xwP0S9nG7k2Yjc3H1H74Sy0XjCVY4lA3oQnChupXCBef2yu6YGQPIYSQfRA/zXDw9BxmR5BiqQIrx2Cw0jot4rjLWxsELi5+VX546BaEXCtsGQcjlTuLaEUpSgCdTO+G5txmKurfqBP1/PU3b0+LKkAjVfax44zNwuLJBLntkUlhpzrCYUykekE7h+bx3FffPUSSTUbPfsuIa0ve3siE2lhSgR90OqabaAShSy52XfGulvOssHG6+7OKZeuZToRjpXSxXnNtG03auO3mkrMpIHpMIo5jEsSJVif5/o5PGRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fefaa0aa-6c94-021b-f609-95be9e7e1f7a@suse.com>
Date: Thu, 9 Feb 2023 09:46:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] create-diff-object: Handle missing secsym for debug
 sections
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, sergey.dyasli@citrix.com,
 xen-devel@lists.xen.org
References: <20230208180457.800671-1-ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230208180457.800671-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: e18371bb-9021-400a-20c0-08db0a7a3460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLqkRBA4CpDgwHS6aTWj7amyXYsu/Myhrzv36yx4R4nLNrePKfhUHAYE23ymsHG56f1dmVGxuLaN3c9iAbkS34EBCYjBiY87hCfDVT7S/pdWjVU7U0+srTzKKXP7KuhLuISBkSBF1XPaHlZKLo8MbMzXzZS2kaENNtSg6nJIFzow+xNIh4uWPNUGgv5ISy94gBJ+bdmJb4wYvUYblWC64Rky0OS0xsT/zXahBao9AgnFKEmf9c/yH5dVcjhYpmIHkcA2e6RZB3ZgnC5W23Rpy9kRF6ukK+NvQqw+0iS4kTrswdA6/5E38sZsNvRATvnAJuTc5s55hhvsQC9upg5gbaWuC63S62229ezl0kSNx564ryQ1iHS0TVCqPn8XLc1Tfic6VmFhS/Xdfp7HXEQwzRC2wAVIWY/I/HFaLwljdq0GR3J/mY6jI41hfdgkBveF1zvD5Z5SbTRkfhRIO/Du4WFjLMXH24k6DWp+Yiw1ee+wp+66FMQMPtBAJUcA3ZRtcjsSRUEsAmBTzsDBLGibM0+HcfZBZgD7n51nPpGqDOkOHr+2GctX3wlfWVn6INjzqm62Kba3Z+ZqteVWzAl5fHYa9+Lh2GZODr7uM7/8EWbspXn27RNrfElTRZySjUGsM1C//ix7a7pbioUDPRzR6kex/+DHKBNiEHKQ4D04nxJaau3zY2dPDEs/JAplQpkT8AqMwGxANxfQPeUe69bAUaZ4IPxN4gFa25wD7KEoeWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199018)(2906002)(31696002)(5660300002)(38100700002)(31686004)(36756003)(6486002)(2616005)(86362001)(53546011)(478600001)(6506007)(26005)(6512007)(6916009)(66476007)(8676002)(66556008)(66946007)(316002)(8936002)(41300700001)(4326008)(186003)(558084003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2srNWVMWVFWMEMwKytrUjkvTTNOa3hIRHhmSUJYdmZ1U2l4aUhIRkVOSGlV?=
 =?utf-8?B?bFE1VkhhekJZVmpDZzZVQnJuemlIZDZFbnZIYWZVZmJhVG1uZGo5UHZmbEpq?=
 =?utf-8?B?RGtqeDlTS21ZaVlGQldxK201YitEMkZGZmhlYmJUYUxGbXFQK3BibVg0RVpQ?=
 =?utf-8?B?dUpha0NtQnVJUGJCUGFBYnRDaXQyaExzbUJQU0tFWFVsRmFyeDJpVkh3blM3?=
 =?utf-8?B?NUU5bE1VWWJjM01wejF3SVRJdDdJbnV3M0FyYkhEUHU3MTdZaTN3RmdYOTV2?=
 =?utf-8?B?aE1seFpNNG9ackdWOTN1TzVRazU0VjFTQ0Q2SXJXTlVLZjJpZkRBeFovSXNP?=
 =?utf-8?B?ZHJIZ0FWZkQwZUs2d3ZNbkdTREl1bmVWY3RyTFUwVHo3NDZVRWRoY2s5NTVS?=
 =?utf-8?B?ckZGanp2UjAyYVNNVDFuR2hZWUtXVkhPRmlQSmJqbDQzMnB3L25vYTRMbVIv?=
 =?utf-8?B?Nnk4ZGs2QTRVM1dQN0U0bE9TcUFwcFd3cTlINThrUEhIcS9jQXJKcmlIUHJC?=
 =?utf-8?B?TGxZTHRrK3F3UWpadmdZT2NVMDZiQ2hnN21pemxqTXA1ZUFDWW5UTE9LdjJy?=
 =?utf-8?B?Z3JqMU9oZVRHRVlmWUc4UXJnb0FjWVF3dEdjWC8zK3kvWlFwRHJuZzhmUGFC?=
 =?utf-8?B?ZkJoV1NETEtNVDdvOHhJLyt2T3ZBUE5hcHVUNWF4K0xZVjRZUkREVWxrL2VG?=
 =?utf-8?B?OHcrTUkxWi9lNUJFVFFnUGRCQ0xRckhiRTJtMzlHS3hlMW9kUzBldXA1VVhM?=
 =?utf-8?B?MDFTOFNWeW41WGowQXRzM3VGNFBGVVp6L1h5RnJBb3gyYS96L3VKcGdNcWxJ?=
 =?utf-8?B?Rm1GZzVINCtHSURRZzU2bXl1Q1YvVjFWLzMvTERha3Q0eVI4NUhHSTJYYjJN?=
 =?utf-8?B?YU9vNm5wWHRBT2N5TXI5QXdOUFh3RitnVGdoRFl3SEdxa0pvbDlFamxGcllS?=
 =?utf-8?B?bTF6OGY0YTJNQ2hjQ0YxZVQ4S2d0Umg1U2l5SERTSEhTUEJBcFZ5UGl6aWlQ?=
 =?utf-8?B?Z3dzcVZyR21YMVhCTTEzTkNBMjBiZ0UrR0hVeEtDNXFOMmZtR1U0WHhzSmVQ?=
 =?utf-8?B?TVljdWZPZ0FUbzFzZklpSHllSTVnWmRxZzRYcTAyVGE1MlUremcyV3o0MU5J?=
 =?utf-8?B?NjAxWFp4YWtPMnpYaWxMNkI0RitEZ3UwQkZ6UkFQVEltWWpmY0pHUUlpa1o0?=
 =?utf-8?B?eHlyTTdGcjl5N284YXhWc3pLYnllQWZmS1dISDZlVWQ1TjE3VlRRY0lNQWp5?=
 =?utf-8?B?ZTBwb2xtVFhoNnRWNENuenc0SFdhdm1yZzBKYW1heHFKZzc3SkFwN1dYZDJT?=
 =?utf-8?B?TDdqMGdFejB2Smx0SlBGUy90TCtFZzZuc1M5dGJOUEtVcnd3OG44L09NZDB6?=
 =?utf-8?B?NE1QOXJ5bEZKTUlXeXlpWW9MN3FzbjlKNEhPTHdkelBmaHhwTlZQRmNtempq?=
 =?utf-8?B?TWcwWnplSkhqd2FCa0E2KzZHRVFDSTE3WHFhTmh2K0V6bE9vQXdRNmVXaTFS?=
 =?utf-8?B?cm1kUTU3MXlMRVhQV1lqM2t1QlJtMDBxVEpRVG9UZWxnMjZPZHptc056eGxl?=
 =?utf-8?B?WkVBV2N1OVJBTEZ2eUwyMTFuYVBWcFVQR0tFOXpINkx3TFo1Q2NjaWVqUzJP?=
 =?utf-8?B?STdCd1NrUlNsUkJTUGZoS3krc2VuV21uZ245OXpvUXRjcVRhSnQrNGpGeVQ0?=
 =?utf-8?B?U3c1NlhJSTdDUE1XTGEvZXhndG44b1R2dHBvNmZlZ3c1WHNWQUE2ME5rUVk3?=
 =?utf-8?B?R0k3MHlMNDVKc21ESkxvMUkvUnJQWUFEUWsrREVpbURta2Yra293ZHVNUG5z?=
 =?utf-8?B?OGVJbTQ3Zlk2WmFMaldqQ01wTzVDNUd5SENIMG5ndHJmZnRHTGhrMVlzZm5O?=
 =?utf-8?B?cEJWeHliNEgzQ2w5RXFncUU5L3lreFQrc0FQeVNscWxLZnJFTzIreVdjaTQv?=
 =?utf-8?B?dmxwK1dkQlh5NklmQUZVeTBBQ3pUc1ptT1l1NG5RczJhT2d5bGtSd1BDRnZU?=
 =?utf-8?B?TWpHdWpna1IrdHNsa0lKaE9XWTl6NXUxeXZYazZnZlhWMVd4SkhKQ1IwSDRi?=
 =?utf-8?B?akNpOE1aQmI0M2FTTTVQZFg2VWhqY3FNL2IwM0ZmTFRuRW10WFl6LzZ4b2JO?=
 =?utf-8?Q?tjR2Yo7kP4dkeWPU3gxloKjAB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18371bb-9021-400a-20c0-08db0a7a3460
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:46:58.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PC33GGiSzmbD/B2UYEv8Pp9H0YBCOwbxey31dEa8iibPTOIGJO0CHBddK/8UCRiSwPmC96a+aV2dYh/sxIcayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390

On 08.02.2023 19:04, Ross Lagerwall wrote:
> Certain debug sections like ".debug_aranges" when built with GCC 11.2.1
> are missing section symbols (presumably because they're not needed).

Is it really gcc (not gas) which controls whether section symbols are emitted
for a particular section?

Jan

