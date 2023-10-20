Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C97D0866
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619659.965111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiuJ-0002rb-2c; Fri, 20 Oct 2023 06:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619659.965111; Fri, 20 Oct 2023 06:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiuI-0002pX-Vj; Fri, 20 Oct 2023 06:22:50 +0000
Received: by outflank-mailman (input) for mailman id 619659;
 Fri, 20 Oct 2023 06:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtiuH-0002pR-AJ
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:22:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16bd662e-6f11-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 08:22:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Fri, 20 Oct
 2023 06:22:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:22:45 +0000
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
X-Inumbo-ID: 16bd662e-6f11-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd/BL7Pc6qYyjuTJMqXK8IIyolCF8qHa1xQPWNl9PwgoGgYP2bhAVJ1PuDIkBUpqZLY6pQ/fBIFbdQvRMjSzhAP6PMBplfbjjd1iW/B1wOXMyTtlVb2MpN5up487sRzmZsNJmPhE3T++0v8b4LTmDCUcUVHSAMmvAqybi/xzhJGzdDPtzK7EaNelCwyGJJZXNp3mmj1g4UrzseBZKz42I6gz/PTaZzYsAsidYQ2y4HoP6mKmKbhuyoV5DFuwXynKIIP2XYA3pakazv5O4uqxP7LmsfOzGtLm+Z4GnpJ4Ak+g23xsXnCOEK/HrHZkZ8G61RhSg6rhRQ047IGZBeI/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoAtz4WDTTn2dMSL09FgOWGApZOQNwAa89RAE8QS11A=;
 b=ALIdwlpGEmwcUWPlQeSXJp9MmCj7t7cVKy9y9X4pnTQa9qTLveegX4WR1JSB4zyRBkhGuMaDyr6sm3JHZNVLZw/rJGKCsa5edfiud7V/wc76PLkHXeu2iP+4tXtMEPBD7n7Ut2ClJFF+Uzpbir1n2Kj+gxrczZZKeLr3ZFL+9e1/Y6vdXS0ajTeBf6QJdJ0Ex0B/RQ0WVn7wW7mRMaFAJCGvV3NX7dU78PulKtTS3rXY2LlnmchIBjIK3IoHY+fGIObmTPK6Zd+gbvvrVBrOMcRxHOm8eKc8dpBA3biHsVrrbaBmvEqGnHZLAMcZ3lyZmcDr7dqmqS3zpqbEL9efxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoAtz4WDTTn2dMSL09FgOWGApZOQNwAa89RAE8QS11A=;
 b=XaERV2Ajt1mzRYPUP+47KpvbkRvYhu5PcH1wExqxX6zzoxh8NcMKne1ZJs4wKxSS4JJsmnuuTLLzAFh373LpK3j4ELUnCwruCQbXHu9GTL/l2Nvq0iK0tF5n/Hc+eVzJUJiSNnaIBzRUiSANjZ+hK1z0ZmVQsdRKisJlNgnbIrcp7ZT44EvxikfpZtOvMRmVxmxTO09eEKTLVLl6Am66+5CF2Cek4aBqvJCdyk0wAcfks18Uvfex0DGpJ54tCystUGEKI+7k3slkwSPPqAjBE4TlT/KQWGE98n2uWjhSK/5HdjzOEHL74QjLF7xGrA3rXIiqoAK80lg8RbfPnMa+4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0990f0b3-ff8a-105c-5cb7-643f72ece945@suse.com>
Date: Fri, 20 Oct 2023 08:22:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1697220184.git.sanastasio@raptorengineering.com>
 <dfd134a6c59f329b62d2ecfaa37d74d70f8d4d90.1697220184.git.sanastasio@raptorengineering.com>
 <a5db276d-6bc0-1fe6-6cdd-7c097308fdce@suse.com>
 <4da4a57b-06ae-dd66-e8b5-a388f7e492b3@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4da4a57b-06ae-dd66-e8b5-a388f7e492b3@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9c6665-602a-48b3-fd6a-08dbd134f965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G+PVk7ngSm0hsnlFkf83esUHHIMjxV76FjjM+vrAD9xUd7BjifUuna4ivA+cbUXTlM/YjfmhqGj9v6nQzFDCOjbTXkrwyJFAFf4nOWQu3BJ8kdO4UEhHj8Fql3CzSs2YUkPg/jJbFiWA4EQkr1C5/T3/T7Qwr1FVeJRC7AiKWoAC3qMnt4Xb4AFXNFqOJdih59fpVbWpTHqBssccDNcY3LdNtcySvaftjczgUDOB4GGs3WG4wNEWF5hUl8co2mfCQqMP7D2hgvzQ0/4Sp5xuGwMWnEQjIj2E7GW5m25ij/6w5XbkgXo3BCYmy81Mj7ejXXV2JIDxLHylBIvoh647DY0Tc1q299UtMg7ZU+m4blkj53GOh4Ht0Zhvk1eCDidLK/InZi5I4TeC98BiVVfmsGMCP4WNBU+AQcwD3cClxG3IKrK4H3ynoAlibinsFNtbOY9x6rSUEFXQaUbP5mP2Yp7ettxZT/yE7dngeQ7w0G+2kcG2HuJU32FINIaJwBntEc9V4lM4zjDcII+ArVpciTn4Fge3g6mhv6dncoB9/ZbCMorgKy3X5ksEPXDfz9H+lR+9nklbqjiPYVWDtz2TwrYQ9cRZfsCW/GUz8pAcoc8+yIF+y+a706k0Gza5+Nb8+fmw2GGP5yPW93ZgwontEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(86362001)(6512007)(26005)(2616005)(41300700001)(478600001)(6486002)(5660300002)(8936002)(2906002)(4326008)(66476007)(66946007)(6916009)(31696002)(316002)(36756003)(66556008)(54906003)(8676002)(53546011)(6506007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmRJL0RKNWNTSmV1U3htaHVSakVtU1ZIVkhaSDdNd0ZJZThQZ09xdTZVMkti?=
 =?utf-8?B?dkZrTndTazZyaEYrL0pBL1NNbXZVT1YrR1RqN1Noc1lyOHR2VThHUDU1MGRt?=
 =?utf-8?B?QW9ZRnNOdXcxQlE5NE4vR29yTUFNYmhnelU1ak9wbmtraVVLMU5XaHlxbkxH?=
 =?utf-8?B?SWxaOE5iTTV2VmVaT0FVY3ZvM0FYK3lkWW9UWHdZdDRBaTNhN3dlL1RmWUYv?=
 =?utf-8?B?ZHArTG00RGp0WUVydS9NMklmS3VxamRkU01zaCsrVStNYWFxeDhTNml1WEx4?=
 =?utf-8?B?VmtSTjJBcGNXayt0bndwVDI3NTdzMXhieHNBVi9PdmVNRk5LSFlLbTZIZTAw?=
 =?utf-8?B?TmY1bVdncEdXV2lYUnY5ZE4xbTMvazdoaGdmckR1dU5EMzlSMUtMdFFscnFG?=
 =?utf-8?B?UHl2RXJCbWdmdlc2Wk1lZVJTQUFBR3R0R051Uk9JTDhFcnp2cUhxL2ExSG0v?=
 =?utf-8?B?bzR6Tjc1RUM2TWlIM24vMm5nU2d0a0JNaGFzSFBUc0U3V2M2UlNJbUlySklZ?=
 =?utf-8?B?bHFGNUdoR01xRUdDV1VHUTIybnJMcWQydmdJWWxzVkFmTlMyVUNrMmVPUG0w?=
 =?utf-8?B?QzgwZ2dTQkJYa29naXF4QXNJTjR3Kzk1Qy82Q0pyK1IxOXNldkdVOVA4clpB?=
 =?utf-8?B?WFU2NktFU2NEL2FjaFRDbEMrZUNsM3grd1k2Y2FqU20vcUtlcEJsKzZMa2dB?=
 =?utf-8?B?aCtxcEo2OHF1T2FGZ1kraHBYa2lSbGoxbjRITk1sWXR5WmlVRVRGYzVMYVl1?=
 =?utf-8?B?TEY4eWdUaWxGZnE1Nkwwak1HUGRhcC9NWC9lSDdLR0VZemlwSDBRcUg5MEtU?=
 =?utf-8?B?dmVwK1l1NFVzMnZTRE9kOHZXaUR3WFRYRzhyMUQxb1BIVW02NjZjOWh0VDhN?=
 =?utf-8?B?VWNyTnlQdmM5dkRGVHVVMUVRY3lWcUxRRjJnSHdDK2ZIdnUzVk9QbGE0aTUy?=
 =?utf-8?B?b3NxMEpjQWlFZVlCT284NTFGeVpNc000Ny9aejd0bldlR2pBRmxnSkRkOC9l?=
 =?utf-8?B?OGJoR1VWYWh3SitBTFVGaFhacDlHdzhrc2h1S3RjRXAzUkw0U1I4bDgzaVU3?=
 =?utf-8?B?cDdCYXk2OEllNkYyc2M2OE95ZW5vL09NamZSSFp1MWZBdTZYNFAydXE2S1p3?=
 =?utf-8?B?TENpangrQnhYeDdWQlBFWjU1SlNhQVJtTitrckdBdTUvSk4vR0RqcXNJZlFD?=
 =?utf-8?B?blJ6L0xrakswVUF0U3IweXoyS0FnWElIZ3YwTWJpL21DblNBQUd3N3dEL0Iy?=
 =?utf-8?B?bmZuMDM3TjVJcVFkUTNtZGhuOGZYL2NLWnFob2txUWl1R2JVRUQ4QlAvTUpM?=
 =?utf-8?B?NWJwTTFFS29PL2MyeUU2dXFRSmxyemxWSnltOURHbzV5VCtJY3ZLS253eDlE?=
 =?utf-8?B?VlFTdlhWU2lzSWpOM2Vkb3dpSEs2NzJYRlNXOEprVFBMeHRZTzkxVkhlcXJU?=
 =?utf-8?B?SE9WQlBJYXM1ays5dGhIRS9TU3FVMlphcDBNbFpEUXBRNkJtUDlSaGN1bm9X?=
 =?utf-8?B?NDU4a21Tc0tyZnF2eUw1MEI0R20raEN6bmFlZGVsODVLRENydVVwMzdRQ3or?=
 =?utf-8?B?dkNWaHlsMzcyai9vUlhENVJzMmVaNVdrRSticjdHUk9xMWRRRDRRUjNTY1hR?=
 =?utf-8?B?UHB1NHJwM0hESkQyb1dOTy8yR1RlUndCT1AwVzgrRGZhdGpHNksxZnJ4ZUpR?=
 =?utf-8?B?d0h5cXV5ejdnbTVabGo1SzIxRFUzMXNZOVhuVmFWRTExZHE0UEtBT1JVUVFE?=
 =?utf-8?B?b1NiSFJKQmxjRytEeTkybHpNdy9qOGtnUG1mSHVUbGNhcW5XdkEwSUt6c1cv?=
 =?utf-8?B?NG9HbzFrUkZody9zRkhUeXl0eXFyTjdzWkdxQTdPL0s0Y2JxSGpzZWFvb3FX?=
 =?utf-8?B?YzNRby9DL3ZkN1hnclFsbUlyV25iYVVqYkozUUcxYXFrMUpWMkNlc1Zic080?=
 =?utf-8?B?d1NrZktYYmNnUVdHZmJ2SlE2eFFjNEtTYml6Tzh5bGowTjBMcW9IQzh3M0lj?=
 =?utf-8?B?NS9mVVowU2JxaEh5SlVWY1F6NjV4SWZDenNQcC95UXZNcmlYeHM5SGx0T2cy?=
 =?utf-8?B?N3BYTWxUQm5MaE5hM3RINVh4Rk5aZExHTEpXUjBhOE9sVEZXQWdVd0c3Ni9G?=
 =?utf-8?Q?Ct0AiaTdJQaEksg//9eFeQjWo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9c6665-602a-48b3-fd6a-08dbd134f965
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:22:45.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZgmjxbJbW5Q1dA+KtSuClVkA1Owgqh1raqnC3AYCoJ5sSC+JowMB2WqEC7duJljupIowgGzjI0DTlHeCdGI7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467

On 19.10.2023 22:02, Shawn Anastasio wrote:
> On 10/18/23 10:43 AM, Jan Beulich wrote:
>> On 13.10.2023 20:13, Shawn Anastasio wrote:
>>> --- a/xen/arch/ppc/setup.c
>>> +++ b/xen/arch/ppc/setup.c
>>> @@ -11,6 +11,15 @@
>>>  /* Xen stack for bringing up the first CPU. */
>>>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>>>
>>> +void setup_exceptions(void)
>>> +{
>>> +    unsigned long lpcr;
>>> +
>>> +    /* Set appropriate interrupt location in LPCR */
>>> +    lpcr = mfspr(SPRN_LPCR);
>>> +    mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
>>> +}
>>
>> Please forgive my lack of PPC knowledge: There's no use of any address
>> here afaict. Where's the link to (presumably) AIL_VECTOR_BASE? If that
>> address is kind of magic, I'm then lacking a connection between
>> XEN_VIRT_START and that constant. (If Xen needed moving around in
>> address space, it would be nice if changing a single constant would
>> suffice.)
>>
> 
> AIL_VECTOR_BASE is indeed a magic address defined by the ISA for AIL=3.
> As for the second part of your question, I'm a bit confused as to what
> you're asking. The ISRs are placed at a position relative to
> the start of the .text.exceptions section (EXCEPTION_VECTORS_START), so
> Xen can be arbitrarily shuffled around in address space as long as
> EXCEPTION_VECTORS_START lies at or before AIL_VECTOR_BASE.

Well, AIL_VECTOR_BASE is #define-d to a plain constant, not derived
from EXCEPTION_VECTORS_START. In turn EXCEPTION_VECTORS_START is
#define-d to a plain constant in patch 1, not derived from
XEN_VIRT_START. Therefore moving Xen around would require to change
(at least) 3 #define-s afaict.

Jan

