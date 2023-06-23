Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECB73B0E9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 08:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554229.865308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCacB-00076o-KI; Fri, 23 Jun 2023 06:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554229.865308; Fri, 23 Jun 2023 06:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCacB-00074W-HP; Fri, 23 Jun 2023 06:49:51 +0000
Received: by outflank-mailman (input) for mailman id 554229;
 Fri, 23 Jun 2023 06:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCac9-00074Q-WF
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 06:49:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25370c5e-1192-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 08:49:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6906.eurprd04.prod.outlook.com (2603:10a6:10:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 06:49:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 06:49:46 +0000
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
X-Inumbo-ID: 25370c5e-1192-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULKM2Hd9uYqqXheoE++k4UtR3Gf31YDSR+1jZncDT/RVhM0Ra6/1nrGG+9kJp+uSKCC6RsHf7/CI81R+tYy/6xduX3lcW2m/odp8S53nqDT8hs8P/wsGtuoy7tAYUm8ZPVSB+WoUTgmP/HJYgVfWIuxK6qR2zTcpK+SOnsbr5lFnotkB/uATlNZ3we3nhojsMDLJfBKqzjiB8Zc4N0TWLz9oTvNjU3QF7iMSt3hR48Af/17rMr09ruUm1VMfpXUqpk7aF/B0ivmy/fJWh8hqU/gjvwoQAq2+cVJpRZJW3azX740gexvhwXyh+v0EcdTjalDBsxKIG57upkIa9MS/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XGLN7Byf0hb8mpSTC/rlelxmIgsWi0ZmRrqAC72Fno=;
 b=T/BA0kZTq1wKQ0EqiCfpFY9ff4fR9QKNKlcuYPKwchXRowPhGp1waskfFSPX/V1vB8rP3BsWdmTO9iTBReZOfxR7Iy4LR2OIexb1Yt7UWDeKJawW8C9R+sDDo68k7vaNySQx1jErpWXE4acSQl96TZOdaMdHEV1Vw7fIfeDgA//0T84YtbtBS9hHWBScT4UdrAcpYcpRRebBSmngv/ASXW4/cAfzpx+p5fZfaM+FIWf00A/pOAO8u29/hbNrLCxMFZ/fuz12X8SOoPF5vWoizhLmrtSgGzABAm0NTG1TUlPMHJmxKQ0VHdK5b7pt2coz+/UfmGM+bx10QNQtlpdLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XGLN7Byf0hb8mpSTC/rlelxmIgsWi0ZmRrqAC72Fno=;
 b=bAQVTSvPGsmSaWN6rU1wo0kMsePGnuSH8WPjlAui/ZrxffmqIGS8aUlYUfkzYIJZ/0or1W/Sik4bdLXWvi6EV9Jj8zCAL7zq/Y7g1UpmloBw9CSkwO7liMh7rZaodVY0ILoazzYKdv1R6Heljv5TfmiXqPkPr5DZEj24teWmwrXiVlRtsxYTBhE2X2zsuhZwtT593r9kN0rEwR/II800fOiiohHHoZLDnLlkNVJ3Ae72gDGcQR1hhrLxwtNmxB4zhoJecGGqDmJ2Q15a+2GziuCGYR+VPCQZS2ac27Z3X6KoQEM9NDRwS3EXWjzNY/WUEKVRGgin+28J+FICTLM6Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1eae025b-fba5-04b7-9159-ed29b902f7d1@suse.com>
Date: Fri, 23 Jun 2023 08:49:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] x86/boot: Clear XD_DISABLE from the early boot
 path
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-2-alejandro.vallejo@cloud.com>
 <b254f8ce-e894-ffc1-c7e2-af69f8ee3529@citrix.com>
 <6493289f.7b0a0220.7f086.11fd@mx.google.com>
 <32c42471-9e93-58d8-9973-38fce5dcc4d3@suse.com>
 <64946d77.7b0a0220.2c099.b17b@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64946d77.7b0a0220.2c099.b17b@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5ed002-8107-4a1e-4ff8-08db73b607dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	26QIukfhoGgZ3v+8KdKiEXa/VXCMTP8BfedrtY5GazMzVu12nuEbKzRnw6xbYOzXaqK0hFsm50MzxeFpRtO0VDD0xXaa3QgLN+VEzkA0+jG569UI0aRIOxeyjp3q002XlNKiYVhcUkWKepQgTR28poC/mMgntUL4Mt/sl6zJzH79jqPePKWNYJWrSYpzIWhSWWBbhJLnd8dLID1PBTvPWY/BxDu+YcBD5201Tl68Ni3yzdfV/bZBE0ngo+kVVPJ+tyvgqG6Z7dD4PjYD8bAn2TFV/KnFVYAm80QNTV6wbUMGEBZdmbVvU+aCqZVSYYRRyZCJs95ohGk0nuYz7/T+MdUTslpmjPDTzgX/Ps55nHPeutD6kAb9CkvrQWRHFLFsIcwKBA8pehRV/uFYsqYIKQH9HQaIdHEBgZcLID9F7cnjSUeB9kbWwFbOKz8KeGcAPq7EjQM+gUkKvRCz9/nAeRULHzI2TvlaggYP2gEHGaKSAj+U0Wticd8I/Om6sPyc0mttsZ/g8mxj/7totI6Rl5A0YVball17HMawcy0I9b4e0ofD0xncwE3tdNSK+AK2NVeEmpyjM/v/xMOJbBppeAsIXs1sHH2aq6O9MUYPR3zsBTGnGD3X0XopPK9p9Dred287QrQ0BKgY6kgtj0h98Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(38100700002)(36756003)(6666004)(6486002)(478600001)(41300700001)(66946007)(4326008)(6916009)(66476007)(5660300002)(316002)(66556008)(2906002)(8936002)(8676002)(54906003)(83380400001)(2616005)(6512007)(26005)(186003)(6506007)(53546011)(31696002)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjUyVytUN3c2VGsvcGZOWHFaTktmbWhXNHg2L0NlY1Bodjg1U3BwSjdTcldy?=
 =?utf-8?B?aTc3YWczUm9RcGlnNWdSWFl5T2JvRnFwYmF5L0NDeUp0cFd0dzM3dmRWQ0FG?=
 =?utf-8?B?YncwWkhCZkNKenhyeXFQREtVRitoKzNRZURNZjYrSHcvQTZwSnlGZERjM3Fi?=
 =?utf-8?B?V3k4NjJaZ0JHS1lHSkxPUVFnYVZCSExPV3RWaEdnNkh5Mkl6YXRNQjFhQnQ1?=
 =?utf-8?B?dnp2czhwNi90WFhXY2ZvR1gzN3U5RllzK1hZU211cjljWVVQOWFoalJuVmli?=
 =?utf-8?B?Y1V4UFFTVGRMWUZKWEhCMjdNOTJRR2RPc1EzNWVwS2pockQ1ZUZjaGsvd2hp?=
 =?utf-8?B?WjZrbCtBd3phd05nOFhiOFBhU3hYcnpSaUJYZExvRURtcWgyVmlXM1A5d0V5?=
 =?utf-8?B?QnBockNhR3c4Y3R3V0Z6YWQweHZrbjdWM2FVOEdyWE85eDd5NnlKa25oYTlq?=
 =?utf-8?B?d1JsbTVFcFphN3hwUW9rZHRVM3JobFBjTUdTdVdsN1NETXRaUE9PNXd4YWI2?=
 =?utf-8?B?WEZhMXRQaUpLd2ErTHJZZnUyclNQR0Y2ZGZPOVI0eHhUVm1RVnRZdzkyVzUw?=
 =?utf-8?B?c1h5TERyMC9rcktvSHhka1pjelRUYmZzdE9ZaDN0amxoV0c5WTZORmNyMUpt?=
 =?utf-8?B?ZGxoREVlT2VzUGIxYW9wUC9ldVVGSWEwZUZka0Fnb055TC8wTE9scFkvTWd5?=
 =?utf-8?B?bUZuYWkxb2lSeWhBWUtLV0NIOWhaaDVhWUdHTHF6NmdtWGMzQzZBekZjYktF?=
 =?utf-8?B?NWtGS0RmeER2dHE4UTNiUFRXV244Y2dZQW0vMVRUVHpLNXBEbmVIajFkcU5k?=
 =?utf-8?B?R1ZjTjRZeFMwSUg5dHl1b3pqcEVQeEpzUzJrT1IvMC9neHNxRkZ2RXVPTlly?=
 =?utf-8?B?dkhLU2p5Q29BWld3MXpHT2xHZHhISzZWS1BQUXptRHBiOUpCOU9WejZCREpG?=
 =?utf-8?B?Y294aFZXenloWVlCdWpkUXA0YmZBU2xJR2RORitUUHNmbTZ0eWg1V25SUk5C?=
 =?utf-8?B?TkVlOWVUeDYvOFg4V3lkcis5RkNHNEMrSGYxMW5tcHNMZFJqNWNxZmQybGVM?=
 =?utf-8?B?MUkzWXpkRS96U25GdHRtNFR0Zng4OWRaU1FFRk93QzQ1aU84UWFBSGtTaVhQ?=
 =?utf-8?B?MEJlMzhKQ2REd2JSUHc0dWkxMDNaTEhLanVhRTU3dThObGFUd3oyazN3TDN2?=
 =?utf-8?B?QVBQZHRuUTh5ZzViNGt3d1dqTXNlZTJISDB2dVJ1MjEzZXNSZjdxTk9xU1lW?=
 =?utf-8?B?aU90N1M5K1JydWhheitwb2JOUDRwazQ0N2hYR2Exa1ovQ1dIRjFYUStNYm5Y?=
 =?utf-8?B?a0xZQk5XM0RTdnZQbXV0Y2hmTFo2Yk9tMDlQUFJrWFg1enB0NWtCaGNsQzlJ?=
 =?utf-8?B?TE8zZ3BHTWRhSjVhK2hnNnA3K0hid0VQcTQ4WUUyTlZCa3prUVZtNjQvVFo5?=
 =?utf-8?B?YVQ2Mzl2cnMrOUFZdDZDMFNyd29Ec29CY25MR0w1Z2w2UHZGSEdzOTdhaEtn?=
 =?utf-8?B?NjFSMnlIZnA0Q3REN1NybGZMSW1kTkhYZTlQdHhOR0FWRDhjcWFiRDA3QjlR?=
 =?utf-8?B?QUNrcHhGRDdTUmVDZ2hnK1VWRXVHRS9HaS9sMjlqdmcxOVJpNU5HZmYzbzV5?=
 =?utf-8?B?eGFlOFJVSEppVEh4RkQzdURkMDQyaWtKNWFJcEQ2anVobHp5bTVDamZNTU5T?=
 =?utf-8?B?VVFITjZhMStxUnpNVjl2NnRKTWdkNllMQkI1emdVK2NqOGwxejE1K3R2TlFp?=
 =?utf-8?B?V3lUaUNhMVVGQklqVXZHa2tKSWFqRitZK3dZR25ROVhBZktRemlzakRPZldB?=
 =?utf-8?B?Z2xIWTJ6cW9EdFR4YVUwbWcwUGZxR2VKYkhkRDJsR0JkZG1RWXpFNjg0VGFS?=
 =?utf-8?B?ZGlVS1Vsem5vV1JyZERFVjUvYzVKSkRWNHB0bEFTV0lEZFpjQ2RpaGxXYXNs?=
 =?utf-8?B?S28zc00vMjV2SHRFR2NyOHBTRVhPYmFEdDB5SW0zVmV6Sm94Q3JPYjAzS1ZB?=
 =?utf-8?B?aFRBTzFWQi9CNmZZaEVtVU1qQTNzWXV4dHdEUE96aWFVQ0ovOWpCZFB2bG43?=
 =?utf-8?B?VlQyVU5UVkRmdjlBQldXL0liOFVhOFF4Z1NkblJXMFVTQlVKUHFqaTRGSlJa?=
 =?utf-8?Q?AtS/LriO9h+m+npHK/yaLq4AL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5ed002-8107-4a1e-4ff8-08db73b607dd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 06:49:45.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzNnBPvd/8w7jm6ps99kgOf+Iitn/9R3oNExd7XzGorYphfi/efQr8XjXhowx883t6Tzc39sD5Vvbag0/qgi/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6906

On 22.06.2023 17:49, Alejandro Vallejo wrote:
> On Thu, Jun 22, 2023 at 09:54:01AM +0200, Jan Beulich wrote:
>> On 21.06.2023 18:43, Alejandro Vallejo wrote:
>>> Sure, to everything before this
>>>
>>>>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
>>>>> index 168cd58f36..46b0cd8dbb 100644
>>>>> --- a/xen/arch/x86/cpu/intel.c
>>>>> +++ b/xen/arch/x86/cpu/intel.c
>>>>> @@ -305,23 +305,23 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>>>>>  		c->x86_cache_alignment = 128;
>>>>>  
>>>>>  	/* Unmask CPUID levels and NX if masked: */
>>>>> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>>>> -
>>>>> -	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
>>>>> -				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
>>>>> -	if (disable) {
>>>>> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
>>>>> -		bootsym(trampoline_misc_enable_off) |= disable;
>>>>> -		bootsym(trampoline_efer) |= EFER_NXE;
>>>>> -	}
>>>>> +	if (rdmsr_safe(MSR_IA32_MISC_ENABLE, misc_enable) == 0) {
>>>>
>>>> There's no need to change rdmsrl() to rdmsr_safe(),
>>> I thought we established before some hypervisors might not implement it. In
>>> that case this function would crash. More gracefully than a triple fault,
>>> sure, but still not a very friendly thing to do.
>>
>> Yet then in early boot code you also don't (and can't) recover from getting
>> #GP(0), in case that might really happen.
>>
> That's true, strictly speaking, but that case is restricted to the
> incredibly unlikely case of "no NX and no MSR". As is, if we ever boot
> on an Intel machine without that MSR we'll hit #GP(0), regardless of NX.

Well, my comment was meant to support Andrew's earlier one. Why
check the MSR access here when we don't earlier on? Plus isn't
it the case that the MSR can be implied to exist when NX is (in
principle) available, as that "opt-out" existed specifically
when Intel first introduced NX on their CPUs? If so,
- when NX is not available, we would have crashed much earlier,
- when NX is available (or was turned on successfully) the MSR
  exists either because we wrote to it earlier or because we're
  on a newer CPU.

Jan

