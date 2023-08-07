Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5F771CE2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577883.904975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwFs-0002ei-2q; Mon, 07 Aug 2023 09:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577883.904975; Mon, 07 Aug 2023 09:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwFr-0002bN-Vd; Mon, 07 Aug 2023 09:10:23 +0000
Received: by outflank-mailman (input) for mailman id 577883;
 Mon, 07 Aug 2023 09:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSwFq-0002bH-DY
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:10:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba2d21a-3502-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 11:10:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8991.eurprd04.prod.outlook.com (2603:10a6:102:20e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 09:10:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 09:10:18 +0000
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
X-Inumbo-ID: 3ba2d21a-3502-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqydhE+CMnm8Fd6FOG68yjeLpfRiVBiENtXpCZkYYU79PM5tfZDaola3gGrHL8SNf6jtWAmbHk0ijoqK50Rq4y5NwhHYMfxP8zPikwKafkk21BpCW/8B4nmZa6azvoCQxyhzkUAuLXlF1qqALq6OHQD06Ym5pdIDOsItGhBlDzHtvmLD3qs1FNexeXWtTIEL85uAu1dEcg+qDM/ga8wGdQGfMQFFBB9NJZKvRyI+2Z9LDwlD1HE6xr1pMOO+nEGgDvXN69a4ql/J9rSkivngds8neg5ROyu76xkEZopv/3c3zFhWoctB1wwIGqaVRp7xRT3JnTC0Srx/hwUIAqM4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iULD9PC1B4z/uqDN24cZIQpu5EoEqPNqEs47fA33AE=;
 b=E6aVrCSae04D5C7iyTypXzH/328765PhfliwKiZAxl+hjqy7IEUBuPqIrJoqs6auu8+0JymCmkAP8QAuCVINvpWiJrvsgdgvu1Ht8gKDU0m/J7HOtD32d5yiYImo+4sNdFPKQJ4tKppfJ2+6Xdke6SVdJew+8cRDUTO/ggop+Hod7ArQ8RiqoIYbk0wHUnkAFPm/mcA52CNGauPqISqtHl3HmgiiJCfjHXDYQAsgS9Fz0BHDStmvIGhCODbl1l1PZOxlqnHpCmFoZje/njZxbGx0K/rxXlafqimDF1BnqRKdoSKrxLaEN72wxqQW4kY6gZ9UbSojnn+/4F2JDo1MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iULD9PC1B4z/uqDN24cZIQpu5EoEqPNqEs47fA33AE=;
 b=BDeua6S+58JcfPxhCAlFfVMaTsRKNNNxThLsmVMH4jnMBpo1z8bCyc+dun7EWs2NjB8yg83tRMUnIf2+aQ9Xo2G0mDFMqeeYMfN9G9McJFng3Sb/ODt1c+x1er619zmrEOjEGat78d+ZozdUFOClv7qAqlDyYdKKQnH9/MhAgITppaVvc9dRZfnh+Q6Y2MsYk6JREum7sMJadnpaYkrefOcIpbROdACkt1izO/+G/e0a4rkn3LKeLLf6iQoHVsNPHmedeXy/BbEnDoo8WHM4K00172lHFFYFL9M9rITD4UMhVfjryhHHgdbtrRwRD3pS4ipDUc3PgFWVctYchxZNxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <742f4a4a-5938-82f5-7e76-1189a2519063@suse.com>
Date: Mon, 7 Aug 2023 11:10:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
 <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9fe7bf-3e9f-44ec-0945-08db97261e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xpkXOJTNigV41y/DdOWh4SOKkoexKuib+YWHihp/B3eVS5fKBxtzQL4Pupy/w3Y64QZUp9WgB1zhJaISe92CpyZcnfM259IH4lA5zOoQ+JpiIT4NXQCH1V3IIxtQ8wpjYw7E/6y0YKIDuCfCR3xr0In7vpKoU2Npn81TzWqXMfN2DBvp3mZTzcEaCa1bbWRmA92Yuj3plUMPA9A+ioDBf7NEX+JGJc/OmBgv+JRazH/C/ctKBohGNeSxzIkdMpMbcyEQ7CzQ9ysVzW/cy9uohBIEkwQ3FD6HDK/97Eqpla4OruJSBsiTcK1WxO7AC84cTuMNoT7D6mo74a5FTBcfE610gfyAJGWO5vHD+UBXk1WTo4UeFQqDHZ2pXpgi5ulYqyMTpbC6wcZTyWfj36lr9kayFaFSN0trqZgGdNqUOiYqSGFPv7Eft8Kl1WdUuhsWC6d47XFU73XtgJVXKh9ykQe6dR0BAaTKOBFkXojdDD00LV+SE7LATax2tI9577lWEbvX1kv39qqwCs4l0nc2LZjFWzPiGGA9hsVWXOIces6DDbQZ69JKOTAzFZr23j1Ci2frDisTPegPMSq9zaoEbn50G3oAUAz2sb1pZ+8gT4lXXQ4hsHAkZCbxV4DKwlINsDJ/DxU1PgdK7fGWHm6OgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(1800799003)(186006)(2906002)(36756003)(5660300002)(2616005)(54906003)(38100700002)(6486002)(66476007)(66556008)(6916009)(66946007)(6512007)(4326008)(316002)(31686004)(41300700001)(31696002)(86362001)(8676002)(8936002)(26005)(7416002)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUs3UDFrNGpVRXkrVGRiMFBnR1U2SVBIQ29sT2hTVjdoRzd1ZldFOVpXU0xs?=
 =?utf-8?B?U0I5NGJUeVY5a0lPQUczRzJ3L0dnK1MySGl0RUxMb0VGRGxnKyt2R2hweFRh?=
 =?utf-8?B?SHVxc2ovOWppdVVwWmtCeEJaclRDd0hMbi9zbHJqWG10K24vMEZLVzRBVUdn?=
 =?utf-8?B?OWJ6QXY5Q3c4MEVXazhYOE1IZzRZbDJLc2FxalBLUy9neG93dVRtck96VGFM?=
 =?utf-8?B?NGY0dnBaOWU3WUNuMTJPMGhDbHBlakRKSlAxWjJKU3VhRkpmTHVaU0RMc1Nl?=
 =?utf-8?B?WVFKNW5BUVJXSTBTR25kRWVCQnhnM3dSb0NzWnhOS0M3ZkNwQVZzMTRjRWNQ?=
 =?utf-8?B?endPanJwaWV5aUZnS0VHdDI1WGd4OXF4VmpOS09DTE5saHo1M3dCNWVoL2dM?=
 =?utf-8?B?R1hFN3ZhdkZRUis1UHdVaEJvMzZleUR4M2I5L0ovWHVaS0xJRVRHOVZsZkVN?=
 =?utf-8?B?ZXJpU2pWSmhJdkZEU2dENGZyL042ZVlSTXY2VHlaL3pYSk9lNzlrVFZrcy9q?=
 =?utf-8?B?WjRCNjBCcmNxRGNTd1dxZmpzS0dWN1ZINkZlRzdXRkFub3NOYjQwZVBBczNk?=
 =?utf-8?B?RURiVEZGMHJMbnp5aitGT2x5TGI2cjRjenh1MnpqMjI0YzAwNHJqZ2d5cG5L?=
 =?utf-8?B?enNIUG5hSlZUUHk2ckVmSmszcVpiWVp2MnZMay9wZW04Z3F2WDVjb1lCSTNG?=
 =?utf-8?B?b0VVYlJkSXNXZ2RYWlYvQ3k0K00yeEpiRXJLZkNHUnQ0UGprZHZnODBLV0lZ?=
 =?utf-8?B?ZjZKY3dqL09TcVUxRmsrOVUvaFJJNEVLa0lZdlhFa0xXd0FtMWgyZmlPWWc0?=
 =?utf-8?B?Ym1lT1dBZGdPK0VoeldUSThyVUNxNlU2Y25TR1oxSU9zcmcvM1hXU0w1TEli?=
 =?utf-8?B?NGpQTzZpZ3N5VGpibnVXdzBlVVcwT0p6TC9zMXRGWUNnYnZTL1Nrcm1WR2cx?=
 =?utf-8?B?eEl4R2Exb2R4dUxCNThtRUFseElYVUROYlkzclRPT0dxRysreUsrYXViNHMz?=
 =?utf-8?B?ckprZExCRnluRFFCd085Ky9sTmprMzJCdHFkWE52aGRuTjdOaHE0SklEZWhh?=
 =?utf-8?B?K2Y3RXkvRFh1SlZVcythWTFaSGp2bFIraGhYelM3NERLcmtpdjhjN0NFbExP?=
 =?utf-8?B?eFhNaThSQXZpVHdlN0ZoQ3R1a0NFM1RlMitPUW1lRGZ1TUhnbWdmaUhmSkFx?=
 =?utf-8?B?ek1RWDU0WlQwK1JuUnNpOFBGOE9BNzlxRDN4VGl0SzNNZjlBdDhPWTdKY0pH?=
 =?utf-8?B?TTUxRHAwMDdFOXdqejlGMXhqcCtWUExnSWd3cVgrTk5kOTUzYzgxS0FiaFNI?=
 =?utf-8?B?K3cyN1ZxWk1CNzQyUms0Szl2M2tOVTJqQzNMQWRpM2RWY1J1WXMrQU53NHdN?=
 =?utf-8?B?dDZSTjJ6WnRaYUpoUWtGL3J3ZXlRbHU0MURYVnRzOG4vbnJlNzRaU2NOekZJ?=
 =?utf-8?B?SVVRa2F2VEUyaWJZU09PRjh3a3VUSWNWbXhvV1ZXNXRRNXgxTFMycnJLYXpO?=
 =?utf-8?B?MjBqcnF3bnJlaWM4WEJwTVQrZHN3dE1yKzBZTEhCV1BxZi9OeVFpcVg0QzJt?=
 =?utf-8?B?MjlGK0pPQVYra1luSG5XNkdhalo1cHZQTlpUR21uOFg4N0lEbnVwZFFFUlAr?=
 =?utf-8?B?ZmtyUlI4SExweUJsS3p1dnNpazA5R1dZQnZEejNWbG5EclZoVEJkeDFNRmFw?=
 =?utf-8?B?a1lLdnVCaTdrVjNsS2k0eHFZQ2tjYVBqU3BxVHoySUYzZUxTR0tESXphcTZ4?=
 =?utf-8?B?VWVuSnltWTJ5TkxaZjVsYUIvaHNxM3lZbVVFd1paTjNDSXlKZHkrOGV3ZmRG?=
 =?utf-8?B?TWR3cFRHZmZ4dU1aRW5KMlhRdUtpaG51Snc3Z0N3dVJQQVllaFc0eWRzQjFv?=
 =?utf-8?B?ZE9NMlp5RG4vTmpQaWYzTG83UXJjYWRacHlEMktqUERXVTR5ZURUVVlkYzNy?=
 =?utf-8?B?VzN4WFRndVBpNVh4aUZUNmdIRzdueTJzQmRNa0pmbkk4VGErZU04ZjNEcTVO?=
 =?utf-8?B?bzUyc2hPank0Z3M1Tzg4M0JDRFFJQ2N4NkN6NFF6MVBCakxoWGZ3bm8vbVdw?=
 =?utf-8?B?VzhhZmFDWExGS3hFNkx6aXlIQ1Zid3dSaG9JRlFEeXlzN2VQTitmZ01xdTZm?=
 =?utf-8?Q?MmnNTVsdGBhRndaCWeSNPLqjf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9fe7bf-3e9f-44ec-0945-08db97261e78
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 09:10:17.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm6nXsMbApXrUyql+IeFwdlme86aYh2zp3UiNiu2eVym433VWRVn7JaCYUQnES35pMV5baesM6Z3Udqul8/D+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8991

On 07.08.2023 10:59, Nicola Vetrini wrote:
> On 07/08/2023 10:09, Jan Beulich wrote:
>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>> The variable declared in the header file 
>>> 'xen/arch/x86/include/asm/e820.h'
>>> is shadowed by many function parameters, so it is renamed to avoid 
>>> these
>>> violations.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> This patch is similar to other renames done on previous patches, and 
>>> the
>>> preferred strategy there was to rename the global variable. This one
>>> has more occurrences that are spread in various files, but
>>> the general pattern is the same.
>>
>> Still I think it would be better done the other way around, and perhaps 
>> in
>> more than a single patch. It looks like "many == 3", i.e.
>> - e820_add_range(), which is only ever called with "e820" as its 
>> argument,
>>   and hence the parameter could be dropped,
>> - e820_change_range_type(), which is in the same situation, and
>> - reserve_e820_ram(), which wants its parameter renamed.
>> Alternatively, if we really were to change the name of the global, we'd
>> want to take a more complete approach: Right now we have e820_raw[],
>> boot_e820[], and e820[]. We'd want them to follow a uniform naming 
>> scheme
>> then (e820_ first or _e820 last), with the other part of the name 
>> suitably
>> describing the purpose (which "map" doesn't do).
> 
> Besides the one you listed, there are these other occurrences:
> - xen/arch/x86/mm.c:4678 in 'arch_memory_op' as local variable 'struct 
> e820entry'

This probably wants renaming; my suggestion would be just "e" here.

> - xen/arch/x86/include/asm/guest/hypervisor.h:55 in 
> 'hypervisor_e820_fixup'
> - xen/arch/x86/include/asm/pv/shim.h:88 in 'pv_shim_fixup'

These can likely again have their parameters dropped, for it only
ever being the "e820" global which is passed. (Really I think in such
cases the names being the same should be permitted.)

> - xen/arch/x86/setup.c:689 in 'kexec_reserve_area'

This surely can quite sensibly have boot_e820 use moved into the
function itself.

> We can take the first approach you suggested (which was my original 
> attempt, but then upon feedback on other
> patches I reworked this patch before submitting). My doubt about it was 
> that it would introduce a naming
> inconsistency with other e820-related objects/types. Anyway, if e820_map 
> is not a good name, could e820_arr be it?

But how does "arr" describe the purpose? I would have suggested a name,
but none I can think of (e820_real, e820_final) I'd be really happy with.
Just e820 is pretty likely the best name we can have here.

Jan

