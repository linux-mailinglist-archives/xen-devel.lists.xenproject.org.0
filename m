Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A715480C7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 09:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347808.574136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0emP-0008Jy-M7; Mon, 13 Jun 2022 07:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347808.574136; Mon, 13 Jun 2022 07:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0emP-0008Hu-If; Mon, 13 Jun 2022 07:46:33 +0000
Received: by outflank-mailman (input) for mailman id 347808;
 Mon, 13 Jun 2022 07:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0emO-0008Ho-Kw
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 07:46:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f077e578-eaec-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 09:46:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6359.eurprd04.prod.outlook.com (2603:10a6:20b:fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 07:46:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 07:46:28 +0000
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
X-Inumbo-ID: f077e578-eaec-11ec-8901-93a377f238d6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkBJwd9OjNHyTvHTiSfDPQ25pS/FzSxthM3kqwc+r9DRnuxhdxMCsiAq9nFsCWxBeRWZJhb9Ne+ET7pl5BiK2SUmg3Qbih9dj8FAp+8Mhk+iNa4paayT7cCEo40wqPf2iSGxME2KY9TKHVEvkC6V/j2Rx/haGtL8KKNnVe3dACbrWDz2APCxFSl316xKNLbvS/id6J6VaWktg3PBDjITKBVxyXKPedCAPlpfByOCcT/QN5/qGfoBFtFNHbc85v+l8x9JgaihmcmjD+7lTIzi6SAPEyIjL8Ko5EBz0k1bAad6b0X6LPZKOF3fKL79ZqeJfQQebFy3811W0XgtIA9OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7tz5xuW8I1j3GLOBSSfTerng/GIhbPDlEO0t5+dQjo=;
 b=RCHFSJ9Oh6u1xcEk1cLXN/kGY3pKyawh9zOBS6nNwviTOkeCUFLG6sT9U7PX6Ew74ssHpCShITsaYMOb2wL30RSP6rjFebtmXakr8koShwXj2DoSPiA1qbKp/65f2JyE4ee53UTz24tYwm+dyiaDbX4fjMVrlI50F4BYU0+rCEj1orokwa57Tsuo8anO4qCk1xAqTq25F7YlnZy3YlzqyaJLPqhi39I/ohMZXBzkVAtgamxQ5bj+Df7K+ieujnuKlKdt0TRMX1DgZLJM2EKO1ljLc11KFd47MFyQ8HCPiwKTnOm3u+2Brh8Wg3q8v11O/52ItJScN2qLSYEvV/bZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7tz5xuW8I1j3GLOBSSfTerng/GIhbPDlEO0t5+dQjo=;
 b=CLK2l0g2wybmK0puEBbh1DJfgyq/8bnQXYg3NqjEGO7MkFkjC8h2b2XimXFSWrCeckzVXbC/dpsq/RjbcecKSaNvauhRDPDBZo0d0QpV+KRyNZ0z3vDp49lQuuI7kDrcBv8J83Y41dTb3oo+Vpjwi6k3IHiGYj87AFk4vy2YN/bsUjNQk1eZx/r9TVG8eea6kshiySVOIyT06NHK6IRkroc4sUrcN+SVASTpU+ZAybTFT8wEaYEwZnN4f/AZax0daWjWFwLEm+tRqvRdE+2cR3RcTFv6HWHZoInNToeY+RBndbVS0F8srhQBbHcTtZQ7rNlvVIxn/7BbnsAoy0qOow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f1b9d99-290a-dc29-c953-3b38516995b9@suse.com>
Date: Mon, 13 Jun 2022 09:46:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220610160050.24221-1-andrew.cooper3@citrix.com>
 <46e8251f-6a76-a45a-54db-c15a39b2ff68@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46e8251f-6a76-a45a-54db-c15a39b2ff68@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f9c97b8-243b-40d8-a751-08da4d10d331
X-MS-TrafficTypeDiagnostic: AM6PR04MB6359:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6359950650721D293F648E16B3AB9@AM6PR04MB6359.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uUWUe7Bqtbn0r5vI/biKiYzeYf0WhamhQN+pAt/lEsmFxa/J5ZRR0q4xHotaQRAZBVtcT/NlKsWhmNgWhmnGI48S1520ODougnnUXXPi1GfJJSZ3XjdyJBwKnON9rk9L7tgTEVNTlsPrsXsQ7LS1Cmvg8p6hr2I6C9aKVjwDAN+lVXEqV9HcYVM6tvLpe6BpHxcccrE/KII+gc7bzO5wn57LCohk9NqeI09sNN0ibhQIp2CnKEamKHLVTunibuw//u4UH2DGOGD4zBomp+d/zAAN281ju7kbJNq+OeWGmWuWh896FosHqc8Y8VUiSzbcTlLKcK5TeAGTesvIuwgx08gTBpVkCaQ4TsiPSOQeRt2wU/ls3rJJr7Br6PsNejHC/ByQf6CZTFUHLQGdJo5jhlPjYSRAFswv8ETlyT1PcmcwTt7PjuwayinY88GhVwOSYOdnXwFKZr1kVAiTPaFDVhcZIAQHklE8YXdWRaY3dSK+OVGHRYOWLc0UwDzmDmuQPqL0/lr0HfC9Hc0Py8UNSnLDvjdA/AzvkM63b1Wn+bL2xFirWEO2Abj6/zu0Nsdo5D65wnSN5hLXLVVYfVa8HYhmZGlyZgJEQc6HfKlajgX38eDthVpiJARNodyGNXqXcYuoosb5LkLzqWbD32qGCHymlDoE3KU/jhU+q81Wm4VkZw+C+Z8ct3VvFP2iWcodoWxE4fR38izXZalgd9X4AjpNC3SHNCddmyfohEa1jKagmqOkr0fnQiPlXoZvFL+CZkUvR64c6QdLeKVkY9Me7fJ+eBjIsTF5xPVDLvz9v017Rp2jcoRwETpxnKFICbvT+CxDX5BdIUSoOM8Imq0acxbQGFty2Z2DmsGOlFEYgPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(186003)(8936002)(31696002)(83380400001)(6506007)(38100700002)(26005)(6916009)(53546011)(6512007)(54906003)(66946007)(508600001)(6486002)(316002)(966005)(2616005)(8676002)(66476007)(4326008)(66556008)(2906002)(31686004)(86362001)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWtrUjc1SlVxL240cUxyQUNyMk10SXpreWtXV3hWWEExdXNQUGoxRlFadFFL?=
 =?utf-8?B?YzBKelovaUlvQkIxcjFJME9LcnhqTDAzTUcxQ3Jnbi9uOEZNRHlZc3pSRG5Y?=
 =?utf-8?B?eGNoTTJVenM5M09XV3d5clBpK3EzQS8xMzcxTVhERzhrekRwVTRMTjhRY1Va?=
 =?utf-8?B?YUd0TDloaU1ITmlyWHhSandIVm1sMDJNSHNCQm9RVjVoVVQ0enBIek84Nk05?=
 =?utf-8?B?NEc0Zkk0K3JMMzcxYzRmUVBUL1pVSUtIM0JkTXJYSDBaSms1ejVXM3NlSDdU?=
 =?utf-8?B?YTFCT3hMMVliMks1NUVFSzhZV0FGVHlHd1F5NHNVMlZySGk4ZEk5Rlcxc3U0?=
 =?utf-8?B?QUF0MFdLSG9DVCtYb25NSEp2Y1hnL2dvbXhMakpDNVBvajQzcFprSGRKbVJa?=
 =?utf-8?B?K2R4UTNtL0RrWHpIeTdNMDdNVTYwYTBzQ1JIaFhFSUw0QjdNcFpVbVJJQkQr?=
 =?utf-8?B?UDh2K2RZNk5oSzMyTWpxNmIyeURpSnN1bDRoQk44dWtsaFlySXdKZ3Bxdld4?=
 =?utf-8?B?NmF5NTc3ZDJVVXZxbmJiZlVCQmgxaHhuSUJGZkRrNnhqSUx2UUlNdTVNL25n?=
 =?utf-8?B?K0VTa3gwMWJXMkJFcDRJa2cyUXFaRXkyUmdRZ1V6T1BmSy9tVlFmeHN2OWdG?=
 =?utf-8?B?SXB3c1F3bU96REJsRVdKcERIZVFUalRrZEFTcXpOam1DcnNpemJhM00weTNm?=
 =?utf-8?B?TFZRb08yVGtJK2RMYlBZLzNwYUozZGZUTHR2MEdaVUk2VS8xY1hCZHREdUVE?=
 =?utf-8?B?a0dVaE5mQlRCOEsxd1FUZlRkTzN6SnIzdmcvNDJmbmJkeEdSa1VvNTBNOWxs?=
 =?utf-8?B?MXNHa1hZZWROVU1WZ09kVFZLVXdNUFd0SG5Hd2FLZ2s5dVRXNGRqamNsS2Fr?=
 =?utf-8?B?ZkZoZDdDdDhkaldiOEozZHVQaE9GOFVVY0MyTENkaFBlZlRqUmpEWnQ2UXlj?=
 =?utf-8?B?M2s3bjBVdk5zQ2pmL2luL3AwYndPeDVZOGtoUnZJVnBweTNlbVhUWW9uY1p2?=
 =?utf-8?B?ck15dk45am5rK0xaYWxaOHpWVE1MekRpN2J4UUh0ZExTblRhYVVjNU5Sbnc1?=
 =?utf-8?B?ZEhmWnZMc3lLWHg2VG5HZUZJZnFvQUZ3dkM0U3pBQ1BWYkhTVlBDNlNwRDdz?=
 =?utf-8?B?TUlyU25zTFhtQmEvL2xVb29pSkJicWIzK0hsRWVVejd2Wm44emdscnlBak5T?=
 =?utf-8?B?dWFzNlVvN0MvMjdPbFdKRXhmNy92b0pLcWg0eWQxWGt0MTZIQ2tacUNrL0pW?=
 =?utf-8?B?cVpQNnlQVFB4Z0ZVUEFueHBrN0R5NnlPVUhORG01TXVaeFZyOUd3SDhlelI3?=
 =?utf-8?B?b2tGRFBobDhDT1VQeDZpZ1BxbFhDeDVqTmMxdkpDV2VWdXFpRENrdXhkaVFP?=
 =?utf-8?B?WUF1VlVCS0h4OVNGZlF2ZUwzNWIxQTJNRUdSQkRaNjVDLzdyb3oyRzFQZEh2?=
 =?utf-8?B?aGFPSkRLM0hQR2VoNit6NS84WG9lOWZCYTVyZVFCLzJwUFY2ZVpIQVdTd1Vs?=
 =?utf-8?B?b2h2MjBUL3pIeWQ1NFZEYUIzTHE3QWoxQ1pTTG1CRGNDN1BuN1RVOGlzdTFG?=
 =?utf-8?B?MXBWUzBIZ1RIN1VvTWZNaWswd04wVU1Vb2FUREdZdGV6THhidlI5OUNkZlZp?=
 =?utf-8?B?LzlsYTVIZDlYNXpGUmprT1NLdWt6amFjVkdvWHlqRTdXaUlBV2JkL2VKSWRM?=
 =?utf-8?B?WnFnRnFtTGxybnhDV2pkdTJLQUQ5cThJdFBpdDdGdGRneUI3bWZxSndIZVFJ?=
 =?utf-8?B?bnJmMWllTW5iRjFHcDRLYmVDazZoNUNvSXQzMGY3VjJZdnRCbzQyK1hZOXNp?=
 =?utf-8?B?V1o2czdqZHdtTW53a3pXVWVVUUtlbk1HZTIxYjJCN3kreTJ2RVdxY21ickI0?=
 =?utf-8?B?VmVmWGtWejd1eTZ0cGdkbnRlYzBrck9obi9CQUpBdTBnZVFYWjZWZjhjN09I?=
 =?utf-8?B?RlNlY2NiblFLREVrOUFHNUpodE4xWkRuY2J1Ly8rdkpkM0JpU01iQzF5Ni9S?=
 =?utf-8?B?L0pBbXZ4T1M0Qm9Yd0l3aGg5cStKdmsyZUROeXlJQ09BdHF4SzZxbkZYcDlp?=
 =?utf-8?B?R3ZEZnlGZ0ZJRGNza2lOWHUxZFQvV2FkMURSNVlrMkluZjdQSkd5RWdRRFNq?=
 =?utf-8?B?M3RYTUJHVzFxRTlhL3ZUTkxRQlpBT1BQRGFmZExmL2JSZWZaRExiTE5WQk1h?=
 =?utf-8?B?QklkOENOWkNUaG9IU253SzFjMG9JOHg0TmFQcENLVi9EQ0p5emRCOVowUzRJ?=
 =?utf-8?B?aEJEcHM4UmdTZzlxN0xpUlVQZjNLQUs0eWIwT09NSG9DSVpjUmlvZitoSFZ2?=
 =?utf-8?B?M2Z4dEUxS0ViOWZZWGNyVWZSZzY5TUVkNDRicjNldlRxMW9CK2ROZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9c97b8-243b-40d8-a751-08da4d10d331
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 07:46:28.5971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3M6K0AxxFspiXB0t0T9AbXOwHpq0UkqX8fvb5rtYOIt3vtMmm3STIfj4xj7nCmdYLfeuS3BodGj4W79gsvLVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6359

On 10.06.2022 19:13, Andrew Cooper wrote:
> On 10/06/2022 17:00, Andrew Cooper wrote:
>> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
>> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/advisory-guidance/running-average-power-limit-energy-reporting.html
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> The SDM also lists
>>
>>   #define  ARCH_CAPS_OVERCLOCKING_STATUS      (_AC(1, ULL) << 23)
>>
>> but I've got no idea what this is, nor the index of MSR_OVERCLOCKING_STATUS
>> which is the thing allegedly enumerated by this.
> 
> 
> Found it.  There's an OVER{C}CLOCKING typo in the SDM.  It's MSR 0x195
> and new in AlderLake it seems.

With or without bits for it added
Reviewed-by: Jan Beulich <jbeulich@suse.com>
I'd like to note though that I can't spot such a spelling mistake in version
077 of the SDM (vol 4).

Jan

