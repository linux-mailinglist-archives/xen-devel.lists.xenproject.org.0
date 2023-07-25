Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95453761C28
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569750.890787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJIN-0000x6-Di; Tue, 25 Jul 2023 14:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569750.890787; Tue, 25 Jul 2023 14:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJIN-0000ur-Au; Tue, 25 Jul 2023 14:45:51 +0000
Received: by outflank-mailman (input) for mailman id 569750;
 Tue, 25 Jul 2023 14:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJIM-0000uj-7I
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:45:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f149e771-2af9-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:45:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9904.eurprd04.prod.outlook.com (2603:10a6:150:119::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 14:45:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:45:46 +0000
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
X-Inumbo-ID: f149e771-2af9-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9TSnp9Ht3T0wdqnbKE80wbWO0pL8/Vo9kgTWbleW9WdVQgMe8c3Erm1PBEfSQ2rbyRa6eWm10YwY/2i8jJGJRi95whWr7fRLAuNIkojplWS7HkdyToBaqB5hG9KOPgrOCqvKVZCawOcIbTPhyqE9N/vqZ6p2UCprqWyGabhCRrYKf2wYenQBSuT5xTumpjVmErX9VxVSJ1G8a/B6e1zIavbnd39oBb+QRbFr8i/8C7NEh+oGJC8iRdbWL5E7ehJI0kRDfdSQElsqxF5fYjpEIOhACPF6gfaA7b2W/cD9h3KdVn+LpwEYACAisZCjuvrOgF4uV0z7q4Xorc8oaY6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NShA3SFEHAfYIpgenBS7HX1XTNQCsojJTAq4Q24tiUs=;
 b=ONtgWt10pfA1F1tYUVINZxBH9WuY+Vq8uazkVzAWQ+vmM4s3z//JqKK6ParIdIFt68TE2DpCg22K+INj9wp1oMMJYgImgYB3x60DJAyhDzMDCr8RLYX6Hl3yvGfh9QvuDhFl1itHACKVfqGCKjI/ZzCxyW3pty3rAqxXZravFdW1utsIoZffAqEtlI2pL8KP8n1tDATkmTMO3tymF9hqdMXdnKCnLdXMneToQNm0t8td6WQyikK+bakIji2Js/VPhvDCBfFsjBZbnA0rqVBWlM+OW/Rw3/DNp5XOoubqnGq4gKocRvVOT+mrYPrnYnjofe5Ohe36VLYJDPUtBn7i7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NShA3SFEHAfYIpgenBS7HX1XTNQCsojJTAq4Q24tiUs=;
 b=DBoT8vTrIhoazyIWryh2cwVly0m1oHLNog0nIYzQFqa3rpxrxNq62Eeo4CRhlJEqwfDdIkfsuBjbELqRHzKvkSMSpFX5MS/ImONGuzPDdu+sLTpb0vlfqR6nHB0mjlaVUC9cjgs7byiv3VJ7giqmqajvv46CrP2QdN+2q6+CRPAPFPFBnzkILf66rijmmDknSNlLe9W/nj0EGisXeblOt0dP5AoFVogUY7aGsZgsx97OOCC2FAGc1pUpXVvGVLrL6suArVfFDt+B+JaPdFUDpw6se1VAyEAv56ywUVylG6pBiOwLUpQz9P1Jp3WKRG4kuzW/g09PfXwBYcdSfW+dkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e690119-10f7-577f-b0e7-2fe5f1605081@suse.com>
Date: Tue, 25 Jul 2023 16:45:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 12/15] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230724125857.11133-1-jandryuk@gmail.com>
 <20230724125857.11133-13-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230724125857.11133-13-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: c219968a-91c4-47cb-27d7-08db8d1dd44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sUc8/JE7pScybx/tPA0PriMIhecGqWeMHc4OZWkwBy5zN0aZ5NLeOY6VZOl/SL9q0D5DJ418aof2s/HzoKVnKCmQ8clWTt/KtHeYKDt2pa+5CYQ2ghzVRWHgdwyVDKEGfUVbxYwvTsN5tch3IW+rfR5vd1Dbq3HxI+9xPlt3vSFTSNkGUg+lBY+zMDn65rlUg/vS6NPV06siBlxibUnfCiRG3Lj1OrB6PUEki5MRAb/9vS8tSMyn0pEVZxkpz6ArVxxKpMT6vLgJf+GSSUKh3yxZ2C662QorzWgDQVgD6MGe7ndAwSbQVJEH8ZSJI1JiduREeKrtRer4M2xitv6B4k5FzltlkEfIpafFGVZrXcz6QTdCaAztJPgK+DjOKNC5ek4C61Kfd7ghFRgmSPsiBCTFEvnOH/+VWQfmvAg2EGAuLxpDrS82TqIEFO12713tNVN+nbsHIiGuTAnCuv82jarqALmsP64rOXeRu+/CupQ30HPjmwX4snUaJDe82okF3EnpHt0Xfd1Z66gaTN3gqAPKJ453X6AwaFX3fk2ZdDntIGODhEkGGjT1iKmMLdQiRLR7LdVNHCQZNCH0xqOYJxEo28t/9JBjY2bng38vouqySYWiPuCBuRneL5xS5qXz7Mv43NP4a1a1pN2g1aeH3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(6512007)(6486002)(54906003)(6666004)(478600001)(186003)(53546011)(2616005)(6506007)(26005)(2906002)(41300700001)(66556008)(66946007)(5660300002)(8936002)(8676002)(4326008)(66476007)(6916009)(316002)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXhKUDB5NUErajQ1TEltMFRNRmJYZjZkU1YyeEE0aE9FVysxOFZHWXc1TGRM?=
 =?utf-8?B?U0dJMjRHbGpLZFdIZHdVYzFGUnl0ZTViNEw5ckJ5NG1IQWl5NVNCOXB5eDBS?=
 =?utf-8?B?KzZYU2QwTVg4NE1pQlpFOFF5MzRKUDlTN3lWcTh0YStkRFFCaFE3aHQyTG5W?=
 =?utf-8?B?eGhiZG43NkY5bHBFWG51c2ZkSXpVbXk0SUlybXFHUlZtZEtYdjBadFpzbity?=
 =?utf-8?B?OFQ3VHdhOUV1S0loTVFxSDRLTHZ4Um1RWkxEdUdoVVFLakNyQkR4UEgxczFR?=
 =?utf-8?B?YlZKc0o0UkhxQ3BYNGZNMHUvUmQrMUtvd0Uwbkk0bjRjcVU4VzAxMU5CMmtW?=
 =?utf-8?B?QVJOM3BXVkQzUVFyYzlWTStDTHM0RDNYcEppb0NRaDFGWG10WXMyc1JSN1JO?=
 =?utf-8?B?TTlWdFVLV1pUY1E2T283T1VtMlZxZXU0R0I0djVvbXI2VG0zeStrSW5UOEZl?=
 =?utf-8?B?ZWwxMHVIQXFHNjFLM1ZBZTBuMVBCWC9rM0RwbXRNcG5xUFNiQVd6OWFCak1l?=
 =?utf-8?B?ZW1lYmJXaHpQS0RwSWo3ZUJGWVRxVVJzUVc1MnRJUUxuWXg2VG8yNEFSTHB0?=
 =?utf-8?B?eGpxUmgzUlJVZE4zVkNpUnlsclFycko3TGlZQ0xYK0V2L2hkMXQyU2d3VG56?=
 =?utf-8?B?Ty9EcC9XNVpVRlRJMlRtdDlPdHpPMXlKZGl0SW1uY0ZUdEQzNTZSL2w1aGhS?=
 =?utf-8?B?dkxTZ2ZzbUFHcHc2bFlHa20xanRWVjRxU3luNDBsRFB5VDdtYk5VcnRFSVZS?=
 =?utf-8?B?aGhlVzJhYUhmTytEMmxEZkJMYkZLSFNSWXQ2RXA4Tk9TUzJGeXBsRHZYZFZv?=
 =?utf-8?B?STFFaW9iaHA4bi9SUGI4VnQrVVpNR01sRnJOVm42ZC94dFpyUzNMR2ZJOSsz?=
 =?utf-8?B?MFdWZTk2Tmp4K2hNV3g3UzdYYldrRnJTdkdNdDM1NmIvd3N4YllLUEJ6R0h5?=
 =?utf-8?B?WnF4Y1RoRHNUUEphaS9hbUZoY3VQTDBHVlE2QnV6aDVTaE1WZ1dTdWVCU2tQ?=
 =?utf-8?B?N2dCcUI3Uk1DMEpzbldkRnhFK1daQUowYjloL0JZWk1yU2czSUlQd3c2amRB?=
 =?utf-8?B?SDJZR04xMHpIeTFPOWgxSXYwZElIbit6clJCZjNEWjlqL2J3Z0t2SFUvYXpq?=
 =?utf-8?B?RitiR01VL3VvSm0vbzdCM0FRQWNteUt4c0E2OGZiMmE4TEU0Y0hObVpCSGJX?=
 =?utf-8?B?USsrQ09SR0pQczVKa0hsQk0ydjIrR056VXIxdkN4dklzTnVGNjMrM3k1eGRp?=
 =?utf-8?B?SXVpVC9QTlliUGI3ZEhGUXQyaTBPUVZNRkVEZnVTeit1cjBCem1ka0hsalhJ?=
 =?utf-8?B?ZnM1eDhnTjVHY1Z2SWJXL0ZvSGEwcGhqTE1kVWNTOUJxU0pzUXoxT1BjOEdh?=
 =?utf-8?B?Z2Z0Qkhlbi9Va3lIb0p6U2FJWjVMaU1jbmdVMUpReXF3RnZtcTVHa0Y4Y3Vh?=
 =?utf-8?B?U2EwUEJDNG5FNHlNeVpoUndTZVNhL2lxcXg0bjFxVVlrSUhSakpMRzBYOWI5?=
 =?utf-8?B?dDhRT1NwU0ZVT045NWdSckV0WDA1aDBiSXBQUFFmbnUzT0k3aktEeDdWa3hq?=
 =?utf-8?B?OEtIRmtpRzFWcGViQW5TcDFHdEllaUVKT2FVWXdzMWg2enBnM2J2b3M2eThE?=
 =?utf-8?B?ZnVOZkxTZGFLb3h4WmtEL2tDbTc4OGQ0YnZvWndWVTFHWlQ1YnV2OEV5a1RC?=
 =?utf-8?B?bEYxaE1NWEp2QWhlOU5BQ3pZME1KMURzSVVlMlhidmFXMTBuTW9HRy9CTEN0?=
 =?utf-8?B?SHg5M3Q3S3p5MEEyVUJNZ2dRai8xVnhWR25wM0d5dU42SGhqNUR5R3JDOHpq?=
 =?utf-8?B?Y0xiZ1ZVK01Dd2VCNHBaNk9VVlU4WVBJN29JVnJhWS9SZ1RwbE9UWkY4MGNX?=
 =?utf-8?B?ZWlxc2M0LzQzbTBvNTBrbTJDVGRIM1dVQWZIMHIzalp2UDlic0ozV3dXQkRa?=
 =?utf-8?B?UThvdjNodnc4aU0wa1lOM1dST3hjUms5S01rS0dJQThCNytmYm5YV3h2M0du?=
 =?utf-8?B?UkNwNzY5LzdTTXg2L05zRDZuRFhFdDI5QllzVzNEVGRaZnJQZVE4SitaY3NB?=
 =?utf-8?B?VFdUeVR1RGFaZERVUm5DZENqWnl1MnlmbWV6dFRNVkVHdHZ4c3Jvc004YzBa?=
 =?utf-8?Q?ToNOvaRt2NMpWsLK5bwj1Vseg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c219968a-91c4-47cb-27d7-08db8d1dd44a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:45:45.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeQ5mBWtr+ygeYmK5N8l1XxwdGEcGCYm5Qb9zT2E32rOqZ0nTMX6MgSeNspcdbCj3QiJ9V254hZYZ2kjbd6jlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9904

On 24.07.2023 14:58, Jason Andryuk wrote:
> Add SET_CPUFREQ_HWP xen_sysctl_pm_op to set HWP parameters.  The sysctl
> supports setting multiple values simultaneously as indicated by the
> set_params bits.  This allows atomically applying new HWP configuration
> via a single wrmsr.
> 
> XEN_SYSCTL_HWP_SET_PRESET_BALANCE/PERFORMANCE/POWERSAVE provide three
> common presets.  Setting them depends on hardware limits which the
> hypervisor is already caching.  So using them allows skipping a
> hypercall to query the limits (lowest/highest) to then set those same
> values.  The code is organized to allow a preset to be refined with
> additional parameters if desired.
> 
> "most_efficient" and "guaranteed" could be additional presets in the
> future, but the are not added now.  Those levels can change at runtime,
> but we don't have code in place to monitor and update for those events.
> 
> Since activity window may not be supported by all hardware, omit writing
> it when not supported, and return that fact to userspace by updating
> set_params.
> 
> CPPC parameter checking disallows setting reserved bytes and ensure
> values are only non-zero when the corresponding set_params bit is set.
> There is no range checking (0-255 is allowed) since hardware is
> documented to clip internally.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one last nit taken care of:

> @@ -539,6 +543,103 @@ int get_hwp_para(unsigned int cpu,
>      return 0;
>  }
>  
> +int set_hwp_para(struct cpufreq_policy *policy,
> +                 struct xen_set_cppc_para *set_cppc)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +    bool cleared_act_window = false;
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Validate all parameters - Disallow reserved bits. */
> +    if ( set_cppc->minimum > 255 ||
> +         set_cppc->maximum > 255 ||
> +         set_cppc->desired > 255 ||
> +         set_cppc->energy_perf > 255 ||
> +         (set_cppc->set_params & ~XEN_SYSCTL_CPPC_SET_PARAM_MASK) ||
> +         (set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK) )
> +        return -EINVAL;
> +
> +    /* Only allow values if params bit is set. */
> +    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
> +          set_cppc->desired) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +          set_cppc->minimum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +          set_cppc->maximum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
> +          set_cppc->energy_perf) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> +          set_cppc->activity_window) )
> +        return -EINVAL;
> +
> +    /* Clear out activity window if lacking HW supported. */
> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> +         !feature_hwp_activity_window ) {

Yet another misplaced brace.

Jan

