Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D529076566B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571154.894324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2KZ-0002mf-7n; Thu, 27 Jul 2023 14:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571154.894324; Thu, 27 Jul 2023 14:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2KZ-0002ko-51; Thu, 27 Jul 2023 14:51:07 +0000
Received: by outflank-mailman (input) for mailman id 571154;
 Thu, 27 Jul 2023 14:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP2KX-0002kg-Ks
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:51:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe16::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008de444-2c8d-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 16:51:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:50:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:50:58 +0000
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
X-Inumbo-ID: 008de444-2c8d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ym8nT4bY6T2Z5dQii/h8MXC2Gns96u5G+oDaZmweXCEXi0DTdwucW/LWc/qhutRzO5/OoRLnHFFhcL1zBqzkcErnglHMrXySaGAN2NzA1dzQRGsF/IBpke6Af1SGm7ycIyjkcEiLincDN0Eh09Oov0ugv58eKCyOcarUS/5QQ0PVXq1sgSmuO102d4lKtcDVanLlJaLy5MGAvQZiT9OIAy/lYwRYzfu5JnCpYEz8+Wwf0G6R5WubO1JPPvKXYif3R8DILiDNuZZDL68ftOFeoxbQRHf/EvOQKt1Int9KdlWAy5cgGxJ2GnBvAxhe7h49Ur85Y6be+h3OJG0oavwlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai63f1VzzCVHjQDWUD/HzjE9IGoLvaWj1ZZrI+kBvFw=;
 b=VE5KMZTemE+TiEkGMiDM8aMse/7SAEj91xmL2pXFAJOPPNp6ee5jH7SdiS1Kmu45+PBi7da0m5We+vb4MMkAjFeCrWA3edzVoxEivOqXexa19E/aKy+UvOnrgYrmhdwLY9FpBWvL+BDdGMYVhcjRJ9uQg7kZWEyVQJy2rNbWxGr7qdOVBEhMorMtO8Ycox2AH2XcqsLLMjd7OF0VKhY63f2rLRpa62kjYGiQn+52fu68zm8dfQh6NuMJXnSIdFXJBG6w0987y+xV+iBPy7pbKcWb3yvwCe/XxFW5GExXfa/4GV9247qhuUEUICVgKsv8V9Rk/2JwmEkG1Ua3yZHbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai63f1VzzCVHjQDWUD/HzjE9IGoLvaWj1ZZrI+kBvFw=;
 b=IrzXhs2WuysGhFWQ4+m4LG44NUKa4WCluzU485/85dEaAAP+TP67j6zbErNqpqzoVU97+ahcoVHK4IxDd3wzNFYo3iamgSvfXJbwoML030oOPMe6annuEdQXucnq1SVGUIwAVtwAYcj1iGWRmZJN1pKdL9Vd4LTu+/oT/wCALcdb1/wYbxCpkXIFxfWTHeqGalxvJwo2x+oIDdpFPRyRJoNEndof5ksUtcwhs0jxngeorWK6tlrUjUXJUnEMkcjb28jOehmvVfgVLp4SDSYVIhHluKJnxPvnHXLh8Q2T5wlYud3PWjYB99Whmo5UeLByr2QIZuPwliFtDDxD/z9mPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <604b915b-e07e-8985-87f1-300568d0259f@suse.com>
Date: Thu, 27 Jul 2023 16:50:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 1/4] x86: mechanically rename to address MISRA C:2012
 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <614dd6fe03ab82db83eabc430b27435b19096791.1690449587.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <614dd6fe03ab82db83eabc430b27435b19096791.1690449587.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 25da8c15-fc30-45a6-5e61-08db8eb0e36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ae9xEZeBeisMSqV/spIm2LVb8+8m4rERwtL6eu9Kem8u7eL0/hiNW7+BjOiY1gE4PrEJykCBjDwt0smtz0Qrfyy9DQtkU2Md+pu8XJdIaUz8GlHK6DIwEtCse8lgnKUEiSEtCICpL85h6ZlKqI9ThmFzbE2iEsqEMBaT+nz8FHqwl7M4Z980uKvZlshaAxFbT4sY7iPmhrSNUi+yZ84QFe8C4ZuWqNpiDhsVTAGZm0aQacB3mblFwDfm+xZGKOfhdwhUoGCop2h61wymJaCGE+VN5NcPw0J4CXBFaMPL5oufV3BvOdSG8LqFlEWLTeRwdvjT1ZOuhRF7NCOuaB+b8pkaDm40jfci6GtLzS4sHg5gFr1ze+/Oc67ihIWuPrBrvVr/JXPCI1IFdihyr9FEds1j0xvV3Jpt8jvlP11xFtzUXHcoCwXwp7EENq8bOp+qWqHWwnM4CANyuzihXr059HDjk76KGhiNURGLf3fPUAFqRWzBEocAVMWQ8/YbEZYcd9E1EcwZCGTazAfe6WcJCf2OiyB71NRlIkQPeArtDW4DjRXgmusqHQKDx0RVlZzphzrH3TMl7yizeRKijfGbnam96qIxh/ouh2ccqbk9OUsXRaUKLAIrN9/lTphB/4U8M8LOIoyYGpgXRaLhf6Lzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(7416002)(41300700001)(316002)(54906003)(66476007)(66946007)(66556008)(6916009)(31686004)(5660300002)(8936002)(4326008)(8676002)(2906002)(86362001)(6486002)(36756003)(6512007)(478600001)(53546011)(31696002)(6506007)(26005)(186003)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnBEcnJKMzRaVVJJd0c0b0xMZ1FYMkd2N1NaSkZEUnZvKytvTVhvUEQ3dnRx?=
 =?utf-8?B?cnp1bG1jbnBkMW1kNjVyM0NVNDBFb1NSc05WTWFHZ3ZWcU1JVVFhY2JTMDI4?=
 =?utf-8?B?YVdIenhmZWxoa28vWjUxUnN2VXY3UmVSNDZTM0xrUXVXbS9GK3BQTlQrb2x1?=
 =?utf-8?B?dnE5YlBHbGVCMExUdi9pMFhNZEw5K3Rpejh6NjlaZTQ0K0xJVk1ieUJPUFcz?=
 =?utf-8?B?UEtKS01qRllqTnNoOFc2RlY0bDkvT3JOaXRPSTNpR0ZGZ3JFaVgxUEZTRkI4?=
 =?utf-8?B?emJ4TnN4VVZQSWpKSzBKcCsxdkZaeU1pWWRIZEtzNTkzeDl6dWRTb1cvc0lS?=
 =?utf-8?B?dUJ2eFF4YlRTakFsdVlHb1ZDYWt3QWxnM1JaczZoTmtDdGNBQ3Qrb2t5Rkl0?=
 =?utf-8?B?a0k0eE1peVlkNmRtK0JvV0RWNkxrbHVJSjR6QlBSRTB1TzBtT1VRV3V6L1pN?=
 =?utf-8?B?WlRVNnFOOVI5eWtuSmg1TzdYckJHbHVacFVkNjVQODFFNWd6MmMvRlVGZzZ3?=
 =?utf-8?B?TUFCQU1jQ29KSUhsY20vRS9tamdQN2FRbjFjQUtwSkJJcG5Wb2lLdlpiNWhr?=
 =?utf-8?B?cDFyWnBIVUorNEhXeVNBbG5DZUFoVTFFTHlZRGp3ZHZNQUJ1RjVWWTBqenZH?=
 =?utf-8?B?NzFqa2tidzJsSmNyTDN0cWtDSXZ2MkhPZGkwbUFiVTJUUDhYTmlTbDBTZlc1?=
 =?utf-8?B?em41YlJPMnl1YWxra2F0Q3hEZ3BQL1VYL0ZpNDJ3cmtjcFF3RmRhMk5xN0Jm?=
 =?utf-8?B?RTNiK3hMZzFEVFU1MTBOczlQb2RTU1BBOU5GN3pRaDhiWXUyb2FpOUlYQVl1?=
 =?utf-8?B?cjNUSUZJb3dzRGhSYXhBOWpQZ05pL1BvZnpoWW1Jdnl5aUdJdlFneDZTRmN0?=
 =?utf-8?B?ZVV4NmNJMmU5THB3WnlsUktEV1BTWDdQaERTS21sRHZqYXF0V0hOUnpPMmVt?=
 =?utf-8?B?bTM1ay9sQmNlZmFLcHA4VlV1YTJCeTdOOEtJOWVuRzliMGc4d0dpYncyd3VI?=
 =?utf-8?B?RW9wR2JGUXVpRGpMRTFRdElIcm40NXUrZnRwU093QUlsbXlJcWtsTlNkSm9M?=
 =?utf-8?B?VVp3UGIvUzUwM1RIQzROSkx5Z3ovcDRlU2dxbm5KV0JmWlhnV09VZEVHYjlX?=
 =?utf-8?B?TE9vTTMvMmlFMTUvekZMTmpjSVVROWhLdEowelpNcmgvT0pnbFVBQVB5aFN1?=
 =?utf-8?B?L2RObmtPZHB3eXBDNU5sMFhjdDBmN3pTOWl3UUhFMXgxNm9ZU1R2aFp1M2pj?=
 =?utf-8?B?YjBnajB3N01GbHdPTkhKN3VtVkFIb3Fta2h4M2hXU0hFeGNIQ2ZzL1FQQktq?=
 =?utf-8?B?RDVidk1ST1BPMUpLNDhIWUF6blM0Vk9lRkpVeW9OaHNRR2YrMUZHUy83Z3M2?=
 =?utf-8?B?d0lKT0kyemNIbXpIQWhRMHBYYURLYUx1bmxGSHM5bGN6dFBRMU9Jb04rNUpk?=
 =?utf-8?B?ZW9UNjJNQ2NXcDdzSWt0cEV4OStTcTFuQzhOTCtSS0JYbUFIMGZ0bWNuanpL?=
 =?utf-8?B?dHpXMFQyc0F2MmNNdzd5V0tONC9IeERWOUNsdEZFZmFobWMzYjhIQXZTQ3ZI?=
 =?utf-8?B?ajR2N2o1bXEwck8wdUptd2tkYWFRa2pLUm8ybHMwMDRXNGllWG1iUmM3MjJT?=
 =?utf-8?B?YmQxMnNvU0U3ZldzMUM3Ti8xdXN3dHJ0TTZhSkdJeVF0bmp6YVVkenRnNHB0?=
 =?utf-8?B?cWFVVEJ6N0xwOEFxQU1zQ2RjQWNZbGFQcmVtQS9tZS9KaDcyMjJtMXhENWRH?=
 =?utf-8?B?THc3WDFBSjJuUnJnSncwRUV6VzdOT3E4TWFPNkpxWW1LZnVCQ2pkaHVzNy9W?=
 =?utf-8?B?Y0tCRzJFM0p4Z1NXYWU4WG1NQlpTaldhNXN5VXF0TkljZTJZem5xZUFCcUdw?=
 =?utf-8?B?WlZ5dlI4RFNUR2tyVTZ3UTAvYU85b0JFUVpvL1VBSElGZmlFOENlSVRjUDQy?=
 =?utf-8?B?cTMweDRjUDhJL3l5cm9lQWpIZDNMSXBrUDdkdlA3c2l0MmdRMFpBQUVGd1JV?=
 =?utf-8?B?dkE4TE55RENNWUlPQ0pZd1hzYy9HcXcwcUhXSmJRMjBVY2hlYnNZZVJFckNa?=
 =?utf-8?B?bVN3UkxqNzdDOFRHR0dOZkhQSWtFaTltTnFSM00zZm0vRUlaWDR6YlhSUG9t?=
 =?utf-8?Q?BTgk6XxuUc8MpC/NdMq2PWjwf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25da8c15-fc30-45a6-5e61-08db8eb0e36e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:50:58.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrtBwX155Xs+sV7wq9FACQ0QB/VW4NYhmNnW60xdiFQhujfMF72xEVzQfJIk56tgT9WPz3RWUZxHwc/RwbF4hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

On 27.07.2023 12:47, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The renames done by this patch avoid shadowing from happening.
> They are as follows:
> - s/str/s/ in 'lapic_disable'
> - s/str/level/ in '(apic|mce)_set_verbosity'
> - s/str/state_str/ in 'mwait_idle_probe'
> - s/str/memmap_name/ in 'init_e820'

I'm sorry to say that, but I'm not willing to go and figure out where
that "str" is that there's supposedly a collision with. Please can you
state such right here, ...

> - s/i/j/ in 'mce_action' (the shadowing here is due to macro
>   'x86_mcinfo_lookup' that defines 'i' as a loop counter)

... much like you do in this case?

> - s/desc/descriptor/ in '_hvm_load_entry'
> - s/socket_info/sock_info/ in 'do_write_psr_msrs'

(I didn't look at any of these in any detail, partly because again
I hope for additional context before doing so.)

> - s/debug_stack_lines/dbg_stack_lines/ in 'compat_show_guest_stack'

This wants doing differently: The two functions originally lived in
different source files, so passing the static variable as argument
was preferred over making the variable non-static. When the function
was moved, that aspect was overlooked. The function argument simply
wants dropping.

Jan

