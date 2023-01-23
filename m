Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B954D67764A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 09:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482670.748295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsD8-0000Er-8O; Mon, 23 Jan 2023 08:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482670.748295; Mon, 23 Jan 2023 08:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsD8-0000D8-5M; Mon, 23 Jan 2023 08:29:50 +0000
Received: by outflank-mailman (input) for mailman id 482670;
 Mon, 23 Jan 2023 08:29:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJsD6-0000D2-Q0
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 08:29:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f1f94b-9af8-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 09:29:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 08:29:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 08:29:44 +0000
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
X-Inumbo-ID: 17f1f94b-9af8-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK4IzHarI7KXM+0jG7eMfW/0GurjZJBfAP2oSlJEZyN+RCaOzrIpEjZzLUp6bqRiMXOFvxce0I8Osuq0KW7Z1p1YPAit6az3iIF7PWTSAF5SiWHUbT6N1xS8yBUbYRzY7/ljGuHdu1tw6LZYtTMl5EYH+FsX9RXoF9Kj34HWRkVh/6iddJd2eKgyO8d5VRTYtor0sYUURt7DHGAzzw1f4IdRHWciKhfC4Cfx7iuEUhQowUtK8GUc91jV1X7Et+4BsIOfjYgESh8QG0GwiKlHUnY2cfKMn2J1S0vQUAOVj7ZbtI0llWns3YH29NU+M9W/HVq10Pcey974Jf20WW0hdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuRlfe95W/9eOqK3eeexAn5DajWVjHXYSptDvHAEZTY=;
 b=Aow2jM33m4QwRtF1ylk9skltAtRrqsP7+D9QHk5x0PFKw759easxb1Fzu6bVx/0elWowyOI1JXTcTZ+fLTGEwCqG05p3wtslS+89pqWigf3M9NjV4TlF/P6sGCetfKyvFzg3ryv/lBlj4YALFePxtvvc6hBHOSVh7LUelb4jUHu5/GUUMRFBFY5YaYo+VtomrjHm/MAuZaan3GT3ApM3IyfPAmdpdOO+uAy6ZC9FOhbZfvsylBFId/ZzltQDakKt69suWIBQwEiXpk6AtPtuJbIF9pgIeNI3kY4dn1wczmkCFPTwdJP5svrQaw+kd75Q5XtyVEohyUZfdVFVL8X1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuRlfe95W/9eOqK3eeexAn5DajWVjHXYSptDvHAEZTY=;
 b=2NrAJhJcb3b6xOrkP+ULt1ErXuvf6YNN9c82L+hGl4dnU9lw1o95IwSKgjQqeBonnLrFw6JRFErBsAbEQwzGKT8dZYyder5LTaw7e+fhOQQOTpJapDZqNARtKqVnv1w0OulxVxKs3/W2cOPiM6XQBZCOnfnngMRkJ0F5tfAdHnhzkV2zWlAXl1UIkgMEBm/KfkVAg4/38bh06cd5lLYvUuChiAXBy/Y95z6qB9GxaPt2FTs6xaf1IMEnCAze06viVjoTZ6+vO8cWG35eD5dNbrDNx9vxYDmDpFl0/OJ+kcsCrohD0kHwufKeovg8HBCTd4NYFTLc6WNIMmsh0my+Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc2e4d71-0322-65c9-b58f-742e5d8ec2e9@suse.com>
Date: Mon, 23 Jan 2023 09:29:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <ed4d8d85-2ba5-74c1-7c65-0ae65bf0ee06@citrix.com>
 <24a2f51b-e69d-7a44-5239-79f5f526ef01@suse.com>
 <978b098a-d052-09cc-442e-9aafc816feee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <978b098a-d052-09cc-442e-9aafc816feee@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a195c1c-8af6-41bc-1685-08dafd1bfb0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HxGB4B/Efxc8JjC+utHkBHfGSDQKs00a6A+6scPSXexdNG3qEq8szCB+MVKMgkoDqaYSsG04qQ5O0Sphx0rFZ/kEcS7vsp6hqGYHq+mdNfe7Mf3VyoZhe6JNSOa/dNRXZ0mxi94W4XV019pU5jnUWSVvgQGn9bn1wrj9nJCayyd2Fw9rz2Pk4rXiALtoFK0sWyOvWFxviYg22Za3FI01syDCSX7ukjLNC3HLdGO5++XyLCsi1anpFSbor6sLLYqlcePiF9abb0Yf8isZMyCMkLGx72sXrmZnMg3T4MMCt8qFVLpwMjGj/1TI8enPNGEued7sHhRHZT7iNSPhXLbazYrTXFw/QJ1DKQSHm4yc2LhvdggkAcw09IPMJ8TTbQyybjxRgYheGbb+Vav7LkENOJ5bscgeCpjT6/hE1i1zdMxPdE5DD+PMGoiAix4AcZlleoDNc7oXGooUfe+rceq2znOjU7C2Hz43jYPpIUOqIunM2mvHtuqzSYeaZ3trvSL0nMlWElr/PRK/GUMFpAwLRV05atlbnifLEgrpaReHtGJvOpyfNCO1Ey+p4GdtuzW9cj2znz7WHd6xh1PBoLvod2c/stEvRQgW+6Y3AqklNhyhDBwURsYKKA1ZfAry7zpAsRf5AAec/zUGnqsAlVnWxXmRwfXws2celJesAQQ7bDSchjDe1UDTKQbe6Jm9jR4DEm7IdgT9vLbrEX3REFyDyJAqYn64CBXcbslNFB/Q6B8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199015)(31686004)(6486002)(36756003)(478600001)(31696002)(86362001)(38100700002)(83380400001)(316002)(53546011)(26005)(6506007)(8936002)(5660300002)(186003)(6512007)(2616005)(54906003)(2906002)(66556008)(66946007)(41300700001)(66476007)(6916009)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdLME1rdm8yNGdGR2JEM09ZMXg1c3pyeW5Ca3ByY2paNzNlN3NWYjcwVEVN?=
 =?utf-8?B?R295eVRIOWROYlJwbGJEekRuT3JsaDJKVEkya1gxSWJEVWZKQ2M0MC8xM1pE?=
 =?utf-8?B?b1NHYTUrWm1oMTZJWVcwbHBSNWFTVU90aEE5UC84em0yOWdlS2VNMzVrYkF5?=
 =?utf-8?B?U3VsM3RjUjVsMi9COXNzM0t5NXp0S2RIRDIxZVNpSHdOWHdlcUZsT3RZYy9a?=
 =?utf-8?B?WW5LL3d6NVhvTFZZVlZac0ZvWWdreHRXeC9RSzhBTENnRFI0RzNLQTczSkZF?=
 =?utf-8?B?NjhyU28yRDI5T2JPWWdXeWZybnc2Umd4RVcvSThyS1hVWXpVM1ZNMkoyMGlz?=
 =?utf-8?B?RG5LMWQvYTYzY2h1UmcxL0t3aXdaQ1ExbXIySkNBQmhWbmpzM0J0c1lVSE1r?=
 =?utf-8?B?dnNRQUlNQmpORDMzS3pVNkVkbHd2bnNHK1oxckQvWDJWZmhid1U1MEpYM1E5?=
 =?utf-8?B?V1F4WklSRGRLQk52VmtVcXdwakQ3UVUrUE51QnIvT2t2SXZvUjVyVDJ5OGdh?=
 =?utf-8?B?UVRKT2kwaXA1TXEwQ0JndUs4MEhxYkJORUFWQmp4OHBMZ3FjZzZ3SXhhWXB2?=
 =?utf-8?B?ZEc4VTVwTnZqNzNvM2FJVTRTazR6V2ZqYk1pcGRTK0xxWXU5RDJrYUhlQVAw?=
 =?utf-8?B?dUpQWWNhQlhrai9XYmpPSjY4OU1oMS9DVkM0KzZhaEtwc1JNYTQ3Vkhpei80?=
 =?utf-8?B?RkRCUFVJcXdySHFOdjFydVBWRk1PemJyYlZCdXgxclVld1pqdng0ZDE3dU9N?=
 =?utf-8?B?Z090ZEpKa1RvcFM1cy9CdGVzdjBiWE5oZVFDUGRUMkcwMnk2MGY0cm9GMFNW?=
 =?utf-8?B?RGFwU0RSdlA3ekdISjZ6T2RmOVBFbytBNThhd0FaamhyaHQralJ5TWdwVFRq?=
 =?utf-8?B?WGlEaXJVTWp4b1FtbGo4amR0VzN5TGQyVjF3anNCVm03RmN1dmx0UFhVbDFU?=
 =?utf-8?B?MEJQNXo5Mmc4WGRjQ2xVOHZkSXBrdUk3UmFZaXNLR1Z2M0cxT2VTK1NaNG41?=
 =?utf-8?B?UUVpUnV1OHlsRVhSREpBaW1iN0dnemZkcThFYlRGd0tNSFUyV0p1aDZBNFBV?=
 =?utf-8?B?VWhaRHBiNUh6YUtKTzFVZ3ozS3FMWEM4c3FnSDJ3K3Qzc1M1QzE2TUY1bjI2?=
 =?utf-8?B?WkIvb0cyVkpLVkFLdjQ4SGRPNVBlVmJUMFgybWhPWEtQZkxHVGlOV0dRajV6?=
 =?utf-8?B?TXcwM1k1K0tpQTl0ZTlOeEhBYy9wU3VBcTNoQk1nL2JkSXBTbVh3TXNnQjJR?=
 =?utf-8?B?ams1WnJ2dXYzWEVtbCtKYkpxTWR2RjJKdXdVMWdVek1sdlhRWVgzUjFaUEk3?=
 =?utf-8?B?UHdrWXNKUkxDZWNrUXpsSkZaMmVGV1pKMEVaZE5WRWJSL3BXbkFOUTlablR1?=
 =?utf-8?B?YnBBWHlxVnNBc1Z6VEhWTHd3V1VETFMwTVZodlNiVWVDVVJUSjBUWFlOMkVn?=
 =?utf-8?B?NzRUY0h6UWFrVStLVE4zTm8rVUk1ejVLUXZNdytKMzV2WUFiOU5mV1F0RGhB?=
 =?utf-8?B?TUUyRUV6b0RjQzNjMUZ6djhVUTIwd1c3MjFyMFczTTdLT0ErYXlHL1NGcFpm?=
 =?utf-8?B?ZnF2TU80Qy9reU8yVlMvMjhiZ1lRRTc0a1krR1FWUnBHRDZWazdjekxTTnIr?=
 =?utf-8?B?d0lHZzhZcHFLd3VTTHFoY0NmMnZXa0F5WlNTcjJ5MG9BZEtacVV4dzdQM3kz?=
 =?utf-8?B?bjkwK0ZsYjE0M0hCMkhvSUtVMTdEZXZTbHpXa0s0SkVGa01PcVh2eHB4Vk5n?=
 =?utf-8?B?VCs1aERYejJqSCtWeEZYMGpCMVYxTmlKK3VENGN3WG5vZ2ptM3MrdWF1UTM4?=
 =?utf-8?B?Y0diQm9FTUpROFpjMVRQTUUzSmxOT0lBREg0VE1mL0prT3VYMjJkbFd2dnBI?=
 =?utf-8?B?UjBHT3piK0JsYnFVT0lKZHhYand0OGRjSzRYNEdDSm5KS1owbmw4amFlVzB3?=
 =?utf-8?B?YVB0aSs0NE1vYTdDZzZxSm9DM3FwNUJER0RnZXZXd3Bnc0JudkkyU0hBeGFw?=
 =?utf-8?B?V3hqSUlBMUtxOVZCUnJ0cGtlbUJsUE0zZC9OMDlER0xOYVE3MmszUEVWRDVl?=
 =?utf-8?B?ZHVER0ovZ0NNY08wYVFoejlUYldRVGZRQkIrM1Q1dUMweC9VOWNFQjV1OVpV?=
 =?utf-8?Q?bPrSTJjqN6sekqxonxmiF716c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a195c1c-8af6-41bc-1685-08dafd1bfb0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 08:29:44.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slgkiyqhJ7PE9YwCm3XxmN4d8aDCFOtJ9XqXFSD1BF1TOV+++zjzC/IxcfH8Kd79ELQ1w+4pZ/NjipL2S/ouyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

On 20.01.2023 19:15, Andrew Cooper wrote:
> On 18/01/2023 9:55 am, Jan Beulich wrote:
>> On 17.01.2023 23:04, Andrew Cooper wrote:
>>> On 19/10/2022 8:43 am, Jan Beulich wrote:
>>>> In preparation of the introduction of new vCPU operations allowing to
>>>> register the respective areas (one of the two is x86-specific) by
>>>> guest-physical address, flesh out the map/unmap functions.
>>>>
>>>> Noteworthy differences from map_vcpu_info():
>>>> - areas can be registered more than once (and de-registered),
>>> When register by GFN is available, there is never a good reason to the
>>> same area twice.
>> Why not? Why shouldn't different entities be permitted to register their
>> areas, one after the other? This at the very least requires a way to
>> de-register.
> 
> Because it's useless and extra complexity.

As to this: Looking at the code I think that I would actually add
complexity (just a little - an extra check) to prevent re-registration.
Things come out more naturally, from what I can tell, by allowing it.
This can also be seen in "common: convert vCPU info area registration"
where I'm actually adding such a (conditional) check to maintain the
"no re-registration" property of the sub-op there. Granted there can be
an argument towards making that check unconditional then ...

Jan

