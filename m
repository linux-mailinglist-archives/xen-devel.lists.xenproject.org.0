Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9558D644553
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454929.712528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yd8-00029c-FV; Tue, 06 Dec 2022 14:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454929.712528; Tue, 06 Dec 2022 14:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yd8-00026F-CP; Tue, 06 Dec 2022 14:09:06 +0000
Received: by outflank-mailman (input) for mailman id 454929;
 Tue, 06 Dec 2022 14:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Yd6-0001q1-Vf
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:09:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a1b1acd-756f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 15:09:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7398.eurprd04.prod.outlook.com (2603:10a6:10:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 14:08:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:08:58 +0000
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
X-Inumbo-ID: 8a1b1acd-756f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv6/uRAbary8Kd+aR1bT/bMe/6jpBVbP/cifv9tBmSFgJh/bBGEFUEV+AjAHwHNiCDZk7/5M9cXxGpSFwu2P4KZFDg8ALfP8jWbuLbPy75GzRZe8qvPl8hRQRnoBqxK5Xjx8JXZ4aZJj33gAQwZzJ4ilpJ3syGUZL6//khtAtiOevzJ2S5xxJrEkVOhAbaBxuTbiYO3IqoFPGnkBv+qSDUi+BBFZywnxiRoSgIIel3zdllq7d9OFnv72LSNH7HY/twMSINm6JKxrQHUqGhjWlKqg4YVN8NvwuKz4J+Lj3uK7YAvenGGUmsH5zUPdb58JDsVIGX3GJIfsf99DSYA+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hxERaxNNSTSSoFJdRk1K9m7CRtM30+s/CnjYtwso9c=;
 b=YOcvLl1vvkLKQWIEpF4QvIfkn+KXeNwt4MGFNYTyR7vsMv5Tcys3BBJpZqGTmLgvvfdf3gbX9Lq4V8LC4hlnhlMcI75cVASV0+vBA7c9f0EtDIp02bXHuh+8uoPiY6xeP+9f4Pb9Cb09ispunFHw/NYzoQA7txfK7C5O3lqMggaobjMkY17U8UO+y20e6nIxRLKCXDunFF+09sKx/Z+qg7sR0zINYEpOXH5AkZOxJHKIZ6ZPI6W55DSn+ipEg96noCZL56Vh8WgH0R1fDm9VZAmaLNciol9UTwD5SM8NRf+0vgB87FUfrZYS6G6Pm6kB/I3zwRcFrDTTlPXl/fCWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hxERaxNNSTSSoFJdRk1K9m7CRtM30+s/CnjYtwso9c=;
 b=d/32mnM6zNuJodJalE8dgv3IcHVlCmsYgi6TKJJJFN7qbysDXtoCUI9BZovKvwMs45hrS/rLrg2qMPT/odE+9X4ia7jwBsqgtvRHtV17L/mp+YpyyOBfQ759lDgIaX0mnJUmFZvvFlRiqy3FgIsxfewf8YuIShOsYvBplG/uwcNVxqy/LdLcfstLqMklgzoGuFna/QvAv0Tbn5MLvAlhwBc97mqJ7kmiwwBSsFTN/wvR6dbEjfi0gSwunQ7yGNwLFz4dBJ16MBgDX3WK7Zwbjjul0bYpddZ3+ClPJZLZCG/vSthk0bEtulz1CDF9LayJcq0zKHhrlQG7QbCI2tSfsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d548ee9-dbb4-6570-7a6d-eeec03a69be5@suse.com>
Date: Tue, 6 Dec 2022 15:08:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen: Remove trigraphs from comments
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221206105932.11855-1-michal.orzel@amd.com>
 <0bfa1b1b-7ae0-03c9-0291-5ce3f6877693@suse.com>
 <92cc2cf3-4c95-1395-be2c-d076fa5d397b@amd.com>
 <cf7f8deb-ec5c-c6ec-ba5b-b7099830fcb9@suse.com>
 <4adcb0d7-1f94-231e-9dc2-41dc3b45f949@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4adcb0d7-1f94-231e-9dc2-41dc3b45f949@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 185e1380-53ca-4d79-d4aa-08dad7936af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H2ytLuKmNg/+rpH7kgbTwOBZZ8d5bqcBxG+94zq3eBFGGcS0q05xQfVtsEVo1onWW3gFMRphRRKnbckMeukZLEUJU46VkpPCr9hJ1cBxJ9XI43Uhbj/Dsf0qP6tWJJ2t1xjML5RYDLhAy7F92kWYRIu7KE6psYGrihliEjX0R/oQfMEc0S4Xuv/sKXWZgYF6iuBPNnN3YW6q5DAJ/VFNmZw8tv6QsnrrpN6HaHR33XKDBiqnwNDLkZtLRuqCZoDbdshIY6lt3Lk9aDWwP8XVOzDNbiNqUA6TzGOY01tHQnwXasgs3ZepEqGrQYBdpE7kfwWpdzug2XvG+6OeH6SSrKDQKvHFDd7rn/7qd/UnJfdVX0s2FIH2Zf5j4hHSOAcg15lETdeSQo/0CY8N62IRyDUhUSPi/4D6VVjV78vegA9iN7AB0G1/0dywwHLcoeBB6fnJz7ZKVzIFvcgX/9xy0ZZfczsHBO16ASZakO9F32u924VlTkJ5EC7V02VhxRyT7wNj6U9xM/JGCmR8h9MZ5M+n7FsvZLVFHwYoBtT1JjpoZnitnR2g2/s1ZT1VRvXWyicTBosFRY1PNqd4WUni+bx2kf1Y2ytatz90MT+Knf6I1re4/tggr/ACl2T8YS5v2frj42ilA0ZbkuhMZbocQTNFIS1LdJXAOsIliqoQnjCBPJ2kgp3iOVkDNct/qnbilG+rwng+cOC37DLuXZm2euQ8bW8BMvTPF2Cy9HB+lZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(396003)(39850400004)(136003)(451199015)(83380400001)(38100700002)(86362001)(31696002)(4744005)(66946007)(8676002)(4326008)(66556008)(66476007)(8936002)(2906002)(41300700001)(5660300002)(53546011)(6512007)(6506007)(26005)(186003)(6916009)(316002)(2616005)(478600001)(6486002)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDVPWDROZDIwVDJzdWdNTURRbGo4ZTg4WmpqVWZXMG8vdlBCVS9IMzVUaVo1?=
 =?utf-8?B?SkVOMDROWXFiMDNRZHNHZGtLcGRsSFZ1NDlJMDRrL1kzYlJyMld0Yll1OGRE?=
 =?utf-8?B?dUJOMndUWC80QTNMOHNWMFRUaXB3bExUcUVlRmRtWkJvU1hBOE8vLzZ1T0Nv?=
 =?utf-8?B?TXRTWGVrcDhVWFJ2eFVVaHdnOWZBOVo3ZU5IRllEWmhLQzhmM3Rsbzc5ZktI?=
 =?utf-8?B?MTU1MklaWGY4d0xLUGwwSmg3Qi91SXdoQjJvd29hbVlKb1NFWUJlVXNNMFdM?=
 =?utf-8?B?NkZJZjlsY055RE5rT1pxUDhJQVBNY2oxdUgyMGN4bU4rblk3OHl1TEtqK0c3?=
 =?utf-8?B?TE81N2ZuM2sydnd5Z041ZE5ya0M2SUx1QUdHRHNhU2hVd0lUbUMyY3N1eFlx?=
 =?utf-8?B?emJxZEt1WUFvaW8zKzhLMXRKUGdUTUd0V1QyMWd0dHJZMlNGZ0JIM0pjZVFv?=
 =?utf-8?B?N3VuS24xd3pVTlR5RFdGK2xveVBFUUYyT0w0WW1JUE1aeWFFL0tuVGUweUJN?=
 =?utf-8?B?eDNUcjhkWkpFazFLU0tCcmlSaXVsY09pK3ZFYkh5WVU4UE13Tmp4R3A0Q0Js?=
 =?utf-8?B?NjdiZk9hSE9TZnc5OU4wYjBoWE5oSXdmNjRjTVFvbnBJdy9yTHp4OUovNmZS?=
 =?utf-8?B?alhtVVd2RFIvQnVSNFAyS3FVK1lCRzhKNXJ0WWVYZk1aK1J0THFldnRkOHVY?=
 =?utf-8?B?RTE2QVVvcXN1VVRQcDFMd1dJcitPd3hzczcrYnZaNEcyRDB2RmJmZFhxZnAx?=
 =?utf-8?B?OWZxcFdVZldSYjZJT0xhS0cyYVRCUUdRRlpYUEhFQmdxeSt0TkpHVmdJRDBB?=
 =?utf-8?B?S1ZYQkE4dDE1WkFWWmdvMnl1TXVuK2FDUlEvNjF2R1JkeVlUUU5XZ29ZaDZC?=
 =?utf-8?B?NytOdmMva0lQQ2hpeGk0MXYwc2hROWtyNXJodDA5RmZwMEM2S0tlL2RyTkNE?=
 =?utf-8?B?RVVZOHBRdDdsdGJwYkFpeTFpaVlrRG1QY0drK1ZSbis1TCthcmExUGhuQzFr?=
 =?utf-8?B?RzlOaldyd25MUmNlUTJQOHlnNEhYT0w2QUh5SWpidXJsR200d2wwN1pOTmdx?=
 =?utf-8?B?azhOQ0JEWjRpZlppTEQwRGs5cDQ4RFJDcE9SeHNOUGdWd2NsZ29zaG1aT1oz?=
 =?utf-8?B?Q2FIM2V0ZC9jejR4Rm55R1dDSFhIRjBFa20yT0FUaEVCRm9DMWdlSEp6cmJE?=
 =?utf-8?B?dVJIRVJaSVVIa3p1VnNzUkFJNWlUeENUN1JtSVdpZEkzY29ncE5wTmlic3dX?=
 =?utf-8?B?TWRaUnJIRFBaWVM1Y2l6Zkk0UnZlaGZ3dmliL2JYREFUNDBnVG9VcUs0bzJF?=
 =?utf-8?B?ZGJWVFhjdnBPZW5JOXA0Q1ZyZHpFNHFKNzZwTWZ6UFFoV0JUVzhYZWZwY3lV?=
 =?utf-8?B?c1VFQXRkU0xxV2pqVlllYVRybkN5cHYxRlQrSk0rbjRpVjBkWG1NSUpnUU1N?=
 =?utf-8?B?NWVuaS9VSkZJOVk5eUFHempHU2RxaEc2aW1FVkNnZ0hFVGhycE4vd2NDNmRi?=
 =?utf-8?B?YVBqeDRqcWd2M2NKeEJvZC9RRW1EaVhxMlBrek5CcGd4akRiUFBxK2tLUHZn?=
 =?utf-8?B?VEdySGpMZS9ISCtwVis3L1lOZlVQeWtDTDAvYVUvV0xCbVJmcmtCd0RZMVNO?=
 =?utf-8?B?WGVEbmhGSkV5VGkvWE9LMXBrMFFCY2RJdTB0MTdoR1FqcTRNV09CVGRvZThz?=
 =?utf-8?B?SzJiNTdteFRjL01WdzMxOXhhdXAvQjFJb3BLbERseWpSeUR0b0wycW80WW9X?=
 =?utf-8?B?dDMrMjlBYTNlQmZLRTJXNnNVN2dqYXRjZVdtNURSaXhYWXJVeE93R3ZaVVA5?=
 =?utf-8?B?MXNzeVI1cTkwTjZLeFlld3FMZW13cFJ5bHlNdE05SkpLSmJzRmlhd2hJajM4?=
 =?utf-8?B?bDN3eDRIWG12cm1wcEN5ZVFvSUFLQ2RTa3h6SGtoSDM2SG14RTVZaTZpQzFn?=
 =?utf-8?B?S0lUT25iaVVTbU1JbEVoMGFjVERpdXl4aHFqR2V2UTRoTlNwTklEaWJJRGla?=
 =?utf-8?B?T24yazBMalhlSld1QjVKWDhNREl3d2g0Y29ueDdxejhDSFhLc0VYQ1ZXcmRP?=
 =?utf-8?B?THNpQUVROEttN0Jrd2VoQWdYMmM0VkhnOWk4T3BQMzk5S2JaM0w1VWtjSmVh?=
 =?utf-8?Q?leQ9HrofALEL/DsvhAAYGXaPh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 185e1380-53ca-4d79-d4aa-08dad7936af3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:08:58.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svGemJv2aOzI1SROMZXRcmp0FKwukV7S+F/VmYQTauIw61zIfQ2vI22Zm3y9gO7Jdyvh5EDw08erJl9jYTIbMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398

On 06.12.2022 15:05, Michal Orzel wrote:
> On 06/12/2022 14:46, Jan Beulich wrote:
>> On 06.12.2022 14:05, Michal Orzel wrote:
>>> Also there is no functional change being made by this patch so it is ok
>>> to change Xen and not Linux in this case (which has quite a lot of trigraphs all over the place).
>>
>> Based on what criteria are you saying this is ok (unconditionally)?
> 
> I said that it is ok to change Xen and not Linux because this file already diverged,
> so we cannot assume that future backports will apply cleanly. If we change a file
> that did not diverge, then we are required to modify the origin first and then
> do the backport.

A file might have diverged, yet commits to be pulled in from the original
tree may still apply cleanly. That why, in the general case, we aim at
limiting the amount of divergence, and we prefer to pull in changes bringing
us back closer to the (meanwhile evolved) original file.

Jan

