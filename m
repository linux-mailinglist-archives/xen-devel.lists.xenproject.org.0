Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6060B568
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 20:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429330.680290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on27R-0003S2-Df; Mon, 24 Oct 2022 18:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429330.680290; Mon, 24 Oct 2022 18:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on27R-0003P7-Aw; Mon, 24 Oct 2022 18:24:13 +0000
Received: by outflank-mailman (input) for mailman id 429330;
 Mon, 24 Oct 2022 18:24:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on27P-0003Ms-SQ
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 18:24:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d4ed4cf-53c9-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 20:24:11 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25; Mon, 24 Oct
 2022 18:24:06 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 18:24:06 +0000
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
X-Inumbo-ID: 0d4ed4cf-53c9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7G2iDyQE2kqLJExg2Gy5UHAStagd/ciqRvx2s9diXInK/fuWdDzyKrdAf6tPBVzSYzo0MsD/6kRFRHHNuzq97v6jvyC0Ml/F4cJUv8MnlZ87SeplIj/JyMdylEjEfzZjQYE1IGl2qrlBqZ2fN/V/c/pcIFiIvJ2ElFb4azKirRmo6AfPj1cCJ1OD8dHq233+eJlIDCbTGlic/kZN0RJU8Dyc2HuOu+ObBFFmukwXsGvV9X7tp5sHfRy65XuFexIu21V8e2iKhhA7y5ctLpHIPQfoGdyL4dikgHAKIr6MYzQoCKI4l7f9WOuBYY3Re5IwLsyb7nvmFvEi/qkKSMoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeJ/sUw4e5ZI0zFYwZA414Hze1AbzQ3gOj4SPGbq2Y8=;
 b=kq+Xs9YSfqxQm8b/kz1iIgjMBnmxoaPocI4S2jiqBLMfejTGa5K/U3YuCVz6cf2aM0NmG1b9dTiDV3J04mgzX6sR37YaO3RqmPbDy+Uwqj6VU+JwY7XzJAm7m1OluK+u6LojtQhiAv0mMH2SgJvNKOq9HaD8n3RyXdsdY1+rb6vM0qeyBvlHQafkSw64ax4hSGwmqP9pe2k3VaVWHH/a7vuq3F1/1vynoMZSHRS7j+OxebFYhFWtihNRJpTGfMXx+spNESYFlFeBtYLD6a5FscTQaMvmxit1dM6ROdK06wRuL6TCKVRJKxRdr2+ppGgv7Qdt5/1DA03PdyqgsaDT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeJ/sUw4e5ZI0zFYwZA414Hze1AbzQ3gOj4SPGbq2Y8=;
 b=SyWXKUHKojN5IN1jUM4RX3+lwcm0p8e4vXz6ccM+x6aqjJcvKtxMuV8FYteQcvkGCE4biL/E5p3IA7jB05Ibddj1g8EeE6FrYeXSMgxA6bqDUXXTt65P2DyMNZWvEudgVucmhUAXrM8iKW5NVxtXYAmTDMXD/JggsMp8sHSPKvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a31a753a-2e2f-8191-7d48-af96d9bd43b0@amd.com>
Date: Mon, 24 Oct 2022 19:24:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 01/12] Arm: GICv3: Sysreg emulation is applicable
 for Aarch64 only
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michalo@amd.com
References: <20221024181917.60416-1-ayankuma@amd.com>
 <20221024181917.60416-2-ayankuma@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221024181917.60416-2-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: bd311988-895e-4247-59fd-08dab5ecefae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l/e/ZNwuqHojPyhU/gWWQ0aFwN22eHqLs8d9r2CrKkkx8CfxmgY3sJfvH5vGs90uYjQgmDst836L+dvglLG9WfLTulmRyFwZ+Ojhm/qcrk3w/tb9p7ai0bllym6M1O40540oIdxRg/tr1fhqEVZGpJ2uleVu+SCCD63McUF0J8QjLH+ZP+rkeHHxSi68z5RlzpvOszw5g4iDdXSgfgD6xN0hGxQBvALRRVZkpz4TMCC0Bjx8pkvp2XOTvt83ClUfGoz0kDwxuTf2UPOVX0zsIIBAI6AqTkxy3kn/obm3XttrubD26m/LNBWONaLbq5KLKFI01chg1noaNiRX/0TuGaZKxVeCgApuDSBjcRHna4G69WDfkTYtznWCnIQ2PM1HqdA4fRZVQqUR3B5W7UxaPtcjHiDDroK+e/a/mPrbncuaVw2ccCW96TQcXTzrfvd5KvGRuKDHl5gAeJTQG2xWuBlQ/zF735H1CAG0/9GmI7FMb9vfWNVRzgFrvjgsZDaooZ5UDRO9dxZ6+iv9K5732X2hHuMt1CVOQ/6DzsRj8L9DRnusKdPgoLBQzuSEIMnvkn9/mLdhTtALjYNo8+Y/tLkbRr218IMNpnuWIPgWJNSo9vgHqU7IWgprKMdPI9FXkI43Ew2VJX+1SW8tR7W4Mr9q3DyID4qz6RutEcQCuZP/pnPeecwqYyfDtidYcaEBp6hyP4oTH4LB/D8mhMAj9Hddv4/M6EilRJq0pb84LxzsXL5Lx2x84ylMXu/fq40rIJkISDGL8M6F5aSrx97RYHjDSURcpNeKvP6Hz4yg7Ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(53546011)(31686004)(4326008)(6486002)(5660300002)(8676002)(186003)(6512007)(478600001)(26005)(38100700002)(2906002)(36756003)(2616005)(8936002)(316002)(6506007)(31696002)(41300700001)(66556008)(6666004)(6916009)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVB6T3M3TlRIRnVqamdLNkV5enB6RUUzSWtrR2hLaTIxVHFPSEpnUXdCWFFn?=
 =?utf-8?B?cDlaNlVsZHBkcmFYNWhMSnJITWs5RXcrNk91OFZxVnpIcER3RU56a0d5MVhW?=
 =?utf-8?B?bkVTNmplUVhhQllILzFDbDg4NDBhcTBNQjhSOWMvemltNnhXRHNUSjVHSC9H?=
 =?utf-8?B?ODdzNmpBUlcwK0JpU2NqSzZEWkk2ekg0T1IrM3VqUlhSdlFMTVNPelVMSXpG?=
 =?utf-8?B?aFduMHlRWWk3SWFycDRxaHV0b3lmWEttUVBRQUNZTFIvTEY4Y1JTLzFncW5X?=
 =?utf-8?B?bnE5T1pZeGhmdlhCaWQ1RnRIeEpXWFFqZDlJQm9iN2ZsK1E1TEt2UVZneXdh?=
 =?utf-8?B?Mm5PYWtnOVR4WktNVDJ5Y2xKa2tWTnQvdUVYbm91T1g1NVZFZU5BelA4Nk9H?=
 =?utf-8?B?cm82ZlFFWkhIV2owSHFGbng2K2wwQjU4YnhDR1NWTWg1ZjhybHRWOE1iOWt0?=
 =?utf-8?B?K1l3NmpzY0h6MFQ4UUtLN29iMHNXSmNQNnRrT2JzTVJiZG45QW95ay91ejQw?=
 =?utf-8?B?dzV0UzhLUUhkd0xhTStkRVp6RU5HQ3k0WVFOM20xOEJpZVZoR0Q1dnRuT1I1?=
 =?utf-8?B?SzdVeWM5R0d5REtXSU1hR2N3STY3OUtSSWJRZlJTRkhuOUxycHhnSXpXN0Mr?=
 =?utf-8?B?OHkrRVpHZGlIeitvbzc2Z08rQmZhWXR5dnlQdFc2YjN2MkczQTBwYzIyOGtz?=
 =?utf-8?B?Q0VXSmRPM0RkaW16bmY0MDd3VDJDM0QwVDZLWkh6VlBkbzJLWDl2UkVndW0y?=
 =?utf-8?B?YnZTRnEzRnV0U3U0SE9oVDM3TTA3TGl2MnhhdlRwV3dKd3pNc0M5Mnl5UUNJ?=
 =?utf-8?B?MzZGb1kvekc4ZCtYZndsVjR6a2k3RjNrLzFKaTZMdVo1ZzU1NWlYSGZSRmZX?=
 =?utf-8?B?cGhNbzYrRGVLcTFWSFM0eS9iWUZsZ3M1bzFvVnQxbXZTUkhoZEVOYVR2dURp?=
 =?utf-8?B?b21md2ZTc29YQkFYVXNZdG9JanNrTmtucS83aHJ0RU1mOHhZUjI2bGJ5TWNU?=
 =?utf-8?B?Q1M4VDlEZ2ZtMDN2R0ZnMnNsd21vb1FKbTFuZ0Iwc20xVFYrZVdEREt5WjZI?=
 =?utf-8?B?WHNZWklHZUQyeHdPWTF4aGR1YnZsWFUzZlNwank0ZDd1c2tHMy95Mml2UTVy?=
 =?utf-8?B?MktKRTh5ZERhUG94RTBJVTNDektrWFo2bFc2UUZtWkpDUW9MWHN5SkpoM3h4?=
 =?utf-8?B?NmVZME41K1Jzbnc5RXBGT2pELzNKS1I5VEV4ZEVCdjRpamxzaTF5NnJuV3Q0?=
 =?utf-8?B?MHFNZW1QYjQ1UER3akZHcFpTWU1CVlhTdVhZUzNlQWZoMFRTUjI3eW1DVjgv?=
 =?utf-8?B?c0JCL1pwZ2gyeXZOWkg3Q1NoTC9SVlJMWGJNWHRCcUxHWGNIWnJiZUQwQWgy?=
 =?utf-8?B?b2lyMVNJTUhDOENYU1puUkZVSnQrM1Z1OUFVL0Z5RkFrU01LclhORCtHaEht?=
 =?utf-8?B?VkNLUUVvN24vYmM0K2VQUHFUVzhqU2kxN2VHc1cwblJIeWwzUnFIeU40ZkVY?=
 =?utf-8?B?dStSeDZxOFozSkJJcExXV2EwdlZJaTNrOEVkQXNmSnJzeDlnbEp5S2Y0ZEdT?=
 =?utf-8?B?LzNpSHN6dWdnYXRnWDBVbUJDYWF5OFdDMkJHa0tGKytLN21odVJyZUtING1i?=
 =?utf-8?B?WDZHUEpTcEhmWXViMmh2SVFCd3M1cm5ScWVWNFVOeEsvQ1ZoYWlHYXpRZGxN?=
 =?utf-8?B?TVZVS2Y4ZVZRQ0loVjFWWVdXNDB3UzExQmJIbGYwVVg5NUxxampxYnhTVkNE?=
 =?utf-8?B?TG5ZcXB5bFc5cm1tMzMreTFHK25EYXc1T0ZIMWF4VkN6YlIyUndReVhVSmZY?=
 =?utf-8?B?cHNkQlJXM3k3Sys5bm45UGtPMkZKWFAwdTR0VktlUEZhL1BJTDBCMWtiR2Js?=
 =?utf-8?B?VHRVaUNIcHAwb2Fyb0NBNVB3Y2Z4M1c1RTJDUFBxYlI5VUFXWFVuRm1ONzg0?=
 =?utf-8?B?ZnFDeGQ4MXRyd21zbHZrakFja3MzK0NVMlc2WFZZc2x4cEFPOUpPN0VldVli?=
 =?utf-8?B?UEVsOGgxdWxMM3NZeEwyem01YUhVL25QWE1ST1FDSld5R3g3dk9oYzBWOStu?=
 =?utf-8?B?WFV4UXVnaVNXdVQzeXFKTG04aGcvb2VQa1BDRFBKV2lkcktITFBUQTNLQWps?=
 =?utf-8?Q?wbIlrVJPLvXkQHmIuJmjpqFKu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd311988-895e-4247-59fd-08dab5ecefae
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:24:06.6311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PufghB+PMXebkgqgzYyyO+7GCc2e2j3xCCyRMI3A/iYr898Me2qIzf2Xt3+3IFavsYjkFbeeO85RSz6HACcp1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103

NACK, Please ignore this. I have sent by mistake.

On 24/10/2022 19:19, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487G.b ID072021, EC==0b011000 is supported for Aarch64 state
> only. This is when MSR, MRS, System instruction execution in AArch64 state
> is trapped, that is not reported using EC 0b000000, 0b000001 or 0b000111.
>
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/vgic-v3.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..c31140eb20 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1520,6 +1520,7 @@ static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
>       }
>   }
>   
> +#ifdef CONFIG_ARM_64
>   static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
>   {
>       struct hsr_sysreg sysreg = hsr.sysreg;
> @@ -1540,6 +1541,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
>           return false;
>       }
>   }
> +#endif
>   
>   static bool vgic_v3_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr)
>   {
> @@ -1563,8 +1565,10 @@ static bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
>   {
>       switch (hsr.ec)
>       {
> +#ifdef CONFIG_ARM_64
>       case HSR_EC_SYSREG:
>           return vgic_v3_emulate_sysreg(regs, hsr);
> +#endif
>       case HSR_EC_CP15_64:
>           return vgic_v3_emulate_cp64(regs, hsr);
>       default:

