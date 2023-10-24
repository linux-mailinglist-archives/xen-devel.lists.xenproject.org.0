Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE397D4898
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621707.968440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBuj-00026P-S8; Tue, 24 Oct 2023 07:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621707.968440; Tue, 24 Oct 2023 07:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBuj-00023y-PH; Tue, 24 Oct 2023 07:33:21 +0000
Received: by outflank-mailman (input) for mailman id 621707;
 Tue, 24 Oct 2023 07:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvBui-00023s-G4
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:33:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 998f63c5-723f-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 09:33:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8745.eurprd04.prod.outlook.com (2603:10a6:20b:43e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 07:32:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 07:32:48 +0000
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
X-Inumbo-ID: 998f63c5-723f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1jDnMNfRpsSkhITwz65E1nRrpHpbJOdJ8mr5OgySeTqpMDnNA0BthQ4GVREIC+kOTyDbB6mMFXpfmIX+r+dYA5Sa94n5aHujYtdhjDjRmRaX9ZlvukWgVpVH0DvXVQs3+5AlTq2LYmAmMaXAGzAD+XBK/LGe3bVAKMV7bK6EaMCQBekSvN35FlXd6bBg3ISiL/c3nNxNqlLwJMtWa7hmCgVXGe7TsBuxDi6EgGiwVj1Wm4rJ+0z/kB77OwvYRengD3mjcEPXUmg2WRAPRqAWu7YyxXUqgjYZqThIzGL+7uzyH9oTBtOBfbUV2xyg2qh/0QLqGkiAgls3m8PY2TSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoE+HlxyflzzrXrf020OIhd/O5HLKXz2JsuOu1NaoJk=;
 b=bpX1Dw46aJZI77C6tr6mJnKapjCspCWs0hLLD6UXsp2Vz2ZD8cMTu9B/w9K9zDcHjrk9LhfWcf2Y200rbUhlXHwWGMl5QgRppkl9ct0MOOUJxdmD7IdjxO3F8OZ+rNlujmm/EtedvxpQTjXk7xsc6cuGCKuUAbuPgtIWRFp11j368cf/KIXT7Sqv35lm4HdvHTxMpa4ax/80bIzd5EVJkQ5t3fmSS98HzVE6RH0zIwlHS15Dl0l4RnUmi4XqBsCOn1BkvST78WQ8U+2TNS8Mh2W5ks/jZzGzv+BP2ZzAnNGJNcankPtfAs0Z2zihHAxw+LhKv8rAa8ktUMuRZJVxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoE+HlxyflzzrXrf020OIhd/O5HLKXz2JsuOu1NaoJk=;
 b=C+DVOgsI5B1cg7OfElGGa0pE62eutUtLgs+scpgR8T9pE2/Dy/Y1NISmTgYx3C6+pJuYTMAFN+xUb4iEdRjs8tszEgBX+ZjM7otwxy2pJaxRgmfGNeL12VtEd68peMF/3VrXZsqfKFlpxpKityzUuGYL4nxFEhQZ2CL9L2wM62IS3I3QdIUgaOMQOSDaBD2Fq4PnnMq+pon5enXdA4dHpF8m2/eGRQVQc+YjqrMvT1TevicUb+vPynzl2+JSiz/aCNTxO9DAoEu/mqRFh7nD23IXUl9Xdf2QWjkMhUISdYEbjG7bvUY99Q5RfRxnwN5U+paDte5E8Lcier7yg6AF5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2aaa0978-e28f-4151-f4ba-f2628f6d4677@suse.com>
Date: Tue, 24 Oct 2023 09:32:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 2/8] x86: add deviations for variables
 only used in asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 216263fb-239b-4472-1aa0-08dbd4636bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ptpG2VvEZxL9HiRpH63wZYM6UXPDhDyxtU/Qooe6/tKPxEw/IXllahXJm/52Y0bNEYsaEg3DTkpExGr3GCuUMAQ5DuXkvtOsIpVRH6uGp3EPGKwH5CLcMgwBparkn4DaOYs0xy/+fq4+O5/6IT7F1elgVFdQJEeLZSAo75GlVHIwmvRKPZpET5rqm1y6A7QXPkyT/l/TxoUMUmVuWTLWtHPN1yPNTMXfuSl0CnfK5mXB3F0bBJmVz1JR1v/AnLSvUjH57SZmI4iE/Krmtuq1zm0a03Rv0dkYcyrW3Toi/3cQoDxZhBqHdu74NQkwHpDqtOLzXgedz4R21QzVlv/rnFbKDJzPtAIAYElqVFhhsY+L60knS98bzHXZChPPQcQEHU5dgYK0v7T6hOQQFOlwAIps4GYwyrbJ8iuL3kX6GzlfQZGddzcCOQZUytAhGB7E76+ZkFnt97ohmmyHJXPfMZ8T12D04BgdR08lhXk1ixoFBrCrX+tl/oSfRxJsCtVTXMCPL2zBCNHGMHJh4BxyvUJ++l20csTbqTq6G8SwUgQXshhFOze9nHOdcFhk4Eb5NJaPFuON+uOQqauZVdqsqLrup9KpRD2sMnYoZP949sQ4+JFQPHu+wzdrG4mrXnzj7+AOfxF19NbTfntQ3LAgMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(31686004)(36756003)(66946007)(66556008)(316002)(66476007)(6916009)(38100700002)(31696002)(86362001)(53546011)(2616005)(6512007)(26005)(6506007)(6666004)(6486002)(2906002)(8936002)(478600001)(7416002)(5660300002)(41300700001)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBwQzc5Q3RaUXJUZFJ1dEpnTTJVQ0xuMG4vSVFBOGJ4YWI3RXpMTGlYMUxH?=
 =?utf-8?B?dWI0Qy9Eb3lmUDB1ejVQbE1sYWZad3ZINGUvSmplYkFaOVhLYUhqNk5HSE9H?=
 =?utf-8?B?WGFSZ0ROVklKd3BYYzYxNzllWndvVFAvNEZYemVWQ2hNd3F2ejV5T2pDc29w?=
 =?utf-8?B?blFCUFBvcEkyYk81VklUeXdrSnBWc1UzSzl6WVJ1VVdTSmVwYnBETExuZUxU?=
 =?utf-8?B?b000aWR4dUxnc1dJR04xUnBYOTFuUGtpbk9xTjJrdnNMV2VMc3hmQ2t5di9v?=
 =?utf-8?B?aG4yZDhZd1RmMUM2MnY1Qll0Mi91V1ppMWQ5cXZtaWlycEYvcmxTa3ZUM2RY?=
 =?utf-8?B?YjcxQi8wTHVVT3g5aXhqeEVURFZFcEE4eEdGVSsyNWxIT2M4dm95bWhtSE1h?=
 =?utf-8?B?TExRSjhkMlF6VVNBMVZXZnJXektWcllaQ3JBZVY1TVFYNmhnT1JjazNrTE5u?=
 =?utf-8?B?QllVQjhEaGllcXptVE1HWVpLVkpUWDlYN05Ed2JGb0d6dXpKOU9LYTliUHZz?=
 =?utf-8?B?S3I5MjhuSTFnY2FaRXExV2NobHlySU9rR05VR3VOcm9Ud0R1OStveEJXSlZX?=
 =?utf-8?B?R1dYTkppWGJqVHV1SW9XbFdldFVORGk0MERqN3RmR20wMUFVRlJ3Y05tRWpJ?=
 =?utf-8?B?Z3ljNFBucEo3T3hDQWJJa3ZKZXJDZUNmOVJGdjZDUVNST0d1azNDNWdpVC9N?=
 =?utf-8?B?U0ZlcjlWTnl0Z3E2Y0c1SmVwalVwNkR5SFZyeWg3Uk4reDMrOGVYd0E4a1No?=
 =?utf-8?B?RHY2QlV3czRPSC94VmhGdXNkaE92MjdNazVjQXIwWjQ1UVdhckNtdnBBTXI0?=
 =?utf-8?B?TGxVNy9HeUR2d3dORHgwOC81a2dXTVZKaXdhVkl0TlB5VkZXNWpNaEdEcnVx?=
 =?utf-8?B?aWYzYzFRNnlTN2t4OGFCVDl4K3I4aHA1ZFY1MTREWVRBY0IwaldhL2RvYzBP?=
 =?utf-8?B?czhQSEhrU3dMdVNJTUxTYnRGOWpnV0VFZ1ZQckZmQWxpUEI5d1pWODBXU1VJ?=
 =?utf-8?B?cmdEQUN1Ry9oYlU0SzJNMWFZdUUzNmZ4TjhNZWtQSDhUWmhyVmJHTDd0WS9L?=
 =?utf-8?B?RlhYL3dHWnJ4K0pGd3Z5ZWNkOVV5cTVYeGhMM1R4bVh5VWZwSWdHTXlCNWh0?=
 =?utf-8?B?djJ6SUgzTW9BSVRVQTlKZ1EwUzY5cGsxVzU3L3lEWFZFSm1aOExmb092OFhL?=
 =?utf-8?B?c245QTBrRm92MHVVU0lZZGlqcXJwdkxKZ0VqL2wyZlpNanlnam9DVGhOZXFm?=
 =?utf-8?B?anJqdDdkU2pqU0NoUTdQRm0xZlVuNVZQdW4rQldGSHg0K1BvRFpJejNPeWl6?=
 =?utf-8?B?VndaTW9KeGlOdGV2L3BXOUdZbXlXTEh0RG9tRmdSMDVTNVIxbXM2KzZ4bnhl?=
 =?utf-8?B?YmI3aFFzRGRxUUhjVEFyOUt2R1ByaXFBaUE2MU1pVGtkNTVpdVZsbWd3TG0v?=
 =?utf-8?B?ZmcxY05FRTFmMEdXa3ZNZFc5ZEt4alBVRzVFb1FkbTFqZXo4R3VITUpZbzZ3?=
 =?utf-8?B?OEdhdldmMURpR1ZxOC92S1lOZ3JOT0R2VnRPbWdWTnUwai9NaDlKcXRuUnpN?=
 =?utf-8?B?bUw4UWQ2VE55dzBzZjFQYTV3c2VQMEhEN3pKSlRUWUJMcnZDVlphMktNY3hU?=
 =?utf-8?B?STBQbm9zVFhJOGU3bDl0UmxkaUVNQXdFanVyMjI5dyszalIzUzM4bHFUQUZY?=
 =?utf-8?B?c0JGVnBGbXcxVGJtcDZ1eDV1UjZRWUtTM0VwT1JBbk9vNlZOZWtQd0xkTm1q?=
 =?utf-8?B?MUFWWFE4eU9KVUxvQUNrUmNmRHNtUlJSRy9iK0I1c2QrL3pLck1ETFNhOUdp?=
 =?utf-8?B?cG85djFNTVhBWFI4U25PSzBsSzVndVo3VnRkenk1b1ZOTkNjbzNLNjRQdmxG?=
 =?utf-8?B?UzRlZ1BjYXVwdnBTL05kL3FmbGVCRHYyV2FjNlZQdGIzVVNiejRnVFhPZi9L?=
 =?utf-8?B?SVNkYzlkZi93U1dEVnVYZVFNVG1BcXNmTlhod2pTR2R3WVJJUUVhKytSUFp6?=
 =?utf-8?B?VU5WYWhMUjljMEdjZU14MzdPcXNralVGdEtNZ2xkcnBLYW42ZXNLWWpEWjgx?=
 =?utf-8?B?RmxhOXNxcE91MW45Yy8vZmtLS0d3VGVBdEpLYzl2cWhRamxiL0phSE1aaDNv?=
 =?utf-8?Q?jz+w3CrK9Fia29kOdvAVv/GBw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216263fb-239b-4472-1aa0-08dbd4636bdf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 07:32:48.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGWQsexc9LFrpXqKKkLbT8TYbkdGacNRfNOl9ltxNt1mdS6Cb6G1YbCgfxqJqLpCYZcteZd5xSXYF/YuPNKyCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8745

On 23.10.2023 11:56, Nicola Vetrini wrote:
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>   * gets set up by the containing function.
>   */
>  #ifdef CONFIG_FRAME_POINTER
> +/* SAF-1-safe */
>  register unsigned long current_stack_pointer asm("rsp");
>  # define ASM_CALL_CONSTRAINT , "+r" (current_stack_pointer)
>  #else

SAF-1-safe is about symbols "used only by asm modules". This doesn't apply
to the declaration here.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -75,6 +75,7 @@ static bool __initdata opt_invpcid = true;
>  boolean_param("invpcid", opt_invpcid);
>  bool __read_mostly use_invpcid;
>  
> +/* SAF-1-safe Only used in asm code and within this source file */
>  unsigned long __read_mostly cr4_pv32_mask;
>  
>  /* **** Linux config option: propagated to domain0. */
> @@ -147,12 +148,13 @@ cpumask_t __read_mostly cpu_present_map;
>  unsigned long __read_mostly xen_phys_start;
>  
>  char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
> -    cpu0_stack[STACK_SIZE];
> +    cpu0_stack[STACK_SIZE]; /* SAF-1-safe Only used in asm code and below */

Wasn't it that such comments need to live on the earlier line?

Jan

