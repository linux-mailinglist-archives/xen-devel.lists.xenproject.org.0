Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC78720285
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 15:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543133.847821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q54Qd-0004nj-Q3; Fri, 02 Jun 2023 13:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543133.847821; Fri, 02 Jun 2023 13:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q54Qd-0004lz-Mq; Fri, 02 Jun 2023 13:02:51 +0000
Received: by outflank-mailman (input) for mailman id 543133;
 Fri, 02 Jun 2023 13:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q54Qb-0004lt-Pb
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 13:02:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a66dfb-0145-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 15:02:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9473.eurprd04.prod.outlook.com (2603:10a6:10:369::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 13:02:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 13:02:45 +0000
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
X-Inumbo-ID: c5a66dfb-0145-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9xB4z8JbzxJd5MSLVJpA7vdSNeV1qfvbYWS/NtY57qgbsCw+bwPwFXsO4hU8knrG0W8TRBmW6ihS3jr4wE7ePDG+xUdP15HoqBW+93JpEwF+ICD7IC9I8KLW1cswNFbwWz3KN4xxxlFzTao6x5SW1FFEAiH6Eklen8Uqg5gWSMEyNZZM1ND1h38NFL36rBTexqZnfIQhr4eqZzToGtRUXCqIiq4pJdbrZliVokPtUjx7WGFb8u6xlDaJFiPWSoLYZ3l73Mi9wOftSFdngndkb+JLoO5OsYgYRAIdFq+/5SpqtJCHzuxS5Uz+KsdLd+oU6aO9NY97ySSwUgXkLc0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTUpbQGZEwaS+dRF/F/pVs77IdqMv/fPz7OCOMRFwQU=;
 b=XpKC4si1zRDK6i63dYIPwcuMrWeAzPNMVUVcfsUohfVBOO2hXvHJ4hx5OposleAc0QMm4IgFTV8jK/04J/YqYJg1ngEgYbrgazo8pHMRn3j7IZPN7+ZSMtx4cQ5WAt+MClHaNFnUHVDiSjqpwI81aNQ+4wNDSiwNMqgN0qIkyvdsKMrsFE7GT+Fcq/9ZAPeINeXslkvTHqFerXSvXR+pKtUALi5mDgpELlb5gtCzGx0Va2I9V3DFwCH52nNgMpbSFHkXnQHpBPI9Q6Eky/XrOHGE7WJXSm/nwEPPo3ATnsjOb9Az72RkLcf4QILk0SZFho7ruuLdj9kEvDzXYWlOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTUpbQGZEwaS+dRF/F/pVs77IdqMv/fPz7OCOMRFwQU=;
 b=Q1VW/pm3/spCVuiW8/3ICRVyosi9ZOY/P9zUJZczFmu8Mqzsaxd11ET5L7kyESBvE6q5Oah6CWeQNKosBAS+VaqDP9Kzk9BMHep8bMqSLr56UXOajnx8WZC/NmJ4Un+oQHPxWkntnfEX/ElL+eP4U4TYH8k9YfAmwpnQ4QtAO7fNk12ueO1g+AUd95wt0Hv11jn/Lgi6Vvk07nnbB1ogAAv0mlfagtkE6MKVTNJM/uOTgnNZ05oDesjM9oBfEMu0LLsbmt82utCpRNUHAfha5G0pBgq3UQoZSc4nYlLSXAvrWBh8dt1E3nup6z4dVtzjQ8UVsXMy95LS8kCR/BpeSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <507583f8-94ad-436b-e2b7-7ea6123e411b@suse.com>
Date: Fri, 2 Jun 2023 15:02:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
 <e5cf73b1-4ea6-bbe1-5935-eae6831747fe@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5cf73b1-4ea6-bbe1-5935-eae6831747fe@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7eb055-2f12-4ab7-f10e-08db6369a851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r3mtPpMMqu0oYbYmmIiLoxPXRGJQVkBoxdIX10bHCJRSz8n8fs2Tlts4IWdk5D7x8q/b17n/iTMvIm/2gvEY7IjfP3fPMJkCk+jAf+MRL/0pkKgpFjyOGujJlSZyLnWqOdPA4H9loN3YqLuUtsWTYFttpmTTHVfC/GAClYzmOWEoqELUQI/M6OPiaIDqqYfKN9tNjkTOZbj2qpAMzcVF/aoj0MZr4wx9WtaqDOmnh/knCRILZ1lgOA/skTS9KifziAumSZcu3qK+otoS5e7Xby5fa9WmOvmF8KxZw1Z16RfNym4S8OrbiEvz4RlOzx9ewxsmBBGYzHBlGihv/vqOSy0LQtuWjhjdjqMMBJoS+E42eWc2JxL+0V2+eyDr9Ar3+E0aKhyrPfFr8Qa8MUlLQ/FxtbybHiKO9+9NYFXFUs4HPaibaTzMwmbHU09T6aui+29IN40ilLY6ItjJ5bhCMB57vJsXdCMN71TjKtnnOSHwbS7JY39viaLT89WBphkvD3zZGld7GxMQTIXumjYHmv6gTuZU26U9RXc8MtEWNP6loC3Z5mz0h0bmehYUKjpICU5kzvLWYMa95rs71KeI78Ak2KS2NEHSDa4kGQKyplTuq0Tg8rE7eWnUjchmXzrR8FhDj3T3aGcBDrNVWGoYUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(54906003)(38100700002)(53546011)(83380400001)(6512007)(6506007)(26005)(2616005)(186003)(41300700001)(5660300002)(8676002)(8936002)(316002)(4744005)(36756003)(2906002)(4326008)(6486002)(478600001)(66556008)(66946007)(66476007)(110136005)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHZFWUh3aGNSQUVBV3ptMjE2TDJkMS82QllaY3EyckloemxXU0ROTlNQc2VN?=
 =?utf-8?B?QmZwRHBoMXNJYlpDN1UzTk51OWY2bWN3UkhNZm5zYjdwU3hycU4wTDUvNW5p?=
 =?utf-8?B?Rk1laWlsckV5UHFiOWFzWnF2SDlnQ2FISXFDVzg3Z0hVa21tOXhjNndXZjVp?=
 =?utf-8?B?Z3kzL1F3bUVqNVUvSC9jcWJQNSthV1IrOHBUdHp3akNYcWVvRWFVQlNOM2Fr?=
 =?utf-8?B?T3N4djNlTVZOVklqajZSRE9XeUY2MlZteWQ5bi8wOXB5UzdHT1RDUldQWGUy?=
 =?utf-8?B?Si9pQWhvYkRTQXFXcUhGSlRpVG9zTmlaTHNZNVRpSkFEVTR4bDNqY1huVEla?=
 =?utf-8?B?YzVpVEZoOTc3dXpMUzdkMnBnWnJkeWRFMlFlcGswL0FhSXN6MGpBRUV5Mk14?=
 =?utf-8?B?dUF2OGZDa3l0eTZCTmZneDVGRkVYaEpNS2p2WWZMbUN0UDZoSURORkRGNnI3?=
 =?utf-8?B?bEJRUy81RVNYcUNUOFpCZndsUHc1Y0EyODFRMTVVODZkQzh0UGNJTVJjOGhE?=
 =?utf-8?B?NWRFWXNUNUJrTTlTN0VpTTdUZlQ4NkcxZ3dnaW1RWW1NM2h3K0xEcnREdHVN?=
 =?utf-8?B?ZlFYMXFsb2hmRFkvUjZKbUtjVWRGS3dzWG9TcjF6aExLMGJJalVmSENUNENz?=
 =?utf-8?B?Z1ArL2hSNld0clA3MjYrQmR3OHc0QkFHZlZGdUppSExhMVQ3TmtOU2VtaEo0?=
 =?utf-8?B?aXluSlVSeFNubFhHZ1lMK1FGcXFSOGdqOGxoeTFQY3ZtZGVydlJnTVdMdENu?=
 =?utf-8?B?MThPcy9YNTl4UXhzdTQ3bE9WcUFpbVNFMlNJQnJZT2V3OVpRZWpUcmE5aWNF?=
 =?utf-8?B?T2l6QVRROFlrbllLakhyRFJ1Z3dlVmY5U3pHQzdubWc5OHJiQ2ZwcEdid095?=
 =?utf-8?B?bS9lY1R0UGJzcUFlTHJwc28yTUN1SllhRVp6ZDB3NDYzKzUzVXhlNTl5L1kz?=
 =?utf-8?B?QXh0YTNQSUROVjBoa0twbFpOcUVGWXUvTmhvTGIrK0xtNis5L2p3UzIrWHpY?=
 =?utf-8?B?MEJZcjE0Y2gwNlFCWWkyMDdBeWhRMGoyTGQ2eEJ5RHJIbGlVWXUvdk9Xdks5?=
 =?utf-8?B?eGRvZThoU3REQ3ppakdhaU03RFZrcFBuL0RMNEx3d1Y2RTJTTGl0amRaN2dT?=
 =?utf-8?B?cWtpbzFJRjhYQ3RYdklwVUVDUmZHOEU5S0hDL1Zram1FRjBHNTNMYmsrbFlF?=
 =?utf-8?B?YU9kNlM2ekt4d1pnY0MrcTNkeDFPRTB0NUp4VWZlUkl5R050WDlWY29Gd0VN?=
 =?utf-8?B?dGM3MXRIamR3M2d2cU10aExucFRzLzZncjVjdFRFRCtBaG5ub2VaS2QyMCs4?=
 =?utf-8?B?Z1JuQjJGa09zbnZBUXZjNXBPUkozbGVnQk9nVU96KzNsMStPUHJ3Z0ZBbzBv?=
 =?utf-8?B?bExFM2c1bkVBOXBBMi9GOGxVdEVYNmxtU2ZTOEZGTEk0Q0NiZDdvaDNsTFYx?=
 =?utf-8?B?N2NUUHl4UEFLck82VjZVeGdPYlJJY2tiVFJXOU1yTG10Ull0TkRWcXFZZXJE?=
 =?utf-8?B?b2lNdlJVei91NmRBaWRLRTJRazNnL21MSFpZeGNlWDhsREVrcnpCc0ZXN2Fu?=
 =?utf-8?B?ZlBiYzk2TE5NdytQT2xJTDZRc2tCR0h0b1A0Wk40Z1QzRG1lbDQ3TmtzNzAw?=
 =?utf-8?B?b2VnOGlCVkFKaCtFVmJTc0xsai9tSUlNWURDd3M5RERoakppVFNvQng3dGlP?=
 =?utf-8?B?dHZGbk9qQ3Z6b2FRR29idEpLUHVqYmtkK3BrWFRpRWR6ZUh6R2FXM3BqQlda?=
 =?utf-8?B?MjhkRmRLK2hxazhsRGNRNVJiM29MSHR4dHBsbzJ2d29Mc3Z6NDdLRFZwZnpZ?=
 =?utf-8?B?VzZHWUpFWXNzekZKSWlWbnZFN3BwSm5EQzNGR0lWeHZaRTRDTzFENTlKMWh4?=
 =?utf-8?B?LzBVbnB6QnNxSThGQklDbFpBM04yV0l5aE9oL0I1Z21ZSERiUEpWdE1ZemNh?=
 =?utf-8?B?d01wUnhYcDR1UG1ibnVUcDZtdTNORUI3djMveFV1RlJBTm5IMFFHL1VTbjF3?=
 =?utf-8?B?NjVoZlAwMEN3TzlrbURXVks2YWZYc3ZtYk1HZlJzdzFPVXU2b0lHYnNIOHhQ?=
 =?utf-8?B?YVI4b2RPd3dOTGg0RmFKWFBtVnlVNnN4OW5iYS9nSGNWa1puN3hxTmRUQzVW?=
 =?utf-8?Q?b2PnXR6PKW2s0hiZzqCdIrsxz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7eb055-2f12-4ab7-f10e-08db6369a851
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 13:02:45.6140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6/qLcaeuf+TAnxbACvqjJrJJHrJ55MYnbwj402raVxtiseA0EGK6RtL0G/vjgDcPzsizrSNFbg/JKXHoHR57w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9473

On 02.06.2023 14:05, Andrew Cooper wrote:
> On 01/06/2023 6:43 pm, Alejandro Vallejo wrote:
>> @@ -151,6 +152,11 @@ not_multiboot:
>>  .Lnot_aligned:
>>          add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
>>          jmp     .Lget_vtb
>> +#if IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
> 
> This doesn't need to be IS_ENABLED().  #if will DTRT for a non-existent
> symbol by considering such to be 0.

And then it really should be #ifdef, not #if (like for all "real" Kconfig
symbols).

Jan


