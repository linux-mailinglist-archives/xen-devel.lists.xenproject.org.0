Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA46A1DD8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 15:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501101.772689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZUn-0001dB-74; Fri, 24 Feb 2023 14:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501101.772689; Fri, 24 Feb 2023 14:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZUn-0001bF-45; Fri, 24 Feb 2023 14:56:25 +0000
Received: by outflank-mailman (input) for mailman id 501101;
 Fri, 24 Feb 2023 14:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVZUk-0001b9-U0
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 14:56:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6649226c-b453-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 15:56:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9554.eurprd04.prod.outlook.com (2603:10a6:10:302::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 14:56:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 14:56:19 +0000
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
X-Inumbo-ID: 6649226c-b453-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX35uCpbvwZ5h0EpVlmgTOfcDcXWcv9gfnGclLStyTzqT5f8CYjVR5iwrKLhOpyGPwc/rz9LQd5Yrv5NttKRACj7MomZpcd9g/OBw903iAmgKpjebkvhFJwGGuqbwcYPihL7g0k+J2nSlTCAvzaiTQmcOEEGq1LCFSkwhpzW4vX+m6lohIuTVtXCdYNGkcv2WELoKFa7JxFLB3PvyulHt7Kv6lIeFiueUTDLQQ5jpqa/vsho5JHWhiMc5yTY4GciMEO1zZmKCyAEPFKaszXj9cFKjvC0wx/y7a7Xlylmqi98nDdOsFYy3u/IlOVgsMsVO5yzvZdp0foF8v2583IIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHEEUfUF20HxZ5D3lpWO3zDJYtU2QA0Xdgfe/VrBu3Q=;
 b=SZRCO6KBkFB6xDBPBDpk2SwaazRBnRUflNDrqorK98mkmpHexLHPFex+4fMtH+Vexa6HgJPlo7rzxxM1nHeyQZ5lGSsw28gJjYG9Mi60/Vh2E7Sc/cV2p5TilAiFmLB+m0fkCoVzgHE8o46W8n2nHB2BdTxQfOfFla4+ShU6Sph7qImZWHUVu3Okw6O7yoiWYb8o01Igg1oX2RS7NC0hnpe20DsrKl998p4OnAsQ78A0UgXV1dfJZ3Q7RlcEcRSd4fFBo4JzkW1M1d7qk2p5oJts0UNxqra29+Rfdq9NBRp46mHziSoiaDDUYaKbDtBW9uRYU6w9dqUHmOmK4HswLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHEEUfUF20HxZ5D3lpWO3zDJYtU2QA0Xdgfe/VrBu3Q=;
 b=0Sx03MlRs8PL5iaPa1ExKSpkTtv6eLsAM536raajbwvYb+xUrcikozzDRhLs2JYRH81iFO4g2y1zV0/zPBfcFK4LiGE5nWBlEtsPP4aj+KjChZbaPmU7wdj71YpObAPUSXoGERjaXYai77GzAhMkwa/lpTjCn1CP2rWy1xawJDU1HCdvBz7fqFB4uHyUBP8WY+1Z8NL+5OQT9iMVj+7+/h7uooBC64XdgnuJGWSEbtgrM/TqCVeRh1E5YEH9uPMqYo1cpcjHFN8B3fjBt+E0T7YcGVjJQMWKKWjGCLBsv5C+w0tg3mlxAHjgtpK/CnRPKdNhbaRK5B7ceNGsMiqEHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0a46792-ed15-788e-6a61-f6b0d8f36983@suse.com>
Date: Fri, 24 Feb 2023 15:56:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/riscv: init bss section
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e391f9d-114b-46ff-343a-08db1677493c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T4c7PDDUzjMNO9MT20o2IxkOPY7tAinyHg6bzfwqiffRYYmvZvSGAkEdyKedZa/32e0+UAm4Mar3ZMk7mKLiwgkM8WPn8XC20hG1sWPm4LE/C7fyicMtwMHzY8ptmU1Yv7vGtL0X0B1YvIL7ekyckxwMJcC65WZp9FLekpGi2Wy0+JGqozKA56xaizh+kN+MXhjjLXy7JCnWMpxsiBl7lz+don7L38jrzzS75xyHwB0NEkCx51EW9qD8RD/VRpBxLgqOr6ZcJ073N5aaW5u3aDnLuhpkqEOzV5yMq74EbgoasTRgwE3M1sq5FkhslFQPEVp25UZbDlsKnwEpouowe01xlbTeR2pVuME5kTVXspN2oD9/ccyVLekOsvo/Tr/M++Gfd08oZruwoncQlCBn1j93SzkLTGp2/pSkrH0OPCw7JvXMusWgIaFXimOZxITOzRdvAog4KArD227m4g198p+/V+TPzS65Mnj9/ou1gnoN3C1xl8IgkXV7lOeW+8tECwATCJYdeliCR7/Myxd93BpRgq9hmXj3UIUIMdzwqWQBxiA59bjOBLjXX5iM1W5YWn1I8k9q3pN68oEiVu3uUjkeyf2OW5AdVzLBOMpPrEosVLcYivtjI9LtdtIeaiK7VYCCLME9cUWDbZrMlw5mxvGTiJNfWaJbLMqLxg7RpahqGColpQtcNtJZgoWMhcXcSSN+keIz+0iYyhMz5/Xt8GobasC074e2KKrzGo01ZgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199018)(66946007)(53546011)(86362001)(31696002)(38100700002)(8676002)(6486002)(31686004)(66556008)(66476007)(2616005)(316002)(478600001)(54906003)(4326008)(6666004)(36756003)(6916009)(6506007)(2906002)(26005)(186003)(6512007)(8936002)(5660300002)(4744005)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmM3cTFkd3hlNEVrOHFKVTMvR3Z3WnNGdGQ5eG9XWlozV0JPSnN6R0ZvVnU3?=
 =?utf-8?B?RGZLK1FzVk5XNkRJcGM0eUFYdXB1NGVIVmpNanVBMVFVb3FiRDV6OWwwSTlG?=
 =?utf-8?B?VHZaWkNYUFFXRGNHVFJHd1UzcnRxTXVwWVZrbDBwQVgvamdXaHlxM0plR3Mx?=
 =?utf-8?B?WjIzdmYxSmRPR1hyVGtnaXIzL1ZDRkdNUXp5aHcxOUZJVlZ3WTRLQnAwMFc0?=
 =?utf-8?B?dnNKdWhXQUs5VVB2bzVFTU5UV3EyYjF2NWR6UFNyMHZyME5NQTMrUmtsdm5O?=
 =?utf-8?B?Tm83a1BpcjNJUEE3Q054Q1I3aUFqQ1E2T0VtYXgxQ1M1UHhCVDNneUVjUzVl?=
 =?utf-8?B?ZFlxY3o5eTJOd3J5SVlrV1hDRndXNzNpeHRZVG03bzVmUFI5dllFOVIzbzJ5?=
 =?utf-8?B?TlRJL1o3TXZtMVJXZFMzaTNheUFFQjA4ZFo2a25NYXc5RUU5MCtrQytxWE9H?=
 =?utf-8?B?SUkyK3lSOEVLTEpIa2hFOVl1aVNNdDk3Vk8vUTJGYUpWbjZla3lhcWtBUFVC?=
 =?utf-8?B?RE1PSUQxQmVQTWx1eE02QkVseVU5WnpZSHVFMUNFalFtOWRpU3lqWGFJOE9U?=
 =?utf-8?B?VjJwNVp3MEVaVTFtQXJsa0pTRTNHV25aclIwOElubGZRMGVXU0prVnI3Wmda?=
 =?utf-8?B?SVJhQi9tS1crY25ybUxiTG9vRk9lc04xbEhucG10enZBYXdycXNkcUJNU0d2?=
 =?utf-8?B?cXR0dUhtMXN4Sk9RK0t3Ymd4U1FYYldZZW9teTJnMDBDc2lYQ2JSSytHRlRF?=
 =?utf-8?B?dCtyck1aNER3bm03M1VxcFJnc2xMOHBaUXpTcU93dlpPYkdlNFp2S2JPLy9q?=
 =?utf-8?B?TlppYXQ1L0R5ZVZna0wzNzhsNUFDckYxc1BneDVqdXFaMlI5aTNobWJ3THJk?=
 =?utf-8?B?azFza3hNOFBXQS9JREZkMklPUHBSTGdBS2UramN1VjZEeHRSK0czRXh2Tnhx?=
 =?utf-8?B?bDJMK0dyYy9hbUEwVzdZZ0Vzb3lnTnpSK2RXbEU4Y3ZDUWxDWXhFeFpJaFg4?=
 =?utf-8?B?YjdDbThlWnFtdFpSRjg1Y2tyYTFzaEhPQzlDY3E2TEpMbURMb1gwNXJkb0ZY?=
 =?utf-8?B?RWZGZjZHTFc4bVhqZWRXb3FRcVJmeTBYdWI0eWNLSmRqVGtnVEtzNENtQWVM?=
 =?utf-8?B?dWIxUGh6djI2QjRTQTZBR1BUeDRRV3dIMTBDak1XVXBhV3VORWVNZVRuOVdY?=
 =?utf-8?B?cnppR3FnTDlsNzAwb1h2YjI2MUQxcGJ1SzZWblpmYWdYY3A5SytlUS8vMUxa?=
 =?utf-8?B?ZDh6Vm9UcGZuNWkwSVlkbUtWZHFZT2NEaVpvRkhraVRPYnVURzVEQk5oVWhV?=
 =?utf-8?B?RmFrT0JDLzFXcjJjaDdZaUVMeHg2RG9YM3Qwc3cxMG9nWm9TaXY1ekRSaDAy?=
 =?utf-8?B?OFd6bEdjYS9HZDN4d1hVUStJMW5iZDNIdlNIcVN2ZXNIYlBMb0pkazhiZUVL?=
 =?utf-8?B?bG9lNFVrbWU1Y2FIdHMwcG4xb2l6bW05YWxnRFNGbE5ZREZndFJmU21tTE1o?=
 =?utf-8?B?RzdscUNVOEp4ZUxqNXhLSUwzWWNOZEk1RnAvVTgzbHpxc2hubmVvWU9XbGls?=
 =?utf-8?B?UjE2bjBpNWlBT3hUeXVvMW1tcWgrb2xhSTZqYnRmQmR1REMvNmJLZjdEZDVh?=
 =?utf-8?B?S21wYUErQkRwUDJ3eEYxQWtDbUFnVTFCSmJ3WHEzM2p4Q0dVd3Z6OWF5ODY4?=
 =?utf-8?B?eklXSTBhVVNrZVFKRkZEaEJKQ0E3VzJuZ3JBazVBVUtOTG5vdHhUOHVSVXc5?=
 =?utf-8?B?d0RiRUNxVnJoSmRqU3FxaG1Cdy9vMEs0R3B3RUxuNGJ1RjFGRDBPMS82R1M1?=
 =?utf-8?B?dmFCdENxM2VOTndTS1NvVUhCZVYxZmVBRWROSG1talVsSS85d3ZpRGE2RFhU?=
 =?utf-8?B?TlV4UkRnMytoeTZKNzhwdlp5ays2VUZzU2F5b0U2eXU1WFFLNzkxUVp0d1cw?=
 =?utf-8?B?enJ1VXZTMmxTZ3RwUml0NTBJRVZ0K09PMTFjWDdPM1cxWjIxbnNqNkdMTXJK?=
 =?utf-8?B?MVovMnpoc0I1SFZCSGRGbTBreXFkN040d1JKcHVhNzhOYk91d1NIQ1RheEF0?=
 =?utf-8?B?bStmSUZYdXgrcWJ6K1ZlazduSmFaOU9xMVRKb21zajg1bjFNM2xlSXRSRjFi?=
 =?utf-8?Q?/mDSUz2Yl8sLVmWVGJon44TgV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e391f9d-114b-46ff-343a-08db1677493c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 14:56:19.0221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2rTBR29TH1C5D/jvmtO8IRwIF4dBHsNg04Q2Wb+VIjJPOTEgCQ36SiHoxMM1qXpe2tPTCrhN7q+Uc7deSbVHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9554

On 24.02.2023 15:48, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -24,6 +24,18 @@ static void test_macros_from_bug_h(void)
>      early_printk("WARN is most likely working\n");
>  }
>  
> +static void __init init_bss(void)
> +{
> +    extern char __bss_start;
> +    extern char __bss_end;

Better use [] and then perhaps omit the & operators further down.
However, I thought we have a compiler warning option in use which
precludes extern declarations which aren't at file scope. Even if
I'm misremembering, perhaps better to move them.

> +    char *bss = &__bss_start;
> +
> +    while ( bss < &__bss_end ) {
> +        *bss = 0;
> +        bss++;
> +    }
> +}

If you're sure you can defer this until being in C code, why not use
memset()?

Jan

