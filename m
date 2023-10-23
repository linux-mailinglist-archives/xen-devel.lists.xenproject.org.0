Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB807D391E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621512.968060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvlG-0001kn-Fd; Mon, 23 Oct 2023 14:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621512.968060; Mon, 23 Oct 2023 14:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvlG-0001iK-Cc; Mon, 23 Oct 2023 14:18:30 +0000
Received: by outflank-mailman (input) for mailman id 621512;
 Mon, 23 Oct 2023 14:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvlE-0001i5-KB
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:18:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07067b35-71af-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 16:18:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7268.eurprd04.prod.outlook.com (2603:10a6:20b:1de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 14:18:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:18:19 +0000
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
X-Inumbo-ID: 07067b35-71af-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQSSPYQvqjW9qSEL+0SVSIbROWXbum38NQ3IQ6hi1CufVooPcr/mI/c9lc6NeJ9Iopk7W0Tx0qGweRPtloVxVO5NsweWhpo0MNaDXlEQcRsHmYtMSk0CZB/nY0zJN27tILlLnDH2BzuuyfqnA2mnA9GHHhrwwX4AyIzcyGjaerD9hg65360j1AqZGLWlUCK9tW02rhgF1ip77poCav4RihxdXJFKJXAKlU3Wr3cVnMYsE4D1NiZb3DDnSgYbXUPMK8OCYqBktVevVptNOPKhtE1WrJmpJIRRuDgMdH9TVj5xhc57uh0EctmxhiuRoMu8jWmjVYILv0sW2qOigGATKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw7JHfK/qcz8ichvv7Mp9PJIULjSkz9KyP/6NX6T0og=;
 b=k3oEVxMkrCjDWm1vr0gW9SAf6KFaN1mA9VSLC8L7O2iVY9jxv7w+bWogYv8/baIbQdbYaviIOLHIyTz0LEQYKVUCr1wEc4N6+lmJ2DKmF0vtLNgoWXGJ+u2I68/4yGjFJITBd0WcX+Ab53mNsJsxyyRNLRIkrXNx+rADnQcDOABk+jxkZ0DfkAUYh28b/eTwvQS2Z0mPp55wD4yAsylAtC4/bONGElIVz6PkVwHH2uU56xaFzxZOcbX0L4UC8zUb6mWfnNJkSLkMssiphy3rSM8NOvDuw4Plha7dTUHL7qTADoiQmKyzRWqWYo0bQRi5RgP+L7B3KkV6x5t6oyt7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw7JHfK/qcz8ichvv7Mp9PJIULjSkz9KyP/6NX6T0og=;
 b=42YXKJ/42GtA8/oo2kzWudsxvFx218m20lsLdu+tvwJSNz/0VNvDtpdb1IkFrzsq0O2kBgbidpabW0qQQ8FB+MyltjJH0j/pleyVnAoXa/yxcL0bgO2L4JxdXo+f2c06zKnTuWAmnbKdHuqYyIXDFCbWXFcV8vwp3tFDGSpi+VvMzPxzJwkhwL+mDgdCQhpDPBwKoA18kWo6WQOxzHIgcOAEaGSlum67iCGX1QV3VgheskMORvO0vUVfjwZRxsVSTWpLnOCnSK80xxjhsgO8EQTv+eASMHkFARBbOfloJSdgECeimdFVEI5/ckDu5xwQx9q5h0DYuP8yuZDI743mkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1e309f1-cf95-e84c-f569-29f8dd9a411e@suse.com>
Date: Mon, 23 Oct 2023 16:18:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 7/7] x86/hpet: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <4d3f6608e5c76152e4ad0bbb57e38ac80cf316f3.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d3f6608e5c76152e4ad0bbb57e38ac80cf316f3.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0284.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa56d13-81e3-4520-b0fd-08dbd3d2e808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U6sDS2YAU85nB8Wdhd6udAI3by3roHNABmBarx2ApB+9GEMTc6sfndbcDxmksT6HGY9Q/Ob9518xl0FrAfKV/TXSRhvVRbLS2hgfmLeJc82QcyYZNlqEOGSwFvHaylZBbXjIhxg3PQEwnovb7ggaDbZbzWh5+aL6h5UrRX29tRfPoLst/iQGA9iK0vyxgsHqLe/7azYcLVgGJXzsKbpcOczsWtQMc7/uvjeuKCuBAAqGnftXTK3VnZlue6Jonl7ciHFwFRjVWKqvzfy3byGOAi/HGVkT9nhNpo/YMHDRVEIHKtqDY+7Tf7pH6jF9Q2lfYexEUA96gYScYQXZTxtLvDs87GGiMu3IwOqTux03/hCQr6hJB5FRyPNzJJtxqzlO6R1qfsMWkgL8lMrN7eRWMmlM2ubGZGk3lOWLNmR4I2QgH5bfGPFpp7sKnakEAzncXAbAyGj+3lhNFzlJcisC159PPaGy9CkvCzl5aFtL/xBtdE5w2YA3iL2dHljTVO0Y8Vxjr92RYPRujqF+PmmCedcSXY/wYadn8WcU10LJk9OaxcuSR5mvpdJshFEJ3VgBA1dFdPD+BGXRIiuf/GJaZVwQU9/P5cmCZEM3T9aEM+iP8gUwE4Uw77i3sOzZaaemVefA8hHBI8Vm6b5lhULEfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2906002)(66899024)(4744005)(38100700002)(86362001)(36756003)(31696002)(316002)(6512007)(5660300002)(53546011)(41300700001)(6506007)(4326008)(8936002)(8676002)(6916009)(31686004)(478600001)(54906003)(66556008)(66476007)(66946007)(6486002)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFh6ejd2dW9JZVgrdUd1bzlNemhvd3JEbUMwVFNQRitPTVArNkhQV2VmMjJs?=
 =?utf-8?B?ZG94LzNZMmwxL3pmMnNybmMrT3p6YVBoakttMmJpZVRHK0ZHbUk1Nk5JV2tW?=
 =?utf-8?B?aWhZOHN4bXY2QVR1VXBONUtPUHRmK3VpRU9HaVo4NHlEVWI1SjRselZHYUJj?=
 =?utf-8?B?bkdVRFZSRGhjRzdGOWpFNE1OK3dtWXRPd0pjcDFySDg1VUwyZ0w2dzZmc2NR?=
 =?utf-8?B?ZVkzY0o4NThlQmZUMVB6SG5LVHRKdjA2eTUraUZ4R2RhMzI4d1h0YTIzOFcy?=
 =?utf-8?B?bjRGdXdTWVdEQ24wTHdsSHdkSDk3SG85ZXZScTNINUY0aGc3TFlkRWVYZ2V6?=
 =?utf-8?B?OERmYlJBNkFiRjZlYlgyQU5hMTVQdUJzSmo3Sm52aTczazZ5Zk9UWjZMU0tu?=
 =?utf-8?B?bU41My90bzN3clhheTgraFBUTVY2RVJxazdLQXBzWHN6WnpvalZCSkRZekVO?=
 =?utf-8?B?bmowMmhxWEVUc1RiZTJvbzhjbEtZWlhKYWx4OThTTU1DRzhFT3gwVkRGK0hV?=
 =?utf-8?B?WlhYOUcwNlUxbE5sejk5ZkhwQy9OVmRIUm51NWVWaDlxK1VlOXQvV1c0dG5W?=
 =?utf-8?B?cE01WG50N2FYemV3SmNDY1ltNXk3N0JNdk14YjlyNHl0QUNXYi9DdDhmUHlu?=
 =?utf-8?B?SjlhMTUrVnExZnBpY2szdlBGS1R6SWtIaHdsNWJReG5Kd1VRSitDNUZUVGRS?=
 =?utf-8?B?RE93Y2R2SzQyaUxldEY0UnJsclcwUTFxSTBiYW1iRDhFR2k4dUtvTTRqdHYx?=
 =?utf-8?B?US9zVERTRC9QWFhPZ0xQNW4ydzIvY1dhTEZTbEQ1bEIwL1AyMGNhNDIzTE9v?=
 =?utf-8?B?S0ZSQm1VUWlKSkY1aEVhY3JjaFZSWkhpWjFYUFlObHZQMXowK3lrQUJzRW1p?=
 =?utf-8?B?dStqdXA3dGhmRE52aVJFazdVTEJUOVNISDU0Y3VVT3pZellUZW1FNWdwazh3?=
 =?utf-8?B?VU5XZ0g1djZYOENqTzBpdE5IT25SUUl4SlM4M1o2OEs5K2t1dXlPYk5nM1NV?=
 =?utf-8?B?UDJuanBST2RUZGxjZ053dUcrYnBqWjVyeVBEbkdXZUd0RFUzTlVTYlFjOC9Y?=
 =?utf-8?B?WlNZam53eVdiS0laZVpVZGUwUmlPNGVIaTlXTHhKZmpjRkdQSTdsTC8xclM5?=
 =?utf-8?B?akQ1YjNNa0s0MUc0SFZkVTZxbkExdXkrS2cyT3RwZEZ5ZHhURk9MdGduM1F4?=
 =?utf-8?B?RW9zbnNsQWJKQ0tKWEc5TldneGpQMDNQdk1WYzRQUVVLU1Z2ampwR2h6VStZ?=
 =?utf-8?B?em5FbEdWY01HQ0RLWGNyT3hJWW1vZ1dhenc4ZUhicHlPbDNxTloxZHd0blJ3?=
 =?utf-8?B?bDVydlN3MW1yMXU0RSt4bzgzV0RrQmNrTFh1enZRMW41WXc2ZzFHWlpJaS9q?=
 =?utf-8?B?Um91YU91cVQ1elI1eC9jWjUwTDdrbEVkdzBSM09VeVJPNnloOEhLNnUvQzV1?=
 =?utf-8?B?Y0VHclZRTXZBSzlNcHI2MTBtamVWc25RVnYxNDZQRDlUemNZeW83Vlp1cTVt?=
 =?utf-8?B?UDRod2F0TVA4TDJQeTE2LytFVFpqRUM4SG5yeGZEUy9SVTRYNVo2VVFEOW5n?=
 =?utf-8?B?MmtiSGg1U2FsLzFXQjJ2bVRDR3NNVExLOEpyL2tiS3BLM2x4NEd6WWpiazhR?=
 =?utf-8?B?Nkp5cU5xdWVTSEdzTWkwc2FHTVhjYWh1ODM2dGNoZkIxM2VsNGFWTDdWNTlU?=
 =?utf-8?B?QndOYUdVems1S3FVTEdLQ2lDNkM0eGU2aTNwcGgrMEJxRThRYVh1Y3RlM3ly?=
 =?utf-8?B?bTMrWjZEVVZjZFNYY0lNSzZpaGt4OCtmV2pTcXRRZCtxeW95YzU5Vkxwcksw?=
 =?utf-8?B?KzJkSXhtcFllUHVxQkpSb05CVTZpajkxaGhCWnN1K0VIdzJGTFBQMUtWVGVh?=
 =?utf-8?B?TmRvWklrRC9QQzdrWEFFd3ZtU2o5bmRDN2RnU2Uwb2dlT0piK0cwcmhSSGdM?=
 =?utf-8?B?QithS0VNRU9tSW94RlhWQlg0SEIrbGZSRzY0RzV1R0RMeG9IdGMyUmc5K2lv?=
 =?utf-8?B?UmhXOGdXNnZhV3JFVlM2Mk1ObWQ4eUtmdEswb2tUS0JKSEFWMnh6Q0lNRjFK?=
 =?utf-8?B?ZS9peitrRmQxSUZwdEhXcllkM2ExckJjQVZRa1BaSWQ1ODN4NkZOSDgrNU55?=
 =?utf-8?Q?kPv0V2th/68wX79Fh4iib8YMM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa56d13-81e3-4520-b0fd-08dbd3d2e808
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:18:19.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AA3ThWXmEwEUngN+g/tmvPIobM7/43V0NSfSmtNSbsmCbR5JXajk6/uGSsOnb+JvH6n+fmpdUVQs+Eh4WrLuqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268

On 18.10.2023 16:26, Federico Serafini wrote:
> --- a/xen/arch/x86/include/asm/hpet.h
> +++ b/xen/arch/x86/include/asm/hpet.h
> @@ -60,7 +60,7 @@ extern int8_t opt_hpet_legacy_replacement;
>   * Return value is zero if HPET is unavailable.
>   */
>  u64 hpet_setup(void);
> -void hpet_resume(u32 *);
> +void hpet_resume(u32 *boot_cfg);

Ideally also switching to uint32_t while touching this:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

