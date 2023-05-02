Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743C6F4252
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528507.821759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnv4-0002ml-Ly; Tue, 02 May 2023 11:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528507.821759; Tue, 02 May 2023 11:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnv4-0002jg-HG; Tue, 02 May 2023 11:11:42 +0000
Received: by outflank-mailman (input) for mailman id 528507;
 Tue, 02 May 2023 11:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptnv3-0002jT-5a
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:11:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c06659d-e8da-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:11:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 11:11:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 11:11:10 +0000
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
X-Inumbo-ID: 1c06659d-e8da-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSV+nmqpe7tb4fBc6V/h5l9GR1v4OFNloFdlKtBv+U8wvV2gBUBRcM7ItadxZA7FXhU7zse8/iUP4Z1cRDoELrKZn4Gzg43P2sQCvcFfVH3gGr9EpDfAoHM1j+Q7hIfsn51h4d35A7M1RDuVEK+R6eYQK8wHFZQyh4BZ6lH6kPLSUHIGhKNKpSMLnEaAKC6GFq5C0F1BpzK8FTiK21Beh/CiEd5ESaOYx3NaTc3Ju98Q66ghg3FEjy0QOGrNg9u4ISIwZS9TtWCSc8Sy9AcK2OaNONcc/rD8KPPsmZ45zmdSKLAmftAcd/gbh9Ju78K2PaaXVKW7aj61Rn84uzr0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n75EAu9Yc8oJm1hbgtfHoz+EO3uNctXze4Zfpbc9TFU=;
 b=Z4tD5AIZC/Ptji/ehoWxrAyDuS9l3MgsuP9bSm5vBMJf0JMsOTOYVR7GrzEDZsxt/HCXAyJ1jr9BBrLELynrzaqIxS2DDfSxP5Ieigmy67Ddfix26I3fUTpPiMCN56eM6KCfOSPK7JyWRhHkKsqUlBr266v95CY6RvOa8UFACSJqb23SX7dvlcUe6HgYC+Ahh5UHsrZaTfHWry0MPZ9vga9qhG2Fi2g4jkv7ptma14P+P1tVGzCxG6fdMVXZQfWNy4z6xRJ314AXo/1F8Nqop4u8Auu/meUa3zZJ/M5zWodXGJSCUwgZMb0diUUAtUuHP3XY27KP631KKow+2Z55KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n75EAu9Yc8oJm1hbgtfHoz+EO3uNctXze4Zfpbc9TFU=;
 b=JyS0R/ccKwJ0+T/gHZsfjY5+yNJ5jH7MfFad3g14POGNWw/F4xQ9W/sd2b3INy08sZ0Hd6qlCoOW7QGiKpqXUfSdIvSOs2buHvOCRzh9CZz5HhTBNyyqiTkQh2tvvxuXrXasORpiG1cJXXDCBrz1NyxpE37LKHmE1HQx1fLs4qOJ0jCqCaN1NMYQ3TNZ1nTFNtbDKR4HUUsVCT6ve/D/Smet2j47an94XW3EDEqkgcLv5es/KiaakTeSQiZxP4p7syvD9hMcc0A8Z5sBXh43VPi/WvJQRNzl6dPlJOmyID9MIeY4rutNrn6+91yM6HwPRZ/aLEAk8IHJiKc7oN5+yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <269b0894-5fe6-fd71-9f6d-24e3b08973cf@suse.com>
Date: Tue, 2 May 2023 13:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
 <ZFDrT87RixpOmMfq@Air-de-Roger>
 <6aa9f2a5-bb57-4c56-84b8-5bc63b47cfa4@suse.com>
In-Reply-To: <6aa9f2a5-bb57-4c56-84b8-5bc63b47cfa4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 11758879-7dbe-400f-510e-08db4afdef20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8b6wKl/O6oCEDbj1AgNsg6M/paTeHl34rpYBjJgWXpHxsU31mTN1DkfUe7XH8qd7lmIDiBuX+yj8nLr+0XSQ/8uOHPUTh8G9QsNCyzOkHqEp6+Vhk0RExav21fdXtlNmZSnwluvhMN0sKZhOzgI3EyX6sLrZyeYxiKSVncxhMPMN46/0zvEypF2b8nqDMTYlTJwGTVwVGN5ea8SPtvfXkUG35nuRiBdWl5Gl64tlW1Ec4O4pJKhqoCI3XHoyfCfW3zhzqiFWiX2U+i/GeMX2Lrpvt8ZiJGGe70j1wAF4xv+vyj6g3mqrOLgpZ+ByMxOc7bAuvoSasEw8eNcTtFCeksP/p6QolQsnr4/es3cVt+TGA5+N1gCB/rxY0fbFfmfJj0huT7YciXBnPzAW37CDNS27AgKw/pUCOl0m0H3qa7aX9d4en6Adno2LLKf0WvLXFe9F3JB7LY34Bz5H/CsDSyRrOIWVQDVavr+Qcvkbcl6dSGa7/rwrPBcjblSRmPCknwiNt0zhzzGuUshALpqze4ALbK+moMspi/OsU9eVZjodyy78zyb3w+s40HL5EwAuosG4RtBt39gl4i5R+NWJWM/0a7Oz6QTIIwoBBI2ndc3iwwWTXzib94NfW8MSYGPBQqxp8DBaorhKRJQV657Q3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(478600001)(26005)(6506007)(6512007)(53546011)(86362001)(31696002)(6486002)(83380400001)(54906003)(186003)(2616005)(31686004)(36756003)(66946007)(66556008)(66476007)(2906002)(316002)(6916009)(4326008)(38100700002)(8936002)(8676002)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWk2QkxsY0N4NmJoUW5sQjZwOUxHV0pxZWJ6WnV6THErZzBUL1lxUWJxNmRI?=
 =?utf-8?B?V240bWE2bDFHZVMwd1Npc05VZ1VCY3VFTlI5NHFndTE4V1V6cFpMMlBzcklO?=
 =?utf-8?B?a011cEdDdTdVR25aNDR0N0Q4M2grTjhZUjJDUVQ1UGt5N1g1REFpT1FpdExB?=
 =?utf-8?B?YjJDVTAxaFFEUlFaU043NjI0blFsbFZqY1NWTG12SllrTFFmM0xhL1BLd1Fl?=
 =?utf-8?B?Nk9WV0s3aE0zV3h1VExnWkRxNEJyLzl2S00xRS9VRzllSnRWNi9MRGJMdHh4?=
 =?utf-8?B?MjNaVUdkSC8xMjlNVHNSU0RXVnRXU3l2bTJJWHVobmJnYS9qRDBya3JxWTVC?=
 =?utf-8?B?cWRFN0xzUU5WMmFCczZTZU52R3VTVEZ6R2hVNGxwWm5TQnRDREdYRGJFWEdX?=
 =?utf-8?B?QmtZdTBRMTU0VStDc0c3WWNrTC9xd3ZxajhLWnNsbmlmTG1rTk5ycXozTE02?=
 =?utf-8?B?K05JeDBnb2pwZUVyMjVjUmR2RWFSblkzdi9LbGpnMFNjZnI5UXczS2RyVWhw?=
 =?utf-8?B?cUV3QVBnVGdYd3ZDQmt3WFVSR2p5eGxjUkVWWmtBMG4xM2pOY1dIWFF0UlFk?=
 =?utf-8?B?WU5jV09WSFFVUVZ0b2t2aUJ4MWZieHZYL1lmd2dGMTlmZkhPdDZrZGNlVW1Q?=
 =?utf-8?B?eGZzSnppRjJIUDhkdnVKSkRxZW9sZnRFM29WWDlNdVZQclU1M3RlR3dUUm9h?=
 =?utf-8?B?MUpRb3RTakJJV0RIVXJLTERwNTRQQ1NEQnpMK3lLRStKRHFXaGVtR1Y5UTlp?=
 =?utf-8?B?b05uMGdBdE5qY3RFdkVjSmwwVzRvVHViQ0xtcU5aVWYrNHpFdG42dys4UkZp?=
 =?utf-8?B?MU9UY1RSSC80Z0EvRFVhYllER2JTRnJMcWx0Q3NyT1JNSFBRSm5Yd2NpcWR5?=
 =?utf-8?B?R2prTGtaN2xHZ2kxcTZ4dU1GNk9WZWQ1SmdlWmtqYU1EaXNpT1FhUDh2enk0?=
 =?utf-8?B?MzkrdDhyUlpLV281K2YySWJ4Q1VvYVNaYmxTa1dlcnJ0L1hiVXpsT01HQW1B?=
 =?utf-8?B?RzgyNlRTdS9YUVk1OFZjSlVOQTFXVVFVdll0REtPd09ZaVJSODlsY1Q0NXRa?=
 =?utf-8?B?QnFFKzlCUWV5TWNpOFJsQU53dVZYcVpwUzlHSENhRHJEb1pXK2hLWlZCYWFB?=
 =?utf-8?B?WVlubVdNdjB2c3RQdjV0Rm9VK2wzRHVvWGl5aFVBYjBBdkNnVWpzT2tieWhj?=
 =?utf-8?B?R3pmUjlIODlzcEh5dkQ5QkZ2WCtkcVJNSithYzFWU3AyeTh2ak81bUlXcGhq?=
 =?utf-8?B?alRta2trTnJOZE1kV0Q5T2hRcnp0UytTZG9ycGlmV3VKcVJXenFLam1hRnFO?=
 =?utf-8?B?SHcxNmlKNHpidHhQS3p0RTNidHVnajRiVCttYXk4NFAvbUlMeXI1UnJxb0Z0?=
 =?utf-8?B?bWZkK0k5LzRrcjU1OE1FL29ycWY3aXlaN2swREhUYmk1TzZOMjZ4eFN3S0lP?=
 =?utf-8?B?bTBicXRYdEl4R2oyMUlJbnhsd2RVMDJaVWNVUHMwYlYvci9mZlJKUkhqZHdW?=
 =?utf-8?B?NjBwTzRtc09uUFlMOWNadmxwOUhpWUkxN0Vyb3pZNGhiRzNDS2xLQnRFWlBu?=
 =?utf-8?B?M1dqQndNbURTUFRET1YzOU1Ic3c0WXNrOGdpWnIydldpdi9ZSGZEdnQ2NS8z?=
 =?utf-8?B?T09SeEM5SWI0bUcyUm9QMVNFSU1acVlBdWEzZ3c0SnFIbVZqZU82OWg4bW5r?=
 =?utf-8?B?c0w1RDB0UXQzNkNaN3M1VExRcGRXTlpJOW14RmNMUUJjRTF2L2ZzeHpIQUJy?=
 =?utf-8?B?bVRiczZrMkIydTF1UXpBbDk2LzFPT1hzS3VCYzBoNDFrQk1kTFVGSUFXQyti?=
 =?utf-8?B?YWpTRG1VZ24ycThDelZjK2UwR2o2WUl3ODdHL2ZtOXYzTmxzQ1l6ZnR4OW50?=
 =?utf-8?B?VXFxcVpwVTY2MHRDUUZVQjNWMnhxS0xkWDBiNzkwemhEN090RjhhOEh5eVgx?=
 =?utf-8?B?cUlEY3RXTU9ScHpGYXdVUlFpd25yOXV4K2lQSnRRWUNMTzZwZW5Ldy9FbDhG?=
 =?utf-8?B?UlhWM0N5OXNjaFNOK0JFZDNCZXRHRzRwbHNZOC8rSndwU1ZlZWcrb2dCMlNv?=
 =?utf-8?B?dmdsQTlUWkxza1ZoQmt0ZDZCbFRiMG82QXl3cGpiZitqZG1OK2lQVGN1alVE?=
 =?utf-8?Q?eVbnmVnQvSvR1N56ZZKp1GrYE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11758879-7dbe-400f-510e-08db4afdef20
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:11:10.3460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB9eJfc1xatQtFuvw/5kBj2QeaOPYuCbX6A2hpP2pISzTdDT6rEvYIR+A3XEwVTcIxBIdN8Ki/Argld6UICJQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On 02.05.2023 13:05, Jan Beulich wrote:
> On 02.05.2023 12:51, Roger Pau Monné wrote:
>> On Tue, May 02, 2023 at 12:28:55PM +0200, Jan Beulich wrote:
>>> On 02.05.2023 11:54, Andrew Cooper wrote:
>>>> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
>>>>> @@ -670,6 +674,11 @@ trampoline_setup:
>>>>>          cmp     %edi, %eax
>>>>>          jb      1b
>>>>>  
>>>>> +        /* Check that the image base is aligned. */
>>>>> +        lea     sym_esi(_start), %eax
>>>>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
>>>>> +        jnz     not_aligned
>>>>
>>>> You just want to check the value in %esi, which is the base of the Xen
>>>> image.  Something like:
>>>>
>>>> mov %esi, %eax
>>>> and ...
>>>> jnz
>>>
>>> Or yet more simply "test $..., %esi" and then "jnz ..."?
>>
>> As replied to Andrew, I would rather keep this inline with the address
>> used to build the PDE, which is sym_esi(_start).
> 
> Well, I won't insist, and you've got Andrew's R-b already.

Actually, one more remark here: While using sym_esi() is more in line
with the actual consumer of the data, the check triggering because of
the transformation yielding a misaligned value (in turn because of a
bug elsewhere) would yield a misleading error message: We might well
have been loaded at a 2Mb-aligned boundary, and instead its internal
logic which would then have been wrong. (I'm sorry, now you'll get to
judge whether keeping the check in line with other code or with the
diagnostic is going to be better. Or split things into a build-time
and a runtime check, as previously suggested.)

Jan

