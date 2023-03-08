Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBA6B0C62
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508074.782331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvY6-0007Ck-6Z; Wed, 08 Mar 2023 15:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508074.782331; Wed, 08 Mar 2023 15:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvY6-0007Aw-3D; Wed, 08 Mar 2023 15:17:50 +0000
Received: by outflank-mailman (input) for mailman id 508074;
 Wed, 08 Mar 2023 15:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZvY4-0007An-5s
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:17:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60d1c423-bdc4-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 16:17:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 15:17:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 15:17:43 +0000
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
X-Inumbo-ID: 60d1c423-bdc4-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcVtMfxsY8l56innMJ40rv3lgpDQUSv0CHGYFccfG9sGJEITW8LLm4etPogOwJQJ+hFPk22tILz80zq7JrRkztfhIi7qvj/bSWOraIsqzrf74192HFEk9L88EsliEzxzKXJ9saTb057uJ+pav0SwKTHnjqoAQaz8CB0bW6AX23vZZiziOUGEzdIArPJzbFi7bOJquZDqs9AMwhXzYtI6SoODpyHRgerius5Z3wr4Ad6iGjxh7V+Jx/JEQSMIEOeS3t1U+5ccVQgfpciryNMUFyqZ5Te+wUFMo/JVfwJ27Oskaqj06ReVBdRLY4MuKUM0ahrK/cniSmoGIBynOfGQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Peqce0YBxgb3a0iGcjoVV0llK5qKAJ6S6sIEcAzn1lc=;
 b=ExSu/O4DjZ2spkyaaUF/RmxV+STkedCl6YSJOSHjJeA2qT711b7A/9FVqz8N5JNuKnbWd7D6GGYG+uJBm81NqVAgF7HwtsIxm5uMMcZl4QSsAkIGYU4HglqegzTZ6kjg9tFn7R/pNiYo1Xl6n1W0cakbx9y9pB69/1yYOyf4hEzFLrx4ebgxh+D0+wbMpeTXdk0aavB6DJoIVYfsLlNrOYjD4d2M5+9iTmweuaXdFTxaBMG6K9QDoeas36FWk85mHTk4qm9N/AD79LuT9hcNKJOKhZMvWPsR0yupcY+tkOZCTo63uQx6T3nAu3V6gqp0DqzdfMOne0bEmPrCw9zaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Peqce0YBxgb3a0iGcjoVV0llK5qKAJ6S6sIEcAzn1lc=;
 b=YF2HEL3PAI8yyEMSlixSXromnSz1LUI3qng3LXJscC4DsvLw/DUh+3lMQcfybi4hkAOzNnPSZSwLuriq/8+OFhPYv97L29Lmcmi/iQFmF80+o5zxTqV5OCY8fqCwfA0HUV5KEcmnW4osqmO8EnX9aJbFwkuwGOgwtlrMfssxeufHwIk1zjwKDUsjsOZ+fQIc+whoJR/oBN8e7CaDsgGSO6PgIEEUrl5MlytWgi7z+9uGITUiEf9pfINxZZgb7AaZi7nBPMTrQm0XxJwEkgdXApTxeWuSRm9hKrz34mjWWWAuaZsh8MYj0UV92Gho1kmI9R3jMXrggQ9suxp9tu95Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e6a76f1-73c6-9a6e-3444-f3e1cb2d71dc@suse.com>
Date: Wed, 8 Mar 2023 16:17:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
 <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
 <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
 <94f5059a4e31ddd29141fa8fe5156b560575ab1e.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <94f5059a4e31ddd29141fa8fe5156b560575ab1e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 1326a5eb-243d-4b12-3d1d-08db1fe843ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVh9M1x1aSiY37pyaXoYtmnyEgV5Bpd8oIaN/Pn+delHZnfDYVFtOLd6xSgrm4o0dCeQBnS4EfO74/KFx5iFkIF5D7ROLesr1qSBtCXanWpCQy21kdNUHzURXBfM7EdkFDZqcvADjA4e9jZXja6QRC4UEw+VAcjfjh5lISsQJFeSDqO+c3dx9KuSE/xeFc1aOy7xrM1+N0sViTcP2GwtzDiTN3a40e4gPRE8ri9ZuiS5Nhja5ADzJj0MAI96xookR4MT9UuLtos3l66D7Ooab9s1vmbEsfuDS2fQLimG+EYoPsUi6ZYlmQnniXWsl+sqya9X+cTK+y0TWIiC2v5njDPcUwLGbKOYR2hPvb/gDiWv76jw6ptx3FOrZdPE+jZgIbB3/WIawfD9esCeqt3uHaq+c0Q/pnaKI5QIQLyIXJZQEeucRkgyzTpy8Pb9MFfuH1WD8miTM+dL+cnAhr2WdQK+rZRJWa5SK6xEdpkwwnyiF+4dcVEZll6jMko9kXDCHZGrcZeEbCAOihzenY3HRa2Lw5ilqshtD83f0twNetW9fzCguxB/rNXoJBwTHEBg7QLFUzU1LdEWWK1vGPFXzboviwX/PP6vbCyMI+UG1Qsbcx4I5cVHlzMQcXFNP2uujjtKTh473a1K73PFPjBktU6mbsNfzh/EbDY7EmdZJrmzNPDR4RWTE54IdkkHBPw04ypT9VtWF7s/BHi3x0Lt749vPLv+n/0h4orXXUpFfa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(31686004)(2906002)(5660300002)(8936002)(41300700001)(31696002)(66556008)(4326008)(83380400001)(66476007)(66946007)(8676002)(6916009)(316002)(54906003)(6486002)(6506007)(478600001)(53546011)(6512007)(2616005)(26005)(36756003)(186003)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUcxY1lwRGVCZFJ2VDhkV3d2eU5iczF6bUdFMzkyOXhocFZlbUZLdWF5bzgy?=
 =?utf-8?B?YWdkeGRQejcxMWdNNXZ0KzhMcENabmVQSlhRNlpXYXh4MmZ5STlLbTJKWCtz?=
 =?utf-8?B?Q3JUOGg5ZDdwR1lTY2FPYVNyQ2xhT3NvcVVGVXpNQUtNaVlwdnlkWTdxU3Rt?=
 =?utf-8?B?cWpvbG8wSGRJZjZBVktCUEoxN2Q2VHNyREoyRVpxdkZtRmZxaWlzczFUU1VI?=
 =?utf-8?B?VUZnNms4Ym9EM0lUVXI1NW5zM0RVckhUV0pSZWh1dHVIaVpuQ1BYaVFOaFMr?=
 =?utf-8?B?NEYyRkd1NWNVVzRad3hybUJrTytXR29VdVZMMllCclFLeXRtakt3cEZvcytP?=
 =?utf-8?B?TTFZUklINFNvanBsMk1lNGlVb2pLQXk2UzNycnp1eGlyZ0RWOGdwWEJOc3da?=
 =?utf-8?B?U3RNV2FCQ0ZRNTRYaTdZU0dNTHZibjhTQWNweDBuSDQvTVEvbHdMZmJta25T?=
 =?utf-8?B?SjU0NytTdC9xMVZnZXZiMVB6V202VFFwSUtnWGRIN3FITlRmS0RQTWkrbWxu?=
 =?utf-8?B?Ulk2K05IbGFWa1REUHJ0cFc5aFZVeEVHYzNiNmJHV2xZeXF6alNsWElOck9V?=
 =?utf-8?B?dW5FUWsvSWFDTWZneEFBeXZrMExETnNmQy9SQmhHK05wREVSVlVITFFXdmhN?=
 =?utf-8?B?NnF6UDNHbExocDR5YitsN2I4NGw4czJwUHg5aUNHRVQ1UGxNcjhIRlkzSG1V?=
 =?utf-8?B?Z1NkQU5mdy9FbWRXSkMvblpNR1hvMVhET0syZ0VCM0NnbXkxR3lRbGxrYmtZ?=
 =?utf-8?B?a0s3M2pPWVRwOGxFTzByVm04Vy9rd1RmZ1BkeVF5RFMvdkpCNWg1YnV4UDZW?=
 =?utf-8?B?aGFnZTNVTG5Cd3NabVZWRTRTemdKckJIWXhhSDM5SmM4bklKNk9HYzZ3VXU5?=
 =?utf-8?B?YVFqUnZ1MlJTamZXOXNHd3FmN0d4d1haMjZuZjlIZzgwVm5TQXNQNGw1RnRt?=
 =?utf-8?B?N2Vub2Nobm9jSmVMZzVjUTdKSi9VMDBZbWdKbUZUaXl4OEJQQ3kyakJUaFU1?=
 =?utf-8?B?b2wwUlFsd00xcmN2SFA2ZzlUdzNKNjZheHllY05EclFieXkyNGlMMkJxZitZ?=
 =?utf-8?B?L01jQ3ZRdVZKdWNSeldKWHNpN3lybFBzNCtnNjNnZzBKK3FlWVAwNnl6Zlo2?=
 =?utf-8?B?cFYzMTBpVFFRUkRJdlNrTkMycnN4eHpkaTMzQkQwVTRwci9wS1VnZmFvektu?=
 =?utf-8?B?Q200VnIybjZMcXpEdG5rdDVXZkFpQWVCQzhrOTc4a28xajlNdHVmcjFLTWxu?=
 =?utf-8?B?RDVBQ1owRjJwZHZmM01XVmVrMG80eHJveUJxQ2ZiSitHdmo4My8rcklxQWhT?=
 =?utf-8?B?TlhBMityekx3azA3TVdGVjN2N1VVWFNTTmtUVTJ4REpTeVRSVC83U0JZOEFq?=
 =?utf-8?B?ZmlxbklkbmptdU1SNUxCVCsrbWJCUEw5TjhUMm5wamdWYVM2TCtoWms4cDg0?=
 =?utf-8?B?SzRwejF5akxZRERsTTJNOE5vRE1zNmtnSFF6NWpQUVE2a1BoQnhDeFZyYm1s?=
 =?utf-8?B?cTdQQnFDMzUwSG1mUFhrd1FmbnhKdzFraXZMcGNRay9yWGs4SkFicVdFMkc4?=
 =?utf-8?B?UU1JTXZSZ3Qxd0tJaUI4bmU4UE1QVkRxUVJlMWFSVWFXLzA1ejJjdDRRNVRm?=
 =?utf-8?B?aUNrMjJsSzBVWVZaL2dMYzhleldDbkg4bGlyTXBJcjZaakhTU0FoVTZpclV2?=
 =?utf-8?B?dndpTkJpblE3dXc4Rm1OMUxZRW0zcTNMelNaRWFJREl2amRqM1lOVi8vOHdy?=
 =?utf-8?B?M2lTeldRRVdHNGM2UG9iSEY2ZFdxazZEQkk1Q0ZYNHhrN3d1ZzJWZ044UGhq?=
 =?utf-8?B?VGkvWlJ1Njc5QlNuWCtjWFFmQnVYaEllVzJkRlplVzk3MERpWG1vYmlqbXJj?=
 =?utf-8?B?bVZPVWhsa21qd2MrZ1ZWdW1lOHJKMkVTcXlRQlN6SlJIelZHYUdSKzRmRzFP?=
 =?utf-8?B?VG85YzBSeXBuK1dKZGRlQzA1cWJzb3VtK1N5eWJ6ckVtYUxLbU4zZTF5cG5o?=
 =?utf-8?B?ZUw4aTdmM2JaNUlPZUt2MTRRV3ZOTHVta0U1WmpHRjNNZGplVU5LNW1tWjlP?=
 =?utf-8?B?OUxnOFBMRkdOZFg3QlpjMk80RnQ3TmRMSkozUDlZK0NZV0Qrcjd1c2F5R2pp?=
 =?utf-8?Q?nspsLa1olUI+ASVkrQtkXP0Cq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1326a5eb-243d-4b12-3d1d-08db1fe843ab
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:17:43.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7iuTTmY6aS35ENqLiOj90A+mvbt/ZWpXTMR25ldPq9Kmo8nGWsnM86go/bkODYLt3GZw8X/gHCIBRs1jz2NuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On 08.03.2023 15:54, Oleksii wrote:
> Actually after my latest experiments it looks that we don't need to
> calculate that things at all because for RISC-V it is  used everywhere
> PC-relative access.
> Thereby it doesn't matter what is an address where Xen was loaded and
> linker address.
> Right now I found only to cases which aren't PC-relative.
> Please look at the patch below:
> diff --git a/xen/arch/riscv/include/asm/config.h
> b/xen/arch/riscv/include/asm/config.h
> index 763a922a04..e1ba613d81 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -39,7 +39,7 @@
>    name:
>  #endif
>  
> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
> +#define XEN_VIRT_START  _AT(UL, 0x00200000)

I think this wants to remain the address where Xen actually runs, and
where Xen is linked to. This ...

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -123,8 +123,14 @@ int do_bug_frame(const struct cpu_user_regs *regs,
> vaddr_t pc)
>      const char *filename, *predicate;
>      int lineno;
>  
> -    static const struct bug_frame* bug_frames[] = {
> -        &__start_bug_frames[0],
> +    /*
> +     * force fill bug_frames array using auipc/addi instructions to
> +     * make addresses in bug_frames PC-relative.
> +    */
> +    const struct bug_frame * force = (const struct bug_frame *)
> &__start_bug_frames[0];
> +
> +    const struct bug_frame* bug_frames[] = {
> +        force,
>          &__stop_bug_frames_0[0],
>          &__stop_bug_frames_1[0],
>          &__stop_bug_frames_2[0],

... array would better be static anyway, and ...

> The changes related to <asm/config.h> are  only to make linker_addr !=
> load_address. So:
> 1. The first issue with cpu0_boot_stack in the head.S file. When we do:
>       la      sp, cpu0_boot_stack
>    Pseudo-instruction la will be transformed to auipc/addi OR
> auipc/l{w|d}.
>    It depends on an option: nopic, pic. [1]
>    
>    So the solution can be the following:
>    * As it is done in the patch: add to the start of head.S ".option  
> nopic"
>    * Change la to lla thereby it will be always generated "auipc/addi"
> to get an address of variable.
> 
> 2. The second issue is with the code in do_bug_frame() with bug_frames
> array:
>    const struct bug_frame* bug_frames[] = {
>         &__start_bug_frames[0],
>         &__stop_bug_frames_0[0],
>         &__stop_bug_frames_1[0],
>         &__stop_bug_frames_2[0],
>         &__stop_bug_frames_3[0],
>     };
>   In this case &{start,stop}bug_frames{,{0-3}} will be changed to     
> linker address. In case of when load_addr is 0x80200000 and linker_addr
> is 0x00200000 then &{start,stop}bug_frames{,{0-3}} will be equal to
> 0x00200000 + X.

... this "solution" to a problem you introduce by wrongly modifying
the linked address would then need applying to any other similar code
pattern found in Xen. Which is (I hope obviously) not a viable route.
Instead code running before address translation is enable needs to be
extra careful in what code and data items it accesses, and how.

Jan

>     To force using addresses related to load_addr  in bug_frames, it is
> necessary to declare a variable with getting an address of
> &__{start,stop}bug_frames{,{0-3}} thereby it will generate the code:
>         2002c2:       00001797                auipc   a5,0x1
> 	2002c6:       d3e78793                addi    a5,a5,-706 #
> 201000 <__start_bug_frames>
> 	2002ca:       faf43c23                sd      a5,-72(s0)
> 	2002ce:       00001797                auipc   a5,0x1
> 	2002d2:       d3a78793                addi    a5,a5,-710 #
> 201008 <__stop_bug_frames_


