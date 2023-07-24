Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E405575F87D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:40:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568979.889246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvnV-00047G-JJ; Mon, 24 Jul 2023 13:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568979.889246; Mon, 24 Jul 2023 13:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvnV-00044t-Fm; Mon, 24 Jul 2023 13:40:25 +0000
Received: by outflank-mailman (input) for mailman id 568979;
 Mon, 24 Jul 2023 13:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNvnU-0003Dh-PE
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:40:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3edb771-2a27-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 15:40:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8391.eurprd04.prod.outlook.com (2603:10a6:102:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:40:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:40:20 +0000
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
X-Inumbo-ID: a3edb771-2a27-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQ3Qv8mVUZd+SLBrt74VG7IBnrDs1n/+xm18RLPpGOEshUAwrv2cEJOkeAT39AX/lJPiGp4OTlqTYw7fBcAJyLHJ/9pfvLTpR5bEDTJCf8/UnDCmyyZ8UWPQiyS9bksmrxFBaLtBPaOwNk4ox6UtAr5zhhL7vE5xEUYA8TtbKD0Y8LYgOuMsS8NBql9sLdRzuxtZhEGH7rOXo5z9pIZpmQbxadEuNSHmx4wjX1GJwPICy0OG0SRDI4tKiXgmP3qGdf4FeqQ1jX/rAHclvnW4CrY0TDBvg/SnZ0+tlcbJjyggqMpyBdGI91h3l3j6J3BUzWJ+94gSKchjdQVNdVxTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/Dk3H9+KPxVss5y+OP7rpTMAi0oHcbOdrc9bPzf3Jc=;
 b=Mm+3s4lSTFU684xUmUBQHOTVk17tDhXS4zwuJ/PJbxFAs2Yr7VEY7RIzV7+LtmYlZIPXvbMcC3mC4NA+fDAfTwDA9a93c5Q+kv6c0fZfom2m236K/h+fQFPJzj6hCNu+IX9p6XzLQMMcv3rr1F5hbDEaDPayyIMgCHFFFAUDglltr4EM7jNuNHwlPZob0cH7H0ZEgSSfkj1U31pa235eEdx7qqB/U5d1pWe0BbamlfvXHaHIXfZ13jruLba2q3YzxR8vT1bMT69/mpdo6EeEbZtgWHPgk1Q1foc70xB25eD/VRPNrim8jc5UDbIRVm+b7j+6081FkEIGbL1mhiRC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/Dk3H9+KPxVss5y+OP7rpTMAi0oHcbOdrc9bPzf3Jc=;
 b=RCSkOdW3l9lyvAs94bv1ybHqFsdauL7FMtdE9enuBDRhV4pLz0Z12M90Q8CS6WDrWtAwIwONqkuZMdc62fSP+zHRzogFFb5UGvPaHtd6EFMzlw1cescXQbfh1dte507ET17/sQZMuiDcUy8hxGCBncX1uwgOgFJoDQvm2fjoYAy/1+4b0xuZbvtRMbR3Z4aKQlXgXOfGGj6tZBwpzCZPjlUig21X1+PFelIgP679uSKR6qTwmlz9rObRnV/uEwz0vi9yKFAfcN/JcpTBVnvwkk+M3jNQutsryU8g7UhoF13E865oILAT62+3QTQIvOV9BGm2z9smUAtyUxWsPizkOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e728eb67-3ec6-65d2-df20-7aa34431546c@suse.com>
Date: Mon, 24 Jul 2023 15:40:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] xen/riscv: introduce function for physical offset
 calculation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
 <19817eca0b7d4e8dee7eb5d5e7d3812133925eb3.1690191480.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19817eca0b7d4e8dee7eb5d5e7d3812133925eb3.1690191480.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: ee04a783-a965-4b29-104d-08db8c4b862c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5tpRPwGCDtM0IN1MUuO+GRfvqRk7pPDpl3jAh/CUjTfYsxNxdTDd66L1nVGWv32p2R3U0GJ/SYnMregDvODNHJeLjVr1Mt4aCAjYyAoQQnE9dVL3XCjed0uvrUdMjuN2UK+qWYeDPYKy2Zzqb19IB7JZgaby/UUaDOe7rjr/s7nAozAFeT6ptbavVvxYUZlIn/Z0HpqxOLBSWnZN8ge5QMTEBfL+KYJNi4HVjuow4z/PgkcDqgN08xb9bCfF2iwhIeHK+x26y19NQ2B42gsaOe8nmpRaet14Czr/gTAisc4QKO439ckqlsuoD2N2bvoOA0MhC15flnAFSnebZMILY7Bn2/A+q5Y8UOjhNfDVzEmuCz40b8FlgIokbYbXF0W5Sq82zexcb9GZFW4H5PFK9+oB34YBTkwHtMpmJaX/kEAu+SXlDtTiqHcbC5HLp/7RpsnXCuSCdft0ohlJQ6rUIj0akTQOFBvuuohn6V3U3nhyAe/jicd9fMU9JEdFyf5tXnQpQjJqm35qFF/z+qsNsdBeZGs5HzL7lrpKpT4J419fLMs9vX348kMOxpdzlCKxxCL8we51oClEBwNxUtc6NlSz1YfPeJCO2MlouYFW+z8bu4YWgt6EwNjQtks3LwaudArNGYzFiLa0FDMQ+Mnijg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(26005)(186003)(53546011)(6506007)(31696002)(5660300002)(36756003)(8936002)(8676002)(2906002)(2616005)(86362001)(38100700002)(83380400001)(6916009)(66946007)(66556008)(66476007)(4326008)(316002)(54906003)(6486002)(6512007)(478600001)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVBheHdOalpNNUtXM214TFU4ZUNndW52OUxiOVFIMGYyTndMTU5xTUdEdnlj?=
 =?utf-8?B?Yjd5M0ZnQk1JOUJtcXpaVytvZVZTTXFLSmVCcEFGeldRb2NtcDlQdjFRbStJ?=
 =?utf-8?B?WERUa1RXYkZPYTJPdWRGMG56WStSVjhxR21QZ0lzbmNyblRqSXA4RnZUSHVF?=
 =?utf-8?B?c29LQklIbnJZeTBFVExxOWJZSll3VU8xVjhDMDA5M0w2UDJSM2ZFajRuUjlW?=
 =?utf-8?B?VEQ3ZG1NMllGVW9wZmFMRVBwUXh2U1M1NFlSb0lxK1RvQytseE50c1FYZ0Qx?=
 =?utf-8?B?Mk9OU1VpT0VLTTVsZnBwYXpxNHRFTXJtam5yeHVFeTdzTjUxRGNhYm1MUzNB?=
 =?utf-8?B?Nkk3L0syZXFGSEp5YURaS1c3bjQrUWx5R1NGbXhFTDJ0OWRLVUlnSWZJU3Bz?=
 =?utf-8?B?elNIWGcwVlc3ZDZjNnVZWUdDbVQzeU5UREJnZDNaL0xtRkJHZTB3TVJKclJu?=
 =?utf-8?B?UkRUczNoSDk4NjBkamI3TkRvMTRtWTJhbXB6aGRtSVgyb2FNN2wra0hmZ3Z0?=
 =?utf-8?B?eGduQzhFYXdPV1NWcTl4eFN6WGxPYXd2M21acWRVWHo1YlpFMmsrQ0FjcXVk?=
 =?utf-8?B?U3h0dTB6a1lNTTdPRWhiZFQ4R2RrS3RNM0pOUHNGWG1LclVqS1I4WnJFRjJi?=
 =?utf-8?B?QlpnMVZGRnluTEtRVGhIUHFKelNaVnV0b2ExUU1zQmlaN0VIQUI4TEUwdUpz?=
 =?utf-8?B?MitLaWNDK1Vtc3RlSzgrd2hqN25ZSFFBNWY4VVV5OTZNaUpmMGhoNVBYSCtt?=
 =?utf-8?B?L21NSXFoMTFhSm0wNUd5Z0hQaUdvK3ZHbmI2ZGZZS2FCcDljMUtEZTdNRzNJ?=
 =?utf-8?B?dWpFUkQ2VUh4Q3U1MW1nVTBaYXhLdW1rVjY3Y29IQTJJZXZtdXVMRFI3cHpU?=
 =?utf-8?B?VnAzUi91V2VFTXdHNnNscW1BTFlweXZiSjVHZ2NlMiszaVVhUzk2YXlyNUNL?=
 =?utf-8?B?N0VSTFFlRmc3Q3hJd2FZV0ZQRFRKVWlQRzdBRzZzVm9wTkQzUlE2RDhrdG9y?=
 =?utf-8?B?V2R2RE9LNE9kYTNhYm85c056cVBhellVMjFPbDRLWjJXa08xdjYxdENSZ0I5?=
 =?utf-8?B?RStEYlpVdWNYVk9VTUE2bitFZ0tNc2ZwTzdsODVaVzhsZEVZRmtIVnd2L3dL?=
 =?utf-8?B?MEsyMzdWVm5OQWRPa1hqSTVKZ3JxZ05qVzh1K0JFNFR3dmZDdjN6UzFWSGdp?=
 =?utf-8?B?K1FtWllCcmxEeWppR0VUWlNFNGZpUlBEUEZRN2lqajIxV0ZzTGg0blNKZExn?=
 =?utf-8?B?SHp0VzZXK2ZuVGpiMTZEMFlUSldJSVc1a2VTNngzL2xNYW12N0NVZENBS05p?=
 =?utf-8?B?NVRwbzNYOWJ3TzZGMkxZTldFWG14WFNCenNPTmpPRjNIQmhqQzNac0dZWEZF?=
 =?utf-8?B?akpDMnV4dGZEMkRiOGY1dC9EYkRpZ05paXJzaWk1NXFNUFhvNWpwZnZTMzJt?=
 =?utf-8?B?RkhxaHNwVW5iYnFxamphM2phUHJJKzJhQzBFQkEzYzNOSmF0SUp5K0gxL2Nq?=
 =?utf-8?B?eUc1bkY3Q1JpVjZubXhzaWp5YUt2djVGeG96RitqLzQ0REdoT0VTdCs0YWts?=
 =?utf-8?B?MlM5anN6djFFaHg2cTZFK09XTmJYeUhwOEN2eEU3YmZ5NUlpYm5kY2duOGNX?=
 =?utf-8?B?NHNpRDZjTXJ3ZkxFVTBibjUwV1lXelhMbTdWWVhtREtjVGZoSm94SFFkdzJN?=
 =?utf-8?B?MmhrVHNjZlVBMEZiUXlsdXE3eStBdHd0RVpBbjlDTFBHZStnQXZndjQ5dEVp?=
 =?utf-8?B?SnZ0L25QTlI2TTNmenFzN1l6Qnk0R05EbndJN0YxUnN4TTJsdkFFWjg2V05V?=
 =?utf-8?B?aTUzNmo3OGZvTVlhREhOKzQ1MkxQbmtldE1mUEc2U0x2RDR4MDFzenY3elI5?=
 =?utf-8?B?TnRML3E4eWtuTTE4K0lMdERPcXpuNmorZ1kwRjU2UEZkV2ZuUmlyK0JvT014?=
 =?utf-8?B?VmdnbUtGVHBCMUNCSFo1WitOUjAyODJKK2JrNDRQME5Wa05VRHhmVWVCdk1X?=
 =?utf-8?B?MzhEa0FFcFlxSmsvcFhWaERTUkEyYXlyTmM0bE80SFBLbU1wRkRrb29CQXR5?=
 =?utf-8?B?MGlxMnp3M2d2Yk14eVROcGhLSExBeDVoT3RvejZCbVY2ZkVDUlJQT3h3RmZM?=
 =?utf-8?Q?wWLZ+MxYgKCd6aQ6n/flpoj9u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee04a783-a965-4b29-104d-08db8c4b862c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:40:20.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yaYBcnaMk8pLiUqFpTPy8kEAZgw5Uy25n8S2PTxHxl1NQtvdbMkWuciZLn1tIcqkB81+mf5EhRvlJbNYScuSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8391

On 24.07.2023 11:42, Oleksii Kurochko wrote:
> @@ -19,9 +20,10 @@ struct mmu_desc {
>      pte_t *pgtbl_base;
>  };
>  
> -#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> -#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> -#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> +unsigned long __ro_after_init phys_offset;

While Misra compliance is distant future for RISC-V, there's a
problem here with there not being any declaration for this global
variable. Adding a declaration isn't the only solution though:
Patch 2 also only uses the variable in assembly code. Therefore
the variable here could be made static, with ...

> @@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
>      switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
>                            cont_after_mmu_is_enabled);
>  }
> +
> +/*
> + * calc_phys_offset() should be used before MMU is enabled because access to
> + * start() is PC-relative and in case when load_addr != linker_addr phys_offset
> + * will have an incorrect value
> + */
> +void __init calc_phys_offset(void)
> +{
> +    phys_offset = (unsigned long)start - XEN_VIRT_START;
> +}

... this function (being invoked by the same assembly code
function) returning the value alongside storing it.

FTAOD I wouldn't insist on this being taken care of right away,
so if you get a maintainer ack this way, I'd be happy to commit as
is.

Jan

