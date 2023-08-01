Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273A76A8AE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573654.898544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQiZ2-0006kr-CO; Tue, 01 Aug 2023 06:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573654.898544; Tue, 01 Aug 2023 06:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQiZ2-0006jD-9g; Tue, 01 Aug 2023 06:09:00 +0000
Received: by outflank-mailman (input) for mailman id 573654;
 Tue, 01 Aug 2023 06:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQiZ0-0006j7-S3
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:08:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2088.outbound.protection.outlook.com [40.107.13.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6947f01-3031-11ee-b258-6b7b168915f2;
 Tue, 01 Aug 2023 08:08:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9909.eurprd04.prod.outlook.com (2603:10a6:102:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 06:08:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 06:08:28 +0000
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
X-Inumbo-ID: e6947f01-3031-11ee-b258-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWrbfhe9GHv1x+iFTPRndnrpcADcqsf/5vjs5LaxYzHkolZNZcXasR7/bDy80lc8410KmY10KPmx9cWupWATHS6WWg5njYRRW9q1fRawTcU/PVzQEztNYXfZNi6RB0qGNHgINaDNW5jfnjhRik0F9mo57TxPb3C4ifwjfP4invisnoJV2Ca+i2BUhqnlWnO5dZUq382mg6VBZ73nCktODnfcsS2TCEfXtJwTve5N1Qp5uMgVdqzekAKsa1kttKDSXcLbqZRyOnL9sA14xXKGBEckIIrczDwUzawu53qE7QXBvLEcy41vwH/WW0lnyJ694bdWx7/IMcGKYrnvU/952g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIfs5hKDkqyiT/bwRsOXNBcxi8l2PnB/lLqev8A8das=;
 b=U4XM2hwxeV9seoLA/iOOor4FHexbNmHR0Qf391u89RK0kmxvSwoY9CHij/79X0CnJB8hCWI/yk+OAV+Z6UdvtoSXOH7fpIR0ZM7MKKF/JWo390vANEwd8Lx9SfYzPC+6bZ4u4nR6vw3XGHdrFBHZYzhMz2aQtiqIlngdWpFTHtVU17wUYvBbkndH1zdAJQi1Nv57Q/jNijGrLIHQs+4WaNetywASsfkpFxIExbQkboE0jXU4BliTBfVZ3HshwfxUX4IWkQva9ib8AbvnuHrurggbsRQUxWm1N6Rt3RAIbpexWfwe2Z5DsTZVAi8mkeTf06TNS4k4ovhMIdRfBNnejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIfs5hKDkqyiT/bwRsOXNBcxi8l2PnB/lLqev8A8das=;
 b=lyL0SwspmZkUH5ZShiYFThuv3uST9Z1k/0yIQIZB+ukHti61hKPj5B7zZQ5uz6U8J2jMC9mOJzjjTfIGA3oryGq7j7N+slC77+V2t6G5iRR8CnJkCuc4vcaRFUj7YhBZYYGntrudoaFvjFrkTuc2LE2UOhSODrj4kI49TuYEKH+3svGqrFCjMgm/+X/mRm4fijdAVtVWdeslsx/F7iUYHuz7374Bvc9dOsI67MmxyAZw29sRNHvTtZSLLvuJ7yHpe5ISObMdRjZlTzhoBwfVRBhMhVqOoEz9rrY9V+DHbm0yZy010hOP0588lak/WV/tpUQ+vEHi2puolzZHQk+RmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f62e5ac7-500a-6909-90f2-4580c14e2a18@suse.com>
Date: Tue, 1 Aug 2023 08:08:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <0802fad2743526da4fe49f0225e14161464f192e.1690582001.git.sanastasio@raptorengineering.com>
 <3b6b0984-89fb-268e-970a-0c7eb19a4863@suse.com>
 <428aa0e8-70bb-efb5-2b5a-54229b77c5a3@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <428aa0e8-70bb-efb5-2b5a-54229b77c5a3@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9909:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c96a3b5-132d-4ec9-7857-08db9255b954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GB0tnogLCahuieDJ/Wa8T944Y8T8MUfMzeOAksBgeWHjaY3N7XYK8EYYYhI5hzkH8/ccb4zEAQiKuh12B2uqqODlEaeHcP/qFidAVK21IkzivpydXBxgyFMMnyibrn91qzYJLD2XRofilaMXgnvN7L36QxBetFI1GnrJTO8l5Q+HKvjfCgsJWVD9gPfVclO4TRdoWjh/olgcnxjn0E2bzNj3JDbYAb2niaUGcZ9Da7tj30lRAWn9QY5VNcdsX0W6XErrs+fKlThmOvc+0HEluqitEu+GN+koVMs6f6lfyczgy51wE2PpAGqbH31dFkAbL9J1qU7b5GDd7O8PTiHK+h1+6eb5+Q0rtKk4fKfucjx86bPhdx+xuJrrWMrhDlRMiapx4HaAEvXrXzwWzItISULYeGbYE0/MLMrE0+W81AwxA3WngNv0DtaQNbKeNmXwVexATdmCFOtPB3RVMSafsWg4QYLwKYE95whxK3fZtZl39CMfY102m5WK2w+oOE5oQJtdaILOTWD1YTqPu5r4EjCxY5vpPutb6oXKdcrvzUuOXI3MWxuw4HqgmZCeaAmV4cIc+OGCX6qhZr+pJe9l2+F4Cir+qtFxg1CmA+iJTizvIcxTah6YZen625ZyGxu9TVoj3YErDdux5BAiqLAKwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6512007)(6486002)(36756003)(2616005)(53546011)(6506007)(26005)(186003)(66946007)(66556008)(54906003)(41300700001)(38100700002)(31696002)(86362001)(66476007)(316002)(5660300002)(6916009)(4326008)(8676002)(8936002)(31686004)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1psS3V2SDVFeTViNkdNNS8xUm9obUxzcUNub1I1Q0FiQUZaMDh5ZmpIMUwz?=
 =?utf-8?B?VHFuUFRoRzlXSk5zVk9rVVpKQzNTekpGV2kzaW1lY1ErT3hwd1l4bjFualZL?=
 =?utf-8?B?enRCVDRGVDRZcllZajFkdnNZUnNHQSs3OGNVbkpBTDExRlZEVFY4c2xQNlJE?=
 =?utf-8?B?d0pPWHdLNXlPcGc1Y2VUZlRINFdtVXBNZlJYeHg5T0V5M3ZxR0J3TTF3YmZj?=
 =?utf-8?B?MTl2WTViYU5ZcUduUnozZHR0bG9vRGFvM3BBWlhqQklFbGZpWjRqa1QxN3FI?=
 =?utf-8?B?Yjk4eVovNlYzNHNUTGZEL1pzMW0raTFxallycDQ2UDhGd3E3M3htMTUrYmJa?=
 =?utf-8?B?c2ZuV1UyRFlEa3JvUGdCSVQ4bmlJcGgwb3kxVUkvQ0VMRjRJcWVYcDhjdFZo?=
 =?utf-8?B?R1lYeENkQy9WdGQ1U1g1dklJRGR3WWFpSWZLVHNOdzRsbFNWemJWK0cyZDVq?=
 =?utf-8?B?d2NBMzFMdTdHN0VXQ29XYWRtdUJrQkpzWmMreWpjRVFFYVRwd1ZhT3VzbU1M?=
 =?utf-8?B?bWVoWGNyaGEwaEdNbVlzK090dnpmQ2xUOUdtYytjMHM1Nms3aVA5Rm5rb251?=
 =?utf-8?B?RnJHdlc2Z2t0RWZNclIyY3hDUWtRem5LNVJ6bkhPZHplK3JBWXErRmxlcWt1?=
 =?utf-8?B?UWVXZE5nUzBpcmRnVURnQzlUMTd3ZFFEeFVCSVZHeE5Va015MTlnL01HUnV2?=
 =?utf-8?B?MzNNL2Z3SWlaUVBpNTVta3BnUllyQS94VmxaaG41TFBoNHhHaGdvSjVEdVlo?=
 =?utf-8?B?UkYyS2tMVWwvWit2ZThCVFBQc29nUnNPbmprTWk2NUlHWXYva1hhNGdJUDBG?=
 =?utf-8?B?YjR6ZHlpVG4zRzRrdzFMQzRETmVxcnJtRWpTVVJmT0NNSUF3UWFKWHVFS1Fa?=
 =?utf-8?B?MWRFY3FzTkU0ZXVEeTdvdE96dWxFaTlxckpXR3gyYVcyNVFiTzY3cUN1ZVNH?=
 =?utf-8?B?WjNFNStyblRRTksyRzJkV1FhV1JQY2s4TDFLY0tuQ2Q5ZjJjWVEraHJhLzNy?=
 =?utf-8?B?cmdOV3R5RWFVRlRSWEMvekExYXByT0NsYnlWZDM1Z2xrTzV0QkU5ZXVQN05S?=
 =?utf-8?B?WFIwajdFVDZkdCsyY2Q4RWxHR3ppck50anFDVDBCUXNXeGhFdWwvVVp4OTJY?=
 =?utf-8?B?UVVISmtNd3AvZ083UlBQd1JxcG0yTGZYMkI5cTFJZkNLajdXbjYzUjY4dlk1?=
 =?utf-8?B?SmhKN2R3UzBOYlRDcFhHYmdBbnZOdWZqU1YwUDRUc3Yyb1czczlSOWRIbXhR?=
 =?utf-8?B?TTQ5RnUyZnBPd0NuQ2RLYnBlbUdCU3NXK3N3eisveE41RzRmMWtCTjFGbGh4?=
 =?utf-8?B?cWcxejRWdXhFcmRmK0ZBTllMbWZka0ZNS3NDSk56RFJtWUJaSUh2dmtUZnRL?=
 =?utf-8?B?NW9jZFA5TDlYRmpXMHdOU1NNcHV2YTFXRWRLK1V4elhTcnNaNHpPL3NiZDNM?=
 =?utf-8?B?U2FoVzhvdHJOSFdncGtYQXRoeDJjb0dHditvSFNVZDdVM3FNbzRXc3B5UWZz?=
 =?utf-8?B?TFBLajloOWxmdFJZMklFNEhZREt4RkNseHE3SnJTTlpvNHRaMit6MUtSOGEx?=
 =?utf-8?B?dVVRZDRyMG53dUdwVjlSVmNsc2FXWXNjaTZkQ3hwL2xoL0pVdWQ5WW4yczB0?=
 =?utf-8?B?REs0UlVNeWNXTWRuS0ljNHZVUnRqc3p5ZU9CVitjbGZZZlJIaWJMdUswWHRl?=
 =?utf-8?B?c0dZcjcxRUVlVmxPaVlhVDR0aGRvQlVKanhUTU1MWkVrVGZYc21VNGZyMlNO?=
 =?utf-8?B?dTZLV1lTWnRIYWFTcC8xclVJYy9nME1QVXdIVFJDUzMwT3l6Z2YrZ0x2LzBl?=
 =?utf-8?B?MWZaOTl1VFZuejBVTGpsVlJHU05oTWpMdE5BSVFsNGhLNVBQc0RKS1ViMm4r?=
 =?utf-8?B?SkduWWdkVmN5TXNUWG0zaVlGWEo2UE94SXpvTXFxMUMwRWZHMXlGUVFUN3FG?=
 =?utf-8?B?NzJXRE9RLytwT0hGUFM4R0wvVnRLdU9CTU02S1JZZmc5dkRpWFhmTGtLZXZM?=
 =?utf-8?B?bUNtZjVyUzdnVERBck96RjdtTGVuMHpyS3poUkIxTFdZejUzd1pFbXpQZE5T?=
 =?utf-8?B?SFRuTDRpOU5PSU52TTVFaU5jaEtMaFJnQ3JwdmNNb2EvZENhTXhWUXBVNjBP?=
 =?utf-8?Q?3UiQa+s9MbX3VjudvH1qlUTcZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c96a3b5-132d-4ec9-7857-08db9255b954
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 06:08:28.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcKqoaRt/VA7G/fNVOeFL94bbVD7HuhWbyGiUFdqsP79puBT5PQlCEtLDANr7lqYf+GH2OE7t7U7m6NTXGZnpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9909

On 01.08.2023 01:37, Shawn Anastasio wrote:
> On 7/31/23 10:46 AM, Jan Beulich wrote:
>> On 29.07.2023 00:21, Shawn Anastasio wrote:
>>> +    /* If we're at the correct address, skip copy */
>>> +    cmpld   %r1, %r12
>>> +    beq     .L_correct_address
>>
>> Can this ever be the case, especially with the MMU-off behavior you
>> describe in the comment above? Wouldn't you need to ignore the top
>> four bits in the comparison?
> 
> It will always be the case after the code jumps to XEN_VIRT_START after
> the copy takes place.

Well, of course.

> I could have it jump past the copy loop entirely,
> but then I'd need to duplicate the TOC setup.

I don't think I understand this part of your reply: .L_correct_address
_is_ past the copy loop.

>>> +    /* Copy bytes until _end */
>>> +    LOAD_REG_ADDR(%r11, _end)
>>> +    addi    %r1, %r1, -8
>>> +    li      %r13, -8
>>> +.L_copy_xen:
>>> +    ldu     %r10, 8(%r1)
>>> +    stdu    %r10, 8(%r13)
>>> +    cmpld   %r1, %r11
>>> +    blt     .L_copy_xen
>>> +
>>> +    /* Jump to XEN_VIRT_START */
>>> +    mtctr   %r12
>>> +    bctr
>>> +.L_correct_address:
>>
>> Can the two regions potentially overlap? Looking at the ELF header
>> it's not clear to me what guarantees there are that this can't
>> happen.
> 
> As I understand it, any bootloader that placed the kernel at a low
> enough address for this to be an issue wouldn't be able to boot Linux or
> FreeBSD, so in practice it's a safe bet that this won't be the case.

Fair enough then.

Jan

