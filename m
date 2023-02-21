Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F207269DE2A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 11:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498739.769630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQC3-0006O2-TD; Tue, 21 Feb 2023 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498739.769630; Tue, 21 Feb 2023 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQC3-0006Ko-Pt; Tue, 21 Feb 2023 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 498739;
 Tue, 21 Feb 2023 10:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQC2-0006Kh-NS
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 10:48:18 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe12::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 285cda27-b1d5-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 11:47:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 10:48:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:48:13 +0000
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
X-Inumbo-ID: 285cda27-b1d5-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzKvsouKzbGIm7Kd6Q8udDg0vI0qOxeE8JFlrhxhdRrWZ/Ht1/jAF+7kTYiOBlrT9PhmjeP5grOeDX6SlxQBlwRDfTewlVqkdFrWs3HgU0dIMQjX33w2RfsB9uY2hSdsj0Jky6oXjahlW7z6Cbm08+KEUuDkTBvLIxPgy6hPkhIDfVxh2zy++EEsg6kj8//F3iWtzbweJQpkJJYNyFhX7D66DpzWCY2D+4ZWYiHa33HZT/9w0rsXzztqpB+EJlghvGIcNm6ynnTdOY8y2+47gtVMCyd6wQdGHFb8tZ45P6LWYLiTQAjAZKiT8ShCp7Y4FXZ5HDZzBZnh8tM4YXh3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGmv4DRHb8hXct3Q1ksBy2nu+OTuIswsO82OERLJWCM=;
 b=cmjZtDKkFnTgnEm4hny8OwbcCZz4A3/AZ5GNS2WGlTIi8y6xpIAGWE8Vtk9bSn0JvlgDbqO4C+1bPnZJdixOTX1ZHGypUVG0gn68lwsx/Xra+bffFY20o9yaIdbMl7wNU2DLi2lYin6g87rI3wdXpmmK+VoGZc3m2ERQefeCPv4IzsBMCv46hlXXYNFqgBFtsC7i+6JOanOjf3IVqVDv6/aRI60aIJN9P+sKEzQwhL9C9UKumq628FthP5mO8gzyi5Ns8Dm/6KXnpTF+8VWnCHTI1G2cNt8v6RBlyy7rw87X634RYWy4C9ouAtok+4S39bvyklt//LXYbwk3MrAo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGmv4DRHb8hXct3Q1ksBy2nu+OTuIswsO82OERLJWCM=;
 b=dMJ3dyAzy16B68i8/AvdGUe/uqu5myE9Bk2KDv7izPlKKFaPI9XL9DYb0YHNgr+WS2uNbE+LbXymoHMBxDzo/HL4IyXBapTtEXk2e3oWlAFLIox8kcpg/Bd8KJgnLSMXMKxnHv6PE4bTJthWwSAISqmU3DDzlJErHbjuTFtRNqHv0BS4fJn2OW5brkoV+bhsrZuekjxfJvrFugMIF0UvsLPUCYzU7CpddTX4HIGc5PjYTXhJwgO/tsOmINWbRp9DVPLGaVQ1k5aqE5fTla9dEBpNWZ+ojqObEsPjPuFY8Il64hIi24EwAkTBMvUIsf4jURGAsQEYYx483wVHF0KVnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebaec178-2067-1ed0-ffa4-41bbc2c7ca6e@suse.com>
Date: Tue, 21 Feb 2023 11:48:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] x86/kexec: Simplify the relocation of
 compat_mode_gdt_desc
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
 <20230217174814.1006961-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217174814.1006961-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 045a0d93-af94-44be-7e90-08db13f92160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rFQvye7J9Nrc+Kglx8IUkPR4bj3jd7LORQOy64P18Gj9Il2gR6ehFBpO+V25ahejxklQFQEemXH5cV94N9bMXfAyDCPpqs/u3otVU7RDdL16W4nEIw59ircdxhMlh7Y6RR1U1zvmtiGY9V4h8kA0/3F7t+/+m/JwjBfH/R7f5Gh8Wnk2xIM4X5s0K2bBmZPOE9LnPm0otRVJuLT8T0X9iBp1IAs51PR1DbnsVkpdi115lJb0qT2Yigx0VPhhyqZvycZXnkgWsKBFtHpmZ8dHWwzH+nOePA2Qu7oxhNFItcQvuKPidH7/Ef4Bk8oN90+stqA/cmMc0WuBrpm/OsSgq6ljzkzJOCWF+f+UHPvbMtoUMm5M7LJWigaNjg1h1O7Fagv1wrKTFOze5EiC5zgMcw7LXLf9AE4x44rA/MK/OfGEaPRR+qPFPSYKpIaMy50rw6s88M0gbwdbTbnDm6Qqst5mGesw5/e4nHfHdCVLgMIYXu29Xwa4KvfkVHilDr6YL55tuGcwbFpySPRoWFofumJaSxixXPBltiNyQHHGV9tAI4KqNnzLO0zqdD9mhwdcXD0tZJNe5hq8YJYpCJtSEjzqZUXjbpWtnJtaTEIhMuUhFQWZRzd6wavF4OiBTis+eSDVcH8I5X0mXM23ZT3NFVcWgmIzZlhinY0fKp+XA1OtLXHllHkIE2wtSGjfWle9xPhOyPkWxnd9u+iXBu9eiRsfOyZ/ETaVt9MMUZdvso8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(5660300002)(41300700001)(8936002)(86362001)(31696002)(36756003)(2906002)(38100700002)(478600001)(6486002)(2616005)(53546011)(26005)(186003)(6512007)(31686004)(6506007)(4326008)(66946007)(316002)(66556008)(54906003)(66476007)(6916009)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WURST1JJK09qVVAyN3hzNlBsaW51aEsyMlpOUTQyYmtiWHM5VHFlR0FheTNh?=
 =?utf-8?B?VjY0aUduNm1wUC9jUHlJU05JVk5qWFlFZzhNM3hYWklLMHVoODNuMkNwMU1J?=
 =?utf-8?B?VGNZaVBEamgveG9UMHFjMnp5RjB6SlFXUWxUSWtDRVJ2bFgvbmhHN0tuMS95?=
 =?utf-8?B?cGZzbFlWdE1OZ2d4TmZKdXF1VzdNM0h3QUJ2ZmhFMjNoY0Q1QTA0T0t6eWdx?=
 =?utf-8?B?ZFZsZjZkd3RtbThxb09QRExRbUljRzA0aXozMFFna2dVS2lqaUFvTkMrQlJZ?=
 =?utf-8?B?VThZRUNXUnIrWTFvZEJDVzJzc21CdElxVHJrejJ0dWt6eGhPMGJPNWhFblZQ?=
 =?utf-8?B?S1hCbXZtVzhPZkRyRkhINlcxVmdEKzBQRTZCdjhwaU40RFVZOVJaWXc2ZnZq?=
 =?utf-8?B?TFdEWlN3alk2VDVKcEVtZlVCY3M2bER4UFk0Ny9tY2NEQnFDQ2Q1OUFCei9s?=
 =?utf-8?B?VnNYTTAvTXRBVkFtUmk4U1JYUW0xNVZJRFBvMWhaYmpZMVgzV2FxTWl5R05v?=
 =?utf-8?B?ZHpwbzZpRHYrTFY5QkVGQTJOSENxRitxTWcvUDgvS0FPcnF6cnRJdExuNGxk?=
 =?utf-8?B?UFVRc2hKVWplQXVjYkpNSFRwaU1uQVRLNHpadDg0c0JHUFdNQm8raEx6aGJn?=
 =?utf-8?B?Q0phaEJjSm5tYmxXY1I2eW1WbFc4WlpETVEwdU5QK1BmV1kvVXVLK0lpNGVR?=
 =?utf-8?B?aFU5emthYVdub2c5SVZkcWNUT1VwSVh6bGtYanFQZzZ5emFOQzhEV3BSemV1?=
 =?utf-8?B?QU9sNnZHM1hNd3JLVVlXZTd4eVdORTZFVnU3L1lEcndkZHc3MHRJcWpsMzli?=
 =?utf-8?B?U2tETGJKemszaHBOWGdqY3BsTEZsei9FTjVwWHFtODR2WkJ0NE1pcEhNZEFq?=
 =?utf-8?B?MHRkS2c0OEo0WTNCZDNwUDNab0JOTmVaVk9GVGtHM0wrRXdFYzVzVzR3R1hz?=
 =?utf-8?B?eWNjUkNtOGFXL3ovYlYxRjQzYXVsNWJkbk1OeDZhcUlTcllPUlQ0OEtSamlr?=
 =?utf-8?B?bkdzaS9ENzMrUGRyRzNTdmRLaCt5TVcvN1drZFcxcW9PT3haUzU0V0h1ck9F?=
 =?utf-8?B?RWpZNjhXcVRzeHkzWFc4UlNpSEw0VFRBVFZGMVNmQzQ0SE83NWE5dVFCKzNv?=
 =?utf-8?B?bGdwUFFRQndFM1EyV1hWMU1COUFnZEF5NndmRmdaek9lWlNWUXMzb1ROd3M3?=
 =?utf-8?B?a240bS85bG8vRnJHN0ZiVEI3UU14V1JUYXhpdEJjOWFneVY4c2dNYmRZL2hT?=
 =?utf-8?B?aUdpdW53UEtjbmhURHBDdXJBUkxTL3ZISnlVaEtxQnp1N2RRMVVDbWE0L3lz?=
 =?utf-8?B?UzF2eG5UK3BnWXBaeVVrUmhPejRIaTNWaGRvZTJwa25wWjF5eHlMKzZ4Mnly?=
 =?utf-8?B?ekRFRVVmdWhUOExSZE1UZHZJTlNvM3R4MWdDRUFzU2t2UngxMkx4a2p1QkVa?=
 =?utf-8?B?Vm9yVFFhWldhNGk5UWcrb2JaamFKUGc1eitKbWZoMUlwVUpvaGVJZDFnTVpl?=
 =?utf-8?B?M2lLR1pDRnEycUVwa3czYzZzT2NYUWVvOFNEUGdWUURtcXhoajY2R1RzSlNU?=
 =?utf-8?B?ZS9IRjE3dktuVVQwVkdkcDFGeHRZbFZ4YXFwbVE1Y3lXZ1FzZm9RZ1g0Z2tQ?=
 =?utf-8?B?a1ZQV3FtRzlXZWdMNnRIZW9WcnNicGNSVkwrdVRINXRyUVo4QlFVOW9DTUI2?=
 =?utf-8?B?dGFSL3ZyenVQTnpXQUl5TmFGQkRZaThZL01OQ0NJV2hpNmcxcHVFc1ltL0hw?=
 =?utf-8?B?aitIUGlpMWlReUwyMDZsQ3kwSjdjaGF5YlZtdU5MQ1daTDVGNUZROU5qZEVD?=
 =?utf-8?B?dUlLUkxBWm04bjZBWG8wVnFpbTl0T2FwOTVnNEJML053NGtYbVRLT0dtTlJ5?=
 =?utf-8?B?QzY5N0Z2RlRLWTY3ZnhoU3g5TERyM1lIL1JrYjcrL0dEcHgyODNlTWYrdys4?=
 =?utf-8?B?S3RFK21tNTVLSGpZUWlDRjl0Qy9FVGJFRWtkUEZsU1l0NC9jcTI2cWNOM0tQ?=
 =?utf-8?B?WWJqV3RVdmkrQmt4VE1iTFZLU3UyMWloU1dUYzMrL1cwNXEweHhXaWhuQytY?=
 =?utf-8?B?WFhkT2VvVU5XK3RFaFBJY2lkRVZiOGh0cytoSEVIaEVtM1A2SXZvS3FqMC80?=
 =?utf-8?Q?lr/ZIK1+UbsLyvhWhsFEZdAmj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045a0d93-af94-44be-7e90-08db13f92160
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:48:13.2063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F355/GfPZ6+zFSlZFjEMR58iabyRwZjcs+30x9b3ReJZO279frtNibDe6KxTa3d0lRr/PHbg2mlYMAu7rZMpkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581

On 17.02.2023 18:48, Andrew Cooper wrote:
> Assemble the GDT base relative to kexec_reloc, and simply add the identity map
> base address to relocate.
> 
> Adjust a stale comment, and drop the unused matching label.

Only kind of - the comment is referencing call_32_bit, and hence wasn't
really stale. And what was (and would remain to be) dead is call_64_bit.
May want slightly re-wording.

> @@ -81,9 +80,8 @@ ENTRY(kexec_reloc)
>          /* Setup IDT. */
>          lidt    compat_mode_idt(%rip)
>  
> -        /* Load compat GDT. */
> -        leaq    compat_mode_gdt(%rip), %rax
> -        movq    %rax, (compat_mode_gdt_desc + 2)(%rip)
> +        /* Relocate and load compat GDT. */
> +        add     %rdi, 2 + compat_mode_gdt_desc(%rip)
>          lgdt    compat_mode_gdt_desc(%rip)

Where's %rdi being populated for this? At kexec_reloc %rdi points at
the code page, but prior to calling relocate_pages the register is
overwritten (and the original value is lost). relocate_pages also
has normal C calling convention afaict; kind of as a result %rdi is
actually being clobbered there.

Jan

