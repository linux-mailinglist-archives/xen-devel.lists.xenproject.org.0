Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486B645590
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 09:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456023.713692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2pzQ-0000SE-Sj; Wed, 07 Dec 2022 08:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456023.713692; Wed, 07 Dec 2022 08:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2pzQ-0000QO-Pb; Wed, 07 Dec 2022 08:41:16 +0000
Received: by outflank-mailman (input) for mailman id 456023;
 Wed, 07 Dec 2022 08:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2pzP-0000QI-FP
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 08:41:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89225f8-760a-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 09:41:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8485.eurprd04.prod.outlook.com (2603:10a6:20b:418::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Wed, 7 Dec
 2022 08:41:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 08:41:13 +0000
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
X-Inumbo-ID: e89225f8-760a-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+gsPTs/7a+8F/H1e8hA4muwmypd24zekouiGWKnHeWups5lFQ3nSA1pORb5jxV66hWcktb6Bd6n2mWxpbctPi0SIOwU/o+spFcE3xoXjAacfgrME3m8/IloARK8F0MNwbJcPIsYu6cK+wuztCsuEqkcrJV9U5iTlWPJBLcdp5EVJTYiCvo+dGgD0JBOveuR8gJSihecZA6hJu5/12Q4RKvDGj98zHYf3uOSb1Sk8vaxPfb9UiwBUQFG/G/t4MOM88NXH1Fg+0QCjUcd9EqeOMUI5BVkVHlARzZVVZw2rJvJIkheE/Bnsz9J7p2keJCYrowQ4FRU2gOC+guDp6IXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Scj/x4Nf690HEGqPvfqmvtwry33pCAMvh6lg30CODo=;
 b=cyrwDKyrsKNgfGtpet5YAQZ/CCIV4rE34pUlRRCE7sm0/J3KL0KQA0i0bpgDozHhlaEp6KtNGfJRsP7AxS/T2exYW8PjCkFaTc5ZWdMkq817f45j8RoRosx+IsQolyXCli+EUEgihF1HB+8wIVHDKaPME/yvkW2p3SJaJ1eBBomrunAYj5HcB0lnBPylBQbSPLjE3AftXRAJIep92H/Xr0X8ZfDz1K44gkODDt5Wp9BuM8/JPfQ4tCBYTsUQu1WMX2NftzDZLv65zUyHYtowRIhc9gvBQUkPnyfCDpEgopvbeAdAHOgTb+ehB9xXBSK77fMwuudHBMQJ4HV1WpA2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Scj/x4Nf690HEGqPvfqmvtwry33pCAMvh6lg30CODo=;
 b=ksSAtR99iE3/Smx2ZTioR/k9HW12yNL9+0qUsCjFf+v6HJTFdxTeDrUdXBM6Y91WSzF2EmgpnNejEU/AE3Fn6IuxwBg9cOpllzUie2siRPLU3Ii4wuqwn+J5Y7TFC+S30Zq/1YCY3rT+X9jGjQ8oOxbcpBoGxM+T4iR+V0b/Mo8nYBcLSFWVp8eJzhKEtKt7Y+5C9u4aYwL74uZJLh69cc6avQ4XDuNr3Jo9q0YRcXrIai1OFunnScDbP8ZbMYpe3dPULSngelr+1fz1r+MT1xDDEYYwAziaQ7v+S7oo9jm7yKaIuwdp/g1CBQpXcRd0sufnABcZzbOJmQzcG4cItg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <786addf7-2698-5a18-26c4-b6b88bba1d67@suse.com>
Date: Wed, 7 Dec 2022 09:41:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v4 12/16] xen/arm: Implement device tree node
 removal functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, julien@xen.org, Luca.Fancellu@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-6-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221207061815.7404-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d89f60-ef91-4c2e-a286-08dad82ecc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hx6+tu9gl7lcIWROVONu5FMlou6LkXiRQgHbNBonAr6/3ewv8/oefrsCBjsoddswn8o5czFVd7/fS6fNxVZZq53J7ogxpcIeojH5VprgI8MNdk4X0luWr5WW4+O3Cc1pqhWvbcLERLBBPZ+7ndWhC1T5456srFhnh4IIWSFsZ4ZxT92biyp672lD3/qJF65ZhbNMY/Tk42UHXDYr3b4sZxOxXYXYtpp2adjXZg3sZb5xKDrqoGVb6y8shv75xtBoBLghUAOjpz9HqIxh42reByJEHWMZQixCAprIeCO2jdGL1yb75mWI2DrFvC+tLUal75Ugciegz6zHwHD9kHRXE0Zf088JUZDxDMXC9cl4zIfgOcZRs8qh3TdE5SL3/4EGFv9dlmSf4jTFcQ028jxCWdUxay+YmxXxKq0PY/R18bp6ZtfDCZicYSYtmYgbHESA7BMDZRA2/ialIG0d6ePizYyMFh+W7NXAw7SPIXUGa+a/b+mG8ftmpMuiLl1FrkwUq9qUFBH5xeWv9AhOLeHoK4mjvDhiitdTxI5kFFBg285c7440qMOoD75gi4Wt5JMQ/W7kQwd1PnpkMNvW6PCEZmN9pG0ovuu2v07VJh/kpoAACvQbez7MCaLz7ZIdzDB7fFxZCenW3ewg1SVg40lEkKax/s+VPE4TbcorO3xSuwmTV0iVGuhggqB/m5SwutewuPFlxRDX8CwrhpRVzBI7uCu+Skx1qkNU+aLoTFyV4N4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(53546011)(6506007)(36756003)(2906002)(41300700001)(31696002)(26005)(186003)(38100700002)(8936002)(66946007)(66556008)(66476007)(4326008)(5660300002)(8676002)(86362001)(6512007)(316002)(2616005)(54906003)(6916009)(6486002)(478600001)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG9rMnBVSUYvZ0VDZzRKTnhLRVRtWmk5bWw1MUhJL0tDYTBxclFPcWJmQmZG?=
 =?utf-8?B?eWovSHkxalVLMWZMOUVEdjQrMWlXaDlVc252TmJiMjdVMHE5Z2pmaEZOcWI3?=
 =?utf-8?B?T04zNkdaRG1WQU1VNHprakFTMW1HN0VWT3VDeGo1U3NXMjJ3RzZtWE9Qa2Ux?=
 =?utf-8?B?ZldGYXVQSVpFOTBVajBncWN0aW1sRE43MU82S0E2SHViZnc5eHdQUzFnOUNT?=
 =?utf-8?B?K3UzQ1hQRnFSUUwwN2MvZ0FMZkR2aS8zM3h2MjQ5bVdSRlR1N2pNQUNoK2xW?=
 =?utf-8?B?Qk9qM2hJT1loUHA1T0puTS9ha1dvcjBUNDZjTlY4RUlrUGxocTdhWnlyN3V2?=
 =?utf-8?B?TEtSdlMwcG1aRTZhZVhIU0lVZGk5NGxtTmpOZVVaTTA1THRBOVpYcXlaRjBC?=
 =?utf-8?B?dWZCN3YvUkgxY2V3M3JUeklSeTFWV0lBTFNnakQyd2syd0pIK1VwSHIwMWsy?=
 =?utf-8?B?MmF6T1lhdVlZK0xxaVRFZ1BkaFlWaTJETGFjMHJTUngwdXVwSTcwR0UrTXhG?=
 =?utf-8?B?cG43Mytwa1RhYVlvb2hmck82UGdENGJJVHhXUmllTVZNZXhsTGs1UFhmMW0r?=
 =?utf-8?B?VUVxZ1FaNUJmSU5FWkFSTWUvL3NrRlgvdmozdjhjbmM4dEJiL0VDdncwWmh1?=
 =?utf-8?B?QTRPaGg0dkVPQXhRNnU1anpsZm5FOXZVakI0NGV5MGsvcFh2cTZOMkFOYXdW?=
 =?utf-8?B?NGM5Ym1FazdEbGNuL2VxcXVSRUY2US9RMlJhNTBTQVhNVVRjZ2hYRFJtS3dE?=
 =?utf-8?B?UWZNSlgrbW01ZVdRdXRXTm90UmFBSXVTZDhkcG9PYmZqcG1YcXVSREtNSXdT?=
 =?utf-8?B?UVJtRll2TmZONUh4TUd4YWpYbmtHZlpFci9rN202SDBIbVhZd1MwZjlaN1dX?=
 =?utf-8?B?Q2RvZ1JKWnFGV3d3MjJBUERYWjJINDloSGRBVFNLcVI2V0MwL2dZeHhtS3JZ?=
 =?utf-8?B?MlRYcDN0UHROTzRzcGpLdzZJTGlFT2pzZkZiUjcvazR4djJXNWVqbmR1eUh1?=
 =?utf-8?B?YURGdXlPVTZnVUwxM0xZM05CbXBlYmVNN1czWU8xOUQ0NnFZN0ZpczIzcFNs?=
 =?utf-8?B?dy9Pd2FkNERsSjJTYzF6cFpYUFhTeGtlNnk5c1BhTlA0bjJXcnZYdlF2UnNQ?=
 =?utf-8?B?d0hjM0xBbDIxVEJzTjB2aEwzSXBkRk5xeWVZenV2R1c1RTZxODNsdXhxVWxr?=
 =?utf-8?B?dVNvTk9mWUpqdURYM01iOU41SmJYQmxkaitYUEF3V09CWlZROGczTXVvU2t4?=
 =?utf-8?B?cGFOTGlPbVhNT1FWMENrNng3REo0MTVOS0U2VFl1YUdZQm5pVkFWQ1d0QnVB?=
 =?utf-8?B?K2tUNEJRcTR2TDZpalZLQTNlMUdDT0xkTmFobTlnQU5MVi8rZ2pFeEVia0ZT?=
 =?utf-8?B?SFNrejlTYy9aZVFXSThqZXhzVjJZMW9MeFJOS1RqM0RTSmh4c1kvQmFqQ0lM?=
 =?utf-8?B?bVgydENFd0RRVjBZYjZ2TjV4bWw2dzgyUEN4SW9URWpWRktoQ0h1dHJwTjJG?=
 =?utf-8?B?YnVab29NS2NpZE1WQnJHWi84VTBWbk5jd0tDQXh0S2VLZkdBcURjbWd5RHVt?=
 =?utf-8?B?YkRKTkFQQVF1SlVkMUFxYVpxVlZMNFhZbzJpRGRxMnh1U09OTHoxbjBHZ08w?=
 =?utf-8?B?VWU0RGx5VGl1MExyc0VhY3ZWUWV5VzRMclRkY2JBcVBaUVNCcVUwVEY0RzFw?=
 =?utf-8?B?bS81bEdyVnlCL1luL2MwMHhrU3ptUzFsRmMySk4vVWRPN1k5Ynk1N3BCMURZ?=
 =?utf-8?B?VXNEWUlYb0VPbkdzMTBKaWt6WDBxNDZNR3d2V0RmTmhsWkdhTFFWUmhSWWhh?=
 =?utf-8?B?NWNhK1RtY0NkcHVZeCs0c0NJajJhVStrN1cyQ0ltY2hWN05kVDVDRHFjak1r?=
 =?utf-8?B?dGE0YTZnQ1VZOTVPS0lMR3h4ZWdFci8yWERzV0FscWNORWJmZnh1QXIwdnBz?=
 =?utf-8?B?MFkvQm9zamk3M01Hd2hCbTRwcGcwV1N5TWhmbFJ1dmM2ZlJlUFZ2TkJtZWRj?=
 =?utf-8?B?cjZ1a1dtdUlCK0gzT2s3Q2x6UGZZVmJpWDYzWGM3cHZ0S1VSMTdDMk5BRXc0?=
 =?utf-8?B?S1ByeXFOQWlQdTFJMXArK0plK3JDYlFEWkt6ZW9IV2sxcmllYlVqenhkVW02?=
 =?utf-8?Q?QzN9/mro9/L0wika4I0a76xPt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d89f60-ef91-4c2e-a286-08dad82ecc06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:41:13.0522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEw0EaRHFwNeJCYfW54Cn7mKRzXuAjWiqM+aQnSzFVr1M86/xYLzlBWe6WfIdTj2cEdUVHwrefVBjwoB7YC1cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8485

On 07.12.2022 07:18, Vikram Garhwal wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1079,6 +1079,23 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;
> +    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
> +    uint8_t overlay_op; /* Add or remove. */
> +};
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1109,6 +1126,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1139,6 +1157,7 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +        struct xen_sysctl_dt_overlay        dt_overlay;

For now your additions are Arm-only, aren't they? You want to use
#ifdef-ary similar to what you see in context in this last hunk then,
to avoid undue exposure.

Jan

