Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E75646A96
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456886.714735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CKJ-00044N-4E; Thu, 08 Dec 2022 08:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456886.714735; Thu, 08 Dec 2022 08:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CKJ-00041y-0v; Thu, 08 Dec 2022 08:32:19 +0000
Received: by outflank-mailman (input) for mailman id 456886;
 Thu, 08 Dec 2022 08:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3CKH-00041s-Pj
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:32:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2981e39-76d2-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 09:32:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7528.eurprd04.prod.outlook.com (2603:10a6:20b:297::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Thu, 8 Dec
 2022 08:31:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:31:48 +0000
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
X-Inumbo-ID: d2981e39-76d2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edPqwQl/LMLNsRigLfHvEL7T4j0l4ehwlzV2UsdiMMV594Lw1pLxbZlIlY+lrHORqhofw7Da9PSlQ3x/3MF/+EgfpYFeTZCqMtu6ISEZPaqpfMw/Tp2DmbLPKLTr9+UoVnFHMpV6Kl/gD0rKkJTY9cMcPDv23LO5gy7h6y2npu8bQuQsN2eXmJlE8UZH01GL1mgFfYTsrW28kO7IAGXE3rUv2eQO1ZNe6cipKMJbHHe5K0YPOSwJxuGPmW4XDy2ZTxrtmXabZx6g2T27ptEEIw+HxkiuAsWs/VxGQAfGtUjz23P/bw1o+6IZv2Inp49WfGYpNalcZ4PmlsEDnF765A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHaGxsDIclkMPpguyuyY6mwy4nelouZrJLSamVJUtqM=;
 b=it2itoaAKaDbeAhdaFnK0pzEG8p4VStr+/hGAneYkn8V3KWBvl7HVA+OdMgX8MPs/Bf48lfRM5orXTSsynuWDODcmTI8bXBPIVPY2m8PMJ47bk3EUL3KI+jfWk79bqF7k9yPYQ9n5moHWtCKIJpi3HJSi2QPcvNXmw+ar8zKhsRA30cJ4ujwiwhbxlWeMl/jfkiMwz3W8Obxa1wMyUPQuBiVYE0sw0yWFtsELM2q5VQuEe4PtJO7BdXZMbpwUR0lkvhCv8QVudPGjetTvb44XgO9+tE8pTsejeebIs8Ko3AiQs0T6700pNa1+QZtze74oiHhLmcsxpYMqfwzQ6gG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHaGxsDIclkMPpguyuyY6mwy4nelouZrJLSamVJUtqM=;
 b=bu/SK8YEmKnvEtsLAH+uwyPs4heRNt/rR9K5UGs5H2qv1+381YZTePxZY5OFbtOFUG5kSVfv1mQ+y/Av/0RKiBU/qdzG3hmHEQQrGgTV/VUz0wZq+G1VKj4mP+FfDzfz1hoYn+rQ/CpVEu0r9Jx4kc0m8oHRjrKem4cyZkFvaX/trVFgDuJhV2VjU2ubZ7b3Gp2E7HjExQtTmiOoNqZbSu4TTR+rrimQ+e8j6JhWA2TIr7Mq2uHCRxvRUjRux40gitnhWG+1s6mR6CxUUPaDlDbljfCkHwzQm/yOtOePOk8M7t4LI4hpT36pQ9Lj1mMDLGrbuo7u4L0Fwoc20Z3NqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b76ed68-4305-3183-f63e-a21d98ece3cb@suse.com>
Date: Thu, 8 Dec 2022 09:31:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] xsm/flask: misra rule 8.4 fix
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dpsmith@apertussolutions.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2212071519340.4039@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2212071519340.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd1b242-33dd-477c-c72e-08dad8f6a5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMzx5n069WLjJldlabci/SLXHs0tAKGiBXkh2Ku4eiXvmKRCWX3lIgZ7+ALhu4n02DQWPmKSL71GXJNJABOy74ZwZO0IYPkFe60Q0xXAmQ46uwadX+zWHgpA2jJi5vCqV2Aa9RoThtIh9j9DOr4xXlIs2fd5TrGLCt27SzuHaywZvDopJkjlFj+dk4eOIE/2LovmtQitX3gEGp8Tr+zanNplYN1Nqa65EDA56BXQEyv5INOKdF/CDH9ICFfPlP4rApCsQk3jjsfLyVtlYjemep8YzvlgWr0MyefXVgzS434UcBudoyNBONxmHfsrMLiheh7wLYhX4jQJ2TeqQpkiVxbT9/KAQrx3S+d9UjQpSswcpVKpz2+K0X1u094HN+6scr6Ivdpr17bKdlIisRUGt59n39mbrysUWF5xh6e/avdkvpTvXBFvKjNH2W1/hcnzD0LfQ0bJUYBW48r8a5Z40uRRz4k6lF7+IcHmVAsG9iTuXahFcY+z0DxbgKWQ+Q+fqdtPLOAEs8QQUROPm0bK/bt1Ow54gZ5cZ3QRqV/gjJCm9fSoKJF5QNKS/FFNRJtlCJOyaD2eH0WqXFpQk18TlTgpjcL+wGXT93/PNGUDBVhsvIBxiDt3/Pf3jJxWEDXhyBlVcl+c/muMT1IarlAO3U2B3dXGzqJSRrLOHYGlbqMg1UQ5/M4zFDX0SbGePVsGyrGbWk5GBTQPjfy7tgM3E2oKWvFJgxgTmtxoIVlC1ZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199015)(83380400001)(31686004)(86362001)(4326008)(8936002)(31696002)(5660300002)(2906002)(8676002)(186003)(6512007)(6506007)(53546011)(26005)(66946007)(2616005)(66476007)(316002)(41300700001)(66556008)(6486002)(478600001)(6916009)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkpJUHREU2RDRGcvSkVSUGZ4THptaXdtSmxKT01xVXV3RVNvcjE2QWFhTUM3?=
 =?utf-8?B?U1BaODl2UHVsSVpWTmpyS20wVkxQWmRkY1N5bVF3RkNrZ2xvakxmeEZDd2FP?=
 =?utf-8?B?aFFPVnR4a24wSG05QzJSRGZkeExMZ1ZQdC94MjFJbTJZUlg0dXI5L3RxZUVR?=
 =?utf-8?B?aVMwUUNRUkdRWnhobXBmd0lwTTYwRi9jUmpBQzV6cHgyU0JuTmNDN1NuL1k2?=
 =?utf-8?B?WjBrUnlCVFNrblZzRDJZRHYxK1NuUGxJZW1iQVZEZ1VMZDFaQkFTa0E3K0U3?=
 =?utf-8?B?N3I2dlhTV1VmZGRkWlBBSU0zNU8yYTB5bDJvaG5NSmY0cGl1MmJXQkt1RmZx?=
 =?utf-8?B?WHB1VXpjZmp1VWM4eUF3ZzZzRVJ5V1RrZEdUc0NVOEZLWWR6QTg2dkU4bE5w?=
 =?utf-8?B?L1AwT1hFTzRVZXBtRG5FOXJWaDNNS0llV2FVWnJQTjI2RWtrWUVsZCtWeGdS?=
 =?utf-8?B?MTJUVExLYzFpcDZKN2lrQWZlSllGNTFCZERXdEU0RWJQcnR6L2FGWWQrSEJu?=
 =?utf-8?B?aDJzeG43bmdoTkwxV3NCemdyTmFUZlJ5emJ5N2kvNGFoMCtoVC84RXY3N0lS?=
 =?utf-8?B?VXhzZHljRXZBTENwbXF2eHhNU0dBdk40NWtmNkhSQmJQSUpISGtnTVIxK0Ir?=
 =?utf-8?B?M3dIUG5WM1RpZTRENkI0S0NKNW1UL1lXTGNTNkRBYTkzbmpRanNJQ2JFeS9Q?=
 =?utf-8?B?TDhiY3daVkZDcTBSWGZ3VmUyTE5XcEdtYUVNbDBkWndGbk9ycHpuVTRIcy9J?=
 =?utf-8?B?dkt2LzQ5OWZVOThWbkp1cE5GYmt0SzFTL0dIcXVKQTJ1ZWorVUZYZUlKVURB?=
 =?utf-8?B?MUdmazNQV1V0RHZnSjI3OEtpMHMvMkZ4ZFlDZEtTbFJxMHFwQUY1R3ErcDVy?=
 =?utf-8?B?WmRwMC9Oa2RCR0dTcEM4RHFwRi9YN25iS1hMNm96K0tyUnpnNmMzQ0hrU1Fk?=
 =?utf-8?B?Z3NJeDdvamNmZGZ5blV0YUFncTZSYmVkcVB4SlFuT0o0UUVPL0tBTHFOMGV6?=
 =?utf-8?B?WStqa1Q1R21pTndFMVJ2Y2Z1WWFQSzRjWVFFNHY2VnBQblVNMVArU0ExZDZx?=
 =?utf-8?B?VkdNL0EvTjBGRXBWOS9tbTE2c0RxVHlmUWRLak9hK3NQdzJaZnRvdk9ONVNK?=
 =?utf-8?B?SjU5ZkNoVzlBYkdkNko1ZzVVNlo4Vk1QdHJvWDFQYlJWL2tLc0d1NVNvNnNz?=
 =?utf-8?B?OUFEdytxek1mVTFTcm80N3g5bDhCUnUyaWtsczJoZDJ0dERKYTU2K1BsNlBq?=
 =?utf-8?B?VkZ1QXI2cTBMRmMvMGlmNUxKR1ZvSmlwTWhDMk1pYzR0UFNlTnRCOGVjTzh4?=
 =?utf-8?B?aXBadzNkbUZPQ1oxcXZ4bjBYb213L0VoZ2gvNWpOVEdmTTVjMDB0aDVPbld4?=
 =?utf-8?B?R0dKcjFnUlZSclVONXV0RjZmMVVDVHA1RVZuQWplYWh5clBEMEFlTVp5UHdz?=
 =?utf-8?B?U3dqcjdhWmtOMEZ5NC9qcEs4WFNGMTE4OHQvQWZOTUxyU0thbUIvNjF5MzI3?=
 =?utf-8?B?eC83aExCMmdKb0Q4enFBYW9uV1pCaXU2dlhSbTdESGlIR3lvVTFPWWdwV0lX?=
 =?utf-8?B?RFR0a0ZLekRDaHNrWko1S29QQ0d2bmVjT0FFblJzaGRybjB2UE1zWk9iMnlF?=
 =?utf-8?B?Vm1KR3EwZ0xxREZYbGRvNUF3YnlMTTZyd0xRMzVuVEpxdjhKYjlieHUzNjl3?=
 =?utf-8?B?M3JyUElKRWxBT1U2a1FNcXhyQ0Y2SXNMNXZ1NDhiMjFKRmZldXA3VHZNdmRG?=
 =?utf-8?B?eDFhamt3M2NsRzd4UmJHWGljbWJEL3BTL1hUR3Vhalc5MkJYYkhXREdhZE5C?=
 =?utf-8?B?ZDJ3a3ZZaU1kQm9xWkRETFNOcXBkVENtb1hsdU5ZYXl2aTRCaWJETSt0QUpJ?=
 =?utf-8?B?SDVVWXh2U3NwM0pmdzhXZUgyYk85VEpoOVlPRElLcXVZTndKc3JKd0FpM2hz?=
 =?utf-8?B?Z1dtYjdET0NKanFHaHlYQWsrUU9lK0hnWmpoSW1oT2xCa3BBMUFLR0cwUDlE?=
 =?utf-8?B?cm9FclJsRmx4TWM0aXdzNStmMGFuSGw1T1V1b0pDb001T2h1RGQrbHFTMkMr?=
 =?utf-8?B?QzU5RDZ0MzdFL1hCd1F4SlRRRnVJSkhrZ25qcjJjSmRxeW1WTFBuYmRBWHF3?=
 =?utf-8?Q?A6Js1OlekNM7sKIwNt6CfmOOl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd1b242-33dd-477c-c72e-08dad8f6a5e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:31:48.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lo1qXaYrkBZf7MWDL9419Mqzc1UFeGM7wyAAUvbc3Lsa2SkJAnUWbKH5kNzxY6pg4XugooSob08AMfhdM+kVTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7528

On 08.12.2022 00:24, Stefano Stabellini wrote:
> Fix several MISRA Issues Rule 8.4 ("A compatible declaration shall be
> visible when an object or function with external linkage is defined")
> found by cppcheck affecting xen/xsm/flask.
> 
> - policydb_loaded_version is not declared; removed it because it is
>   unused
> - move ss_initialized declaration to xen/xsm/flask/include/conditional.h
> - #include <conditional.h> (which is
>   xen/xsm/flask/include/conditional.h) in xen/xsm/flask/ss/policydb.c so
>   that policydb.c also gets the declaration of ss_initialized
> - #include <conditional.h> in xen/xsm/flask/ss/services.c to declare
>   security_*_bools functions that services.c is defining and using
> 
> This patch solves all the Rule 8.4 violations found by cppcheck on xsm/
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

But I'll continue the v1 thread wrt the two conditional.h; that's
independent of the changes done here, though.

Jan

