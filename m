Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F95C75FA1A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 16:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569009.889305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwo4-00053i-Mh; Mon, 24 Jul 2023 14:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569009.889305; Mon, 24 Jul 2023 14:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwo4-00051G-Jv; Mon, 24 Jul 2023 14:45:04 +0000
Received: by outflank-mailman (input) for mailman id 569009;
 Mon, 24 Jul 2023 14:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNwo2-000514-Rd
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 14:45:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab12c211-2a30-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 16:45:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7842.eurprd04.prod.outlook.com (2603:10a6:20b:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 14:44:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 14:44:59 +0000
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
X-Inumbo-ID: ab12c211-2a30-11ee-b23b-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBNGXdQbQOMOtt5J37p4p51Rur3vX5Qo2LZQPUPgLqSk+o4PnYFU+S2nw1huBCWXmCdvjVQUhDIhVwq8HCbMqahhL8OUQB+8J7vlO3Mv0Zf9gM6WL1a9e5ryaHAYJGzEKDVwTsrLfQ6e3/4v4j5znhXagHopK961MfXrlKPT8bHM9Y4SQcZzASPKMFZZajo/yCjTS930wSlBgQnuJonUYyyGZJDYhyCGm/X8vPtBcgPdF8qg0YMxm9fC9sksL0pifziS+8PrdUWpwcJFjXBHgFilbvscXjJBFcOhcZkRsUV4Yeyq9R6VoSRtqowJjNi41R8oCWs25OQSyedPMX0Edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niFdESdRLTWSWCxrIcGQL93tVo8iJqV0Ckd/Cd3J4ic=;
 b=ZqtaufUHa8MpPdr6eYgW5YRaljZ/zu4tNqNVkuimhK8Eh2zVgtRMQh404YuwNkGTJtlNBB/us35BhxV2QiY1W4VuS39L2ifnqn9O5fO+XB0A5HJZI1112xdPkbukfCynSjG1DoYfGNQoERqqCh2HtnIAj6qK/7VlM3zN8cFQZl73RthW15mlyC2EVmGMA+BaB2AWEu45vHQDuw2BqswO/CyhanucCp7IT8idSUXkcejUXM5wxCieHbiiu0dZFy8RWRLKh5OkShjDDN3vXksolFbbWW7WdLBOpOry3q1Jh7mtG+xoe/VRQFWPucd6vd1GVXCFRL+Fdogv3yrBA8KnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niFdESdRLTWSWCxrIcGQL93tVo8iJqV0Ckd/Cd3J4ic=;
 b=Q56cI/YqHCcSpiwv/3ze1lom6PLsDKrzCNgBrxDXdsh3zL9VoxyMK9tB0RVvJe0AcvyjQrpuwFWAvnKh7NnZikO51NgVc2IXAvF5ErUJ25leaB+9PSX8MUOfo0QVFzjf3zcIC9+2dnMirpsRcJ23H7SGpkhhWIR4Fn2k6RiWZ7mIv7CHU8g/aSWacRS5fI5DxHLK3PUgUXtRA4gbq0x32g6qZqLEmU7CSj0DeCm/5c/xOnVJS+/aVOCXHkNyIID1JkZPyGYIrYF1AzGtb/ZZKM0ci8qcUPfie0SWIgMZlVWC4jA9qwxDf9ajTYBRHG7gIpUbn0lEOjeeq/skhC1NCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e56d35c5-5fff-1067-3c47-ae917a4720ee@suse.com>
Date: Mon, 24 Jul 2023 16:44:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] efi: mechanical renaming to address MISRA C:2012
 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <60e2908f5a6c8aec082b59b44a688c260805c7b2.1690208527.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <60e2908f5a6c8aec082b59b44a688c260805c7b2.1690208527.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: a4597932-f840-4cb0-ba1a-08db8c548e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uszbPEDsquP/KeYCyXxqTh6defNcAODl1+DnPOPvf9oii98+POhishanQmrnv3pl/1yRFyKR1EXJbv0YfGUc7vdhU34VmOTz1euhhNodFHYAxsGJ0qW3l0Tg6yJH7UosbLK/Oj2QsC3RQjpXBjZasb4sOJbwdf1AiA3hLL+UHS6cCleJC9JLIFwJvO6MCWjCL9v0rNHYf09IcYL2s96mz8fk/pjqAV4V7dcHKeuDKT4vBNGu9pg/DrHDwxiGDH6sYtYl8glUQXepVCDiX5sxtdKJqcwuedP6PNOwGlm7ZgGkJON8zinDTmY5lb5uBIaut1RSWvbXnSmAD689Cs5RKytTR9ZLDO4RuT8Ofu/uBH7Q8OCxa+U2yZAtU3wTyRbXHNiXB9iyo9K1dr9nc4R5dl9qPdOMvVB3OOn2+EYliQvykC23CLTxvd4FWZpvJna3hv+pVd+NyJyTWUI37eH/dnIUc71YCuHKxnMBfLdaPle8MBzC8MmLPjGwreXW7gOC/Q6CeoR1gbchMIw3h2iAqM2Oy5f9++7uTXjxXxcl2u2jTGk7z5jb82Ka2l5jO29s+8TUpS1/qCQK6hsCi4631p8nw+egpRz+zQ+O34DEQckMqYTfguf9pHYrJElDWsdp70u2yclFNQUz6nm2Ef1QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(38100700002)(36756003)(53546011)(2616005)(8676002)(8936002)(5660300002)(478600001)(6916009)(4326008)(66556008)(66476007)(316002)(66946007)(41300700001)(26005)(186003)(6506007)(6512007)(6486002)(4744005)(2906002)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnBRV3BtZU90Q3d5R2JkZ2t4V0VFQ05zaHVOOWVqdFIwTlVyOHBEeXgxVG9s?=
 =?utf-8?B?cDl4R1lQMFozQzcwZTlsWGU0Q3NXVWxoNHYyMVlibmRHSVJNUjZHYmlYYmpk?=
 =?utf-8?B?TWRra01kWHU2a3ovWVJYSm9KZDFVVlVNWkYxZ0VwV1JCODhMVENvMkdEVDRr?=
 =?utf-8?B?bmppSm13SVJWb0RScDhPYThWK2g0Mm5CMUR2RG14UXR6cVZ0RnFhSTZza1BX?=
 =?utf-8?B?UjJ3QVBxRnhNdE14Q05vRm5Dcndobm1oQnMzLzEvUHdUb1l2aTlPWlNtNllE?=
 =?utf-8?B?cGQyV2g2L2lYa3ZjRk94OUROSit4UjNTR3h1bnRua29qcjE3bWhlekE5NHhH?=
 =?utf-8?B?WUpIK3RweWtkR0Q4Z3VyZWZ2RC9hd2hVWDF0N2NoUzBLZjlTYkZrT0IxT20r?=
 =?utf-8?B?RVBFbTgvbk9IVnRUSnVGUklhZFZDclYwM0NuS3FkL2xYWHZBRGFFdmV1R0lM?=
 =?utf-8?B?MlBMUHNFNVBiQWwyR3RFQytTMzZ3b3htSmt4L015QVNCUDVaR2xzTjdweTRz?=
 =?utf-8?B?QlFJV0ZTcDVESFBBOHJEWVFvdmRVdUtjUnR4dmVBbHpHZDJNdDZNSXZCbnQv?=
 =?utf-8?B?U3R6VmVaZGkyeXZhek8rQnBtR3Q5N1pxUzk5Rk40ZlVldU0wYURxUGZrNGlU?=
 =?utf-8?B?NlB2b2RtamVtNVp3bUNBTTc5T2tJMnBIczBEcTRBUTNESTNjaWFQZ3dIdkVE?=
 =?utf-8?B?OEtyamVoWW0wby9PWHpCeUFVeWhINTN1eTd0Y25CL3M1VXoyeUc4K3VTendy?=
 =?utf-8?B?dVdMU09YelF2R3NHWVFha1hSdnprd3NnNThBTjdSUVlmV2loWmJadDNCa3J2?=
 =?utf-8?B?VHlIa2NkUmRzc0VpWkJ2cHpEUEV3NUhKTXJSdDZCMStwTG90eFVGZTZid0VL?=
 =?utf-8?B?YmhEUzRteE9KNlNoa1hSUXA2RFhDT3MweGRxa0NnaEU0Z25RM01IdWFvUzJQ?=
 =?utf-8?B?cEdkZ3dobEt5V0VGWmJMWk5rNWpKMnJSUTNaZkIvNmVyd1lEc05mSWRXRDJS?=
 =?utf-8?B?Y3pqNGQ0R2RZb1BpYitIMEs4KzRKWjFXcGlXaWUrNU83T09YRHMxUEF2YnFn?=
 =?utf-8?B?bWt4eXZZTFFxRFdwUlNzZlB5UWxkbXdyQ29EbHowYmN1Y2ttblRIdTJ6dDI4?=
 =?utf-8?B?N2NJVS9oMUVPbDNzMjkwYXVjQlJYU3cyc0ZGbzZxbXJtdzdZQXRUOS9yWm1W?=
 =?utf-8?B?N3ErMGdxMm1iNlg5ME9FL3J3dnl5blNtQjB3ckNTRmhja3NzNm5FcHVkSUhP?=
 =?utf-8?B?eU1XWUhmYTVsdjhYc2kyZzdJLzVuRHN5RnZZd2NkOGtscG53eFgxWXlQaFUz?=
 =?utf-8?B?a1NWVGRENXhzSWMzVVZXSCt1b2NVcWZRS0UrTldhcHIzbXlsZ3MyTU9JZFZz?=
 =?utf-8?B?aVcvMmlPNXZVTzVGbTI5VTBtM0xsaTVZQllob3JpUHlkaHByaDVwMmVlOE01?=
 =?utf-8?B?M3k4bExWS0VBT2RWTW41ejAzMHZTMTB5Q2l1TGcza3lkcTVQMmJDdjJVR003?=
 =?utf-8?B?VjRJd0RwcXdmRVFVMS9tejA5Zyt0ajhmckV1bEZYQkRGZ3NUNmNOdXJUYVJC?=
 =?utf-8?B?TW45R1dLVFZqVTlUbEFnNzZHcHZvQjlqcTJjbnNDM2JEdDljVEY0RXhNSWhQ?=
 =?utf-8?B?em9iRE01eUdNK0tvOCs0MmJZSzA0elNEdGpHNlNaaTZSRjBBSnQ0elUxejNT?=
 =?utf-8?B?Q0xkaDR5OHlzNUNGOVF2a013eDZiRzk3RGpPYzEzRWNGVFJjd3ExQnhXdnBs?=
 =?utf-8?B?cE9PZEdDVm5kQ3lPTVJnV2M5RkUzSXZwM2gra2I1VjNqUWs0a2lDbmRqczhy?=
 =?utf-8?B?cUtCeGNYQlg3K2lSL0JidDY0cXE0T2hHclRKdUhreDVFRzNWVXZEakpvcFFj?=
 =?utf-8?B?ZmNDSHU4Rjd4N1MxZFRsVFBoNHRqenB2WVVmVlYrSGZHenNSWmhzWFVFam9v?=
 =?utf-8?B?ZkptTENSZjNtNlN2MjdLSHVGNW94YkFIVlB1V3FkTXZMT29QS1RqbFpla1Nm?=
 =?utf-8?B?aEdLcGJMMFFjUmVHNVA3d3pMaVVrRUtrTGl4Z0FYSVpmUXJVbzB2MEFNRG1r?=
 =?utf-8?B?SzRoYmRuYUV0czBQcldjZ3NCUUI3aUYzMHd6b0tnci9iQlY4TFpqQjZSUmRj?=
 =?utf-8?Q?HkY3pJYo4yg726OPh5Dg8SpGn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4597932-f840-4cb0-ba1a-08db8c548e24
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:44:59.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32/yE7ybrFPZaCfDov0IV1UzG1V5OPLjKuXL3CFmXOcUDWxMhtP68u+Xw5j4vcKV1dsC3pZtuXUEA/1ySewDkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7842

On 24.07.2023 16:26, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The function parameters renamed in this patch are hiding a variable defined
> in an enclosing scope.
> 
> The following rename is made:
> - s/cfg/file/
> to distinguish from the variable 'cfg', which is hidden by the parameter inside
> the modified functions.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Somewhat hesitantly
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

