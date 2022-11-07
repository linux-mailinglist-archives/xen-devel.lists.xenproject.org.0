Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ECA61F010
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439215.693222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orz9A-0001dx-SO; Mon, 07 Nov 2022 10:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439215.693222; Mon, 07 Nov 2022 10:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orz9A-0001cD-Pc; Mon, 07 Nov 2022 10:14:28 +0000
Received: by outflank-mailman (input) for mailman id 439215;
 Mon, 07 Nov 2022 10:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1orz99-0001c3-GB
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:14:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4eb5275-5e84-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 11:14:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8905.eurprd04.prod.outlook.com (2603:10a6:20b:408::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Mon, 7 Nov
 2022 10:14:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 10:14:24 +0000
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
X-Inumbo-ID: f4eb5275-5e84-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQHn86ryhl4Hw+Dx0/3CJEs6MNKozWFvyerb3Z+lbOzcGZtegElW47/X7QFwxy4xSPGqVcMPkFiBlJgbJaxpi6l5a44RpATV9B8tjaq7iO49d4MQ0J2dJ7so1ircaViv+X4+raEqZMbxVwaDsY2yF2rO4Yc00SgxPkUupZm6KGBpWav0jWR1RZAy5FErrxZbWBUNU+aQxCEWKcLQ6MXJq+fBS6sVFe/3fPm1fom5nlJUU4wj9vj3uutsiFi3Q7WFOhFFs1Xw8PfXNL4Ptjsbcqjghc0uyZdSa0ygZrmbPm+fOKarsYpjBYUZ5v1wTc8jA/L0viTb/uQzy5ghpzLWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSzASySL2a91ziBxdlEU5QHsVQQ0z3LYXMU8idMlzaI=;
 b=mahJm0EJOtZEcR22/SFWvOqPN2jezn7qYBpqIr1uktvgkGGbVFpPIy7s1JSeGzJ2NtnFS/XvuUGWn0RkUOU6Dw8iq/3cCvBrL+MvSLqHCzmSaKyfpmSHQld4ApytF/9XB461cJ28XBXL7/PIT6O1PqB5LgToUK50D2zCvMq9fzGfr+5JzSKkGHyZd1rh9CpTv02STSqumtGSpoIKIj2Fi+HAzKULSOO7AJ9WQ4mejjCrBMvk7oxTyGPgq4JUU0TpIwvGlFZ7th7nQGHrUO10piV9388QHxtpYtps6v+xRFDJxHFUs7G7K624DdAIbJJISeGwYLeDwFtfTzJr5n9bZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSzASySL2a91ziBxdlEU5QHsVQQ0z3LYXMU8idMlzaI=;
 b=luyYiTHgPkH2s8n31Z6xb2AGF1cdSgJMB6Vn36q9sNs4nvxkqG8i8bBfuZ3Y6p/zRI5YbgG+SpJ2klpSfv5CLCitNYdbFsETC6GmGC3Pb6j3/X4G7O+aytg/Bst7ijFkvgYWa6H+COH78pADSpIjxFXj4MoLOzVlAMOzaXG3/LtkwGFtvtDFCilYngCTPU7xvgM81LE6on/AmecQQkzd8S7F0KdgYgEsuo0beE9kosCE0EMaGk6TAqgEbIqNN7AwynaS/0hNx+cGG21WVrBRTJ+6dz1v1KOzfY1vvdf0G7XelcKujwpFM7dDuqwqV4uzVUnPkjP6yMY5bICPpPPHzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14e5a51b-2c22-7bef-fb9a-e10f7f71f25d@suse.com>
Date: Mon, 7 Nov 2022 11:14:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-3-wei.chen@arm.com>
 <78036eeb-2585-97e5-9f80-bb84f297cc08@suse.com>
 <PAXPR08MB7420FB5EE6A3A8990894563A9E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420FB5EE6A3A8990894563A9E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5226d5-01d1-4946-8512-08dac0a8d82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gl8gzdAoKtQC/3xCLrQAwW6rnHj2vh6AIeBdci1yo1e9iBGcT1MFaQ1uXAIIlSAWR3JfBt4SW0mPNS83XZDoa5vC2ySvl7e3Y9O4P0k36faMWdlJxe/1LMSYo49toe/3szwfDJW3SgLLV8hUk01+/4rlttgU+Wlb8iMFLzngF/JAAlJXsJoy6Y78R7Tk076EDq/7Drw+Gt9iHajCJ1/yU/emIY3XVqQAlvqFMXmFDawBUbkf9A0qYn9TIzgpLaIx227tfwPcLEcODW8PU/fIjAZdoZbwTWnejp+M3PDn8dLetRV2HW+NUlSZuTRJx+YhmIoY6oSnhAkiml4KzreEDtQw9uoS8GYpYCGad30q4IFp0cXW4uscljv9yTDcuBLYG0JR6LHrn7Smvhs03ULWRkuUJkbXKw9TDLg0he1pvU35UVK5eO5HFNoINNnLkbrbJDQxDy/BjCvNr9p9VYNH1wtw6MORw5ctjKuJei6bhLBysMNtVXONfJZI+9s7W2FeT1Zkb36Yl1SuMrcBi07wga6U2SJvZqsbnHVTCeBoUV6zURpMZnP2Fx8i7qY4DlHMh89p68/MZZEmQQzk7p3HNvKxvyO+2VxvSq+DGYNyAjP5qeLCMUIqhWRPtsWakANAZoNdK49lSFAuY4JA/Vwakx6I4uyjWFY03UnvYvHHdQ+uEDa/NQymni0AXmjoKNzaarUqJOPWhl2M+AfOAQhCsY0ppzYwR1SCyVLJ0zMXs/yWOc11ONls/duMFpm6P/Ta+qH8C+ZjL4C2eqbJZh957PnNQdIekD5S6IL+G21hZAFvoDJHzH+XGEhDgEkVLow8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(36756003)(54906003)(8936002)(6486002)(5660300002)(83380400001)(2906002)(478600001)(66946007)(41300700001)(66556008)(4326008)(66476007)(8676002)(316002)(26005)(53546011)(6512007)(2616005)(186003)(6916009)(31686004)(38100700002)(86362001)(31696002)(6506007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTFXVll0RDJodmV0KzFBTUJ2ZmJuWUJHRnZoaHlqZlkzSmx4cStWY3A2b3J4?=
 =?utf-8?B?b1FLSGJLcTRLV21jaGdVK3hGeW5zR0VSeGNxMUtNalVBdXJGNWx5OGJyMnhu?=
 =?utf-8?B?b1RaMjZnMFNGanhoMHZibzFBL1EyYys0K1h5cS92U3d3VkRUUFFwMXZ2Y3Ew?=
 =?utf-8?B?RFJ2dC9iRzlsNjFyZ3F6WGREdENuYjF0OFVlUTZKRTg4UjMzMWlhVFpQTENz?=
 =?utf-8?B?b2F5MGRWK2UzZFY1QkpZUmQ4Skh0NmcvV3o5Q0p2dDlrUnB4cndzSWlHazFJ?=
 =?utf-8?B?d2hkOEFkTGZOYndQcHcveHllbWEyaU0rK3V0K25qQlIvK1NDWXFlMHBqYUky?=
 =?utf-8?B?UXIzeGlnKzdTajhwRDV6NmRNOE1rUDlpai9leC9BVXNRbXhQd3pXVjdCaUJw?=
 =?utf-8?B?K1lNelZvRWNQVkc5VWJEMWh5d2w4eVhCUHJZd0dBRjJJTURTcktER2NjZGg4?=
 =?utf-8?B?QmFPK3hHd01tRWYvam81cWFGMC81NFM2Y1Q0ZGk0NDJCTllZcTZEZ3ozanJR?=
 =?utf-8?B?M1lKSG52ZzlvZSt5SUprY0pwckJmV2RGVFc4MmxaWG5KRzFLL2QrUWJrTVh5?=
 =?utf-8?B?VHJkc1NTNTkxbGNMSnZnZEdFa3BjdTNSRjJOcHMxcVc3YVg4ZnpQOThPL25W?=
 =?utf-8?B?M3pNVTRkVUJia2MzaWNaSVB2bHUrWlJPaW5Ud25yVTZtaHpwMHBZLzcyN0JR?=
 =?utf-8?B?MVdyaCtUa09TNXlHTU5hYkt3Y01zQkZBVFBDaHR5L2NYWDhtMVorQXNjdUZy?=
 =?utf-8?B?M2RFblUzWDY0RGhEVkZxMUloVkxDZy9xQ1gyTlZiMTJuUjkwVkxPV2oyUk1Z?=
 =?utf-8?B?WnBWYVFTRWZyQUtHN3J1MnM0ZWpRRFlxQURjeVdwN3g0elMxVmFZc1pxVjMw?=
 =?utf-8?B?SjFMK0VGbElWZ3A0bVBDR1Z5RmlBM0pUZjM2d2xVdG9vQmpwWEFna3FEazJQ?=
 =?utf-8?B?SE1KV2ZTU0ZXZ3RpeWRIL1c1R2NPdVdZTzNsVkNkN2dSa1MwczFvbmdXc1Ix?=
 =?utf-8?B?dDNHdE5TaDBUYnRmSTRJNHpWWVhwaHBzTTU0SHc0NG1nUnRZZ08xNHVHVjhL?=
 =?utf-8?B?clNYOFpVMit3U2crOGlJNTdhS0gzOVY3bW1aNkR4dXlKN3Q0MU9CK1ZyRmx5?=
 =?utf-8?B?b254MjA0Q0hRSlRpVkloT3Jna2hmT01rVmlIRndNWENuWHpKMElWZ25hWm9H?=
 =?utf-8?B?KzBPVWpnNnpLS3k0SUlYS0FjVENDUFVjOVVXWWxMY1pmaCtva25GYXZrcUE2?=
 =?utf-8?B?Um9lQS9WSk1yakd1cGJYRG5EQy96S0JCcUhrRFNodm94MjRrTTE2RnNyN3pL?=
 =?utf-8?B?SGFzU2RIdk5UR05vaXhXMEYvYitEbHp6VXhUOVRlYlVuR0hISXl1MnAwVzUv?=
 =?utf-8?B?QUdoSHFORjU0MWhzcnhxM0FZU0xCcjYvdmpody9ibkF3akh4cTh0UnQwTi91?=
 =?utf-8?B?K21meDB6TGNHTGp6akk4aGk2WHdTeGV2SW1QVThnc245T0xsbnh4OFdta0h0?=
 =?utf-8?B?bGp1bDdpZzRUUCswSkZJYnhwcW5zSEN4ZERBMzdYSE1WOG9oKzBlNXEvSmcx?=
 =?utf-8?B?UjhQVFNRUFloUDM3elBEWWx5R1BOYmNwb2U4bjZWRUp2akFSQXBCNWNRVlhp?=
 =?utf-8?B?MzNhU2NJcjk5U3hCL1RybzE3T1VYa2Y0OVpwYjFBWlpocUIzTjJjYlRmOUUv?=
 =?utf-8?B?N3o5UFdYNU5sd3pVNjBTY2c4K2FxUkQydDZvTmxpTkZZaGdaczlUSmlXUTM5?=
 =?utf-8?B?M1l6WWE3QkR3VnJ4MUk5RFFVakhpSGZ1NDBFbDRtWnR1a0QwdW5SNm9BS0pt?=
 =?utf-8?B?MkxLeFVXdFNTNEZKZVZ6U3o2L0ZRcW5YZkxNZ3VyaS9tZlZqMDhGblIxVXVH?=
 =?utf-8?B?UlNvNTIxTlVSUXdwdmdvOHlKT1ltcmRTRnVDMzIvZVQwZEpDelAvZFUvTk0z?=
 =?utf-8?B?NEl4S2RPUVc5czY1VWtOZEVjVEQ3NC8zMmtSOVVreXhqaUVyU203UWJjRFFx?=
 =?utf-8?B?ZWpOMzNyeWNRbmxPeUlhWlRwcnh2NnFqeXJJNnhxYm14ZWg2Y2svZ2FnMjRW?=
 =?utf-8?B?dkpDZDVwOUhqL2VRVzZMVGg0WEVKRUpEUldMUjhrOFZNUUI5cEcvUUJCbG1Y?=
 =?utf-8?Q?ryXzf+FByVpSyDKm8LZrkfah+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5226d5-01d1-4946-8512-08dac0a8d82d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 10:14:24.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHR+rRlARYaQjotMbDl9sTz/LVoDjdA9W+spElx4XrCUPDdBswMACL66bRbdQTBY9/dx/I6nHX6EbYKDU3vz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8905

On 07.11.2022 11:09, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年11月3日 22:26
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v7 2/6] xen/x86: move generically usable NUMA code
>> from x86 to common
>>
>> On 20.10.2022 08:14, Wei Chen wrote:
>>> There are some codes in x86/numa.c can be shared by common
>>> architectures to implememnt NUMA support. Just like some
>>> variables and functions to check and store NUMA memory map.
>>> And some variables and functions to do NUMA initialization.
>>>
>>> In this patch, we move them to common/numa.c and xen/numa.h
>>> and use the CONFIG_NUMA to gate them for non-NUMA supported
>>> architectures. As the target header file is Xen-style, so
>>> we trim some spaces and replace tabs for the codes that has
>>> been moved to xen/numa.h at the same time.
>>>
>>> As acpi_scan_nodes has been used in a common function, it
>>> doesn't make sense to use acpi_xxx in common code, so we
>>> rename it to numa_process_nodes in this patch too. After that
>>> if we still use CONFIG_ACPI_NUMA in to gate numa_process_nodes
>>> in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
>>> will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
>>> CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_process_nodes.
>>>
>>> As arch_numa_disabled has been implememnted for ACPI NUMA,
>>> we can rename srat_disabled to numa_disabled and move it
>>> to common code as well.
>>>
>>> The macro node_to_first_cpu(node) hasn't been used anywhere,
>>> so we drop it in this patch too.
>>>
>>> Because some architectures allow to use all 64 physical address
>>> bits, but some architectures are not (like Arm64 allows 52, 48
>>> bits). In this case, we use min(PADDR_BITS, BITS_PER_LONG - 1)
>>> to calculate the shift when only one node is in the system in
>>> this patch too.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one small further request (could be taken care of also while
>> committing if no other need for a v8 arises):
>>
> 
> Thanks. This series is in merge conflict status now, do I need to
> send a v8 to fix the merge conflict?

Generally yes. While committers _may_ be willing to fix up conflicts,
strictly speaking the committer role ought to be a purely mechanical
one, i.e. not touching patches at all.

> If yes, I will fix above as well, after PATCH#5 be reviewed.

And I've been meaning to get to that one ... Then again this series
can't be committed anyway before 4.17 was branched off.

Jan

