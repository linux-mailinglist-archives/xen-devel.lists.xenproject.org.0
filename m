Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A076AA62
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573758.898755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQkH2-00043g-Dh; Tue, 01 Aug 2023 07:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573758.898755; Tue, 01 Aug 2023 07:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQkH2-00040v-9q; Tue, 01 Aug 2023 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 573758;
 Tue, 01 Aug 2023 07:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQkH1-00040e-6B
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:58:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3442fbc3-3041-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:58:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 07:58:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 07:58:00 +0000
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
X-Inumbo-ID: 3442fbc3-3041-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI7WqLMMb8mg9szGvF+oKpeF4EiTTaqWJ5OL6BlBBn17I5mfx9jmHG8LDgKeIw/vostqMprE8uBEJfB8ZtGVkob4Vb/fO9s/Sexd6Qm0yUVpLwxHqpe+e9Gqu7d9dooNtWMOUYYUZfFwJa8zihTipwDzit9JPZwcNtZ4H1brPx0jU33KTtULHjeU7ubGO8hvTUlYjcRp8LSxf9kxDGR0/5/UppeXFkAiTXRmZiRZACgs4uXcYs2MsyopFVX2Y3hXGBsCXlB6Os17ZDinICfZcG5cnvnSKytj3ZHMW5vlOBrfbI5H047t/d2jee3ImU020Wgug8NC7OFxkHH68wNabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q83MC0lS+nwglxKUKCTEzUMU81glNsr/uTas3Fn5ptw=;
 b=F9RdP7Ka6CKChoP2b+w2/o3Wc+hI8JJCHM5X3EMOF6eCx4/cExCYG0urdDxjh0vJQsQz/zo+QPaEP0Fzq8gNJMYIhUwywhuW/17gG3vpvvGqkeFYAjnv06ve0ZUjRc43VuDSr0Jh5dxtzo6PPx46rhsVUza9xDUiUPEaKUFEatBEQC+AGaIhvJH2ojEXz3/JnbLqbF7ABg1HBsTcXq+9UpoGL+clTk8VXheLVDY1RhaG0+5ZU7LEqV6cbaLPyDw2A0BpPavbUQ10xiJ9hB731GSc2UAKHGdxryjkHOFBCJtAdYFkjgqJ5nt9gNz4qMlbC+HLyyyrBcuPQLpFZdZeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q83MC0lS+nwglxKUKCTEzUMU81glNsr/uTas3Fn5ptw=;
 b=GKiLMYmaidzez8fZsD/cTusU3aARk+P59PzfZbnqb6oYIDctMGhi38+lYl8JsLaYWd+wjQHQe1coqB/TsPa9l9Dnp/U0GPdOs+GAS+GmZy/k2hNvbr0Rjaia7m+9ITUZxGHX3wUSder24KJ9/zt5T98W3pMzFLs0zbDnX7QJGIkqhjj3oxF/87h0/Y/wTECOJDD4TiRVlf2tRpZwVwmz2+2zdeCrX+R6d6/a+RwqRbjloWRYPB/upBu8HRXl/L/nR4hYT9MAgpUX/JpWbYUv3OA6ekAsdmK9wYOvPNeM2QPRuLZtxP4ugBOqbM1hzQujoyP76+Qssg7T9HY9oW5DiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75a70fa0-ab40-e2b0-685d-db752c943a7d@suse.com>
Date: Tue, 1 Aug 2023 09:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
 <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
 <06a3f79e-4345-7a4b-be57-728a8b01befd@suse.com>
 <67b5c363-a653-3f5c-ea3a-f52bfac3dc49@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <67b5c363-a653-3f5c-ea3a-f52bfac3dc49@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c770a1-3346-4c5c-950e-08db92650648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0dGMwX7/usHuxyFDI824vWuTsOjDLc8f2SaW05bU8ffCoAwYDeTIMfZOcFHCaw+T5hjsp8jryo4dSgnKWIE6Ub/cdmvQigAAke1vrcodL2v91k3nYhwLSe/pyzo8fVtpk2mECxm3nKeu7SpP/jKbQ4WSU1A+YYO8Q+CnjUwatVqdvkoVXPIUXcR6OozFOAIQM7Lp1JAryaZ3YTH/VvXH1YeikkfKVauLoLVCKqctlFQ5AMVG3nBL/cceyzGj9A6w3uxjYml2gElbACix9zkhqPUWAoS5b29etC3uKyqHSA2Q3Efk27id7HQWJHLe6lvk1CZdDO3mDRL+kov/pK4pxxltZD2nh/blfgvMxrrnW41O9BST7AzriOe/t4i+SbrvhVS46V9G2NE0vQtYsl1pijdRIc3HrKoS7oqJSOP+11NsdPOLcyyv+n3xQfwlcEKQrIZVVJ3hYqnc8KtA5/nSp3B/dRGR0/zTAdjhTmSGbElkq9TEydeypvgjz6Itm2WVYpO3Kp7xSMg+kuseZKU4alanCuJ0vdsws6m/Ign4ciUfAztPtFzWujq/DtuhnYLjd7gT3NJ90JuX0Zmid9myXnZ0e3SvznqinuhOGWB81ky/mpwveFECBizXQOot+/+YPGbrXjdszzJ9ZJBlneIpzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(7416002)(38100700002)(66899021)(6506007)(5660300002)(53546011)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(6512007)(478600001)(2906002)(2616005)(8936002)(8676002)(6486002)(41300700001)(36756003)(31686004)(31696002)(186003)(316002)(86362001)(6666004)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RZdG9RNkVhYVA4VXl5K2p6S1FMR1FTWWI5R0p2d1V2VDdBR1ljMzJHa2Ny?=
 =?utf-8?B?RW5nR2xmZ0J0NHNCeW5UczQzUUZMYmRQOXM0Z0FBOGM5MDJJVFJRaGVMb1dY?=
 =?utf-8?B?b2N3MmVNT0RjZEJVVnZNbmpFUjFCUXg2VFErUjltMlNNZDJTRCtueVZaN3FB?=
 =?utf-8?B?aTFRalYyOWhmalVZTTZnSEdvRmdRc0FRMFlRTVlOQjFkbXhsa3p3UTNncGxv?=
 =?utf-8?B?cWJsSXo2V2ZZL1NNWnkyQVk2WG92Wk0zalhnTm43UVJnUlFIdWJtNDNVdmJj?=
 =?utf-8?B?OHRGZnVNQkFrWkVTUGV0bjhXU0psRXJLWDdWMUh3V0dvOVd5amdaN2k3czRy?=
 =?utf-8?B?aUhiZVVseTFLZXNwVEhHejU2NWJ2NjVRT0pTYlowamJUVzR6NUtHdWhCNjJa?=
 =?utf-8?B?SHVJeGFUTUV5UHd1SWFrZXllNEYraWprN0xwOWhaN3ZkZWFYWk1nK0hXMTBF?=
 =?utf-8?B?WXNxSTlqdGpLYnpCZmZUV0tuZjVRQ0ZKWVJNY0VKSWZsRXhaa0M2ZjJtdkt1?=
 =?utf-8?B?MmJaS1lnL0VTUGY2eWJsRXB2QjBoY3FVYWhqOEVDTFhlWXpzdjU1Z2pHTFFB?=
 =?utf-8?B?Q0dNVExMNzNadVM5dE5hTExyWWtyNWtvdTNFRHZOd0prUVNwdUlKSDU4Qk1Z?=
 =?utf-8?B?c1ZKV29mcHZpRTlVdzNpcStKZllyMEg1Z2I1bVB4Vmg4ejNjYUh0dW5QUllk?=
 =?utf-8?B?bE05NDc4MGE4UlRITEJ5VVFUVXd0eklNcWtXQlhLZnEvQk0xMWU4N21tbndY?=
 =?utf-8?B?a01WWWpxSERHWEszVFJXNkRuSHJ2L2pDazErZWVtZFFQSkZFQXBwQXZ4VEla?=
 =?utf-8?B?UW5obzZwSG1haHlRWkdKUytBYUpGV1dJME1jNk90S0hyQUlZQXhCQ0l3WEh0?=
 =?utf-8?B?N3FEZ2xVL29QSzBhSy92d3orbk1wRXRyaDVOSkVnMEdhWTJmOW44MndZSHJL?=
 =?utf-8?B?YXh3ZlRXc1lUQmxxTTdpNHN4Vi84MDdJNkx0cHhDL0VMSyszajJzYjZCZGI3?=
 =?utf-8?B?dVhvcDFIeXpaM2VTUU5DNENkYUFla1pVN3dkdFZ0V2czRDJjT2k4UXlaN1hy?=
 =?utf-8?B?bm84SUVzeDVteE1LZmFFNEZsZkNPYlF2NXJMaVhlbHExZm4zNHE4aG9TVjVL?=
 =?utf-8?B?bTIwNDdyTm5BdmdEQ0lJRVh4ZlVUdmxYeldlYTJPQWdwQkVpUytOK3NoKzFM?=
 =?utf-8?B?MUtwQk14S3UrQStBMG5yTitLOVk5UHBSSU1Vb0ZucTJVUmtUR0l6TzVESGo2?=
 =?utf-8?B?RXl5enN1SzFTaGZNdk5jQ0hEb0pEWVl6cCt3L3owN2FPU2p2cUswSFRCMGxM?=
 =?utf-8?B?ek53UVZaNEtiOEJpajhyV1h0QzBNSzZXZmhWOTlFTlIvR0M5MDNSUkd0MHV3?=
 =?utf-8?B?alRqcXRnN3lTVENSY1BBRjhTcG4yYmxFNFY5aUJ1UUxvZjg3NzhjbC84Vm1R?=
 =?utf-8?B?MUViaGdtZVdXZDNpQWtCaS9aR0NFNldwTWVQVjVENlNuR2hTQWRMaU93b1pW?=
 =?utf-8?B?SnRkVVVQSW5oc3N5QWpvaFZBTmNlTThVdlR4ZC9MbTFLNHNiL2lRbnVhUFN3?=
 =?utf-8?B?QmgvUUVSWXhMQ0VmRm5sNmRWOGovWFNGc3VITkE3aDZlOGorbkxzazJPWFND?=
 =?utf-8?B?SVBhbVdRWlczb2dpM3ZIbUZHcVlFaGVmc1EzMkZXd3JGMzU4ZktJRDZMSW9q?=
 =?utf-8?B?T2JMcFBBWW9pOU9LRlAweFBFenRGYWZZUTBlUXdTYmJXRWdDNURXOG0wSlF5?=
 =?utf-8?B?K2lqSHNVVkpLeXVFNzc2RERua0F4N1dhaWJKRUtSM203RDRxaXhidzdpKzNl?=
 =?utf-8?B?eE93WEh6RktvY0Y5bm9JWDdmTC9JVGVUalZCN242RFVmNnZNYU9iRkpKNHgz?=
 =?utf-8?B?Znk3bnBlUE1uMnUyYWJJY3hRY01SR2ppQVY0YUJOSEQ2NWFJR0pFazhCQ3Q1?=
 =?utf-8?B?RDEvREpCVG1HTHJLSU5uV0FsM3JURVV5NlBpWWVFZjVpZ0YxU25NU2xpOFZ0?=
 =?utf-8?B?RFBlNnBocFNUa0lWSVE2RUlGM202WmVyd05MbFIyM2N0M1k1dFlzRHlRRTJt?=
 =?utf-8?B?RUNLNTRTTnlxUWZuU0JQazh2UWkvZk5UUmJVSnFGcEF6azFGTDBKSHJna3lM?=
 =?utf-8?Q?V8SVP6lpO2aQUPLyJhWi5n2lc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c770a1-3346-4c5c-950e-08db92650648
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:57:59.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5q4/nHvGeBKW53UMmot8L6vj27iOZLgdd9bb6DTxsIqXL4qtpDVciKu/HkuWsMdZC+swYEm6jVVF5TRHYIhB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

On 31.07.2023 19:38, Andrew Cooper wrote:
> On 31/07/2023 9:00 am, Jan Beulich wrote:
>> On 28.07.2023 18:58, Andrew Cooper wrote:
>>> On 28/07/2023 5:36 pm, Andrew Cooper wrote:
>>>> On 28/07/2023 8:59 am, Alejandro Vallejo wrote:
>>>>> Adds a new compile-time flag to allow disabling pdx compression and
>>>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>>>> conversion macros and creates stubs for masking fucntions.
>>>>>
>>>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
>>>>> not removable in practice.
>>>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>>> ---
>>>>> v2:
>>>>>   * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
>>>> This series is now looking fine, except for the Kconfig aspect.
>>>>
>>>> This is not something any user or developer should ever be queried
>>>> about.  The feedback on the documentation patches alone show that it's
>>>> not understood well by the maintainers, even if the principle is accepted.
>>>>
>>>> There is never any reason to have this active on x86.
>> We can of course continue to disagree here. At least with EXPERT=y
>> selecting this option ought to remain possible for x86. Whether or
>> not the original systems this scheme was developed for ever went
>> public, such systems did (do) exist, and hence running Xen sensibly
>> on them (without losing all memory except that on node 0) ought to
>> be possible.
> 
> There's one system which never made its way into production,
> support-for-which in the no-op case is causing a 10% perf hit in at
> least one metric, 17% in another.
> 
> ... and your seriously arguing that we should continue to take this perf
> hit?

Have I asked anywhere to keep this enabled by default? Have I been the
one to first propose a way to reduce this overhead?

> It is very likely that said machine(s) aren't even powered on these
> days, and even if it is on, the vendor can take the overhead of turning
> PDX compression on until such time as they make a production system.
> 
> Furthermore, it is unrealistic to think that such a machine will ever
> make its way into production.  Linux has never PDX compression, and
> by-and-large if it doesn't run Linux, you can't sell it in the first place.

I'm sure you recall that Linux has much more VA space for its directmap,
so aiui there simply was no immediate need there.

> It is utterly unreasonable to be carrying this overhead in the first
> place.  PDX compression *should not* have been committed on-by-default
> in the first place.  (Yes, I know there was no Kconfig back then, and
> the review process was non-existent, but someone really should have said
> no).

Are you suggesting no code should be committed supporting new hardware,
ahead of that hardware going public?

> It is equally unreasonable to offer people (under Expert or not) an
> ability to shoot themselves in the foot like this.

Shoot themselves in the foot? If you enable EXPERT, you better know
what you're doing.

>>>   Indeed, Julien's
>>>> quick metric shows how much performance we waste by having it enabled.
>>> Further to this, bloat-o-meter says net -30k of code and there are
>>> plenty of fastpaths getting a several cacheline reduction from this.
>> A similar reduction was achieved
> 
> Really?  You think that replacing the innermost shift and masking with
> an alternative that has a shorter instruction sequence gets you the same
> net reduction in code?
> 
> I do not find that claim credible.

Did you ever seriously look at those patches?

>>  by the BMI2-alt-patching series I
>> had put together, yet you weren't willing to come to consensus on
>> it.
> 
> You have AMD machines, and your patch was alleged to be a performance
> improvement.  So the fact you didn't spot the problems with PEXT/PDEP on
> all AMD hardware prior to Fam19h suggests there was insufficient testing
> for an alleged performance improvement.
> 
> The patch you posted:
> 
> 1) Added extra complexity via alternatives, and
> 2) Reduced performance on AMD systems prior to Fam19h.
> 
> in an area of code which useless on all shipping x86 systems.
> 
> You literally micro-anti-optimised a no-op path to a more expensive (on
> one vendor at least) no-op path, claiming it to be a performance
> improvement.

You appear to forget the patch patching to MOV instructions ("x86: use
MOV for PFN/PDX conversion when possible"). Are you saying MOV has
performance problems on any CPU?

Jan

