Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328159C0F3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391427.629243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7o8-0006fZ-Az; Mon, 22 Aug 2022 13:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391427.629243; Mon, 22 Aug 2022 13:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7o8-0006cq-7u; Mon, 22 Aug 2022 13:49:36 +0000
Received: by outflank-mailman (input) for mailman id 391427;
 Mon, 22 Aug 2022 13:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ7o7-0006by-6l
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:49:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40e22ef3-2221-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 15:49:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4403.eurprd04.prod.outlook.com (2603:10a6:208:6d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 13:49:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:49:31 +0000
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
X-Inumbo-ID: 40e22ef3-2221-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG4CO83SuwTmL3hsfys94M534oo9AEby2v35jQvbo+4H+oclF8XS7cgTcz62XPOs4NqfmJXoy2l+HfgJcH7xSycHt1UkjWjv1AnuDZ7h0u1wZJ2RHdCg5+LUdB8YBJCOhfRV7rz/UlEOSb8gnBzNsysv0V7h4zdu9uNoq4p813B6G3V0VVem0h1Ci3Cb6mpYfGLKGgVjq8aJ7UI23g9qKO3rZnzIk8dv2Y47MIMV3+koGh6mHdNpv6V+6uU5mvQG815UwRgj20T/8okHRrKs12wZBJl9XZFbXDQ6XGqw5OOlGV/MkO5dTHIf7AUNnKd0dQbLCfuhE3WmX6XOBDgTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5eNkD3eRytqFewYiVxIqpy3hnGIj7U1aRp2WIxnnew=;
 b=HkHu+VbgniLSYka/lZJ1BWxaRnQLb9NGrDfxK2x5lwBjMmTtKQ2MV3GUYLqIjJwtAT4kH9uotCrMe9JH7A9GBzwdJxgzuZOU9ZlqnZ0gq3Ws/p0XOPqTX26n+K7cuqKzsj1qg/201D9o/r6Az+RldZ98qvhpaqADG4V3qHLhSp5MKtCBMDTYnqq8I6XTU9R/5tV/3oziNc3fO9mHJwbB82Q+wWZWq3+ztmbFtCnTknEjih4Sx5FwwvJdjh+eQUI4g2lpkz9j3KViU9QPOLEf6myF/e0HPB/xQ8h6IY7hH5tWnadDN3BRfAk6HyUkCKqohNVTO4tHQRnl4djIt0eJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5eNkD3eRytqFewYiVxIqpy3hnGIj7U1aRp2WIxnnew=;
 b=lzHetO5f8L7jA/qMmF9f7+SRJNyuUsNV1M1Vso2yErg12Z9cuiFz91JlGZEoshHFoZRQBGkDVTDLXXqZSkdgAmRmj/N4MYA5w7URHL7J80rhFnl0PDDn5q/Ht4Ojd+0zRdnojvhJueYv+ZxMVQ58xA0XbsptqEU7DPcVwSNEM6fpn5/TKvoW0DdHbwKm6Ng1U2RzJdSSXZd+i+dCRgS/RPk9jgo2QwkE2zpndziC3ie9oC9cxg1wZhYn8Wr5/llaRm5FaEbPIpouEtQ24ZlgtC6S3eHWMi0i92kzhwEV1AA1KkclVg/de1k/HNPZCW3nviFzEWH/IGcU1BcE8qmf9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
Date: Mon, 22 Aug 2022 15:49:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 528e6285-071e-4e1f-6e10-08da84452393
X-MS-TrafficTypeDiagnostic: AM0PR04MB4403:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ec4E2tpSzjjhfkL62rR4m8NFnfLdJI5NcFwzlicluouSUTmYQriqWoA+mtuMj9zqo190WFCE8WWVC6DuZlwiyEh9A6R2xk0ciaTpBUYoJR3ycGMU2RP82x1Bz0qi3pChXoQA/ikFxrPGqL7V+kablrd30uRWswzG4Ix8zxysf++vgtjgFkm9Ley6X2154Fj8lZhtbUkuk58dPBemQzNi7KTQeNjsppwtCfbvPTTi2dvUNBCrBgspWORxzMWdV4vv3a5WpPHp9PvmIDJD+Oue05L+SdLzszLmKII807vvsM1cV/g24AqI1l17ILX4VUKviORiQrxXCLRvkf8s0SEySY6hPyoK1r+CCAkhCJBI1m7RbNmpZtvvoTw0GJCT7twyXb2K2PVME99rTo9mB9BBvNSbw6A64cNtUtxaAjLBkj+A6e59wzN8LGDE613DzxGM9taJjo2fRpfj7Y3q394tqb/4FTsTzaGaxtmuwWo6nbPdD5QaiIJGntbqpA8cgpIEpeFnEWoDai/mWAQlKrx3mRTjpe3skw/3a0Uozhxxdjauhv8tqwdyqeP88NujN551EyqyXbLNmCrU8+YLku+0EwGSl/0/NZ68FiDWj4pmU3KKgEKvRLfMf/4WP6iYszGXgzsKU8WomL7hUI/O58E+SCivW0GFZviTH0chZsIymeaGQSiUVWYRh+5h9W8/hsUadQCDF4XrYZeD+E1wesa//zyEmJbmlER7Y68Ioa1jm6UyZJCLTmwWojkN33lVHy9oariuVefoGCyEy990ouDJF7ctaWD6iawzGECSFISehwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(346002)(396003)(39860400002)(86362001)(31696002)(38100700002)(8936002)(41300700001)(5660300002)(31686004)(54906003)(6916009)(6486002)(316002)(66946007)(66476007)(4326008)(8676002)(66556008)(83380400001)(186003)(2616005)(36756003)(478600001)(53546011)(6512007)(26005)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U210WUJNQW9PU2tVWGpwK0JBT0IrSUJqazMrVGk2cWJteXk0aGRwdVNtQ1kv?=
 =?utf-8?B?ZVpiVEEvcnBqWnl4eWF2TVpOVTdKS0tTQndFbmJjdUMxNFhUZHgzV0hRaHpl?=
 =?utf-8?B?RGxaNFVhcDMvTDJlOEVkQ3ZkeHF4K1hnTWxDbS9ranRnVEN5WVZrN0xFTjg3?=
 =?utf-8?B?L3VDUE5aLzF1WnNUaVRlTzlEb1dKRWZPeEtidm4rWWFadUxCblVwcW9IUVNC?=
 =?utf-8?B?T3JNeis4ckJ1S25wWVFNcjkwWDYwVWkvQlpvUmtERWErSUtxRUNXOE9PUTFB?=
 =?utf-8?B?RVcyckNNNW5yejREc0VCT0NkRTlmK0dqaHZMNksyQmdDOVh5dWg1REduL3I0?=
 =?utf-8?B?Tkt0amVja0V1QlltSHc5c1F1UEFBT3NVdDlYcWppVE03RnNyNUZKQmxnK3E4?=
 =?utf-8?B?M3o2ZUZDUlNUanlZaHVXTUdkbFc0UUxuYm9UUzdtd1pkeFVSMzVPVUFWVk9k?=
 =?utf-8?B?c0xnQUlJazJNbmJGMHdiaStvSkhmOFN4WFMxZlhvd2loVk56Q2tBZlMzait2?=
 =?utf-8?B?Y3E4TE9qdHpBNzJnSXNucUhaWHNFNUIwTm1SZWIxY0FvbXNCUXlDMStzL2Rs?=
 =?utf-8?B?a1hLZG1rMTI2VEg2NitvajA2a0xIU25DR0lsejFkR0hEUEhUNTBpVmRFbHlL?=
 =?utf-8?B?VVY2V0xYR0NUS0JqR3d6a0J0WktJV0VSUEhkdC9wSkFubE00YmhxblRCVW9o?=
 =?utf-8?B?REZyZ1VnYjg4T0cxME1aMndwMElWaXp0d1JBTWsxN2M0dnpOMTRpMjZxZERp?=
 =?utf-8?B?RWJoa2Z4SkJ1OTNOdFV2OThOWG9lbzNwenlvVllML0dvTGVPQ25COW0xajh3?=
 =?utf-8?B?N1A1cU95ZmRYOG1pSDZ0SXdFdXg4Z3dZQUJkWWc1Znh3bHhSU2R6WllaTFpx?=
 =?utf-8?B?OUNDN3p6NTlwWDVKRlkxNWpwMWlsbDFkaFBBZTJxNmpoc29mUFRwdEkvT3FS?=
 =?utf-8?B?ZVdMNVN0VWtyVWlKL3VVRjVxd3FZZ1M2bE1JNldXbVRyMlIwSVEyNFZvcFNq?=
 =?utf-8?B?Q3pNVUdNa1hzcnA4S25vMzNBNFBSVE9tOEE3ZzRoZGRVQmN0VUkrbHhSdmJF?=
 =?utf-8?B?Vmo0UFg3TE0rRDYvR2R0ZnhsSkVPamxPMG43MVhFNnR3RGRlNnRWM2QycDhQ?=
 =?utf-8?B?SEVIcElTanlrajVzM1d3NzNRek9TTTVGeG9SQ2pjSlR2VVBJVmZoY1ZPZmN5?=
 =?utf-8?B?Q0Y4ajROdTcrR25EMHNBZjl0VGMzWW1FSlRCaHU1YjlZYmNLUGFNS2sweDV0?=
 =?utf-8?B?YjFRbGxRdldhSTlVWWVGSWVURXZjd3FHWWs5Z3hReXZteS90RFA4V3JoMllL?=
 =?utf-8?B?Z0JVWkZaVldRZFNKeHlrSzBJVWpFZkJOZEh2VlRQeWY2c2p1MXRZb0lsMW9P?=
 =?utf-8?B?ODJuUThNZGhobGFBK1ptaTZ0U3NlSEdyWG8reWk5RDhscTV6cjYrUENyVXFB?=
 =?utf-8?B?VHV4V0N1RldOR3ljdkxLTkxJTVRNcC9JdHdReVBJUGJnQVRsMm1hRGlramhN?=
 =?utf-8?B?NG9RVHNzM2JweFBUYkMvZEFWZFh0djVzZVV3U21nMy9GZENyV1Uvd1JDbGxq?=
 =?utf-8?B?UDhoUysvYm8rZGhXYTY0VnJzQ3kvTHQ2clpoYllTV3NiTXVHT1RrS0RsS2Qz?=
 =?utf-8?B?TzZzSnkrS29wODNtNkpNczFhdUdFTzArMm5mMkhFcVVjR0l4VEF4YlcyTk8y?=
 =?utf-8?B?ekg5QjdGcWVadUpyTnczZG1hNTNuVDBJMWhWeDZGeHZTUHE5bkZIdW5reTdk?=
 =?utf-8?B?c05ELy8zemVaamtTVWpwQzUxQWl0ZG00Y3Z2OXdkNlZGdGl6WFJiUHc5Y3Rz?=
 =?utf-8?B?TmhtMEhQb0wvUVJhb24zRFhFV3ROWFF3ZkdLdXp5L29aTjJhSUpGaDFIVlpD?=
 =?utf-8?B?dFl4Wm15RXp4T2ZzUGpTRGU2cVBNNmNJd1NBVUUzakJOTjhsUlQweVdqNndp?=
 =?utf-8?B?bnRneUk5azJCZ0p1Nm5SNFhtNDRVZUszY1pYUVhDeUI5Z0VMaTFHeHMrV3BF?=
 =?utf-8?B?WTdOSEFvaEFvZnBvdE9kQ1phcm1ITDNHaVpEc01jeVpiRlpJOGtRS3VnM0ow?=
 =?utf-8?B?YjYzd292cG83cHRZWWZqUm8rYzRha3VLRXNncXFJOTBhUUpUWWxHTk42QUM5?=
 =?utf-8?Q?ueM7OHpAwuEtzEQb90Gky64Rb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528e6285-071e-4e1f-6e10-08da84452393
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:49:31.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8/7V90ZKiGZLvBg6bZTjvgC8XJzew9I56mJdHUk5vck3xRsni0gfsnOK3xT+gpXXTIFd1ZIBKlJZqanwSYseQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4403

On 19.08.2022 12:02, Rahul Singh wrote:
> Static event channel support will be added for dom0less domains.
> Restrict the maximum number of evtchn supported for domUs to avoid
> allocating a large amount of memory in Xen.

Please clarify here how you arrived at 4096 and why you expect no
dom0less DomU would ever want to have more. The limit, after all,
is far below that of FIFO event channels.

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>          struct xen_domctl_createdomain d_cfg = {
>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>              .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> -            .max_evtchn_port = -1,
> +            .max_evtchn_port = MAX_EVTCHNS_PORT,
>              .max_grant_frames = -1,
>              .max_maptrack_frames = -1,
>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>  /* Maximum number of event channels for any ABI. */
>  #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
>  
> +/* Maximum number of event channels supported for domUs. */
> +#define MAX_EVTCHNS_PORT 4096

I'm afraid the variable name doesn't express its purpose, and the
comment also claims wider applicability than is actually the case.
It's also not clear whether the constant really needs to live in
the already heavily overloaded xen/sched.h.

Jan

