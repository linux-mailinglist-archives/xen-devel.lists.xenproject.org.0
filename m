Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C76A662AB4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473803.734588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuZU-0000PT-PS; Mon, 09 Jan 2023 16:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473803.734588; Mon, 09 Jan 2023 16:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuZU-0000N1-LT; Mon, 09 Jan 2023 16:00:24 +0000
Received: by outflank-mailman (input) for mailman id 473803;
 Mon, 09 Jan 2023 16:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEuZS-0000Js-Mu
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:00:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b780baee-9036-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 17:00:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8077.eurprd04.prod.outlook.com (2603:10a6:102:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:00:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 16:00:18 +0000
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
X-Inumbo-ID: b780baee-9036-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f51LNE/+/DbmVlACFhsNpjEqZxev6I+1p86RVwLGorIztBLPtx9Rc7y54LOa3OvqQDdDpCpFZaJC9Axlqgidbu1r7HAelbvuWFEEuK249jjA/vrMLoi1MrI5iueSTTU6sHCNBJPvg1zZasPC+/Z2kwQ6xO3tPEvP24UV7xQM+ptI5M4EAkyT1rO5bUfo5C7V9TwgAD5YveAXZxwfhUBbK8c0Zt9/7det4Dib8Rn26XsSex7XG55d/Qqs7OLvCMZMmjJaAHQ2OytwqHRZSVMlT9zid6jr+IpZCM68zpesX3TNfJjNapufW5RoLjo/dbTnrhtpLzA4cADkBAvLio14GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkg86uDjDm9pfxdD297SKw77Vr9JODE/mSN58hBFiZk=;
 b=DuLECOgZT7Sq26TqfS32tedJIy/0AJYaA5ltkclBGjQuXgrChVymGl94E2hINFfr/QOA+TFcO2eyAO1asCH6sAmCr6b4YJg4s8R5+sGoB1F+p8t1L1FhDCt0qEWWo+wIEtcXY1C8UHFnawIFymFySYC39DGZSA26ifv3dP/Pk2rxma9ll6J1YFOSDOFBapMJ/VtDZipUpAFdX63tTCakIoL4DUzqvyleO5vLDebgOCe9mZN+ke5xzoEMIMGrIwkEIDu8ZyzGpmBDs9w/+hUm+ot//mT/w/UCTobbPuQ1krxkjOXgDKmCaB4kN1g+gwE3gLfIIxIGPbGp/9e5q253LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qkg86uDjDm9pfxdD297SKw77Vr9JODE/mSN58hBFiZk=;
 b=fGndejE86VLIzmBonqZdeEizFlivV/fjEW0NFhBoH+GxZUycRNIOT4VSUc/iPMNFmYrjombGB8D5jOSLt8of79+QiKFeGLalSxbHs0W2OZMdrMAn3TilJaGTGKrY4KSHczdI96p7tkjldRkxyyVujoHtPzPw4LA5HdfOraIRiPQeRhmVkhSRlDJiIDq1+con5bJfNF7WNtNdMdQXpejUfe/jBgWvKjl0cMLJYvsHwMB6N6vWRLa+cIdn/93exWPHDO7UnmILLUAZ6pHVhKXiLqjyHR+NXojhqgYH0WZuYey/RTIxAx3ikPjtrfTmD3mjeO2G5HtaiEPCHwxJNnKVqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e33d028f-b6c4-d120-5aa9-36c9f2d02420@suse.com>
Date: Mon, 9 Jan 2023 17:00:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] xen/riscv: introduce sbi call to putchar to
 console
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7a78c8-7113-48fe-7ffb-08daf25a9a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6dX0rWGCZdWJYYSymrIE/Y0NfqEnMN0ucFB9OLmaWDWssfr8ag7OMs9AxbQpBcmc5TDUixtrF64C3d4t+a0vao9MTiHB54NU3SztyQaddgCf7TVS2lmO31Q8FEMBj8p3+aTI6fpFO7H2Na3ySHNHId6w+XP6ohG0V0Ig1bHpddqGnr39uGWLw4UOo/9Nzud3LLwjtk4l1ZMKOKCN0CKyWFTKsns3uyMtDxDZmUEN6xwDAKfsjNg9QNz9FoM08RhOTTENLhssuRyKU9IO7QnRTwDdDf3OgrVu+RkX+RkVoKwuJ2NvAVoia6omU+bE3ZilGFZ7yIAYg/lOqaVbfnNDChEKW0SQxCdm9tXd3G6cY3LlXz0curhwkgHL1vqjvm4RK7dM4G98/BILvx44jhsr7jbn/09MZr30RmKGhjFDr5CQnfbMqKUEtPQ/PnE4GcpfYN4gogvRsjO4MLMDrxXgXf9Ttc1B3m6WlQDfRh1nU0sPny7aCpIM49MDBghll63juJE7gmQ7sguA22lrfWSZpSw3zaZ1sIvj1THYTJj5LaRg9wnkwFl1OFL8H8h0ARq9sOH2LhO8krtU/A89J9E5foH9qmBWIAGJaf41R8ypECILQzTXx5MgL0sAzBy22g1jdV+JhvIcSjfQSdsQAswXRbbSXU49xUyu/qqCvTS1+OhlsBfnw/1HnwJ50+gg3VfD51L53D/fGgekcNSY0k1SuE22R7icDxEyxefKJRVDuCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(8676002)(4326008)(6916009)(316002)(66946007)(66476007)(66556008)(54906003)(2906002)(5660300002)(8936002)(41300700001)(36756003)(31696002)(53546011)(6486002)(6506007)(478600001)(38100700002)(2616005)(186003)(26005)(6512007)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2cybWk1MmVXU1FsZ1p4K2lRaDhTWFdmcnRuRkRnbGdubHVjSk55U1N0amtZ?=
 =?utf-8?B?SXZlTjN5UnFiRS9kOXh4MFBGbm1KSFcwZ3BEYzNGOEpyVE1IYmMyU1hPeis1?=
 =?utf-8?B?RmxuUWR2RllvSFNtbXdXV1kxOWIzd0hwTGduMExQZEVXaXhhZGFkTHhqWTNV?=
 =?utf-8?B?ZE1oVVBra0N6YXcrN3hHSVZFU3hzOU0yaUsyQ213N25LNEYrTytyelF0L2tF?=
 =?utf-8?B?bE4wYlVDOGJONW9zV3l6UVIzeDNGZDQxN2hZcGtUOUxENGdpUzZ5MXNPR1V5?=
 =?utf-8?B?Y0VjUFA0cSt4K0NxTXdNdjhPaEl6K1B4VU1FOERpN3ZYdWcxZWZBYjVwTzZW?=
 =?utf-8?B?T1Z4c2VaZFRQMG9peHc3TjZzWGF4M0tScmRUZGZsZzdxeXhEUFgydU83N2Zq?=
 =?utf-8?B?dHIwa0tLcFdEeUlkeUhLeHZCYnhaNzFhRFp3RUNDMHlIeTdjdk9aVmtDNk16?=
 =?utf-8?B?R1NGK0g0dE5BcEw4UEh4UVpaTkFHSUNzVDlDQnlGSlhMZ3RnMVFBMVZZQTgz?=
 =?utf-8?B?b0Z0UHZyOFo4SHBRRzRJVlRIZklHR0RYRnJBMHB2MFlQWWNSU29DYW9DdlVY?=
 =?utf-8?B?aWtVeWQ2TnVwYnc0dElkVEplZ2xYM3Vpbys5ZGhxYSt5WkVXWlA4eWs3Zmgw?=
 =?utf-8?B?Z21PTlZRck9HWFZVbEZ0M2xPQ0F5aDhPckJPck9STmNWUTB5ZWlVSit6MU16?=
 =?utf-8?B?Sm9IWjRQcGxoODZmZUJpUWVPK211TXdNbU5NNUt6M3hTL3plcVhsUkkwNko5?=
 =?utf-8?B?Q2NHSUg1aFpPdmtraDBvTW9xM2VzZmtrcW5yWkpFM1FJZ2FUNVNTVmJmdi9k?=
 =?utf-8?B?eDNwTkRIeWNIRGt2RG5GVVFSd29uQ09aVmhoTXVHUTR1UlVZTDRzNnYwMU5s?=
 =?utf-8?B?eXVBUkJGVFl1cDFwVG9rWXh3Vzk0eTM2UVZId3NZRnpKeTIzVURGcnVDOTNp?=
 =?utf-8?B?V1c5Y2ZKbVNiSUxFU05jWWdmbVpwWi9LZENvcmw3anRJNGJWQjZnb25QMzZp?=
 =?utf-8?B?a1RGaDV2T29FR3VOR0pYanN6L0Fob3lkVGZOeHVkRXhRRmRCQXRCYWhsUVMw?=
 =?utf-8?B?SGxuZTB3dHAwSWg3Mit6NjZlZ2JxT1g5S2dhdFZYVHlYaC81aXhxdXBIZnVO?=
 =?utf-8?B?dkRteXY2TEliM0lJSG5XYjVsS0h6eG41dWMwTHJjYVlGL3VLckUrWFRzUEhC?=
 =?utf-8?B?RW1KcTRvOFJrYnBBRTJUZk9xUmtVM1VBWWhLdmtZUFI4ZHRyMFFzMUYwaCtW?=
 =?utf-8?B?cUUrR1FOcnIrZWlSWDExa1NaWklhdUNSbTNTYmFFUCtjSmI3L2NVbmhFaUo5?=
 =?utf-8?B?VmVTdTB4dUM5bFZpdlFVNWZPLzNQRXVBd0xiVmxtUzlhME5MUjdzV1dtNFQr?=
 =?utf-8?B?OTk0QVZZVk82V0tadDRET1QwUm1EQ1oxa082SzdpTlJDZ1lpc05LOEtxbVUw?=
 =?utf-8?B?azU1Z2V4MlZxdGRxT1Z5cHZXbHdmVWw5ZVBtQ2YzOUR3SUF4TXcydEp5Q3dw?=
 =?utf-8?B?MmZGd2Z0ZmFxVFM3bVoyVFVFUUhxeGU5ZlZlVWUxS01UaTF3eW14UE1OWmh0?=
 =?utf-8?B?Q09Da1RsRThCWis5MHgweWFtOEFOZDU2R1JZbUQ0TGlWMFltRVFnTmc1WWhp?=
 =?utf-8?B?djBka1FHMlo0WVhqYmxmdWxIVFZreWhYTm5HSE9UOHBmc2tuZW9BUVlhaVov?=
 =?utf-8?B?eDRONnRrcUt3YTFlYUlNRFNlSmlnb2NySWhPSUFZT2gvRFRzTXZVWTY1Zkxt?=
 =?utf-8?B?MmRYaVJxWllUeWJIaThPTEg3cW5rdEROZU9FQWVDeHFsU1BJZ1FHZWE0Um1r?=
 =?utf-8?B?OStEeFpHckFsZVJrV3l3QXIrU1JMY21leHg1bE01eFlreTc3N3hsRGZVTDcx?=
 =?utf-8?B?MEJIcXNkN1NGenBDcyt5T1RvcVpFS0lYT05nVFBnZ1NmTUpQTHZhalRBa2ww?=
 =?utf-8?B?VFllM2p4cWc2bHRxTFRPaDhUMWVWTGRJTHVMZDd3QWF2emdmL2ZIeWhxeWJm?=
 =?utf-8?B?VDBWL2ZxcEVhR0ErOUVMRkcxeFpLUUw2WXVBdU10KzZrbW1vUkk2OUdUdlRm?=
 =?utf-8?B?MXJjWTJSVWZ6VTZPVndrRGZBSFRHaWZiZ1g4VzdoM1lhWnY0L2RVVXdiOTZI?=
 =?utf-8?Q?un9Jj2t/dZLs4zxeWm+YQ2Lj4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7a78c8-7113-48fe-7ffb-08daf25a9a8d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 16:00:18.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txdMB7csWxGp+TjQD8WtPk1neVtl2FqoaVWEtc2T3kNlKBWQRUOpIa5Tu9qHVOVKkRrOoTqh2ieEEVR0CIgLlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8077

On 09.01.2023 16:46, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> +/*
> + * Copyright (c) 2021 Vates SAS.
> + *
> + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Taken/modified from Xvisor project with the following copyright:
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef __CPU_SBI_H__
> +#define __CPU_SBI_H__

Didn't you mean to change this?

> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
> +
> +struct sbiret {
> +    long error;
> +    long value;
> +};
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
> +        unsigned long arg1, unsigned long arg2,
> +        unsigned long arg3, unsigned long arg4,
> +        unsigned long arg5);

Please get indentation right here as well as for the definition. Possible
forms are

struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
                        unsigned long arg0, unsigned long arg1,
                        unsigned long arg2, unsigned long arg3,
                        unsigned long arg4, unsigned long arg5);

or

struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
    unsigned long arg0, unsigned long arg1,
    unsigned long arg2, unsigned long arg3,
    unsigned long arg4, unsigned long arg5);

Jan

