Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E57D5482
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622089.969261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIpw-0005JV-PZ; Tue, 24 Oct 2023 14:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622089.969261; Tue, 24 Oct 2023 14:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIpw-0005GS-Ma; Tue, 24 Oct 2023 14:56:52 +0000
Received: by outflank-mailman (input) for mailman id 622089;
 Tue, 24 Oct 2023 14:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvIpv-0005Eq-7R
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:56:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dfa96fe-727d-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:56:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6775.eurprd04.prod.outlook.com (2603:10a6:20b:102::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 14:56:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:56:17 +0000
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
X-Inumbo-ID: 8dfa96fe-727d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inNbj1/TYFSXZQdDnHCDUqAPChuzM8Cn+pdhotSNFZeQIb05LSsg2nNs7rpWW+6BP675Wxiu/FPiFtEftgyU77USh3u53n9tC1Ed3ni6tuIFabQgve7az2Xe9qWLofiWoKpJlNoB5TucCqOg7eumLiYyVvil/ho0alAU6rBLc7hEtUKvmcnDMp+cp93yr0GyDkb3g5FEnzPJZGv9pk5SVpkLjhZahA97LQzx5+oE0q8GOspetsdZR2OmgxznlAOy16pwMPpC//WPrDrtO+VTrSTx7Z7zMu02P2dR0M0t5ySM/H4+HSM0HTNdzdvtDRjjtneLpkODONEo7/HznpqTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbGcT1DsOGDZZbzoM4yu+8Gw+XJ2neSKl2FpYfLoSEs=;
 b=cgJ9V9gHR44dyHghzx0OHRmtu2ca23Sj7Hd1RGBU8iahG+Xb591zDDT8jGYOL+eeS4IEHpQnWrMLo5M6OyapvuLr3Gcp3fuvEjWnp41zfZ4I8BWD5SN0phEqwfOTEN7znBHZ2AZ/LSXHkIYA0bq56kyU7olC1iIF58lKI45Bp1baYWu/BoCaOGj5c9nGz6cbGrIhMbxI+rYB7rltDTZlzDOYVjFNN6PgHgx4BeIq1f+FqGWGtW+mq2nmhdXYlPk/wfvi3Rws7YwjvyO3Cg6zbc2fdr1Uwl7nBzY3AJplqWHXhjNkLuMO4CaMwPC1YvlUOl1vrLgdZDS5p2ns07mk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbGcT1DsOGDZZbzoM4yu+8Gw+XJ2neSKl2FpYfLoSEs=;
 b=ER4lkj6IacJhHBucDoXcjNw4XTcCk6xETuQNO80/fNHWUjfSo4ke9hdU8jI7Al9dYY0s+VjR93TyBHqWRjeBvSBnZFSZJwCkUfb/bpmA0SzPYzeeEFKJSCsNSulgiiMOSV0lwNtkUHm26gU2nbCtrFdk1Zrz8/0/79l/9qIRyU0K7G2FHWPxMf+b7q4Hqxv7F8SKc2hjk2qkDQhiRiogpU98TSvVwiJLdixE3yEBKGaIQthPDBRhSbgeORrGC+Q9TOcBBPPocuhLe/tX3af6C5iR+dUAloMe11EeHZOhrlgMutPSdC6eJ5fghU44hyTnZDScM+KuLA5xMURfsdqv1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71bcda90-0351-9487-5b68-89718146bb9a@suse.com>
Date: Tue, 24 Oct 2023 16:56:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC 2/4] x86/shutdown: address MISRA C:2012 Rule 9.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <b4781f1a558a32747f1aca53b6da50a2d4b61f1e.1698155925.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b4781f1a558a32747f1aca53b6da50a2d4b61f1e.1698155925.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b10b9f-baea-4286-6e28-08dbd4a16005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lj7HJJirc/YDnllXQSzz67OqUFsZOn/170v3YzLHnzd9sIjAI6NrO3+p4B3fLa+a9uDBG7h1v42OC9nRDaPglLKwZ/YupyUnFYt2cKiWudPWnpaKD8KSmnmI19xrHSUbTHeVgaI67L/cgsibKwMRqG5teS4SQRcmmryOu9vrPap1O+U7dBIzmOghzoj/Vl3HMQ7Fy77b1t+krwiP+5Ly2ibMBIWtbuTrFlF2sg/O5r/HDJbospvcr1gMA/IX/KrPugZ/lV7PnkudaSOghpZM72Cw26712rMniY9xRdQ0jrutS6/Keb8QYVL7VjTTXydvJTddhtbERHZA8+/7ErRxexgTGOriGD+eN4uTmRGL98dURk9QdnXcBIBTJ78mKoaUfGg4AqkByBlaUFOekDqB27Td5j2LVZT1Br3S7EtNA23hQev3rhlKLP2L8r33RpwpGOV57E1x6lM25tguVRrILV2wIEHLdzR7JIfJdm5d764tmewmX0FgluthTW7H2o+8MSZ7V9W2WWE9aO1+N/HSW05w9DgL9ppOA71E3bc2631najFmoHd2NfNnv5HWcS04iSPr71+RLKlWh8dK/eHP2qb6QXJo7Cmx9z6EkKN3LfQUA9Q6rk6BV+NGiBmX1sexWTY29YSJOCo81dwzK2BNYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(36756003)(6916009)(66946007)(316002)(86362001)(31696002)(66556008)(38100700002)(66476007)(53546011)(83380400001)(26005)(6506007)(2616005)(6512007)(6666004)(6486002)(2906002)(8936002)(7416002)(478600001)(4326008)(5660300002)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUZ2UVBGWjV1NG80cjJDNVEvRklSZkt6WmYwQ2M3ejkvbGdJOC91RDNKMU11?=
 =?utf-8?B?elVNZnlWVlJBRE1TMWEzZTVKQzh6KytSY3BtVVJtc1FLb2Q2QzJnSWwyc1NC?=
 =?utf-8?B?NzlZK0ZJU0h1WlNIRkNnR1ZLYllrdGJPYitGQ0liRm9RcjA1QkxiVGdPd2Js?=
 =?utf-8?B?MG8xeXFSK0JsREZlTUUrR1NrU25JVzg2OXAzZkVMVTFKVHBlUWx5WWQ4TTBE?=
 =?utf-8?B?dmlqUVJ5clBTamtBcjl6VkU3bkhOc2ppY0I0MXFaOThHc0k4Z0JybzVtL3ln?=
 =?utf-8?B?NmJjcTRWMDRIVVZaa0l2YWt4dERYaE10MUw3V0dUdTZnbXNWekRMNE9LY2Zj?=
 =?utf-8?B?VnBLNmFkeW9NZFU1U1Z2OHJqT1hFN1M3SEZwOUV1Y0NFZHJmY2FVMU1tckhP?=
 =?utf-8?B?WVVLdWR2M2V0ZHdKODlLR3JibkUzbmFpMHFWMFF5cHJvNld1WENuN3RiTnRK?=
 =?utf-8?B?NnBReVR4clZlV2JhbVBVVVZWbFdNbUFpTkJ5NXoyeWkwV3JCMkJ1dkhqYmFl?=
 =?utf-8?B?TjZhb1F4SHNqdWROdkhudkc5RGgzTGhteU52SGliV3F5a21oeUxocWlsZGEr?=
 =?utf-8?B?SnRzZHRGZVBSZGpPcUtYemY5UFYwVWgzMmFZdVBJSDd3VDRhSmpaKzJBMnFL?=
 =?utf-8?B?ZUVtUHc2Z2FRc2FnTm85d2o5b3NmR0IzL2xDYU11VWhsanp3ak5neWpkb3Fi?=
 =?utf-8?B?K3hOdys1VENMaUIzckpMVmh4UjdYd3hhNHFHdnVtUnYwbDRhejRoeTBLSFhw?=
 =?utf-8?B?dEJiVkZIeHE4cnYzamFaMExkSkJrcFR3YVJjRlNNTFA5UE0xbXdaZ25mUFF2?=
 =?utf-8?B?eFZvKzFYSFhnOEdoR01rNW1reVptWnlzYW4zaFhjY054c2g2Y1J3V0ZJRUND?=
 =?utf-8?B?ZW9YRFhVVUM0KzZ1OHZCblhJU2swcm5zUFI0aXJuazNuZTNueTZDQXF1YldG?=
 =?utf-8?B?S1J4RysxdFh0bUdGbWNJOTMxMFFOUm94TkVKOHk2emlsVzI1NWxKTkFpaFph?=
 =?utf-8?B?OU0vUGRzaGlUWTFQZHowQ0xVcElXanVZc2hScFhaeDFsSGhRU1lMd1YwZmVl?=
 =?utf-8?B?bDNTei9OTDZ0QjVRMVducXJhYzJmVGtjcjdVTGVHYXVPZGg1d3hzZWQzMHZa?=
 =?utf-8?B?S2M2b0lZRWdaNTJYTy9sNFZ6RkJMNE4xUFd2WWk2RGZmMXlxc3NVcmcrRkZV?=
 =?utf-8?B?MVJQREo2VHBrZWdmV1NxcXpCMXkxWXZ0cDZxZktFL0t3b2ZVa2htNTc1K2o2?=
 =?utf-8?B?U1BZcmg5WnYzVjR4dy9NTkUrejFRd1RhUDNnbmY1T2k3L3lrMytxMGFjekEw?=
 =?utf-8?B?UUY2ajRBc1doSHZFR1k1U0RTeGxiSWIzTDdDMmlsRHdTTGJXODhWa3duZ2pO?=
 =?utf-8?B?THNrOEZtSzRwK21SamdxRlJ0cGdJcldiTlVybnZTaVJZNVl3d1JVaXZHVWxW?=
 =?utf-8?B?R0Y1YUJNSjJDVVJIVFNoOTFyeVhhelR3bVVGQ0QwKzdqSUErTUxZUTBBVTRN?=
 =?utf-8?B?Y0VYb3o0dnRDeHFMWGJHK0RSSy81QUE1d3E2ckl4VGZiMkJ0SUFUdXZqYW5p?=
 =?utf-8?B?N2VlcWhWVFV1NDJzM3g4VmZDVGNEOEEwUXFGR0FUODVyaE02M3JROWk4QWJF?=
 =?utf-8?B?VUFGYUdpb3ZqS2owWlZ3Vk1oODFweXdqREVPMmVVR0ludzdqSTM2anhCZmJn?=
 =?utf-8?B?aVdCZ0d4UERXR25VNEwxWXd5NW9GQ0FYc1NWRHY2R3Y3aldhaHJLNEs0T1k1?=
 =?utf-8?B?d09VMWhiUVkzVG5ySGtVbDM1b3EwRkxseXRDMnR6UFU4dnJ4bmxyRW9QeDZw?=
 =?utf-8?B?ZWYzYWFIUGZNc2ZZT3BsRjlzS1NyNFZib0Z1SDJiYmpxaUNvTVl6V1kyRU5N?=
 =?utf-8?B?dXp5SDlXM3prVDEzZ204RlU5SklxN2EyalVxZmpEMGhxQ2Z6RldOV0gzczRQ?=
 =?utf-8?B?dHM0WHVrWEhzZ2IzQ2lmbklmWTlUWVhzMWhBM2U5VUhXazBsVE5NeTJlMHJs?=
 =?utf-8?B?STFPTUd3aUNLNDlQVXRDQkxURGtaNkc3VG51K1pYdGwyYlMxeDRLWTBCRUFB?=
 =?utf-8?B?cjZoR1dWSi9nb0c0ZGRqeVNRSEY4Tnp6M3hYSkFEUFVmdzA0V1k1VW5nN2RB?=
 =?utf-8?Q?TyedYBdm0ZsscBTS7ItGQLrzl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b10b9f-baea-4286-6e28-08dbd4a16005
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:56:16.9911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z578IIpNvxcGpByMEIv1Z9Y1c7kINeyVVXPIaZek5iPMVyF3RG/ekzzLwRw3zi8A4RIcRQIdXudUpfBvsf8K4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6775

On 24.10.2023 16:31, Nicola Vetrini wrote:
> @@ -225,8 +225,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>          .ident = "Dell OptiPlex 745",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
> -            DMI_MATCH(DMI_BOARD_NAME, "0MM599"),
> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0MM599")
>          },
>      },
>      {    /* Handle problems with rebooting on Dell Optiplex 745 with 0KW626 */
> @@ -235,8 +235,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>          .ident = "Dell OptiPlex 745",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
> -            DMI_MATCH(DMI_BOARD_NAME, "0KW626"),
> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0KW626")
>          },
>      },
>      {    /* Handle problems with rebooting on Dell Optiplex 330 with 0KP561 */
> @@ -245,8 +245,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>          .ident = "Dell OptiPlex 330",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
> -            DMI_MATCH(DMI_BOARD_NAME, "0KP561"),
> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0KP561")
>          },
>      },
>      {    /* Handle problems with rebooting on Dell Optiplex 360 with 0T656F */
> @@ -255,8 +255,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>          .ident = "Dell OptiPlex 360",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
> -            DMI_MATCH(DMI_BOARD_NAME, "0T656F"),
> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0T656F")
>          },
>      },
>      {    /* Handle problems with rebooting on Dell OptiPlex 760 with 0G919G */
> @@ -265,8 +265,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>          .ident = "Dell OptiPlex 760",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
> -            DMI_MATCH(DMI_BOARD_NAME, "0G919G"),
> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0G919G")
>          },
>      },
>      {    /* Handle problems with rebooting on Dell 2400's */

Well, no, this is what absolutely should not happen: You're breaking
the code here, but initializing slot 0 twice in multiple instances.
From looking just at the patch I probably wouldn't have noticed, but
the "always elements 0 and 1 only" pattern made me "grep -lr", where
the issue became apparent. Otherwise I was about to suggest we shrink
array size to just 2 elements.

Jan

