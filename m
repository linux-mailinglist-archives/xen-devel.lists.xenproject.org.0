Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8D5F7726
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 13:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417862.662599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogl7b-0003dH-7y; Fri, 07 Oct 2022 11:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417862.662599; Fri, 07 Oct 2022 11:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogl7b-0003ak-5I; Fri, 07 Oct 2022 11:02:27 +0000
Received: by outflank-mailman (input) for mailman id 417862;
 Fri, 07 Oct 2022 11:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nDAh=2I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogl7a-0003ac-2k
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 11:02:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2082.outbound.protection.outlook.com [40.107.105.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 860f91bd-462f-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 13:02:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7678.eurprd04.prod.outlook.com (2603:10a6:102:ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Fri, 7 Oct
 2022 11:02:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 11:02:22 +0000
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
X-Inumbo-ID: 860f91bd-462f-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAOVrewdzdkXpMBFcGvfU+cTkF6f3gwa26/28RwTDS84JAUhAvmqikcU8yYwMwuo6+trJojnHsGnsIZ42xDHooEVjR9RTy0xa7S2/ouo0hA3+vnAMXL93Jnha0tyHiBFcZRb6K3/TgGpxSH92SmH2eygbBja8YkGEEPxCx5XNLItCBok0BoAK/Elw9EHh8Y9EQi1c9S3d3ZFG1Z+82hrCIWGF4b/Zbr7VPlQWlmCiIaDCAnvwIiEKCvRx02QT9C2Ba9hJ1NkjAxX8W4YO+wPisDsB0AOwDFMdid2ceCVUH7XnrzWo3w9PvTYI4pifTL6vjLVPSNd7dTjOdRn0fd2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiBuyn4NPUAs1BQ1Eg2cbHLTCNedQAJJsympjtC/a04=;
 b=TdwxdxSu/+5i4jBZOM20vro3sqdPEqtNpNOHsR42KHI/NmvWXxuYAzy6/vzE3OEta1bcbHGVinBioOsPwYeIvtfNFNgA+Ga4+IDDGdqLhrae3zSsuiNUxv8/EnILJpE5ZvW04QJlBdxPUkkLXUQ2DsA0H6P9IbR3DUwb3dYTe9rdBzwGspO4O6jTw2HQxY0sGAiATVa8OCY3xU1uQ/Khy3DVywezvoNbvu9IXyPvT6KoGK01Mfy/2xlNnzTM+nVauc9AXE5C/e6g5YQDAb5oPN/fWaArzLpjPwsUdvVvTsjaB0BaqRltd6bzgAe1GHbqTWjTSiNwCOFOm0kN+C+nCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiBuyn4NPUAs1BQ1Eg2cbHLTCNedQAJJsympjtC/a04=;
 b=Yx8C6F9OKLEzRKcQIRSLJRX7RlgJv9JNpmM/iI+XRpcYOoCy/lm8duO3iNNzBniwFeSZ9t9JdpNnL+x6OGYx1yubB/fIruUcUIbAE81xs48pllshIP29T8vUMuW8/FnvPUvw0oOZjpf2zSVnxlJjxFM7Nf5qRa7XCJL4Z0od1UTc2AlGQ/1yGc92oiKiZNNx3XuyqqcQ8m+CzI1K48ToF+daArupW7xjboYevOksa5HptQ3n4tXEkse97xxoeHRK9NDBciiWdn05Bkj7vN3dkUuSjtysn2Nvnvd09CBcfW8VcdePDVrPs6oGPxOXL+aj1w+XDmnRgsi+MJ7YKaWt/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60eda03c-9e40-2a99-dfe5-7ba1407961ad@suse.com>
Date: Fri, 7 Oct 2022 13:02:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/3] process/release-technician-checklist: Explain how the
 banner in README is generated
To: Julien Grall <julien@xen.org>
Cc: Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-2-julien@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221007091341.58542-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: aad0379f-7a09-4a91-70ee-08daa85368b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQnMSFiqWh1Uc7NSuMZeOtEqxKR+CNznQuxM9h8Da1PPkWT/OweI+KVDLw55cvQ+A7Ht7dOCclIdwj9xkEiXjSYJVYAxv+i8nJH2zJF5+vUs6yRQfPKWNfaMEvJ/jEJxNOEQZyqxytuB4VHyWrNaO3Yi8+VG9+Iylzpm+X5DzeenSjRN1jDtaHCGrpV5nruT9D0Z9lEDkz5xd33bg+74ke+Xl/oxsdnfVpdEVXN/CDhLFXqVH5eVoWsE0e2LP/EMXauNeB6EvSkWtUIKkfyM5Zzz+MyrK2b90ex6pj9EUjJkr87e0KB4iSDum2xku2WmHKgzMCLIwdURahBoRseHPAN533lUy9cxVlCdUn487HluJmvt6iaOI30Hxs890iroLGtwnuL8WEp2gpbJps4Tlk3VDreezyaPyKB9aFbKtQra+aFAltW7rQdjMIg8/rZL7iEWgfn7q7LDbBdfKpET0zRuYrYp8ZMzNKK+X3VS5OzU1ajPCzwfCg1yYubUJECpOM4s5/x4bqfJ/nB1g59K6mOaMTR0HHar8WiGi9ZJWQdWwxb1hQnT/Cipibd7XT+rQLyWzJOVxkNTd/slOmDELDP89SnxgDporQQgAMy6J4/o3zqCp1cxyLjJ54TJY5ulKeqDslbqx0aTFJJ5o9A3Eb4941dJ6g9G+I4rsKItn8SERAg2q4do3Xu2fe7Oc2l9r+jix7a7tQQ10kAW7TC6Bdv/lhd7XkeZj0CIzW1dOvowjeKMoF7nLV+g0LpgKrNqOpL4+hDjsHX0onKrKVYCAVEYzMD/M12Sv0/EAgRZJlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(6916009)(478600001)(54906003)(31686004)(316002)(66476007)(66556008)(4326008)(66946007)(8676002)(2616005)(6512007)(26005)(8936002)(6506007)(4744005)(186003)(2906002)(41300700001)(53546011)(38100700002)(5660300002)(6486002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhGa3NFRjBWK0cybjBQOXNobWpReXhReU9QbDVrUHdWYW9TNUZmYnc5LzJE?=
 =?utf-8?B?L2xDTkhNamY1d1IvM1NlbGxJclp2dkdkQ0EyNy9idjNBL3N1UXIxc0U3Y3hX?=
 =?utf-8?B?VTUvdkw2MzZObkFuK04wd3N3ZnoycCttcERwUFhROHY0SFhqalVVYS9lUExF?=
 =?utf-8?B?NzJqZko0ZSsxRGp2UTAvVmNOakhmQ29pbVkrMGgwZU5uUG9HeVBMYWhnYjhl?=
 =?utf-8?B?ckxYWHBubzYzaEQwZDF0VUk1dWFwYzBlS3NvYTlpbWdUeGtqL05NYnhodGRG?=
 =?utf-8?B?TEx0Y0ZibFNuTG9Ic2lYaThBTFRaeXdzNGJUNzI2cDlLc0I3elBrTlBTNlpj?=
 =?utf-8?B?a2wxQVJwUEhtL2grbGJ3RzhydE94Y2Z1M3ZmbnJmUWtzYnYyczJINjJXWWlk?=
 =?utf-8?B?MXhTbUlKL0dDTzJ6YllSdUJlYkhKTnFCR05qem1DK1NjZVFkM28xOUdZVHNw?=
 =?utf-8?B?OWFOaEdSQU96UHMzRjh1VGlIdkFkaDVnZmtEdmY4ZnB5RE5uYVl3SEQwWWVo?=
 =?utf-8?B?anJQdTM3RlcwbGRkOVRGNmQzaG1BZjBqVVlTd3VrVjVHVC9pd3liRUNuZGRv?=
 =?utf-8?B?TUVzc2hhYWZUaVVIT0ZZNldpdGVTM1hremhzaE9IVXJLdzlnYi94dVQzWFlj?=
 =?utf-8?B?UVlqd2VidWpSQzVYNklndGhVTXg1T2N3dDlTQ0c1UW1aWXA5OURjZk9YTE4x?=
 =?utf-8?B?eTdhbHN2S3VZSGt1U3pwUW0wa2JKeG95Y1UvcjFRZWgvQ203d1cwaVBTZ0Ru?=
 =?utf-8?B?OVBIcmZiL3Vad0tXamRxMmEvZzVPdzBKYzdCUGI1UUhlRlE5MGF4S0lOejVk?=
 =?utf-8?B?T1J0Nm9jdDZ0ZnF5T2NPai9obW5OUmdnZ054YUVkZEI3aHROb3dlVGlnVnBT?=
 =?utf-8?B?Tnk1ZXFnMlVXR2tsZWQraTRlTGRDaDIzRjlhdXZFU1NwZWtyaWdJaHFmTTMx?=
 =?utf-8?B?Qk85T2hkc0tZYjMrdXM5MWkrc01YZUM3SFJCNEtKM2RETlBPYmRsdXJOTU5W?=
 =?utf-8?B?UGxKVEFtNXhldkdWVWZNZ1crTExBeWp0b3loMjVPMWtlNmRhdVdZaC9ZbG1E?=
 =?utf-8?B?UUhCcElnR21Kblcyb3hWU1NBdVc3TE96cndLb05JM2NYeXJKN0pialN1dzlZ?=
 =?utf-8?B?d0RzSzFoQmRxQ3NWeWh5aVBRNUhWWkJ4azBXREhHa0xVT1V3eGEvMlkyQ2FM?=
 =?utf-8?B?YWZvckw4VE81NEhaT3VBamM4UkRTWGFKNFk1SUlFb1VXbHNpVE1OYWJUNFVH?=
 =?utf-8?B?WWJMazJXQjA1L2lSdkp0dmFzSzVOMjVrUktuTE13YkVxRjYxbUhWNjJ2L1JT?=
 =?utf-8?B?U0QyZ2kyeXZta3QzN3k3bU1NVnd0OHM3YWVrWjlrUDhhNGxtaFkrZldGdVNp?=
 =?utf-8?B?RGNtbkZ3OVFrZ0dNMkFLRnpkTlZHM3RwNmRjelB2Ky9GOFhINnVjc05iT1h1?=
 =?utf-8?B?L251YmtaR1FHcmdCbG9TbndJclIzSFU3TjIvT0JKdWFSeEp0MTQwUW1IUTZQ?=
 =?utf-8?B?R2RXaDVCOVN5YnRXVkFvZUQ4QUxzRkF1UWxLNmZEdDFiOHFSRjUyOTNLMnh5?=
 =?utf-8?B?c0Z3bzhIRkJjd09qTDYremtZY2JlNGdiSFNkcVg1c0tTUmNtV2ZKcTB6bXlU?=
 =?utf-8?B?Y3NDdHgrdVhEZXFMeTBNNzBnaDAveUV5djNualBqTEUzSnM2QjFTUzRxQVJB?=
 =?utf-8?B?ejA1UVBJL09QWldOYUVFc3lIcnJuaXJqUVplRDZNSWdNQXZrN3c3dmhQL2ty?=
 =?utf-8?B?UXh2emdzaEFiU3FFY3VldkZOQmZpZEJJWVgzb1pCUEhrSUR3V2o2aThpc1dY?=
 =?utf-8?B?dldGanFNQWpTejd1b3ppNzNhaWZnc1RTcWl5bWhTZmJxQks1MktQMDhEOWxm?=
 =?utf-8?B?UXF6RWZYSDBhZ2lGMytDRGVKRlp5QUZEYWluYm13N1MyS1VpNEcyeDBrR3NI?=
 =?utf-8?B?MHZvVDg2THZrK3orZWZ4R2V0WDYzOXBnd3E2U2tIdkg1Z1BGNkRwZFEwWHN1?=
 =?utf-8?B?czJOSzJhRzZ4cmcyTkdSaTB3MGR6K01VS0VialVJZGZnYklSU0tGczZFM3JZ?=
 =?utf-8?B?VzYxSlRaS2h3ZXBMcHRGUHNYODhqczdBem5oZzJ3N1NKdzYybDFUcU1RNzJH?=
 =?utf-8?Q?iLHZ3S9gMRLkktDTmGaIX7Dth?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad0379f-7a09-4a91-70ee-08daa85368b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 11:02:22.2206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nFToRy2t07WTN+rpf6S78vvu56qPurrNdtt+rrWpEz3fwt9+ifbaf7q7ncVd4yFpGA1WwikdBprJKFbdOD1Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7678

On 07.10.2022 11:13, Julien Grall wrote:
> --- a/docs/process/release-technician-checklist.txt
> +++ b/docs/process/release-technician-checklist.txt
> @@ -49,6 +49,7 @@ t=RELEASE-$r
>  * consider bumping sonames of shlibs
>  
>  * change xen-unstable README (should say "Xen 4.5" in releases and on stable branches, "Xen 4.5-unstable" on unstable)

This line may also want updating, to include the 4.5-rc case as well.

Jan

> +*   The banner is generated using figlet
>  * change xen-unstable Config.mk
>  #   QEMU_UPSTREAM_REVISION,
>  #   QEMU_TRADITIONAL_REVISION


