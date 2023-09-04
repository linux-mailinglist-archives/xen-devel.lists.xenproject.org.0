Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF279192F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595243.928749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA3Y-0003Vg-6M; Mon, 04 Sep 2023 13:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595243.928749; Mon, 04 Sep 2023 13:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA3Y-0003SA-3Q; Mon, 04 Sep 2023 13:55:56 +0000
Received: by outflank-mailman (input) for mailman id 595243;
 Mon, 04 Sep 2023 13:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdA3W-00034Y-03
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:55:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c26b119f-4b2a-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 15:55:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7052.eurprd04.prod.outlook.com (2603:10a6:10:12d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:55:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:55:50 +0000
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
X-Inumbo-ID: c26b119f-4b2a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhgnukQIT3x+izTNuZKFOkC57LekWn1HsTpG9jTtcvVztDqmXCLg0Vw7P0A+vzUwOX/0P2jFcgHEx+TKJgShZVcqFgjFynREfjgqDxdjkaSwc3UTyZC84GOdaaQuSyoxQsawMxIzrKXmh099xiSjO+Wr+xj6er4cR2YULl+islouFq+oXnUMpzFAXSGs23on1Lb64rltQW9ozy4iSjAP3gTw5HI1oG/91C5/rYEOgjLxNyTwN3wl12zDrUsuxPIMzf/mfe3Pq7Cj9JwgkDmhAWGYFHEi/lItdF0oc9ymamoKK1DHTAxxhW/3MaclJkvvAABBvVGM3Y2+sKYa00P9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0P1Z8DGaDzApWPE0F5c87R3dy5CngDY71J0Rx6DZRk=;
 b=fxhvbjM+GEKf6alLdzHOdWKEbCRE2TrcnlpgUuiW0h7ePo89jQikv8LiGRDyIThuHoloGqfr7I3uQ4PShwn82W00iTA/tyIG/x5/VBgFAP+/w23j39XZBmRrAUeOuORH/hqUHOptp/dhvkKdjDprHAORtqP17dSXtpAftM2UWtAPEmDM0DH3JcfW/3exJhRhMyzWme9bbIwVK6BAVcjiXM7JE5kYhleY8508lp9zGRJ8IOSx8o8KRUSOcX1xLinLy2YgiUwRlPZvnqGJVV4ds6OZcxi3t3mAVc9AWDUgffDgKtQpKg16jHtCcabNZoBFud9qQG1C5aelfdfoTiZOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0P1Z8DGaDzApWPE0F5c87R3dy5CngDY71J0Rx6DZRk=;
 b=1MQma0s3NJjICsGFGvLrpevMcJArtG7tCByKlJijF7j+mRZ0jr0qHO87q2jgiW5qVsQiK2RZEvO7by4ahrP6KOEHWpGjvCc5jwRzjr3UM0lg56k4aliDZ3wiJm9dpy3vAuH3cvpRe55t+UJDkjaBN2+AqjyHQXSkLoCpMZ1NEugkGEOt99ZoFWK3vSP3KWUQDDZ6Hny8UZezx+28iR5b8TaNl0OvLYB/p6F4HAbDxAvEsUjx1oeBmErpVWP0LSzAAs8/ilEc9At6xyHhveiWA/exmdjvnAoWziu0te5YUUpdek+7zvp0E0HZyF/YEanzJWIHNM1ayWgPBDq2rn+1Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3af0be91-36a4-e0ca-1974-ae030ba07908@suse.com>
Date: Mon, 4 Sep 2023 15:55:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Xen-devel] [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
 <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: a88e85c6-1a26-4bc3-0a49-08dbad4ea590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9KSB/fmNXNHl5OpPNnkhN0SqskkKTZYeHJdQzeGGitgHQfE4HcQmyHK1uPiF77vR+ljqqfNX1TqTBvlgf4JeVaDjAuBYiv+L6tt9fudzYS4L07WrLtXSwIys9cv2v0l7ALMHXjlqCH49xslw6h2WRBHxeYX4hgVV2sK7rrg3wkcijPY8NUzrx2XnY0hD2iYtBu2WYApt9Kh3zvB0Zaq11ptLoxrpOE2Pz/ufwGKUxM1vHPd9OoG3MX7rPNw0laEjwvqgt0FspEZru8B5zwcKEvsfqrZX8HE1ANQ34h+/lBkaPyVvE38M3udV8vAevSrkaxircd01izkTWFBGhdIPISWgTFum7tb9snACG68YujNQ+2aYmfgTVXfX9AD5EeJiHC6STcBs2rx4pbYTN9ZtXC1kmU+tgDGfS+1dqkd7F6t37QDsWe3th2McQMdcLgpaTI3/LEajh4uchsYClmYZtCG1q9ryP4I1QTayAelii4mdq/d728Qw/i/sGOZ3E3ZmBAsCcczt11yEGFP+Ecx4Eutwc9Y9WMJp9xzb37shq7wgVe8/jxsuOVDaNkcYRUJ/czGV4CIV1Inm3nCMxFUtQX5F19OmV4QC2cnC9P/dwQZhymlEGS7kdQeJfqWExNwQAQUXPd8o7wA2RzoKD3DQbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199024)(1800799009)(186009)(66899024)(31686004)(38100700002)(36756003)(5660300002)(86362001)(31696002)(83380400001)(41300700001)(54906003)(66556008)(66946007)(66476007)(2616005)(26005)(478600001)(6512007)(2906002)(8936002)(6916009)(8676002)(4326008)(6506007)(6486002)(316002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnFnQnJ5SVYvVXNlY1JrN2Z4NjMrdXgzYkl4b3c1bVFVOXZ4eTVBK1AwYXBL?=
 =?utf-8?B?TEQzTVBjM29LVUVBQjFaLzEvemU4VUF0MTBWaVp1V2hzT1RwK2YyMHIxUm9X?=
 =?utf-8?B?OUJoUjMrMXZSU2pSVTYvWml1QnVoelloNkVlcjNNdHhNRVpZRFJ6SzBUbWxO?=
 =?utf-8?B?MDc3eitDdmh2UnM0Uzl3QURYVHBtNzZrU0g0RmY4Y3BSRkprNitleVlkNThI?=
 =?utf-8?B?RVpQSVpDVWtEL3N1bWI1SHJ0WDlrLzR2WGpuRkZSWE12MzF0R25taWZuSHVs?=
 =?utf-8?B?WlZZUC9kcGF1cEZnTWxCcjFVUjdRU2pWRG4xVkEwRkFYWTBpblRaTFdneFpM?=
 =?utf-8?B?QVV6QzZaUVF2ZTZoYUNxU0xDdzN5bHk4K3BLU2xwN1FWM2hrNWNnVkk5N2Jo?=
 =?utf-8?B?endiZ1I3RW8rY1ZBMElwaldidC80b1FwRisxWUFrMVQ0YmZVRkdYSnFpQXF1?=
 =?utf-8?B?RUVseXVwejZhZUdpbzlBU0lmWE5RZmNyelN1L0hpaUZFNkx3RmsyMWNaNDZq?=
 =?utf-8?B?TFRKNDAya21rU0dXV21GQlUyaUVvbXFqV0dtYUFmbWNMWE5oc3dMbFZjMFEr?=
 =?utf-8?B?YVkwdTNEK3VONkNNL1pFekhGT1MxRVlDR0FEbDZPYmdCL0NQMEwzUnJmMVFx?=
 =?utf-8?B?RXZzZEluc3BCMlcyUjhLcFZSZC9Yb2hBaXVMbkt0eHBCby9Ta251U0NXUTZl?=
 =?utf-8?B?QmJGd0dFV2NmcGo4WnVXSVh4dVZZS0VWa1NPZHZNTWpUV1Blbm1mZkM2NnFp?=
 =?utf-8?B?azliM05wdUYvc3RCZGJ4eldIamQzdTg1b0t5bWpiNmhVdi9ZdGNrREJaMFlh?=
 =?utf-8?B?ZHBMMTBDMk1JenNLTGN4WUY2d2pWWE50cEN2WEZhRE5qZXNSVGlPdVBLalNx?=
 =?utf-8?B?SktYNUtINTJ6dFhYclZPM3pSVGtJaElDWlNMYmJQQXcrRFI1TzlpYk9IQU1x?=
 =?utf-8?B?NkJhVS81ZzlpeVRpWnZTVlR2ajRrVEdRRnpXRFhiaVFKb0tLVW5CdFR0SXNv?=
 =?utf-8?B?a2FVaFI4c2Vkd1ZNekR4MVYyUlZIN3BOVGZJbWVyVmMvelRQTjJPZitwWExj?=
 =?utf-8?B?WitjSDhYa0hiTno5a3FxS1RESWRQUHNJNUJtK1JLUVUvbys3dUxDQ0JtZXlU?=
 =?utf-8?B?dEVXdjFFbmJ0eVlMRWg1b2FaSm5pQ0hxK2hnNEVOY09HaEZTakVEcm5TYzZM?=
 =?utf-8?B?NUVyRjNuTERqaFpvU2N1RStyTmZJclpVbTBIdlRtL2RoOHJCMTVEaVhmUXJl?=
 =?utf-8?B?dTIraVArU2JLQVUvczZsTG01WUEyNGZTQVNtdXFUNXErVEdkNEZpK0ZjM25J?=
 =?utf-8?B?ZXYySWcxVllXbThVNHY2bCtOQW9oWHk3L0RWNlB2Rm5nU000YWszWVlwWXNB?=
 =?utf-8?B?SUt2MkR4T1FKWkZFeU1CcE91aERxUjRRenovZFR0clFHT3d4QmRxZTB1Tnox?=
 =?utf-8?B?NW9PbWtHbVR0RmQ0TnUwYzd2MU1IYWFZNEVucXUyMkN2cXFsTmE5RVhWc0kr?=
 =?utf-8?B?cW5OZlFkRHMxY3dSMkg1djU2cC85TGdTVkErVXFJWWFXVVJtRU9wdkpWUG43?=
 =?utf-8?B?OFhrTGJ4aTBla0lpdzl3dHluSFV1dVBuWUxHT2hwNkdOR1Q5OGVsSHU2dDla?=
 =?utf-8?B?Wkx2eVpSL0lVOHE2c0liZ0txZEpTRkQzWXgxbUdodlk2UmcwcUFpTHl1QmR1?=
 =?utf-8?B?K2gxYUtzdnNMd2lsY0hSdTNLcUNmUUN1ZllqNEtmN3lOc0xZMTFldk1CWDBj?=
 =?utf-8?B?bS94MDRObEZ5Uld1ZDVNTENlWXplS202UXVCbW5wbVVOYnNmYkZNRjZTYWEz?=
 =?utf-8?B?WkFyenltUzZja1hjNmU0aEt3RzUrOGlKZW95SFBtZ2Y0RzZkWUJISStIZ3Bo?=
 =?utf-8?B?d0lqeTM0S3pKcURnUUZMNGR6YmYrSDY0b2VtSG5TSVd4VStVd2lyNlNrc2Q3?=
 =?utf-8?B?REVLOHhLN3hBS1BiMnB4bU1EUHAyUXM1ZTFpTDRnNktRNmZzcUJyTHFqQzJE?=
 =?utf-8?B?QVhhWlNScE1jU3pqb3dxcTdGT3QxMXFGT1U1WWs0STBkclB0cWpMcDQxQkp3?=
 =?utf-8?B?NGs4QjNYWHA0dHh2Nlk5ZS91NUU0WmZZdVQ5T1Ftem1ZbzhxN0VhdE9pbHRT?=
 =?utf-8?Q?efxFSp/gLIGOUBwWyvd095AUC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88e85c6-1a26-4bc3-0a49-08dbad4ea590
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:55:50.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7+GuUCkbU1Lnh9wBjRdsrXLfcyLL3/EaFFKjZ58M3cNElhGkZkPz4NnyBCfAi5I32CqcWSiraRho3pnSxOQLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7052

On 31.08.2023 12:42, Roger Pau Monné wrote:
> On Fri, Oct 12, 2018 at 09:58:46AM -0600, Jan Beulich wrote:
>> First of all, hvm_intsrc_mce was not considered here at all, yet nothing
>> blocks #MC (other than an already in-progress #MC, but dealing with this
>> is not the purpose of this patch).
>>
>> Additionally STI-shadow only blocks maskable interrupts, but not NMI.
> 
> I've found the Table 25-3 on Intel SDM vol3 quite helpful:
> 
> "Execution of STI with RFLAGS.IF = 0 blocks maskable interrupts on the
> instruction boundary following its execution.1 Setting this bit
> indicates that this blocking is in effect."
> 
> And:
> 
> "Execution of a MOV to SS or a POP to SS blocks or suppresses certain
> debug exceptions as well as interrupts (maskable and nonmaskable) on
> the instruction boundary following its execution."
> 
> Might be worth adding to the commit message IMO.

Hmm, to be honest I'm not sure why reproducing some of one vendor's doc
would be useful here.

>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3771,19 +3771,24 @@ enum hvm_intblk hvm_interrupt_blocked(st
>>              return intr;
>>      }
>>  
>> -    if ( (intack.source != hvm_intsrc_nmi) &&
>> -         !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
>> -        return hvm_intblk_rflags_ie;
>> +    if ( intack.source == hvm_intsrc_mce )
>> +        return hvm_intblk_none;
> 
> I've been wondering, why do we handle #MC here, instead of doing the
> same as for other Traps/Exceptions and use hvm_inject_hw_exception()
> directly?

I'm afraid I can only guess here, but I suspect a connection to how
vMCE "works" (and the point in time when v->arch.mce_pending would be
set).

>>      intr_shadow = hvm_funcs.get_interrupt_shadow(v);
>>  
>> -    if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
>> +    if ( intr_shadow & HVM_INTR_SHADOW_MOV_SS )
>>          return hvm_intblk_shadow;
>>  
>>      if ( intack.source == hvm_intsrc_nmi )
>>          return ((intr_shadow & HVM_INTR_SHADOW_NMI) ?
>>                  hvm_intblk_nmi_iret : hvm_intblk_none);
>>  
>> +    if ( intr_shadow & HVM_INTR_SHADOW_STI )
>> +        return hvm_intblk_shadow;
>> +
>> +    if ( !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
>> +        return hvm_intblk_rflags_ie;
> 
> I do wonder whether this code would be clearer using a `switch (
> intack.source )` construct, but that's out of the scope.

If it would help, I could switch to using switch(), but the order
of checks isn't really a sequence of comparisons against intack.source.

Jan

