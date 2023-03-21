Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6896C363F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512823.793087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeH7-00039u-JP; Tue, 21 Mar 2023 15:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512823.793087; Tue, 21 Mar 2023 15:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeH7-000384-GV; Tue, 21 Mar 2023 15:51:49 +0000
Received: by outflank-mailman (input) for mailman id 512823;
 Tue, 21 Mar 2023 15:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peeH6-00037n-0k
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:51:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48e6b1fb-c800-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 16:51:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7618.eurprd04.prod.outlook.com (2603:10a6:20b:2dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:51:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:51:45 +0000
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
X-Inumbo-ID: 48e6b1fb-c800-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJOXO1sr0h54gPrtStyVYhU8lXw1NG4hEqH/7eenebjwOHcIgCuKkmqbEM/jltlh3XslG0uFhrvtkCKsbNMC287SUN17K+c7X86+V5pTq4fd+Xf2sSbaeUC161wH5Ey0c0DNiY/xPusbzVsdgiZZJW6GcLyPAyBY1+GNOjWCxwobWrodm5S973EwdhI6wHj3TVzvSl+7Q2yxfG7hXzBAjg6oYH95ZLB+fv/bgRtPZJGPh1/e8BooJk8hZ/Y10Km9piParAm2OEpaJoXfy0l6lIYflTOLSCn7flDnWs4CFPXQE4tQ0J5pND+j14ZyP+IUjMrengEMQlbrK1qTq33UDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz1FPxSiR3gHB9mkWGNHc5/b4SJYixoHadvH5ZPGXXQ=;
 b=NyqsbOPq81pY+ULi5uZb7vhWth5tzHnTjjWP8YB0kqZi1NXdORfvIQePLC7yzocopwMt6DL8aWfb7P9EeJ7Bfc7Td235eEGtvZHQ3niMPsYcnfNDk3kywCEcOB9/hXfiBLLMDgewy3Ct3r5UdDyBsvhS6/8ik4e8K+NqVFZLEctPbSNtOJLriSm9V/mJWDDCJvB9asw2MrFR03t2mLF6+Hf2rjI7Mj5Z4h1nDWVbmxWtmOWRWRs+5RthDK3K5RVII1/3rpEu7MO2hqM6N5yOrq5NaYNGaw8UKqJlFzpPgg4UL6mMU8YmtLpuTHY6w9fnJMJF71oTcHKdTopDecz0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz1FPxSiR3gHB9mkWGNHc5/b4SJYixoHadvH5ZPGXXQ=;
 b=Vb4z0aqMvSufBnDUBKO0w6mqynuWR9HuCkNQJqNMwk7uYoYtQ3vpryl3wM3ibLJgmbRj38wdLXikHn00W69Is6/Nrfq2YwKuwkDH/cRWU433FtLsbd7u720mUuB3+QGg9YxGVCZZoGVtey0AK7wFxTsQ6cLytx6D1Dng5F2IfMObn/21OiAzELeva6XNC0VFfLZNHl/stusxNxSQzO3dV+LCJ26dLJRjGnHW1vDfnwLV2jTh1GK2eFMUbxCOCniD+Gj9Ut7ZwRb10sD03Ze5DS+NgTug0N4/d8QTb4210/arFbaXEiAKx3Eqd9XN70Iqrg4vL9/9xsKWHZSJ/nufbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9864c24a-6d08-5a5f-3de5-3b34b68a6edd@suse.com>
Date: Tue, 21 Mar 2023 16:51:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <ZBnCTAw3Fj/BpvTl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBnCTAw3Fj/BpvTl@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ce958f-e3ed-4c06-a4d3-08db2a242bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dHBxsfzeDILsSprfGkXLLilq2xbJsRl739G9oXFemtzwMSsOnsS40BWDR0iOjXCAOiiFd/t8WmUcPxvbs0eXRVT5554YEJiQWaSkAW1RTmRGOsFcqzDZvbYaP4y7tnyEbAUkIKMFVsEjEfY2AJyQJ5ZrkJ+PqHlcF8Rqtp/Ntt+IqYKIbPibSL34Sew0FffCqOsu4amAQWz8fEtSgV8WNiv6XSOV6hBOz0bFMmVe3EXCy5gBsB2Kk+8rKqaSp/W5uL4w7RPK7DjAXafLN2bPlY/OSWN8GrultjX9NYWEXPW7up4VFi65ou300c2qkYQQC9NJYt0GAohe/umJcLHvYcuJfN5MU06hOv6gfHEL/SGwbPO1ZOzCvpDbEE6y/4Lvg+yCGNMykRZiltzEh23kPO3+pXVO/ajoodzjN+GaKJWVPfHohDoX1rnTnmKGQvgtH4oaEbjjQwMPP5qLhRcH/VisjcxUDvJVmuIo6xCJvmPMmoritL+GK3NHFIlnOSo7WZKuhU1QRp7JFkp/1ANuvFf7ARpNzEizIvxSjCO7+uBf8gnvPj0Mo0tOdKFyTG5sgRyCmnemw1ou/MrScZ5XpFFN3AzZuo9Eggig52gelB/KjzvTxQH2YtAkbqr9VEn36Yr/eXwemxM6dpx8rQgL4Vw8UoCmP2QtMdiaSK9wu/gD+aV+HUp1aLkiVJj+tsd2cDqXomGn8nPY0VHWyUEOQghAnR3f5++cqjDn+uN0USI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199018)(8936002)(41300700001)(5660300002)(86362001)(31696002)(38100700002)(2906002)(36756003)(4326008)(6486002)(83380400001)(478600001)(2616005)(54906003)(6506007)(186003)(26005)(6512007)(53546011)(31686004)(316002)(8676002)(6916009)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhIbEdKdEZoRm55a3pwY0xQVFNJZ0lmdFAvNnZlVWZQQldWZmY3eGM2SUdD?=
 =?utf-8?B?VmxJeWJacncvNTRNNmtxWDEzQWRFbWRLM1NaOHFJYXk2RWxtcStpTngxaFZK?=
 =?utf-8?B?TlBvajA2M1FJcEFIUlVBWUMveVF3cGdtWkNrQk9vQ0d0alhiZUFUaklZOU5K?=
 =?utf-8?B?ZE0yVWU5T0NadWlkZmtPYnloU29Vb1phbjdGQ3ZuVmc0T1NPUXBuakRIYmg2?=
 =?utf-8?B?WkhualI1ejhoZFg1ZXFTclc1RDJjNzVTSlNBaHlCT1E3TStxVDQ1UndkT01S?=
 =?utf-8?B?RHhBTVNwc3JDdzhsNHZPbmF0UzBMNnl6TlBtajNDM0tQcUd3ekhaaWtYOG9T?=
 =?utf-8?B?dWVZNmRNeTk2elA0MkVlUVNLQ2Q3bDFyU0NBT2JmUmNGakNKaXJDeHlrT0ZM?=
 =?utf-8?B?K1M0NnpNK09Vek9Xd1VuTGFXR2lUTmI1QVAzS1RMVG95RGRzQ3ZHU3pGcGcz?=
 =?utf-8?B?VkRFRmVjSXNHdEdsUS9qRmNDK1RiTXIvSksxejVjamROYjdaMzlHSmxDQXJ1?=
 =?utf-8?B?VmZ2R1JyTElMM1NWWnA4MzZtRUdDaGlZa0tMMWtxbTdnTlBJT0YwNis5QmFW?=
 =?utf-8?B?bUVYbzFiMTdyd3E5QjRIS2Fwd2xJQnhQUUtndmUrOFA2VnJYY1NnenFsOFNo?=
 =?utf-8?B?QU9KSTd5TWZsNXAxZklUNXBWODBac0lhLzRlN0oxL3F5aGhOanM2S1ZIbjkw?=
 =?utf-8?B?NUVjYndRTGwzYktHSnNTTXNHUEJYVHV0UE9lR3lmNmlQaFUxNnViVWNDUkNl?=
 =?utf-8?B?K0V0Tk4wUjYrcXV2dmErc1FvZkdUSldpanNLZzcwSzU5RFppajJJeHRCdWk2?=
 =?utf-8?B?aDg3VGNTelR6TE0rSFk4QkNwT3A4Nmt4Tm5vRndJUzR0R3JOazVhY1IzS3U1?=
 =?utf-8?B?a09CMzd3T05yb2x1SDkzeVRCdzhDUU1GQSs1dGxyNjlQelJSdXZQRVBzOGta?=
 =?utf-8?B?Y1FnZnVKalhySlMwb0x4MUdpdm52bWFvKzJkVkN4d1VhYjNuQWVHVzBNcVM2?=
 =?utf-8?B?Y3MzSVBBWk5abGgzdHl1bTJ5alVZRnpCeUl4S1UyMFpFSUFwN05qTWkzVHVu?=
 =?utf-8?B?T25Id1R5Zi93bWdTbzk4aW9oYzhuRXJ6YzF5MGt6SHF0WFY4MWMwTzBxWDJB?=
 =?utf-8?B?ZEFrWGs4N1pSc1ArckozUGN1ajJpS3NYUk8rbHJIMmxGd1QzREtBNndPZTRB?=
 =?utf-8?B?N2JObm1sUXNBVE14NjFFWlVBZGhkQ0pRRWJsakZLMmRDYVNOcVdPdWhHWkFo?=
 =?utf-8?B?NllvTzRacW94c3Qvak1JYVFMV3pSSXE0SDRnQnlkYVVUOEp2V050ek9TWGg1?=
 =?utf-8?B?WHdLVVEvYThlOEI3NWhFS1Jrc2c5cGduY1lzNjYxdXdRUkEySHYvZkZrc1o0?=
 =?utf-8?B?UTdYZFRhNit6QmtqYkZZT25BU1RERFc3MU90NG5YZFRUZ3J1SW5wWllhWHlI?=
 =?utf-8?B?QndnL1Y3UHlLb2lXbkl1cSsvbmozdjBoZUFWVE5Ibzg2UXo5SDFRMUZVNjE1?=
 =?utf-8?B?TUZCTnZXRGNjS01aWWlnSmg3L0RJMnV0a3U0NzNJZyswTHpCTUM0NGxDYnZU?=
 =?utf-8?B?RUl3eDNtNVhjVUFyOWV5OS9MSmwvc1N5QStkcTlkazRRa1BhVVE3VEYzbkZw?=
 =?utf-8?B?TkRQYjFUaVVpVkV6YWpPUVhRWDAySVpBT09QdjVaWG01ZGZDUGhUb3BzUzZN?=
 =?utf-8?B?b3dyTmloN3NWZk9YcEhtZEV0cnV2ZXFlNXJEVG9IWjF4b3pvUDZCaVdzNSto?=
 =?utf-8?B?NzQ2cDR6WXRhSGpXTGphaVJXaERkdXpRVk1RcTVqZlNFY0tSOEg3U1UvTXRx?=
 =?utf-8?B?TG9KSWxFTWRxM2x3d1Vvbk1wemhjaVN3QzBhUTdhZWRPdmhxNzhSQjBwQ0kr?=
 =?utf-8?B?M0YzQStCcjkxSkYyZ2RHQ0VZMEFSSDV4Uzdlcks5T3dvWTdsUmRJd1JyeXFE?=
 =?utf-8?B?WHpLQUhPNzV6a3JNb3BMeGpZVTB1Nlc0Qnl3S1RXNnF3Y09tMktrQkxKS1Nn?=
 =?utf-8?B?Z3p3SGhYSHl1bGdpWnpHMVBZakJhVWkyT0kzV1VlUHB3OVE5QVg2U2tjaWcr?=
 =?utf-8?B?a3MrRzNSYWVDendXd05yclNzYzE0WmRlMWFrZGpFSDNIdVJWU0xkME92dXp1?=
 =?utf-8?Q?uJ6yh+EE+ZAVEzGqsxrpfyTmX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ce958f-e3ed-4c06-a4d3-08db2a242bc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:51:44.5844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2n1sM9f2m3u+v40cefbz3rEomjFoE/1dEUOzH0kIGb1sW5F1hYTYZpUY+sNpJJukxUnc86dlnH+82Hd9vJZD8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7618

On 21.03.2023 15:42, Roger Pau Monné wrote:
> On Tue, May 26, 2020 at 08:49:52AM +0200, Jan Beulich wrote:
>> Respective Core Gen10 processor lines are affected, too.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>      case 0x000806e0: /* erratum KBL??? */
>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
> 
> I think this is errata CML101, I would add that at the end of the
> comment.

Indeed in the current version of the document CML prefix exist. The older
document I've been looking at has no such letter acronyms in front of the
errata numbers. I can certainly update.

> Also you seem to be missing the '806ec' model (806e0 case)? (listed as
> 'U 4+2 V1')

Isn't that pre-existing (see 2nd line of context above)?

Jan

